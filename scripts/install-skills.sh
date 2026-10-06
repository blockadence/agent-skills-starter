#!/usr/bin/env bash
# Install this repository's skills into the local agent setup.
#
# Local installation means one symlink per skill in each of:
#   ~/.agents/skills/<name>   (skill store shared across agent tools)
#   ~/.claude/skills/<name>   (what Claude Code reads)
#
# Skills installed from elsewhere live in ~/.agents/skills as real directories
# and are tracked in ~/.agents/.skill-lock.json. When a repo skill has the same
# name as one of those, the installed copy is moved to a backup directory and
# its lock entry is dropped, so this repo becomes the single source for that
# name and the upstream installer does not reinstall on top of the symlink.

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
AGENTS_SKILLS="$HOME/.agents/skills"
CLAUDE_SKILLS="$HOME/.claude/skills"
LOCK="$HOME/.agents/.skill-lock.json"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_ROOT="$HOME/.agents/skills-backup/$STAMP"

BUCKETS="engineering productivity misc"
DRY_RUN=0
PRUNE_LOCK=1
ONLY=""

usage() {
  cat <<'USAGE'
Usage: scripts/install-skills.sh [options]

Options:
  --buckets a,b     Buckets to install (default: engineering,productivity,misc)
  --all-buckets     Include in-progress and deprecated
  --only a,b        Install only these skill names
  --dry-run         Report what would change, change nothing
  --no-lock-prune   Leave ~/.agents/.skill-lock.json untouched
  -h, --help        Show this help
USAGE
}

while [ $# -gt 0 ]; do
  case "$1" in
    --buckets) BUCKETS="$(echo "$2" | tr ',' ' ')"; shift 2 ;;
    --all-buckets) BUCKETS="engineering productivity misc in-progress deprecated"; shift ;;
    --only) ONLY="$(echo "$2" | tr ',' ' ')"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    --no-lock-prune) PRUNE_LOCK=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
done

TILDE='~'

# Shorten a path for display. A bare ~ in a replacement word gets tilde
# expanded, so the tilde comes from a variable.
short() {
  local path="$1"
  echo "${path/#$HOME/$TILDE}"
}

run() {
  if [ "$DRY_RUN" -eq 1 ]; then
    return 0
  fi
  "$@"
}

DISPLACED=""

backup_path() {
  # $1 = path being displaced, $2 = label for which store it came from
  echo "$BACKUP_ROOT/$2/$(basename "$1")"
}

quarantine() {
  local path="$1" label="$2" dest
  dest="$(backup_path "$path" "$label")"
  run mkdir -p "$(dirname "$dest")"
  run mv "$path" "$dest"
  echo "    backed up to $(short "$dest")"
}

# Resolve a symlinked directory to its real path, empty if the target is gone.
link_target() {
  local path="$1"
  if [ -d "$path" ]; then
    (cd -P "$path" && pwd -P)
  else
    echo ""
  fi
}

install_one() {
  local skill_dir="$1" name="$2" base="$3" label="$4"
  local dest="$base/$name"

  if [ -L "$dest" ]; then
    local raw current
    raw="$(readlink "$dest")"
    current="$(link_target "$dest")"
    if [ "$raw" = "$skill_dir" ]; then
      echo "    $label: already linked"
      return 0
    fi
    if [ -z "$current" ]; then
      echo "    $label: replacing broken link"
    elif [ "$current" = "$skill_dir" ]; then
      echo "    $label: pointing directly at the repo (was $raw)"
    else
      echo "    $label: relinking from $(short "$current")"
    fi
    run rm "$dest"
  elif [ -e "$dest" ]; then
    echo "    $label: replacing installed skill"
    quarantine "$dest" "$label"
    DISPLACED="$DISPLACED $name"
  else
    echo "    $label: linking"
  fi

  # A packaged <name>.skill archive next to the directory shadows the same name.
  if [ -e "$base/$name.skill" ]; then
    echo "    $label: displacing $name.skill archive"
    quarantine "$base/$name.skill" "$label"
  fi

  run ln -s "$skill_dir" "$dest"
}

wanted() {
  local name="$1" candidate
  [ -z "$ONLY" ] && return 0
  for candidate in $ONLY; do
    [ "$candidate" = "$name" ] && return 0
  done
  return 1
}

echo "repo:    $ROOT"
echo "buckets: $BUCKETS"
[ -n "$ONLY" ] && echo "only:    $ONLY"
[ "$DRY_RUN" -eq 1 ] && echo "mode:    dry run"
echo

run mkdir -p "$AGENTS_SKILLS" "$CLAUDE_SKILLS"

INSTALLED_COUNT=0
for bucket in $BUCKETS; do
  bucket_dir="$ROOT/skills/$bucket"
  [ -d "$bucket_dir" ] || continue
  for skill_dir in "$bucket_dir"/*; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    name="$(basename "$skill_dir")"
    wanted "$name" || continue
    echo "  $name ($bucket)"
    install_one "$skill_dir" "$name" "$AGENTS_SKILLS" "agents"
    install_one "$skill_dir" "$name" "$CLAUDE_SKILLS" "claude"
    INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  done
done

if [ "$INSTALLED_COUNT" -eq 0 ]; then
  echo "  no matching skills found"
fi

# Drop links this repo left behind for skills that no longer exist.
echo
echo "pruning stale links into this repo"
PRUNED=0
for base in "$AGENTS_SKILLS" "$CLAUDE_SKILLS"; do
  for dest in "$base"/*; do
    [ -L "$dest" ] || continue
    target="$(readlink "$dest")"
    case "$target" in
      "$ROOT"/*) ;;
      *) continue ;;
    esac
    [ -e "$dest" ] && continue
    echo "  removing $(short "$dest") (target gone: $target)"
    run rm "$dest"
    PRUNED=$((PRUNED + 1))
  done
done
[ "$PRUNED" -eq 0 ] && echo "  nothing to prune"

# Keep the upstream installer from reinstalling over a name this repo now owns.
if [ -n "$DISPLACED" ] && [ "$PRUNE_LOCK" -eq 1 ] && [ -f "$LOCK" ]; then
  echo
  echo "updating $(short "$LOCK")"
  if [ "$DRY_RUN" -eq 1 ]; then
    for name in $DISPLACED; do echo "  would drop lock entry: $name"; done
  else
    cp "$LOCK" "$LOCK.bak-$STAMP"
    python3 - "$LOCK" $DISPLACED <<'PY'
import json, sys

lock_path, names = sys.argv[1], sys.argv[2:]
with open(lock_path) as handle:
    lock = json.load(handle)

skills = lock.get("skills", {})
for name in names:
    if skills.pop(name, None) is not None:
        print(f"  dropped lock entry: {name}")

with open(lock_path, "w") as handle:
    json.dump(lock, handle, indent=2)
    handle.write("\n")
PY
    echo "  backup: $(short "$LOCK").bak-$STAMP"
  fi
fi

echo
echo "done: $INSTALLED_COUNT skill(s) processed"

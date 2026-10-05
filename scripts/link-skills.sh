#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$HOME/.claude/skills" "$HOME/.agents/skills"

find "$ROOT/skills" -mindepth 2 -maxdepth 2 -type d | while read -r skill_dir; do
  if [[ -f "$skill_dir/SKILL.md" ]]; then
    name="$(basename "$skill_dir")"
    ln -sfn "$skill_dir" "$HOME/.claude/skills/$name"
    ln -sfn "$skill_dir" "$HOME/.agents/skills/$name"
    echo "linked $name"
  fi
done

# Agent Skills

A starter repository for small, composable agent skills. The layout is inspired by Matt Pocock's `skills` repository, but this repo is intentionally minimal so it can evolve around your own workflows.

## Principles

- Keep skills small and composable.
- Let producing skills own substance and artifact structure.
- Let modifier skills own cross-cutting concerns such as voice, tone, review discipline, or presentation.
- Let audit skills verify contracts and route defects without silently becoming authors.
- Prefer predictable process over giant prompts.
- Keep detailed reference material out of `SKILL.md` when it does not need to be loaded every time.
- Fix defects at the earliest skill stage that owns them.

## Repository layout

```text
skills/
  engineering/          # code and engineering workflow skills
  productivity/         # writing, communication, planning, and other workflow skills
  misc/                 # useful but rarely promoted
  in-progress/          # experiments
  deprecated/           # retired skills kept for reference

docs/                   # human-facing notes for promoted skills
.agents/                 # ADRs and repository-level skill design notes
.claude-plugin/          # optional Claude Code plugin manifest
scripts/                 # local helper scripts
```

## Engineering documentation suite

The engineering bucket includes a composable documentation and review-communication pipeline. The shared center is:

```text
source-model -> explanatory-model -> optional reviewer-adapt
```

Artifact-specific planners then produce design-document, presentation, or PR-review communication plans. Shared fidelity, comprehension, intent-leak, and rendered-visual audits act as gates.

Preparation and approval companions:

- `to-charting-brief`: source-grounded Wayfinder chartering for implementable specs.
- `to-design-briefing`: interactive understanding, defense, and reconsideration of a design.

Primary orchestrators:

- `to-design-package`: rigorous engineering specification to design document plus BBB-style presentation package.
- `to-pr-comments`: verified deep code-review findings to reviewer preamble plus comprehensible inline comments.

These supersede the repository's earlier `to-design-doc` and `to-pr-comments` implementations. Useful rules from those implementations belong in the composable stages that own them rather than in compatibility wrappers.

See `skills/engineering/README.md`, `docs/engineering/skill-composition.md`, and `docs/engineering/production-readiness.md`.

## Seed skill: `in-my-voice`

`in-my-voice` is a modifier skill. It shapes another skill's output without changing that skill's substance or output contract.

Typical use:

```text
Use to-design-package on spec.md and apply in-my-voice.
```

For Claude Code, the most deterministic pattern is to explicitly invoke the producing skill and mention the modifier in the same instruction.

There is no assumption in this starter repo that two independent slash commands form an atomic pipeline. If a producer needs to call a modifier internally, keep the modifier model-reachable and describe that composition in the producer skill.

## Adding a skill

Create a folder under the appropriate bucket:

```text
skills/<bucket>/<skill-name>/SKILL.md
```

Use frontmatter with `name` and a short, trigger-oriented `description`.

Add a human-facing `README.md` for promoted skills. Add linked reference files when the skill needs stable detail without bloating its main instructions.

## Local installation

`scripts/install-skills.sh` installs this repository's skills into the local setup. One symlink per skill goes into each of:

```text
~/.agents/skills/<name>   # skill store shared across agent tools
~/.claude/skills/<name>   # what Claude Code reads
```

```bash
./scripts/install-skills.sh            # engineering, productivity, misc
./scripts/install-skills.sh --dry-run  # report changes without making them
```

Options:

- `--buckets a,b`: install only these buckets.
- `--all-buckets`: include `in-progress` and `deprecated`.
- `--only a,b`: install only these skill names.
- `--dry-run`: report what would change and change nothing.
- `--no-lock-prune`: leave `~/.agents/.skill-lock.json` untouched.

### Name conflicts

Skills installed from elsewhere live in `~/.agents/skills` as real directories and are tracked in `~/.agents/.skill-lock.json`. When a skill in this repository has the same name as one of those, the installer:

1. moves the installed copy to `~/.agents/skills-backup/<timestamp>/`,
2. links the name to this repository instead,
3. drops the name from `.skill-lock.json` (backed up alongside it) so the upstream installer does not reinstall over the symlink.

A packaged `<name>.skill` archive that would shadow the same name is backed up the same way.

The installer is idempotent, so re-run it after adding or renaming skills. It also removes links into this repository whose target no longer exists, which is how a renamed or deleted skill gets cleaned up.

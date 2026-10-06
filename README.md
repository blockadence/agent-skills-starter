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

## Local linking

`scripts/link-skills.sh` symlinks this repo's skills into `~/.claude/skills` and `~/.agents/skills`.

```bash
./scripts/link-skills.sh
```

Re-run it after adding or renaming skills.

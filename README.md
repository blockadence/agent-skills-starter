# My Agent Skills

A starter repository for small, composable agent skills. The layout is inspired by Matt Pocock's `skills` repository, but this repo is intentionally minimal so it can evolve around your own workflows.

## Principles

- Keep skills small and composable.
- Let producing skills own substance and artifact structure.
- Let modifier skills own cross-cutting concerns such as voice, tone, review discipline, or presentation.
- Prefer predictable process over giant prompts.
- Keep detailed reference material out of `SKILL.md` when it does not need to be loaded every time.

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

## Seed skill: `in-my-voice`

`in-my-voice` is a modifier skill. It should shape the expression of another skill's output without changing that skill's substance or output contract.

Typical use:

```text
Use to-design-doc on proposal.md and apply in-my-voice.
```

With an override:

```text
Use to-design-doc on proposal.md and apply in-my-voice with register=professional-formal.
Audience: senior engineers familiar with this subsystem.
```

For Claude Code, the most deterministic pattern is to explicitly invoke the producing skill and mention the modifier in the same instruction, for example:

```text
/to-design-doc proposal.md. Apply in-my-voice with register=professional-formal.
```

There is no assumption in this starter repo that two independent slash commands form an atomic pipeline. If a producer needs to call `in-my-voice` internally, keep `in-my-voice` model-reachable and describe that composition in the producer skill.

## Adding a skill

Create a folder under the appropriate bucket:

```text
skills/<bucket>/<skill-name>/SKILL.md
```

Use frontmatter like:

```yaml
---
name: my-skill
description: "Short, trigger-oriented description."
---
```

Add linked reference files when the skill needs stable detail without bloating its main instructions.

## Local linking

`scripts/link-skills.sh` symlinks this repo's skills into `~/.claude/skills` and `~/.agents/skills`.

```bash
./scripts/link-skills.sh
```

Re-run it after adding or renaming skills.

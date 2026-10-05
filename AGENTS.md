# Agent Instructions

Read `CLAUDE.md` for repository conventions.

When authoring or editing a skill:

1. Keep the skill focused on one capability or cross-cutting concern.
2. State what it owns and what it must preserve when composed with other skills.
3. Prefer defaults inferred from context over a large parameter surface.
4. Add parameters only when they represent real contextual differences, not stylistic knobs.
5. Put large stable guidance in `references/` and link to it from `SKILL.md`.

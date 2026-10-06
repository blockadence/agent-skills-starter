---
name: source-model
description: "Normalize rigorous engineering source material into a fidelity-first semantic model. Use before human-facing design documentation, presentations, or PR communication when facts, decisions, constraints, assumptions, unknowns, contradictions, and source support must be preserved."
---

# source-model

## Composition contract

This skill follows the repository composition rules.

- Explicit user instructions have highest precedence.
- Preserve source truth, uncertainty, terminology, and decision status.
- Do not invent implementation detail to make an artifact look complete.
- Reviewer adaptation may change emphasis, order, evidence density, and code-nearness, never facts.
- Keep reviewer classification, persuasion strategy, generation mechanics, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.

## Owns

Source completeness, terminology, decision status, uncertainty, contradictions, and technical source support.

## Process

1. Read the complete supplied source before modeling it.
2. Record source identity and scope.
3. Extract terminology as the source uses it.
4. Separate existing behavior, decisions, constraints, invariants, assumptions, unknowns, limitations, out-of-scope items, and contradictions.
5. Classify support for technical specificity as concrete, conceptual, or unsupported.
6. Write `source-model.md`.

## Output

`source-model.md` contains source identity and scope, terminology, existing behavior, decisions, constraints, invariants, assumptions, unknowns, limitations, out of scope, unresolved conflicts, and the source-support map.

## Must preserve

The source's distinctions between fact, decision, assumption, unknown, limitation, and proposal.

## Do not

Do not audience-optimize, create the narrative, invent implementation detail, or silently reconcile conflicts.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

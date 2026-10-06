---
name: design-doc-plan
description: "Plan the information architecture of an engineering design document from an explanatory model. Use before composing a design doc so it establishes a mental model, progressively discloses concepts, and covers change surface, compatibility, risks, evidence, and implementation path."
---

# design-doc-plan

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

Document information architecture and reasoning order.

## Process

1. Read the explanatory model and optional reviewer adaptation.
2. Plan the opening mental model.
3. Group intended outcomes under neutral engineering constructs such as Design Objectives when useful.
4. Sequence concepts according to dependencies.
5. Place before/after, unchanged/modified/new, compatibility, blast radius, migration, risks, unknowns/evidence, and implementation path where applicable.
6. State the reader question answered by every planned section.
7. Write `design-doc-plan.md`.

## Must preserve

The explanatory model's causal structure and uncertainty.

## Do not

Do not expose rhetorical strategy in headings, mirror the source mechanically, or pad unsupported sections with generic prose.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

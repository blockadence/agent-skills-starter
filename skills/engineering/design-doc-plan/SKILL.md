---
name: design-doc-plan
description: "Plan the information architecture of an engineering design document from an explanatory model. Use before composing a design doc so it establishes a mental model, progressively discloses concepts, chooses scan-friendly representations, and covers change surface, compatibility, risks, evidence, and implementation path."
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

Document information architecture, reasoning order, progressive disclosure, and representation intent at the section level.

## Process

1. Read the explanatory model and optional reviewer adaptation.
2. Plan the opening mental model.
3. Group intended outcomes under neutral engineering constructs such as Design Objectives when useful.
4. Sequence concepts according to dependencies and preserve mechanism before consequence.
5. Place before/after, unchanged/modified/new, compatibility, blast radius, migration, risks, unknowns/evidence, and implementation path where applicable.
6. State the reader question answered by every planned section.
7. For each section, decide which information should remain prose and which should become a structured representation.
8. Write `design-doc-plan.md`.

## Representation rule

A design document is not a prose transcription of its source.

Prefer a table, diagram, matrix, contract block, before/after view, structured list, or source-supported code/schema excerpt when it materially reduces the reader's reconstruction work.

Structured representation is especially appropriate for:

- inventories and classifications;
- before/after or unchanged/modified/new comparisons;
- compatibility and blast-radius surfaces;
- alternatives and tradeoffs;
- contracts, invariants, interfaces, and failure behavior;
- ordered mechanisms and sequences;
- risks, mitigations, unknowns, and validation plans;
- repeated dimensions across several components.

Keep prose for causal reasoning, rationale, nuance, uncertainty, and transitions that would be distorted by tabular compression.

Do not optimize for shortness alone. Optimize for information density, scanability, and comprehension.

## Must preserve

The explanatory model's causal structure and uncertainty.

## Do not

Do not expose rhetorical strategy in headings, mirror the source mechanically, pad unsupported sections with generic prose, turn the document into a slide deck, or force structured representations where prose communicates the reasoning more accurately.

## Completion gate

Before returning, inspect long uninterrupted prose plans and ask whether a supported structured representation would reduce interpretation without losing reasoning. Report unresolved defects with the earliest owning stage.

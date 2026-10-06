---
name: design-evidence-plan
description: "Select engineering evidence and visuals for a design document. Use when deciding whether a question needs before/after, C4, UML, ER, sequence/state/activity/deployment diagrams, tables, API/schema/code/SQL excerpts, or no visual."
---

# design-evidence-plan

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

Evidence selection, canonical notation, source-support classification, renderer choice, layout intent, and captions.

## Process

1. Read source model, explanatory model, document plan, and optional reviewer adaptation.
2. For each candidate artifact, state the engineering question it answers.
3. Classify it as explanatory or technical.
4. For technical artifacts, choose canonical notation when available.
5. Classify support as concrete, conceptual, or unsupported.
6. Choose renderer separately from notation and state layout intent.
7. Specify meaningful labels and the conclusion the caption should communicate.
8. Omit unsupported artifacts.
9. Write `design-evidence-plan.md`.

## Must preserve

Source-support boundaries. Conceptual evidence must remain visibly conceptual.

## Do not

Do not invent proprietary notation when an established notation fits. Do not fabricate Java, SQL, schemas, APIs, package names, or class names. Mermaid is a renderer/syntax, not a notation.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

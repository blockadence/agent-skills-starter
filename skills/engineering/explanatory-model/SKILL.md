---
name: explanatory-model
description: "Build the human-understanding model behind an engineering artifact. Use after source-model and before design docs, BBB presentations, or PR-review communication, especially when concepts have dependencies or readers could otherwise need to infer causal steps."
---

# explanatory-model

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

Causal explanation, concept dependencies, design objectives and invariants, change surface, unknown disposition, and the cold-reader mental model.

## Process

1. Read `source-model.md`.
2. State the topic in one sentence.
3. Build problem -> consequence -> design-response chains.
4. Order concepts by dependency: what must be understood before what.
5. Identify design objectives and invariants.
6. Describe meaningful change surface as unchanged, modified, and new.
7. Record compatibility implications, risks, mitigations, unknown dispositions, evidence plans, and the supported implementation path.
8. Flag any explanation that would require an unsupported assumption.
9. Write `explanatory-model.md`.

## Output

A semantic model containing topic, cold-reader mental model, causal chains, concept dependency order, objectives/invariants, change surface, compatibility implications, risks/mitigations, unknowns, evidence plan, and supported implementation path.

## Must preserve

All source truth and uncertainty from `source-model.md`.

## Do not

Do not write final reader-facing prose, choose renderers, expose reviewer strategy, or replace precise source meaning with a lossy simplification.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

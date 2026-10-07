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

Causal explanation, concept dependencies, design objectives and invariants, change surface, unknown disposition, evidence needs, and the cold-reader mental model.

## Process

1. Read `source-model.md`.
2. State the topic in one sentence.
3. Establish how the important systems, actors, boundaries, and artifacts fit together before relying on their consequences.
4. Build problem -> mechanism -> consequence -> design-response chains.
5. Apply **mechanism before consequence**: for every non-self-evident claim, explain the causal connection before asking the reader to accept what follows from it.
6. Order concepts by dependency: what must be understood before what.
7. Identify design objectives and invariants.
8. Describe meaningful change surface as unchanged, modified, and new.
9. Record compatibility implications, risks, mitigations, unknown dispositions, evidence plans, and the supported implementation path.
10. Give each fact or explanation one primary home. Refer back rather than fully re-explaining the same fact in multiple conceptual sections.
11. Flag any explanation that requires an unsupported assumption or leaves a causal step for the reader to infer.
12. Write `explanatory-model.md`.

## Comprehension tests

- **Predictive test:** after reading a mechanism, could a competent cold reader derive the stated consequence?
- **Second-read test:** if a passage or causal chain requires rereading because a connection is missing, the model is incomplete. Add the missing connection rather than surrounding it with more prose.
- **One-home test:** repeated full explanations of the same fact are a modeling defect unless the contexts genuinely require different reasoning.

## Output

A semantic model containing topic, cold-reader mental model, causal chains, concept dependency order, objectives/invariants, change surface, compatibility implications, risks/mitigations, unknowns, evidence plan, and supported implementation path.

## Must preserve

All source truth and uncertainty from `source-model.md`.

## Do not

Do not write final reader-facing prose, choose renderers, expose reviewer strategy, replace precise source meaning with a lossy simplification, or make the reader infer a load-bearing connection that can be stated.

## Completion gate

Before returning, run the predictive, second-read, and one-home tests on the load-bearing reasoning. Report unresolved defects with the earliest owning stage.

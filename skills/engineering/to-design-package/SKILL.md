---
name: to-design-package
description: "Orchestrate a production engineering design package from a Wayfinder spec or similarly rigorous engineering specification. Use when the user wants a design document and/or BBB-style technical presentation generated through fidelity, explanatory-model, reviewer-adaptation, evidence-planning, and audit stages."
---

# to-design-package

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

Workflow orchestration, sibling-output consistency, defect routing, and stopping conditions. Leaf skills own their individual transformations.

## Pipeline

1. Require and read the complete spec.
2. Run `source-model`.
3. Run `explanatory-model`.
4. Apply optional `reviewer-adapt`.
5. Fork from the explanatory model:
   - design doc: `design-doc-plan` -> `design-evidence-plan` -> compose;
   - presentation: `bbb-story-plan` -> evidence/visual planning as needed -> compose slides plus speaker notes.
6. Run `source-fidelity-audit`, `comprehension-audit`, and `intent-leak-audit`.
7. Run `visual-render-audit` for rendered visuals.
8. Route blocking defects to the earliest owning stage and regenerate affected downstream artifacts.
9. Preserve inspectable intermediate artifacts during development.
10. Stop only when blocking gates pass or an unresolved source problem is explicitly reported.

## Output

As requested: engineering design document, BBB deck, per-slide speaker notes/rehearsal script, intermediate semantic/planning artifacts, and audit reports. Sibling outputs must agree on technical truth.

## Do not

Do not collapse the pipeline into one giant prompt. Do not use the design doc as the source for the slide deck. Do not patch only final rendering when an upstream stage owns the defect.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

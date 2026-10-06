---
name: design-doc-plan
description: "Plan a decision-sufficient engineering design document from an explanatory model or reviewer adaptation. Use before composing a design doc so it selects only decision-relevant content, establishes a mental model, progressively discloses concepts, chooses scan-friendly representations, and covers material change surface, compatibility, risks, evidence, and approval-relevant implementation consequences."
---

# design-doc-plan

## Composition contract

This skill follows the repository composition rules.

- Explicit user instructions have highest precedence.
- Preserve source truth, uncertainty, terminology, and decision status.
- Do not invent implementation detail to make an artifact look complete.
- Reviewer adaptation may change emphasis, order, evidence density, code-nearness, and reader-facing inclusion, never facts.
- Keep reviewer classification, persuasion strategy, generation mechanics, source-process bookkeeping, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Fidelity preserves truth, not volume. Downstream reader artifacts may omit source-supported information that is not needed for their review or decision task.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.

## Owns

Artifact-specific relevance selection, information architecture, reasoning order, progressive disclosure, compression budget, and representation intent at the section level.

## Decision-sufficiency contract

The design document is an approval/review artifact, not an exhaustive replay of the source or explanatory model.

Include the minimum information necessary for the intended reviewer to:

1. understand the problem and desired outcome;
2. understand the proposed design and its load-bearing mechanism;
3. evaluate material alternatives and tradeoffs;
4. identify material risks, failure modes, and unresolved evidence;
5. assess compatibility, migration, and blast radius when relevant;
6. make and defend the requested decision.

A true detail that does not materially serve one of those jobs normally remains upstream.

## Process

1. Read the explanatory model and optional reviewer adaptation.
2. If a reviewer adaptation exists, honor its required/supporting/upstream-only relevance classification. For the default branch, perform the same decision-relevance test directly against the explanatory model.
3. Plan the opening mental model and central design proposition.
4. Identify the smallest set of sections needed for decision sufficiency.
5. Sequence concepts according to dependencies and preserve mechanism before consequence.
6. Include before/after, unchanged/modified/new, compatibility, blast radius, migration, risks, unknowns/evidence, alternatives, verification strategy, and implementation consequences only to the depth material to this decision.
7. Separate **design consequence** from **implementation planning**:
   - keep implementation facts only when they constrain feasibility, compatibility, migration, blast radius, risk, validation, or the architecture being approved;
   - keep PR topology, branch strategy, ticket decomposition, repository work queues, milestones, coding conventions, and ordinary execution ordering upstream for downstream planning;
   - include an ordering dependency only when violating it would make the approved design incorrect, unsafe, incompatible, or infeasible.
8. Treat verification as evidence that the design is testable, not as a full test plan. Preserve validation seams and load-bearing acceptance evidence; omit exhaustive test matrices unless the decision depends on them.
9. Do not create a section merely because a conventional design-doc template has one. Sections exist only when they answer a decision-relevant reviewer question.
10. For every planned section, state:
   - the reviewer question it answers;
   - why that question is material to approval;
   - what upstream detail is deliberately omitted.
11. Decide which information should remain prose and which should become a structured representation.
12. Write `design-doc-plan.md`.

## Compression rule

Present the resulting design, not the history of discovering it.

Do not preserve exploration chronology, decision-map structure, counts of resolved/closed items, ticket status, or every rejected branch merely because they appear in the source.

Include a rejected alternative when understanding why it lost materially helps evaluate the proposed design. Include an unresolved question when its answer could change the decision, material risk, compatibility, migration, feasibility, or validation strategy. Otherwise keep it upstream.

**Decision-relevant does not mean downstream-useful.** Information may be useful to implementers or ticket authors while still being unnecessary for design approval. Keep that material upstream.

Compression is not summarization by word deletion. Remove entire non-material branches of information before polishing the material that remains.

## Representation rule

A design document is not a prose transcription of its source.

Prefer a table, diagram, matrix, contract block, before/after view, structured list, or source-supported code/schema excerpt when it materially reduces the reader's reconstruction work.

Keep prose for causal reasoning, rationale, nuance, uncertainty, and transitions that would be distorted by tabular compression.

Do not optimize for shortness alone. Optimize for decision-relevant information density, scanability, and comprehension.

## Must preserve

All material facts, tradeoffs, risks, limitations, and uncertainty necessary for the review decision. Omitted upstream information remains available through preserved checkpoints.

## Do not

Do not include a generic `Implementation path` section unless implementation ordering is itself architecture-significant. Do not expose rhetorical strategy in headings, mirror the source mechanically, narrate source-process bookkeeping, create generic "decisions" inventories, pad unsupported sections with generic prose, turn the document into a slide deck, or force structured representations where prose communicates the reasoning more accurately.

## Completion gate

Before returning:

1. apply the decision-sufficiency test to every section;
2. remove sections/details that cannot justify their place;
3. verify no material tradeoff/risk/compatibility issue was lost;
4. inspect remaining prose for better structured representations.

Report unresolved defects with the earliest owning stage.

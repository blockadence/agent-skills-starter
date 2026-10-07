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

The design document is a **decision instrument** for approval/review, not a comprehensive architecture dossier and not an exhaustive replay of the source or explanatory model. The explanatory model owns completeness; the design document owns the decision.

Include the minimum information necessary for the intended reviewer to:

1. understand the problem and desired outcome;
2. understand the proposed design and the mechanism that makes it work;
3. evaluate material alternatives and tradeoffs;
4. identify material risks, failure modes, and unresolved evidence;
5. assess compatibility, migration, and blast radius when relevant;
6. make and defend the requested decision.

A true detail that does not materially serve one of those jobs normally remains upstream.

## Process

1. Read the explanatory model and optional reviewer adaptation.
2. If a reviewer adaptation exists, honor its required/supporting/upstream-only relevance classification. For the default branch, perform the same decision-relevance test directly against the explanatory model.
3. Plan the opening mental model, explicit decision/request, and central design proposition.
4. Classify candidate information into three disclosure levels:
   - **Decision surface:** information that could materially change approve/reject/challenge. Always reader-facing.
   - **Understanding surface:** information necessary to understand or evaluate the decision. Reader-facing, with structured/visual representation preferred when it reduces reconstruction work.
   - **Reference depth:** implementation detail, exhaustive mechanics, edge cases, examples, or validation specifics that remain useful but do not belong in the main review path. Keep upstream or move to an appendix/reference only when reviewers genuinely need access during this decision.
5. Build the main document from Decision + Understanding surfaces. Reference depth must not silently expand the main narrative.
6. Identify the smallest set of sections needed for decision sufficiency. Use this default grammar when applicable, omitting any section that has no material content:
   1. decision / requested approval;
   2. problem and material constraints;
   3. design overview with one orienting system/architecture representation when supported;
   4. a small set of major design propositions;
   5. credible alternatives whose tradeoffs could change the decision;
   6. material risks and unresolved questions;
   7. compatibility / migration / rollout only when architecture-significant;
   8. verification confidence: what evidence will show the design works, not the test inventory.
   This is information architecture, not boilerplate. Do not emit empty or generic sections.
7. Sequence concepts according to dependencies and preserve mechanism before consequence.
8. Include before/after, unchanged/modified/new, compatibility, blast radius, migration, risks, unknowns/evidence, alternatives, verification strategy, and implementation consequences only to the depth material to this decision. For alternatives, retain only **credible competing designs** whose tradeoffs could reasonably change or challenge approval. A rejected local implementation choice belongs beside the mechanism it explains or remains upstream; do not turn the Alternatives section into a decision log.
9. Separate **design consequence** from **implementation planning**:
   - keep implementation facts only when they constrain feasibility, compatibility, migration, blast radius, risk, validation, or the architecture being approved;
   - keep PR topology, branch strategy, ticket decomposition, repository work queues, milestones, coding conventions, and ordinary execution ordering upstream for downstream planning;
   - include an ordering dependency only when violating it would make the approved design incorrect, unsafe, incompatible, or infeasible.
10. Treat verification as evidence that the design is testable, not as a full test plan. Preserve validation seams, design-invalidating failure classes, and the evidence needed for reviewer confidence. Keep exhaustive acceptance-case inventories, test matrices, and ordinary test enumeration upstream unless the decision itself depends on them.
11. Do not create a section merely because a conventional design-doc template has one. Sections exist only when they answer a decision-relevant reviewer question.
12. For every planned section, state:
   - the reviewer question it answers;
   - why that question is material to approval;
   - what upstream detail is deliberately omitted.
13. Build an internal information-priority tree for the document:
   - **Scan:** design proposition, a small set of major design pillars, material consequences, and decision requested;
   - **Review:** the mechanism, tradeoffs, compatibility, risks, and evidence needed to evaluate those pillars;
   - **Deep reference:** decision-relevant edge cases, detailed alternatives, validation detail, API specifics, and other material reference information that would interrupt the main argument.
   Prefer roughly three major design pillars when the subject naturally supports it. This is a prioritization heuristic, never a quota. Deeper levels elaborate the same proposition rather than introducing a competing structure.
14. Decide which information should remain prose and which should become a structured representation.
15. Treat technical diagrams as compression tools, not decoration. Preserve or introduce supported context/C4, sequence, entity/data-model, state, deployment, and interface/contract views when they replace substantial prose or make a decision-critical relationship easier to inspect. Compression must not delete a useful technical representation merely because its facts also exist in prose.
16. Write `design-doc-plan.md`.

## Compression rule

Present the resulting design, not the history of discovering it.

Do not preserve exploration chronology, decision-map structure, counts of resolved/closed items, ticket status, or every rejected branch merely because they appear in the source.

Include a rejected alternative when understanding why it lost materially helps evaluate the proposed design. Include an unresolved question when its answer could change the decision, material risk, compatibility, migration, feasibility, or validation strategy. Otherwise keep it upstream.

**Decision-relevant does not mean downstream-useful.** Information may be useful to implementers or ticket authors while still being unnecessary for design approval. Keep that material upstream.

Compression is not summarization by word deletion. Remove entire non-material branches of information before polishing the material that remains.

Prefer terse engineering prose. A human design reviewer does not need the implementation agent's complete explanatory context. After adding a table, diagram, matrix, or contract, reread the surrounding prose and remove statements whose information is now obvious from the representation. **A representation must buy back prose.** Keep enough causal reasoning to defend the design, then stop. If a paragraph mainly teaches established platform behavior to a reviewer who already knows it, retain only the changed behavior, non-obvious dependency, consequence, or risk.

## Proposition grammar

For each major design proposition, plan the reader-facing treatment in this order:

1. **Conclusion:** the design choice, behavior, or proposition the reviewer should understand.
2. **Primary technical representation:** the diagram, contract, table, matrix, or compact structured view that makes the relevant relationship inspectable, when supported.
3. **Essential reasoning:** only the causal explanation needed to understand why the representation supports the conclusion.
4. **Material consequence / tradeoff:** the cost, limitation, compatibility effect, risk, or implication relevant to approval.

The proposition grammar is planning machinery, not required reader-facing vocabulary. Let it shape the document without emitting labels such as `Pillar 1`, `Conclusion`, `Representation`, `Essential reasoning`, or `Consequence` merely to expose the structure. Use subject-matter headings and natural engineering language.

For compact overview tables, prefer neutral headers that describe the information directly, such as `Design area | Decision | Consequence`, `Design choice | Why it matters`, or another subject-appropriate equivalent. Do not default to `Pillar | Claim | Consequence`: `pillar` exposes internal structuring and `claim` sounds argumentative rather than technical.

Do not expand a proposition into a miniature architecture dossier. Reference-depth mechanics remain upstream unless they are necessary to understand or challenge the conclusion.

## Representation rule

A design document is not a prose transcription of its source.

Prefer a table, diagram, matrix, contract block, before/after view, structured list, or source-supported code/schema excerpt when it materially reduces the reader's reconstruction work.

Keep prose for causal reasoning, rationale, nuance, uncertainty, and transitions that would be distorted by tabular compression.

Do not optimize for shortness alone. Optimize for decision-relevant information density, scanability, and comprehension.

## Must preserve

All material facts, tradeoffs, risks, limitations, and uncertainty necessary for the review decision. Omitted upstream information remains available through preserved checkpoints.

## Do not

Do not use sales, advocacy, or assurance language to make the design sound more compelling. Prefer factual descriptions of behavior, evidence, tradeoffs, constraints, consequences, and commitments. Avoid generic reader-facing labels such as `claim` or `promise` when a concrete engineering noun is available. Do not include a generic `Implementation path` section unless implementation ordering is itself architecture-significant. Do not expose rhetorical strategy in headings, mirror the source mechanically, narrate source-process bookkeeping, create generic "decisions" inventories, pad unsupported sections with generic prose, turn the document into a slide deck, or force structured representations where prose communicates the reasoning more accurately.

## Completion gate

Before returning:

1. apply the decision-sufficiency test to every section;
2. remove sections/details that cannot justify their place;
3. verify no material tradeoff/risk/compatibility issue was lost;
4. inspect remaining prose for better structured representations;
5. verify Decision and Understanding surfaces form the main review path while Reference depth remains upstream or explicitly separated;
6. verify each major design proposition follows conclusion -> representation -> essential reasoning -> material consequence/tradeoff internally when those elements are applicable, without requiring those planning labels in reader-facing headings;
7. verify Alternatives contains credible competing designs rather than a replay of local rejected choices;
8. verify verification communicates confidence and design-invalidating failure classes rather than an acceptance-test inventory;
9. verify every substantial representation bought back redundant surrounding prose;
10. verify Scan, Review, and Deep-reference information elaborate one design proposition rather than competing structures;
11. verify useful supported technical diagrams/contracts were not lost during compression.

Report unresolved defects with the earliest owning stage.

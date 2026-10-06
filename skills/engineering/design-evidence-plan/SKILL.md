---
name: design-evidence-plan
description: "Select engineering evidence and representations for a design document. Use when deciding whether a question needs prose, tables, before/after views, C4, UML, ER, sequence/state/activity/deployment diagrams, API/schema/code/SQL excerpts, or no additional artifact."
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

Evidence selection, representation selection, canonical notation, source-support classification, renderer choice, layout intent, and captions.

## Process

1. Read source model, explanatory model, document plan, and optional reviewer adaptation. Treat the document plan and reviewer adaptation as selection contracts, not invitations to re-decide settled upstream facts.
2. For each candidate artifact or structured representation, state the engineering question it answers.
3. State the conclusion the reader should be able to reach after seeing it.
4. Classify it as explanatory or technical.
5. Choose the representation that minimizes reconstruction work without losing causal reasoning: prose, table, matrix, before/after view, canonical diagram, contract block, source-supported code/schema/API/SQL excerpt, or no additional artifact.
   For architecture, interaction, data-shape, lifecycle, boundary, or contract questions, actively consider C4/context, UML sequence, ER/entity-model, state/activity/deployment, and interface/contract representations before accepting prose.
6. For technical diagrams, choose canonical notation when available. Treat the document as a set of engineering questions rather than asking for a diagram quota. Before finalizing, explicitly inspect at least these relationship classes when the design contains them: system/context boundaries, runtime interactions, domain/entity relationships, lifecycle/state transitions, data flow/persistence, and interfaces/contracts. For each applicable class, either plan a visual/contract representation or record why prose/table/code is clearer. The goal is coverage of decision-relevant relationships, not a target count.
7. Classify support as concrete, conceptual, or unsupported.
8. Choose renderer separately from notation and state layout intent.
9. Specify meaningful labels and the conclusion the caption should communicate.
10. Omit unsupported artifacts.
11. Write `design-evidence-plan.md`.

## Source-support rule

- **Concrete:** the source supports the actual names, signatures, schema, code, paths, values, or other specificity being shown.
- **Conceptual:** the source supports the relationship, responsibility, behavior, or contract but not a concrete implementation representation. Keep the artifact visibly conceptual.
- **Unsupported:** the source does not support the proposed specificity. Omit it or represent the unknown honestly.

Do not turn a conceptual behavioral contract into plausible-looking Java, SQL, schema, API, package, or class detail.

## Representation test

For each prose-heavy section in the document plan, ask whether its primary job is reasoning or structured comparison/relationship.

If structured representation would materially reduce interpretation, plan it here. If prose is retained, record why prose carries information that the structured form would lose.

Reviewer adaptation may remove explanatory context, but reviewer expertise alone does not justify removing decision-relevant technical evidence. Reconsider any representation that exposes a changed boundary, runtime interaction, concurrency property, failure mode, compatibility constraint, irreversible choice, or other material relationship.

Compression must not remove a source-supported technical diagram merely because the same facts can be stated in prose. When a diagram replaces paragraphs, preserves an important relationship, or gives reviewers a faster inspection surface, prefer the diagram and shorten the prose around it.

## Do not

Do not invent proprietary notation when an established notation fits. Do not fabricate Java, SQL, schemas, APIs, package names, or class names. Mermaid is a renderer/syntax, not a notation. When Mermaid is selected, prefer conservative syntax compatible with the target runtime and avoid exotic characters or constructs when an ordinary equivalent communicates the same meaning. Do not add decorative diagrams that answer no engineering question.

## Completion gate

Before returning, verify source support, representation choice, canonical notation where applicable, the intended reader conclusion for every planned artifact, and that every applicable engineering relationship class was considered rather than allowing prose to win by default.

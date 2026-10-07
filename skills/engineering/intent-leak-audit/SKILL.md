---
name: intent-leak-audit
description: "Audit reader-facing engineering artifacts for leaked authoring or source-process intent: reviewer classification, persuasion strategy, generation mechanics, Wayfinder/session bookkeeping, pipeline stage names, notation/renderer details, or rhetorical coaching. Use before publishing generated design docs, presentations, and PR communication."
---

# intent-leak-audit

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

Verification that reader-facing text describes the engineering subject rather than the author's communication machinery or the source-generation process.

## Planning-taxonomy leak

Internal artifact grammar may shape reader-facing structure without becoming reader-facing terminology.

Flag labels such as `Decision surface`, `Understanding surface`, `Reference depth`, `Pillar 1`, `Conclusion`, `Primary representation`, `Essential reasoning`, or `Consequence` when they are mechanically emitted because the generation plan uses those categories rather than because the terms naturally help the engineering reader.

Do not ban ordinary engineering words. A compact overview table may legitimately use headings such as `Pillar`, `Claim`, or `Consequence` when they improve scanning and do not expose generation mechanics.

## Process

1. Inspect titles, headings, captions, callouts, diagram labels, slide fragments, and PR prose.
2. Ask whether each phrase describes the engineering subject or instead describes how the source was explored, resolved, generated, or communicated.
3. Flag reviewer/profile labels and persuasion mechanics.
4. Flag source-process provenance presented as reader-relevant engineering content, including decision-map counts/status, ticket/session bookkeeping, resolution chronology, and Wayfinder-specific process vocabulary.
5. Flag notation/renderer labels unless notation itself is material to the engineering decision.
6. Emit findings with owning stage.
7. Return PASS or FAIL.

## Important distinction

Do not ban the word `decision`. Engineering decisions and material tradeoffs are legitimate content.

Flag language when its purpose is to expose the bookkeeping or history of reaching those decisions rather than helping the reader evaluate the resulting design. A section about a material architectural choice can be valid; a section inventorying "24 decisions: 20 resolved, 4 closed" is source-process leakage.

## Do not

Do not remove useful engineering context, reject legitimate design decisions merely because the source also calls them decisions, or rewrite the artifact.

## Completion gate

Before returning, verify the artifact presents the resulting engineering design rather than the history or machinery of discovering it.

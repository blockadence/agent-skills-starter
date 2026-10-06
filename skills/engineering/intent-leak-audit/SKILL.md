---
name: intent-leak-audit
description: "Audit reader-facing engineering artifacts for leaked authoring intent: reviewer classification, persuasion strategy, generation mechanics, pipeline stage names, notation/renderer implementation details, or rhetorical coaching. Use before publishing generated design docs, presentations, and PR communication."
---

# intent-leak-audit

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

Verification that reader-facing text describes the engineering subject rather than the author's communication machinery.

## Process

1. Inspect titles, headings, captions, callouts, diagram labels, slide fragments, and PR prose.
2. Ask whether each phrase describes the engineering subject or describes how/why the author chose to communicate it.
3. Flag reviewer/profile labels and persuasion mechanics.
4. Flag notation/renderer labels unless notation itself is material to the engineering decision.
5. Emit findings with owning stage.
6. Return PASS or FAIL.

## Do not

Do not remove useful engineering context or rewrite the artifact.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

---
name: to-pr-comments
description: "Orchestrate human-readable PR review communication from verified deep code-review findings. Use after a code-review skill when the user wants a concise reviewer preamble and comprehensible inline comments that preserve upstream technical rigor."
---

# to-pr-comments

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

The downstream communication workflow. Deep technical discovery and verification remain owned by the upstream code-review skill.

## Pipeline

1. Accept verified `code-review` output as technical source.
2. Normalize it with `source-model`.
3. Build a PR `explanatory-model`.
4. Apply optional `reviewer-adapt`.
5. Run `pr-communication-plan`.
6. Compose the reviewer preamble and inline comments.
7. Run source-fidelity, comprehension, and intent-leak audits.
8. Route blocking findings upstream and regenerate.
9. Stop only when blocking gates pass or insufficient evidence is explicitly reported.

## Preamble contract

A cold reviewer should be able to explain what changed, why, the mechanism/code path, scope, main risk, and review posture after reading it.

## Inline comment contract

Each retained comment states the concrete local issue or question, causal explanation, consequence, evidence, and requested action or decision when appropriate.

## Optional GitHub delivery

Stop after producing a human-reviewable review artifact. Post comments only when the user explicitly asks after reviewing or editing it. When `references/gh-batch-post.md` is present, follow that reference for batch delivery.

## Do not

Do not rerun or replace deep code review, discard technical evidence during humanization, dump investigation prose verbatim, or produce compressed comments that require reconstructing the investigation.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

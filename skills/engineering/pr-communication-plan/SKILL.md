---
name: pr-communication-plan
description: "Turn verified code-review findings into a reviewer mental model and comprehensible PR communication plan. Use downstream of a deep code-review skill when preparing a PR preamble and inline comments without weakening technical rigor."
---

# pr-communication-plan

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

The PR mental model, preamble responsibilities, finding-to-comment mapping, retained evidence, and requested reviewer actions.

## Process

1. Treat upstream code-review findings as technical source. Do not redo the investigation unless evidence is explicitly missing.
2. Build the PR mental model: what changed, why, mechanism/code path, scope, invariants, and main risks.
3. Decide which facts belong in the preamble.
4. Map each retained finding to an inline comment or preamble-only note.
5. Preserve evidence needed to justify each finding.
6. Merge or omit redundant/noise comments explicitly.
7. Define requested action or decision where appropriate.
8. Write `pr-communication-plan.md`.

## Must preserve

Upstream technical verification and evidence.

## Do not

Do not replace deep code review, weaken findings during humanization, paste investigation prose verbatim, or require every inline comment to reconstruct the entire PR.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

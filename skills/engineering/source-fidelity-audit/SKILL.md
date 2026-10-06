---
name: source-fidelity-audit
description: "Audit a transformed engineering artifact against its source model for invented facts, lost uncertainty, changed decision status, omitted limitations, or technical contradictions. Use as a gate before accepting design docs, presentations, or PR communication."
---

# source-fidelity-audit

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

Verification only. This audit reports fidelity defects and their owning stage.

## Process

1. Compare downstream claims with `source-model.md`.
2. Check decisions vs assumptions vs unknowns.
3. Check technical specificity against source-support classification.
4. Check important limitations and out-of-scope boundaries for distortion.
5. Emit structured findings.
6. Return PASS only when no blocking fidelity findings remain.

## Finding contract

Each finding contains type, location, severity, evidence, violated rule, owning stage, and recommended disposition.

## Do not

Do not rewrite the artifact, resolve source contradictions, or excuse unsupported specificity because it sounds plausible.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

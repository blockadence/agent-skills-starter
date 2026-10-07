---
name: source-fidelity-audit
description: "Audit a transformed engineering artifact against its source model for invented facts, changed decision status, dangerous omissions, lost uncertainty, or technical contradictions while allowing deliberate decision-relevant compression. Use as a gate before accepting design docs, presentations, or PR communication."
---

# source-fidelity-audit

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

Verification only. This audit distinguishes truth-preserving compression from dangerous omission and reports fidelity defects with their owning stage.

## Process

1. Compare downstream claims with `source-model.md`.
2. Check decisions vs assumptions vs unknowns.
3. Check technical specificity against source-support classification.
4. Check whether omitted limitations, tradeoffs, risks, compatibility concerns, unresolved questions, or evidence gaps are material to the artifact's review/decision task.
5. Do not require inclusion merely because information exists in the source.
6. Check source/process provenance has not been transformed into an engineering claim.
7. Emit structured findings.
8. Return PASS only when no blocking fidelity findings remain.

## Omission rule

Omission is a fidelity defect only when the missing information could materially change the reader's understanding, evaluation, challenge, implementation safety, or requested decision.

The absence of non-material source detail is successful compression, not loss of fidelity.

Examples of information that normally does not need to survive into reader-facing artifacts include source ticket counts, decision-map bookkeeping, exploration chronology, and rejected branches with no bearing on the selected design.

## Finding contract

Each finding contains type, location, severity, evidence, violated rule, owning stage, and recommended disposition.

## Do not

Do not rewrite the artifact, resolve source contradictions, excuse unsupported specificity because it sounds plausible, or demand exhaustive source coverage as proof of fidelity.

## Completion gate

Before returning, verify both sides: no material truth was dangerously omitted and no non-material omission was falsely reported as a fidelity defect.

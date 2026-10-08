---
name: source-model
description: "Normalize rigorous engineering source material into a fidelity-first semantic model. Use before human-facing design documentation, presentations, or PR communication when facts, decisions, constraints, assumptions, unknowns, contradictions, source-process provenance, and source support must be preserved."
---

# source-model

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

Source completeness, terminology, decision status, uncertainty, contradictions, technical source support, and classification of engineering substance versus source/process provenance.

## Process

1. Read every supplied source completely before modeling it. For multiple specifications, inventory each source and reconcile shared scope, overlaps, dependencies, terminology, decisions, assumptions, and conflicting statements. Keep source-level provenance and distinguish agreement from inferred synthesis. Do not use input order or file modification time as authority.
2. Record source identity and scope for each source. For multiple specifications, write `source-reconciliation.md` with source inventory, overlaps, dependencies, divergences, unresolved conflicts, and support references before composing the unified `source-model.md`.
3. Extract terminology as the source uses it.
4. Separate existing behavior, decisions, constraints, invariants, assumptions, unknowns, limitations, out-of-scope items, and contradictions.
5. Classify support for technical specificity as concrete, conceptual, or unsupported.
6. Separately classify source/process provenance that may be useful for traceability but is not itself engineering substance.
7. Write `source-model.md`.

## Source/process provenance

Examples include ticket identifiers, map status, decision counts, resolution bookkeeping, research/session chronology, workflow-stage labels, who or what process discovered a fact, and similar metadata about how the source was produced.

Preserve this material internally when needed for traceability. Do not promote it into engineering substance merely because the source emphasizes it.

A rejected alternative, accepted risk, or unresolved question is engineering substance when it materially affects the design. The fact that it was "decision 17," closed in a particular session, or one of 24 map decisions is provenance.

## Output

`source-model.md` contains source identity and scope, terminology, engineering substance, source/process provenance, existing behavior, decisions, constraints, invariants, assumptions, unknowns, limitations, out of scope, unresolved conflicts, and the source-support map.

## Must preserve

The source's distinctions between fact, decision, assumption, unknown, limitation, and proposal. Preserve provenance internally without confusing it with reader-relevant design content.

## Do not

Do not audience-optimize, create the narrative, invent implementation detail, silently reconcile conflicts, or treat source-process bookkeeping as a design requirement.

## Completion gate

Before returning, verify that engineering substance and source/process provenance are distinguishable and that the full source truth remains recoverable. Report unresolved defects with the earliest owning stage.

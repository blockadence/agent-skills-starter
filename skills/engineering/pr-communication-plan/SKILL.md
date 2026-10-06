---
name: pr-communication-plan
description: "Turn verified code-review findings into a reviewer mental model and comprehensible PR communication plan. Use downstream of a deep code-review skill when preparing a PR preamble and diff-anchored inline comments without weakening technical rigor."
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

The PR mental model, preamble responsibilities, exhaustive finding disposition, diff anchoring requirements, severity ordering, retained evidence, comment form, and requested reviewer actions.

## Process

1. Treat upstream code-review findings as technical source. Do not redo the investigation unless evidence is explicitly missing.
2. Build the PR mental model: what changed, why, mechanism/code path, scope, invariants, and main risks.
3. Decide which facts belong in the preamble.
4. Give every retained upstream finding an explicit disposition:
   - inline comment when it can be anchored to a changed line;
   - preamble or file-level note when it concerns the change as a whole;
   - merged with another finding when they are substantively redundant;
   - omitted only with an explicit reason such as duplicate, unsupported, or below the requested review threshold.
5. Never silently drop a finding.
6. For inline comments, retain enough exact evidence to anchor the comment to the current diff. If the evidence cannot support a reliable changed-line anchor, do not invent one; promote the finding to the appropriate non-inline location.
7. Classify retained comments by review severity:
   - **blocking:** merging as-is produces or preserves a defect, regression, security/data problem, or violation that must be resolved first;
   - **important:** real issue that deserves attention but does not by itself block merge;
   - **optional:** improvement the author may reasonably accept or decline;
   - **nit:** style, typo, or low-impact naming/presentation issue.
8. Order comments by severity, with related comments grouped when that improves comprehension.
9. For each inline comment, plan the concrete communication beat:
   - **what:** what the relevant code/change does or what condition is observed;
   - **why:** the concrete consequence or reason it matters;
   - **change/decision:** the requested correction, clarification, or decision when appropriate.
10. Select a Conventional Comments style label when it clarifies intent, such as `issue`, `suggestion`, `question`, `nitpick`, `chore`, `todo`, `praise`, or `thought`, with blocking/non-blocking decoration where useful.
11. Describe code and behavior, not the author's character or competence. Ask a genuine question when evidence is uncertain; assert a verified issue directly when it is not.
12. Write `pr-communication-plan.md`.

## Preamble responsibilities

The preamble should let a cold reviewer explain:

- what the PR changes;
- why it exists, or that motivation is not established by the available evidence;
- the mechanism/code path;
- scope and any unrelated seam;
- what lands well versus what remains incomplete;
- the main review risk or decision.

Do not autonomously choose or submit the human review disposition. `APPROVE`, `REQUEST_CHANGES`, and equivalent GitHub actions belong to the human unless explicitly requested.

## Finding-disposition gate

Before returning, account for every upstream finding. The number of inline, preamble/file-level, merged, and explicitly omitted findings must reconcile with the upstream set.

## Must preserve

Upstream technical verification, evidence, uncertainty, and severity-relevant consequences.

## Do not

Do not replace deep code review, weaken findings during humanization, paste investigation prose verbatim, silently drop findings, anchor a whole-change concern to an arbitrary nearby line, or require every inline comment to reconstruct the entire PR.

## Completion gate

Verify exhaustive finding disposition, reliable anchoring strategy, severity ordering, the what -> why -> change/decision beat, and preservation of upstream evidence. Report unresolved defects with the earliest owning stage.

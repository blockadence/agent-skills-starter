# Context-rot reconciliation audit

This ledger records the October 2026 reconciliation of the engineering skill suite against the current repository implementation, recovered design decisions, deleted predecessor skills, acceptance-run observations, and authoritative methodology where applicable.

The purpose is to prevent future maintenance from depending on conversational memory.

## Classification

- **Regression:** a previously established behavior became weaker or disappeared.
- **Never encoded:** a requirement existed in the working design but was not made enforceable in the repository.
- **Contract ambiguity:** ownership or expected behavior was insufficiently precise.
- **Intentional evolution:** the implementation deliberately changed and the newer behavior should remain.
- **New improvement:** useful behavior discovered after the earlier baseline rather than recovered from it.

## Reconciliation ledger

| Area | Classification | Disposition |
| --- | --- | --- |
| BBB proper title slide | Regression | Restore in `bbb-story-plan`; add regression fixture. |
| BBB opening narrative | Regression | Restore engineering adaptation of Hook -> Relevance -> Challenge -> Desired state -> Map before detailed solution mechanics. |
| BBB headline-only story | Never encoded strongly enough | Require headline-story test in planner and comprehension audit. |
| BBB visual/verbal channels | Weakened contract | Require complementary headline/visual/notes planning and a usable rehearsal script. |
| Design-doc prose density | Never encoded strongly enough | Add representation selection to design-doc and evidence planning; optimize for information density and scanability rather than shortness. |
| Artifact-level comprehension | Contract ambiguity | Extend comprehension audit beyond local prose to document/deck/PR flow. |
| Mechanism before consequence | Partial regression | Restore to `explanatory-model` and comprehension audit. |
| One home per fact | Partial regression | Restore as an explanatory/comprehension invariant. |
| Second-read test | Partial regression | Restore as a comprehension invariant. |
| Source-support classification | Preserved | Keep concrete/conceptual/unsupported model. |
| Constructed-content footer | Intentional evolution | Do not restore reader-facing footer. Keep sourced/derived/unsupported distinctions internal through source-support and audits. |
| PR exhaustive finding disposition | Regression | Restore in `pr-communication-plan`. |
| PR diff anchoring | Regression | Restore reliable changed-line anchoring; promote whole-change findings rather than inventing anchors. |
| PR severity ordering | Regression | Restore blocking/important/optional/nit classification. |
| PR what -> why -> change beat | Regression | Restore in communication planning and comprehension audit. |
| Conventional Comments labels | Regression | Restore as communication intent labels where useful. |
| Autonomous GitHub review disposition | Intentional evolution | Do not restore. Human owns APPROVE/REQUEST_CHANGES unless explicitly requested. |
| Reviewer branch topology | New improvement | Keep shared `source/explanatory-model.md` branch point and isolated downstream reviewer packages. |
| AI-authorship prohibition | Intentional correction | Keep AI authorship allowed; require human review before representing output as reviewed/approved/final. |
| Plugin manifest | Packaging defect | Expose promoted engineering skills in plugin manifest before production-ready claim. |
| PR compatibility text | Stale documentation | Correct before merge. |

## Acceptance observation: decision-relevant compression

Fresh default and CTO Evals design documents exposed a second systemic failure after the first reconciliation pass.

Observed symptoms:

- the default document included a heading such as `What is decided and what is not` and reader-facing Wayfinder bookkeeping such as `24 in the decision map: 20 resolved, 4 closed out of scope, none open`;
- the CTO variant still carried hints of the source's decision-map framing in a `Decisions and scope` section;
- both documents remained too information-dense even where the individual prose and representations were understandable.

This is not a local wording defect. The pipeline was still biased toward preserving source volume rather than selecting the minimum decision-relevant information needed by a human reviewer.

### New invariants

- **Fidelity preserves truth, not volume.**
- **Present the resulting design, not the history of discovering it.**
- **A design document is decision-sufficient, not source-exhaustive.**
- **Omission is safe when omitted material cannot materially change understanding, evaluation, challenge, implementation safety, or the requested decision.**
- **Compression removes non-material branches before polishing the material that remains.**
- **A locally comprehensible artifact can still fail globally because of excessive decision-irrelevant cognitive load.**

### Ownership audit

No new compression skill is required.

| Stage | Compression responsibility |
| --- | --- |
| `source-model` | Preserve exhaustive truth while separating engineering substance from source/process provenance. |
| `explanatory-model` | Remain the comparatively complete shared causal/semantic checkpoint. Do not optimize it for final artifact brevity. |
| `reviewer-adapt` | Select required, supporting, and upstream-only information for the reviewer's decision task. |
| `design-doc-plan` | Apply artifact-specific decision sufficiency and remove entire non-material information branches before composition. |
| `source-fidelity-audit` | Reject dangerous omissions without treating every omission as a fidelity defect. |
| `comprehension-audit` | Reject excessive decision-irrelevant cognitive load even when local prose is clear. |
| `intent-leak-audit` | Reject source-process provenance that escapes into reader-facing content. |

Reviewer variants may be more compressed than the default when reviewer context permits. Reviewer adaptation is not synonymous with adding more detail.

## Architecture decision

Do not roll back the composable architecture. Recovered behaviors belong in the earliest leaf skill that owns them. Wrappers orchestrate; transformations author; audits verify and route.

## Acceptance consequence

After reconciliation changes, rerun the canonical Evals fixture from the beginning. Do not mark the suite production-ready merely because the default design document looks good. The full default package, reviewer variants, BBB narrative, rendering, PR communication, plugin discovery, and independent fixtures remain acceptance gates.

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

## Architecture decision

Do not roll back the composable architecture. Recovered behaviors belong in the earliest leaf skill that owns them. Wrappers orchestrate; transformations author; audits verify and route.

## Acceptance consequence

After reconciliation changes, rerun the canonical Evals fixture from the beginning. Do not mark the suite production-ready merely because the default design document looks good. The full default package, reviewer variants, BBB narrative, rendering, PR communication, plugin discovery, and independent fixtures remain acceptance gates.

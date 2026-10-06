# Engineering skill regression fixtures

These cases preserve failures found while developing the engineering documentation pipeline.

| ID | Fixture | Expected behavior |
| --- | --- | --- |
| COMP-001 | `denominator` copied cold into reader prose | Explain the concrete measurement population first. |
| COMP-002 | `External-seam tests` | Define the concrete boundary or translate the phrase. |
| COMP-003 | `substrate` before mechanism | Introduce the workflow-test execution path first. |
| COMP-004 | Address Path before runtime-identity problem | Reorder so the problem motivates the concept. |
| COMP-005 | premature `eval_*` | Introduce the concept before implementation vocabulary. |
| INTENT-001 | `Adversarial engineering review` | Fail intent-leak audit. |
| INTENT-002 | `CTO review` | Fail intent-leak audit. |
| INTENT-003 | `C4-style application context` | Fail unless notation itself is material. |
| INTENT-004 | wrapper completion narrates internal handling of an AI-authorship constraint | Fail. Keep generation-process deliberation internal; report only a genuinely unresolved substantive source problem. |
| ADAPT-001 | `Claim 1`, `Claim 2`, `Claim 3` caused by skeptical profile | Transform into objectives, invariants, evidence, or limitations. |
| ADAPT-002 | `--from=reviewer-adapt --reviewer=cto` produces only `review-adaptation.md` | Fail. Continue through all downstream stages and produce the complete CTO package. |
| ADAPT-003 | reviewer variant overwrites default or another variant | Fail. Isolate explicit variants in reviewer-specific namespaces. |
| EVID-001 | conceptual contract rendered as concrete Java | Fail evidence/source-support audit. |
| EVID-002 | proprietary sequence notation where UML sequence fits | Prefer canonical notation. |
| RENDER-001 | edge label overlaps container header | Fail render audit. |
| BBB-001 | opening starts in the middle of the population-testing argument | Reorder to establish topic and problem first. |
| BBB-002 | solution headline before problem | Reorder. |
| PR-001 | preamble lacks what, why, mechanism, scope, or risk | Fail comprehension gate. |
| PR-002 | inline comment requires reconstructing the whole investigation | Fail comprehension gate. |
| GLOBAL-001 | reviewer variants disagree on a technical fact | Fail source-fidelity audit. |
| HUMAN-001 | source fixture says AI must not draft design prose or reasoning | Do not block generation. Enforce the intended human-review boundary: generated artifacts remain drafts until human-reviewed and must not be represented as approved/final beforehand. |

Source terms are not banned words. `denominator`, `seam`, and `substrate` are legitimate source vocabulary in the Evals fixture. The regression is using them reader-facing before the audience has the required mental model.

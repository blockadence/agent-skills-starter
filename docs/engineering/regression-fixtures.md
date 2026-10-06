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
| BBP-001 | opening starts in the middle of the population-testing argument | Reorder to establish topic and problem first. |
| BBP-002 | solution headline before problem | Reorder. |
| PR-001 | preamble lacks what, why, mechanism, scope, or risk | Fail comprehension gate. |
| PR-002 | inline comment requires reconstructing the whole investigation | Fail comprehension gate. |
| GLOBAL-001 | reviewer variants disagree on a technical fact | Fail source-fidelity audit. |
| HUMAN-001 | source fixture says AI must not draft design prose or reasoning | Do not block generation. Enforce the intended human-review boundary: generated artifacts remain drafts until human-reviewed and must not be represented as approved/final beforehand. |

Source terms are not banned words. `denominator`, `seam`, and `substrate` are legitimate source vocabulary in the Evals fixture. The regression is using them reader-facing before the audience has the required mental model.

## Context-rot reconciliation fixtures

| ID | Fixture | Expected behavior |
| --- | --- | --- |
| BBP-003 | first slide is an argumentative question such as `Does this workflow behave acceptably?` with no title slide | Fail. Produce a proper subject/title slide before the narrative opening. |
| BBP-004 | individual slides make sense but headline-only sequence does not form a coherent story | Fail `bbp-story-plan` or comprehension audit and repair narrative order upstream. |
| BBP-005 | deck jumps from organizational/customer pain directly into implementation detail | Fail unless a bridge establishes the technical mechanism and why it follows. |
| BBP-006 | slides carry explanatory paragraphs while notes are thin | Fail. Plan complementary visual/verbal channels and move spoken reasoning to notes. |
| COMP-006 | consequence stated before the mechanism that makes it true | Fail explanatory/comprehension stage. |
| COMP-007 | same fact is fully explained in several sections without a distinct reasoning need | Fail one-home test. |
| COMP-008 | passage needs a second read because a causal connection is missing | Fail. Add the missing connection at the explanatory stage rather than surrounding it with more prose. |
| DOC-001 | long prose inventory/comparison could be represented more clearly as a supported table, matrix, before/after view, contract, or diagram | Flag at design-doc/evidence planning. Preserve prose where it carries causal reasoning or nuance. |
| PR-003 | upstream finding disappears from final review plan without disposition | Fail finding-disposition gate. |
| PR-004 | whole-PR concern anchored to an arbitrary nearby changed line | Fail. Move it to preamble/file-level communication. |
| PR-005 | inline comment states a verdict but not what the code does, why it matters, or requested change/decision | Fail comprehension gate. |
| PR-006 | blocking/important/optional/nit findings are emitted in arbitrary order without a reason | Fail communication plan. |

## Decision-relevance and compression fixtures

| ID | Fixture | Expected behavior |
| --- | --- | --- |
| PROV-001 | reader-facing prose says `24 in the decision map: 20 resolved, 4 closed out of scope, none open` | Fail intent-leak audit. Preserve map bookkeeping only as internal provenance if traceability requires it. |
| PROV-002 | generic `Decisions and scope` section primarily inventories how source decisions were resolved | Fail planning/intent audit. Replace with engineering-subject structure only when the underlying choices are material to approval. |
| COMPRESS-001 | design doc faithfully recounts every resolved design branch and edge case from the spec | Fail decision-load audit. Remove branches that do not materially affect understanding, tradeoffs, risk, compatibility, or approval. |
| COMPRESS-002 | every section is locally clear but the central design proposition is buried under exhaustive supporting detail | Fail comprehension audit for global cognitive load. |
| COMPRESS-003 | reviewer adaptation is mostly a reordered copy of the explanatory model | Fail reviewer adaptation. Classify required/supporting/upstream-only and materially select. |
| COMPRESS-004 | CTO variant is longer solely because the reviewer is code-near/senior | Fail unless the extra detail is decision-relevant. Existing reviewer context may justify greater compression. |
| COMPRESS-005 | compressed document omits a material alternative whose tradeoff could change approval | Fail source-fidelity audit as dangerous omission. |
| COMPRESS-006 | compressed document omits a material risk, compatibility concern, or unresolved evidence gap | Fail source-fidelity audit as dangerous omission. |
| COMPRESS-007 | document omits exploration chronology, ticket counts, non-material rejected branches, and source bookkeeping | Pass fidelity when the resulting artifact remains decision-sufficient. |

| DOC-COMPRESS-010 | human design doc teaches established platform mechanics at implementation-agent depth even though the decision depends only on the delta/dependency/risk | Fail decision-load audit. Retain only the mechanism needed to evaluate the design. |
| DOC-VISUAL-002 | compression removes supported C4/context, sequence, entity/data-model, or interface/contract diagrams and replaces them with longer prose | Fail design-doc/evidence planning. Restore the useful technical representation and shorten surrounding prose. |
| LANG-001 | reader prose uses conspicuously authored terms such as `load-bearing` or an unnecessary taxonomy such as `Lexical` where ordinary engineering language is clearer | Fail comprehension audit when context does not require the term. Prefer the concrete engineering term; do not enforce a banned-word list. |
| BBP-011 | title slide contains the three-part argument/map or decision request | Fail. The holding slide is inert; the story begins on the next slide. |
| BBP-012 | default and CTO runs generate different slide headlines, story maps, or visual languages from the same explanatory model | Fail. One canonical presentation tree serves all reviewer profiles. |
| BBP-013 | Standard or Deep regenerates/rewords a slide that also appears in Core | Fail. Shared slides are identical; longer variants only add canonical slides. |

| RENDER-002 | one malformed Mermaid block is rendered in a batch with valid sibling diagrams and causes the whole Mermaid pass to fail | Fail. Validate/render diagrams independently so the failing block is isolated and valid siblings still render. |
| RENDER-003 | generated HTML contains a Mermaid parser error, raw diagram source, error panel, or silently missing diagram but the package reports success | Fail package completion. Repair and rerender, or substitute a supported renderer without changing semantics. |
| DOC-VISUAL-003 | a design has decision-relevant context/boundary, runtime interaction, entity/data-model, or interface/contract relationships but evidence planning never considers visual/contract representations | Fail evidence planning. No numeric diagram quota; require explicit representation decisions for applicable relationship classes. |
| BBP-014 | notes say “now move to the next stop” after a long explanation/detail run, but the visible deck provides no landmark that re-establishes story position or why the next Anchor follows | Fail BBP orientation. Notes carry narration; slides still anchor audience and presenter at major transitions. |

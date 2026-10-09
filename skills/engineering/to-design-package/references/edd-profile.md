# Concise Design Brief / approval profile

Opt-in only. A Design Brief (also called an EDD, one-pager, or design proposal in some organizations) is a **decision-oriented content budget**, not a universal literal page count. Follow the organization's example where supplied, without copying its technical substance. Preserve readable typography.

## Review posture

Do not include a generic `Decision requested` or `Approval requested` section. Present the proposed design confidently for technical scrutiny. Identify explicit decisions only when a concrete unresolved choice requires the reviewer's authority; name the question rather than requesting blanket approval.

## Planning
- Reuse source-model, explanatory-model and design-doc-plan; classify decision surface, necessary understanding, and reference depth.
- Include problem, goals/non-goals, central architecture, affected subsystems, material alternatives/tradeoffs, risks, verification, rollout and genuine open decisions. Omit exhaustive source research and implementation inventory.
- Keep confirmed direction, proposed behavior, unverified code assumptions and undecided contracts distinct. Do not invent sign-off or delivery certainty.
- Compress by omitting non-decision-relevant branches, not by stripping causal explanation from essential mechanisms.
- Keep customer-fit gaps visible without silently changing product scope.
- If a detail is omitted from the EDD but answered in the spec, preserve its answer in a private trace, **not** as a newly invented open question.
- Render Markdown and HTML from the same semantics; run fidelity, comprehension, intent-leak and visual checks as appropriate.

## Outputs
- `approval/edd.md` and `approval/edd.html`, separate from the canonical design document.
- Private `approval/decision-trace.md`: EDD claim -> spec/source section -> rationale/evidence -> status -> reference-depth details omitted.

## Approval-readiness check
Can the reviewer understand the proposal, its boundaries, material tradeoffs, risks and any specific unresolved choice that actually requires reviewer authority? Can the engineer trace consequential claims back to the spec? Is every material unknown classified? A human must review before representing the artifact as approved.

## Regression example
The accepted Domains design brief included Domain-as-org, tenant-scoped identity, cross-Domain authorization, missing-org risk, admission/priority, retention and staged rollout. Its three-page length and headings are **not universal rules**. Its acceptance does not prove runtime behavior.

---
name: to-charting-brief
description: Prepare source-grounded Wayfinder charting briefs from mixed product, customer, transcript, and code evidence before mapping an implementable feature.
---

# to-charting-brief

## Contract
Produce a **Wayfinder charting brief**, not a map, spec, EDD, mockup, or implementation. For software engineering, the destination is an implementable capability: Wayfinder clears the map, /to-spec produces the spec, then downstream design artifacts, tickets and implementation follow. Ask only essential questions; handle messy inputs without requiring the engineer to pre-read every source.

## Process
1. Inventory raw and summarized sources: location, owner, date/version, role, limitations, and whether inspected. Summaries are interpretations, not verbatim proof; preserve accessible raw sources. Cite pages, sections, tickets or code paths.
2. Establish explicit **authority rules** for product intent, detailed specs, customer asks, engineering constraints, code observations and research. Follow user-provided precedence; never assume latest or most detailed automatically wins. Customer requests can expose fit risks without defining product shape.
3. Define destination, user-visible outcomes, backend/UI/SDK/operations scope, non-goals, hard constraints, compatibility, rollout, and success criteria. Keep documents and mockups downstream, not as destination.
4. Classify source claims: product decisions, requirements, observed code behavior, assumptions, recommendations, contradictions, unknowns and external dependencies. Do not claim approval.
5. Record contradictions with both sources, consequence, authority and disposition: resolved by authority, provisional, Wayfinder decision ticket, customer-fit risk or external decision. Do not silently reconcile.
6. Identify prior-art and code research, prototype candidates, security/integration risks and dependency order. A UI mockup cannot silently settle backend semantics. Do not present unperformed research as verified.
7. Evaluate feasibility separately: deadline, staffing, cross-cutting changes, critical path, unsafe-to-defer behavior and scope tensions. Design coherence does not establish delivery feasibility.
8. Establish map-clearing criteria: observable contracts, ownership/authorization, interfaces, invariants, failure behavior, migration, verification evidence and material open-decision disposition. Major recommendations must trace to code inspection, research, prototype evidence or stated constraints. Avoid premature class-level implementation plans.
9. Write `charting-brief.md`: destination, source ledger/authority, product shape, constraints, conflicts, customer-fit assessment, research/prototype priorities, open decisions, map-clearing criteria and Wayfinder handoff. Keep bulky excerpts in linked source logs.
10. Audit provenance, conflict preservation, source authority and destination. Flag uninspected material and consequential uncertainties.

## Boundary
Do not execute Wayfinder, invent product decisions, collapse customer asks into accepted requirements, or assert source inspection/approval not performed.

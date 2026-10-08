# to-charting-brief

Turn kickoff transcripts, AI summaries, PRD decks, API specifications, customer JIRA tickets and code observations into a **reliable Wayfinder charter** without manually reconciling all of them yourself.

## Use
```text
/to-charting-brief
Sources: kickoff-raw.txt, kickoff-summary.md, product-deck.pdf,
api-product-spec.pdf, customer-tickets.md.
CPO product direction controls product shape; customer tickets
are acceptance/fit evidence, not automatic design authority.
Backend and UI in scope. Destination: cleared map -> /to-spec.
```

Supply raw and summarized sources together; tell the skill what each is and who has authority. It inventories the evidence, identifies contradictions, preserves uncertainty and proposes research priorities. You can review the charter before /wayfinder.

## Output
`charting-brief.md` with source ledger, precedence, implementable destination, scope, contradictions, customer-fit matrix, feasibility risks, research questions and map-clearing criteria. Optional source log holds long excerpts. This skill does **not** generate a spec or decide architecture.

## Workflow
`to-charting-brief -> /wayfinder -> /to-spec -> to-design-package + to-design-briefing -> approval -> /to-tickets`

The spec is the normal engineering destination. EDDs and UI mockups are downstream artifacts or research evidence, not substitutes for it.

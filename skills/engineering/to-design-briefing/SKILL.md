---
name: to-design-briefing
description: Help an engineer understand, defend, and reconsider a researched design using its spec and source models before technical approval.
---

# to-design-briefing

## Contract
Interactive, private preparation for the engineer accountable for approval. Reuse the full spec, source-model, explanatory-model, research and decision records, plus the condensed Design Brief (EDD/one-pager). **A detail omitted from the Design Brief is not an unanswered design question.** Do not demand encyclopedic codebase familiarity or memorize generated scripts.

## Grounding
For each consequential question distinguish:
- **Specified:** upstream design gives a proposed or settled answer; cite its decision/evidence.
- **Unverified:** mechanism proposed but implementation paths/tests not yet verified.
- **Undecided:** actual open decision or product conflict with owner.
- **Unsupported:** source unavailable or insufficient.

Never confuse an unimplemented mechanism with an incomplete design. Do not invent gaps to challenge the engineer.

## Modes
### Understand
Explain a subsystem progressively: mental model, concrete scenario, ownership/authorization/invariants, failure behavior, tradeoffs and source pointer. Offer code detail only when it affects a consequential decision.

### Defend
Rehearse the few approval-critical questions for a reviewer. Ask one at a time when requested; listen to the engineer's own explanation, then provide concise source-backed feedback and an optional meeting-ready answer. Distinguish real uncertainty from omitted reference depth.

### Reconsider
Trace a challenged claim from the Design Brief through explanatory/source model to spec, map and research. Separate presentation omission, misconception, verification gap and genuine design flaw. Propose revision at the earliest owning stage; do not silently modify approved sources.

## Output
Conversation by default. On request, a private decision-defense sheet mapping question -> answer -> support -> status -> follow-up, or a revision queue. Keep rehearsal/reviewer strategy out of human-facing design documents.

## Completion
The engineer can explain the central architecture, reason through a novel cross-boundary/failure scenario, and identify true open decisions versus code-verification tasks; otherwise explicitly record gaps. Do not assert comprehension without interaction.

# to-design-briefing

A conversational companion for engineers who need to understand and defend a Wayfinder-derived design at approval time.

## Why
A concise Design Brief (sometimes called an EDD or one-pager) is a review surface, not the entire specification. The original design may already answer a question that the brief intentionally omits. This skill checks upstream evidence before declaring a gap.

## Modes and examples
```text
/to-design-briefing --mode=understand
Explain cross-Domain authorization from the spec, with an example.

/to-design-briefing --mode=defend
Rehearse CTO questions one at a time using the full design package.

/to-design-briefing --mode=reconsider
Trace the async-context concern back to the Wayfinder decision.
```
The mode syntax indicates intent; it is not a guaranteed CLI parser.

## Inputs and outputs
Prefer the spec, source/explanatory models, EDD and research evidence. Conversation by default; optional private study/decision-defense sheet. Does not rewrite upstream decisions without approval or require deep codebase memorization.

`to-design-package` creates review artifacts; `to-design-briefing` helps the engineer own and explain them.

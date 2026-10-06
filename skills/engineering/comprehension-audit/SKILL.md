---
name: comprehension-audit
description: "Audit reader-facing engineering content for cold-reader comprehension and generated-text failures. Use on design docs, slide decks, speaker notes, diagrams, PR preambles, and inline comments to catch premature concepts, broken narrative flow, unexplained abstractions, hidden causal steps, jargon, interpretation-heavy prose, and meta framing."
---

# comprehension-audit

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

Comprehension verification at sentence, section, and whole-artifact levels, plus defect routing.

## Process

1. Read the complete reader-facing artifact plus explanatory model and terminology.
2. Verify concept prerequisites appear before dependent concepts.
3. Look for missing problem -> mechanism -> consequence -> response links.
4. Apply the predictive test: after a mechanism is explained, could a competent cold reader derive the consequence?
5. Flag unexplained abstractions and specialist jargon when audience fluency is not established.
6. Flag passages that require a second read because a causal connection, referent, boundary, or prerequisite is missing.
7. Flag repeated full explanations of the same fact when one primary home plus a reference would be clearer.
8. Flag interpretation-heavy sentences, vague referents, rhetorical/meta headings, repetitive generated-text habits, and conspicuously authored vocabulary when ordinary engineering language would be clearer. Examples include clever metaphors, literary synonyms, unnecessary taxonomy, or abstract labels such as `load-bearing` where `required`, `critical`, or the concrete dependency says the same thing more directly. Judge by context, not a banned-word list.
9. Inspect diagrams, tables, labels, and captions for guessing burden.
10. Audit whole-artifact flow, not only local prose.
11. Emit findings with owning stage.
12. Return PASS only when no blocking comprehension findings remain.

## Decision-load checks

Comprehension includes deciding what the reader should not have to consume.

For reader-facing approval/review artifacts:

- flag sections or detail that do not materially help the reader understand, evaluate, challenge, or decide;
- flag exploration history and source-process bookkeeping that survived without decision value;
- flag documents whose central design proposition is obscured by exhaustive treatment of peripheral truths;
- distinguish useful depth from completeness-for-its-own-sake;
- do not demand removal of material tradeoffs, risks, compatibility concerns, or uncertainty merely to shorten the artifact.

A locally clear document can still fail globally if the reader must absorb too much non-material information before reaching a decision.

## Artifact-level checks

### Design documents

- A cold reader gets a usable system/problem mental model early.
- A known expert is not retaught established platform behavior unless it is changed, relied upon in a non-obvious way, or creates a material consequence or risk.
- Prose is terse enough for a human design decision; implementation-complete explanatory detail remains upstream.
- Sections follow conceptual dependencies rather than source order.
- Long prose runs are flagged when a supported table, diagram, matrix, contract, or before/after representation would materially reduce reconstruction work.
- Structured representations do not replace necessary causal reasoning.
- Every major section earns its place by serving the review/approval decision.
- The document presents the resulting design rather than replaying the source's exploration history.
- The central proposition, material mechanism, tradeoffs, risks, and decision request remain prominent relative to supporting detail.

### BBP presentations

- A proper holding/title slide exists before the story and remains intentionally inert: subject/context only, with no argument, map, or decision request.
- Read only the slide headlines in order; they must form a coherent progressive story.
- Opening slides establish subject, relevance, challenge/current state, desired state, and direction before detailed solution mechanics.
- No slide depends on terminology or a concept introduced later.
- Visual and verbal channels complement one another.
- Speaker notes carry spoken reasoning and collectively form a usable rehearsal script.
- One canonical slide tree underlies all duration/depth variants; shared slides are identical and longer variants add slides rather than regenerating the story.
- Reviewer knowledge may alter note guidance but does not create a separate presentation narrative or visual language.

### PR communication

- The preamble supplies the PR mental model.
- Each inline comment can be understood locally without reconstructing the entire investigation.
- The comment explains the observed code behavior or issue, why it matters, and the requested action or decision when one is appropriate.

## Important distinction

Source terms are not banned words. Terms such as `denominator`, `seam`, or `substrate` may be legitimate source vocabulary. Flag them only when reader-facing use assumes a mental model the audience has not been given.

## Do not

Do not maintain a simplistic banned-word list or silently rewrite final prose.

## Completion gate

Before returning, verify local comprehension, whole-artifact progression, and decision-relevant cognitive load. Report unresolved defects with the earliest owning stage.

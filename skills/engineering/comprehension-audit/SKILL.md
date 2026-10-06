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
8. Flag interpretation-heavy sentences, vague referents, rhetorical/meta headings, and repetitive generated-text habits.
9. Inspect diagrams, tables, labels, and captions for guessing burden.
10. Audit whole-artifact flow, not only local prose.
11. Emit findings with owning stage.
12. Return PASS only when no blocking comprehension findings remain.

## Artifact-level checks

### Design documents

- A cold reader gets a usable system/problem mental model early.
- Sections follow conceptual dependencies rather than source order.
- Long prose runs are flagged when a supported table, diagram, matrix, contract, or before/after representation would materially reduce reconstruction work.
- Structured representations do not replace necessary causal reasoning.

### BBB presentations

- A proper title slide exists.
- Read only the slide headlines in order; they must form a coherent progressive story.
- Opening slides establish subject, relevance, challenge/current state, desired state, and direction before detailed solution mechanics.
- No slide depends on terminology or a concept introduced later.
- Visual and verbal channels complement one another.
- Speaker notes carry spoken reasoning and collectively form a usable rehearsal script.

### PR communication

- The preamble supplies the PR mental model.
- Each inline comment can be understood locally without reconstructing the entire investigation.
- The comment explains the observed code behavior or issue, why it matters, and the requested action or decision when one is appropriate.

## Important distinction

Source terms are not banned words. Terms such as `denominator`, `seam`, or `substrate` may be legitimate source vocabulary. Flag them only when reader-facing use assumes a mental model the audience has not been given.

## Do not

Do not maintain a simplistic banned-word list or silently rewrite final prose.

## Completion gate

Before returning, verify both local comprehension and whole-artifact progression. Report unresolved defects with the earliest owning stage.

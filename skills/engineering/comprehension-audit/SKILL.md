---
name: comprehension-audit
description: "Audit reader-facing engineering content for cold-reader comprehension and generated-text failures. Use on design docs, slides, speaker notes, diagrams, PR preambles, and inline comments to catch premature concepts, unexplained abstractions, hidden causal steps, jargon, interpretation-heavy prose, and meta framing."
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

Comprehension verification and defect routing.

## Process

1. Read the reader-facing artifact plus explanatory model and terminology.
2. Verify concept prerequisites appear before dependent concepts.
3. Look for missing problem -> consequence -> response links.
4. Flag unexplained abstractions and specialist jargon when audience fluency is not established.
5. Flag interpretation-heavy sentences and vague referents.
6. Flag rhetorical/meta headings and repetitive generated-text habits.
7. Inspect diagram labels and captions for guessing burden.
8. Emit findings with owning stage.
9. Return PASS only when no blocking comprehension findings remain.

## Important distinction

Source terms are not banned words. Terms such as `denominator`, `seam`, or `substrate` may be legitimate source vocabulary. Flag them only when reader-facing use assumes a mental model the audience has not been given.

## Do not

Do not maintain a simplistic banned-word list or silently rewrite final prose.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

---
name: bbb-story-plan
description: "Plan a Beyond Bullet Points style engineering presentation from an explanatory model. Use for visual-first technical presentations where the audience must encounter the topic and pain before the solution, with progressive disclosure and speaker notes that form a rehearsal script."
---

# bbb-story-plan

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

Presentation narrative, progressive disclosure, slide purpose, terminology order, and speaker-note purpose.

## Process

1. Establish the audience's starting mental model.
2. Open with topic/context and concrete pain before the solution.
3. Sequence pressures and concepts using explanatory dependencies.
4. Reveal the solution only after the problem is legible.
5. Prefer a visual purpose for each slide; move explanatory prose into notes.
6. Define terminology introduction order.
7. Define speaker-note purpose and transitions.
8. End with implications or next step.
9. Write `bbb-story-plan.md`.

## Output

For each slide: purpose, audience question, headline, visual idea, concepts introduced, speaker-note purpose, and transition. Also include a deck-level terminology/progressive-disclosure map.

## Do not

Do not compress design-doc headings into slides, start in the middle of the argument, reveal the solution before the problem, or overload slides with prose.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

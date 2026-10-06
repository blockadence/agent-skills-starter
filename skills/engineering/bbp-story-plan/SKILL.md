---
name: bbp-story-plan
description: "Plan a Beyond Bullet Points (BBP) style engineering presentation from an explanatory model. Use for visual-first technical presentations that need a coherent title-to-resolution story, progressive disclosure, complementary visuals, and speaker notes that form a rehearsal script."
---

# bbp-story-plan

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

Presentation narrative, title-to-resolution sequence, progressive disclosure, slide purpose, terminology order, visual/verbal channel planning, and speaker-note purpose.

## Process

1. Establish the audience's starting mental model and the review or decision task.
2. Create a proper title slide that names the engineering subject. Do not use an argumentative question or a mid-story claim as the title slide.
3. Plan the opening story before the technical body. Adapt the BBP Act I functions to engineering communication:
   - **Hook:** establish the subject and why this discussion exists.
   - **Relevance:** connect the subject to the audience's concrete responsibility, system, or decision.
   - **Challenge/current state:** make the present problem or constraint legible.
   - **Desired state:** establish what better looks like without prematurely explaining the full solution.
   - **Map/direction:** orient the audience to the path the presentation will take.
4. Sequence the technical body by explanatory dependency. Introduce mechanism before consequences that depend on it.
5. Reveal solution details only after the problem and desired state are understandable.
6. Give every substantive slide one primary audience question and one primary conclusion.
7. Plan the verbal and visual channels together:
   - the headline carries the story thread;
   - the visual makes the slide's main relationship, mechanism, comparison, or evidence easier to grasp;
   - speaker notes carry the spoken explanation, nuance, transitions, and evidence that should not crowd the slide.
8. Prefer a meaningful visual over prose when a relationship, sequence, comparison, state change, boundary, population, or mechanism can be understood faster visually. Do not add decorative visuals merely to satisfy this rule.
9. Define terminology introduction order and ensure no slide depends on a term or concept introduced later.
10. End with the engineering resolution: implications, decision, validation needed, or next step.
11. Write `bbp-story-plan.md`.

## Headline-story test

Read only the title slide and subsequent slide headlines, in order.

They must form a coherent progressive argument for a cold member of the intended audience. A sequence of individually good headlines that does not tell a comprehensible story fails.

The sequence must not:

- begin in the middle of an argument;
- assume a problem that has not been established;
- reveal detailed solution mechanics before the audience understands the challenge;
- introduce a concept before its prerequisite;
- jump between organizational/customer pain and implementation detail without a bridge;
- end without resolving what the audience should understand, decide, validate, or do.

## Output

For each slide record:

- slide role in the narrative;
- audience question;
- headline;
- primary conclusion;
- visual idea and why it helps;
- concepts introduced;
- speaker-note purpose;
- transition from the prior slide and into the next.

Also include:

- title-slide plan;
- deck-level story thread;
- headline-only sequence;
- terminology/progressive-disclosure map;
- visual/verbal channel plan.

## Do not

Do not compress design-doc headings into slides. Do not omit a proper title slide. Do not start in the middle of the argument. Do not reveal solution mechanics before the problem is legible. Do not overload slides with prose. Do not treat speaker notes as optional leftovers. Do not force a theatrical or sales framing when the engineering audience needs a direct technical story.

## Completion gate

Before returning:

1. run the headline-story test;
2. verify the title slide exists;
3. verify every dependent concept appears after its prerequisite;
4. verify each substantive slide has a visual purpose or an explicit reason prose/code is the better representation;
5. verify speaker notes collectively form a usable rehearsal script.

Report unresolved defects with the earliest owning stage.

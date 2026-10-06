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
- The canonical presentation story derives from the shared explanatory model, not from reviewer adaptation. Reviewer knowledge may affect speaker-note guidance, never create a different slide story or visual language.
- Keep reviewer classification, persuasion strategy, generation mechanics, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.

## Owns

Presentation narrative, title-to-resolution sequence, hierarchical progressive disclosure, BBP story depth, slide purpose, terminology order, visual hierarchy/orientation, visual/verbal channel planning, and speaker-note purpose.

## Process

1. Establish the shared engineering subject and review or decision task from the explanatory model. Do not create a new narrative spine for each reviewer profile.
2. Create a **holding/title slide** before the story begins. It exists to remain on screen while the audience gathers. Keep it intentionally inert: engineering subject, optional short subtitle/context, and optional presenter/team/date. Do not put the argument, story map, decision request, three-part thesis, or other narrative content on it. The holding slide does not consume one of the opening story functions.
3. Plan the opening story before the technical body. Adapt the BBP Act I functions to engineering communication:
   - **Hook:** establish the subject and why this discussion exists.
   - **Relevance:** connect the subject to the audience's concrete responsibility, system, or decision.
   - **Challenge/current state:** make the present problem or constraint legible.
   - **Desired state:** establish what better looks like without prematurely explaining the full solution.
   - **Map/direction:** orient the audience to the path the presentation will take.
4. Build the technical body as a BBP-style story hierarchy rather than a flat slide sequence:
   - **Core / Anchor level:** the few ideas that are the presentation if time is severely constrained;
   - **Explanation level:** the reasoning needed to understand and evaluate each Anchor;
   - **Detail level:** supporting mechanism, evidence, examples, edge cases, and qualification needed for deeper review.
   Prefer roughly three siblings at a major narrative level as the BBP Rule of Three heuristic. Do not invent, merge, or omit substantive concepts merely to hit three.
5. Plan sibling duration/depth variants from one canonical slide tree. Treat BBP's approximately 5-, 15-, and 45-minute versions as useful planning lenses, not clock contracts:
   - **Core view:** title/opening plus Anchors and resolution;
   - **Standard view:** Core plus the material Explanations;
   - **Deep view:** Standard plus decision-relevant Details.
   A real presentation may be 15, 30, 45, 60, or another duration. Preserve the information-priority hierarchy rather than forcing exact timings. A slide included in more than one variant is the **same canonical slide**: same headline, content, visual treatment, and narrative position. Variants select slides; they do not regenerate or rewrite them.
6. Require story inheritance: every longer view expands the shorter view. It must not replace its thesis, reorder the causal spine into a different story, or depend on Details to make an Anchor intelligible.
7. Sequence each depth by explanatory dependency. Introduce mechanism before consequences that depend on it.
8. Reveal solution details only after the problem and desired state are understandable.
9. Give every substantive slide one primary audience question and one primary conclusion.
10. Plan the verbal and visual channels together:
   - the headline carries the story thread;
   - the visual makes the slide's main relationship, mechanism, comparison, or evidence easier to grasp;
   - speaker notes carry the spoken explanation, nuance, transitions, evidence, and optional audience-aware delivery guidance that should not crowd or fork the slide.
   - layout and visual treatment communicate story level and orientation, not decoration alone.
   - Anchor, Explanation, and Detail slides must be visually distinguishable without reader-facing labels such as "Anchor slide" or "Detail slide".
   - reuse visual motifs from the map and prior Anchors so the audience can recognize where the current slide belongs in the larger story.
11. Prefer a meaningful visual over prose when a relationship, sequence, comparison, state change, boundary, population, or mechanism can be understood faster visually. Do not add decorative visuals merely to satisfy this rule.
12. Define terminology introduction order and ensure no slide depends on a term or concept introduced later.
13. End with the engineering resolution: implications, decision, validation needed, or next step.
14. Write `bbp-story-plan.md`.

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

- holding/title-slide plan;
- explicit canonical Anchor → Explanation → Detail story tree;
- Core / Standard / Deep sibling slide selections with approximate presentation depth, not mandatory durations;
- stable slide identities so shared slides are identical across depth variants;
- Rule-of-Three deviations and why the subject's natural structure warrants them;
- visual hierarchy/layout system for Anchor, Explanation, and Detail levels;
- map-to-Anchor visual continuity plan;
- deck-level story thread;
- headline-only sequence;
- terminology/progressive-disclosure map;
- visual/verbal channel plan.

## Do not

Do not generate independent audience-specific decks from reviewer adaptations. Do not rewrite shared slides between duration variants. Do not flatten the technical body into a sequence of peer slides. Do not force exact 5/15/45-minute durations or exact groups of three when the subject does not fit. Do not use identical visual hierarchy for every story level and rely on a small kicker alone for orientation. Do not compress design-doc headings into slides. Do not omit a proper title slide. Do not start in the middle of the argument. Do not reveal solution mechanics before the problem is legible. Do not overload slides with prose. Do not treat speaker notes as optional leftovers. Do not force a theatrical or sales framing when the engineering audience needs a direct technical story.

## Completion gate

Before returning:

1. run the headline-story test;
2. verify the holding/title slide exists and contains no story argument or map;
3. verify every dependent concept appears after its prerequisite;
4. verify each substantive slide has a visual purpose or an explicit reason prose/code is the better representation;
5. verify the Core view stands alone as a coherent story;
6. verify Standard expands Core and Deep expands Standard by selecting additional canonical slides rather than rewriting shared slides;
7. verify the Rule of Three was used as a prioritization heuristic rather than a quota;
8. verify story levels are visually distinguishable and recurring motifs preserve orientation;
9. verify speaker notes collectively form a usable rehearsal script.

Report unresolved defects with the earliest owning stage.

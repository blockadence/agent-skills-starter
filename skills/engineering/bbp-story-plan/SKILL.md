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
5. Author and validate the **Deep view as the canonical fixed point**: the complete decision-relevant slide tree, including Anchors, Explanations, and Details. Assign every canonical slide a stable identity, narrative role, and depth membership once.
6. Derive sibling duration/depth variants as deterministic projections of that canonical tree. Treat BBP's approximately 5-, 15-, and 45-minute versions as useful planning lenses, not clock contracts:
   - **Core view (approximately 5 minutes):** holding/opening plus the minimum Anchors and resolution needed for a coherent story;
   - **Standard view (approximately 15 minutes):** Core plus the material Explanations;
   - **Deep view (approximately 45 minutes):** the canonical fixed point, including decision-relevant Details.
   A real presentation may run longer or shorter. Preserve the information-priority hierarchy rather than forcing exact timings. Once slide identity and membership are recorded, variant construction is mechanical: select canonical slides by membership while preserving canonical order. A shared slide has the same identity, headline, content, visual treatment, notes, and narrative position in every view. Variants do not regenerate, rewrite, or independently reorder slides.
7. Require story inheritance: Standard is a strict superset/projection of Core and Deep is a strict superset/projection of Standard unless the canonical story genuinely needs no additional slide at that depth. A longer view must not replace the thesis, reorder the causal spine into a different story, or depend on Details to make an Anchor intelligible.
7. Sequence each depth by explanatory dependency. Introduce mechanism before consequences that depend on it.
8. Reveal solution details only after the problem and desired state are understandable.
9. Give every substantive slide one primary audience question and one primary conclusion.
10. Plan the verbal and visual channels together:
   - the headline carries the story thread;
   - the visual makes the slide's main relationship, mechanism, comparison, or evidence easier to grasp;
   - speaker notes carry the spoken explanation, nuance, transitions, evidence, and optional audience-aware delivery guidance that should not crowd or fork the slide.
   - layout and visual treatment communicate story level and orientation, not decoration alone.
   - Anchor, Explanation, and Detail slides must be visually distinguishable without reader-facing labels such as "Anchor slide" or "Detail slide".
   - reuse visual motifs from the map and prior Anchors so the audience can recognize where the current slide belongs in the larger story;
   - treat orientation as a navigation contract for both audience and presenter: at every major story transition, the visible slide should make clear **where we are, what was just established, and why the next part follows**.
11. Prefer a meaningful visual over prose when a relationship, sequence, comparison, state change, boundary, population, or mechanism can be understood faster visually. Do not add decorative visuals merely to satisfy this rule.
12. Define terminology introduction order and ensure no slide depends on a term or concept introduced later.
13. Plan major transitions explicitly. Do not rely only on speaker-note prose to bridge long runs of Explanation/Detail slides into the next Anchor. Use the next Anchor itself, a brief return-to-map/section transition, or another recurring visual landmark to re-establish the route. Dedicated transition slides are optional; orientation is mandatory.
14. End with the engineering resolution: implications, decision, validation needed, or next step.
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
- the Deep canonical slide inventory with stable slide identities, narrative roles, canonical order, and explicit Core / Standard / Deep membership;
- deterministic Core / Standard projections from that inventory, corresponding approximately to 5- and 15-minute views while Deep corresponds approximately to 45 minutes;
- stable slide identities so shared slides, including their notes, are identical across depth variants;
- Rule-of-Three deviations and why the subject's natural structure warrants them;
- visual hierarchy/layout system for Anchor, Explanation, and Detail levels;
- map-to-Anchor visual continuity plan;
- major-transition/orientation plan stating the prior conclusion, current story position, and reason for the next Anchor;
- deck-level story thread;
- headline-only sequence;
- terminology/progressive-disclosure map;
- visual/verbal channel plan.

## Do not

Do not generate independent audience-specific decks from reviewer adaptations. Do not generate Core or Standard independently from Deep. Do not rewrite shared slides between duration variants. Do not flatten the technical body into a sequence of peer slides. Do not force exact 5/15/45-minute durations or exact groups of three when the subject does not fit. Do not use identical visual hierarchy for every story level and rely on a small kicker alone for orientation. Do not compress design-doc headings into slides. Do not omit a proper title slide. Do not start in the middle of the argument. Do not reveal solution mechanics before the problem is legible. Do not overload slides with prose. Do not treat speaker notes as optional leftovers. Do not force a theatrical or sales framing when the engineering audience needs a direct technical story.

## Completion gate

Before returning:

1. run the headline-story test;
2. verify the holding/title slide exists and contains no story argument or map;
3. verify every dependent concept appears after its prerequisite;
4. verify each substantive slide has a visual purpose or an explicit reason prose/code is the better representation;
5. verify the Core view stands alone as a coherent story;
6. verify Deep is the canonical fixed point and Core / Standard are deterministic membership projections from it;
7. verify Core ⊆ Standard ⊆ Deep by stable slide identity and canonical order, and verify every shared slide and its notes are byte-for-byte semantically identical across views;
8. verify the Rule of Three was used as a prioritization heuristic rather than a quota;
9. verify story levels are visually distinguishable and recurring motifs preserve orientation;
10. at every major Anchor transition, verify the visible deck itself tells audience and presenter where they are and why the next Anchor follows; do not count a notes-only transition as sufficient;
11. verify speaker notes collectively form a usable rehearsal script.

Report unresolved defects with the earliest owning stage.

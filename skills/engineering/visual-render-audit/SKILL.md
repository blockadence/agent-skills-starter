---
name: visual-render-audit
description: "Audit rendered engineering diagrams for geometry and readability. Use after rendering C4, UML, ER, sequence, state, activity, deployment, or custom explanatory visuals to catch edge-label collisions, text crossings, ambiguous containment, bad wrapping, poor scan direction, and loss of canonical recognizability."
---

# visual-render-audit

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

Rendered-geometry and readability verification.

## Process

1. Inspect the rendered SVG or image, not only its source. If the renderer produced a parser/syntax error, raw source, error panel, or no visual, return FAIL immediately and route the defect to rendering/diagram generation.
2. Check reserved geometry: frame/container headers, node titles, body labels, edge labels, legends, annotations, and diagram titles.
3. Reject edge/text and label/header collisions.
4. Check crossings, containment, wrapping, whitespace, hierarchy, and reading direction.
5. Check visual grammar against the planned semantics:
   - same semantic kinds use consistent visual treatment;
   - proximity/whitespace communicates intended grouping;
   - enclosure/common region matches actual containment or bounded responsibility;
   - relationship labels are readable and unambiguous where needed;
   - hierarchy and sequence have an obvious scan path;
   - contrast has a semantic purpose rather than decorative use;
   - color is not the sole carrier of critical meaning;
   - quantitative graphics do not use area/angle/decorative encodings when position or length would communicate magnitude more accurately.
6. Check canonical notation remains recognizable and that a familiar representation was not replaced by a novel infographic that increases interpretation cost.
7. For syntax/render failures, repair in this order: smallest syntax-safe correction; target-runtime-compatible equivalent syntax; renderer substitution; semantic simplification last. For geometry/readability failures, repair in this order: padding/clearance; direction/ordering; routing/layout algorithm; invisible constraints; renderer substitution; semantic simplification last.
8. Return PASS or FAIL.

## Do not

Do not default to document-specific hand-tuned coordinates or change semantic meaning to fix a layout problem before layout remedies are exhausted.

## Completion gate

Before returning, verify this skill's output contract, including semantic consistency of visual grouping, hierarchy, relationship labels, scan direction, contrast, and quantitative encoding where applicable. Report unresolved defects with the earliest owning stage.

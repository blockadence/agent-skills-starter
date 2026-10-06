---
name: to-design-package
description: "Orchestrate or resume a production engineering design package from a Wayfinder spec, rigorous engineering specification, or preserved pipeline checkpoint. Use for design documents, BBB-style technical presentations, speaker notes, polished HTML renderings, or downstream regeneration after a specific completed stage."
---

# to-design-package

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

Workflow orchestration, checkpoint/resume behavior, sibling-output consistency, defect routing, and stopping conditions. Leaf skills own their individual transformations.

## Full pipeline

1. Require and read the complete spec.
2. Run `source-model`.
3. Run `explanatory-model`.
4. Apply optional `reviewer-adapt`.
5. Fork from the explanatory model:
   - design doc: `design-doc-plan` -> `design-evidence-plan` -> compose Markdown;
   - presentation: `bbb-story-plan` -> evidence/visual planning as needed -> compose HTML slides plus Markdown speaker notes.
6. Run `source-fidelity-audit`, `comprehension-audit`, and `intent-leak-audit` on semantic artifacts.
7. Run `render-html-document` for Markdown reader artifacts that require polished HTML representations, including the design document and speaker notes by default for a complete package.
8. Run `visual-render-audit` for rendered artifacts when visual inspection is available.
9. Route blocking defects to the earliest owning stage and regenerate only that stage and affected downstream artifacts.
10. Preserve inspectable intermediate artifacts.
11. Stop only when blocking gates pass or an unresolved source problem is explicitly reported.

## Checkpoints and resume

Preserved intermediate and final artifacts are valid workflow checkpoints. Do not repeat an upstream stage merely because this wrapper was invoked again.

When the user asks to resume, regenerate, rerender, or continue from existing artifacts:

1. Identify the earliest stage required by the requested change.
2. Verify the artifacts required by that stage exist and are readable.
3. Treat those artifacts as authoritative checkpoint inputs for downstream work.
4. Run only the requested stage and stages that depend on its changed output.
5. Do not reread the original spec or rebuild semantic models unless the requested operation depends on them or checkpoint validation exposes a missing/inconsistent prerequisite.
6. Report which checkpoint was used and which stages were skipped.

The user may optionally specify `--from=<stage>` to make the checkpoint explicit. Supported conceptual stages are:

- `source-model`
- `explanatory-model`
- `reviewer-adapt`
- `design-doc-plan`
- `design-evidence-plan`
- `bbb-story-plan`
- `compose`
- `audit`
- `render-html`
- `visual-audit`

Treat `--from` as a workflow composition hint, not a reason to invent a larger CLI. Validate that the inputs required by the named stage exist. If they do not, stop and identify the missing checkpoint rather than silently rerunning the entire pipeline.

### Rendering-only resume

If Markdown design and speaker-note artifacts already exist and the user only wants their HTML representations, resume at `render-html`.

Example:

```text
/to-design-package --from=render-html design-doc.md speaker-notes.md
```

Equivalent natural-language invocation:

```text
Resume to-design-package at HTML rendering using design-doc.md and speaker-notes.md.
Do not regenerate upstream artifacts.
```

This path runs `render-html-document` for the supplied Markdown artifacts and then rendered visual QA when available. It does not rerun source modeling, explanation, reviewer adaptation, design planning, BBB story planning, composition, or semantic audits unless the user explicitly asks.

## Output

A complete package normally includes:

- editable Markdown design document;
- polished navigable HTML design document;
- BBB HTML slide deck;
- editable Markdown per-slide speaker notes/rehearsal script;
- polished navigable HTML speaker notes;
- requested intermediate semantic/planning artifacts;
- audit reports.

Sibling outputs must agree on technical truth. HTML representations derive from their Markdown source and do not become independent semantic sources.

## Do not

Do not collapse the pipeline into one giant prompt. Do not use the design doc as the source for the slide deck. Do not patch only final rendering when an upstream stage owns the defect. Do not rerun valid upstream checkpoints when the requested work is downstream-only.

## Completion gate

Before returning, verify this skill's output contract. For resumed runs, also report the checkpoint used, skipped upstream stages, regenerated outputs, and unresolved defects with the earliest owning stage.

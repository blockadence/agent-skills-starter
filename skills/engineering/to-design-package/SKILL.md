---
name: to-design-package
description: "Orchestrate or resume a production engineering design package from a Wayfinder spec, rigorous engineering specification, or preserved pipeline checkpoint. Use for design documents, BBP-style technical presentations, speaker notes, polished HTML renderings, reviewer-specific variants, or downstream regeneration after a specific completed stage."
---

# to-design-package

## Composition contract

This skill follows the repository composition rules.

- Explicit user instructions have highest precedence.
- Preserve source truth, uncertainty, terminology, and decision status.
- Do not invent implementation detail to make an artifact look complete.
- Reviewer adaptation may change emphasis, order, evidence density, code-nearness, and reader-facing inclusion, never facts.
- Fidelity preserves truth, not volume. Reader-facing artifacts should be decision-sufficient rather than source-exhaustive.
- Keep source-process bookkeeping and exploration history out of reader-facing artifacts unless the process itself is materially part of the engineering decision.
- Keep reviewer classification, persuasion strategy, generation mechanics, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.
- AI authorship is permitted. Generated artifacts remain drafts until a human reviews them; never represent generated content as human-reviewed, approved, or final before that review occurs.

## Owns

Workflow orchestration, checkpoint/resume behavior, reviewer-variant branching, sibling-output consistency, defect routing, and stopping conditions. Leaf skills own their individual transformations.

## Full pipeline

1. Require and read the complete spec.
2. Run `source-model`.
3. Run `explanatory-model`.
4. Fork by artifact responsibility:
   - design doc: apply optional `reviewer-adapt`, then `design-doc-plan` -> `design-evidence-plan` -> compose Markdown. Composition consumes those plans as contracts: preserve disclosure classification, section purpose, proposition grammar, and selected representations rather than re-expanding reference-depth material or re-deciding evidence;
   - presentation: branch directly from the shared `explanatory-model`, then `bbp-story-plan` -> evidence/visual planning as needed -> compose one canonical HTML slide tree plus Markdown speaker notes and sibling depth/duration selections. Reviewer profiles may add delivery guidance to notes but do not create independent slide stories.
6. Run `source-fidelity-audit`, `comprehension-audit`, and `intent-leak-audit` on semantic artifacts.
7. Run `render-html-document` for Markdown reader artifacts that require polished HTML representations, including the design document and speaker notes by default for a complete package.
8. Run `visual-render-audit` for rendered artifacts when visual inspection is available.
9. Route blocking defects to the earliest owning stage and regenerate that stage and every affected downstream stage.
10. Preserve inspectable intermediate artifacts.
11. Stop only when the requested final outputs have been produced and blocking gates pass, or an unresolved source problem is explicitly reported.

## Package topology

The package has one shared semantic root, one canonical presentation branch, and zero or more reviewer-specific design-document branches.

Everything before reviewer adaptation is shared because it represents common source truth. The canonical presentation also remains shared and derives from the explanatory model. Reviewer adaptation branches the design document and may contribute optional audience-aware speaker-note guidance, but it does not fork slide content or visual structure.

Use this topology:

```text
design-package/
  source/
    source-model.md
    explanatory-model.md
    ...other shared source/evidence artifacts
  presentation/
    bbp-story-plan.md
    slides.html
    speaker-notes.md
    speaker-notes.html
    ...depth selections / audits
  default/
    ...design-doc planning artifacts
    design-doc.md
    design-doc.html
    audits/
  cto/
    review-adaptation.md
    ...design-doc planning artifacts
    design-doc.md
    design-doc.html
    audits/
  adversarial/
    review-adaptation.md
    ...design-doc planning artifacts
    design-doc.md
    design-doc.html
    audits/
```

The original specification remains an external source input unless the user asks to copy it into the package. Shared generated artifacts may reference that source input using a stable path appropriate to the repository.

`source/explanatory-model.md` is the normal reviewer branch point. All reviewer variants derived from it must share the same technical truth and decision status.

Do not duplicate `source-model.md` or `explanatory-model.md` inside reviewer branches. Do not make one reviewer branch depend semantically on another reviewer branch.

The default design document is the unprofiled/default ENGINEERING branch. Explicit reviewer profiles create sibling design-document branches from the shared explanatory model. The presentation is canonical and shared across those branches.

## Checkpoints and resume

Preserved intermediate and final artifacts are valid workflow checkpoints. Do not repeat an upstream stage merely because this wrapper was invoked again.

`--from=<stage>` means **start execution at this stage and continue through every downstream stage required to produce the requested final package**. It does not mean run only that stage.

When the user asks to resume, regenerate, rerender, or continue from existing artifacts:

1. Identify the earliest stage required by the requested change.
2. Verify the artifacts required by that stage exist and are readable.
3. Treat those artifacts as authoritative checkpoint inputs for downstream work.
4. Execute the selected stage.
5. Continue through every downstream stage affected by its output until the requested final artifacts and audits are complete.
6. Skip unaffected stages before the selected checkpoint.
7. Do not reread the original spec or rebuild earlier semantic models unless the requested operation depends on them or checkpoint validation exposes a missing/inconsistent prerequisite.
8. Report which checkpoint was used, which upstream stages were skipped, and which downstream stages ran.

If the user wants only a leaf-stage artifact, invoke that leaf skill directly rather than using `to-design-package`.

Supported conceptual `--from` stages are:

- `source-model`
- `explanatory-model`
- `reviewer-adapt`
- `design-doc-plan`
- `design-evidence-plan`
- `bbp-story-plan`
- `compose`
- `audit`
- `render-html`
- `visual-audit`

Validate that the inputs required by the named stage exist. If they do not, stop and identify the missing checkpoint rather than silently rerunning the entire pipeline.

## Reviewer variants

The optional `--reviewer=<profile>` parameter selects a reviewer adaptation. It is meaningful when the run includes `reviewer-adapt`, including a resume from that stage.

Known profiles may include `collaborator`, `cto`, and `adversarial`. Resolve the requested profile through the installed reviewer profile/adaptation machinery rather than exposing the private classification inside reader-facing prose.

Examples:

```text
/to-design-package --from=reviewer-adapt --reviewer=cto
```

```text
/to-design-package --from=reviewer-adapt --reviewer=adversarial
```

A reviewer variant is a complete downstream **design-document** package, not merely `review-adaptation.md`. The adaptation artifact is the branch checkpoint. Continue from it through design-doc planning, composition, semantic audits, HTML rendering, and visual QA. Reuse the canonical presentation; do not regenerate slides for the reviewer.

Reviewer design-document variants must preserve technical truth and decision status while allowing materially different information architecture, emphasis, evidence density, code-nearness, risk treatment, and explanatory connective tissue. Presentation slides remain invariant; audience-aware delivery differences belong in speaker notes.

### Variant output isolation

Never overwrite another reviewer variant, the default package, or shared source artifacts when creating a downstream reviewer branch.

Write shared pre-adaptation artifacts once under `design-package/source/`. Write each explicit reviewer variant under a stable sibling namespace, for example:

```text
design-package/
  source/
    source-model.md
    explanatory-model.md
  presentation/
    slides.html
    speaker-notes.md
    speaker-notes.html
  default/
    design-doc.md
    design-doc.html
  cto/
    review-adaptation.md
    design-doc.md
    design-doc.html
  adversarial/
    review-adaptation.md
    design-doc.md
    design-doc.html
```

Intermediate planning artifacts and audit reports for a variant belong in that variant's namespace as well.

## Rendering-only resume

If Markdown design and speaker-note artifacts already exist and the user only wants their HTML representations, resume at `render-html`.

```text
/to-design-package --from=render-html design-doc.md speaker-notes.md
```

This path runs `render-html-document` for the supplied Markdown artifacts and then rendered visual QA when available. Because the requested final outputs are the HTML representations, it does not rerun source modeling, explanation, reviewer adaptation, planning, composition, or semantic audits unless explicitly requested.

## Human review boundary

The workflow exists to produce AI-authored engineering artifacts that humans can understand and review.

Do not enforce a blanket source constraint that says AI may not draft design-document prose or reasoning. If such a constraint appears in the source fixture, interpret the intended process requirement as human review before presentation as reviewed or approved work, unless the user explicitly instructs otherwise.

Human review is the authority boundary:

- generation and reasoning may be AI-assisted;
- generated artifacts are drafts;
- a human must review them before they are represented as human-reviewed, approved, or final;
- do not leak internal deliberation about this boundary into normal reader-facing artifacts or wrapper completion prose.

## Output

A complete package normally includes:

- editable Markdown design document;
- polished navigable HTML design document;
- BBP HTML slide deck;
- editable Markdown per-slide speaker notes/rehearsal script;
- polished navigable HTML speaker notes;
- requested intermediate semantic/planning artifacts;
- audit reports.

Design-document composition must follow the approved plan's Decision / Understanding / Reference-depth classification. Reference-depth material does not return to the main narrative merely because it is available upstream. For each planned major proposition, preserve the planned conclusion -> representation -> essential reasoning -> material consequence/tradeoff structure, omitting elements only when the plan marks them inapplicable. Treat those labels as internal composition grammar, not mandatory reader-facing headings. When composition realizes a planned representation, remove or shorten prose that merely restates what the representation now communicates.

Sibling outputs and reviewer design-document variants must agree on technical truth. They need not contain the same volume of information; omission is expected when a detail is not material to that artifact or reviewer's decision task. HTML representations derive from their Markdown source and do not become independent semantic sources.

## Do not

Do not collapse the pipeline into one giant prompt. Do not use the design doc as the source for the slide deck. Do not patch only final rendering when an upstream stage owns the defect. Do not rerun valid upstream checkpoints when the requested work is downstream-only. Do not stop a wrapper run at an intermediate artifact when downstream final outputs were requested.

## Completion gate

Before returning, verify the requested final outputs exist and satisfy this skill's output contract. For resumed runs, also report the checkpoint used, skipped upstream stages, downstream stages executed, regenerated outputs, and unresolved defects with the earliest owning stage.

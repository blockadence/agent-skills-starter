# `to-design-package`

Orchestrate or resume a production engineering design package from a Wayfinder spec, similarly rigorous engineering specification, or preserved workflow checkpoint.

A complete package includes one canonical engineering design document, a canonical BBP presentation with Core / Standard / Deep views, speaker notes, polished HTML representations, and any requested reviewer lenses.

## Full run

```text
/to-design-package spec.md
/to-design-package specs/part-a/spec.md specs/part-b/spec.md specs/part-c/spec.md
```

Multiple specs are reconciled into one traceable source model for the same feature/work unit. Contradictions are recorded, not silently resolved. Single-spec usage is unchanged.

## Package topology

A normal full run writes shared semantic artifacts once, one canonical design document, one canonical presentation, and optional reviewer lenses:

```text
design-package/
  source/
    source-model.md
    explanatory-model.md
  design/
    design-doc.md
    design-doc.html
  presentation/
    slides.html
    speaker-notes.md
    speaker-notes.html
  reviewers/
    cto/
      review-adaptation.md
```

All reviewers normally reference the same design document. Reviewer profiles change what deserves attention, not the underlying review artifact.

A separate reviewer-specific design document is opt-in and is isolated under `design-package/variants/<profile>/`.

## Resume from a checkpoint

Preserved artifacts are workflow checkpoints. `--from=<stage>` means start at that stage and continue through all downstream stages needed for the requested final outputs. It does not mean run only that stage.

For example, when `design-doc.md` and `speaker-notes.md` already exist and only their HTML representations are needed:

```text
/to-design-package --from=render-html design-doc.md speaker-notes.md
```

The wrapper validates the checkpoint and skips upstream semantic and planning stages that are not needed.

## Reviewer profiles

Use `--reviewer=<profile>` when the run includes reviewer adaptation:

```text
/to-design-package --from=reviewer-adapt --reviewer=cto
/to-design-package --from=reviewer-adapt --reviewer=adversarial
```

By default this produces a review lens over the canonical design document: recommended reading path, likely questions, evidence to foreground, risks/tradeoffs worth scrutiny, and optional delivery guidance.

It does not create another design document unless the user explicitly requests a reviewer-specific document.

## Human review

AI generation is permitted. Generated artifacts remain drafts until reviewed by a human and must not be represented as human-reviewed, approved, or final before that review. Human-facing artifacts do not announce AI/model/tool authorship unless the user explicitly requests that disclosure.

## Contract

`SKILL.md` is the executable agent contract. This README is human-facing orientation only. Leaf skills own transformations such as semantic modeling, planning, HTML rendering, and audits; `to-design-package` owns orchestration, canonical artifact reuse, optional reviewer-document branching, and checkpoint/resume behavior.

# `to-design-package`

Orchestrate or resume a production engineering design package from a Wayfinder spec, similarly rigorous engineering specification, or preserved workflow checkpoint.

A complete package includes editable Markdown design and speaker-note sources, polished navigable HTML representations of both, and the BBB HTML slide deck.

## Full run

```text
/to-design-package spec.md
```

## Resume from a checkpoint

Preserved artifacts are workflow checkpoints. `--from=<stage>` means start at that stage and continue through all downstream stages needed for the requested final outputs. It does not mean run only that stage.

For example, when `design-doc.md` and `speaker-notes.md` already exist and only their HTML representations are needed:

```text
/to-design-package --from=render-html design-doc.md speaker-notes.md
```

The wrapper validates the checkpoint and skips upstream semantic and planning stages that are not needed.

## Reviewer variants

Use `--reviewer=<profile>` when the run includes reviewer adaptation:

```text
/to-design-package --from=reviewer-adapt --reviewer=cto
/to-design-package --from=reviewer-adapt --reviewer=adversarial
```

Each reviewer adaptation produces a complete downstream package in its own namespace. It does not stop at `review-adaptation.md`, and it does not overwrite the default or another reviewer variant.

Reviewer variants preserve the same technical truth while changing emphasis, ordering, evidence density, code-nearness, risk treatment, and explanatory detail.

## Human review

AI generation is permitted. Generated artifacts remain drafts until reviewed by a human and must not be represented as human-reviewed, approved, or final before that review.

## Contract

`SKILL.md` is the executable agent contract. This README is human-facing orientation only. Leaf skills own transformations such as semantic modeling, planning, HTML rendering, and audits; `to-design-package` owns orchestration, reviewer branching, and checkpoint/resume behavior.

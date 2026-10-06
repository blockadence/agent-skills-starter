# `to-design-package`

Orchestrate or resume a production engineering design package from a Wayfinder spec, similarly rigorous engineering specification, or preserved workflow checkpoint.

A complete package includes editable Markdown design and speaker-note sources, polished navigable HTML representations of both, and the BBB HTML slide deck.

## Full run

```text
/to-design-package spec.md
```

## Resume from a checkpoint

Preserved artifacts are workflow checkpoints. Use `--from=<stage>` when you want to make the restart point explicit.

For example, when `design-doc.md` and `speaker-notes.md` already exist and only their HTML representations are needed:

```text
/to-design-package --from=render-html design-doc.md speaker-notes.md
```

The wrapper validates the checkpoint and skips upstream semantic and planning stages that are not needed.

Natural language is equivalent:

```text
Resume to-design-package at HTML rendering using design-doc.md and speaker-notes.md.
Do not regenerate upstream artifacts.
```

## Contract

`SKILL.md` is the executable agent contract. This README is human-facing orientation only. Leaf skills own transformations such as semantic modeling, planning, HTML rendering, and audits; `to-design-package` owns orchestration and checkpoint/resume behavior.

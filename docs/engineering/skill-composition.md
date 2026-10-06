# Skill composition

Producing skills own substance, structure, evidence, and output contracts. Modifier skills own compatible cross-cutting expression constraints. Rendering skills own representations of existing semantic artifacts. Audit skills verify contracts and report defects; they do not silently become authors.

Apply modifiers during generation, not as blind post-processing rewrites.

## Precedence

1. Explicit user instructions.
2. Producing skill semantic and structural contract.
3. Source-specific presentation guidance.
4. Compatible modifier skills such as `in-my-voice`.

A modifier may change expression, emphasis, or presentation. It must not change facts, decisions, uncertainty, evidence, required structure, or output contracts owned by the producer.

## Engineering design pipeline

```text
source
  -> source-model
  -> explanatory-model
  -> reviewer-adapt (optional)
  -> artifact-specific planning
  -> composition
  -> rendering
  -> audits
  -> human review
```

`to-design-package` is the canonical design workflow. It orchestrates an engineering design document and a sibling BBB-style presentation. The presentation does not derive from the design document; both derive from the same explanatory model.

Markdown design documents and speaker notes are authoritative editable artifacts. `render-html-document` may derive polished navigable HTML representations from them without changing their semantic content.

The former `to-design-doc` skill is intentionally removed rather than retained as a compatibility path. Useful ideas from it must live at their natural ownership boundary. Examples include source support in `source-model` and `source-fidelity-audit`, reader sequencing in `design-doc-plan`, evidence selection in `design-evidence-plan`, and expression constraints in compatible modifiers.

## Shared source and reviewer branches

Artifacts before reviewer adaptation represent common technical truth and belong in a shared source namespace. Artifacts at or after reviewer adaptation belong to the selected reviewer branch.

```text
spec
  -> source/source-model
  -> source/explanatory-model
       -> default/...
       -> cto/...
       -> adversarial/...
```

Reviewer branches are siblings. They may reference the shared source artifacts but must not derive from one another. This makes `source/explanatory-model.md` both the normal branch point and the truth-equivalence anchor for reviewer variants.

## Checkpoints and resume

Pipeline artifacts are explicit interfaces between stages and may be reused as checkpoints.

A wrapper resuming downstream work should identify the earliest stage required by the requested change, validate that stage's prerequisite artifacts, and skip unaffected upstream work. It must not rerun the entire pipeline merely to reconstruct context that is already preserved in valid artifacts.

`to-design-package --from=<stage>` makes the intended restart point explicit. For example, `--from=render-html` can consume existing Markdown design and speaker-note artifacts and produce their HTML representations without repeating source modeling, explanation, planning, or composition.

If a requested checkpoint is incomplete or inconsistent, report the missing prerequisite. Do not silently fall back to a full run.

## PR review pipeline

`to-pr-comments` has two input modes.

By default, it consumes supplied verified review findings. It does not replace or rerun the upstream investigation.

When the user supplies `--review-skill=<skill-name>`, the wrapper first invokes that explicitly named installed review skill against the review target. The named skill owns investigation and verification. Its output then enters the same source-model, explanatory-model, communication-planning, and audit pipeline as pre-existing findings.

The wrapper must not silently substitute another review skill when the requested skill is unavailable, and it must not hard-code assumptions about a skill's author or implementation based on its name.

The current implementation supersedes the earlier `to-pr-comments`. Optional batch posting is retained only as a delivery reference and cannot change technical findings or choose a review disposition without explicit user instruction.

## Fix the earliest owning stage

When review or an audit finds a defect, classify it and repair the earliest stage that owns it. Regenerate affected downstream artifacts. Do not patch only the final prose or rendered output when the defect originated in source normalization, explanation, planning, or evidence selection.

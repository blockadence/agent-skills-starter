# Skill composition

Producing skills own substance, structure, evidence, and output contracts. Modifier skills own compatible cross-cutting expression constraints. Audit skills verify contracts and report defects; they do not silently become authors.

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
  -> audits
  -> human review
```

`to-design-package` is the canonical design workflow. It orchestrates an engineering design document and a sibling BBB-style presentation. The presentation does not derive from the design document; both derive from the same explanatory model.

The former `to-design-doc` skill is intentionally removed rather than retained as a compatibility path. Useful ideas from it must live at their natural ownership boundary. Examples include source support in `source-model` and `source-fidelity-audit`, reader sequencing in `design-doc-plan`, evidence selection in `design-evidence-plan`, and expression constraints in compatible modifiers.

## PR review pipeline

`to-pr-comments` has two input modes.

By default, it consumes supplied verified review findings. It does not replace or rerun the upstream investigation.

When the user supplies `--review-skill=<skill-name>`, the wrapper first invokes that explicitly named installed review skill against the review target. The named skill owns investigation and verification. Its output then enters the same source-model, explanatory-model, communication-planning, and audit pipeline as pre-existing findings.

The wrapper must not silently substitute another review skill when the requested skill is unavailable, and it must not hard-code assumptions about a skill's author or implementation based on its name.

The current implementation supersedes the earlier `to-pr-comments`. Optional batch posting is retained only as a delivery reference and cannot change technical findings or choose a review disposition without explicit user instruction.

## Fix the earliest owning stage

When review or an audit finds a defect, classify it and repair the earliest stage that owns it. Regenerate affected downstream artifacts. Do not patch only the final prose or rendered output when the defect originated in source normalization, explanation, planning, or evidence selection.

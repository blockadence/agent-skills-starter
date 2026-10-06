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

`to-design-package` orchestrates this pipeline for an engineering design document and a sibling BBB-style presentation. The presentation does not derive from the design document; both derive from the same explanatory model.

`to-design-doc` remains a narrower producer for reshaping a human-reviewed `understanding.md` into a supplied design-document template.

## PR review pipeline

`to-pr-comments` consumes verified deep code-review findings. It does not replace the upstream investigation. It normalizes the findings, builds a reviewer mental model, plans the communication, then produces a preamble and localized comments.

## Fix the earliest owning stage

When review or an audit finds a defect, classify it and repair the earliest stage that owns it. Regenerate affected downstream artifacts. Do not patch only the final prose or rendered output when the defect originated in source normalization, explanation, planning, or evidence selection.

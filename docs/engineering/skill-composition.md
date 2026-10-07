# Skill composition

Producing skills own substance, structure, evidence, and output contracts. Modifier skills own compatible cross-cutting expression constraints. Rendering skills own representations of existing semantic artifacts. Audit skills verify contracts and report defects; they do not silently become authors.

Apply modifiers during generation, not as blind post-processing rewrites.

## Reason once, transform deterministically

Use generative reasoning where engineering judgment is still unresolved. Once a stage records a decision in an explicit intermediate artifact, downstream stages should consume that decision as a contract rather than repeatedly re-deciding it.

As the pipeline moves downstream, generative freedom should decrease:

```text
reason -> classify -> select -> plan
                         |
                         v
                    contract
                         |
                         v
              compose -> project -> render -> validate
```

Examples:

- source interpretation, reviewer relevance, evidence choice, and slide depth membership require judgment;
- once reviewer relevance is classified, composition must not casually resurrect upstream-only material;
- once design-doc planning classifies content as Decision, Understanding, or Reference depth, composition must preserve that disclosure boundary rather than re-expanding available upstream detail;
- once an evidence plan selects a representation, composition/rendering must not silently replace it with prose;
- once the canonical Deep slide inventory records stable slide IDs and depth membership, Core and Standard are deterministic projections that change visibility only.

This is a determinism boundary, not a prohibition on language generation. Composition may still realize planned prose and visuals, but it must preserve settled upstream semantics and structural decisions.

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
       -> reviewer-adapt (optional) -> design-doc planning
       -> canonical BBP story/slide tree
  -> composition
  -> rendering
  -> audits
  -> human review
```

`to-design-package` is the canonical design workflow. It orchestrates an engineering design document and a sibling BBP-style presentation. The presentation does not derive from the design document; both derive from the same explanatory model.

Markdown design documents and speaker notes are authoritative editable artifacts. `render-html-document` may derive polished navigable HTML representations from them without changing their semantic content.

The former `to-design-doc` skill is intentionally removed rather than retained as a compatibility path. Useful ideas from it must live at their natural ownership boundary. Examples include source support in `source-model` and `source-fidelity-audit`, reader sequencing in `design-doc-plan`, evidence selection in `design-evidence-plan`, and expression constraints in compatible modifiers.

## Shared source and reviewer branches

Artifacts before reviewer adaptation represent common technical truth and belong in a shared source namespace. Reviewer adaptation branches design-document work only. The BBP presentation remains a shared sibling derived from the explanatory model so reviewer profiles cannot reinvent its story or visual language.

```text
spec
  -> source/source-model
  -> source/explanatory-model
       -> presentation/...  (canonical slide tree + depth selections)
       -> default/...       (design document)
       -> cto/...           (adapted design document)
       -> adversarial/...   (adapted design document)
```

Reviewer branches are siblings. They may reference the shared source artifacts but must not derive from one another. This makes `source/explanatory-model.md` both the normal branch point and the truth-equivalence anchor for reviewer variants.

## Decision-relevant compression

The design pipeline separates exhaustive technical understanding from reader-facing decision sufficiency.

```text
source-model            exhaustive truth + provenance classification
  -> explanatory-model  comparatively complete causal understanding
  -> reviewer-adapt      reviewer relevance selection
  -> artifact planning   artifact-specific compression
  -> reader artifact     minimum decision-sufficient surface
```

Each downstream transformation may omit information from the presentation surface while retaining traceability through upstream checkpoints.

A detail belongs in a design-review artifact when it is needed to understand the problem or mechanism, evaluate a material tradeoff, identify a material risk/failure mode, assess compatibility/migration/blast radius, or make the requested decision.

Exploration chronology, decision-map counts/status, ticket bookkeeping, and non-material rejected branches normally remain upstream.

Audits protect both directions: reject dangerous omission of decision-critical truth and reject exhaustive source replay that creates unnecessary cognitive load.

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


### Artifact depth ownership

Information may remain true and useful while being absent from a particular reader artifact.

- `design-doc-plan` treats the design document as a decision instrument. It selects Decision and Understanding surfaces for the main review path while keeping Reference depth upstream or explicitly separated, and plans major propositions as conclusion -> representation -> essential reasoning -> material consequence/tradeoff. Downstream implementation usefulness alone is not a reason to include content.
- `reviewer-adapt` subtracts established reviewer knowledge before adding emphasis. Known platform behavior remains upstream unless the design changes it, relies on a non-obvious property of it, or exposes a material consequence or risk.
- `design-evidence-plan` selects representation by engineering question and treats supported technical representations as compression surfaces. Conceptual domain/entity models express semantic relationships without implying persistence; ER models require concrete persistence support. Prefer a diagram, contract, or structured representation when it preserves the decision-relevant relationship with less reconstruction work than prose.
- `bbp-story-plan` authors Deep as the canonical presentation fixed point, records stable slide identity and depth membership once, then derives Core and Standard as deterministic projections. Shared slides remain unchanged across views.
- Reviewer profiles do not fork presentation stories. Audience-aware delivery guidance belongs in speaker notes.
- BBP's approximate 5/15/45-minute versions and Rule of Three guide prioritization; they are not rigid timing or cardinality constraints.
- Presentation layout and recurring motifs carry story-level orientation in addition to the headline sequence.

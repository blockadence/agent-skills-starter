# Engineering skills

Small, composable skills for engineering analysis, design communication, review communication, rendering, and evidence quality.

## Chartering and approval

- `to-charting-brief`: normalize messy source inputs and set an implementable Wayfinder destination.
- `to-design-briefing`: understand, defend and reconsider decisions using full spec evidence.
- `to-design-package` supports an optional concise EDD profile (see `references/edd-profile.md`).

## Design communication pipeline

`source-model` -> `explanatory-model` -> optional `reviewer-adapt` -> artifact planning -> composition -> rendering -> audits.

- `source-model`: normalize facts, decisions, constraints, uncertainty, and source support.
- `explanatory-model`: build the causal and conceptual model a cold reader needs.
- `reviewer-adapt`: adapt emphasis and evidence without changing technical truth.
- `design-doc-plan`: plan engineering design-document information architecture.
- `design-evidence-plan`: select source-supported explanatory and technical evidence.
- `bbp-story-plan`: plan a Beyond Bullet Points technical presentation.
- `render-html-document`: render existing Markdown artifacts as polished, navigable HTML without semantic rewriting.
- `to-design-package`: canonical orchestrator for the design document and presentation package, including checkpoint/resume behavior.

A complete design package normally includes Markdown and HTML versions of the design document and speaker notes, plus the BBP HTML slide deck.

The former `to-design-doc` implementation is superseded and removed. Template handling, source fidelity, constructed-vs-sourced discipline, and presentation constraints belong in the composable stages that own those concerns.

## PR communication pipeline

Default:

```text
verified review findings -> source-model -> explanatory-model -> optional reviewer-adapt -> pr-communication-plan -> to-pr-comments output
```

Optional composition:

```text
specified review skill -> verified findings -> the same to-pr-comments pipeline
```

Use `--review-skill=<skill-name>` when `to-pr-comments` should invoke a particular installed review skill first. Without it, `to-pr-comments` assumes the supplied findings are already verified and does not redo the investigation.

The current `to-pr-comments` supersedes the earlier implementation. Its preserved batch-posting reference owns delivery mechanics only.

## Audit and support skills

- `source-fidelity-audit`: detect invented facts, lost uncertainty, and changed decision status.
- `comprehension-audit`: detect cold-reader comprehension failures and generated-text artifacts.
- `intent-leak-audit`: keep authoring mechanics and reviewer classification out of reader-facing artifacts.
- `visual-render-audit`: inspect rendered diagrams and documents for collisions, ambiguity, and readability defects.
- `reviewer-profile-author`: create reusable internal reviewer profiles based on information needs.

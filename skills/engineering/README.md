# Engineering skills

Small, composable skills for engineering analysis, design communication, review communication, and evidence quality.

## Design communication pipeline

`source-model` -> `explanatory-model` -> optional `reviewer-adapt` -> artifact planning -> composition -> audits.

- `source-model`: normalize facts, decisions, constraints, uncertainty, and source support.
- `explanatory-model`: build the causal and conceptual model a cold reader needs.
- `reviewer-adapt`: adapt emphasis and evidence without changing technical truth.
- `design-doc-plan`: plan engineering design-document information architecture.
- `design-evidence-plan`: select source-supported explanatory and technical evidence.
- `bbb-story-plan`: plan a Beyond Bullet Points technical presentation.
- `to-design-package`: canonical orchestrator for the design document and presentation package.

The former `to-design-doc` implementation is superseded and removed. Template handling, source fidelity, constructed-vs-sourced discipline, and presentation constraints belong in the composable stages that own those concerns.

## PR communication pipeline

`code-review` output -> `source-model` -> `explanatory-model` -> optional `reviewer-adapt` -> `pr-communication-plan` -> `to-pr-comments`.

The current `to-pr-comments` supersedes the earlier implementation. Its preserved batch-posting reference owns delivery mechanics only.

## Audit and support skills

- `source-fidelity-audit`: detect invented facts, lost uncertainty, and changed decision status.
- `comprehension-audit`: detect cold-reader comprehension failures and generated-text artifacts.
- `intent-leak-audit`: keep authoring mechanics and reviewer classification out of reader-facing artifacts.
- `visual-render-audit`: inspect rendered diagrams for collisions, ambiguity, and readability defects.
- `reviewer-profile-author`: create reusable internal reviewer profiles based on information needs.

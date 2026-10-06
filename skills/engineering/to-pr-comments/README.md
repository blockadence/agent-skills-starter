# `to-pr-comments`

Orchestrate human-readable PR review communication from verified deep code-review findings.

By default, the skill consumes findings that already exist. Optionally, `--review-skill=<skill-name>` composes a specified installed review skill ahead of the normal communication pipeline.

## Examples

Existing findings:

```text
/to-pr-comments review.md
```

Run a review skill first:

```text
/to-pr-comments --review-skill=code-review PR #175
```

Use another compatible review skill:

```text
/to-pr-comments --review-skill=security-code-review PR #175
```

The named review skill owns investigation and verification. `to-pr-comments` owns the reviewer mental model, preamble, inline-comment communication, and downstream audits.

## Contract

`SKILL.md` is the executable agent contract. This README is human-facing orientation only. The skill follows the repository composition rules in `CLAUDE.md`: user instructions take precedence, producer semantics and structure come next, and compatible modifiers apply without changing technical truth.

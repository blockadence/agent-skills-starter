---
name: to-pr-comments
description: "Orchestrate human-readable PR review communication from verified deep code-review findings, or optionally run a specified review skill first. Use when the user wants a concise reviewer preamble and comprehensible inline comments that preserve upstream technical rigor."
---

# to-pr-comments

## Composition contract

This skill follows the repository composition rules.

- Explicit user instructions have highest precedence.
- Preserve source truth, uncertainty, terminology, and decision status.
- Do not invent implementation detail to make an artifact look complete.
- Reviewer adaptation may change emphasis, order, evidence density, and code-nearness, never facts.
- Keep reviewer classification, persuasion strategy, generation mechanics, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.

## Owns

The downstream communication workflow. Deep technical discovery and verification remain owned by an upstream review skill or by the verified findings supplied as input.

## Input modes

### Default: verified findings

When no review skill is specified, treat the supplied review findings as the technical source. Do not rerun deep code review.

Examples:

```text
/to-pr-comments review.md
```

```text
Use the to-pr-comments skill on the code-review findings for this PR.
```

### Composed: specified review skill

When the user supplies `--review-skill=<skill-name>`, invoke that skill against the supplied review target first. Treat its output as the verified findings consumed by the normal pipeline.

Examples:

```text
/to-pr-comments --review-skill=code-review PR #175
```

```text
/to-pr-comments --review-skill=security-code-review PR #175
```

The named skill owns investigation, verification, and its own evidence contract. This skill owns the downstream transformation into review communication.

Do not assume `code-review` is Matt Pocock's implementation merely from the name. Resolve the explicitly named installed skill.

If the named skill cannot be found or its output does not contain enough evidence to support review findings, stop and report the missing dependency or evidence. Do not silently substitute another review skill or perform an improvised deep review.

`--review-skill` is an optional composition hint, not the start of a general CLI. Do not invent additional flags when ordinary skill input or natural-language instructions are sufficient.

## Pipeline

1. Resolve the technical source:
   - default mode: supplied verified review findings;
   - composed mode: output from the explicitly named review skill.
2. Normalize the technical source with `source-model`.
3. Build a PR `explanatory-model`.
4. Apply optional `reviewer-adapt`.
5. Run `pr-communication-plan`.
6. Compose the reviewer preamble and inline comments.
7. Run source-fidelity, comprehension, and intent-leak audits.
8. Route blocking findings upstream and regenerate.
9. Stop only when blocking gates pass or insufficient evidence is explicitly reported.

## Preamble contract

A cold reviewer should be able to explain what changed, why, the mechanism/code path, scope, main risk, and review posture after reading it.

## Inline comment contract

Each retained comment states the concrete local issue or question, causal explanation, consequence, evidence, and requested action or decision when appropriate.

## Optional GitHub delivery

Stop after producing a human-reviewable review artifact. Post comments only when the user explicitly asks after reviewing or editing it. When `references/gh-batch-post.md` is present, follow that reference for batch delivery.

## Do not

Do not discard technical evidence during humanization, dump investigation prose verbatim, or produce compressed comments that require reconstructing the investigation.

In default mode, do not rerun or replace deep code review.

In composed mode, do not weaken, silently reinterpret, or duplicate the named upstream review skill's investigation.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

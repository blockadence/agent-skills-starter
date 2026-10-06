---
name: reviewer-adapt
description: "Adapt an engineering explanatory model for a reviewer perspective or reusable reviewer profile. Use when the same technical truth needs different emphasis, ordering, evidence density, or code-nearness for different reviewers."
---

# reviewer-adapt

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

Private adaptation instructions: priorities, likely questions, evidence density, code-nearness, ordering adjustments, and concepts needing extra explanation.

## Process

1. Read the explanatory model and optional reviewer profile.
2. Identify the reviewer's likely information needs and questions.
3. Adjust priority, ordering, evidence density, and code-nearness.
4. Convert anticipated pushback into candidate objectives, invariants, evidence, limitations, or implementation details.
5. Keep profile labels private.
6. Write `review-adaptation.md`.

## Must preserve

Technical truth and decision status.

## Do not

Do not invent reassurance, flatter or manipulate the reviewer, or emit headings such as `Adversarial engineering review`, `CTO review`, or skeptical `Claim 1/2/3` rhetoric merely because of the private profile.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

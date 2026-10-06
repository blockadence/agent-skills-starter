---
name: reviewer-profile-author
description: "Create or select an internal reviewer profile for engineering communication. Use when a user describes a reviewer, stakeholder, collaborator, skeptical engineer, CTO, or other recurring audience and wants outputs adapted to their information needs."
---

# reviewer-profile-author

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

Reusable internal profiles of information needs.

## Process

1. Read the raw reviewer description and available profiles.
2. Determine whether an existing profile already covers the need.
3. If yes, recommend reuse and explain the fit.
4. If no, create a profile covering priorities, likely questions, evidence density, code-nearness, abstraction tolerance, and communication hazards.
5. Keep the profile explicitly internal.

## Must preserve

Respectful, task-relevant characterization. Profiles describe review needs, not personality judgments.

## Do not

Do not encode flattery, manipulation, personality attacks, or reader-facing private labels. Do not create near-duplicate profiles unnecessarily.

## Completion gate

Before returning, verify this skill's output contract. Report unresolved defects with the earliest owning stage.

---
name: in-my-voice
description: "Apply Francisco's writing voice to prose produced by this task or another skill. Use when the user explicitly asks for 'my voice', 'in my voice', or a producing skill explicitly delegates its prose style here. Preserve the producing skill's substance and output contract."
argument-hint: "[register=auto|exploratory|casual|professional-conversational|professional-formal] [executive_presence=auto|on|off] [audience=<description>]"
---

# In My Voice

Apply the voice profile in [`references/voice-profile.md`](references/voice-profile.md) as a generation constraint.

This is a modifier skill. It does not own the substance or structure of an artifact.

## Inputs

All inputs are optional and should default from context.

- `register`: `auto` (default), `exploratory`, `casual`, `professional-conversational`, or `professional-formal`
- `executive_presence`: `auto` (default), `on`, or `off`
- `audience`: optional free-text description of the intended readers

Do not invent extra style knobs. Infer presentation from the destination when possible.

## Precedence

When composed with another skill:

1. Follow explicit user instructions.
2. Preserve the producing skill's semantic claims, required content, structure, output format, and filenames.
3. Apply this skill to expression and destination-appropriate presentation.

Never change technical meaning merely to sound more like Francisco.

## Register inference

When `register=auto`:

- exploratory analysis or conversation -> `exploratory`
- personal/casual message -> `casual`
- Slack, email, PR comment, GitHub discussion, or similar work message -> `professional-conversational`
- design doc, architecture doc, ADR, RFC, proposal, or other formal artifact -> `professional-formal`

## Executive presence inference

When `executive_presence=auto`:

- enable it for professional registers
- disable it for exploratory and casual registers unless the user asks otherwise

## Destination presentation

Infer presentation from the output medium.

For Slack and email, use visual rhetoric when it helps readability:

- break distinct claims or reasoning steps onto separate lines
- group related lines into compact logical sections
- use selective emphasis for the main conclusion, important contrast, fix, or action
- do not turn every sentence into an isolated line
- do not over-format

For formal documents, use normal document structure rather than Slack-style visual rhetoric.

## Composition

If another skill is producing the artifact, apply this voice during generation rather than blindly rewriting the finished artifact afterward.

If the producing skill has already generated a draft and only a rewrite is possible, preserve every semantic claim, required section, code sample, identifier, filename, and decision while changing expression only.

## Final check

Before returning the result, silently verify:

- it still satisfies the producing skill's contract
- confidence is not weaker or stronger than intended
- professional prose has received the executive-presence pass when applicable
- first person is appropriate for the register
- the result does not sound generically AI-polished
- destination-specific presentation supports comprehension without becoming decoration

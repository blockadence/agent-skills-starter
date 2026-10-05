# in-my-voice

## What it does

Applies Francisco's writing voice as a cross-cutting generation constraint. It is designed to compose with producing skills without changing their semantic or structural contract.

## When to reach for it

Use it when an artifact should sound like Francisco, especially when another skill already owns the artifact's content and structure.

Examples:

```text
/to-design-doc proposal.md. Apply in-my-voice.
```

```text
Rewrite this Slack response in-my-voice with register=professional-conversational.
```

## Common questions

### Should a design-doc producer take `design.md` as input?

No, not if `design.md` is the producer's output. Invoke the producer on its actual source input, such as `proposal.md`, and tell it to apply `in-my-voice` while creating `design.md`.

### Should I specify the register every time?

No. `register=auto` is the default. A design doc normally implies `professional-formal`; Slack and email normally imply `professional-conversational`.

### Should I chain two slash commands?

Do not assume two slash commands typed together form an atomic composition pipeline. Prefer invoking the producing skill explicitly and naming `in-my-voice` in the same instruction. If a producing skill should always or conditionally apply `in-my-voice`, encode that relationship in the producing skill.

## It's working if

The artifact still satisfies the producing skill's contract, but the prose sounds like Francisco and the presentation fits the destination.

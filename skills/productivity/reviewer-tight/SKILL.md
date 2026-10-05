---
name: reviewer-tight
description: "Tighten prose aimed at a PR author or reviewer: one claim per comment, the claim first, no restating the diff. Use when a producing skill delegates review-comment concision here, or the user asks for reviewer-tight."
---

# Reviewer Tight

Modifier skill. It owns how short and how direct a review comment is.

It does not own what the comment claims, which file or line it anchors to, or the structure of the artifact around it. The producing skill owns those.

## Composition

Composes with `in-my-voice`: this skill decides what survives, `in-my-voice` shapes how the survivors read. Apply this one first, during generation rather than as a rewrite pass.

Never cut a semantic claim to hit a word count. If a comment cannot make its point inside the budget, that is a signal the comment is a design conversation wearing a comment's clothes. Say so in one line and move it up to the summary.

## The cuts

- **One claim per comment.** Two claims are two comments, separately anchored.
- **Claim first.** Delete the wind-up. "I was reading through this and noticed" carries nothing the first real sentence does not.
- **The author has the diff open.** Describe what the code does wrong, not what it does.
- **60 words per comment body**, three sentences typical.
- **Cut false hedges, keep true ones.** "I might be missing context on the retry path here" saves a round trip. "just maybe consider possibly" costs one.
- **One suggestion, concrete enough to apply.** Name the change. "Consider revisiting this" is not a comment.
- **Praise stands alone.** No praise wrapped around criticism.
- **Drop the comment when the fix is smaller than the sentence explaining it**, unless it belongs in the batched nits.

## What survives a cut

Keep these even when they cost words:

- the consequence: what actually goes wrong, and when
- the specific change being asked for
- a question you genuinely need answered

Cut everything else before touching these three.

## Check

Before returning, silently verify each comment:

- The author can act on it without replying to ask what you meant.
- Every sentence carries a claim, a consequence, or a fix.
- It describes the code, not the person who wrote it.
- You would say it out loud to them, in this wording.

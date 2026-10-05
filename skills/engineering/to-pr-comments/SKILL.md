---
name: to-pr-comments
description: "Turn a code review into a PR-ready review file: a verdict preamble, then severity-ordered comments each anchored to a file and line. Wraps code-review."
disable-model-invocation: true
---

# to-pr-comments

Run `code-review`, then turn its two prose reports into a file the reviewer reads top to bottom and pastes into the PR one comment at a time.

`code-review` reports per axis and deliberately refuses to rerank across them. That is correct for the axes and useless for a reviewer, who has one PR, one comment box, and a decision to make. This skill does the reranking, anchors every finding to a line, and writes each one as a comment the author can act on.

**Wrap, do not fork.** Discovery stays in `code-review`, so improvements there land here for free. This skill owns presentation: anchoring, ranking, voice, and delivery.

## Process

### 1. Pin the PR

If the user gave a PR number or URL:

```bash
gh pr view <n> --json number,title,body,baseRefName,headRefName,headRefOid,additions,deletions,files
```

The fixed point is `baseRefName`. Otherwise ask for the fixed point, and treat the branch name and commit messages as the only statement of intent.

Confirm the ref resolves and the diff is non-empty before going further. Record the commit list (`git log <base>..HEAD --oneline`) and the file list.

### 2. Run code-review

Invoke the `code-review` skill against that fixed point. Two changes when you spawn its sub-agents:

- Add to both briefs: **every finding quotes the exact line or lines from the diff it refers to, and names the file.** Without a quote a finding cannot be anchored in step 3.
- Raise the word cap from 400 to 700 per axis. The cap exists to keep the aggregate readable; here the aggregate is rewritten anyway, and a truncated finding is a lost comment.

Keep the two reports separate at this stage. Merging happens in step 5, after anchoring.

### 3. Anchor every finding

A finding you cannot point at is a finding you cannot post. For each one:

1. `grep -n` the quoted text in the file at `HEAD` to get a candidate line.
2. Confirm that line sits inside a changed hunk: `git diff <base>...HEAD -- <file>`.
3. `side` is `RIGHT` for an added or modified line, `LEFT` for a line the diff removes.
4. Multi-line findings carry `start_line` and `line`, both on the same side.

When a finding is about the change as a whole rather than one hunk (missing tests, a requirement never implemented, scope creep), it has no line. Move it into the preamble rather than anchoring it to the nearest plausible line, which posts a comment in the wrong place and reads as carelessness.

Completion criterion: every finding from both axes is either anchored to a file and line, placed as a file-level comment, or folded into the preamble. None are dropped silently.

### 4. Write the preamble

Five parts, in order, 250 words total.

1. **What this PR does.** Two or three sentences, read off the diff, cross-checked against the PR description. The diff wins where they disagree, and the disagreement is itself a finding.
2. **Why it matters.** The problem being solved. When the PR body does not say and the diff does not imply it, say that plainly: an unstated motivation is review feedback.
3. **How well it lands.** What the change accomplishes, what is partial, what is missing. This is the Spec axis restated for a human.
4. **Scope.** Is this one change? When the diff carries unrelated work, name the seam and propose the split: which files go in each PR, and which has to land first. When it is one change, say so in a sentence and move on.
5. **Verdict.** Exactly one, with the single finding that drives it:

| verdict | when |
| --- | --- |
| `REQUEST CHANGES` | any blocking comment |
| `COMMENT` | no blocking comment, at least one important one |
| `APPROVE WITH NITS` | only optional comments and nits |
| `APPROVE` | nothing above praise |

### 5. Write the comments

Ordered by severity, highest first. Nits batch together at the end regardless of which file they touch.

| rung | means |
| --- | --- |
| blocking | merging as-is produces a defect, regression, security hole, or data problem |
| important | real but not merge-stopping: wrong seam, missing test, a name that will mislead the next reader |
| optional | a suggestion the author can take or leave |
| nit | style, typo, naming preference |

Head each comment with a Conventional Comments label so the rung is legible in the PR too:

```
**issue (blocking):** <subject line>
```

Labels: `issue`, `suggestion`, `question`, `nitpick`, `chore`, `todo`, `praise`, `thought`. Decorations: `(blocking)`, `(non-blocking)`, `(if-minor)`.

**The beat.** Every comment body runs the same three moves, one or two sentences each:

1. **What** the code as written does.
2. **Why** that is a problem. Concrete and specific: "this throws when the map is empty", not "this could be fragile".
3. **The change**, specific enough to apply. Use a ` ```suggestion ` block when the fix is a line or two.

Write the comments through `reviewer-tight`, then `in-my-voice` with `register=professional-conversational`.

**Tone.** Describe the code, not the author: "this path returns null when the cache misses", never "you forgot the cache miss". Ask a question when you are genuinely unsure why the author did something, and assert when you are not, because a rhetorical question reads as a trap. Include a `praise` comment when the diff earns one and leave it out when it does not.

### 6. Write the review file

Default path `.scratch/reviews/<branch>.md`, unless the user names one. Preamble first, then the comments, each with a machine-readable header so step 7 posts without re-parsing prose:

```markdown
### 3. important / suggestion

- file: `src/scheduler/retry.ts`
- line: 42-47
- side: RIGHT
- label: `**suggestion (non-blocking):**`

<body>
```

Stop here. Show the user the file and let them edit it. This is the review step the whole skill exists to make possible.

### 7. Batch post, on request only

Only after the user has read the file and asks for it. See [`references/gh-batch-post.md`](references/gh-batch-post.md).

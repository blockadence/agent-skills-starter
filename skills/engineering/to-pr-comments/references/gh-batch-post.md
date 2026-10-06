# Batch-posting the review

Post the final, human-reviewed `to-pr-comments` artifact as one GitHub review. Use this only after the user has read or edited the generated review and explicitly asks to post it.

## Build the payload

Read the review artifact back from disk rather than relying on conversation context. The user's edits are authoritative.

Map each retained inline comment to the exact PR diff location recorded in the artifact:

```json
{
  "commit_id": "<current PR head SHA>",
  "event": "COMMENT",
  "body": "<the reviewed preamble, verbatim>",
  "comments": [
    { "path": "src/scheduler/retry.ts", "line": 47, "side": "RIGHT", "body": "..." },
    { "path": "src/scheduler/queue.ts", "start_line": 12, "start_side": "RIGHT", "line": 18, "side": "RIGHT", "body": "..." }
  ]
}
```

Default `event` to `COMMENT`. Do not submit `APPROVE` or `REQUEST_CHANGES` unless the user explicitly asks for that review action. GitHub records that action under the posting account, so the decision belongs to the human.

## Check before posting

- Re-read the PR head SHA immediately before posting.
- Confirm every comment path and line still belongs to the current diff.
- Confirm the payload comment count matches the comments remaining in the reviewed artifact.
- Confirm no comment the user removed survives in the payload.
- Preserve the preamble and comment text verbatim from the reviewed artifact.

## Post

```bash
gh api --method POST repos/<owner>/<repo>/pulls/<n>/reviews --input payload.json
```

## What goes wrong

- **422 on a line.** The line is not part of the current PR diff. GitHub rejects the review. Re-anchor that comment and ask the user to review the changed artifact before posting.
- **Duplicates.** A successful run followed by another run posts every comment twice. Confirm the first run failed before retrying.
- **Stale commit id.** A new push moved the PR head. Re-read the head SHA, revalidate anchors, and do not silently post against stale code.

## Ownership boundary

This reference owns delivery mechanics only. It must not discover findings, alter technical conclusions, rewrite reviewed comments, or choose the user's review disposition.

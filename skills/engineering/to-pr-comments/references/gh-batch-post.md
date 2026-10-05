# Batch-posting the review

Posts every comment in the review file as one GitHub review, in a single call. Reached from step 7 of [`SKILL.md`](../SKILL.md), only after the user has read the file and asked for it.

## Build the payload

Read the review file back from disk rather than from context, so the user's edits are what gets posted.

```json
{
  "commit_id": "<headRefOid from step 1>",
  "event": "COMMENT",
  "body": "<the preamble, verbatim>",
  "comments": [
    { "path": "src/scheduler/retry.ts", "line": 47, "side": "RIGHT", "body": "..." },
    { "path": "src/scheduler/queue.ts", "start_line": 12, "start_side": "RIGHT", "line": 18, "side": "RIGHT", "body": "..." }
  ]
}
```

`event` is `COMMENT` or `REQUEST_CHANGES`, taken from the verdict. Leave approval to the human: GitHub records an approval under the account that posts it, and that signature should be one they gave deliberately in the UI.

## Check before posting

```bash
jq '.comments | length' payload.json
```

Confirm the count matches the comments in the file, and that no comment the user deleted survived into the payload.

## Post

```bash
gh api --method POST repos/<owner>/<repo>/pulls/<n>/reviews --input payload.json
```

## What goes wrong

- **422 on a line.** The line is not part of the PR diff. GitHub rejects the entire review, so nothing posts. Re-anchor that one comment and rerun.
- **Duplicates.** A successful run followed by a second run posts every comment twice. Confirm the first run failed before rerunning, by checking the PR.
- **A stale `commit_id`.** New pushes to the branch move `headRefOid`. Re-read it immediately before posting.

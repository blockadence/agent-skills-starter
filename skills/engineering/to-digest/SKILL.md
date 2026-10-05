---
name: to-digest
description: "Turn a wayfinder session's map.md and resolved tickets into understanding.md — a standalone explanation an engineer reads once and can then explain and defend the decisions from, with the map closed. Use before writing the design doc, spec, or any reviewer-facing artifact sourced from that map."
---

# to-digest

Explain a wayfinder session's decision network to a person, in their own
language, well enough that they can defend it in a room without notes.

**Translate, do not summarise.** A summary of a dense document is a denser
document. The map is already the compressed form; compressing it again is the
failure this skill exists to prevent.

## Composition contract

This skill owns the **substance, comprehension structure, evidence, and output
contract** of `understanding.md`.

Other active skills or user instructions may provide modifier constraints for
voice, tone, audience, concision, or presentation. Apply compatible modifiers
*during generation*, not as a blind rewrite after `understanding.md` has been
produced.

Modifiers may change how the explanation is expressed, but they must not:

- turn `understanding.md` into a reviewer-facing design document;
- change, reopen, strengthen, or weaken decisions from the wayfinder session;
- remove mechanisms, evidence, citations, open questions, accepted risks, or
  presentation guidance required by this skill;
- replace this skill's required explanatory structure with another artifact's
  structure;
- change the output filename or location.

When a modifier conflicts with this skill's comprehension or evidence
requirements, this skill wins. Explicit user instructions win over both.

Before writing, identify any active modifier skills or writing constraints and
carry the compatible ones through the draft.

**Important:** the digest's `How to present it` section is *content for the next
step*, even though that content consists of presentation instructions. A voice or
style modifier may affect how the digest itself reads, but must not consume,
replace, or erase Section 7. `to-design-doc` needs those instructions later.

## Why this exists

Wayfinder's artifacts are written for machines. `map.md` and its tickets feed
`to-spec`, which feeds `to-tickets`, which feeds implementation — and each of
those readers holds forty pages of cross-referenced shorthand at once. The
engineer cannot. They still have to carry the whole argument in working memory,
because the next thing they do is **write the design doc by hand** and then
defend it to reviewers who push on every number.

So `understanding.md` is the one artifact in the chain with a human reader, and
it is worth nothing if it reads like the thing it replaces.

## When to use

After a `wayfinder` session produces or updates `map.md`, and before writing a
design doc, spec, or any other reviewer-facing artifact sourced from that map.

## Usage

Invoke with the path to the feature's wayfinding directory — the one containing
`map.md`:

```
/to-digest work/schema-registry
```

The argument is always a directory path, not a bare feature name. Resolve it
against the current working directory, or accept an absolute path. Given no
path, ask which feature directory is intended.

## Input

Read all of it before writing a line:

- `map.md` in the given directory
- every ticket from that session — grilling, research, prototype, task —
  including any left open
- the research findings those tickets cite, where they exist

Also look for a design-doc template in the same directory (commonly
`design.md`, often an empty EDD skeleton). Its headings tell you what the reader
must be able to fill in: the problem statement, the options considered and why
the losers lost, the proposed shape, the rollout and migration story, the open
questions. Cover that ground in your own structure. Do not write its prose.

## The reader, and the bar

Write for **a competent engineer who was not in the session** — even when that
is the same person who ran it a week ago. They know the languages and the
general domain. They do not know this codebase's internals, this effort's
vocabulary, or which repository is which.

**The file must stand alone.** A reader with `map.md` closed can, from this file
only:

- say what is being built, for whom, and why it came up;
- name each decision, the alternative it beat, and the actual reason;
- answer a challenge to any decision with the specific evidence — the file, the
  line, the measurement — rather than with the conclusion restated.

Test it before finishing: pick the three decisions most likely to be attacked in
review and check the file answers each on its own.

## Mechanism before consequence

**The main failure mode of this skill, and the hardest to see.** A wayfinder
session records what it concluded and what proved it. It rarely records *how the
pieces connect*, because whoever ran it held that in their head. Write the
conclusion without the connection and the reader gets a fact they cannot reason
about, only accept.

For every claim that is not self-evident, state the mechanism that makes it
possible **before** stating what follows from it. The test is predictive: once
the reader has the mechanism, could they derive the consequence themselves?

Two systems interacting is where this bites hardest — one build consuming
another's artifacts, two migration histories in one database, two UIs stacking
routes. The author's silent knowledge is doing the most work there, so that is
where a reader stalls. When a claim spans a boundary between systems, explain
the boundary first.

Where a mechanism has more than two moving parts, an ordered chain or a small
table beats a sentence. Prose is a poor container for "A causes B unless C, in
which case D".

## Write it in the reader's language

The map's vocabulary is scaffolding the session built for itself. Almost none of
it survives into the digest.

- **Define every term where it first appears**, in the sentence that uses it, or
  use plain words instead. A term the reader cannot define from this file is a
  hole in it.
- **Replace single letters standing for quantities** with the thing they count.
  Write "four database backends", never `K=4`.
- **Prefer the concrete noun.** Name the file, the repository, the module, the
  action. Where a verb is doing metaphorical work — *earned, buys, rides,
  carries, hangs off* — write the literal action instead.
- **Headings are labels, not punchlines.** A heading says what the section is
  about. A metaphor, a joke or a bare quantity makes the reader decode before
  they can read.
- **Retire the session's private labels.** Numbered tiers, lettered increments,
  "the base", "the rider". Each names something that has a plain description;
  use the description. Where a label genuinely earns reuse, introduce it once
  with its meaning attached.
- **One word, one referent.** Where the source uses a single word for two things
  — *migration* for both a DDL script and moving customer rows — split it and
  name each. Carrying the ambiguity forward hands the reader the author's
  confusion.
- **Leave wayfinder's own bookkeeping out entirely.** Fog, frontier, charting,
  graduating, banking, hand-backs, ticket numbers, resolution paths, blocked-by
  edges. A correction the map recorded is content only as *what we believed, and
  what turned out to be true* — never as a note about which ticket corrected
  which line.
- **Keep the citations, drop the exposition.** The paragraph explaining what a
  React component is does not belong. The file and line do.

## Citations survive the plain-language pass

**Translating vocabulary and deleting evidence are different operations, and the
second rides along with the first unless you stop it.** Every rule above says
replace a technical token with plain words. A file-and-line reference looks like
one of those tokens and is not: it is what turns a claim the reader has to accept
into one they can check.

So the pass that removes `K=4` keeps `WorkflowDef.java:111`.

- **Every load-bearing figure carries where it came from** — the file, the line,
  the commit, the measurement.
- **Every claim a reviewer would dispute carries its citation**, in the sentence
  making the claim rather than gathered at the end.
- **A citation costs four words and buys the whole claim.** It is the cheapest
  thing in the document and the first thing missed, because prose reads more
  smoothly without it.
- **Names are evidence.** Who owns the subsystem, who reviews it, who wrote the
  last commit, and what the numbers behind that are. A digest that says "the CTO
  owns it" reads fine and has thrown away the reviewer list.

This matters twice over: the reader needs it to answer a challenge, and
`to-design-doc` can only carry across what this file holds.

## Keep it short enough to hold

Length is not a style preference here. The reader is trying to hold an argument
in working memory, and every unnecessary line displaces something they need.

- **One home per fact.** Explain it once, in full, in the section where it does
  the most work. Everywhere else it gets one clause referring back. A fact
  explained in three sections reads as three facts and triples the length.
- **One idea per paragraph**, three to five lines. A paragraph carrying three
  ideas through stacked clauses forces re-reading.
- **Cut the restatements.** *Worth noting, worth stating, worth remembering,
  it bears saying, which is worth flagging* — these add emphasis, not
  information. Say the thing once and move on.
- **Bold the term being defined**, not every phrase you want stressed.
  Continuous bolding fragments the sentence and stops signalling anything.
- **A passage that needs a second read is a defect in the passage.** The usual
  cure is not fewer words but the missing mechanism plus the deleted
  restatements — wordiness is normally the symptom of explaining around
  something instead of explaining it.

## Output

Write `understanding.md` beside `map.md`. It is the engineer's own material: not
published, not shared, not source text anyone copies from.

Structure it as an explanation someone talks you through, not as a ticket list.
Where several tickets are one idea, they are one section. Where one ticket holds
two ideas the reader needs separately, split it.

1. **How the pieces fit together.** The systems and how they relate, the
   modules and artifacts that matter, what already exists versus what does not,
   who owns the ground. Short, concrete, and first — every later section assumes
   it. Skip it and the reader meets decisions about a system they cannot picture.
2. **The problem, in plain terms.** What is being solved, why it came up, who
   asked, and what "done" means for this effort.
3. **What got decided, and why.** In the order a newcomer needs them, which is
   rarely the order they resolved in. Lead with whichever decision the others
   hang off. For each: what was chosen, what it beat, and the reason — the
   evidence, not the verdict.
4. **What is still open.** Every unresolved question at full strength, including
   anything the effort deliberately declined to size, and why.
5. **What was surprising.** What the session believed and what proved true, with
   the consequence. One or two lines each, referring back to section 3 rather
   than re-explaining it. This is the part that decays fastest into a design doc
   and the part a reviewer is likeliest to rediscover out loud.
6. **Risks worth flagging.** What could still go wrong, including risks already
   accepted as tradeoffs. One or two lines each, same rule. An accepted risk the
   author cannot articulate is one they will concede under the first push.
7. **How to present it.** The session's decisions about the document itself:
   which framing to lead with, which wording to avoid and why, what to state
   before a reviewer asks. Collect them here.

**Separate what is true from how to argue it.** A wayfinder session decides both
— facts about the system, and how a document should present them — and the
tickets interleave them freely. Carrying that interleaving forward makes every
section do two jobs at once, which is its own source of re-reading. Sections 1
to 3 explain the subject. Section 7 holds the presentation calls.

## Check the citations that carry the argument

The map's citations were true when its tickets ran. Repos move, and the map does
not. Whatever you transcribe is inherited by the design doc and read by people
who own those files, so a stale line number costs credibility that the argument
itself has to spend earning back.

Verify the file-and-line citations behind the load-bearing claims: the ones a
reviewer would look up, and the ones whose numbers drive an estimate. The target
repos are usually checked out near the workspace; find them from the manifest
rather than guessing paths.

- **Line drift is normal.** Correct it silently and move on.
- **A substantive disagreement is a finding.** When the code says something
  different rather than somewhere different, say so in the file. That is new
  information, not a typo.
- **An unverifiable citation keeps its place and gets marked unverified.**
  Dropping it hides the weakest claim in the document.

## Before you finish

Reread the whole file as someone who has never seen the map, and fix what that
reading exposes. In order of what this skill gets wrong most often:

1. **Every claim that would draw "why is that true?"** — supply the mechanism,
   not a firmer restatement of the conclusion.
2. **Every passage you had to read twice.** Find the missing connection, then
   delete whatever was standing in for it.
3. **Every fact explained in more than one section** — keep the fullest, reduce
   the others to a clause.
4. **Every paragraph mixing a fact with advice on how to word it** — the fact
   stays, the advice moves to section 7.
5. **Every term, abbreviation and symbol** a competent outsider could not define
   from the file itself — define it in place or replace it.
6. **Every load-bearing claim without a citation** — restore the file and line
   from the source material.
7. **Every number** — it carries its unit, its driver, and where it came from.

## Out of scope

- **Write for comprehension, not as a draft of the design doc.** `to-design-doc`
  reads this file and transforms it, so shaping sections toward a template's
  headings here means the design doc inherits the distortion instead of a clean
  source. Explain the subject; let the downstream skill do the reshaping.
- **Section 7 is load-bearing for the next step.** `to-design-doc` consumes it as
  the design doc's *voice* rather than as content. It looks like the most
  droppable section and is not.
- **Open questions and risks keep their full weight.** A digest that reads more
  settled than the map is worse than no digest, because it is confidently wrong
  in a room.

---
name: to-design-doc
description: "Fill a design-doc template from a wayfinder session's understanding.md, producing a draft the author edits and owns. Takes the template as a parameter, so it works with any EDD, RFC or ADR skeleton. Use after to-digest, when the engineer is ready to draft the reviewer-facing document."
---

# to-design-doc

Turn `understanding.md` into a filled design document, in the template the team
actually uses.

**This is a reshaping, not a summary.** The two documents have different readers
and different jobs. `understanding.md` exists so its author can hold the argument
in their head; the design doc exists so a reviewer can make a decision. Material
that serves the first actively damages the second, and the transformations below
are where the work is.

## Composition contract

This skill owns the **source-to-template transformation, technical substance,
required template structure, evidence fidelity, constructed-content marking, and
output contract** of the design document.

Other active skills or user instructions may provide modifier constraints for
voice, tone, audience, concision, or presentation. Apply compatible modifiers
*during generation*, not as a post-processing rewrite of the finished design
document.

Modifiers may change how sourced material is expressed, but they must not:

- change, reopen, strengthen, or weaken decisions from `understanding.md`;
- add evidence, facts, estimates, or citations not present in the digest;
- remove or rename template headings;
- collapse ranges or otherwise change the precision of figures;
- hide material this skill requires in the constructed-content block;
- change the output filename or format.

When a modifier conflicts with the template, evidence, or transformation rules
of this skill, this skill wins. Explicit user instructions win over both.

Before drafting, identify any active modifier skills or writing constraints and
apply the compatible ones while filling the template.

### Voice precedence

`understanding.md` may contain a **How to present it** section. Those instructions
are source-specific presentation decisions from the wayfinder session and are
load-bearing input to this skill.

Treat them as the most specific voice/presentation constraints for this design
document. A general modifier such as `in-my-voice` supplies the author's baseline
voice and register; `How to present it` specializes that baseline for this
particular design.

When both apply:

1. preserve this skill's factual and structural contract;
2. apply source-specific `How to present it` guidance;
3. apply compatible general voice/style modifiers.

Do not copy `How to present it` into the document as content.

For a formal design artifact, a general voice modifier should normally use its
formal/professional register unless the user explicitly requests otherwise.

## Why this exists

The engineer has already paid the real cost: they ran the wayfinder session and
read the digest. Retyping what they already understand into a template is
transcription, not thinking, and it is the step where a deadline turns a good
argument into a rushed one.

What must stay theirs is the judgement. So this skill drafts, marks everything it
had to construct, and hands back a document the author edits before anyone else
sees it.

## When to use

After `to-digest` has produced `understanding.md` and the author has read it, when
the reviewer-facing document is the next artifact.

## Usage

```
/to-design-doc work/schema-registry/understanding.md work/schema-registry/design-template.md
```

Two arguments, in this order:

1. **The digest** — `understanding.md` from a `to-digest` run.
2. **The template** — the team's skeleton. EDD, RFC, ADR, anything.

Given one argument, look in that file's directory for the other by common names
(`understanding.md`; `design-template.md`, `template.md`, `*-template.md`). Given
none, ask. **Write the output beside the digest**, named for the template's kind
(a `design-template.md` produces `design.md`), and never over the template.

**Run from `understanding.md`, not from `map.md` or the tickets.** The digest is
the artifact a human has read; drafting from the raw map skips the comprehension
this document is supposed to represent, and produces a worse draft besides,
because the map still carries the session's scaffolding.

## Read the template before writing anything

Headings vary by team and change over time. Take them from the file, in its
order, with its exact wording. Add nothing and drop nothing.

Then map each heading to the digest sections that feed it, and note which
headings have **no** source material. Those are the ones that go wrong.

## The five transformations

### 1. The surprises section mostly dissolves

*What we believed and what turned out to be true* is comprehension scaffolding. A
reviewer needs only what is true. Carry a corrected fact across in its settled
form, with no trace of the correction, and drop the rest.

A finding survives only where the reviewer would otherwise assume the opposite.

### 2. The session's own mistakes disappear entirely

Facts the session banked wrongly and later fixed are provenance. They belong to
the person defending the numbers, never to the person deciding. A document that
narrates its own near-misses spends credibility and buys nothing.

Errors in **other** documents are different: if they are actionable for this
reader, they stay.

### 3. Presentation guidance becomes voice, not content

The digest's *How to present it* section is instructions, not material. None of
it appears as text. All of it shapes the text: what the document opens with, what
it states before being asked, which wording is refused and why, how much
background each figure gets.

Applying it is most of what makes the draft sound like the author.

When another voice/style modifier is active, compose it with this guidance
according to the Voice precedence rules above. Do not run either as a separate
rewrite pass after the technical draft is complete.

### 4. The options table has to be constructed

A wayfinder session produces a recommendation, not a comparison. Build the option
set:

- **Every option a reviewer would raise gets a row.** If someone would ask "why
  not just do X?", X is a row, with the reason it lost. An options table that
  omits the obvious question invites it out loud.
- Include an approach the session established as **unavailable**, where one
  exists. "Considered and impossible" is stronger than silence.
- Include doing nothing, the recommended scope, and at least one scope on each
  side of it.
- One unit of effort across all rows. Mark the recommendation.

### 5. Headings with no source material get an honest answer

Templates ask for things a given session never addressed. *Observability* and
*Security* are the usual cases.

**Answer from adjacent verified material, or write that it was not sized.** Both
are acceptable. Inventing plausible content is not, and it is the strongest pull
in this whole skill, because a fabricated section reads better than an admitted
gap right up until someone asks about it.

## Figures, citations and metadata

- **Every number traces to the digest**, in the same units, with its driver named
  where the digest named one.
- **Citations carry across verbatim.** Do not introduce a file-and-line reference
  the digest does not contain, and do not adjust one to what you assume the code
  says now.
- **Ranges stay ranges.** Collapsing one to a point estimate invents precision the
  session refused.
- **Fill the metadata the digest supports, and leave the rest as the template
  has it.** Target dates, ticket numbers and status belong to the author.
- **Propose reviewers in the field itself**, with a clause each saying what they
  own, wherever the digest records ownership evidence. A name the author edits or
  deletes beats an empty field with the names described at the bottom of the
  document. Flag the proposal in the constructed block so it gets checked, rather
  than withholding it from the field to stay safe.

## Write it so it does not read as generated

This document circulates. Prose that pattern-matches to generated text gets
discounted before its content is weighed, which is a bad trade for an argument
this well evidenced.

These are baseline constraints. An active voice modifier may further specialize
the prose, but may not relax them unless the user explicitly says so.

**Em-dashes are the strongest single tell.** At most one per section, never two in
a sentence. A comma, a colon, a parenthesis or a full stop is almost always
available, and most em-dashes are a full stop avoiding commitment.

- **Say what a thing is.** Write "it is Y" rather than "not just X, it's Y".
- **Let lists be as long as the evidence.** Three items when there are three.
- **Vary sentence and paragraph length.** Uniform rhythm reads as generated even
  when every sentence is fine.
- **Bold defined terms and table headers.** Emphasis bolding scattered through a
  paragraph stops signalling anything.
- **End a section on its last piece of evidence.** Closing restatements are filler.
- **Prefer a number or a path to an intensifier.** "241 of 983 lines" beats
  "a significant reduction".
- **Cut these on sight:** delve, leverage, robust, seamless, landscape, realm,
  testament, underscore, pivotal, crucial, moreover, furthermore, notably,
  importantly, ultimately, "at the end of the day", "it is worth noting". The
  sentence is usually stronger with nothing in their place.

Before finishing, grep the draft for em-dashes and that word list, and fix what
comes back.

## Mark what you constructed

End the file with a block titled **"Before circulating: constructed, not
sourced"**, listing everything the session did not decide. At minimum: the option
set and its framing, any heading answered from adjacent material or marked
unsized, proposed reviewers, and anything where the template forced a choice the
digest does not cover.

The author deletes that block once they have been through it. It is the editing
worklist, and it is where their ownership of the document actually lives.

## Done when

- Every template heading is answered from sourced material or explicitly marked
  as not sized, in the template's own order and wording.
- Every figure traces to the digest, with units and driver intact.
- The options table contains the question a reviewer would ask first.
- The constructed block lists every judgement the skill made on the author's
  behalf.
- The style grep comes back clean.
- Any active modifier constraints were applied during generation without
  changing the template, evidence, decisions, or constructed-content contract.

## Out of scope

- **Judgements stay as the session left them.** A recommendation is not upgraded
  to a fact, a declined option is not quietly reopened, and a stated risk keeps
  its weight.
- **No new evidence.** If the draft needs a fact the digest does not hold, say so
  in the constructed block. Do not go and find it, and do not reason one into
  place.
- **The session's process stays out.** Ticket numbers, resolution order,
  what was corrected when. The reviewer is deciding, not auditing.

---
name: reviewer-adapt
description: "Adapt an engineering explanatory model for a reviewer perspective or reusable reviewer profile. Use when the same technical truth needs different relevance selection, emphasis, ordering, evidence density, or code-nearness for different reviewers."
---

# reviewer-adapt

## Composition contract

This skill follows the repository composition rules.

- Explicit user instructions have highest precedence.
- Preserve source truth, uncertainty, terminology, and decision status.
- Do not invent implementation detail to make an artifact look complete.
- Reviewer adaptation may change emphasis, order, evidence density, code-nearness, and reader-facing inclusion, never facts.
- Keep reviewer classification, persuasion strategy, generation mechanics, source-process bookkeeping, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Fidelity preserves truth, not volume. Downstream reader artifacts may omit source-supported information that is not needed for their review or decision task.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.

## Owns

Private adaptation instructions: reviewer-relevance selection, priorities, likely questions, evidence density, code-nearness, ordering adjustments, concepts needing extra explanation, and material that can remain upstream.

## Decision-relevance test

For each candidate piece of information, ask whether this reviewer needs it to:

1. understand the problem;
2. understand the proposed design and how it works;
3. evaluate a material tradeoff;
4. identify a material risk or failure mode;
5. assess compatibility, migration, or blast radius;
6. make or defend the requested review decision.

If none apply, default to keeping the information in the shared explanatory/source artifacts rather than carrying it into the reviewer branch.

Omission from the reviewer surface does not delete or contradict the underlying truth.

## Process

1. Read the explanatory model and optional reviewer profile.
2. Identify the reviewer's likely information needs, questions, decision task, and established system knowledge supported by the reviewer profile or explicit context.
3. Run a **knowledge-subtraction pass** before adding emphasis. For each established platform behavior, ask whether this design changes it, depends on a non-obvious property of it, or exposes a material consequence or risk. If not, presume the reviewer knows it and keep the primer upstream.
4. Classify explanatory-model material as:
   - **required:** needed for this reviewer's decision;
   - **supporting:** useful evidence/context that may be included when it earns its space;
   - **upstream-only:** true but unnecessary for this reviewer's decision surface, including established behavior removed by the knowledge-subtraction pass.
5. Adjust priority, ordering, evidence density, code-nearness, and inclusion. Prefer the delta, dependency, consequence, or challenge over a tutorial on the surrounding system. Keep the tone neutral and review-oriented: describe what the design does, why, its evidence, tradeoffs, risks, and commitments without sales rhetoric, reassurance, defensiveness, or language that pressures the reviewer toward approval.
6. Convert anticipated pushback into candidate objectives, invariants, evidence, limitations, or implementation details only when decision-relevant.
7. Keep profile labels and source-process provenance private.
8. Write `review-adaptation.md`.

## Compression principle

Reviewer adaptation is allowed and expected to remove information from the reader-facing path.

Preserve decision sufficiency, not exhaustive source coverage. A reviewer should receive enough information to understand, challenge, and decide without replaying the source's exploration history.

More senior or code-near reviewers are not automatically entitled to more text. Their variant should be more compressed when established context removes the need for explanation. Do not reteach known platform mechanics merely to make the document self-contained; preserve only the changed behavior, non-obvious dependency, material consequence, or risk needed for this decision.

## Evidence-preservation rule

Knowledge subtraction applies to explanation, not automatically to technical evidence.

A reviewer may not need a diagram that only reteaches established mechanics. However, preserve or explicitly reconsider a technical representation when it exposes a proposed change, new or changed boundary, runtime interaction, concurrency property, failure mode, compatibility constraint, irreversible choice, or other decision-relevant relationship. Expert familiarity is not by itself a reason to delete that evidence.

Reviewer variants do not need diagram parity. They need decision-evidence sufficiency.

## Must preserve

Technical truth and decision status. Do not omit a material tradeoff, risk, compatibility concern, unresolved question, evidence gap, or decision-relevant technical representation merely to shorten the artifact.

## Do not

Do not invent reassurance, flatter or manipulate the reviewer, argue like an advocate trying to close a sale, narrate the source's twists and turns, expose source-process bookkeeping, or emit headings such as `Adversarial engineering review`, `CTO review`, or skeptical `Claim 1/2/3` rhetoric merely because of the private profile. Avoid `promise`, `claim`, `proof`, and similar advocacy labels when neutral engineering terms such as design, behavior, decision, constraint, consequence, evidence, or commitment are more precise.

## Completion gate

Before returning, verify every required item survives, upstream-only material is not carried forward by default, the knowledge-subtraction pass removed unnecessary primers for established reviewer knowledge, decision-relevant technical evidence was not removed merely because the reviewer is expert, and the adaptation is materially selective rather than a reordered copy of the explanatory model.

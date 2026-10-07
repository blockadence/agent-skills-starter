---
name: reviewer-adapt
description: "Create a private review lens for an engineering design from a reviewer perspective or reusable reviewer profile. Use to focus review attention, likely questions, evidence, risks, and delivery guidance without forking the canonical design document by default."
---

# reviewer-adapt

## Composition contract

This skill follows the repository composition rules.

- Explicit user instructions have highest precedence.
- Preserve source truth, uncertainty, terminology, and decision status.
- Do not invent implementation detail to make an artifact look complete.
- Reviewer adaptation may change review emphasis, reading order, evidence priority, code-nearness, likely questions, and delivery guidance, never facts. It does not fork the canonical design document unless the user explicitly requests a reviewer-specific document.
- Keep reviewer classification, persuasion strategy, generation mechanics, source-process bookkeeping, notation choice, and renderer choice out of reader-facing content.
- Treat source vocabulary and reader-facing vocabulary differently. Preserve source terms internally; introduce or translate them for readers when needed.
- Fidelity preserves truth, not volume. Downstream reader artifacts may omit source-supported information that is not needed for their review or decision task.
- Route defects to the earliest stage that owns them instead of patching only the final artifact.

## Owns

A private **review lens** over the canonical design: reviewer-relevance selection, recommended reading path, priorities, likely questions, evidence to foreground, code-nearness, concepts needing extra explanation, and material the reviewer can safely skim.

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
5. Produce a review lens over the canonical design document. Adjust review priority, recommended reading order, evidence to foreground, code-nearness, likely questions, and material that can be skimmed. Prefer the delta, dependency, consequence, or challenge over a tutorial on the surrounding system. Keep the tone neutral and review-oriented: identify what deserves scrutiny without sales rhetoric, reassurance, defensiveness, or language that pressures the reviewer toward approval.
6. Convert anticipated pushback into candidate objectives, invariants, evidence, limitations, or implementation details only when decision-relevant.
7. Keep profile labels and source-process provenance private.
8. Write `review-adaptation.md` as the private review lens. Do not compose a separate reviewer design document unless the user explicitly requests one.

## Compression principle

Reviewer adaptation is allowed and expected to remove information from the reviewer's recommended reading path without deleting it from the canonical design document.

Preserve decision sufficiency, not exhaustive source coverage. A reviewer should receive enough information to understand, challenge, and decide without replaying the source's exploration history.

More senior or code-near reviewers are not automatically entitled to more text. Their review lens should be more selective when established context removes the need for explanation. Do not reteach known platform mechanics merely to make the document self-contained; preserve only the changed behavior, non-obvious dependency, material consequence, or risk needed for this decision.

## Evidence-preservation rule

Knowledge subtraction applies to explanation, not automatically to technical evidence.

A reviewer may not need a diagram that only reteaches established mechanics. However, preserve or explicitly reconsider a technical representation when it exposes a proposed change, new or changed boundary, runtime interaction, concurrency property, failure mode, compatibility constraint, irreversible choice, or other decision-relevant relationship. Expert familiarity is not by itself a reason to delete that evidence.

A review lens may deprioritize explanatory diagrams, but it must still foreground decision-relevant representations. If an explicitly requested reviewer-specific document is produced, it does not need diagram parity with the canonical document; it needs decision-evidence sufficiency.

## Must preserve

Technical truth and decision status. Do not omit a material tradeoff, risk, compatibility concern, unresolved question, evidence gap, or decision-relevant technical representation merely to shorten the artifact.

## Do not

Do not invent reassurance, flatter or manipulate the reviewer, argue like an advocate trying to close a sale, narrate the source's twists and turns, expose source-process bookkeeping, or emit headings such as `Adversarial engineering review`, `CTO review`, or skeptical `Claim 1/2/3` rhetoric merely because of the private profile. Avoid `promise`, `claim`, `proof`, and similar advocacy labels when neutral engineering terms such as design, behavior, decision, constraint, consequence, evidence, or commitment are more precise.

## Completion gate

Before returning, verify the review lens points to the canonical design rather than silently creating a parallel design document, every required decision surface is foregrounded, the knowledge-subtraction pass removes unnecessary primers from the recommended reading path, decision-relevant technical evidence is not deprioritized merely because the reviewer is expert, and the adaptation is materially selective rather than a reordered copy of the explanatory model.

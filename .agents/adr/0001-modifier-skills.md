# ADR 0001: Modifier skills are generation constraints

## Status

Accepted

## Context

Some skills produce artifacts. Other concerns, such as writing voice, should apply across many producing skills.

A naive pipeline rewrites the finished artifact after generation. That can change semantics, omit required content, or violate the producing skill's structure.

## Decision

Treat modifier skills as generation constraints.

The producing skill owns:

- substance
- technical claims
- required sections
- output structure
- filenames and output contract

Modifier skills own expression within those constraints.

Precedence is:

1. explicit user instructions
2. producer semantic and structural contract
3. modifier constraints

## Consequences

Skills can compose without duplicating style guidance across every producer. Modifier skills must explicitly preserve semantics and structure.

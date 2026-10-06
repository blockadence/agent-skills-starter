---
name: render-html-document
description: "Render an existing Markdown engineering artifact as polished, self-contained, navigable HTML without changing its substantive content. Use for design documents, speaker notes, reports, or other long-form Markdown that needs a reader-facing HTML representation."
---

# render-html-document

## Composition contract

This skill renders an existing semantic artifact. It does not re-author it.

- Preserve headings, technical meaning, terminology, uncertainty, code, tables, links, and diagrams from the source artifact.
- Do not add unsupported engineering claims while improving navigation or presentation.
- Reader-facing HTML must not expose generation mechanics, reviewer classification, or internal pipeline metadata.
- The Markdown source remains authoritative.

## Input

One or more existing Markdown artifacts.

## Output

For each input Markdown file, write a sibling `.html` file unless the user specifies another destination.

The HTML must be self-contained enough to open locally without a build step. Prefer embedded CSS and minimal embedded JavaScript over external runtime dependencies.

## Rendering contract

For long-form documents:

- polished responsive typography and spacing;
- semantic HTML structure;
- a navigable table of contents derived from headings;
- stable heading anchors and linkable sections;
- readable code blocks, tables, blockquotes, lists, and callouts;
- responsive diagrams and media;
- useful previous/next or section navigation when the artifact structure benefits from it;
- print-friendly styles;
- keyboard-accessible navigation;
- no loss of source content.

For speaker notes:

- preserve slide boundaries and slide titles when present;
- make slide-to-slide navigation obvious;
- provide previous/next controls and a notes table of contents;
- optimize for rehearsal and presenter scanning without rewriting the notes.

## Process

1. Read the complete Markdown source.
2. Identify its document structure without changing its information architecture.
3. Render semantic HTML.
4. Add navigation appropriate to the artifact type.
5. Preserve or render diagrams using the source-supported representation already present.
6. Open or render the resulting HTML when tooling permits and inspect the actual result.
7. Run `visual-render-audit` on the rendered artifact when visual inspection is available.
8. Repair rendering/layout defects without changing semantic content.

## Do not

Do not use HTML rendering as an excuse to rewrite the source artifact, invent missing sections, change technical conclusions, or create a second independently authored version.

## Completion gate

Confirm every source section is represented, navigation works, content remains faithful, and no blocking rendered-visual defects remain.

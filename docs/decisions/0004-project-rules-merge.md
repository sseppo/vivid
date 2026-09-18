# ADR 0004 — Project rules are a merge of two files

**Status:** accepted, 2026-09-18 (owner ruling R-14); recorded 2026-09-19, Librarian session 6.

## Context
`config/project_rules.md` (2026-01-19) and `config/project_rules_someNewVersion.md` (2026-01-17, 584 B
larger) share sections 1–3. One has §4 "Immutable Legal & Logic Axioms" and no §99 session-hygiene footer;
the other the reverse. The "someNewVersion" name is the older file (X-12). Either looks complete alone.

## Decision
`docs/context/project-rules.md` is a new file: `project_rules.md` as the base, plus §4 restored from
`project_rules_someNewVersion.md`, with a header naming both. Both originals stay archived under
`docs/context/archive/webapp-visualisatium/config/`.

## Consequences
The merged file is the only current statement of project rules; neither original is cited as current.
Written in pass 4 part 2.

**Sources:** plan §Proposed decision records and §New files; s3 ruling 3; D-6.

# ADR 0002 — Dashboards have two canonicals at two levels

**Status:** accepted, 2026-09-18 (owner ruling R-15, with R-13); recorded 2026-09-19, Librarian session 6.

## Context
The dashboard family (inventory F4) ended in a 2026-04-19 pair — `Dashboards_Ultimate_Synthesis.md` and
`Dashboards_Ultimate_Mechanics_PRD.md`, ~9 KB together — that assumes the 70 KB
`Dashboards_Blueprint.md` of 2026-02-23 rather than replacing it. "Newest is canonical" would promote
9 KB and archive the document that holds most of the content.

## Decision
- **Specification:** `docs/design/dashboards/dashboards-blueprint.md`.
- **Strategic layer:** `docs/design/dashboards/dashboards-ultimate-synthesis.md` +
  `dashboards-ultimate-mechanics-prd.md`.
- Each carries a status header pointing at the other level. Per-dashboard `.docx` specifications sit
  beside them (`admin-`, `user-`, `cca-dashboard-spec.docx`); for the admin line, the v3.5 edition is
  canonical and v3 is archived as the changelog-bearing edition (R-13).

## Consequences
A reader looking for "the dashboard spec" reads both levels. Changing either level means checking the
other. Reconciling them into one document is an Architect decision, not a filing one.

**Sources:** plan §Proposed decision records; s3 rulings 2 and 4; D-4.

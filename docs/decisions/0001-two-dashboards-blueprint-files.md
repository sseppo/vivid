# ADR 0001 — Two different documents named `Dashboards_Blueprint.md`

**Status:** accepted, 2026-09-18 (owner ruling R-15); recorded 2026-09-19, Librarian session 6.

## Context
Two unrelated documents shared the name `Dashboards_Blueprint.md` (X-11): a 5,679 B strategic pitch
(`Visualisatium/planning/Dashboard/`, 2026-02-21) and a 69,956 B full master record
(`vivid/.chat_attachments/start/`, 2026-02-23). Neither is a version of the other; the large one cites
`planning/Dashboards_Blueprint.md` as one of its sources. A bare citation of the filename is ambiguous
in two places in the corpus.

## Decision
The 69,956 B document is `docs/design/dashboards/dashboards-blueprint.md`, the canonical specification.
The 5,679 B document stays archived under its original name at
`docs/design/archive/webapp-visualisatium/planning/Dashboard/Dashboards_Blueprint.md`, with a status
header pointing to the canonical one.

## Consequences
Any citation of the bare name `Dashboards_Blueprint.md` in an older document most likely means the
**small** file when it says `planning/…`, and the large one when it names the blueprint as the master
record. Resolve by path, not by name. Mis-cited `specs/…` paths inside the canonical file's body are not
rewritten; its status header says so.

**Sources:** plan §Proposed decision records; s3 ruling 4; `INVENTORY.md` C11.

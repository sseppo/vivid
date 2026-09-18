# `docs/design/dashboards/` — two canonicals at two levels (D-4, ADR 0001, 0002)

"Newest is canonical" gives the wrong answer here, so the reading order is stated:

1. **Strategic layer (newest, 2026-04-19):** `dashboards-ultimate-synthesis.md` and
   `dashboards-ultimate-mechanics-prd.md`. Short (~5 KB each); they assume the specification below.
   Paths under `specs/` cited in their bodies do not exist.
2. **Specification:** `dashboards-blueprint.md` (the 69,956 B blueprint plus its status header). Most of the content
   is here. A different 5,679 B document shared its old name `Dashboards_Blueprint.md`; that one is archived at
   `docs/design/archive/webapp-visualisatium/planning/Dashboard/Dashboards_Blueprint.md` (ADR 0001).
3. **Per-dashboard specifications** (`.docx`, no header possible — status here):

| file | status | was |
|---|---|---|
| `admin-dashboard-spec.docx` | canonical (R-13): the v3.5 edition. `ImprovementsAdmin Dashboard v3.docx` is archived as the edition that carries the changelog, in `docs/design/archive/api-visualisatium/NotebookSources/v0.5/temp2/` | `ImprovementsAdmin Dashboard v3.5.docx` |
| `cca-dashboard-spec.docx` | canonical: highest body version (v1.3), superset of its family (F3) | `CCADasboard_v1.3.docx` |
| `user-dashboard-spec.docx` | canonical: highest body version (v1.4), superset of its family (F2) | `UserDasboard_v1.4.docx` |

Earlier editions of all three are in `docs/design/archive/` (see its README). Several of them carry filenames that
contradict the version in their own body (ADR 0007) — order them by body, never by filename.

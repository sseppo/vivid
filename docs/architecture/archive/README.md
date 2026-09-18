# `docs/architecture/archive/`

Superseded architecture material: earlier tech-stack documents (family F23 and the `04_`/`05_` master editions) and database-schema drafts (family F10). Current: `docs/architecture/tech-stack-master.md`, `docs/architecture/tech-stack-descriptions.md`, `docs/architecture/Database_Schema_Blueprint.md` — none yet checked against the code (R-37; Architect work).

Archived files keep their **original names** under a source label (ADR 0008): `api-visualisatium` = `C:\api\visualisatium`, `webapp-visualisatium` = `C:\ai-stuff\Projects\WebApp\Active\Visualisatium`, `api-vivid` = `C:\api\vivid`. Filenames here often contradict the version in their own body (ADR 0007): order by body, never by filename. `F<n>` / `C<n>` / `Q<n>` are pass-1 inventory labels, mapped in `docs/ledger/registers.md`.

## Files that cannot carry a status header (10)

Every `.md` here carries its own `> **Status:**` line. Binaries, JSON, SQL, text and code cannot, so their status is below — the action and rationale as the approved migration plan recorded them (pass 2, 2026-09-18), and the source path.

| file | status | source |
|---|---|---|
| `api-visualisatium/NotebookSources/DAtabaseStructure.docx` | archive — family F10; superseded by `docs/architecture/Database_Schema_Blueprint.md` | `visualisatium/NotebookSources/DAtabaseStructure.docx` |
| `api-visualisatium/NotebookSources/NewerDocs/Technology Stack-short.docx` | archive — family F23 member; Gemini/Antigravity-era | `visualisatium/NotebookSources/NewerDocs/Technology Stack-short.docx` |
| `api-visualisatium/NotebookSources/Order States.docx` | archive — Gemini-era planning material, superseded as a layer by the Feb-2026 master series | `visualisatium/NotebookSources/Order States.docx` |
| `api-visualisatium/NotebookSources/Tech StackShort.docx` | archive — family F23 member; Gemini/Antigravity-era | `visualisatium/NotebookSources/Tech StackShort.docx` |
| `api-visualisatium/NotebookSources/Technical Briefing Document.docx` | archive — Gemini-era planning material, superseded as a layer by the Feb-2026 master series | `visualisatium/NotebookSources/Technical Briefing Document.docx` |
| `api-visualisatium/NotebookSources/v0.5/temp_safety/Expanded Technology Stack v1.docx` | archive — family F23 member; Gemini/Antigravity-era | `visualisatium/NotebookSources/v0.5/temp_safety/Expanded Technology Stack v1.docx` |
| `api-visualisatium/prompts/TechStack.docx` | archive — family F23 member; Gemini/Antigravity-era | `visualisatium/prompts/TechStack.docx` |
| `webapp-visualisatium/planning/old/Database_Schema_Master.sql` | archive — family F10; superseded by `docs/architecture/Database_Schema_Blueprint.md` | `Visualisatium/planning/old/Database_Schema_Master.sql` |
| `webapp-visualisatium/planning/old/Database_Schema_Master_v3.sql` | archive — family F10; superseded by `docs/architecture/Database_Schema_Blueprint.md` | `Visualisatium/planning/old/Database_Schema_Master_v3.sql` |
| `webapp-visualisatium/planning/old2/Database_Schema_Master_combined.sql` | archive — family F10; superseded by `docs/architecture/Database_Schema_Blueprint.md` | `Visualisatium/planning/old2/Database_Schema_Master_combined.sql` |

Written 2026-09-19, Librarian session 7, from `MIGRATION-PLAN.md` §Plan joined to `git ls-files` (every row matched). Two destination paths in the plan's rationale text were never used — `database-schema-blueprint.md` and `sold-product.docx`; both files kept their names under the citation-count rule, and the real paths are given here.

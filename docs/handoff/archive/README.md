# `docs/handoff/archive/`

Session handoffs. **Librarian handoffs** of the 2026-09 reorganisation are filed here as `YYYY-MM-DD-librarian-sNN-<topic>.md` (with the session's `-working.md` file beside its handoff where one exists). **`pre-repo/`** holds the Gemini-era status and handoff files, kept for provenance; nothing in it is current — the board is `docs/handoff/CURRENT.md`.

Archived files keep their **original names** under a source label (ADR 0008): `api-visualisatium` = `C:\api\visualisatium`, `webapp-visualisatium` = `C:\ai-stuff\Projects\WebApp\Active\Visualisatium`, `api-vivid` = `C:\api\vivid`. Filenames here often contradict the version in their own body (ADR 0007): order by body, never by filename. `F<n>` / `C<n>` / `Q<n>` are pass-1 inventory labels, mapped in `docs/ledger/registers.md`.

## Files that cannot carry a status header (5)

Every `.md` here carries its own `> **Status:**` line. Binaries, JSON, SQL, text and code cannot, so their status is below — the action and rationale as the approved migration plan recorded them (pass 2, 2026-09-18), and the source path.

| file | status | source |
|---|---|---|
| `pre-repo/webapp-visualisatium/planning/handover-to-new-sessions/old/v1/Project_Genesis_Manifest.json` | archive — pre-repository session handoff/status | `Visualisatium/planning/handover-to-new-sessions/old/v1/Project_Genesis_Manifest.json` |
| `pre-repo/webapp-visualisatium/planning/old/project_status._v5.json` | archive — pre-repository session handoff/status | `Visualisatium/planning/old/project_status._v5.json` |
| `pre-repo/webapp-visualisatium/planning/old/project_status.json` | archive — pre-repository session handoff/status | `Visualisatium/planning/old/project_status.json` |
| `pre-repo/webapp-visualisatium/planning/old/project_status_v5.1.json` | archive — pre-repository session handoff/status | `Visualisatium/planning/old/project_status_v5.1.json` |
| `pre-repo/webapp-visualisatium/planning/old2/project_status-combined.json` | archive — pre-repository session handoff/status | `Visualisatium/planning/old2/project_status-combined.json` |


## Librarian handoffs — the 2026-09 reorganisation

| session | file | what it did |
|---|---|---|
| s1 | `2026-09-17-librarian-s1-foundation-proposal.md`, `2026-09-17-librarian-s1-foundation.md` | pass 0: ground, scope, first rulings (R-1…R-11) |
| s2 | `2026-09-17-librarian-s2-inventory.md` | pass 1: inventory of 592 files (later 597) |
| s3 | `2026-09-17-librarian-s3-question-pack.md`, `2026-09-18-librarian-s3-rulings-and-first-commits.md` | rulings Q1–Q5 etc. (R-12…R-20); repo foundation commits |
| s4 | `2026-09-18-librarian-s4-migration-plan.md`, `2026-09-18-librarian-s4-working.md` | pass 2: the migration plan, approved |
| s5 | `2026-09-18-librarian-s5-pass3-execute.md` | pass 3: 418 copies, hash-verified |
| s6 | `2026-09-19-librarian-s6-pass4-part1.md`, `2026-09-19-librarian-s6-working.md` | pass 4 part 1: mechanics, ledger, Architect brief, context, ADRs |
| s7 | `2026-09-19-librarian-s7-pass4-part2-handover.md`, `2026-09-19-librarian-s7-working.md` | pass 4 part 2: READMEs, channel, `CLAUDE.md`, board; handover to the Architect |

s1–s6 are byte copies of the originals in `C:\api\vividvis\valmistelu\from-librarian\` (sha256-identical, 2026-09-19).
Their internal references to "the board" mean the pre-repo board of their day; the board is now `docs/handoff/CURRENT.md`.

Written 2026-09-19, Librarian session 7, from `MIGRATION-PLAN.md` §Plan joined to `git ls-files` (every row matched). Two destination paths in the plan's rationale text were never used — `database-schema-blueprint.md` and `sold-product.docx`; both files kept their names under the citation-count rule, and the real paths are given here.

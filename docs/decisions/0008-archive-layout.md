# ADR 0008 — Archive layout: original names under source-labelled folders

**Status:** accepted, 2026-09-18 (owner ruling R-27, ND-6); recorded 2026-09-19, Librarian session 6.

## Context
About 335 superseded files needed a home. Two source folders, `C:\api\visualisatium` and
`C:\ai-stuff\Projects\WebApp\Active\Visualisatium`, differ only in case and collide on a case-insensitive
disk. Renaming archived files would break the citations between them.

## Decision
- **Current** = family canonicals, the ADR 0003 fullest editions, and the code-era input set
  (`vivid/.chat_attachments/start/`). Everything else is archived **beside its subject**
  (`docs/<area>/archive/…`), keeping its **original filename and relative path**.
- Source folders are labelled: `api-visualisatium` = `C:\api\visualisatium`, `webapp-visualisatium` =
  `C:\ai-stuff\Projects\WebApp\Active\Visualisatium`, `api-vivid` = `C:\api\vivid`. Pre-repo handoffs sit
  in `docs/handoff/archive/pre-repo/`.
- Kebab-case applies forward only, to current files — except names cited in the corpus, which keep them
  (`Products.xlsx`, `Lists-In-database.docx`, `gem_roster.json`, `SoldProduct.docx`,
  `pricing-plan-vivid-v2.xlsx`, `Database_Schema_Blueprint.md`).

## Consequences
Archive paths are long and inconsistent in style, by design. Cited names resolve.

**Sources:** plan §Decisions (conventions 1–2) and §Proposed decision records; s4 addendum.

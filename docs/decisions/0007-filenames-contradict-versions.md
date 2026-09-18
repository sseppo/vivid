# ADR 0007 — Filenames in this corpus contradict their own contents

**Status:** accepted with the plan, 2026-09-18 (R-29); recorded 2026-09-19, Librarian session 6.

## Context
Ordering this corpus by filename gives the wrong answer repeatedly (X-9, L-5):
`AdminDashboard_0.2.docx` holds a document headed v1.3 and is byte-identical to a file named v1.35;
`Tech_Stack_Master_maybe.md` holds a higher version than its unsuffixed sibling;
`project_rules_someNewVersion.md` is the older file; `ImprovementsAdmin Dashboard v3.docx` is larger
than `v3.5`. The current tech-stack master, body header **v12.1**, came from a file named `temp2.md`
(`Visualisatium/planning/temp2.md`).

## Decision
Canonicals were chosen by contents and hashes, and their status headers state the body version and
the source filename. `docs/architecture/tech-stack-master.md` is the v12.1 document from `temp2.md`.

## Consequences
Never infer a document's order or version from its filename here; read the body header, and compare
by hash. A different `temp2.md` (a Gem boot prompt) is archived under
`docs/agent-briefs/archive/webapp-visualisatium/` — same name, unrelated file.

**Sources:** `INVENTORY.md` C9; s2 "Where I was nearly wrong"; plan §Proposed decision records.

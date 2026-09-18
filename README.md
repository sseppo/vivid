# Vivid

An AI generation marketplace. Documentation and code live together in this repository.

> **Name not settled.** *Vivid* is the working name (earlier *Visualisatium*); the choice is the owner's (D-7).
> **State, 2026-09-19:** the documentation reorganisation is complete and the repository has been handed to the Architect.
> Product work resumes from here after dormancy since 2026-04-19.

## Start here

- **`docs/handoff/CURRENT.md`** — the board: where the project stopped and what comes next. Every session starts there.
- `docs/README.md` — the map of `docs/`.
- `CLAUDE.md` — what every Claude Code session loads.

## What is here

| path | contents |
|---|---|
| `apps/web/` | the web app — TanStack Start, Clerk auth, Capacitor config |
| `packages/types/` | `@vivid/types`, shared types |
| `supabase/migrations/` | initial schema and RLS policies |
| `docs/` | product inputs, architecture, design, decisions, ledger, agent briefs, board |
| `legacy/` | superseded code, kept for provenance only |
| `.agents/` | Antigravity-era agent files (see ADR 0006) |

pnpm workspace (`pnpm-workspace.yaml`); Node ≥ 20.

## How the repository came to be

Until September 2026 nothing in this project was under version control. Its material sat in five folders across three tool
generations (Gemini Gems, NotebookLM, Antigravity IDE). In September 2026 it was inventoried (597 files), planned file by file,
copied in with hash verification (419 files, `library commit 1`), and given the structure above (`library commit 2` and this
pass). The record is in `docs/handoff/archive/` (the Librarian's session handoffs) and `docs/ledger/`.

# Vivid — AI generation marketplace: documentation and code in one repository

> Product name not settled (D-7): working name *Vivid*, earlier *Visualisatium*. Board: `docs/handoff/CURRENT.md`.
> Map: `docs/README.md`. Canonical copy of this repository: `C:\api\vividvis\vivid`, remote `github.com/sseppo/vivid`.

## Start here
1. Confirm your ground: `git --no-optional-locks log --oneline -1`; report branch, last commit and tree state
   (`git --no-optional-locks ls-files --others --exclude-standard`, `… ls-files --deleted`,
   `git --no-optional-locks diff --ignore-all-space --stat`). If this is not the repository you expected, stop and say so.
2. Read `docs/handoff/CURRENT.md` and the handoff its *Start here* block names. Name every file you read, by full path.
3. Rules shared by every agent: @docs/agent-briefs/cross-project-mechanics.md
4. Your role's brief is in `docs/agent-briefs/` (the Architect's: `architect.md`). The repository copy wins over any
   settings-box copy.

## Context
@docs/context/product-brief.md
@docs/context/stack.md
@docs/context/constraints.md
@docs/context/glossary.md
Decisions in force: `docs/ledger/decisions.md` · identifiers: `docs/ledger/registers.md` · ADRs: `docs/decisions/`.

## Layout
- `apps/web/` — the web app (TanStack Start); `packages/types/` — `@vivid/types`; `supabase/migrations/` — schema and RLS.
- `docs/` — everything written about the product (see `docs/README.md`).
- `legacy/` — superseded code; history only, never built on (ADR 0005).
- `.agents/` — Antigravity-era agent files, load-bearing where they sit (ADR 0006).

## Commands
Package manager: **pnpm** (workspace at the root). From the root: `pnpm dev`, `pnpm build` (both run in `apps/web`).
The root `pnpm start` calls a `start` script that `apps/web/package.json` does not define. In `apps/web`: `pnpm test`
(vitest), `pnpm preview`. None of these was run during the reorganisation; the last recorded build failed on a corrupt
pnpm store (L-3).
Slash commands in `.claude/commands/`: `/next` — report where the project stands and the next action, from the board.

## Git
The owner pushes, always. Commit only under an owner ruling for this session and repository (D-9). Never push, reset,
checkout, stash, rm, config or rewrite history. On a Cowork mount: `--no-optional-locks` on every read, and no commit
without delete rights (mechanics §9.3).

## Never
- Print a credential value. `apps/web/.env` is git-ignored and holds live keys; report names and shapes only (mechanics §10).
- Settle the product name by using one name as decided.
- Cite `docs/archive/pulpvision/` as Vivid fact (a different product, D-3), or treat `legacy/` as a base.
- Edit `docs/brainstorm/` (only its producing agent may).

## Before you finish
Write your handoff to `docs/handoff/archive/YYYY-MM-DD-<agent>-sNN-<topic>.md` and refresh the board's *Start here* row
in the same pass (mechanics §2–3). A state change that is only in the chat did not happen.

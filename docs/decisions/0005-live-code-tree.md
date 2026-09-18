# ADR 0005 — `C:\api\vivid` is the live code tree; the visualisatium tree is legacy

**Status:** accepted, 2026-09-17 (owner ruling R-10, ND-1 option a); recorded 2026-09-19, Librarian session 6.

## Context
Two uncommitted code trees existed. `C:\api\vivid`: pnpm workspace, `apps/web` (TanStack Start) +
`packages/types` + `supabase/`, newest build artefacts 2026-02-25, the tree the on-disk agent briefs
describe. `C:\api\visualisatium\visualisatium`: TanStack + Netlify, 92 files, newest 2026-02-26, almost
entirely unmodified Create-TanStack-App demo code with Clerk wiring and one pasted HTML snippet.
Both looked plausible; the live tree's last build had **failed** — on a corrupt pnpm store, not a code
fault (L-3).

## Decision
The former `C:\api\vivid` is the repository's code (`apps/`, `packages/`, `supabase/`, root workspace
files). The project-specific part of the other tree is kept at `legacy/visualisatium-web/`; its demo
code was left out (R-23). A provenance note goes to `legacy/README.md` (R-31).

## Consequences
Nothing is built on `legacy/`. The failed build is not evidence against the live tree.

**Sources:** s1 needs-decision ND-1 and addendum; `INVENTORY.md` Summary; plan §Proposed decision records; D-2.

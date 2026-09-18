# ADR 0006 — `.agents/` at the tool path; stale-looking files that are load-bearing

**Status:** accepted with the plan, 2026-09-18 (R-29); recorded 2026-09-19, Librarian session 6.

## Context
Several files look like leftovers and would be the first casualties of a tidy-up:
- `.agents/Architect.md` and `.agents/Builder.md` sit at the repo root because the Antigravity IDE reads
  them there. `Architect.md` differs in bytes and line count from the Architect Gem v1.2 text but is
  **identical after line-ending and whitespace normalisation** (7,693 characters; L-10).
  `Builder.md` is a 222 B stub.
- The TanStack starter logos (`tanstack-word-logo-white.svg`, `tanstack-circle-logo.png`) are imported by
  `apps/web/src/components/Header.tsx:22` and `apps/web/src/routes/index.tsx:60`.
- `apps/web/src/routeTree.gen.ts` is generated but imported by `apps/web/src/router.tsx`.
The inventory had recommended dropping the logos and skipping the generated file; the coupling grep
before archiving showed they are load-bearing (L-12).

## Decision
All of these are kept where they are. `.agents/` files carry **no** status header, because a header
changes what the agent reads.

## Consequences
Removing or moving any of them is a code change for the Architect and Claude Code, made with the
imports, not a documentation tidy-up.

**Sources:** plan §Couplings checked and §Proposed decision records; s3 addendum 2; s4 deviation 2.

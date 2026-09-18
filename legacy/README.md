# `legacy/` — superseded code, kept for provenance

**Nothing is built on anything in this folder** (D-2, ADR 0005). It is history, read-only.

## `legacy/visualisatium-web/` — the superseded web tree

- **Source:** `C:\api\visualisatium\visualisatium\` (a pre-migration source folder; it holds an empty `git init` with no
  commits, which the deletion proposal lists — R-6).
- **What it is:** a TanStack Start + Netlify app, newest file 2026-02-26 — almost entirely unmodified
  Create-TanStack-App starter code, with Clerk wiring, an AI model-selection/vendor-capabilities layer, audio/TTS hooks
  and one pasted HTML snippet (`temp.html`). 36 files are kept: the project-specific part.
- **What was left out (R-23):** 46 Create-TanStack-App demo files (guitars, punk songs, tanchat, demo forms and tables,
  8 example JPEGs), plus build output and `node_modules`.
- **Why it is legacy:** the live code — the former `C:\api\vivid`, now `apps/`, `packages/`, `supabase/` — is the later
  architecture on every measured signal (pnpm monorepo, Supabase schema and RLS migrations, the agent briefs that name
  that stack). The live tree's last build failed on 2026-02-25 on a **corrupt pnpm store, not a code fault** (L-3); do not
  read that failure as a reason to prefer this tree.
- **Contradictions it carries, for the Architect:** its `.cta.json` says npm while the live workspace is pnpm (X-5,
  settled by the lockfile); it targets Netlify (`netlify.toml`) while the live tree has no Netlify config (X-8, open).
- **`legacy/visualisatium-web/README.md` is a byte copy of the starter's own README** ("Welcome to your new TanStack
  app!") and is kept unedited (R-31). This file is the provenance note in its place.

Written 2026-09-19, Librarian session 7 (pass 4 part 2), from ADR 0005, R-10, R-23, R-31 and `git ls-files legacy`.

# Environment

Where things run and what they need. First text 2026-09-19, Librarian session 6; measured from the
repository and the Librarian handoffs. **Never write a credential value into this file.**

## Machines and paths

| what | where |
|---|---|
| repository | `C:\api\vividvis\vivid` on the owner's Windows machine; remote `https://github.com/sseppo/vivid.git` |
| holding area (not in git) | `C:\api\vividvis\valmistelu\` — `from-librarian\`, `research\` (Deep Research exports, D-8), `legacy-env\` (credential copies, D-11) |
| line endings | Windows-origin tree; `.gitattributes` `* text=auto` (+ `eol=crlf` for `.bat`/`.cmd`, `binary` for Office files and images); `core.autocrlf` unset in the repo |
| agent surfaces | Cowork (folder attached, git through the mount — mechanics §9.3), Claude Code (native git), browser/phone chat (no git) |

## Environment variables — names only

| file | variables | state |
|---|---|---|
| `apps/web/.env.example` (committed) | `VITE_CLERK_PUBLISHABLE_KEY`, `CLERK_SECRET_KEY` | placeholders |
| `apps/web/.env` (ignored, `apps/web/.gitignore:6`) | the Clerk pair | rotated keys, 2026-09-19 |

The committed `.env.example` names no Supabase variable, and the ignored `.env` is not read by agents;
how the app reaches Supabase is not established here. Measured 2026-09-19: `grep -rli supabase apps/web/src`
returns no file (the same pattern matches `docs/context/stack.md`, so the instrument works) — the web app
does not yet talk to Supabase.

## Running

`pnpm install` at the root, then `pnpm dev` (→ `vite dev --port 3000` in `apps/web`), `pnpm build`,
`pnpm start`; tests `pnpm -C apps/web test`. **Unverified since the migration** — see `stack.md` for
the last build's failure.

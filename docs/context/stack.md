# Stack — as the code declares it

**Package manager: pnpm.** Measured 2026-09-19 from `package.json`, `pnpm-workspace.yaml`,
`apps/web/package.json`, `apps/web/capacitor.config.ts`, `packages/types/`, `supabase/migrations/`.
This is what the code *declares*, not a decision about what it should be; the planning documents'
stack is in `docs/architecture/tech-stack-master.md` and disagrees in places (X-6, X-7, X-8).
Versions are the declared ranges, not installed versions.

| layer | what | where declared |
|---|---|---|
| workspace | pnpm workspace `vivid-monorepo`; Node ≥ 20; `dev`/`build`/`start` delegate to `apps/web` | `package.json`, `pnpm-workspace.yaml` |
| web app | TanStack Start `^1.132` (React Router, Router SSR Query), React `^19.2`, Vite `^7.1`, TypeScript `^5.7` | `apps/web/package.json` |
| server runtime | Nitro — declared as `npm:nitro-nightly@latest` (unpinned nightly) | same |
| data fetching / state | TanStack Query `^5.66`, Zustand `^5` | same |
| auth | Clerk (`@clerk/tanstack-start ^0.6.5`) | same; keys in the ignored `apps/web/.env` |
| UI | Tailwind CSS `^4.1`, Radix UI, shadcn (CLI), lucide-react, motion, class-variance-authority | same |
| mobile shell | Capacitor (`@capacitor/core ^7`, CLI `^8.1`); appId `com.vivid.app`, webDir `.output/public` | `apps/web/package.json`, `capacitor.config.ts` |
| shared types | `@vivid/types` — Zod/TypeScript types in `packages/types/src/database.ts` | `packages/types/` |
| database | Supabase Postgres: `0000_vivid_initial_schema.sql`, `0001_vivid_rls_policies.sql` | `supabase/migrations/` |
| tests | Vitest `^3`, Testing Library, jsdom | `apps/web/package.json` |
| ORM | **none declared** (X-6) | — |
| deployment | **none configured** (X-8) | — |

Last known build: **failed 2026-02-25** — corrupt pnpm store (`ERR_PNPM_JSON_PARSE`), not a code fault
(L-3). Nothing has been built since the migration.

# Constraints

What any change must respect, as far as it is established. First text 2026-09-19, Librarian session 6;
technical rows measured from the committed code, rule rows from the ledger. Product and legal rules
live in `docs/context/project-rules.md` (the D-6 merge, written in pass 4 part 2) — not restated here.

## Established

1. **Package manager: pnpm**, workspace at the repo root (`pnpm-workspace.yaml`: `apps/*`, `packages/*`;
   `pnpm-lock.yaml`). `apps/web/.cta.json` still says npm — scaffold residue (X-5).
2. **Node ≥ 20** (`package.json` `engines`).
3. **Secrets never enter git.** `.env` and `.env.*` are ignored except `.env.example`; legacy env copies
   live outside the repo (D-11). A credential gate runs before every commit and a history gate before
   the first push of project material (mechanics §10).
4. **The owner pushes; agents commit only under a ruling**, and on a Cowork mount only with delete
   rights (D-9).
5. **`.agents/` stays at the repo root** — the Antigravity IDE reads it there; no header is added to
   its files (ADR 0006).
6. **Starter assets and `src/routeTree.gen.ts` are load-bearing** — imported by the app (ADR 0006).
7. **`legacy/` is not built on** (D-2). `docs/archive/pulpvision/` is not Vivid fact (D-3).
8. **No generated views or trackers** — markdown in the repo is canonical (mechanics §1.4).

## Not established — do not treat as constraints

| question | state | id |
|---|---|---|
| Backend shape (Supabase Edge + Fastify "Red Path" vs server functions only) | contradicted | X-7 |
| ORM (Drizzle in `.agents/Builder.md`; none in the code) | contradicted | X-6 |
| Deployment target (Netlify vs none configured) | contradicted | X-8 |
| Credit value and pricing | latest kept provisionally: 1 credit = €0.10 | D-13 |

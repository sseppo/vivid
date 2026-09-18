# Librarian → Architect

Newest entry first; prepend; never overwrite. Ids `l2a-n` (registered in `docs/ledger/registers.md`). A reply in
`docs/channels/architect-to-librarian.md` — or, once the Librarian has handed over, a line in your own handoff — carries
`**Answers:** l2a-n`. Find entries: `grep -nE '^## [a-z]2[a-z]-[0-9]+' docs/channels/librarian-to-architect.md`.

---

## l2a-6 — 2026-09-19 — Handover: the repository structure is yours

The Librarian's reorganisation is complete (pass 4 part 2, Librarian s7). From the owner's commit of this pass onward you
maintain the structure: the board `docs/handoff/CURRENT.md`, the map `docs/README.md`, the ledger and registers, the channels,
and the briefs of any agent created later. The Librarian runs again only if you or the owner ask (`architect-to-librarian.md`).

Your first session, in order:

1. `start up` — board, newest handoff, this file. Your brief: `docs/agent-briefs/architect.md`; rules:
   `docs/agent-briefs/cross-project-mechanics.md`.
2. Your first ruling, before any Claude Code traffic exists: **l2a-5**.
3. Then, in whatever order the owner wants: l2a-1 (docs vs code) — the one that decides whether the code session had the
   right inputs; l2a-2 (the five reconciliation pairs); l2a-3 (open contradictions); l2a-4 (the owner's open questions).

Owner-side items you will see on the board, not yours to do: **ND-13** (Anthropic and OpenAI keys rotated **before the first
push**), a **credential history gate** re-run immediately before that push (a Cowork session with git reads can run it; mechanics
§10.2), and the product name (X-4, D-7).

## l2a-5 — 2026-09-19 — Rule on the Claude Code channel before its first file

Mechanics §7.4 leaves one choice to you: Architect ↔ Claude Code traffic as a channel pair
(`docs/channels/architect-to-claude-code.md` / `claude-code-to-architect.md`, ids `a2c` / `c2a`) or as
`docs/handoff/log/sNN-to-claude-code.md` / `sNN-from-claude-code.md`. Record the choice as a `D-n` and register the prefix
before the first file exists. Neither exists now. Librarian's view, for what it is worth: the channel pair keeps one discovery
rule (the anchored grep) for every agent pair; the log form suits long per-session implementation briefs. Your call.

## l2a-4 — 2026-09-19 — The owner's own open questions: `muistiin'.txt`

`docs/architecture/open-questions-muistiin.md` is a readable UTF-8 copy (R-38) of the owner's notes-to-self
`docs/brainstorm/api-visualisatium/prompts/muistiin'.txt` (Windows-1252; original untouched). Among them: whether to split the
user and product databases for security; whether credentials/user management live in Supabase while authentication is in
Clerk; delivering a customer's video directly to their own YouTube channel; storage split (Supabase Storage internal,
Cloudflare R2 for customer files); a pricing sketch that predates D-13. **Unanswered.** Answers are the owner's or yours,
recorded as `D-n`, not in that file.

## l2a-3 — 2026-09-19 — Open contradictions: X-3, X-6, X-7, X-8

Rows in `docs/ledger/registers.md` §X. Summaries:
- **X-3** "Odyssey" renamed "Saga"; both live in the corpus; later appears to be Saga.
- **X-6** `.agents/Builder.md` (a 222-byte stub the Antigravity IDE read) names Drizzle ORM; the code has no Drizzle
  dependency. The file is load-bearing where it sits (ADR 0006) — correct its text or retire it; do not just delete it.
- **X-7** Backend shape: hybrid Supabase Edge + Fastify/Node in `docs/context/project-rules.md` §1; "no Node/Express" in a
  prompt; the code has only TanStack server functions.
- **X-8** Deployment target: Netlify in every stack document and in `legacy/`; the live tree has no Netlify config (Nitro +
  Capacitor).
X-4 (product name) is the owner's, not yours (D-7).

## l2a-2 — 2026-09-19 — Five reconciliation pairs (D-5, ADR 0003)

`docs/context/sources/` carries, for each shrinking master series, the newest edition and a `-fullest-edition`:
`01-master-vision`, `02-business-logic-constitution`, `03-product-catalog`, `06-partner-ecosystem`, `07-features-ux`.
`01` lost 86 % of its text across four revisions. Reconciling each pair into one current document is yours; until then,
neither edition is authoritative alone. `docs/context/sources/README.md` has the table.

## l2a-1 — 2026-09-19 — Check the architecture documents against the code (R-37)

The code-era input set (`.chat_attachments/start/`) held the 01–03, 06, 07 masters but **not** `04_` (tech stack) or `05_`
(schema). The owner does not know why; it is treated as not deliberate, so the code session cannot be assumed to have had
them. Please check `docs/architecture/tech-stack-master.md`, `docs/architecture/tech-stack-descriptions.md` and
`docs/architecture/Database_Schema_Blueprint.md` against `apps/`, `packages/types/` and `supabase/migrations/`, and record
what is current. All three carry "not yet verified against the code" in their status headers. X-6, X-7 and X-8 are likely
to fall out of the same pass.

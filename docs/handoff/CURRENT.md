# CURRENT — Vivid — the board

**This is the board, and the only copy of it. Newest state first.** Rules for it: `docs/agent-briefs/cross-project-mechanics.md`
§2. Product name not settled (D-7): working name *Vivid*, earlier *Visualisatium*.
The pre-repository board `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md` now holds only a pointer here.

## Start here

Read these in order and name each by full path in your first message:

1. `docs/handoff/archive/2026-09-19-librarian-s7-pass4-part2-handover.md` — **newest handoff** (Librarian s7: pass 4 part 2,
   the handover to the Architect).
2. `docs/channels/librarian-to-architect.md` — head entry `l2a-6` (handover), then `l2a-5` … `l2a-1`.
3. Your brief: `docs/agent-briefs/architect.md`; the shared rules: `docs/agent-briefs/cross-project-mechanics.md`.
4. `docs/ledger/registers.md` (every id, open items) and `docs/ledger/decisions.md` (D-1 … D-13).

## Repo-state stamp — as at 2026-09-19, Librarian s7 close

| repository | branch | commits | tree | remote |
|---|---|---|---|---|
| `C:\api\vividvis\vivid` | `main`, **4 ahead** of the local `origin/main` ref | 5 — last `ae2f4cf library commit 2` | **uncommitted: 42 paths** — 31 new files and 11 modified (root `README.md`, three `docs/context/` files, three `docs/ledger/` files, four archive status headers per R-43); 0 deleted. No `*.lock`, no `tmp_obj_*` | `https://github.com/sseppo/vivid.git` |

Commits, oldest first: `86d4bd2 first commit` (owner) · `9971069 chore: repo foundation — line-ending and ignore rules`
(Librarian) · `54ecccd docs: replace placeholder README with repository status` (Librarian) · `0b9f6c3 library commit 1` (owner;
pass 3, 419 files) · `ae2f4cf library commit 2` (owner; pass 4 part 1). **Nothing has been pushed since `86d4bd2`** (per the local `origin/main` ref; no network fetch from here).
All git reads on the Cowork mount use `git --no-optional-locks`. This stamp was measured, not copied (the s6 stamp was stale:
it listed commits only to `0b9f6c3`).

## State of play

**2026-09-19 — Librarian s7: pass 4 part 2 done; the reorganisation is complete and the repository is handed to the
Architect** (l2a-6), effective when the owner commits this pass. Written this session: every §New-files README (sources,
research pointer list, dashboards, gem-era, pulpvision, `legacy/README.md`, brainstorm, five `archive/` READMEs),
`docs/context/project-rules.md` (D-6 merge), `docs/architecture/open-questions-muistiin.md` (R-38), the first channel file
(`l2a-1` … `l2a-6`), `CLAUDE.md` (48 lines), `.claude/commands/next.md`, the root `README.md` rewrite, `docs/README.md`, this
board; s1–s6 handoffs copied into `archive/` (hash-identical). ND-15 resolved by measurement. Credential gate over the 42 paths:
0 hits.

2026-09-19 — Librarian s6: pass 4 part 1 (mechanics, ledger, Architect brief, context, ADRs) → owner commit `ae2f4cf`.
2026-09-18 — Librarian s5: pass 3 (418 plan rows copied, hash-verified) → owner commit `0b9f6c3`.
2026-09-17/18 — Librarian s1–s4: foundation, inventory (597 files with exclusions `node_modules`, `.git`, `.output`,
`.tanstack`, `.netlify`, `.pnpm-store`), rulings, plan.
Before that: **dormant since 2026-04-19** (R-9); no version control at all before 2026-09-17.

## Next sessions, in order

1. **Owner: commit pass 4 part 2** (suggested message in the s7 handoff). Q-s7-1 is ruled and applied (R-43).
2. **Owner: create the Architect Claude Project** from `docs/agent-briefs/architect.md` (paste "The instructions" into the
   settings box) and select the 12-file GitHub-synced set listed at the end of that brief. The sync set is only useful
   **after a push**.
3. **Before the first push:** the owner rotates the Anthropic and OpenAI keys (ND-13, R-41); then a Cowork session re-runs
   the credential **history** gate over all blobs (mechanics §10.2). Then the owner pushes and presses *sync* in the Project.
4. **Architect s1:** `start up`; first ruling l2a-5 (Claude Code channel form); then l2a-1 (docs vs code, R-37), l2a-2
   (five reconciliation pairs), l2a-3 (X-3, X-6, X-7, X-8), l2a-4 (the owner's open questions).
5. Owner, whenever: the deletion proposal `C:\api\vividvis\valmistelu\from-librarian\DELETION-PROPOSAL.md` (R-6, D-1).

## Decisions in force

`docs/ledger/decisions.md` D-1 … D-13; ADRs `docs/decisions/0001` … `0008`; owner rulings R-1 … R-43 in `registers.md`.
Load-bearing now: D-2 (live code vs `legacy/`), D-3 (pulpvision is another product), D-5 (fullest + newest carried), D-7 (name
not settled), D-9 (the owner pushes; commits are his unless ruled), D-10 (Architect = Claude Project; Claude Code implements),
D-11 (credentials), D-13 (credit peg €0.10, provisional).

## Open needs-decision

- **ND-13 (owner):** rotate the Anthropic and OpenAI keys before the first push. Blocks the push.
- **X-4 (owner):** product name.
- **Architect:** X-3, X-6, X-7, X-8; the D-5 reconciliation pairs; R-37 docs-vs-code check; the `a2c` channel form.

## Channels

| file | ids | state |
|---|---|---|
| `docs/channels/librarian-to-architect.md` | `l2a-1` … `l2a-6` | all unanswered — waiting for Architect s1 |
| `docs/channels/architect-to-librarian.md` | `a2l` | not created; only if a Librarian session is wanted again |
| Architect ↔ Claude Code | `a2c` / `c2a` or `docs/handoff/log/` | not created; the Architect's ruling first (l2a-5) |

## Where the pre-repo material is

| location | role |
|---|---|
| `C:\api\vividvis\valmistelu\from-librarian\` | the Librarian's pre-repo record: `INVENTORY.md`, `MIGRATION-PLAN.md`, `EXECUTION-REPORT.md`, manifests, pass-3 logs, starting prompts, `DELETION-PROPOSAL.md`, and the original handoffs (copies in `docs/handoff/archive/`) |
| `C:\api\vividvis\valmistelu\research\` | the seven Deep Research exports (D-8; listed in `docs/context/sources/research/README.md`) |
| `C:\api\vividvis\valmistelu\legacy-env\` | copies of three legacy env files (see Credentials) |
| `C:\api\vivid`, `C:\api\visualisatium`, `C:\api\pulpvision`, `C:\ai-stuff\Projects\WebApp\Active\Visualisatium`, `C:\ai-stuff\Deep Research\Vivid` | the five source folders — unchanged; the owner holds backups and deletes them himself (D-1). `C:\api\vivid\from-gemini\Takeout\` is outside the corpus |

Material that exists only outside all of these: the Gemini chats, the NotebookLM notebooks, the Google Drive paths in
`gem_roster.json` / `project_manifest.json`, and the Gems' knowledge file `The 2026 Developer Environment.docx`.

## Credentials

Where they are, never their values. `apps/web/.env` in this repo holds the **rotated Clerk keys** (2026-09-19); git-ignored by
`apps/web/.gitignore:6` (re-checked s7). `C:\api\vividvis\valmistelu\legacy-env\` holds copies of three legacy env files: five
live values across two of them (old Clerk pair — now rotated; **Anthropic and OpenAI — not rotated, ND-13**); the third is
placeholders. `C:\api\vivid\apps\web\.env` is a byte-identical copy of one of them (source folder). No secret is in any git
history (history gate, s3 — covers only history up to then; re-run before the first push).

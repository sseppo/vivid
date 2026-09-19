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

## Repo-state stamp — as at 2026-09-19, Librarian s7 (re-grounded after the owner's commit and push)

| repository | branch | commits | tree | remote |
|---|---|---|---|---|
| `C:\api\vividvis\vivid` | `main` = local `origin/main` ref (**0 ahead — pushed**) | 6 — last `f152395 library commit 3` (owner, 2026-09-19 02:16 +0300; pass 4 part 2, 42 files) | clean at that commit; **uncommitted since:** this board, `registers.md`, `decisions.md`, the s7 handoff and working file (addendum 2) — 5 paths. No `*.lock`, no `tmp_obj_*` | `https://github.com/sseppo/vivid.git` |

Commits, oldest first: `86d4bd2 first commit` (owner) · `9971069 chore: repo foundation — line-ending and ignore rules`
(Librarian) · `54ecccd docs: replace placeholder README with repository status` (Librarian) · `0b9f6c3 library commit 1` (owner;
pass 3, 419 files) · `ae2f4cf library commit 2` (owner; pass 4 part 1) · `f152395 library commit 3` (owner; pass 4 part 2).
**All six are pushed** (owner, 2026-09-19; the local `origin/main` ref equals `HEAD` — no network fetch from here).
All git reads on the Cowork mount use `git --no-optional-locks`.

## State of play

**2026-09-19 — owner: pass 4 part 2 committed (`f152395`), Anthropic and OpenAI keys rotated, all six commits pushed.**
Librarian s7 then re-ran the credential history gate over the pushed history: 0 hits. The Architect Project is not created yet.

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

1. ~~Owner: commit pass 4 part 2~~ — done, `f152395`. ~~Rotate Anthropic/OpenAI keys~~ — done (owner, 2026-09-19).
   ~~Push~~ — done. History gate — run **after** the push (s7, addendum 2): 0 hits.
2. **Owner: commit this board refresh** (5 files; message in the s7 handoff, addendum 2) and push it.
3. **Owner: create the Architect Claude Project** from `docs/agent-briefs/architect.md` (paste "The instructions" into the
   settings box), select the 12-file GitHub-synced set listed at the end of that brief — all 12 now exist on the remote —
   and press *sync* after the push of step 2.
4. **Architect s1:** `start up`; first ruling l2a-5 (Claude Code channel form); then l2a-1 (docs vs code, R-37), l2a-2
   (five reconciliation pairs), l2a-3 (X-3, X-6, X-7, X-8), l2a-4 (the owner's open questions).
5. Owner, whenever: the deletion proposal `C:\api\vividvis\valmistelu\from-librarian\DELETION-PROPOSAL.md` (R-6, D-1).

## Decisions in force

`docs/ledger/decisions.md` D-1 … D-13; ADRs `docs/decisions/0001` … `0008`; owner rulings R-1 … R-43 in `registers.md`.
Load-bearing now: D-2 (live code vs `legacy/`), D-3 (pulpvision is another product), D-5 (fullest + newest carried), D-7 (name
not settled), D-9 (the owner pushes; commits are his unless ruled), D-10 (Architect = Claude Project; Claude Code implements),
D-11 (credentials), D-13 (credit peg €0.10, provisional).

## Open needs-decision

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
values across two of them — **all five now dead**: Clerk rotated 2026-09-19, Anthropic and OpenAI rotated 2026-09-19 (owner;
ND-13 resolved). The third is placeholders. `C:\api\vivid\apps\web\.env` is a byte-identical copy of one of them (source folder).
**History gate re-run 2026-09-19 (s7) over every blob reachable from any ref at `f152395`: 484 blobs, 0 hits** — instrument
validated on the legacy copies (8 hits) and a redacted control (0). It ran after the push rather than before; no secret was
there to be pushed. `legacy-env\` may now go (deletion proposal §3).

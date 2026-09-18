# Librarian session 7 — Vivid — pass 4, part 2: READMEs, channel, CLAUDE.md, board; handover to the Architect

Date: 2026-09-19 · Surface: Cowork (cloud session linked to device `desktop-099f4ri`), six folders attached:
`C:\api\vivid`, `C:\api\visualisatium`, `C:\api\vividvis`, `C:\api\pulpvision`,
`C:\ai-stuff\Projects\WebApp\Active\Visualisatium`, `C:\ai-stuff\Deep Research\Vivid`.
Working file: `docs/handoff/archive/2026-09-19-librarian-s7-working.md` (copy; original in `valmistelu\from-librarian\`).
Commit mode: R-32 — the owner commits; this session made **no git write** and had no delete rights.

## Ground at start

`C:\api\vividvis\vivid`: `main`, 5 commits, last `ae2f4cf library commit 2`, 4 ahead of local `origin/main`; 0 untracked,
0 deleted; 5 whitespace-insensitive modifications (the s6 addendum-2 files); no `*.lock` / `tmp_obj_*`.
`C:\api\vivid\apps\web` and `C:\api\visualisatium\visualisatium`: empty `git init`s (25 / 92 untracked). No other repository.
Board found at level 2 (`valmistelu\from-librarian\CURRENT.md`); its Start-here pointed at s6, the newest by filename date then
`sNN` — correct. **Its repo-state stamp was stale** (commit list stopped at `0b9f6c3`, "three unpushed"); measured 5 / 4.
`check-ignore -v apps/web/.env` → `apps/web/.gitignore:6`.

**Read:** the board; `2026-09-19-librarian-s6-pass4-part1.md` (both addenda); `docs/ledger/registers.md`, `decisions.md`,
`learnings.md` (head and tail); `STARTING-PROMPT-pass-4-new-files.md`; `MIGRATION-PLAN.md` §Needs decision, §New files, §Proposed
decision records, the head of §Status headers, and §Plan rows (parsed, all 418); `pass3-research-log.json`,
`pass3-headers-applied.json`; `INVENTORY.md` C2 only; s3 handoff addendum 2; `cross-project-mechanics.md`,
`agent-briefs/architect.md`, `context/CLAUDE-TEMPLATE.md`, ADR 0004, ADR 0005; the Librarian Project doc
`claude/librarian-project-startup-pack.md`. **Not read:** s1–s5 handoffs in full (copied, hash-checked, not re-read);
`EXECUTION-REPORT.md`; `INVENTORY.md` beyond C2.

## What landed — uncommitted, for the owner's commit

| file | written from |
|---|---|
| `docs/context/sources/research/README.md` | `pass3-research-log.json`; all seven re-hashed against `valmistelu\research\` — match |
| `docs/context/sources/README.md` | status headers of the ten `.md`; plan rows for the binaries; D-5, D-13, R-37, R-39, R-40; `INVENTORY.md` C2 |
| `docs/design/dashboards/README.md` | status headers; plan rows (F1–F3); R-13, R-15, ADR 0001/0002/0007 |
| `docs/agent-briefs/archive/gem-era/README.md` | s3 addendum 2; `gem_roster.json`; the ND-15 measurement (below) |
| `docs/{agent-briefs,architecture,context,design,handoff}/archive/README.md` | generated: plan §Plan rows joined to `git ls-files` for every file that cannot carry a header (56 / 10 / 91 / 51 / 5 — every row matched) + intro; handoff one also lists the Librarian handoffs |
| `docs/archive/pulpvision/README.md` | D-3, R-12, X-10, plan rows |
| `legacy/README.md` | ADR 0005, R-10, R-23, R-31, `git ls-files legacy` (36). `legacy/visualisatium-web/README.md` untouched |
| `docs/brainstorm/README.md` | pack rule; ADR 0008 |
| `docs/architecture/open-questions-muistiin.md` | R-38: Windows-1252 → UTF-8 of `muistiin'.txt`, CRLF → LF; body round-trips to the source bytes |
| `docs/context/project-rules.md` | D-6 / ADR 0004: base `project_rules.md` + §4 from `project_rules_someNewVersion.md`, assembled by script from the two archived files (§1–3 measured identical) |
| `docs/channels/librarian-to-architect.md` | l2a-1 … l2a-6: R-37 check, D-5 pairs, X-3/6/7/8, muistiin, the `a2c` ruling, handover |
| `CLAUDE.md` (48 lines), `.claude/commands/next.md` | `CLAUDE-TEMPLATE.md`; `package.json` scripts (root `start` calls a script `apps/web` does not define — stated) |
| `README.md` (root, rewritten — R-19) | board, commit stats (`0b9f6c3`: 419 files) |
| `docs/README.md`, `docs/handoff/CURRENT.md` | the tree as built; the pre-repo board |
| `docs/handoff/archive/` ten s1–s6 files | `cp -n` from `valmistelu\from-librarian\`; sha256 lists identical |
| `docs/ledger/registers.md`, `learnings.md` (edited) | ND-15 resolved; R-6/14/31/38/40/42 statuses; `l2a` highest `l2a-6`; L-14, L-15 |
| this handoff; the s7 working file (copy) | — |

Outside the repo: `valmistelu\from-librarian\DELETION-PROPOSAL.md` (R-6, D-1); the old `CURRENT.md` there is now a pointer, its
last full text kept beside it as `CURRENT-retired-2026-09-19.md`.

**ND-15, measured:** the Takeout's Creator and Guidance blocks and the `from-gemini` files are word-identical instruction texts;
the ND-14 differences (70 / 38 characters) are the Takeout's wrapper labels (`Instructions:`, `Files: …`, the next block's `Name:`).
Resolved without an owner question. By-product: both Gems had a Gemini knowledge file `The 2026 Developer Environment.docx`,
not in the corpus.

**Credential gate** over the commit surface (every untracked + modified path, listed by `git ls-files --others
--exclude-standard` and `git diff --ignore-all-space --name-only`): 10 patterns; known positive `valmistelu\legacy-env\*.legacy`
→ 8 hits (counts only; more than s6's 5 values because patterns overlap); redacted control → 0; **surface, 38 paths (31 new, 7 modified) at close → 0 hits.**

## Deviations

1. `docs/handoff/archive/README.md` was not in plan §New files; written because `pre-repo/` holds five JSON files without
   headers (the plan's own rule), and it doubles as the index of the Librarian handoffs.
2. The plan named the legacy note `legacy/visualisatium-web/README.md`; R-31 moved it to `legacy/README.md` — followed R-31.
3. The s4 and s6 `-working.md` files were copied into the archive beside their handoffs under their existing names (not `-2`),
   because `registers.md` already cites them by those names.
4. Plan rationale text names two paths that were never created (`database-schema-blueprint.md`, `sold-product.docx`); the
   generated READMEs give the real ones and say so. The same wrong path sits in four committed headers: Q-s7-1.

## Needs decision

**Q-s7-1 (owner).** Four committed status headers — `05_Database_Schema_Master.md`, `05_Database_Schema_Master_v2.md`,
`Data_Schema_Strategy.md`, `Database_Schema_Plan.md` under `docs/architecture/archive/webapp-visualisatium/planning/…` — say
"superseded by `docs/architecture/database-schema-blueprint.md`". That path does not exist; the file is
`docs/architecture/Database_Schema_Blueprint.md` (name kept, plan line 42). Measured by resolving every backticked path in every
tracked `.md`.
1. (a) Correct the path in those four header lines only; bodies stay byte-identical. **Recommended** — the header is the
   Librarian's text, the path is wrong, and a header pointer is exactly what the next session follows.
2. (b) Leave them; `docs/architecture/archive/README.md` gives the real path.
Either way the next agent reading one of those headers must not conclude the blueprint is missing.

## Deferred

Nothing from the pass-4 list. Out of scope and handed on: everything in l2a-1 … l2a-5 (Architect); ND-13 and the pre-push
history gate (owner, then any Cowork session with git reads).

## Where I was nearly wrong

- **A byte count I had already printed, and did not read.** I wrote "Windows-1252 / Latin-1 — no byte in 0x80–0x9F" into the
  muistiin header in the same step that printed four 0x80 bytes. They are `€` after four prices; Latin-1 would have made them
  control characters. Caught by reading the decoded text back.
- **A negative from memory.** "`ProductsAndPrices.docx` is not in the corpus under that name" went into the project-rules header
  before I grepped; the manifest has it 12 times and the plan archives it (F35). This is the s6 `environment.md` failure again
  (L-14).
- **I duplicated 11.6 KB of `registers.md`.** A splice anchored on the first `| ND-15 |`, which is the series-summary row, not
  the ND-15 row; the slice was empty and the write doubled the file. The file carried uncommitted addendum-2 edits, so `HEAD`
  could not restore it. Recovered arithmetically from the broken file (kept in session scratch), then checked line by line
  against `HEAD`: only intended changes remain. Anchor on a unique string and assert the slice is non-empty before writing.
- **Nearly trusted the plan's paths.** The README generator first copied the plan's rationale verbatim; a path-resolution pass
  over my own output found the two dead destination paths, and then the four committed headers (Q-s7-1).

## Findings for the Librarian Project docs

Written to `claude/librarian-handoff-from-vivid.md` in the Librarian Project, with numbered corrections to the pack.

## Suggested commit message (owner commits)

```
docs: pass 4 part 2 — READMEs, channel, CLAUDE.md, board; handover to Architect

- READMEs for sources, research pointer list, dashboards, gem-era,
  pulpvision, brainstorm, legacy/, and five archive/ folders
- docs/context/project-rules.md (D-6 merge)
- docs/architecture/open-questions-muistiin.md (R-38)
- docs/channels/librarian-to-architect.md (l2a-1..l2a-6)
- CLAUDE.md, .claude/commands/next.md, root README.md rewrite
- docs/README.md; the board moves to docs/handoff/CURRENT.md
- Librarian handoffs s1-s7 in docs/handoff/archive/
- ledger: ND-9..ND-15 answered (R-37..R-42, D-13), L-14, L-15

Credential gate over the commit surface: 0 hits.
```

## Locks left behind

None. No git write was made; `.git` has no `*.lock` and no `tmp_obj_*`.

---

## Addendum — 2026-09-19, same session: Q-s7-1 ruled

The owner ruled **(a), as recommended** → minted **R-43** (spent). The dead path was replaced in the first line of the four
F10 archive files only. Verified per file: the header now names `docs/architecture/Database_Schema_Blueprint.md`, and the body
after line 1 is identical to `HEAD` (CR-stripped comparison; the blob in `HEAD` is LF-normalised). `git diff --stat`: 4 files,
4 lines. No dead path is left in any header under `docs/architecture/archive/`. Commit surface is now **42 paths (31 new,
11 modified)**; credential gate re-run at close: 0 hits. Add to the commit message:
`- fix dead blueprint path in four archive status headers (R-43)`.

# Librarian session 2 — Vivid / Visualisatium — pass 1 close (inventory)

Date: 2026-09-17 · Surface: Cowork, folders attached, device `desktop-099f4ri`
Board read: `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md`
Handoff read: `…\2026-09-17-librarian-s1-foundation.md`
Prompt followed: `…\STARTING-PROMPT-pass-1-inventory.md`
Skill used: `docs-inventory` (confirmed available before the pass, together with `migration-plan` and
`migration-execute` for later passes)

## Ground at start

Six connected folders, all reachable, all matching the board's repo-state stamp:

| repository | branch | commits | tree |
|---|---|---|---|
| `C:\api\vividvis\vivid` (target) | `main` | **0** | 2 untracked: `.gitattributes`, `.gitignore` |
| `C:\api\visualisatium\visualisatium` (source) | `main` | **0** | empty init, no remote |
| `C:\api\vivid\apps\web` (source) | `main` | **0** | empty init, no remote |

No `.git/index.lock` in any of the three, before or after. Every git read used `--no-optional-locks`.
No closing `git status` was run; what this session wrote is listed from its own record.

## What landed

Two files, both in `C:\api\vividvis\valmistelu\from-librarian\`:

- **`INVENTORY.md`** (164 KB, 1180 lines) — one row per file for all 592, sorted by path, with class,
  a contents line read from the file itself, a date with its evidence basis, bytes, version-family id and
  confidence; then 36 version families, 12 contradictions, referenced-but-absent, present-only-elsewhere,
  orphans, shared-vs-role-specific, unreadable, the credential gate, 12 questions, a
  not-recommended-for-the-repo list, and an owner for every action item the pass raised.
- **`manifest.json`** (590 KB) — the instrument beside the inventory: sha256, bytes, mtime, extension,
  extracted opening text (600 chars) and headings for every file, plus the duplicate groups, the CRLF
  list and the exclusion list. This is what makes the inventory diffable against a later re-scan; the
  prose table is not evidence of sameness.

Nothing in any of the five source folders was created, changed, renamed or deleted. Pass 1 was read-only.

## Manifest verification (the prompt's first requirement)

An independent re-walk and re-hash of all five folders reproduced `manifest-2026-09-17.tsv` exactly:
592/592 paths matched, **0 hash mismatches, 0 mtime mismatches**, same total bytes (76,641,896), same 72
duplicate groups, same per-folder counts. Two instruments built separately agree, so the session-1
manifest is current and nothing on disk moved between the sessions.

Exclusion-set equivalence was measured rather than assumed: no `dist`, `build`, `.next`, `__pycache__`,
`.venv`, `.idea`, `.turbo` or `.gradle` directory exists anywhere in the five folders, so the session-1
exclusion list and the `docs-inventory` scanner's default produce the same 592 files.

## The four findings that should reach pass 2 first

1. **`pulpvision` is a different product.** Its two files describe a subscription video-channel site with
   Watcher/Creator memberships — not the AI generation marketplace. The board's "earliest naming"
   description is not supported by the disk. Inventory C10, question 1.
2. **Every numbered master series shrinks with each revision.** `01_Master_Vision` went 19,792 B →
   2,852 B over four revisions; `07_Features_UX` lost 26 %; `06_Partner` lost 15 %. You diagnosed the
   cause yourself in January (`temp - Creator Gem prompts.docx`: newer files "missing much of older
   information due to Gem getting out of space"). **Promoting the newest member of these families and
   archiving the rest destroys content.** Question 5 has to be answered before pass 2 can choose a
   canonical for F5, F7, F11 or F12.
3. **The Gem system-instruction files are not on disk.** `gem_roster.json` names one per Gem and points
   at Google Drive; `Visualisatium\system_instructions\` and `Visualisatium\prompts\` are the corpus's
   only two empty directories. Two texts survive under other names (Planning Gem v3.6 as
   `planning\specs\temp.md`; Architect Gem v1.2 as `vivid\.agents\Architect.md`). Five Gems have nothing.
4. **Two more live credentials than the board records.** `visualisatium\.env.local` holds an
   **`ANTHROPIC_API_KEY`** and an **`OPENAI_API_KEY`** alongside the Clerk publishable key — neither was
   previously identified. Five live values across two files, both already copied into `legacy-env\`.

## Credential gate

Full gate, allowlist at zero, over all 592 files. Ten patterns, each validated against a known positive
**and** a redacted control before any negative was trusted; all ten passed both directions. Two files
matched, both already known env files. `git rev-list --all --count` is **0** in all three repositories —
**no secret from this project is in any git history**, and that finding is banked here before the first
commit exists.

**One credential must be rotated: `CLERK_SECRET_KEY` in `C:\api\vivid\apps\web\.env`.** Its value was
rendered into this session's tool output while the corpus was being read. It is a `sk_test` development
key, not production, but a credential that has been displayed is reissued whatever it grants. The
Anthropic and OpenAI key values were **not** displayed — only their variable names and lengths.

## Deviations from the prompt

1. **The scanner.** The `docs-inventory` skill bundles `scripts/scan.py`, which takes one folder and has
   its own exclusion defaults. This corpus is five folders and had to keep session 1's exclusion list for
   comparability, and 324 of its files are `.docx`/`.xlsx` that `scan.py` treats as binary. I wrote a
   multi-root equivalent producing the same `manifest.json` schema plus `.docx`/`.xlsx` text extraction,
   and validated it by reproducing the session-1 manifest hash-for-hash (above). Agreement between two
   independently written instruments is stronger evidence than either alone, but the deviation is real
   and is recorded here rather than buried.
2. **Counts in the starting prompt were wrong.** It says "272 of the 592 files are `.docx` and 25 are
   `.xlsx`". Measured: **284 `.docx` and 40 `.xlsx`**. Both were read in full regardless. Corrected in
   the board.
3. **Shared-vs-role-specific was not tabulated for all 309 `agent-instructions` + `durable-reference`
   files.** The instruction files and shared-context documents are listed individually; the reference
   documents are assessed as a class with the exceptions named. Tabulating 245 product-fact documents
   one by one would have produced a table nobody reads and no new information. Stated in the inventory.
4. **Mis-cited paths were not treated as a stop.** Several PRDs carry a `**Filename:** specs/…` line and
   `Dashboards_Blueprint.md` cites `specs/…` sources that actually sit in `planning\Dashboard\`. Under
   standing rule 2 a mis-cited source is not a missing source: I proceeded and recorded it.

## Deferred

- Pass 2 (migration plan) in a fresh session, after the Gemini date-check.
- Agent-recovery prompts for the Gems and the Antigravity agents — now writable, since the inventory
  carries the dated file list per area, but they depend on question 6.
- The deletion proposal for the source folders and the two empty `.git` shells — at the end of the
  Librarian work, not now.

## Needs-decision carried forward

Twelve, all written out with options in `INVENTORY.md` §Questions and summarised in the board. None is
minted as `ND-n` — `docs/ledger/registers.md` does not exist until pass 4, and a row there is what
minting means. `ND-1` remains taken and resolved.

The three that block pass 2: **Q1** (is pulpvision in scope at all), **Q2/Q3/Q4** (which member of F1,
F4 and F16 is canonical), **Q5** (whether the shrinking master series need recovering).

## Where I was nearly wrong

**Twice, and the first one would have gone into the inventory as a finding.**

`vivid\build.log` shows the last build failing because rollup could not resolve `@tanstack/react-query`.
I had already framed that as "the documented stack names TanStack Query but the app does not depend on
it" — a clean, quotable contradiction between documents and code. Then I read `package.json`:
`"@tanstack/react-query": "^5.66.0"` is right there in the dependencies. The build failed because the
pnpm store was corrupt (`pnpm-log.txt` ends in `ERR_PNPM_JSON_PARSE` on a `node_modules` package.json),
not because of a missing declaration. **An error message is evidence of a symptom, not of its cause**, and
I was one step from publishing the diagnosis instead of the measurement.

The second: the credential gate's `stripe` pattern matched `vivid\apps\web\.env`, and for a moment the
file looked like it held a Stripe key as well as Clerk's. It does not — Clerk's `sk_test_…` and Stripe's
`sk_test_…` are the same shape, and one secret matched two patterns. Reporting it would have invented a
third credential out of a regex overlap. The gate now reports variable names, which are unambiguous.

Worth recording for its own sake: the corpus punished filename-based reasoning at every turn.
`AdminDashboard_0.2.docx` contains a document headed v1.3; `Tech_Stack_Master_maybe.md` holds a higher
version than the unsuffixed file beside it; `project_rules_someNewVersion.md` is older than
`project_rules.md`; and `ImprovementsAdmin Dashboard v3.docx` is larger than `v3.5`. The pack's rule
about reading contents rather than names is not a style preference here — every one of those would have
produced a wrong canonical.

## Suggested commit message (owner commits; nothing here is in the repo yet)

These files live in `valmistelu\`, outside the repository, so there is nothing to commit from this
session. The `.gitattributes` / `.gitignore` commit proposed in session 1 is still outstanding.

## Locks left behind

None. All git reads used `git --no-optional-locks`; `.git/index.lock` was checked for and absent in all
three repositories afterwards.

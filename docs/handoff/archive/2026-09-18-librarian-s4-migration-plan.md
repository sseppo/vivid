# Librarian session 4 — Vivid — pass 2, migration plan drafted

Date: 2026-09-18 · Surface: Cowork, six folders attached, device `desktop-099f4ri`
Board read: `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md` (Start-here pointer correct)
Handoff read: `…\2026-09-18-librarian-s3-rulings-and-first-commits.md`
Also read: `…\2026-09-17-librarian-s1-foundation.md` (rulings); `…\INVENTORY.md` — §Summary, §Version families,
§Questions, §Not recommended, §Action items, and the §Files table parsed by script for class/family (not read row by row);
`…\manifest.json` (queried, not read). **Not read:** `…\2026-09-17-librarian-s3-question-pack.md` — the rulings it
supports were taken from the s3 handoff. Stated so it is not assumed.
Working file this session: `…\2026-09-18-librarian-s4-working.md` (start-up findings on the Takeout).

## Ground at start

| repository | branch | last commit | tree |
|---|---|---|---|
| `C:\api\vividvis\vivid` | `main` | `54ecccd docs: replace placeholder README with repository status` | clean; no lock or `tmp_obj_*` |
| `C:\api\vivid\apps\web` | `main` | none | 25 untracked |
| `C:\api\visualisatium\visualisatium` | `main` | none | 92 untracked |

Git reads only, all with `--no-optional-locks`. No git write this session.

## Rulings taken this session

1. **Takeout (`C:\api\vivid\from-gemini\Takeout\`)**: take only the Builder Gem v1.0 text; hash-check the attachments;
   nothing else from it (owner agreed to the recommendation).
2. Pass 2 runs in this session (owner), rather than a further fresh one.

## What landed

- `…\from-librarian\MIGRATION-PLAN.md` — **draft, awaiting approval.** 597 source files: 473 plan rows
  (335 archive · 62 copy · 21 copy-as-canonical · 55 needs-decision) + 124 not migrated. Checker
  (`check_plan.py`, with `--allow` for the code paths and `docs/archive/pulpvision/`): **OK — coverage complete,
  no collisions, 418 distinct destinations.** Drilled in the failing direction: deleting one row makes it report
  that file as unaccounted for.
- `…\from-librarian\manifest-2026-09-18.json` — re-scan: the 592 files of 2026-09-17 are all present and unchanged
  by sha256; +5 `from-gemini` files = **597**. Exclusions: `.git .netlify .output .pnpm-store .tanstack node_modules`
  and `vivid/from-gemini/Takeout`. Paths carry the mount prefix, so the checker can use it directly.
- `…\from-librarian\2026-09-18-librarian-s4-working.md`, this handoff, and the refreshed `CURRENT.md`.

Nothing in any source folder was created, changed, renamed or deleted. Scratch scripts live outside the
connected folders and are gone with the session.

## Takeout findings (measured, no conversation text read)

- `MyActivity.html`: 1,085 entries, 2025-05-11 → 2026-09-18. Entries naming the project: 2025-12 → **2026-02-25**
  only. Later keyword hits were "vividly", "illuminated", etc.; the March entries mentioning Gems are another project.
- 328 attachments: 72 byte-identical to corpus files; after whitespace-normalised comparison, 81 Vivid-looking names
  still have no match. **27 of them are intermediate editions of the 01/02/03/05/06/07 master series**, uploaded
  2026-02-08 → 02-19 (activity-log dates) — none later than the disk canonicals. Left out per ruling 1; ND-7 asks
  for confirmation.
- `gemini_gems_data.html`: Planning v3.6, Architect v1.2, Archivist equal to the `from-gemini` files once normalised;
  **Creator v3.3 and Guidance v3.4 differ by 70 and 38 non-whitespace characters** — not resolved; for the Architect.
  The two Guidance Gems in the export are identical. **Builder Gem v1.0 (4,493 chars) exists nowhere else.**

## Deviations

1. The s3 handoff proposed `docs/archive/gem-instructions/` for the Gem texts; the plan uses
   `docs/agent-briefs/archive/gem-era/` — the pack's archive-beside-subject convention. It was a Librarian proposal,
   not an owner ruling. `docs/archive/pulpvision/` is kept because Q1 **is** a ruling.
2. The inventory recommended skipping the starter logos and `routeTree.gen.ts`. The coupling grep found them
   **load-bearing** (`Header.tsx:22`, `routes/index.tsx:60`, `router.tsx`), so they are copied.
3. Two `Tuotteet-*` names had two distinct editions each; the plan picks the `files/v0.5.3` edition (later or larger)
   as current. Not a family the inventory had canonicalised.

## Needs-decision (in the plan, §Needs decision)

ND-2 demo code in the legacy tree (rec. leave out) · ND-3 Deep Research exports, 58.9 MB (rec. keep outside the repo
with a pointer) · ND-4 foreign files = Q8 (rec. leave out) · ND-5 who copies the code in pass 3 (rec. extend the
Librarian scope for pass 3, copy-only) · ND-6 confirm the current-vs-archive convention (rec. confirm) ·
ND-7 Takeout intermediate editions (rec. leave out). Q7, Q9–Q12 remain open and do not change any row.

## Where I was nearly wrong

**My own keyword filter nearly counted the Takeout as recent Vivid material.** `vivid|lumina` matched
"vividly" and "illuminated" in May and September research chats; read at face value it would have said the
project was active in Gemini until last week. Printing the matched context for each hit took one command and
removed every post-February hit.

**And my first plan draft routed the two `Dashboards` files from `.chat_attachments/start/` into the current set**,
because my rule "the code-era input set is current" ran before the family rule. The Q2 ruling puts them in the
archive. The citation-count pass showed the mistake: it listed `start/Dashboards.docx` as a file being renamed.
When two filing rules overlap, the rule tied to an owner's ruling has to be checked first.

## Next

Owner: read the plan, answer ND-2 … ND-7, approve (or edit cells). Then **pass 3 in a fresh session**
(`migration-execute`), with delete rights on `C:\api\vividvis` if it commits.

## Suggested commit message

Nothing to commit — this session wrote only into `valmistelu\`, which is outside the repo.

## Locks left behind

None; no git write was made. `C:\api\vividvis\vivid\.git` has no `*.lock` or `tmp_obj_*` (checked at start).

---

## Addendum — ND-2 … ND-7 answered (owner, 2026-09-18, all as recommended)

ND-2 demo code left out · ND-3 Deep Research exports kept outside the repo (pass 3 byte-copies them to
`valmistelu\research\`, pointer README in the repo) · ND-4 foreign files left out · ND-5 Librarian write scope
extended **for pass 3 only** to the code paths, copy-never-modify · ND-6 convention confirmed · ND-7 Takeout
intermediate editions left out. To be minted as `R-n` in pass 4.

`MIGRATION-PLAN.md` updated: the 55 needs-decision rows moved to Not migrated. **418 plan rows (335 archive ·
62 copy · 21 copy-as-canonical) + 179 not migrated = 597.** Checker re-run: OK, 418 distinct destinations,
no needs-decision left. The plan still needs the owner's explicit approval as a whole before pass 3.

**Approval:** the owner approved `MIGRATION-PLAN.md` as a whole on 2026-09-18. Pass 3 (`migration-execute`) runs it
unchanged in a fresh session; any deviation found there is recorded, not improvised.

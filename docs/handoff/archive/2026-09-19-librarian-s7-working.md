# Librarian session 7 — Vivid — working file (pass 4 part 2)

Date: 2026-09-19 · Surface: Cowork (cloud session linked to desktop-099f4ri), six folders attached.
Owner said "Go" after the start-up report. Commit mode already ruled: **R-32 — the owner commits; no commit or
delete rights for the Librarian.** No git write this session.

## Ground at start
`C:\api\vividvis\vivid`: `main`, 5 commits, last `ae2f4cf library commit 2`, 4 ahead of local `origin/main`;
0 untracked, 0 deleted; 5 whitespace-insensitive modifications = the s6 addendum-2 files; no `*.lock`, no `tmp_obj_*`.
`check-ignore -v apps/web/.env` → `apps/web/.gitignore:6` (still ignored; file not read).
Research exports in `valmistelu\research\`: 7 files, sha256 re-measured = `pass3-research-log.json`, all 7 match.

## Board defect found at start
Repo-state stamp lists commits only to `0b9f6c3` and says "Three commits are unpushed"; measured: 5 commits, 4 unpushed.
Fixed in the board move (step 10).

## Worklist (steps 6–11 + s6 addendum 2)
6 READMEs · R-38 muistiin copy · ND-15 · 7 project-rules merge · 8 channel, CLAUDE.md, /next · 9 handoff archive ·
10 root README, docs/README, board move · 11 deletion proposal (R-6), close-out, Librarian Project findings.

## Questions (written before asked)
(none yet)

## ND-15 — measured
Instrument: HTML-stripped Takeout blocks ("WAT - Creation Gem", "WAT - Guiding Gem" in
`C:\api\vivid\from-gemini\Takeout\Gemini\gemini_gems_data.html`) vs the `from-gemini` files, word-token diff (difflib).
Known positive: the instrument does report differences (it found the ones below). Result, both Gems: **the instruction bodies
are word-identical.** The only tokens that differ are the Takeout's wrapper labels — `Instructions:`, `Files: The 2026 Developer
Environment.docx` (Creator lists it twice), and the next block's `Name:`. So the 70/38-character difference of ND-14 is export
framing, not a text change. Times: Takeout file 2026-09-18 07:55:48 UTC (archive time); `from-gemini` files saved 16:39–16:46 UTC
the same day. Either copy is "the latest"; the repo's `from-gemini` texts stand. ND-15 → resolved by measurement, no owner
question needed. By-product: both Gems had a knowledge file attached, `The 2026 Developer Environment.docx`.

## Q-s7-1 (written before asked) — four committed status headers cite a path that does not exist
Measured: a path-resolution scan over every tracked `.md` finds `docs/architecture/database-schema-blueprint.md` cited in
4 status headers (archive members of F10: `05_Database_Schema_Master.md`, `05_Database_Schema_Master_v2.md`,
`Data_Schema_Strategy.md`, `Database_Schema_Plan.md`). The file kept its name: `docs/architecture/Database_Schema_Blueprint.md`
(plan line 42: name kept, 1 citation). The header text is the Librarian's own (plan §Status headers); bodies are untouched.
Options: (a) correct the path in those four header lines only — bodies stay byte-identical; (b) leave them and record the
mapping in `docs/architecture/archive/README.md`. Recommendation (a): the header is ours, the path is simply wrong, and a
wrong pointer in a header is exactly what a later session follows. Not applied until the owner rules.

## Nearly wrong — muistiin encoding
First header said "Windows-1252 / Latin-1 — no byte in 0x80–0x9F". I had written it before reading my own byte count, which
showed four 0x80 bytes. Those are `€` in Windows-1252 and C1 controls in Latin-1; the decoded text shows "50 €". Header corrected
to Windows-1252 with the evidence; body round-trips to the source bytes.

## Nearly wrong — an unmeasured negative, again
In the `project-rules.md` header I wrote that `ProductsAndPrices.docx` "is not in the corpus under that name" — from memory of
nothing. The manifest check I ran straight after found it 12 times; the plan archives it at
`docs/context/archive/webapp-visualisatium/files/Summaries/ProductsAndPrices.docx` (F35) with five byte-identical duplicates.
Header corrected. Same failure s6 recorded (L-series): a negative written before the grep.

## Nearly wrong — I duplicated half of registers.md, and recovered it
A splice script took the first `| ND-15 |` as the ND-15 row; the first occurrence is the series-summary row, so the slice was
empty and the write duplicated 11,600 bytes. The file holds uncommitted addendum-2 edits, so HEAD could not restore it.
Recovered arithmetically from the broken file (copy kept at the session's scratch), then verified by diff against HEAD:
only the intended changes remain (series summary, R-6/14/31/37–42 statuses, ND-11…15, X-1/2, l2a). Lesson: anchor a splice on
a unique string and assert the slice is non-empty before writing.

## Close
Handoff: `docs/handoff/archive/2026-09-19-librarian-s7-pass4-part2-handover.md`. Board moved to `docs/handoff/CURRENT.md`;
this folder's `CURRENT.md` is now a pointer, last full text kept as `CURRENT-retired-2026-09-19.md`. Q-s7-1 open for the owner.

## Q-s7-1 ruled — (a), as recommended → R-43
Applied to the first line of the four F10 archive headers; bodies verified identical to HEAD. Surface now 42 paths; gate 0 hits.

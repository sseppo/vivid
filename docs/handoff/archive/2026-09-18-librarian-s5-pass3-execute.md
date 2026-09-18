# Librarian session 5 — Vivid — pass 3, migration executed

Date: 2026-09-18 · Surface: Cowork, six folders attached, device `desktop-099f4ri`
Board read: `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md` (Start-here pointer correct).
Handoff read: `…\2026-09-18-librarian-s4-migration-plan.md` (with addendum). Also read: `…\2026-09-18-librarian-s4-working.md`;
`…\MIGRATION-PLAN.md` — header, Decisions, Couplings, Needs decision, New files, ADRs, Status headers (table parsed by script,
first rows read), Execution notes, and the Plan / Not migrated tables parsed by script (not read row by row);
`…\manifest-2026-09-18.json` (queried). **Not read:** the s3 handoff, the question pack, `INVENTORY.md`, the s1 foundation.

## Ground at start

| repository | branch | last commit | tree |
|---|---|---|---|
| `C:\api\vividvis\vivid` | `main` | `54ecccd` | clean; no lock or `tmp_obj_*` |
| `C:\api\visualisatium\visualisatium` | `main` | none | 92 untracked |
| `C:\api\vivid\apps\web` | `main` | none | 25 untracked |

"Ahead 2 of origin" was not re-measured. Git reads only, all with `--no-optional-locks`.

## Rulings taken this session (owner)

1. This session is the pass-3 session.
2. Pass 3 copies into the working tree only; **the owner commits from Windows.** No commit rights, no delete rights asked.
3. ND-3 confirmed: Deep Research exports byte-copied to `C:\api\vividvis\valmistelu\research\`.

## What landed

Full detail and the verifier output: `…\from-librarian\EXECUTION-REPORT.md`.
418 plan rows copied and hash-verified · 98 status headers, bodies byte-identical · Builder Gem v1.0 extract ·
7 research exports (58.9 MB) in `valmistelu\research\` · credential gate over the 422-file commit surface: 0 hits,
instrument validated both ways including inside Office zips · all 597 sources re-hashed unchanged.
Logs: `pass3-execution-log.json`, `pass3-headers-applied.json`, `pass3-research-log.json`.

## Deviations

1. Builder Gem text is 4,578 characters; the plan's 4,493 has no stated basis and could not be reproduced. The extraction
   method reproduces two on-disk Gem texts exactly, so the plan's figure is taken to be the mis-measurement.
2. Header line ending follows each file (97 CRLF, 1 LF); the plan did not name one.
3. Execution note 7 ("`valmistelu/` read-only") read as covering existing material only; ND-3 and the board require new output there.

## Needs-decision

**ND-8 — provenance README for `legacy/visualisatium-web/`.** The plan copies the legacy tree's own `README.md` to that path;
§New files has pass 4 writing a provenance README to the same path. (a) prepend a status blockquote to the copy;
(b) write `legacy/README.md`; (c) `legacy/visualisatium-web/PROVENANCE.md`. **Recommendation: (b).** Blocks one pass-4 file only.

## Where I was nearly wrong

**I nearly wrote the Builder Gem file and quoted the plan's 4,493 characters in its header** because the plan said so. The
extract came out at 4,578. Before deciding which figure was wrong I ran the same extractor on the Architect and Planning
blocks. It matched the owner's on-disk copies byte for byte, so the extractor was sound and the plan's number was the error.
Checking the instrument against a known positive took one command. Without it I would have had to choose between two numbers
on no evidence. **And the skill's `--resume` path truncates its own log before merging it**: it opens the log for writing and
only then reads it back. The run finished in one go (42 s), so this did not bite. A future interrupted run should copy the
log aside before resuming.

## Next

Owner: review the working tree and commit it. Before the first push of project material: put the rotated Clerk value in and
have a session re-run the history gate. Then **pass 4** in a fresh session: §New files, starting with the mechanics file, with
ND-8 answered.

## Suggested commit message

```
docs: pass 3 — migrate the Vivid corpus and code tree into the repository

418 files copied from five source folders per MIGRATION-PLAN.md (approved
2026-09-18): 335 archive, 62 copy, 21 copy-as-canonical; 98 Markdown files
carry a status header, bodies byte-identical to source. Adds the Builder Gem
v1.0 text extracted from the Gemini export. Code tree from C:\api\vivid
(apps/, packages/, supabase/, root workspace files); superseded tree under
legacy/. Credential gate over the commit surface: 0 hits.
```

## Locks left behind

None. No git write was made; `.git` has no `*.lock` or `tmp_obj_*` after the pass.

---

## Addendum — 2026-09-19 (same session, re-grounded)

- **ND-8 answered by the owner: (b)**, as recommended. Pass 4 writes the provenance note as `legacy/README.md`; the copied
  `legacy/visualisatium-web/README.md` stays byte-identical. To be minted as `R-n` in pass 4 with ND-2 … ND-7.
- **The owner committed the pass-3 tree: `0b9f6c3 library commit 1`** (author `sseppo`, 2026-09-19 00:50 +0300). Not pushed.
  Re-ground measured: 422 tracked, 0 untracked, 0 deleted, no whitespace-insensitive diff (the CRLF→LF warnings are
  `.gitattributes` normalisation, as expected), `main` 3 ahead of the local `origin/main` ref, no `*.lock` or `tmp_obj_*`.
- **Clerk key: the owner generated a new key on 2026-09-19.** Told to place it in `C:\api\vividvis\vivid\apps\web\.env`, which
  is git-ignored (verified with `check-ignore`: `apps/web/.gitignore:6`), and to revoke the old secret. Placement is not verified
  by this session. The next session checks the file exists and is ignored, without reading its values.
- Pass-4 starting detail written: `…\from-librarian\STARTING-PROMPT-pass-4-new-files.md`; the board's Start-here block points to it.
- **Clerk rotation complete (owner, 2026-09-19).** Both new keys are in `C:\api\vividvis\vivid\apps\web\.env`. Verified without
  printing any value: both variables present and non-empty, `pk_`/`sk_` shape, each differs from the old value in `legacy-env\`;
  the file is ignored (`apps/web/.gitignore:6`), and the untracked count is still 0. The starting prompt and the board now say the
  matter is closed. What remains before the push is the history gate only.

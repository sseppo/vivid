# Librarian session 3 — Vivid — Q1–Q5 resolved, first Librarian commits, delete rights

Dates: opened 2026-09-17, closed 2026-09-18 · Surface: Cowork, six folders attached,
device `desktop-099f4ri`
Board read: `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md`
Handoff read: `…\2026-09-17-librarian-s2-inventory.md` (newest on disk, board pointer correct)
Also read: `…\2026-09-17-librarian-s1-foundation.md` · `…\manifest.json` (queried, not read whole)
Companion file written this session: `…\2026-09-17-librarian-s3-question-pack.md` — the evidence
behind every ruling below, with the full tables. Read it before acting on Q2–Q5.
Not read: `INVENTORY.md` — only its family sections F1, F4, F5, F7, F11, F12, F16 and its
heading list. Stated so it is not assumed.

## Ground at start (2026-09-17) and the change mid-session

At start the target repo had **0 commits** and 2 untracked files, matching the session-2 stamp.
Between the two sitting days the owner **re-made the repository and pushed a temporary README**,
so a remote now exists. Re-grounded on 2026-09-18:

| repository | branch | commits then | tree then | remote |
|---|---|---|---|---|
| `C:\api\vividvis\vivid` | `main` → `origin/main` | 1 (`86d4bd2 first commit`, README only) | `.gitattributes`, `.gitignore` present but untracked | `https://github.com/sseppo/vivid.git` |

The two source repos (`C:\api\visualisatium\visualisatium`, `C:\api\vivid\apps\web`) were
unchanged: `main`, 0 commits, 92 and 25 untracked, no remote, no lock.

## Rulings taken this session (owner's answers; to be minted in pass 4)

1. **Q1 — `pulpvision` is a different product, though related.** Filing: the two files go to
   `docs/archive/pulpvision/` with a provenance header saying so; never cited as Vivid product
   fact. Session-1 ruling 1 (read-only source) stands.
2. **Q3 — `ImprovementsAdmin Dashboard v3.5.docx` is canonical**, `v3.docx` archived as the
   changelog-bearing edition. Measured: same body header (v1.2), same 16 sections; the 3.2 KB
   difference is 16 `Changes:` blocks and 39 `[Inspired by N]` markers, **not feature text**.
3. **Q4 — the project rules are a MERGE, not a pick.** `config\project_rules.md` is the base;
   §4 "Immutable Legal & Logic Axioms" is restored from `config\project_rules_someNewVersion.md`;
   both originals archived. Neither file was a superset: one has §4 and no §99 session-hygiene
   footer, the other the reverse; sections 1–3 are identical.
4. **Q2 — the dashboards get two canonicals at two levels.**
   `Dashboards_Blueprint.md` (69,956 B, 2026-02-23) is the canonical **specification**;
   `Dashboards_Ultimate_Synthesis.md` + `Dashboards_Ultimate_Mechanics_PRD.md` (2026-04-19) are
   the canonical **strategic layer** above it. Each gets a status header pointing at the other.
   The two same-named `Dashboards_Blueprint.md` files get distinct destination names (ADR).
5. **Q5 — the shrinking master series: carry the fullest AND the newest of each**
   (F5 `01_Master_Vision`, F7 `03_Product_Catalog`, F11 `06_Partner_Ecosystem`,
   F12 `07_Features_UX`, and F6 by the same logic), both into `docs/`, status-headered — newest
   marked current, fullest marked "fuller earlier edition, content lost to Gem context limits,
   not superseded in substance". Reconciliation is Architect work, not Librarian work.
6. **The Librarian commits** in `C:\api\vividvis\vivid`; the owner pushes. Boundaries held:
   `add` and `commit` only — never `push`, `checkout`, `stash`, `reset`, `rm` or history
   rewriting; credential gate over the commit surface before every commit; every commit message
   recorded in the handoff. Identity is passed per command (`git -c user.name/user.email`,
   reusing the author on the repo's own first commit) — **no git config was written.**
7. **Delete rights granted for `C:\api\vividvis` for this session**, explicitly so git lock and
   temp files can be cleared. The five source folders are untouched by this, as always.
8. **Root `README.md` added to the Librarian's write scope** (session-1 ruling 3 extended). The
   owner's temporary README existed only to create the remote.
9. **Credential rotation deferred** to the end of the reorganisation; the Clerk key was in fact
   already rotated in another of the owner's projects and the new value will be copied in before
   project material is pushed. Risk noted and accepted by the owner.

## What landed

**Commits in `C:\api\vividvis\vivid` (both unpushed; `main` is ahead 2):**

- `9971069 chore: repo foundation — line-ending and ignore rules` — `.gitattributes` and
  `.gitignore`, the pair written in session 1, still byte-unchanged on disk after the remake.
- `54ecccd docs: replace placeholder README with repository status` — `README.md` rewritten:
  what the repo is, that nothing has been migrated, the four-pass table with pass states, and
  where the board lives until pass 4 builds `docs/`. Written from this board and the session-1
  and session-2 handoffs; no path to credentials and no product claim in it.

**Written in `C:\api\vividvis\valmistelu\from-librarian\`:**

- `2026-09-17-librarian-s3-question-pack.md` — the Q1–Q5 evidence pack and its addendum.
- this handoff, and the refreshed `CURRENT.md`.

Nothing in any of the five source folders was created, changed, renamed or deleted.

## Credential gate (run twice, before each commit)

Commit surface enumerated with `git ls-files --cached --others --exclude-standard`, never the
working directory. Ten patterns, instrument validated in both directions each time (a known
positive matched; a redacted control did not). **No match** on the surface and **no match across
all blobs in history** (`git grep` over `git rev-list --all`). No ignored-but-indexed files.
The "no secret from this project is in any git history" finding therefore **still holds, now with
a remote in existence** — it must be re-verified immediately before the first push of project
material.

## The finding this session is worth remembering for: git writes strand locks on this mount

The first Librarian commit succeeded and then could not delete its own lock and temp files —
the Cowork mount forbade the unlink. Six files were stranded, one of them `.git\HEAD.lock`.
Measured, not inferred: an idempotent `git symbolic-ref HEAD refs/heads/main` then failed with
`Unable to create '…/.git/HEAD.lock': File exists`, i.e. **every ref-updating git write was
blocked — the owner's own commits and pushes from Windows included.** Reads were unaffected.

Resolved by the owner granting delete rights for `C:\api\vividvis`; the six files were removed
and the same ref-write test then returned exit 0 **and left no lock behind**. The second commit
also left nothing.

**Standing practice from here:** every Librarian session that writes to git clears
`.git\*.lock` and `.git\objects\**\tmp_obj_*` immediately after each commit, verifies with a
`find`, and records the result in its handoff. If a session has no delete rights, it must not
commit at all — a stranded `HEAD.lock` blocks the owner, not just the session. This generalises
the pack's `index.lock` warning: it is not only `git status` that strands a lock here.

## Deviations

1. The pack's rule "never ask for delete permission for a lock" was written for a lock found at
   session start. This session made the lock itself, by committing under a new ruling, so the
   rule's reason did not apply. The permission was asked for in prose, not taken silently, and
   the owner granted it. Recorded rather than buried; the pack should be corrected (see below).
2. `INVENTORY.md` was not read whole (see header). The question pack states which sections were.

## Deferred

- **Pass 2 (migration plan), fresh session, `migration-plan` skill.** Now unblocked: Q1–Q5 are
  answered. Ruling 7 puts the owner's Gemini date-check before it.
- Agent-recovery prompts for the Gemini Gems and the Antigravity agents — blocked on Q6.
- Deletion proposal for the five source folders and the two empty `.git` shells — at close of
  the Librarian work, not now.

## Needs-decision carried forward

Q6–Q12 of `INVENTORY.md` §Questions, unchanged and none of them blocking pass 2. The one worth
answering next is **Q6 — the five missing Gem system instructions**: recover them from the Drive
paths in `gem_roster.json`, regenerate them from the Gems themselves tagged `[recalled]`, or drop
them. **Recommendation: regenerate from the Gems**, because the roster's Drive links are
unverified and the Gems are known to still exist — and it is the only option that also produces
the recovery prompts.

## Where I was nearly wrong

**My own instrument invented a difference.** To compare the two dashboard `.docx` files I
stripped the `Changes:` blocks out of v3 and diffed the remainder against v3.5. Six lines came
out as "present in v3.5, absent from v3" — exactly the shape of a finding. They were in v3 all
along: my stripper had eaten them, and the remaining mismatches were the same sentences minus an
`[Inspired by N]` marker. A direct substring search in both files settled it in one command.
Diffing the output of a transformation I wrote, and reporting the transformation's artefacts as
the subject's properties, is the same failure as trusting a negative grep before validating it.

**And I nearly asserted a blocked repository without testing it.** Having seen `HEAD.lock`
stranded I was ready to tell the owner his Windows commits would fail. That was a plausible
inference about someone else's machine from a failure on this mount. The idempotent
`symbolic-ref` test made it a measurement, and it cost one command.

## Suggested commit message

Both commits are already made and are listed above. Nothing further is staged. The owner pushes;
before the first push of project material, re-run the history gate.

## Locks left behind

**None.** Verified after each commit with
`find .git -name '*.lock' -o -name 'tmp_obj_*'` — empty both times.

## Correction to the startup pack

The pack's Cowork surface rule says to use `--no-optional-locks` on git reads because a stale
`index.lock` is unrecoverable from inside the session. That is now too narrow in two ways, and
both are corrections for the Librarian Project docs:

1. **Any git write on this mount strands a lock**, not just `status`. `HEAD.lock` is the one that
   matters, because it blocks every later ref update for the owner as well.
2. **It is recoverable** — delete rights on the repo's own folder let git clean up after itself,
   after which commits leave nothing behind. A session that commits without delete rights is the
   unsafe configuration, not the mount itself.

---

## Addendum — pack correction written, and the Gem list for Q6

**The correction landed in the Librarian Project docs**, with the owner's approval, in
`claude/librarian-instructions.md`: standing rule 3 now says git is read-only *unless the owner
rules otherwise* and states the commit conditions; the Cowork surface paragraph now carries the
measured lock finding, the "no delete rights → do not commit" rule, and the after-every-commit
cleanup. Three smaller carry-overs went in with it: rule 6 gained a clause that a difference in
the output of your own transformation is a property of the transformation until checked against
the source (this session's near-miss); CANONICAL STRUCTURE gained the shrinking-family rule from
the Q5 ruling; the credential gate now says a banked "no secret in history" finding must be
re-taken immediately before the first push once a remote exists. **The live Project instructions
are a separate copy in the settings box — the owner must paste the updated text there for it to
take effect.**

**Gem roster, read from `C:\ai-stuff\Projects\WebApp\Active\Visualisatium\config\gem_roster.json`
(five entries, `last_updated` 2026-01-17, the Archivist 2026-01-19):**

| Gem | version | role | instruction filename in the roster | on disk? |
|---|---|---|---|---|
| Planning Gem | 3.5 | Product Visionary & CPO | `systemInstructions-Planning-Gem_v3.5.md` | a **v3.6** text survives as `…Visualisatium\planning\specs\temp.md` (9,991 B) |
| Creator Gem | 3.3 | Agent Factory Manager | `2026_Master_Protocol-For-Creator-Gem_v3.3.md` | **no** |
| Guidance Gem | 3.4 | Orchestrator & TPM | `2026_Master_Protocol-For-Guidance-Gem_v3.4.md` | **no** |
| Architect Gem | 1.2 | Systems & Database Architect | `systemInstructions-Architect-Gem_v1.2.md` | a text survives as `C:\api\vivid\.agents\Architect.md` (8,256 B) — same role, **identity not yet proven** |
| Archivist Gem | 1.1 | Librarian & Context Synthesizer | `visualisatium_Librarian-systemInstruction_v1.1.md` | **no** |

An earlier generation is named in `…\config\gem_roster-old-v1.json`: Manager, Architect, Builder,
Mobile, Planning, Creator, Guidance (the `SysPrompt_*.md` era). `…\temp.json` is an untitled copy
of the current roster's first three. Antigravity agents on disk: `C:\api\vivid\.agents\Architect.md`
(8,256 B) and `Builder.md` (**222 B — a stub**, worth regenerating from the agent itself).

Owner's action for Q6: save each Gem's current system instructions into
`C:\api\vividvis\valmistelu\from-agents\`, under the roster filename where it matches, or under
the Gem's actual current version where it does not. Pass 2 files them from there.

---

## Addendum 2 — 2026-09-18 evening: the date-check is done and the Gems are on disk

**Owner's finding: nothing in the Gemini chats is newer than the disk copies.** Session-1 ruling 7
is discharged; `valmistelu\from-agents\` stayed empty. Recorded as his finding, not a measurement
of mine — the chats are not visible from here.

**He also placed the recovered Gem system instructions in a new folder,
`C:\api\vivid\from-gemini\`** (inside a source folder, not in `valmistelu\`). Five files, measured
here — sizes, sha256 prefixes and the opening header read from each file:

| file | bytes | sha256 | document header |
|---|---|---|---|
| `Planning-Gem-instructions-v3.6.md` | 10,228 | `73c4b0d5` | SYSTEM INSTRUCTIONS: THE PLANNING GEM (v3.6) |
| `archite4ct-gem-instructions-v1.2.md` | 8,249 | `a7c05a4b` | SYSTEM INSTRUCTIONS: THE ARCHITECT GEM (v1.2) |
| `archivist-gem-instructions.md` | 7,146 | `12892650` | SYSTEM INSTRUCTIONS: THE ORGANIZING GEM (THE ARCHIVIST) — **no version in the text**; the roster says v1.1 |
| `creator-gem-instructins-v3.3.md` | 16,102 | `cb6ed0c0` | CREATOR GEM MASTER PROTOCOL (v3.3) |
| `guidance-gem-instructions-v3.4.md` | 28,444 | `20b82680` | SYSTEM INSTRUCTIONS: THE GUIDANCE GEM (v3.4) |

**Q6 is closed**, and better than the recommendation: these are the Gems' live texts, so nothing is
`[recalled]` or `[reconstructed]` and no rescue folder is needed. Four of the five carry a version
in the document itself that matches the roster (the Planning Gem is v3.6 against the roster's
v3.5 — the roster is the stale one). The agent-recovery prompts are no longer needed.

### Two provenance questions closed by measurement

1. **`C:\api\vivid\.agents\Architect.md` IS the Architect Gem v1.2.** Byte hashes differ
   (`48b1c7da` vs `a7c05a4b`) and the line counts differ 204 vs 118, but with line endings and
   whitespace normalised the two are **identical — 7,693 characters, same normalised sha256
   `722ae787`**. The Antigravity Architect agent was running the Gem's instructions verbatim. The
   byte difference is CRLF/blank-line formatting only, which is exactly what `.gitattributes`
   (`* text=auto`) exists for.
2. **`…Visualisatium\planning\specs\temp.md` is an earlier edition of the Planning Gem
   instructions, and differs from the recovered v3.6 in exactly one word.** Normalised, both are
   9,242 characters and 1,371 words; word similarity 0.999; the single difference is the
   context-warning threshold in the last paragraph — **`80%` in the recovered v3.6, `70%` in
   `temp.md`**. So `from-gemini\Planning-Gem-instructions-v3.6.md` is canonical and `temp.md` is
   the archived earlier edition, with that one-word delta recorded rather than lost.

### Consequences for pass 2

- **The corpus is now 597 files, and `manifest.json` is one scan behind the disk.** Re-scan and
  re-verify at the start of pass 2 before the manifest is used for anything; do not quote 592
  without saying which scan it came from.
- **Destinations for the five**: they are canonical pre-repository instruction text, so they go to
  `docs/archive/gem-instructions/` with provenance headers (the pack: retired instruction text is
  archived with provenance, never dropped), **not** into `docs/agent-briefs/`, which is for briefs
  this project's own agents run on. The Planning Gem pair gets the `temp.md` earlier edition
  archived beside it with the `80%`/`70%` delta named in its status header.
- **Three filenames carry typos** — `archite4ct-…`, `…instructins-…`, and the Archivist file has no
  version token. Nothing cites them (they were created today), so the canonical kebab-case names
  are applied forward in the plan: `architect-gem-instructions-v1.2.md`,
  `creator-gem-instructions-v3.3.md`, `archivist-gem-instructions-v1.1.md` — the last one taking
  its version from `gem_roster.json`, which must be stated as the source in the plan row because
  the document itself does not say it.
- `gem_roster.json` should be status-headered as **stale on the Planning Gem row** (v3.5 vs the
  v3.6 text now on disk).

**Owner also updated the Librarian Project settings box** with the corrected instructions, so the
git-lock rules are in force for the next session.

## Locks left behind (final, session 3)

**None.** Re-verified after the last commit.

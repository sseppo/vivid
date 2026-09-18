# Librarian session 3 — Vivid — question pack for Q1–Q5 (owner review)

Date: 2026-09-17 · Surface: Cowork, six folders attached, device `desktop-099f4ri`
Board: `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md`
Basis for every path, size, date and hash below: `…\from-librarian\manifest.json` (session 2),
re-read this session. Contents were re-read from the files themselves where stated.

Source-folder shorthand used in the tables:
`vivid` = `C:\api\vivid` · `visualisatium` = `C:\api\visualisatium` ·
`Visualisatium` = `C:\ai-stuff\Projects\WebApp\Active\Visualisatium`

---

## Q1 — pulpvision: ANSWERED by the owner, 2026-09-17

Owner's ruling: **a different product, though related.** Recorded. Filing consequence proposed
(not yet approved): the two files are carried into the repo under `docs/archive/pulpvision/`
with a provenance header stating they describe a different product — kept because the ideas are
related, never cited as Vivid product fact. Session-1 ruling 1 (read-only source, hashed against
later namesakes) stands. **Pass 2 is no longer blocked by Q1.**

---

## Q3 — F1: is `ImprovementsAdmin Dashboard v3.docx` or `v3.5.docx` later? — MEASURED

Both in `C:\api\visualisatium\NotebookSources\v0.5\temp2\`, both mtime 2026-01-04:

| file | bytes | sha256 | words | numbered sections | `Changes:` blocks | `[Inspired by N]` markers |
|---|---|---|---|---|---|---|
| `ImprovementsAdmin Dashboard v3.docx` | 39,919 | `107ce512…` | 4,252 | 16 | 16 | 39 |
| `ImprovementsAdmin Dashboard v3.5.docx` | 36,726 | `46a2bc45…` | 3,408 | 16 | 0 | 0 |

Both carry the same body header, "Master Admin Dashboard Design Specification v1.2", and the
same sixteen sections in the same order (1. Unified Mission Control … 16. Site-Wide
Configuration).

**What the size difference actually is.** Every feature line that appears only in `v3.5` is the
same sentence as in `v3` with the `[Inspired by N]` source marker removed — checked by string
search in both directions on `Differential Prefetching`, `Shadowing Playback`, `Predictive Queue
Load` and `Independent meters for Negotiation`, all present in both. The 3.2 KB gap is the
sixteen `Changes:` changelog blocks plus 39 citation markers, not feature content.

**Conclusion: `v3.5` is the later file** — a cleaned reading copy of `v3`. No feature text was
lost. `v3` is the only copy of the change history and of the source markers.

**Recommendation:** canonical `v3.5`; `v3` to `docs/archive/` with a status header naming it as
the changelog-bearing edition. Low stakes either way: inventory F1 records the whole family as
superseded by F4 (the February master record).

---

## Q4 — F16: `project_rules.md` or `project_rules_someNewVersion.md`? — MEASURED, NEITHER

Both in `C:\ai-stuff\Projects\WebApp\Active\Visualisatium\config\`:

| file | bytes | mtime | sections |
|---|---|---|---|
| `project_rules.md` | 1,064 | 2026-01-19 | 1 Tech Stack · 2 Economic Model · 3 Operational · **99 GLOBAL SESSION HYGIENE** |
| `project_rules_someNewVersion.md` | 1,648 | 2026-01-17 | 1 Tech Stack · 2 Economic Model · 3 Operational · **4 IMMUTABLE LEGAL & LOGIC AXIOMS** |

Ancestor: `…\Visualisatium\planning\old2\project_rules_vjotain.md` (1,666 B, 2026-01-18, "Version
3.0 (Handoff)") — the source of the §4 axioms.

Sections 1–3 are byte-identical between the two. **Neither file is a superset:**
`someNewVersion` has the legal axioms and lacks the session-hygiene footer; `project_rules.md`
has the footer and lacks the axioms. The mtime order (someNewVersion older) is consistent with
the axioms being dropped on 2026-01-19, not added.

**Recommendation:** canonical is a **merge** — `project_rules.md` as the base, §4 restored from
`someNewVersion`, both originals archived, the merge recorded as a decision. This is the one
place in F1/F4/F16 where a merge rather than a pick is needed. Say if you would rather pick one
file as-is; that is your call, not mine.

---

## Q2 — F4: which dashboard document is canonical? — the two are different layers

| file | bytes | mtime | what it is |
|---|---|---|---|
| `C:\api\vivid\.chat_attachments\start\Dashboards_Blueprint.md` | 69,956 | 2026-02-23 | "VIVID DASHBOARDS MASTER RECORD" — 38 headings: Admin 2.1–2.15, CCA 3.1–3.5, User 4.x, Partner. The implementation-level record. Byte-identical twin at `…Visualisatium\planning\handover-to-new-sessions\valijuttu-1\Dashboards_Blueprint.md` (`cc835e36…`) |
| `…Visualisatium\planning\Dashboard\Dashboards_Ultimate_Synthesis.md` | 5,377 | 2026-04-19 | "Phase 4 — Ultimate Synthesis & Ambient Intelligence": four new dashboard concepts (Living Studio & Chronos Engine, Synchronicity Workbench, B2B Fulfillment Bridge, The Oracle) |
| `…Visualisatium\planning\Dashboard\Dashboards_Ultimate_Mechanics_PRD.md` | 4,087 | 2026-04-19 | Objective, Gherkin acceptance criteria, Mermaid logic, JSON summary for the above |
| `…Visualisatium\planning\Dashboard\Dashboards_Blueprint.md` | 5,679 | 2026-02-21 | "Phase 4 — Expansion & Ideation", the earlier strategic layer. **Different document, same filename** as the 69,956 B one (inventory C11) |

The April pair does not restate the master record; it proposes a further evolution on top of it
and assumes it. Choosing the newest by date would drop ~95 % of the dashboard specification.

**Recommendation:** not one canonical but two, at different levels —
`Dashboards_Blueprint.md` (69,956 B) as the canonical dashboard **specification**, and the
2026-04-19 pair as the canonical **strategic layer** above it, each with a status header saying
so and pointing at the other. The two same-named `Dashboards_Blueprint.md` files get distinct
destination names, recorded as an ADR.

---

## Q5 — the shrinking master series: where they are

All under `C:\ai-stuff\Projects\WebApp\Active\Visualisatium\planning\handover-to-new-sessions\`.
`valijuttu-1\` copies are byte-identical to the ones the code-era session was given in
`C:\api\vivid\.chat_attachments\start\`.

**F5 — `01_Master_Vision` (86 % lost).** `combined-v1.8\01_Master_Vision_VIVID_strategyVision.md`
19,792 B 2026-01-30, 35 headings → `valiold\old\…_v2.md` 3,568 B 2026-02-08 → `…_v3.md` 2,978 B
2026-02-12 → `valijuttu-1\…_v4.md` 2,852 B 2026-02-13, **5 headings**. Also
`old\v1.7\VIVID.docx` 26,979 B 2026-01-27 (docx form of the same v5.0 text).
Sections present in the 19,792 B edition and absent from v4: Core Identity & Philosophy,
The Core Directives (Immutable), The Product Catalog (Consolidated) incl. the Saga engine,
Utility Assets, Physical Specials, Safe Harbor Interceptor, Silent Royalty Protocol,
Supply Chain Logic, and more. v4 retains only Strategic Definitions and the Traffic Light router.

**F12 — `07_Features_UX` (26 % lost).** `combined-v1.8\07_Features_UX_Master.md` 24,642 ch,
49 headings 2026-01-30 → `valiold\old\_v2` 23,531 B → `_v3` 20,527 B → `_v4` 19,408 B →
`valijuttu-1\07_Features_UX_Master_v5.md` 18,682 B 2026-02-19, 32 headings. v5 is not a pure
subset: it adds "The Vault", a user-journey and a Consistency Guard section, and drops
The Curator ranking, the Preservation Gauge, the Copilot problem statement and the surge-pricing
UI.

**F11 — `06_Partner_Ecosystem` (15 % lost).** `combined-v1.8\06_Partner_Ecosystem_Master.md`
11,470 B → `_v2` 11,747 B (the peak) → `_v3` 11,067 B → `valijuttu-1\…_v4.md` 9,948 B 2026-02-13.

**F7 — `03_Product_Catalog`.** `combined-v1.8\03_Product_Catalog_Master.md` 16,642 B →
`valiold\old\_v2` 16,816 B (peak) → `_v3` 15,030 B → `_v4` 14,216 B → `valijuttu-1\…_v5.md`
14,218 B 2026-02-19. "Odyssey" becomes "Saga" at v3 (contradiction C3).

**F6 — `02_Business_Logic_Constitution`,** same shape: peak at `_v6_v2` 36,113 B, canonical
`_v6_v4` 30,739 B.

Your own January note (`…\Visualisatium\temp - Creator Gem prompts.docx`) gives the cause: newer
files "missing much of older information due to Gem getting out of space".

**Recommendation:** treat each family's **fullest** edition as a carried source alongside the
newest, both into `docs/`, with status headers — newest marked current, fullest marked
"fuller earlier edition, content lost to Gem context limits, not superseded in substance".
Reconciling them is an Architect job, not a Librarian one. The alternative — promote newest,
archive the rest — is what destroys the content.

---

## Owner ruling this session: the Librarian commits

The owner has authorised the Librarian to run `git commit` in `C:\api\vividvis\vivid`; he
pushes at the end of the reorganisation. Boundaries the Librarian will hold to, unless he says
otherwise: commits in the target repo only · `add` and `commit` only, never `push`, `checkout`,
`stash`, `reset`, `rm` or history rewriting · the credential gate over the commit surface
(`git ls-files --cached --others --exclude-standard`) before every commit · every commit
message recorded in the session handoff.

**Blocker, needs one line from the owner:** the repo has **no git identity** —
`git config --get user.name` and `--get user.email` are both empty in
`C:\api\vividvis\vivid`, so `git commit` fails. Options: (a) he sets it himself; (b) he
authorises `git config --local user.name/user.email` in that repo with values he gives;
(c) the Librarian passes `git -c user.name=… -c user.email=…` per commit, writing no config.
Recommendation: (b), because it is what every later commit needs anyway. Author email becomes
public on push.

## Credential status

Owner's ruling 2026-09-17: **rotation deferred to the end of the reorganisation.** The corpus is
local only until the first push; risk noted and accepted by the owner. Standing consequence: the
`CLERK_SECRET_KEY` in `C:\api\vivid\apps\web\.env` must be rotated **before** the first push, and
the "no secret in any git history" finding must be re-verified at that point.

Commit surface of `C:\api\vividvis\vivid` scanned this session: two files
(`.gitattributes`, `.gitignore`), no ignored-but-indexed files, no pattern match.

---

# Addendum — 2026-09-18, same session 3: the repo was remade, the first Librarian commit landed, and it left locks the mount cannot delete

## New ground, target repo `C:\api\vividvis\vivid`

The owner re-made the repository and pushed a temporary README, so a remote now exists.
Measured this session, all reads with `git --no-optional-locks`:

| item | value |
|---|---|
| branch | `main`, tracking `origin/main` |
| remote | `https://github.com/sseppo/vivid.git` (fetch + push) |
| commits before this session | 1 — `86d4bd2 first commit`, `README.md` only, author `sseppo <seppo.laukkanen@basetrix.com>`, 2026-09-18 09:51 +0300 |
| `.gitattributes` / `.gitignore` | survived the remake on disk, contents unchanged from session 1, but **untracked** in the new repo |

**Credential gate before committing.** Commit surface (`git ls-files --cached --others
--exclude-standard`) = three files. Full-history scan over all blobs with ten patterns: **no
match**; instrument validated in both directions (known positive matched, redacted control did
not). No ignored-but-indexed files. The pushed README contains one line of placeholder text.
**The "no secret in any git history" finding still holds, now with a remote in existence.**
Owner's update: the Clerk key was already rotated in another project; he copies the new value
in before pushing project material.

## Commit made

`9971069 chore: repo foundation — line-ending and ignore rules` — `.gitattributes` and
`.gitignore`, the pair proposed in session 1. Authored with the identity already on the repo's
first commit (`git -c user.name=… -c user.email=…`, no config written). `main` is **ahead 1**;
nothing was pushed.

## The finding: committing from inside the Cowork mount strands git's lock files

`git commit` created its lock and temp files normally and then could not delete them, because the
mount forbids deletion. Six files are stranded:

```
C:\api\vividvis\vivid\.git\HEAD.lock
C:\api\vividvis\vivid\.git\objects\maintenance.lock
C:\api\vividvis\vivid\.git\objects\0e\tmp_obj_22a8tJ
C:\api\vividvis\vivid\.git\objects\52\tmp_obj_P5xfn2
C:\api\vividvis\vivid\.git\objects\99\tmp_obj_NKlW7c
C:\api\vividvis\vivid\.git\objects\9f\tmp_obj_Yc3SjS
```

**Measured, not inferred:** an idempotent `git symbolic-ref HEAD refs/heads/main` now fails with
`Unable to create '…/.git/HEAD.lock': File exists`. Git **reads** are unaffected and the commit
itself is intact. But **every ref-updating git write is blocked until `HEAD.lock` is deleted —
including the owner's own commits and pushes from Windows.** The session cannot delete it;
`rm` returns `Operation not permitted`.

This generalises the pack's `index.lock` warning: on this mount it is not only `git status` that
strands a lock — any git write does, and `HEAD.lock` is the one that blocks everything after it.

## Needs-decision — how the Librarian commits from here

1. **Owner grants this session delete rights for `C:\api\vividvis`** (session-1 ruling 4 already
   contemplates exactly that scope). Git could then clean up after itself and commits would
   behave normally. Expected to work because the failure is the mount's delete block, not a
   permission on the file — **expected, not yet measured.** The standing rule "never ask for
   delete permission for a lock" is why this is written here as an option rather than acted on.
2. **Owner deletes the six files from Windows after each Librarian commit.** Works for certain,
   costs him a command per commit.
3. **The Librarian stages nothing and writes nothing to git; the owner commits as before.** Zero
   locks, zero benefit from the new ruling.

**Recommendation: 1, with 2 as the fallback**, plus a standing practice of **one commit per pass**
rather than per file, so lock cleanup is rare whichever option holds. Whatever is chosen, every
Librarian session from now on lists any lock it leaves behind in its handoff.

**Immediate owner action, whichever option is chosen:** delete the six files above, or the repo
stays blocked for writes.

## Root `README.md`

The owner offered to let the temporary README be replaced with better text. Writing a root
`README.md` is **outside the Librarian's authorised write scope** (session-1 ruling 3:
`docs/`, `.gitattributes`, `.gitignore`, `CLAUDE.md`, `.claude/commands/`). Recommendation:
extend the ruling to cover root `README.md`, and write it in **pass 4**, when `docs/README.md`
exists for it to point at — a root README written now would describe an empty repository.

## Still open, still blocking pass 2

**Q2** (dashboard canonical), **Q4** (project rules merge or pick), **Q5** (the shrinking master
series). Q1 is answered; Q3 is measured with a recommendation and needs only a yes.

---

**Resolved 2026-09-18.** The owner adopted the recommendations for Q2, Q3, Q4 and Q5 as written
above, granted delete rights for `C:\api\vividvis`, and extended the write scope to root
`README.md`. The rulings, as they are to be applied in pass 2, are listed in
`…\2026-09-18-librarian-s3-rulings-and-first-commits.md`; this file remains the evidence behind
them. Pass 2 is unblocked.

# Librarian — Vivid / Visualisatium — Session 1 (Pass 0, Foundation)

Date: 2026-09-17
Surface: Cowork with folders attached (device `desktop-099f4ri`, Windows)
Status of this document: **proposal. Nothing has been built or migrated.**

---

## 1. Ground check

Six folders are connected and reachable:

| # | Path | Files (excl. node_modules) | Newest file | Git |
|---|---|---|---|---|
| 1 | `C:\api\vivid` | 121 | 2026-02-26 | `apps/web/.git` — **initialised, zero commits** |
| 2 | `C:\api\visualisatium` | 358 | 2026-02-26 | `visualisatium/visualisatium/.git` — **initialised, zero commits** |
| 3 | `C:\ai-stuff\Projects\WebApp\Active\Visualisatium` | 191 | 2026-04-19 | none |
| 4 | `C:\api\pulpvision` | 2 | 2026-01-06 | none |
| 5 | `C:\ai-stuff\Deep Research\Vivid` | 7 | 2026-01-28 | none |
| 6 | `C:\api\vividvis` | 0 (empty) | created 2026-09-17 17:47 | none |

Git detail, measured with `git --no-optional-locks`:

- `C:\api\visualisatium\visualisatium\.git` — branch `main`, **no commits yet**, no remote,
  0 tracked files, 92 untracked. No `.git/index.lock` present.
- `C:\api\vivid\apps\web\.git` — branch `main`, **no commits yet**, no remote,
  0 tracked files, 25 untracked. No `.git/index.lock` present.

**Ruling: nothing in this project is under version control.** Both `.git` directories are
empty shells from an `init` that was never followed by a commit. Nothing can be lost by
leaving them where they are; nothing can be recovered from them either. No file history
exists for any document in this corpus — file mtimes are the only dating evidence, and they
are Windows copy-times, so they are an upper bound on authorship date, not the date itself.

No lock was left behind by this session's reads.

## 2. What is actually in the corpus

Four distinct strata, by name and date:

1. **`pulpvision` (2026-01-06, 2 files)** — earliest name. `Description and purpose of the
   website.docx` + `PricingTable.xlsx`. Both filenames recur later in `visualisatium`, so
   this is almost certainly the project's first folder under its first name.
2. **`C:\api\visualisatium` (358 files, Jan–Feb 2026)** — the Gemini-era working corpus:
   `NotebookSources/promptBase/Gems/` (Gem prompt bases, `Tool0 - attachments`,
   `oldAttachment`, `Visualisatium_Context`), `preparingDocumts`, `prompts/ObjectDatabase`,
   plus a **TanStack/Netlify code tree** at `visualisatium\visualisatium\` (92 untracked
   files, `.env.local` present). 217 of the 358 files are `.docx`.
3. **`C:\ai-stuff\Projects\WebApp\Active\Visualisatium` (191 files, Jan–Apr 2026)** — the
   planning corpus: `planning/Dashboard/`, `planning/handover-to-new-sessions/` (with
   `old/v1`, `old/v1.5`, `old/v1.7`, `combined-v1.8`, `valijuttu-1`, `valiold`),
   `planning/specs`, `system_instructions`, `config`, `prompts`, `files/v0.5.3`,
   `files/v0.5.4`. **This folder holds the newest material in the whole corpus**
   (`planning/Dashboard/Dashboards_Ultimate_Synthesis.md` and
   `Dashboards_Ultimate_Mechanics_PRD.md`, both 2026-04-19). Root-level
   `Instructions_For_Next_AI_Chat.md` is a boot protocol pointing at
   `project_manifest.json`, `gem_roster.json`, `project_rules.md`, `tools_inventory.json`.
4. **`C:\api\vivid` (121 files, Feb 2026)** — the Vivid-era rebuild: pnpm workspace
   (`apps/web`, `packages/types`, `supabase/`), `.agents/Architect.md` + `.agents/Builder.md`
   (Antigravity agent instructions), `.chat_attachments/start/` holding the numbered master
   documents `01_Master_Vision_VIVID_strategyVision_v4.md` …
   `07_Features_UX_Master_v5.md`, plus `Dashboards_Blueprint.md`. `docs/` contains exactly
   one file, `Database_Schema_Blueprint.md`.
5. **`C:\ai-stuff\Deep Research\Vivid` (7 files, 2026-01-28)** — seven large Gemini Deep
   Research `.docx` exports (7–10 MB each): legal boundaries, storytelling/privacy/APIs,
   copyright and public domain, on-demand sourcing, physical manufacturing, self-hosted AI
   infrastructure, specialised creative-asset APIs.

**Two separate code trees exist** (`visualisatium\visualisatium` and `vivid\apps\web`),
neither committed, and a **numbered master-document series exists in two generations**
(`01_…_v4` / `02_…_v6_v4` / `03_…_v5` / `06_…_v4` / `07_…_v5` in `vivid`, versus the
`v0.5.3` / `v0.5.4` / `combined-v1.8` families in the planning folder). Establishing which
generation supersedes which is pass 1 work and will need hashing, not filenames — note that
`02_Business_Logic_Constitution_BusinessLogicEconomics_v6_v4.md` carries two version tokens
in one name, which is exactly the shape that hides a merge.

## 3. Agents as they stand

- **No Claude Projects exist for this project.** Nothing to send a report prompt to.
- **Gemini Gems existed**: `Architect.md` (v1.2, "Architect Gem / CTO") and `Builder.md`
  in `C:\api\vivid\.agents\`, and a **Planning Gem** is referenced from inside Architect.md.
  `Instructions_For_Next_AI_Chat.md` references a `gem_roster.json` holding "the latest
  active Agent versions" — that roster is the register of who existed.
- **Antigravity agents** were pointed at `C:\api\vivid`; `.agents/*.md` is their instruction
  set, `.chat_attachments/start/` is what was fed to them at session start.
- The last Builder-era activity on disk is 2026-02-25/26 (`build.log`, `pnpm-log.txt`,
  `apps/web/.env`). The last *thinking* activity is 2026-04-19 (the two Dashboard documents).

**This means the recovery prompts you asked for are deliverable, but they should be written
after pass 1**, not now: their whole value is that they carry a dated list of what is
already on disk, so the agent's answer can be diffed against it rather than believed.

## 4. Credential gate — preliminary

Three files matched on name alone (**not opened, not read**):

- `C:\api\vivid\apps\web\.env`
- `C:\api\vivid\apps\web\.env.example`
- `C:\api\visualisatium\visualisatium\.env.local`

A Supabase folder is present in `vivid`, so live project keys are plausible. Because
nothing is committed anywhere, **nothing has leaked into git history** — this is the one
piece of good luck in the whole situation, and it is worth banking before the first commit
exists. Full gate runs in pass 1.

## 5. What I take from the startup pack, and what I am dropping

Taken as-is: 5.1 one board file · 5.2 one rule-set file · 5.3 Start-here block · 5.4 name
what you read · 5.5 confirm ground · 5.7 two rule sets per agent (attached / detached) ·
5.9 a state change that lives only in a transcript did not happen · 5.10 one handoff per
session · 5.13 write before you say · 5.15 ledger from day one, empty · 5.17 a run that
halts still writes its report · 5.18 never rename retroactively.

Taken with an amendment:

- **5.6 / 7.6 (agent instructions canonical in the repo).** There are no Claude Projects to
  drift *from* yet. Applies forward, from the moment a Project is created. The existing
  `.agents/*.md` files are pre-repository instruction text and get retired to `archive/`
  with a provenance header, never dropped — they are what will later explain a phantom
  structure.
- **5.8 (precedence between copies).** Two of the three tiers do not exist here (no remote,
  no Project sync). Reduces for now to: rule from the working tree, and say so.
- **5.12 (channel files).** Build the folder and the convention on day one; the first entry
  waits until a second agent exists.
- **5.14 (push is deliberate).** No remote exists. Applies from first push onward.

Dropped for this project, with reason:

- **PART 12's deferral is already the state here** — no Miro, no boards, no generated views.
  Nothing to drop; nothing to build.
- **7.1 (git-lock trap).** Real, but the mitigation as written assumes an agent that commits.
  I do not run git writes at all, and this session left no lock. Carried as a note for the
  Architect's brief, not as a foundation item.
- **PART 9's `docs-inventory` re-scan warning** — this corpus has never been scanned, so
  there is nothing to re-scan; the fixed version is what it will meet first.

## 6. What I still need from you — questions

**Q1 — Is `C:\api\pulpvision` in scope?**
Two files, dated 2026-01-06, both filenames recurring later under `visualisatium`. Options:
(a) in scope as a read-only source, its two files hashed against their later namesakes so
the lineage is recorded; (b) out of scope, left alone; (c) in scope and archived wholesale.
**Recommendation: (a).** It costs two hashes and it is the only evidence of the earliest
naming.

**Q2 — What is `C:\api\vividvis` to become: docs only, or docs + code?**
You said it is the new local repo. The Librarian's scope is the documentation layer, so I
can build `docs/` there whatever you decide — but the answer changes the plan materially.
Options: (a) **docs-only repo**, code stays where it is until an Architect session decides
which of the two trees survives; (b) **full repo** — `docs/` plus one of the two code trees
copied in, which means deciding now which tree is the live one; (c) full repo with **both**
trees copied under `legacy/`, decision deferred but material co-located.
**Recommendation: (a).** Choosing between two uncommitted code trees is an architecture
decision, and you have said those wait for the Architect. A docs-only repo is complete on
its own terms and does not prejudge it.

**Q3 — May I write outside `docs/` in the new repo?**
Specifically `CLAUDE.md`, `.gitattributes` (`* text=auto` — this corpus is Windows-origin
and will otherwise produce whitespace-only diffs that make `git status` lie), `.gitignore`,
and `.claude/commands/`. Options: (a) all four; (b) `.gitattributes` and `.gitignore` only,
`CLAUDE.md` deferred to pass 4; (c) `docs/` strictly.
**Recommendation: (a)**, with `CLAUDE.md` written in pass 4 and kept under 100 lines.

**Q4 — Who runs `git init` and the first commit?**
I do not run git write commands. Options: (a) you run `git init` in `C:\api\vividvis` now,
so pass 3 copies land in a tree that can be committed the moment you have reviewed them;
(b) you init after pass 3, at review time; (c) you do it from Claude Code in VS Code
together with the first push.
**Recommendation: (a) now** — it costs one command and it means the whole migration is
reviewable as a diff instead of as a folder.

**Q5 — Identifier series prefixes.**
Proposed, after grepping that nothing in the corpus already uses them: decisions `D-n`,
learnings `L-n`, needs-decision `ND-n`, contradictions `X-n`, rulings `R-n`. All hyphenated.
Series start at 1; nothing is carried from your other projects. Confirm or change.

**Q6 — The two `.git` shells.**
`C:\api\visualisatium\visualisatium\.git` and `C:\api\vivid\apps\web\.git` are empty inits
with no commits and no remote. Options: (a) leave them entirely alone (my default — I
delete nothing without your word); (b) you remove them once the migration is done, so the
old trees cannot be mistaken for repositories with history.
**Recommendation: (a) for now, (b) at close**, listed in the deletion proposal rather than
done silently.

**Q7 — The Gemini date-check you asked about.**
My recommendation is to run it **between pass 1 and pass 2**: pass 1 produces a dated
inventory, you take the newest dates per topic into the Gemini chats, and anything newer
than the disk copy comes back as a file into
`C:\api\vividvis\valmistelu\from-agents\` before the plan is written. Doing it earlier means
searching without knowing what you already have; doing it later means re-planning.

**Q8 — Antigravity / Gem recovery prompts.**
Same timing (after pass 1). I will write one prompt per agent, each carrying (i) the dated
file list I hold for its area, (ii) the specific questions — decisions in force and where
written, identifier series with highest used, what it believes the current state is, its
own instructions verbatim — and (iii) the instruction to tag anything it reconstructs from
memory as `[recalled]`/`[reconstructed]` and to export rather than transcribe. Anything
recovered that way is seeded `[unverified]` and verifying it becomes the Architect's first
repo task. Confirm that is what you want, and tell me which agents still exist to be asked.

**Q9 — Is the project dormant or restarting?**
I am recording it as **dormant since 2026-04-19, restarting now**. Correct me if there is
work after that date I cannot see.

## 7. Proposed foundation — numbered, approve or cut item by item

Nothing below is built yet.

1. `C:\api\vividvis` becomes the target repo; `git init` by you (Q4).
2. `.gitattributes` with `* text=auto`, and a `.gitignore` covering `node_modules/`,
   `.env*`, `.output/`, `.tanstack/`, `dist/`, `build.log`, `pnpm-log.txt` — written as
   commit-one items (Q3).
3. Canonical `docs/` structure per the pack's PART 13, with `handoff/`, `channels/`,
   `ledger/`, `agent-briefs/`, `context/`, `decisions/`, `architecture/`, `design/`,
   `brainstorm/`, `temp/`.
4. `docs/handoff/CURRENT.md` as the single board, with a Start-here block, a repo-state
   stamp, and a "where the pre-repo material is" section naming all five source folders.
5. `docs/ledger/{decisions,learnings,registers}.md` created empty in pass 4, with the
   series from Q5 declared in `registers.md` before the first id is minted.
6. `docs/agent-briefs/cross-project-mechanics.md` as the one rule-set file; briefs cite it
   and never re-type it.
7. Agent briefs written from the pack shapes (no Claude Projects exist to report from) for:
   Architect, Brainstorming, UI/UX, and the Claude Code loop — **drafted in pass 4, and
   explicitly not binding on the agent line-up you will decide later.**
8. `docs/context/` — product-brief (a pointer plus one paragraph, never a new document),
   glossary **with a series-collisions table** (this corpus has `v0.5.x`, `v1.x`, `_vN`
   suffixes and two product names in flight, so collisions are certain), constraints, stack,
   environment, `CLAUDE-TEMPLATE.md`.
9. Retire all pre-repository instruction text — `.agents/Architect.md`, `.agents/Builder.md`,
   `Instructions_For_Next_AI_Chat.md`, the Gem prompt bases under
   `NotebookSources/promptBase/Gems/` — into `docs/archive/` with provenance headers.
10. Name lineage recorded as a decision on day one: pulpvision → Visualisatium → Vivid, with
    the folder each name owns. **The project name itself is yours to settle later;** the
    ledger entry records the history, not a choice.
11. Credential gate in pass 1 over the whole corpus, with the allowlist at zero and every
    pattern validated against a known positive before any negative is trusted.
12. Deletion proposal at close — a list, for you to execute or to grant me rights on, never
    silent.

## 8. Where I was nearly wrong

I read "no `.git` at the root of any connected folder" off the first listing and was one
sentence from writing "no repository exists anywhere". A deeper search found two `.git`
directories, both nested one level below where I had looked. They turned out to be empty
inits, so the conclusion survived — but it survived by luck, not by method. The rule that
should have fired first is the pack's PART 2.7: measure, then rule. A root-level listing is
not a repository search.

## 9. Session state

Pass 0 only. No inventory taken, no file copied, no file changed in any source folder.
This document and the empty `valmistelu/` skeleton under `C:\api\vividvis` are the only
things written. Both are trivially removable if you want the target folder untouched until
the plan is approved.

# Librarian session 1 — Vivid / Visualisatium — pass 0 close

Date: 2026-09-17 · Surface: Cowork, folders attached, device `desktop-099f4ri`
Preceding document: `2026-09-17-librarian-s1-foundation-proposal.md` (same folder)

## Ground at start

Six connected folders, all reachable. No file in this project was under version control:
both `.git` directories found (`C:\api\visualisatium\visualisatium\.git`,
`C:\api\vivid\apps\web\.git`) were empty inits — branch `main`, zero commits, no remote.
Mid-session the owner created `C:\api\vividvis\vivid` and ran `git init` there.

Ground at close, target repo `C:\api\vividvis\vivid`:
branch `main` · **no commits yet** · no remote · working tree holds two untracked files
(`.gitattributes`, `.gitignore`) · **no `.git/index.lock` left behind by this session.**

## Rulings taken this session

Owner's answers to the nine questions in the proposal. **Not yet minted as `D-n`** — the
register does not exist until pass 4, and a row in `docs/ledger/registers.md` is what
minting means. These are to be minted in pass 4, in this order.

1. `C:\api\pulpvision` is in scope as a read-only source; its two files are hashed against
   their later namesakes so the earliest naming is on record.
2. `C:\api\vividvis\vivid` is the target repo and takes **docs + code**.
   `C:\api\vividvis\valmistelu` is the non-repo holding area for material worth keeping but
   not worth committing. Old repo machinery — `node_modules`, build output, other ignored
   paths — is **not** carried over. Once the migration is done the owner deletes the five
   source folders himself; he holds separate backups of all of them.
3. Writing outside `docs/` is authorised: `.gitattributes`, `.gitignore`, `CLAUDE.md`
   (pass 4, ≤100 lines), `.claude/commands/`.
4. Delete permission granted to the Librarian for `C:\api\vividvis` **only**, for the
   session. Nothing in the five source folders is deleted by the Librarian at any point;
   those remain a proposal list for the owner.
5. Identifier series confirmed, all starting at 1, nothing carried from other projects:
   `D-n` decisions · `L-n` learnings · `ND-n` needs-decision · `X-n` contradictions ·
   `R-n` rulings.
6. The two empty `.git` shells in the source folders are left untouched now and listed in
   the deletion proposal at close.
7. The Gemini date-check runs **between pass 1 and pass 2**. Anything newer than the disk
   copy comes back as a file into `C:\api\vividvis\valmistelu\from-agents\`.
8. Recovery prompts for the Gemini Gems and the Antigravity agents are written **after
   pass 1**, each carrying the dated file list for its area. All those agents still exist;
   how much session memory they retain is unknown and the owner will find out. His
   standing position: take the latest each can produce, do not dig deeper, rebuild what is
   missing.
9. Project state recorded as **dormant since 2026-04-19, restarting 2026-09-17**. The owner
   notes it may have gone dormant earlier; 2026-04-19 is the defensible date because it is
   the newest mtime in the corpus.

## What landed, and from what

Written into `C:\api\vividvis\vivid\` (repo, uncommitted):

- `.gitattributes` — `* text=auto`, `eol=crlf` for `.bat`/`.cmd`, explicit `binary` for
  `.docx .xlsx .pdf .png .jpg .ico`. Written because the corpus is Windows-origin and
  `core.autocrlf` is unset in this repo (measured: `git config --get core.autocrlf` is
  empty), which is the configuration that makes a later `git status` lie about whitespace.
- `.gitignore` — `node_modules/`, `.env` and `.env.*` (with `!.env.example`),
  `*.env.legacy`, `dist/ build/ .output/ .tanstack/ .netlify/ .vercel/`, `*.log`,
  `build.log`, `pnpm-log.txt`, editor and OS noise.

Written into `C:\api\vividvis\valmistelu\`:

- `from-librarian/2026-09-17-librarian-s1-foundation-proposal.md` — the pass-0 proposal.
- `from-librarian/manifest-2026-09-17.tsv` — **the pass-1 instrument.** One row per file:
  `sha256`, `bytes`, `mtime` (UTC date), `source_folder`, `relative_path`. Built by walking
  all five source folders with `node_modules`, `.git`, `.output`, `.tanstack`, `.netlify`
  and `.pnpm-store` pruned. **592 files, 76,641,896 bytes, 72 groups of byte-identical
  duplicates.** Counts per folder: `visualisatium` 339 · `Visualisatium` 191 · `vivid` 53 ·
  `Vivid` 7 · `pulpvision` 2.
- `legacy-env/` — the three environment files copied out, byte-verified against their
  sources (sha256 prefixes `2955bb65…`, `97fb0e67…`, `93ec5072…`), **not opened or read**:
  `vivid--apps-web--.env.legacy` (147 B), `vivid--apps-web--.env.example.legacy` (48 B),
  `visualisatium--.env.local.legacy` (499 B).
- Empty skeleton: `brainstorming/`, `from-agents/`, `handoffs/`.

Nothing in any of the five source folders was changed, moved, renamed or deleted.

## Deviations from the prompt

**One, deliberate.** The owner said the legacy `.env` files could go into the repo,
gitignored. They were put in `valmistelu/legacy-env/` instead — outside the repository
altogether — and `.gitignore` additionally carries a `*.env.legacy` rule as a second
barrier. Reason: an ignored secret inside a repo is one `git add -f`, one ignore-rule edit
or one archive-export away from being committed, and the value of having them beside the
repo rather than inside it is identical. Trivially reversible if the owner prefers the
original placement. Note the sizes — 147 B, 48 B and 499 B — are consistent with
placeholders rather than full credential sets; the owner will check.

## Deferred

- The full credential gate (pass 1), enumerated over the commit surface, allowlist at zero,
  every pattern validated against a known positive and a redacted control before any
  negative is trusted.
- `docs/` structure, board, ledger, registers, briefs, context files, `CLAUDE.md`,
  `/next` — passes 3 and 4.
- Deletion proposal for the source folders and the two empty `.git` shells — at close.

## Needs-decision carried forward

**ND-1 — which code tree is the live one?** The ruling is "docs + code", but two
uncommitted code trees exist and neither is obviously dead:

- `C:\api\vivid` — pnpm workspace, `apps/web` (TanStack Start) + `packages/types` +
  `supabase/`, newest build artefacts 2026-02-25, and the one whose agent instructions
  (`.agents/Builder.md`: TanStack Start, React, Tailwind, Shadcn, Drizzle) are on disk.
- `C:\api\visualisatium\visualisatium` — TanStack + Netlify, `netlify.toml`,
  `components.json`, `.cursorrules`, 92 untracked files, newest file `temp.html` 2026-02-26.

Options: (a) `vivid` becomes the repo's code, `visualisatium\visualisatium` goes to
`legacy/` with a provenance header; (b) the reverse; (c) both under `legacy/`, neither
promoted, the Architect decides on first contact.
**Recommendation: (a).** The monorepo plus Supabase plus the agent briefs that name that
stack is the later architecture on every piece of evidence measured so far. But this is an
architecture decision, not a filing decision — **it does not block pass 1**, which is
read-only, and it must be settled before pass 2 writes destinations.

## Where I was nearly wrong

Twice.

The first is recorded in the proposal: a root-level listing showed no `.git` anywhere and I
was one sentence from writing "no repository exists". Both `.git` directories sat one level
below where I looked. They turned out to be empty, so the conclusion held by luck.

The second is the manifest count. The first survey reported 191 / 358 / 121 / 7 / 2 files
using `find` with only `node_modules` pruned; the hashed manifest reports 191 / 339 / 53 /
7 / 2 because it also prunes `.git`, `.output`, `.tanstack`, `.netlify`. **Both numbers are
correct and they measure different things** — and if I had quoted the first set as "the
corpus" in the inventory, 87 files of build output and git internals would have been
counted as documents to migrate. The lesson is the pack's 7.5 in a new costume: a file
count is only meaningful with its exclusion list attached. The manifest carries its
exclusions in this handoff; the inventory must restate them.

## Suggested commit message (owner commits)

```
chore: repo foundation — line-ending and ignore rules

First commit in the new Vivid repository. Nothing migrated yet; passes 1-4
of the Librarian reorganisation still to run.

- .gitattributes: * text=auto, the corpus is Windows-origin and core.autocrlf
  was unset, which makes git status report whitespace-only diffs
- .gitignore: node_modules, env files, build output, logs, editor noise

Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_012Nvs3GvbE1DuqF5L19kJNL
```

## Locks left behind

None. All git reads in this session used `git --no-optional-locks`; `.git/index.lock` was
checked for and absent in all three repositories afterwards.

---

## Addendum — same session, after the owner's reply

**ND-1 is resolved: `C:\api\vivid` is the live code tree.** It becomes the repository's
code in pass 3. `C:\api\visualisatium\visualisatium` goes to `legacy/` with a provenance
header, not dropped. To be minted as a decision in pass 4 alongside the nine rulings above.

**Credential status corrected by the owner.** Two of the three legacy env files hold **real
keys**: `vivid--apps-web--.env.legacy` and `visualisatium--.env.local.legacy`. Only the
`.env.example` copy is placeholders. My earlier inference from their small size — "consistent
with placeholders" — was wrong, and it was an inference from file size, which is not
evidence of contents. Recorded as such.

Consequence, and it is the reason the deviation above was worth making: two files holding
live credentials now exist in a second location on disk. Three barriers stand between them
and a commit — they sit outside the repository, `legacy-env/.gitignore` ignores everything
in that folder, and the repo's own `.gitignore` carries `*.env.legacy`. A `README.md` in
that folder states what is in each file and why the folder exists. Nothing has ever been
committed anywhere in this project, so **no secret from it is in any git history** — that
finding should be re-confirmed by the pass 1 gate and banked before the first push.

**Start-up protocol adopted.** From the next session the owner types only `start up`, having
attached the folders. The session finds the board itself. The protocol is written into the
Librarian Project instructions; the obligation it places on every session is that the board
must exist at the path the next start-up will look in, refreshed in the same pass as the
handoff. This session's board is `CURRENT.md` beside this file.

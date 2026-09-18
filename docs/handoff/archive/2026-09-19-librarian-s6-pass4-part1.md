# Librarian session 6 — Vivid — pass 4, part 1: mechanics, ledger, Architect brief, context, ADRs

Date: 2026-09-19 · Surface: Cowork, six folders attached, device `desktop-099f4ri`
Board read: `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md` (Start-here → s5, newest on disk by filename date then
sNN; pointer correct). Handoff read: `…\2026-09-18-librarian-s5-pass3-execute.md` with addendum.
Also read: `EXECUTION-REPORT.md`; `STARTING-PROMPT-pass-4-new-files.md`; handoffs s1, s2, s3, s4 in full;
`MIGRATION-PLAN.md` — header, Decisions, Couplings, Needs decision, New files, Proposed decision records, Execution notes
(not the row tables); `INVENTORY.md` — Summary, Contradictions, Questions only; `pass3-research-log.json`; Librarian
Project docs `claude/librarian-project-startup-pack.md`, `claude/librarian-instructions.md`.
**Not read:** `2026-09-17-librarian-s3-question-pack.md`, `2026-09-17-librarian-s1-foundation-proposal.md`.
Working file: `…\2026-09-19-librarian-s6-working.md` (rulings and questions, written before they were asked).

## Ground at start

`C:\api\vividvis\vivid`: `main`, last `0b9f6c3 library commit 1`, 4 commits, 3 ahead of `origin/main` (local ref), 0 untracked,
0 deleted, no whitespace-insensitive diff, no `*.lock` / `tmp_obj_*`. `C:\api\visualisatium\visualisatium`: empty init, 92
untracked. `C:\api\vivid\apps\web` init not re-measured. `git check-ignore -v apps/web/.env` → `apps/web/.gitignore:6`.
Re-grounded after the owner's second reply: nothing had moved.

## Rulings (owner, this session) — minted as R-32 … R-36

1. Commit mode (a): the owner commits pass-4 output from Windows (R-32).
2. Write the Architect brief only; no agent exists yet (R-33).
3. Q-s6-1 (a): owner rulings → `R-n` rows (spent ones marked); `D-n` only for what binds beyond the reorganisation (R-34).
4. Q-s6-2 (a): C1–C12 → X-1…X-12; Q7, Q9–Q12 → ND-9…ND-13; labels kept as aliases (R-35).
5. Q-s6-3 (a): the Architect is a Claude Project, Cowork (git reads; owner commits) or chat (read-only); Claude Code
   implements (R-36).

## What landed — 21 new files in `C:\api\vividvis\vivid`, uncommitted

| file | written from |
|---|---|
| `docs/agent-briefs/cross-project-mechanics.md` (step 1) | Librarian instructions + startup pack, restated for this repo; channel id convention decided here (§7) |
| `docs/ledger/registers.md` | s1–s6 rulings; plan §Needs decision; `INVENTORY.md` §Contradictions, §Questions. R-1…R-36, ND-1…ND-14, X-1…X-12, channel prefixes `l2a a2l a2c c2a` |
| `docs/ledger/decisions.md` | D-1…D-12, each citing its R-n |
| `docs/ledger/learnings.md` | L-1…L-13, from the "nearly wrong" sections of s1–s5 |
| `docs/agent-briefs/architect.md` | pack + instructions §BRIEFS (all nine points), R-33, R-36; ends with a proposed 12-file GitHub-synced orientation set |
| `docs/context/{product-brief,glossary,constraints,stack,environment}.md`, `docs/context/CLAUDE-TEMPLATE.md` | `01-master-vision.md` + fullest edition; `package.json`, `apps/web/package.json`, `capacitor.config.ts`, `.env.example` (names only), migrations; ledger. `stack.md` names **pnpm** |
| `docs/decisions/0001` … `0008` | plan §Proposed decision records, numbered as the plan did (a committed header already cites `ADR-0001`) |

Verification: a script checked every `R/ND/X/D/L-n` and ADR cited in the 21 files against the ledger — **0 unresolved**.
Missing paths reported by the same script are all pass-4-part-2 files (`docs/README.md`, `docs/handoff/CURRENT.md`,
`docs/channels/*`, `docs/context/project-rules.md`, `legacy/README.md`, `docs/context/sources/research/README.md`) or optional
folders (`docs/handoff/log/`, `docs/temp/`); the two `file:line` citations were checked by `sed` and are right.
Registers' "highest used" re-checked against the files: D-12, L-13, R-36, ND-14, X-12, ADR 0008.
**Credential gate** over the commit surface (21 untracked files): 10 patterns; known positive `legacy-env\` → 5 (count only,
nothing printed); redacted control → 0; **new files → 0 hits.**

## Deviations

1. **Pass 4 split in two**, stated at the start: this session did steps 1–5 of the pass-4 starting prompt; steps 6–11 remain.
2. This handoff and the board stay in `valmistelu\from-librarian\`, not `docs/handoff/archive/`, because the board moves only
   in step 10; part 2 copies s1–s6 into `docs/handoff/archive/` under their existing names.
3. The root `README.md` (committed `54ecccd`) still says "no project material has been migrated". It is stale since `0b9f6c3`;
   rewriting it is added to part 2 (in scope: R-19).

## Deferred to pass 4 part 2 (next session)

Steps 6–11 of `STARTING-PROMPT-pass-4-new-files.md`: the §New files READMEs (incl. `docs/context/sources/research/README.md`
from `pass3-research-log.json`, `legacy/README.md` per R-31, never touching `legacy/visualisatium-web/README.md`),
`docs/context/project-rules.md` (D-6 merge), first entries in `docs/channels/librarian-to-architect.md` (open ND-9…ND-14,
X-3/X-6/X-7/X-8, the D-5 reconciliation pairs, the `Builder.md` stub, the Architect's first ruling on `a2c` channel vs
`handoff/log`), `CLAUDE.md` from the template, `/next` in `.claude/commands/`, copy s1–s6 into `docs/handoff/archive/`,
root `README.md` rewrite, `docs/README.md`, the board to `docs/handoff/CURRENT.md` with the old one retired to a pointer,
the deletion proposal (R-6), close-out and the findings for the Librarian Project docs.

## Needs-decision

None new from this session. Open for the owner/Architect: ND-9 … ND-14 (registers).

## Where I was nearly wrong

**I nearly minted the pre-repo labels away.** My plan was to map Q1–Q5 onto R-numbers and drop the Q labels, and to number the
ADRs in whatever order I wrote them. A grep over the committed tree, run only to build the glossary's collisions table, showed
58 status headers citing `F<n>`, four citing "ruling Q2", and one citing `ADR-0001` by number. Renaming would have broken
committed citations on day one. So the register keeps the labels as aliases, and the ADRs are numbered as the plan did.

**And I wrote an unmeasured negative into `environment.md`**: "no Supabase URL or key is present in any env file". That was
written without reading `legacy-env\` or the ignored `.env`, and I may read neither. I replaced it with what was measured:
`.env.example` names no Supabase variable, and `grep -rli supabase apps/web/src` returns nothing. The pattern was proven on a
known positive first.

## Findings for the Librarian Project docs (to write at the end of part 2, with s5's two)

3. A pass 4 with no agent Projects still needs **three owner rulings the pack does not list**: how rulings split between `R-n`
   and `D-n`, whether inventory items get minted, and the first agent's surface. The pass-0 proposal should ask them.
4. Pass 4 for a ~600-file corpus did not fit one session. The pack should say so and name the split point (after the ADRs).
5. Before renaming or re-mapping any label, grep committed status headers — pass 3 writes citations of pass-1 labels into them.

## Suggested commit message (owner commits)

```
docs: pass 4 part 1 — mechanics, ledger, Architect brief, context, ADRs

- docs/agent-briefs/cross-project-mechanics.md: the one shared rule set
- docs/agent-briefs/architect.md: first Architect brief (Claude Project;
  owner commits, owner pushes)
- docs/ledger/: registers (R-1..R-36, ND-1..ND-14, X-1..X-12),
  decisions D-1..D-12, learnings L-1..L-13
- docs/context/: product-brief, glossary, constraints, stack (pnpm),
  environment, CLAUDE-TEMPLATE
- docs/decisions/0001..0008

Credential gate over the 21 new files: 0 hits.
```

## Locks left behind

None. No git write was made; `.git` has no `*.lock`.

---

## Addendum — 2026-09-19, same session

The owner committed pass 4 part 1 as **`ae2f4cf library commit 2`** (01:37 +0300). Re-ground measured: 0 untracked, 0 deleted,
`main` 4 ahead of the local `origin/main` ref, no `*.lock`. Board stamp updated.

## Addendum 2 — ND-9 … ND-14 answered by the owner (2026-09-19)

The owner's answers are minted as **R-37 … R-42**. ND-9, -10, -11, -12 and -14 are resolved. ND-13 stays open: the owner
rotates the Anthropic and OpenAI keys **before the first push**, and work continues until then. **D-13** was added: the
credit peg keeps the latest definition, provisionally, 1 credit = €0.10. Its two newest sources, constitution v6 and
`PricingTable_v2`, agree. X-1 and X-2 are "resolved for now". `product-brief.md`, `constraints.md` and `glossary.md` were
updated to cite D-13, and D-11 now cites R-41.

**One new item: ND-15.** R-42 says to use the *latest* Creator/Guidance Gem text. Two copies are dated the same day,
2026-09-18: the `from-gemini` files the owner saved from the live Gems, and the Takeout export. Which one is later has not
been measured. Part 2 measures it; if it can't be settled, part 2 asks the owner. The repo currently holds the `from-gemini`
texts.

**Uncommitted after this addendum:** `docs/ledger/registers.md`, `docs/ledger/decisions.md`, `docs/context/product-brief.md`,
`docs/context/constraints.md`, `docs/context/glossary.md`. Part 2's commit carries them, or the owner commits them now.
Suggested message: `docs: mint ND-9..ND-14 answers (R-37..R-42), D-13 credit peg`.

**Added to the part-2 worklist:**
- **R-38:** a readable UTF-8 copy of `docs/brainstorm/api-visualisatium/prompts/muistiin'.txt`. It goes **outside**
  `docs/brainstorm/`, which is never edited. Proposed location: `docs/architecture/open-questions-muistiin.md`, with a
  status header naming the source and saying the questions are unanswered. Measure the original's encoding first; don't
  assume it.
- **R-40:** `docs/context/sources/README.md` says `Products.xlsx` is incomplete and possibly superseded by later documents.
- **R-37:** the `librarian-to-architect.md` entry asks the Architect to check `docs/architecture/tech-stack-master.md` and
  `Database_Schema_Blueprint.md` against the code, because the code session may never have had them.
- **ND-15:** measure it, then record the answer in `docs/agent-briefs/archive/gem-era/README.md`.

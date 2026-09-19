# Registers — every identifier series in this repository

**Minting an identifier means writing its row here.** An id that is not in this file does not exist.
Rules for the series: `docs/agent-briefs/cross-project-mechanics.md` §8. First text 2026-09-19,
Librarian session 6 (pass 4), minted under ruling R-34 and R-35.

**Sources.** `s1`…`s6` are the Librarian's session handoffs, filed as
`YYYY-MM-DD-librarian-sNN-<topic>.md`. Pass 4 part 2 (s7) copied them, hash-identical, into `docs/handoff/archive/`
under the same names (originals remain in `C:\api\vividvis\valmistelu\from-librarian\`):
s1 `2026-09-17-librarian-s1-foundation.md` · s2 `2026-09-17-librarian-s2-inventory.md` ·
s3 `2026-09-18-librarian-s3-rulings-and-first-commits.md` · s4 `2026-09-18-librarian-s4-migration-plan.md` ·
s5 `2026-09-18-librarian-s5-pass3-execute.md` · s6 this session's handoff (and
`2026-09-19-librarian-s6-working.md`). "Plan" = `MIGRATION-PLAN.md`, same folder.

## Series summary — highest used

| series | meaning | file | highest used | re-checked |
|---|---|---|---|---|
| `D-n` | decisions that bind the project beyond the reorganisation | `docs/ledger/decisions.md` | D-13 | 2026-09-19, against that file |
| `L-n` | learnings | `docs/ledger/learnings.md` | L-15 | 2026-09-19 (s7), against that file |
| `R-n` | owner rulings on Librarian questions | this file | R-43 | 2026-09-19 (s7), rows below |
| `ND-n` | needs-decision items | this file | ND-15 | 2026-09-19, rows below; ND-1…ND-8 against s1, plan §Needs decision, s5 |
| `X-n` | contradictions found in the corpus | this file | X-12 | 2026-09-19, against `INVENTORY.md` §Contradictions C1–C12 |
| ADR | decision records, `docs/decisions/NNNN-<slug>.md` | `docs/decisions/` | 0008 | numbering fixed by plan §Proposed decision records; `ADR-0001` is already cited in a committed status header |
| channel ids | `<x>2<y>-n` per channel file | `docs/channels/` | `l2a-6` | 2026-09-19 (s7), against `librarian-to-architect.md` |

**Pre-repository labels (not series; kept because committed files cite them):** `F1`–`F36` version
families, `C1`–`C12` contradictions and `Q1`–`Q12` questions of `INVENTORY.md` (in `valmistelu\`, outside
the repo). Measured 2026-09-19: `F<n>` appears in 58 committed status headers; `Q1`/`Q2` in four.
Mapping: `C<n>` → `X-<n>` below; `Q1`–`Q5` → R-12…R-16; `Q6` closed (s3 addendum 2); `Q8` = ND-4;
`Q7`, `Q9`–`Q12` → ND-9…ND-13. This session's own questions `Q-s6-1`…`3` → R-34…R-36.

## R — owner rulings

Status: **in force** · **spent** (session- or pass-scoped, done) · **superseded by …** · **open** (owner action pending).

| id | date | ruling | status | source |
|---|---|---|---|---|
| R-1 | 2026-09-17 | `C:\api\pulpvision` is in scope as a read-only source; its two files hashed against their later namesakes | in force as to read-only; its description "earliest naming" **superseded by R-12** | s1 ruling 1 |
| R-2 | 2026-09-17 | `C:\api\vividvis\vivid` is the target repo and takes **docs + code**; `C:\api\vividvis\valmistelu` is the non-repo holding area; repo machinery (`node_modules`, build output) is not carried; the owner deletes the five source folders himself after the migration (he holds backups) | in force → D-1 | s1 ruling 2 |
| R-3 | 2026-09-17 | Librarian write scope outside `docs/`: `.gitattributes`, `.gitignore`, `CLAUDE.md` (≤100 lines), `.claude/commands/` | in force; extended by R-19 | s1 ruling 3 |
| R-4 | 2026-09-17 | Delete rights for the Librarian on `C:\api\vividvis` only, for session 1; nothing in the five source folders is ever deleted by the Librarian | delete grant **spent**; the never-delete-sources half in force | s1 ruling 4 |
| R-5 | 2026-09-17 | Identifier series `D-n L-n ND-n X-n R-n`, all from 1, nothing carried from other projects | in force → D-12 | s1 ruling 5 |
| R-6 | 2026-09-17 | The two empty `.git` shells in the source folders are left untouched and listed in the deletion proposal at close | **open** — deletion proposal written s7 (`valmistelu\from-librarian\DELETION-PROPOSAL.md`); owner executes | s1 ruling 6 |
| R-7 | 2026-09-17 | Gemini date-check runs between pass 1 and pass 2 | **spent** — owner's finding 2026-09-18: nothing in the chats newer than disk | s1 ruling 7; s3 addendum 2 |
| R-8 | 2026-09-17 | Recovery prompts for the Gems and Antigravity agents written after pass 1 | **spent** — not needed; the Gems' live texts were placed on disk 2026-09-18 | s1 ruling 8; s3 addendum 2 |
| R-9 | 2026-09-17 | Project recorded as dormant since 2026-04-19 (newest mtime in the corpus), restarting 2026-09-17; may have gone dormant earlier | in force | s1 ruling 9 |
| R-10 | 2026-09-17 | ND-1 (a): `C:\api\vivid` is the live code tree; `C:\api\visualisatium\visualisatium` goes to `legacy/` with a provenance note | in force → D-2, ADR 0005 | s1 addendum |
| R-11 | 2026-09-17 | Start-up protocol: the owner types only `start up`; the session finds the board itself | in force (cross-project-mechanics §4.5) | s1 addendum |
| R-12 | 2026-09-18 | Q1: `pulpvision` is **a different product, though related**; its files go to `docs/archive/pulpvision/` with a provenance header; never cited as Vivid product fact | in force → D-3 | s3 ruling 1 |
| R-13 | 2026-09-18 | Q3: `ImprovementsAdmin Dashboard v3.5.docx` canonical; `v3.docx` archived as the changelog-bearing edition | in force → D-4 | s3 ruling 2 |
| R-14 | 2026-09-18 | Q4: project rules are a **merge** — `project_rules.md` as base + §4 from `project_rules_someNewVersion.md`; both originals archived | in force → D-6, ADR 0004; merged file `docs/context/project-rules.md` written s7 | s3 ruling 3 |
| R-15 | 2026-09-18 | Q2: dashboards have two canonicals at two levels — `Dashboards_Blueprint.md` (69,956 B) the specification, the 2026-04-19 Ultimate pair the strategic layer; same-named blueprints get distinct names | in force → D-4, ADR 0001, 0002 | s3 ruling 4 |
| R-16 | 2026-09-18 | Q5: shrinking master series (F5, F6, F7, F11, F12) carry fullest **and** newest, both status-headered; reconciliation is Architect work | in force → D-5, ADR 0003 | s3 ruling 5 |
| R-17 | 2026-09-18 | The Librarian commits in the target repo (add/commit only, gate before each, identity per command); the owner pushes | commit half **superseded by R-30, R-32**; owner-pushes half in force → D-9 | s3 ruling 6 |
| R-18 | 2026-09-18 | Delete rights on `C:\api\vividvis` for session 3, to clear git lock and temp files | **spent** | s3 ruling 7 |
| R-19 | 2026-09-18 | Root `README.md` added to the Librarian's write scope | in force | s3 ruling 8 |
| R-20 | 2026-09-18 | Credential rotation deferred to the end of the reorganisation; risk noted and accepted | Clerk half **spent** (rotated 2026-09-19, s5 addendum); Anthropic/OpenAI half open as ND-13 → D-11 | s3 ruling 9 |
| R-21 | 2026-09-18 | Gemini Takeout: take only the Builder Gem v1.0 text; hash-check the attachments; nothing else | in force (done in pass 3) | s4 ruling 1 |
| R-22 | 2026-09-18 | Pass 2 runs in session 4 | **spent** | s4 ruling 2 |
| R-23 | 2026-09-18 | ND-2: the legacy tree's Create-TanStack-App demo files are left out | in force | plan §Needs decision; s4 addendum |
| R-24 | 2026-09-18 | ND-3: the seven Deep Research exports stay outside the repo, byte-copied to `valmistelu\research\`, listed by name, size, sha256 in `docs/context/sources/research/README.md` | in force → D-8; confirmed again s5 ruling 3 | plan; s4 addendum; s5 |
| R-25 | 2026-09-18 | ND-4 (= Q8): the two foreign files are left out | in force | plan; s4 addendum |
| R-26 | 2026-09-18 | ND-5: Librarian write scope extended to the code paths for pass 3 only, copy-never-modify | **spent** — pass 3 closed | plan; s4 addendum |
| R-27 | 2026-09-18 | ND-6: current-vs-archive convention confirmed (current = family canonicals, Q5 fullest editions, the code-era `start/` input set; the rest archived beside its subject under original names) | in force → ADR 0008 | plan; s4 addendum |
| R-28 | 2026-09-18 | ND-7: the Takeout's 27 intermediate master-series editions are left out; the Creator/Guidance text differences go to the Architect | in force; the Architect part is ND-14 | plan; s4 addendum |
| R-29 | 2026-09-18 | `MIGRATION-PLAN.md` approved as a whole | **spent** — executed in pass 3 | s4 addendum |
| R-30 | 2026-09-18 | Pass 3 copies into the working tree only; the owner commits from Windows | **spent** — committed as `0b9f6c3` | s5 rulings 1–2 |
| R-31 | 2026-09-19 | ND-8 (b): the legacy provenance note is `legacy/README.md`; `legacy/visualisatium-web/README.md` stays a byte copy | in force; `legacy/README.md` written s7 | s5 addendum |
| R-32 | 2026-09-19 | Pass 4: the owner commits from Windows; no commit or delete rights for the Librarian | in force for pass 4 → D-9 | s6 working file, ruling 1 |
| R-33 | 2026-09-19 | No agent exists yet; the first likely to start is the Architect — write its brief only | in force | s6 working file, ruling 2 |
| R-34 | 2026-09-19 | Q-s6-1 (a): every owner ruling is an `R-n` here (session-scoped ones marked spent); `decisions.md` holds as `D-n` only what binds the project beyond the reorganisation, each citing its `R-n` | in force | s6 working file |
| R-35 | 2026-09-19 | Q-s6-2 (a): inventory contradictions C1–C12 minted as X-1…X-12; open questions Q7, Q9–Q12 as ND-9…ND-13; inventory labels kept as aliases | in force | s6 working file |
| R-36 | 2026-09-19 | Q-s6-3 (a): the Architect is a Claude Project, used in Cowork with `C:\api\vividvis` attached (git reads only; the owner commits its files) and on browser/phone with GitHub-synced knowledge (read-only); Claude Code implements and commits only under an owner ruling | in force → D-10 | s6 working file |
| R-37 | 2026-09-19 | ND-9: the owner is not sure why `04_`/`05_` were not in the code-era inputs — possibly the stack and schema were changing at the time, possibly a mistake (Gemini export errors). Treated as **not deliberate**: the code session cannot be assumed to have had them | in force; checking `tech-stack-master.md` and the schema documents against the code is Architect work | s6 handoff addendum 2 |
| R-38 | 2026-09-19 | ND-10: `muistiin'.txt` is converted to a readable copy; the questions are answered later by the owner or the Architect | in force; readable copy `docs/architecture/open-questions-muistiin.md` written s7 | s6 handoff addendum 2 |
| R-39 | 2026-09-19 | ND-11: the credit peg changed several times; **keep the latest for now** (1 credit = €0.10, as in constitution v6 and `PricingTable_v2`); may change as the product develops | in force → D-13 | s6 handoff addendum 2 |
| R-40 | 2026-09-19 | ND-12: `Products.xlsx` is **incomplete**, and possibly partly or wholly superseded by later documents | in force; stated in `docs/context/sources/README.md` (s7) | s6 handoff addendum 2 |
| R-41 | 2026-09-19 | ND-13: the owner rotates the Anthropic and OpenAI keys **before the first push**; work continues meanwhile | **spent** — rotated 2026-09-19 (owner); the history gate ran after the push (s7): 0 hits | s6 handoff addendum 2 |
| R-42 | 2026-09-19 | ND-14: several Gems and versions produced the texts and attribution is hard to check; the project no longer runs on Gems — **use the latest** | in force; ND-15 measured s7: both copies carry the same text | s6 handoff addendum 2 |
| R-43 | 2026-09-19 | Q-s7-1 (a): correct the dead path `docs/architecture/database-schema-blueprint.md` → `docs/architecture/Database_Schema_Blueprint.md` in the four F10 archive status headers only; bodies untouched | **spent** — applied s7; bodies verified identical to `HEAD` | s7 handoff addendum |

## ND — needs-decision items

| id | alias | question | status | resolved by / owner |
|---|---|---|---|---|
| ND-1 | — | Which code tree is live? | resolved | R-10 |
| ND-2 | — | Legacy demo code in or out? | resolved | R-23 |
| ND-3 | — | Deep Research exports in the repo? | resolved | R-24 |
| ND-4 | Q8 | The two foreign files | resolved | R-25 |
| ND-5 | — | Who copies the code in pass 3? | resolved | R-26 |
| ND-6 | — | Current-vs-archive convention | resolved | R-27 |
| ND-7 | — | Takeout intermediate editions | resolved | R-28 |
| ND-8 | — | Where the legacy provenance note goes | resolved | R-31 |
| ND-9 | Q7 | `04_` (tech stack) and `05_` (schema) masters were not in the code-era input set `vivid/.chat_attachments/start/` — deliberate? If not, the code session started without them | resolved — not deliberate; Architect checks docs vs code | R-37 |
| ND-10 | Q9 | `docs/brainstorm/api-visualisatium/prompts/muistiin'.txt` lists open technical questions (splitting user and product databases, where passwords live, delivering video to a customer's own YouTube channel) that nothing else answers — transcode and answer? | resolved — readable copy in part 2; answers later | R-38 |
| ND-11 | Q10 | Restate the credit peg once, authoritatively (X-1, X-2)? A product decision | resolved for now — latest peg kept | R-39, D-13 |
| ND-12 | Q11 | `Products.xlsx` covers Image and Video only; the other `Tuotteet-*` sheets are not in it — is the catalogue those two, or is `Products.xlsx` partial? | resolved — incomplete, possibly superseded | R-40 |
| ND-13 | Q12 | Rotate the Anthropic and OpenAI keys held in `valmistelu\legacy-env\`? Deferred to the end of the reorganisation, risk accepted (R-20) | resolved — owner rotated both keys 2026-09-19 | R-41 |
| ND-14 | — | Creator Gem v3.3 and Guidance Gem v3.4 differ from their Takeout copies by 70 and 38 non-whitespace characters; which text is authoritative? | resolved — use the latest | R-42 |
| ND-15 | — | ND-14 says use the latest Creator/Guidance text. Two copies exist from the same day (2026-09-18): the files the owner saved from the live Gems (`from-gemini`, now in `docs/agent-briefs/archive/gem-era/`) and the Takeout export. Which is later is not measured | resolved by measurement (s7) — the instruction texts are word-identical; the ND-14 differences are Takeout wrapper labels. The `from-gemini` copies stand | `docs/agent-briefs/archive/gem-era/README.md` |
## X — contradictions (from `INVENTORY.md` §Contradictions, 2026-09-17)

| id | alias | contradiction | status |
|---|---|---|---|
| X-1 | C1 | Credit peg: 1 credit = €1.00 (constitution v2.5) vs €0.10 (v6); the later line appears to be v6 | **resolved for now** — latest kept (R-39, D-13) |
| X-2 | C2 | Three pricing tables give three credit values for Image (1 cr/€5 · 1 cr/€1 · 10 cr/€1); the newest is `PricingTable_v2` (2026-02-04) | **resolved for now** — latest kept (R-39, D-13) |
| X-3 | C3 | "Odyssey" renamed "Saga"; both live in the corpus; later appears to be Saga | **open** — Architect |
| X-4 | C4 | Four product names on disk: Visualisatium, VIVID, LUMINA, pulpvision (the last is another product, X-10) | **open** — owner; not settled by any agent (D-7) |
| X-5 | C5 | Package manager: `.cta.json` says npm; workspace, lockfile and a note say pnpm | **settled by artefact** — the lockfile exists; `docs/context/stack.md` names pnpm |
| X-6 | C6 | `.agents/Builder.md` names Drizzle ORM; the code has no Drizzle dependency (raw Supabase SQL + Zod types) | **open** — Architect |
| X-7 | C7 | Backend shape: rules file says hybrid Supabase Edge + Fastify/Node; a prompt says no Node/Express; the code has only TanStack server functions | **open** — Architect |
| X-8 | C8 | Deployment target: Netlify in every stack document and the legacy tree; the live tree has no Netlify config (Nitro + Capacitor) | **open** — Architect |
| X-9 | C9 | Filenames contradict their own contents' versions (e.g. `AdminDashboard_0.2.docx` holds v1.3) | **recorded** — ADR 0007; no action |
| X-10 | C10 | `pulpvision` was recorded as the earliest naming; its contents are a different product | **resolved** — R-12 |
| X-11 | C11 | Two different documents both named `Dashboards_Blueprint.md` | **resolved** — ADR 0001 |
| X-12 | C12 | `project_rules_someNewVersion.md` is older than `project_rules.md`; neither a superset | **resolved** — R-14, ADR 0004 |

## Channel id prefixes (cross-project-mechanics §7)

| prefix | channel file | created |
|---|---|---|
| `l2a` | `docs/channels/librarian-to-architect.md` | 2026-09-19 (s7); l2a-1 … l2a-6 |
| `a2l` | `docs/channels/architect-to-librarian.md` | reserved |
| `a2c` / `c2a` | Architect ↔ Claude Code — channel file or `docs/handoff/log/`, the Architect's ruling | reserved |

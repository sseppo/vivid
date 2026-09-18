# `docs/` — the map

One page. A new folder or file class gets its row here in the same turn it is created (mechanics §11.8).
**Start with the board:** `handoff/CURRENT.md`. Product name not settled (D-7).

| path | what it holds | who writes it |
|---|---|---|
| `handoff/CURRENT.md` | **the board** — the only copy: repo-state stamp, *Start here*, state of play, next sessions, open items | every agent, same pass as its handoff |
| `handoff/archive/` | one handoff per session, `YYYY-MM-DD-<agent>-sNN-<topic>.md`; `pre-repo/` = Gemini-era status files (README) | each agent |
| `handoff/log/` | *(not created)* Architect ↔ Claude Code briefs, if the Architect rules for this form (l2a-5) | Architect, Claude Code |
| `channels/` | `<from>-to-<to>.md`, newest entry first, ids `l2a-n` etc., `**Answers:**` marks consumption. Now: `librarian-to-architect.md` | the sending agent |
| `agent-briefs/` | canonical agent instructions — `architect.md`, and `cross-project-mechanics.md`, the one shared rule set. The repo wins over settings-box copies | Architect (Librarian until handover) |
| `agent-briefs/archive/` | retired instruction texts: `gem-era/` (the Gemini Gems, README), NotebookLM/Antigravity-era prompts (README) | — |
| `context/` | shared by all agents: `product-brief`, `glossary`, `constraints`, `stack` (pnpm), `environment`, `project-rules`, `CLAUDE-TEMPLATE` | Architect |
| `context/sources/` | the product inputs as at dormancy: master series 01–03, 06, 07 (newest + fullest, ADR 0003), pricing and catalogue sheets (README) | read-only inputs |
| `context/sources/research/` | pointer list only: the 7 Deep Research exports live outside the repo (D-8) | — |
| `context/archive/` | superseded context material, original names (README) | — |
| `architecture/` | `tech-stack-master`, `tech-stack-descriptions`, `Database_Schema_Blueprint` (not yet checked against code, R-37); `open-questions-muistiin` (owner's open questions) | Architect |
| `architecture/archive/` | superseded stack and schema drafts (README) | — |
| `design/dashboards/` | dashboards: two-level canon + three `.docx` specs (README, ADR 0001–0002) | Architect / UI-UX |
| `design/archive/` | superseded design material (README) | — |
| `decisions/` | ADRs `NNNN-<slug>.md`, immutable once merged; 0001–0008 | Architect |
| `ledger/` | `decisions.md` (D-n), `learnings.md` (L-n), `registers.md` (every id series; minting = a row there) | Architect |
| `brainstorm/` | brainstorming material, never edited but by its producer; filenames kept (README) | producing agent only |
| `archive/pulpvision/` | **a different product**; never Vivid fact (D-3, README) | — |

Outside `docs/`: `apps/`, `packages/`, `supabase/` (code) · `legacy/` (superseded code, README) · `.agents/` (Antigravity-era,
ADR 0006) · `CLAUDE.md` · `.claude/commands/next.md`. Outside the repository, owner's machine only:
`C:\api\vividvis\valmistelu\` (pre-repo Librarian output, research exports, legacy credential copies).

Not created until first use: `testing/`, `assets/`, `temp/` (drop box; never cited).

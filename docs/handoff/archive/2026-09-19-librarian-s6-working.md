# Librarian session 6 — Vivid — pass 4 working file

Date: 2026-09-19 · Surface: Cowork, six folders attached, device `desktop-099f4ri`
This file holds what the session asks and is told, before it is said in chat (standing rule 5).

## Ground at start

`C:\api\vividvis\vivid`: `main`, last `0b9f6c3 library commit 1`, 4 commits, 3 ahead of `origin/main` (local ref),
0 untracked / 0 deleted / no whitespace-insensitive diff, no `*.lock`, no `tmp_obj_*`.
`git check-ignore -v apps/web/.env` → `apps/web/.gitignore:6:.env` (file not read).
Board `…\from-librarian\CURRENT.md`, Start-here → s5 handoff = newest on disk (filename date, then sNN). Pointer correct.

## Owner rulings, this session

1. **Commit mode (a):** the owner commits from Windows, as after pass 3. No commit rights, no delete rights asked.
2. **Briefs:** no agent exists yet; the first to start is likely the **Architect**. Write the Architect brief only.
3. Go for pass 4.

## Budget, stated at start

Pass 4 does not fit one session. This session: steps 1–5 (mechanics, ledger, Architect brief, context files, ADRs),
then handoff and board. Next session: steps 6–11 (READMEs, project-rules merge, channel entries, CLAUDE.md, /next,
handoff archive copy, docs/README.md, board move to docs/handoff/CURRENT.md, close-out, handover).

## Questions asked this session

Asked 2026-09-19 after step 1 (`docs/agent-briefs/cross-project-mechanics.md`, written). Steps 2–5 wait on the answers.

**Q-s6-1 — how the rulings are minted.** Session 1 fixed the series (`D-n` decisions, `L-n` learnings, `R-n` rulings,
`ND-n` needs-decision, `X-n` contradictions) but not which ruling goes in which. About 30 owner rulings are waiting (s1 nine,
ND-1, s3 nine incl. Q1–Q5, s4 two, ND-2…ND-8, s5 three, s6 two).
(a) Every owner ruling becomes an `R-n` row in `registers.md`, in date order, with its source handoff; `decisions.md` then
carries as `D-n` only the handful that bind the project beyond the reorganisation (target repo and scope, live code tree,
pulpvision is another product, dashboards two-level canon, shrinking series fullest+newest, project-rules merge, name not
settled, Deep Research kept outside the repo, owner pushes), each citing its `R-n`.
(b) Everything becomes `D-n`; no `R-n` is used.
(c) Procedural rulings (delete rights for one session, "pass 2 runs in this session") are not minted at all, only recorded
in their handoffs.
**Recommendation: (a)**, with (c)'s session-scoped procedural items still minted as `R-n` marked *spent*, so the
register is complete and nothing needs re-reading from handoffs.

**Q-s6-2 — the inventory's open items.** Contradictions C1–C12 and open questions Q7, Q9, Q10, Q11, Q12.
(a) Mint C1–C12 as `X-1`…`X-12` (status: open / resolved-by-ruling / not-applicable) and Q7, Q9–Q12 as `ND-9`…`ND-13`,
each keeping its inventory label as an alias, since committed status headers cite `Q2`, `F4` etc. (b) Leave them in
`INVENTORY.md` only and point to it. **Recommendation: (a)** — `INVENTORY.md` sits in `valmistelu\`, outside the repo,
so (b) would leave the Architect citing a file no cold session can open.

**Q-s6-3 — the Architect's surface, for its brief.** No Architect exists yet. (a) A Claude Project (claude.ai), used in
Cowork with `C:piividvis` attached (git reads only, **owner commits** its files) and on browser/phone with
GitHub-synced knowledge (no-repo, read-only); implementation goes to Claude Code, which commits in its own sessions only
if you rule so. (b) The Architect works in Claude Code directly, with native git. (c) Something else.
**Recommendation: (a)** — it matches how you run your other projects, and keeps one committer (you) until you decide
otherwise. Either way the brief's cast table names who commits and who pushes.

**Answered 2026-09-19 by the owner: Q-s6-1 (a), Q-s6-2 (a), Q-s6-3 (a) — all as recommended.**

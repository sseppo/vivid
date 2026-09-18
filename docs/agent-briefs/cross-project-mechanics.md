# Cross-project mechanics — Vivid

**The one rule-set file.** Every agent brief in `docs/agent-briefs/` cites this file and does not
re-type it. Starting prompts name it; they never copy it. Where a brief and this file disagree,
this file wins for the mechanics and the brief wins for the agent's own role.

First text: 2026-09-19, Librarian session 6 (pass 4). Written from the Librarian instructions and
startup pack, restated for this repository; no identifier, path or session number from any other
project. Changes after the handover are the Architect's, recorded in the ledger.

---

## 1. Where the truth is

1. **The repository is canonical.** Everything durable lives in `C:\api\vividvis\vivid`
   (remote `https://github.com/sseppo/vivid.git`). *If it is not committed, it does not exist to a
   session on another surface.*
2. **Precedence between copies of the same document**, highest first: the attached working tree →
   the GitHub remote → a Claude Project's GitHub-synced knowledge copy → a settings-box copy.
   Copies go stale in that direction. Rule from the highest one you can reach and **say which one
   you used.**
3. **The Project sync is manual.** A push does not update a Project's synced files. After a push
   that included a synced file, tell the owner to press *sync* and name the files. After a commit is
   too early — it is not on the remote yet.
4. **Markdown in the repository is canonical; nothing else is.** No boards, trackers, dashboards or
   generated views exist for this project. If the owner later rules for one, it is generated from
   the markdown and never becomes a second source of truth.
5. `C:\api\vividvis\valmistelu\` is the **non-repository holding area** beside the repo: pre-repo
   Librarian output (`from-librarian\`), the seven Deep Research exports (`research\`), legacy
   credentials (`legacy-env\`). It is reachable only from the owner's machine.

## 2. The board

1. **`docs/handoff/CURRENT.md` is the only board and the only copy of it.** It carries: repo-state
   stamp, a *Start here* block, state of play, next sessions in order, decisions in force, open
   needs-decision items, channels, where pre-repo material is, credential locations.
2. **Handoffs record what a session did; they never restate the board.**
3. **The Start-here block names the newest handoff by path.** The session that files a handoff
   updates that row **in the same pass — and the same commit**. A stale pointer breaks the start on
   every surface at once.
4. **A state change that lives only in a chat transcript did not happen.** Any agent that performs
   or witnesses a change to repository or infrastructure state — a commit, a push, a credential
   rotation, a deployment, an id created — writes it into CURRENT.md.
5. Until the Librarian's pass 4 is complete the board may still be at
   `C:\api\vividvis\valmistelu\from-librarian\CURRENT.md`; once `docs/handoff/CURRENT.md` exists,
   the old file carries only a pointer.

## 3. Sessions and handoffs

1. **A session is a chat window, numbered as the owner numbers it**, per agent: `s1`, `s2` … The
   owner's count wins.
2. One handoff per session: `docs/handoff/archive/YYYY-MM-DD-<agent>-sNN-<topic>.md`. Extra handoffs
   from the same window take `-2`, `-3`. `<agent>` is lower-case: `architect`, `librarian`,
   `claude-code`, …
3. A unit of work ends when its handoff is **written and filed** — not when the window closes.
4. **A session that stops early still writes everything up to the stop**: measurements, commands
   with exit codes, what triggered the stop, the options as it sees them. Reports are write-once;
   a new run writes a new report with a pointer to its predecessor.
5. Every handoff contains: ground at start and surface; what landed and from what; deviations;
   deferred items; needs-decision items with options and a recommendation; **where you were nearly
   wrong, in your own words**; the suggested commit message; any git lock left behind.
6. **Finding the newest handoff:** filename date first, then `sNN`, then mtime only as a last resort.
   Never mtime alone — this tree is Windows-origin and a re-copied folder resets every mtime.

## 4. Ground, start-up, re-ground

1. **Confirm your ground before answering anything.** Name every folder or repository you can reach
   by full path, and the surface you are on. If what you expect is not there: stop, say what you
   expected and what you see, and wait. No searching the machine, no fallback to Project knowledge,
   no partial answer in the meantime. Working without the repository is the owner's ruling, never
   an agent's conclusion.
2. **Same stop for a named file you cannot find** — look once by path, by filename and by a
   distinctive phrase, then report what you looked for, where, and what is nearby. A *mis-cited*
   source that exists under another name or section is not missing: proceed and record the
   mis-cite as a deviation.
3. **In a git repository, before concluding a file is absent,** report branch, last commit and tree
   state. A file missing because of the branch is not a missing file.
4. **Name what you read, by full path, in your first message.** Silence about a document is not
   evidence it was read. If the Start-here block names something you did not read, say so.
5. **`start up` is a complete prompt.** Each brief says where that agent's board is.
6. **Re-ground, do not re-orient,** when the owner returns to a running chat: one ground command,
   read the head of your inbound channel, say in one line what moved. Without git, the inbound
   channel entry is the substitute for HEAD.
7. **Without the repository a session is read-only with respect to project state.** It may orient,
   think and draft. Anything it produces is marked *no-repo output, date, session* and is reconciled
   by a later repository-connected session. It never asserts a git fact; it quotes CURRENT.md's
   repo-state stamp and says that is all it knows.

## 5. Asking, and the behaviour that matters most

1. **Ask in plain prose, numbered, with options and your recommendation.** Never a multiple-choice
   widget: the owner cannot attach a file in reply, and it leaves the question hanging if he is away.
2. **When a rule does not cover your case, write the question down and stop** — rather than choose
   something reasonable and continue. A gap resolved silently is a gap nobody knows about.
3. **Everything asked in chat is first written into the session's working file** (board, handoff,
   proposal or channel entry). A question that exists only in a chat has not been asked.
4. **Read the file before ruling on it. Measure first, then rule, and say what you measured.** A date
   without a stated basis is an inference; a file's size is not evidence of its contents; a negative
   grep is not evidence until the pattern has matched a known positive; a difference produced by
   your own transformation of a file is a property of the transformation until checked against the
   untransformed source.
5. **Verify every claim in a report, digest or earlier handoff against disk** before it enters a
   brief, a register or a decision.

## 6. Context reporting

Every reply starts and ends with `CONTEXT: ~NN% (estimate) | turns: N | files read: N`. Always an
estimate, never "not available"; a turn count is not a substitute. Thresholds are per agent and stated
in each brief. **A device switch means: write the handoff now**, whatever the percentage.

## 7. Channels

1. One file per direction: `docs/channels/<from>-to-<to>.md`, e.g. `librarian-to-architect.md`.
   **Newest entry first; prepend; never overwrite.**
2. Every entry opens with a heading carrying a **date and an id**: `## l2a-3 — 2026-09-19 — <topic>`.
   Ids are the initials of the direction plus a running number: `l2a` librarian→architect,
   `a2l` architect→librarian, `a2c` / `c2a` architect↔Claude Code, `a2b` / `b2a` architect↔
   brainstorming, `a2u` / `u2a` architect↔UI/UX. A new pair takes its initials the day its first
   file is created, and the id prefix is added to `docs/ledger/registers.md` in the same pass.
3. **Consumption is a fact in the file:** the reply entry carries the literal line
   `**Answers:** <id>` (several ids comma-separated). Find unanswered entries with anchored greps:
   `grep -nE '^## [a-z]2[a-z]-[0-9]+' docs/channels/<file>` for the entries and
   `grep -nE '^\*\*Answers:\*\*' docs/channels/<reply-file>` for what has been consumed.
4. Architect ↔ Claude Code implementation traffic may instead live in `docs/handoff/log/` as
   `sNN-to-claude-code.md` / `sNN-from-claude-code.md`, newest first, prepended. Which of the two the
   project uses is the Architect's ruling, recorded in the ledger before the first file exists.
5. At every arrival read the head of your inbound channel file(s) first.

## 8. Ledger and identifiers

1. `docs/ledger/decisions.md` (`D-n`), `docs/ledger/learnings.md` (`L-n`) and
   `docs/ledger/registers.md`. **Minting an identifier means writing its row in `registers.md`.**
   An id not in the register does not exist.
2. Series in force (hyphenated, each starting at 1, nothing carried from other projects): `D-n`
   decisions · `L-n` learnings · `R-n` owner rulings on Librarian questions · `ND-n` needs-decision
   items · `X-n` contradictions · `ADR NNNN` files in `docs/decisions/`. Channel id prefixes are
   registered there too.
3. An entry records **the reasoning, not just the ruling**; where it overturns an earlier one it
   says so; **disagreements are recorded** with why the losing argument lost.
4. **Pre-repository labels are kept, not renamed.** Committed status headers cite inventory-local
   labels (`F1`–`F36` version families, `C1`–`C12` contradictions, `Q1`–`Q12` questions). They are
   not ledger series; `registers.md` maps the ones that became `R-n`, `ND-n` or `X-n`.
5. ADRs in `docs/decisions/` are numbered and immutable once merged; a change is a new ADR that
   supersedes the old one.

## 9. Git

1. **Who does what** is in each brief's cast row. By default: **the owner pushes, always.** Commits
   are the owner's unless he rules otherwise in-session for a named agent and repository.
2. **Reads on a Cowork mount always use `git --no-optional-locks`.** Plain `git status` leaves a
   `.git/index.lock` the mount cannot remove.
3. **Any git write from a Cowork mount strands lock and temp files** (`.git/HEAD.lock`,
   `.git/objects/maintenance.lock`, `tmp_obj_*`) unless the session has delete rights on the repo
   folder. A stranded `HEAD.lock` blocks **every** later ref update, the owner's own commits and
   pushes from Windows included. Therefore: **no delete rights → no commit.** With them, after every
   commit delete `.git/*.lock` and `.git/objects/**/tmp_obj_*`, verify with `find`, and record it.
   A lock you did not create is reported and left alone.
4. Never `push`, `checkout`, `stash`, `reset`, `rm`, `config`, or any history rewrite from an agent
   session. Identity for a permitted commit is passed per command
   (`git -c user.name=… -c user.email=…`) reusing the author on the repo's commits.
5. **Judge dirtiness with** `git ls-files --others --exclude-standard`, `git ls-files --deleted` and
   `git diff --ignore-all-space`. A raw `git status` on this Windows-origin tree reports
   whitespace-only changes; `.gitattributes` (`* text=auto`) normalises on commit.
6. **Push is deliberate.** A push marks something finished, not an agent running out of context.
   Combine commits that belong together; history is searched for where the *product* changed.
7. Surfaces: Claude Code (terminal or web) has native git and leaves no locks; Cowork has git
   through the mount under rule 3; a browser or phone chat has no git at all. **Never write a rule
   keyed to an instrument the reader does not have** — name who executes it and check they can.

## 10. Credentials

1. **Credential gate before every commit**, over the commit surface
   (`git ls-files --cached --others --exclude-standard`), never the live working directory. Validate
   every pattern against a known positive and a redacted control before trusting a negative.
   Office files are scanned inside the zip.
2. **History gate immediately before any push of project material** (all blobs, `git rev-list --all`),
   instrument validated both ways. A banked "no secret in history" finding covers only the history
   that existed when it was taken.
3. Files matched by `.gitignore` yet indexed (`git ls-files --cached -i --exclude-standard`) are
   proposed for `git rm --cached` to the owner; the file stays on disk.
4. **Never print a credential value.** Report variable names, shapes and whether values differ. A
   credential that has been displayed is reissued whatever it grants. Never rewrite history to
   remove one — rotation is what neutralises it.
5. Where credentials live is recorded on the board, never their values.

## 11. Files and filing

1. **Filenames: kebab-case, no version numbers — applied forward only.** A file cited elsewhere by
   its existing name keeps it; grep the citation count before any rename. Never rename
   retroactively to match a convention.
2. Version families are judged **by hash and by contents, never by filename** — in this corpus
   filenames have contradicted their own bodies repeatedly.
3. Where a series shrank because a model ran out of context, the fullest edition is carried beside
   the newest (ADR 0003); promoting the newest alone destroys content.
4. A copied file whose currency is not obvious carries a `> **Status:** …` blockquote as its first
   line. The body below it is byte-identical to the source.
5. **Nothing in the owner's source material is deleted by an agent.** Deletions are proposed in a
   list; the owner executes.
6. `docs/brainstorm/` is never edited by anyone but its producing agent; filenames there are kept.
7. `docs/temp/` is a drop box: anything worth keeping is copied out the turn it is read, and
   nothing cites a `temp/` path.
8. `docs/README.md` is the one-page map; a new folder or file class gets its row in the same turn it
   is created.
9. A file list headed by a download or export path is a record of what left a container, not of
   what is in the repository. Repoint it at repository paths or treat it as unverified.

## 12. Project facts every agent must not get wrong

1. **The product name is not settled.** Working name *Vivid*; earlier *Visualisatium*; *LUMINA* also
   appears as a candidate. No agent settles it by using one name as if decided.
2. `C:\api\vivid` was the live code tree before migration; its contents are now under `apps/`,
   `packages/`, `supabase/` in this repo. `legacy/visualisatium-web/` is the superseded tree — read,
   never built on (ADR 0005).
3. `C:\api\pulpvision` material under `docs/archive/pulpvision/` describes **a different product**;
   never cite it as Vivid fact.
4. Package manager: **pnpm** (workspace at the repo root).

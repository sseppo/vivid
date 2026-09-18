---
description: Report where the Vivid project stands and the next action, from the board
---

Report, read-only, where this project stands. Do not start any work.

1. Ground: run `git --no-optional-locks log --oneline -1`, `git --no-optional-locks ls-files --others --exclude-standard`,
   `git --no-optional-locks ls-files --deleted` and `git --no-optional-locks diff --ignore-all-space --stat`. Report branch,
   last commit and tree state. Report any `.git/*.lock` and leave it alone. (Without git — a chat session — say so and quote
   the board's repo-state stamp instead.)
2. Read `docs/handoff/CURRENT.md`. Compare its repo-state stamp with what step 1 measured and say whether it is current.
3. Read the handoff its *Start here* block names. Check it is the newest in `docs/handoff/archive/` — by filename date, then
   `sNN`, never by mtime alone. If not, name both.
4. Read the head of the inbound channel file(s) for your role in `docs/channels/` and list entries with no `**Answers:**`
   line in the reply file (`grep -nE '^## [a-z]2[a-z]-[0-9]+'`, `grep -nE '^\*\*Answers:\*\*'`).
5. Reply with: ground · files read (full paths) · where the project stopped (one line) · open needs-decision items ·
   the next action as the board states it · anything stale you found. Then stop.

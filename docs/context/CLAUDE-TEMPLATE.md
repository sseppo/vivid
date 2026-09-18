# CLAUDE.md template — Vivid

The shape `CLAUDE.md` at the repo root is written from. **Keep `CLAUDE.md` under 100 lines**: it loads
into every session on every surface, so detail goes into `@`-imported files. Replace every `<…>`.
First text 2026-09-19, Librarian session 6.

---

```markdown
# Vivid — <one line: what this repository is>

> Product name not settled (D-7). Board: `docs/handoff/CURRENT.md`. Map: `docs/README.md`.

## Start here
1. Confirm your ground: `git --no-optional-locks log --oneline -1`; report branch, last commit, tree
   state. Expected repository: `C:\api\vividvis\vivid`. If it is not what you have, stop and say so.
2. Read `docs/handoff/CURRENT.md` and the handoff its Start-here block names. Name what you read.
3. Rules shared by every agent: @docs/agent-briefs/cross-project-mechanics.md

## Context
@docs/context/stack.md
@docs/context/constraints.md
<further @-imports, each one line>

## Commands
<pnpm commands that exist in package.json — verify before listing>
<slash commands — only those present in .claude/commands/>

## Git
The owner pushes. Commit only under an owner ruling for this session (D-9). Never push, reset,
checkout, stash, rm, config or rewrite history.

## Before you finish
Write the handoff and refresh the board in the same pass (mechanics §2–3).
```

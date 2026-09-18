# ADR 0003 — Shrinking master series carry the fullest and the newest edition

**Status:** accepted, 2026-09-18 (owner ruling R-16); recorded 2026-09-19, Librarian session 6.

## Context
The numbered master series (`01` master vision, `02` business-logic constitution, `03` product catalog,
`06` partner ecosystem, `07` features/UX — inventory F5, F6, F7, F11, F12) were re-emitted whole by
Gemini Gems at each revision and lost text as the Gems ran out of context: `01` went from 19,792 B to
2,852 B over four revisions; `07` lost 26 %, `06` 15 %. The owner recorded the cause in January 2026.

## Decision
`docs/context/sources/` holds, for each of the five, the newest edition (`NN-<name>.md`, status: current
edition) **and** the fullest (`NN-<name>-fullest-edition.md`, status: fuller earlier edition, content
lost to Gem context limits, not superseded in substance). Other members are archived.

## Consequences
Two files per subject until the Architect reconciles each pair. The obvious tidy-up — keep the newest,
archive the rest — is the wrong one and must not be done by any agent. See L-6.

**Sources:** plan §Proposed decision records; s2 finding 2; s3 ruling 5; D-5.

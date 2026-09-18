# Vivid

An AI generation marketplace, in reorganisation. **No project material has been migrated into
this repository yet** — this repo currently holds only its foundation files.

> **Status:** reorganisation in progress, 2026-09. The working product name is *Vivid*
> (earlier *Visualisatium*); the name is not settled and is not decided here.

## Where things stand

The project's documents were produced across several tool generations and live in five source
folders outside this repository. They are being inventoried, planned and migrated into a
canonical `docs/` tree in four passes:

| pass | what it does | state |
|---|---|---|
| 0 — foundation | scope, rulings, target repo | done |
| 1 — inventory | every source file read and classified | done — 592 files, 36 version families |
| 2 — plan | each file mapped to a destination | next |
| 3 — execute | copy, hash-verified, never move | pending |
| 4 — new files | `docs/` tree, agent briefs, `CLAUDE.md`, board | pending |

## Start here

Until pass 4 builds `docs/`, the project board lives **outside this repository**, beside it in
the preparation folder `valmistelu/from-librarian/CURRENT.md`. It names the newest handoff, the
state of play, the decisions in force and the open questions. A session without access to that
folder cannot pick this project up yet; that is what pass 4 fixes.

## This repository

- `.gitattributes` — `* text=auto`; the corpus is Windows-origin
- `.gitignore` — dependencies, env files, build output, logs, editor noise

Code migrates in pass 3. Nothing here is a product or architecture decision; those belong to the
project's architect once the structure is in place.

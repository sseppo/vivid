# Glossary

First text 2026-09-19, Librarian session 6. Product terms are quoted from the files named in each row;
repository terms from the ledger. The Architect maintains this file from here.

## Product terms

| term | meaning | source |
|---|---|---|
| Vivid | working product name; **not settled** (D-7). Code uses it: `com.vivid.app`, `@vivid/types`, `vivid-monorepo` | D-7; `apps/web/capacitor.config.ts`; `package.json` |
| Visualisatium | earlier working name (Jan 2026 documents, the legacy tree) | X-4 |
| LUMINA | named in one constitution edition as a previous working name; the statement conflicts with others | X-4 |
| pulpvision | **a different product** (subscription video-channel site) — not an earlier name | D-3, X-10 |
| Saga | sequential multi-step product line; step *n+1* cannot start until step *n* is locked; context ("Asset DNA") is inherited | `docs/context/sources/01-master-vision.md` §1 |
| Odyssey | earlier name for Saga; still in pre-rename files | X-3 |
| Collection | unordered set of items, not guided or dependent | `01-master-vision.md` §1 |
| Curator | the user who owns a project and its vault; pays for the Saga Pass | `01-master-vision-fullest-edition.md` §1 |
| Contributor | guest invited by magic link; uploads assets, may chip in credits | same |
| Partner | IP rights holder (creator) or physical manufacturer | same |
| CCA | Content Creator Agent — human service tier; also a `user_role` value | same; `supabase/migrations/0000_vivid_initial_schema.sql` |
| Credit | the platform currency; its euro value is **contradicted** across the corpus | X-1, X-2, ND-11 |
| Green / Yellow / Red lane | generation routing: public APIs / self-hosted "Sanctuary Server" / hard block | `01-master-vision.md` §2 |
| Tuotteet | Finnish, "products" — the per-type product sheets in `docs/context/sources/product-sheets/` | filenames |

## Repository and process terms

| term | meaning |
|---|---|
| board | `docs/handoff/CURRENT.md` — the only statement of current state |
| handoff | one per session, `docs/handoff/archive/YYYY-MM-DD-<agent>-sNN-<topic>.md` |
| valmistelu | Finnish, "preparation": `C:\api\vividvis\valmistelu\`, the non-repository holding area beside the repo (D-1) |
| Gem / Gem era | Gemini Gems used for planning Dec 2025 – Jan 2026; their texts are archived in `docs/agent-briefs/archive/gem-era/` |
| Antigravity | the IDE whose agents read `.agents/` at the repo root (ADR 0006) |
| fullest edition | the largest member of a shrinking document series, carried beside the newest (D-5) |
| status header | the `> **Status:** …` first line prepended to a copied file; the body below is byte-identical to its source |
| legacy | `legacy/` — the superseded code tree, history only (D-2) |

## Series collisions

Identifiers that look alike but mean different things. Measured 2026-09-19 by grep over the committed
text files (`.md .txt .json .ts .tsx .sql`; `.docx`/`.xlsx` bodies not searched).

| looks like | means | where it appears | do not confuse with |
|---|---|---|---|
| `F1`–`F36` | inventory version families | 58 committed status headers | anything in the ledger |
| `C1`–`C12` | inventory contradictions | `INVENTORY.md` (outside the repo) | `X-1`…`X-12`, which are the same items minted (registers) |
| `Q1`–`Q12` | inventory questions; "ruling Q2" in dashboard headers = R-15 | 4 status headers | "Q1 2026" (a calendar quarter) in `docs/agent-briefs/archive/gem-era/guidance-gem-instructions-v3.4.md` |
| `ADR-0001` | `docs/decisions/0001-…` | the header of `docs/design/dashboards/dashboards-blueprint.md` | — |
| `ND-n`, `R-n`, `X-n`, `D-n`, `L-n` | ledger series (registers) | `docs/ledger/` | no occurrences found elsewhere in committed text |
| `v1.2`, `v3.5` … | version tokens inside filenames and bodies — **frequently contradict each other** | 110 occurrences in 70 files | a document's actual order (L-5, ADR 0007) |
| `Phase 1`, `Phase 3` | planning phases in the Gem-era documents | master series | pass 1–4 of the Librarian reorganisation |

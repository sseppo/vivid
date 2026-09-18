# `docs/context/sources/` — the current source set

These are the product documents the project was built from, as they stood at dormancy (2026-04-19).
They are **inputs**, not decisions: the shared summaries agents read first are the files one level up
(`product-brief.md`, `glossary.md`, `constraints.md`, `stack.md`, `environment.md`), and decisions live in
`docs/ledger/decisions.md`. Every `.md` here carries a status header; the binaries below cannot, so their
status is stated here.

## The master series — newest and fullest, both carried (D-5, ADR 0003)

| # | newest edition | fullest edition | family |
|---|---|---|---|
| 01 | `01-master-vision.md` | `01-master-vision-fullest-edition.md` | F5 |
| 02 | `02-business-logic-constitution.md` | `02-business-logic-constitution-fullest-edition.md` | F6 |
| 03 | `03-product-catalog.md` | `03-product-catalog-fullest-edition.md` | F7 |
| 06 | `06-partner-ecosystem.md` | `06-partner-ecosystem-fullest-edition.md` | F11 |
| 07 | `07-features-ux.md` | `07-features-ux-fullest-edition.md` | F12 |

Each revision was re-emitted by a Gemini Gem that ran out of context, so later editions lost text.
**Reconciling each pair is Architect work.** Neither edition is to be deleted or promoted alone.
The `04_` tech-stack and `05_` schema masters are in `docs/architecture/` (`tech-stack-master.md`,
`Database_Schema_Blueprint.md`); they were **not** in the code-era input set, and that was not deliberate
(R-37) — the code session cannot be assumed to have had them.

## Binaries — status

| file | status | source |
|---|---|---|
| `Lists-In-database.docx` | current; largest edition; in the code-era input set; name kept (16 citations) | `vivid/.chat_attachments/start/` |
| `Products.xlsx` | current but **incomplete**: covers Image and Video only, and may be partly or wholly superseded by later documents (R-40) | `vivid/.chat_attachments/start/` |
| `SoldProduct.docx` | current; superset; in the code-era input set; name kept (4 citations) | `vivid/.chat_attachments/start/` |
| `pricing-plan-vivid-v2.xlsx` | current; carries the ten-fold credit re-peg (X-1); name kept (3 citations) | `vivid/.chat_attachments/start/` |
| `pricing-table.xlsx` | current; newest pricing table (was `PricingTable_v2.xlsx`, 2026-02-04); its values disagree with earlier tables (X-2) | `vivid/.chat_attachments/start/PricingTable_v2.xlsx` |
| `technical-notes.docx` | current; in the code-era input set (was `Technical notes.docx`) | `vivid/.chat_attachments/start/` |
| `tooling-versions.xlsx` | current; in the code-era input set (was `00_TOOLING_VERSIONS_v2.1.xlsx`) | `vivid/.chat_attachments/start/` |
| `product-sheets/Tuotteet-*.xlsx` (8) | per-type product sheets (collections, fyysiset, inFutureVersions, information, kuva, lisamyynnit, specials, video); the sources `Products.xlsx` was merged from, **not** versions of it (F21) | `Visualisatium/files/v0.5.3/`, `visualisatium/NotebookSources/` |

## Contradictions stated here, not resolved here

- **Credit peg (X-1, X-2).** Values on disk: 1 credit = €1.00 (constitution v2.5) and €0.10 (v6); three pricing
  tables give 1 cr/€5, 1 cr/€1 and 10 cr/€1 for Image. **In force, provisionally: the latest — 1 credit = €0.10**,
  as in constitution v6 and `pricing-table.xlsx` (D-13, R-39). The owner expects to revisit pricing.
- **Catalogue scope (ND-12 → R-40).** `Products.xlsx` holds Image and Video only; the other product types exist
  only in `product-sheets/`. The catalogue is not settled by either.

Deep Research exports: not in the repository — see `research/README.md`.

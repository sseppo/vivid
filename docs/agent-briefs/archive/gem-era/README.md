# `gem-era/` — the Gemini Gem instructions, retired

From January to April 2026 the project ran on Google Gemini **Gems** (custom-instruction agents), with Antigravity
IDE agents for code. **The project no longer runs on Gems.** Nothing here is a brief any current agent runs on; the
current briefs are one level up (`docs/agent-briefs/architect.md`, `cross-project-mechanics.md`). Read these for
provenance only — to explain a phantom structure or an old citation.

## The Gems, and which text is here

| Gem | role (roster) | version | file | text source |
|---|---|---|---|---|
| Planning | Product Visionary & CPO | **3.6** (roster says 3.5 — the roster is stale) | `planning-gem-instructions-v3.6.md` | live Gem, saved by the owner 2026-09-18 |
| Planning, earlier edition | — | 3.6 | `planning-gem-instructions-v3.6-earlier-edition.md` | `Visualisatium/planning/specs/temp.md`; differs from the live text in **one word**: the context-warning threshold is 70 % here, 80 % in the live text |
| Creator | Agent Factory Manager | 3.3 | `creator-gem-instructions-v3.3.md` | live Gem, saved 2026-09-18 |
| Guidance | Orchestrator & TPM | 3.4 | `guidance-gem-instructions-v3.4.md` | live Gem, saved 2026-09-18 |
| Architect | Systems & Database Architect | 1.2 | `architect-gem-instructions-v1.2.md` | live Gem, saved 2026-09-18 |
| Archivist ("Organizing Gem") | Librarian & Context Synthesizer | 1.1 (from the roster; the text itself has no version) | `archivist-gem-instructions-v1.1.md` | live Gem, saved 2026-09-18 |
| Builder | Full Stack Engineer | 1.0 | `builder-gem-instructions-v1.0.md` | extracted from the Gemini Takeout (2026-09-18, block "WAT - Builder Gem"); the only copy |

Every `.md` carries a status header naming its exact source file.

## Facts established by measurement

- **`.agents/Architect.md` (repo root) is the Architect Gem v1.2, verbatim.** Byte hashes and line counts differ (CRLF and
  blank-line formatting only); normalised, both are 7,693 characters with the same hash. The Antigravity Architect agent was
  running the Gem's instructions unchanged. (Librarian s3.)
- **Creator v3.3 and Guidance v3.4: the files here and the Takeout copies carry the same text (ND-15, resolved
  2026-09-19, Librarian s7).** The earlier-measured 70- and 38-character differences (ND-14) are the Takeout's own wrapper
  labels — `Instructions:`, `Files: …`, and the next block's `Name:` — not changes to the instructions. A word-token diff of
  the HTML-stripped Takeout blocks against these files finds no other difference. Times: the Takeout file is stamped
  2026-09-18 07:55:48 UTC; the owner saved these copies from the live Gems 16:39–16:46 UTC the same day. Either copy is "the
  latest" (R-42); these stand.
- Both the Creator and the Guidance Gem had a knowledge file attached in Gemini: **`The 2026 Developer Environment.docx`**
  (Takeout block labels). No file of that name is in the 597-file corpus (searched by name in `manifest-2026-09-18.json`; the same search finds `Lists-In-database` 14 times). The Takeout and the Gemini Drive were not searched.

## The two JSON rosters (no header possible — status here)

| file | status |
|---|---|
| `gem_roster.json` | the last roster (entries dated 2026-01-17 / 2026-01-19); **stale on the Planning Gem row** (3.5 vs the live 3.6). Its Google Drive paths point outside every folder migrated. Name kept — 6 citations in the corpus. |
| `gem-roster-old-v1.json` | the earlier roster (2026-01-13), of an older `SysPrompt_*` generation: Manager, Architect, Builder, Mobile Gems. Historical. |

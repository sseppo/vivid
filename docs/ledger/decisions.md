# Decisions — `D-n`

Decisions that bind the project beyond the Librarian's reorganisation (R-34). Each records the
reasoning and cites the owner ruling(s) behind it in `registers.md`. Newest decisions are appended;
a decision that overturns another says so and the old one is marked, never deleted.
First text 2026-09-19, Librarian session 6. From here the Architect maintains this file.

---

### D-1 — One repository, docs and code; a holding area beside it
`C:\api\vividvis\vivid` (remote `github.com/sseppo/vivid`) holds the documentation **and** the code.
`C:\api\vividvis\valmistelu\` holds what is worth keeping but not committing (pre-repo Librarian
output, Deep Research exports, legacy credential copies). Build output and `node_modules` were not
carried. The five pre-migration source folders are the owner's to delete; he holds backups.
**Why:** before September 2026 nothing in this project was under version control; material sat in
five folders across three tool generations, and no session on another surface could find the state.
One repository makes every surface interchangeable. **Source:** R-2.

### D-2 — The live code is the former `C:\api\vivid`; the other tree is legacy
`apps/`, `packages/`, `supabase/` and the root workspace files come from `C:\api\vivid` (pnpm
workspace, TanStack Start web app, `@vivid/types`, Supabase migrations). `legacy/visualisatium-web/`
is the superseded TanStack/Netlify tree — history, not a base to build on.
**Why:** the monorepo, the Supabase schema and the agent briefs naming that stack are the later
architecture on every measured signal; the other tree is almost entirely unmodified starter demo code.
Its last build failed on a corrupt pnpm store, not a code fault — do not read the failure as a reason
to prefer the legacy tree. **Source:** R-10, ADR 0005.

### D-3 — `pulpvision` is a different product
Its two files (`docs/archive/pulpvision/`) describe a subscription video-channel site with
Watcher/Creator memberships. Related, but never cited as Vivid product fact.
**Overturns:** the session-1 description of pulpvision as the project's earliest name (R-1), which
rested on the folder name; the contents do not support it (X-10). **Source:** R-12.

### D-4 — Dashboards: two canonicals at two levels
`docs/design/dashboards/dashboards-blueprint.md` is the **specification**;
`dashboards-ultimate-synthesis.md` + `dashboards-ultimate-mechanics-prd.md` (2026-04-19) are the
**strategic layer** above it. For the admin dashboard `.docx` line, the v3.5 edition is canonical.
**Why:** "newest is canonical" gives the wrong answer here — the newest pair is ~9 KB and assumes
the 70 KB specification; most of the content is in the older file. **Source:** R-13, R-15, ADR 0001, 0002.

### D-5 — Shrinking master series: fullest and newest both carried
For `01` master vision, `02` business-logic constitution, `03` product catalog, `06` partner ecosystem
and `07` features/UX, `docs/context/sources/` holds the newest edition **and** a `-fullest-edition`.
**Why:** each revision was re-emitted by a Gemini Gem that ran out of context; `01` lost 86 % of its
text over four revisions. The owner diagnosed this in January 2026. Promoting the newest alone would
discard content silently. **Reconciling each pair is Architect work**, not filing. **Source:** R-16, ADR 0003.

### D-6 — Project rules are a merge of two files
`docs/context/project-rules.md` = `project_rules.md` as base + §4 "Immutable Legal & Logic Axioms"
from `project_rules_someNewVersion.md`. Neither original is a superset; both are archived.
**Source:** R-14, ADR 0004. (The merged file is written in pass 4 part 2.)

### D-7 — The product name is not settled
Working name *Vivid*; earlier *Visualisatium*; *LUMINA* also appears. No agent settles it by use;
documents say "Vivid (name not settled)" where it matters. **Why:** four names are on disk (X-4) and
the choice is the owner's. **Source:** board, decisions in force since session 1.

### D-8 — Deep Research exports stay outside the repository
The seven Gemini Deep Research `.docx` exports (58.9 MB) live in `C:\api\vividvis\valmistelu\research\`
as byte copies; the repository lists them by name, size and sha256. **Why:** size, and they are
source material rather than project documents. **Consequence:** a session without the owner's machine
cannot read them. **Source:** R-24.

### D-9 — Git roles: the owner pushes; commits are the owner's unless ruled
The owner pushes, always. Agent sessions commit only under an in-session owner ruling naming the
repository — and on a Cowork mount only with delete rights on the repo folder, clearing lock and
temp files after each commit. **Why:** measured 2026-09-18 — a commit from the mount stranded
`.git/HEAD.lock`, which blocked the owner's own commits and pushes from Windows until removed
(L-8). The Librarian committed in session 3 under that discipline; from pass 3 on the owner commits.
**Source:** R-17, R-30, R-32.

### D-10 — The Architect is a Claude Project; Claude Code implements
The Architect runs as a Claude Project in two modes: Cowork with `C:\api\vividvis` attached (git
reads only; the owner commits its files) and browser/phone chat with GitHub-synced knowledge
(read-only with respect to project state). Implementation is Claude Code's; it commits only under an
owner ruling. **Why:** matches how the owner runs his other projects and keeps one committer until he
decides otherwise. Brief: `docs/agent-briefs/architect.md`. **Source:** R-33, R-36.

### D-11 — Credentials: outside the repo, gated, rotation partly deferred
Copies of three legacy env files sit in `C:\api\vividvis\valmistelu\legacy-env\` (two with live
values), behind three ignore barriers; `.env*` except `.env.example` is ignored in the repo. The
Clerk keys were rotated 2026-09-19; the new ones are in the git-ignored `apps/web/.env`. The
Anthropic and OpenAI keys are **not** rotated yet — the owner rotates them before the first push (ND-13, R-41). **Before the first
push of project material, a session re-runs the credential gate over all of git history.**
**Source:** R-20, s2 credential gate, s5 addendum.
**Update 2026-09-19 (s7):** the Anthropic and OpenAI keys were rotated by the owner before the push; every legacy value is
now dead. The history gate was re-run over all 484 blobs after the push (not before, as this decision said): 0 hits.

### D-12 — Identifiers
Series `D-n L-n R-n ND-n X-n`, hyphenated, from 1; ADRs `NNNN`; channel ids `<x>2<y>-n`. A row in
`registers.md` is what minting means. Pre-repository labels (`F`, `C`, `Q`) are kept where committed
files cite them and mapped in the register, never renamed. **Source:** R-5, R-34, R-35.

### D-13 — Credit peg: the latest definition, provisionally
1 credit = €0.10 — the business-logic constitution v6 line and `PricingTable_v2` (Image: 10 credits, €1), the two newest
sources, which agree with each other. Earlier values (€1.00; 1 credit/€5; 1 credit/€1) are history. **Provisional:** the
owner expects to revisit pricing as the product develops. **Why:** the peg changed several times; the latest is the best
available statement until then. **Source:** R-39; X-1, X-2.

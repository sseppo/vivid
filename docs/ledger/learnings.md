# Learnings — `L-n`

What this project cost to find out, in the words of the session that found it. Each entry: what
happened, what it teaches, where it is recorded. First text 2026-09-19, Librarian session 6, drawn
from the "where I was nearly wrong" sections of sessions 1–5 (sources as in `registers.md`).
From here the Architect maintains this file.

### L-1 — A file count is meaningless without its exclusion list
A first survey counted 191/358/121/7/2 files; the hashed manifest 191/339/53/7/2. Both were correct —
the second also pruned `.git`, `.output`, `.tanstack`, `.netlify`. Quoting the first as "the corpus"
would have counted 87 files of build output and git internals as documents. Quote every count with
its exclusions. (s1)

### L-2 — A file's size is not evidence of its contents
Three small env files (147 B, 48 B, 499 B) were called "consistent with placeholders". Two held live
keys. (s1 addendum)

### L-3 — An error message is evidence of a symptom, not its cause
`build.log` failed on an unresolved `@tanstack/react-query`; it looked like a missing dependency.
`package.json` declares it; the pnpm store was corrupt. Read the declaration before publishing the
diagnosis. (s2)

### L-4 — One secret can match two patterns
Clerk's and Stripe's test secret keys share a shape; one Clerk key matched both patterns and nearly
became a phantom Stripe credential. Credential gates report variable names, not pattern names. (s2)

### L-5 — In this corpus, filenames contradict contents
`AdminDashboard_0.2.docx` holds v1.3; `Tech_Stack_Master_maybe.md` outranks its unsuffixed sibling;
`project_rules_someNewVersion.md` is the older file; `v3.docx` is larger than `v3.5.docx`. Order by
contents and hashes, never by name. (s2; X-9, ADR 0007)

### L-6 — Model-generated document series can shrink by accident
Each revision of the numbered master series was re-emitted whole by a Gem that ran out of context;
`01_Master_Vision` went 19,792 B → 2,852 B. "Newest is canonical" destroys content in such a family.
(s2; D-5, ADR 0003)

### L-7 — Your own transformation can invent a difference
Stripping `Changes:` blocks to diff two `.docx` editions produced six "missing" lines — the stripper
had eaten them. A direct substring search in both originals settled it. Check a difference against the
untransformed source before reporting it. (s3)

### L-8 — Any git write from the Cowork mount strands locks, and it blocks the owner
A commit from the mount could not unlink `.git/HEAD.lock`, `.git/objects/maintenance.lock` and four
`tmp_obj_*` files. A test `git symbolic-ref HEAD refs/heads/main` then failed with *File exists*:
every ref update was blocked, Windows included. With delete rights on the repo folder git cleaned up
after itself and later commits left nothing. (s3, measured; D-9)

### L-9 — Test an inference about another machine before asserting it
"Your Windows commits will now fail" was a plausible inference from a failure on the mount; one
idempotent `symbolic-ref` made it a measurement. (s3)

### L-10 — Normalise before judging two instruction texts different
`.agents/Architect.md` and the Architect Gem v1.2 text differ in bytes and line count (204 vs 118)
but are identical after line-ending and whitespace normalisation (7,693 characters, same normalised
hash): the Antigravity agent ran the Gem's text verbatim. (s3 addendum 2; ADR 0006)

### L-11 — Keyword filters match inside words
`vivid|lumina` matched "vividly" and "illuminated" in unrelated 2026 chats and nearly dated the
project as active until September. Print each hit's context before counting it. (s4)

### L-12 — Stale-looking files can be load-bearing; grep the code before archiving
The inventory recommended dropping the starter logos and `routeTree.gen.ts`. They are imported by
`Header.tsx:22`, `routes/index.tsx:60` and `router.tsx`. When two filing rules overlap, check the one
tied to an owner ruling first. (s4; ADR 0006)

### L-13 — A figure without a stated basis costs a stop
The plan gave the Builder Gem text as 4,493 characters with no method; the extract measured 4,578.
The extractor was validated by reproducing two on-disk Gem texts byte for byte, which showed the
plan's figure was the error. Record how every figure was measured. (s5)

### L-14 — A negative written from memory is still an unmeasured negative
Session 7 wrote two confident negatives into headers before measuring: that `muistiin'.txt` had "no byte in
0x80–0x9F" (its own byte count, already on screen, showed four 0x80 bytes — `€` in Windows-1252), and that
`ProductsAndPrices.docx` was "not in the corpus" (the manifest has it 12 times; it is archived as F35). Both
were caught only because the claim was checked right after writing it. Run the check first and write the
sentence from its output. (s7; the same failure s6 caught in `environment.md`)

### L-15 — A status header's own pointer needs the same check as a citation
Pass 3 wrote four status headers pointing at `docs/architecture/database-schema-blueprint.md`; the file kept
its name `Database_Schema_Blueprint.md` under the citation-count rule. Headers are written from the plan, and the
plan assumed a rename it did not make. Resolve every path in generated text against the tree before it is
committed. (s7; Q-s7-1)

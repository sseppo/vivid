> **Status:** current statement of the project rules as they stood at dormancy (2026-04-19) — a **merge** (D-6, ADR 0004, R-14), written 2026-09-19, Librarian s7. Base: `archive/webapp-visualisatium/config/project_rules.md` (§1–3, §99); §4 "Immutable Legal & Logic Axioms" from `archive/webapp-visualisatium/config/project_rules_someNewVersion.md`. §1–3 are identical in both originals (measured); neither original is a superset (X-12). Text below is the originals' text, unedited, line endings normalised. **Read with care:** these are Gemini-era rules. §1's hybrid Supabase Edge + Fastify/Node backend contradicts the live code (X-7, open, Architect); §2's `ProductsAndPrices.docx` is archived at `archive/webapp-visualisatium/files/Summaries/ProductsAndPrices.docx` (family F35, Gemini-era; current pricing inputs are in `sources/`, and the credit peg in force is D-13); §99 is a Gem-era footer that current agents replace with context reporting (mechanics §6). Changing any rule is an Architect/owner decision, recorded as a `D-n`.

# Project Rules: Visualisatium
**Status:** Active Overrides

## 1. Tech Stack Overrides
*   **Mobile Bridge:** Capacitor 7 + Rust (JNI) + ThorVG (C++).
*   **Backend:** Hybrid. Use Supabase Edge (Green Path). Use Dedicated Fastify/Node.js (Red Path) for Video/AI.
*   **Auth:** Clerk (synced to Supabase).

## 2. Economic Model (For Planning Gem)
*   **Currency:** Mixed (Virtual Credits + Euros).
*   **Tax:** Finnish VAT (25.5%). Use Stripe Tax/VIES.
*   **Pricing:** See `ProductsAndPrices.docx`.
*   **Credit Logic:** Users buy "Credit Packs" (Volume discounts apply).

## 3. Operational
*   **Payment Policy:** Work starts ONLY after payment status is 'PAID'.
*   **Workforce:** Distinguish between "Default Creator" (AI) and "CCA" (Human).

## 4. IMMUTABLE LEGAL & LOGIC AXIOMS
1.  **The "Silent Acceptance" Protocol:**
    *   **Rule:** The Terms of Service (ToS) dictate that the act of **Downloading a High-Res Asset** or **Sharing it Socially** constitutes Final Acceptance.
    *   **UX Implementation:** NO blocking modals. The UI must display a static disclaimer immediately below the primary action button: *"By downloading, you accept this order as complete per Terms of Service."*
    *   **System Action:** Backend silently transitions status to `completed`, releases funds to CCA, and logs the `implicit_acceptance` event.
2.  **The "Bankruptcy Prevention" Rule:** CCA Payouts are calculated on **Realized Net Revenue** (FIFO value of credits used), NOT List Price.
3.  **The 1-Hour Deposit:** All "Offer-Based" (Manual) requests require a non-refundable 1-hour deposit invoice to prevent CCA time-wasting.

## 99. GLOBAL SESSION HYGIENE (THE HEARTBEAT)
To prevent "Context Drift," all Gems must append this status footer to every response:

---
**Context Confidence:** [High / Medium / Low]
**Session Turn:** [X / 15] (Warning: Reset recommended at 15)
**Next Action:** [Continue] OR [STOP & ARCHIVE]
> **Status:** historical — family F16 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/config/project_rules.md`. 

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

## 99. GLOBAL SESSION HYGIENE (THE HEARTBEAT)
To prevent "Context Drift," all Gems must append this status footer to every response:

---
**Context Confidence:** [High / Medium / Low]
**Session Turn:** [X / 15] (Warning: Reset recommended at 15)
**Next Action:** [Continue] OR [STOP & ARCHIVE]
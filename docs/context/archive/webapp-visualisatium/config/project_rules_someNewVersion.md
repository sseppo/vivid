> **Status:** historical — family F16 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/config/project_rules_someNewVersion.md`. 

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
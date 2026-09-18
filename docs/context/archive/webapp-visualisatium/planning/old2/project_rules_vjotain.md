> **Status:** historical — family F16 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old2/project_rules_vjotain.md`. 

# Visualisatium Project Rules (The Constitution)
**Version:** 3.0 (Handoff)

## 1. IMMUTABLE LEGAL & LOGIC AXIOMS
1.  **The "Silent Acceptance" Protocol:**
    *   **Rule:** Downloading High-Res or Sharing Socially = **Final Acceptance**.
    *   **UX:** Static disclaimer text only. NO blocking modals.
2.  **The "Bankruptcy Prevention" Rule:**
    *   **Rule:** CCA Payouts are calculated on **Realized Net Revenue** (FIFO value of credits used), NOT List Price.
3.  **The Manual Offer Protocol:**
    *   **Deposit:** 1-Hour Non-Refundable Deposit required for Manual Offers.
    *   **Sunset:** Offers ignored for 30 Days are Archived.
    *   **Phoenix Protocol:** Users can "Revive" archived offers (creates new ID).

## 2. SUPPORT & OPS AXIOMS (From "Description and Purpose")
1.  **Order-Bound Communication:**
    *   All Support Chats must be linked to a specific `Order_ID` or `Ticket_ID`. No "Floating" chats.
    *   **Wishlist:** Feature requests are integrated into the Support Dashboard.
2.  **Tri-Party Protocol:**
    *   Chat supports `User + Admin + Partner` visibility if Physical Goods are involved.
3.  **Physical Goods Liability:**
    *   Platform acts as a "Middle Man". Liability for printing errors remains with the Partner.
4.  **Navigation Philosophy:**
    *   **Dual-Entry:** Users can browse by Product OR Category.
    *   **Visibility:** Products are always visible to minimize clicks.

## 3. TECH STACK CONSTANTS
*   **No API Backend:** Use TanStack Start Server Functions.
*   **No Redux:** Use TanStack Query (Server) + Zustand (Client).
*   **No Egress Fees:** All large assets go to Cloudflare R2.
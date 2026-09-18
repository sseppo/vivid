> **Status:** historical — family F13 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old/Business_Logic_Master_Spec_v2.md`. 

# Business Logic Master Spec: The Constitution (v2.0)

## 1. THE AUTOMATION ENGINE ("Daily Creation")
**Correction:** Users subscribe to a **Creation Service**, not a static feed.
**Logic:**
*   **Product Type:** "Automated Creation Task" (e.g., Daily Character Adventure).
*   **Trigger:** Daily Cron (00:00 UTC).
*   **Execution:**
    1.  Check `User_Credit_Balance >= Cost`.
    2.  **IF Pass:** Deduct Credit -> Send Prompt to AI -> Deliver Result -> Notify User.
    3.  **IF Fail:** Pause Subscription -> Send "Low Balance" Email.
*   **Constraint:** These products allow *zero* manual modifications.

## 2. PRICING & INVOICING RULES (From "Pricing System.docx")
**A. The "Work Starts on Payment" Rule**
*   **Strict Logic:** No work begins until payment is confirmed.
*   **Exception:** The Negotiation Phase (see below).

**B. The "1-Hour Minimum" (Offer Protocol)**
*   **Context:** For "Invoiced Products" (Collections/Specials).
*   **Rule:** To initiate a custom negotiation, the User MUST pay a **1-Hour Deposit Invoice** (e.g., €75).
*   **Purpose:** Covers the CCA's time to analyze requirements.
*   **Outcome:** Deducted from Final Invoice (Accept) or retained (Reject/Ghost).

**C. Mixed Payment Splitting (Accounting)**
*   **Scenario:** Total €100. User pays €50 via Stripe, €50 via Credits.
*   **System Action:** Generates TWO distinct invoice records:
    1.  **Invoice A (Fiat):** €50 + 25.5% VAT. (Taxable Event).
    2.  **Invoice B (Credits):** €50 Value (0% VAT - Taxed at Purchase).

## 3. DISPUTE & QUALITY (Pending Source Text)
*   **Status:** ⚠️ **WAITING FOR SOURCE TEXT.**
*   **Current Axiom:** The "Review Period" is 14 days. Funds are held in Escrow until this expires or User triggers "Implicit Acceptance" (Download/Share).
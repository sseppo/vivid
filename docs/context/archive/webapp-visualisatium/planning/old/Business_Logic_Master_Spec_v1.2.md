> **Status:** historical — family F13 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old/Business_Logic_Master_Spec_v1.2.md`. 

# Business Logic Master Spec: The Constitution of Visualisatium
**Version:** 1.2
**Date:** 2026-01-17
**Status:** BATTLE-TESTED SPECIFICATION
**Author:** The Planning Gem (CPO)

---

## 1. THE "IRREVERSIBLE ACTION" PROTOCOL (Legal & UX)
**Context:** To shorten the "Review Period" (cash-flow delay), we allow users to "Accept" early.
**Legal Requirement:** Users must explicitly waive their right to a refund/dispute to access high-value actions.

### The Trigger Events
1.  **Download High-Res:** User clicks "Download Original".
2.  **Social Share:** User clicks "Share to [Platform]" (publicly publishing the asset).
3.  **"Accept" Button:** User manually clicks "Mark as Complete".

### The Interaction Logic (Modal Spec)
**GIVEN** the order status is `delivered` (In Review)
**WHEN** the user attempts a **Trigger Event**
**THEN** the system halts the action and presents the **"Final Acceptance" Modal**:
> **Header:** Unlock Full Ownership?
> **Body:** "By downloading the high-resolution file or sharing this content, you confirm that the work meets your requirements. This action **waives your right to future disputes or refunds** for this order."
> **Action:** [Confirm & Unlock] (Primary) | [Cancel] (Secondary)

**State Transition:**
*   If **Confirm**:
    1.  Status -> `completed`.
    2.  Review Timer -> **0**.
    3.  Funds -> Released to CCA immediately.
    4.  Watermarks -> Removed.
*   If **Cancel**: Action aborted. Status remains `delivered`.

---

## 2. AUTOMATION LOGIC (The "Recurring" Engine)
**Source:** `Tuotteet-kuva.csv` ("Automate" column) & `Admin Dashboard`.
**Context:** Users can subscribe to "Daily Character Stories" (e.g., "Adventures of [Name]").

### Rule 2.1: The "Credit Tank" Check
**Scenario:** User subscribes to a "Daily Image" (1 Credit/day) but has only 5 Credits left.
1.  **Daily Trigger:** Edge Function Cron runs at 00:00 UTC.
2.  **Check:** `User_Credit_Balance >= Product_Cost`.
3.  **If Pass:**
    *   Deduct Credit (FIFO).
    *   Route Job to **Default Creator (AI)**.
    *   Notify User: "Your daily story is ready."
4.  **If Fail:**
    *   **Do NOT** process the job.
    *   **Status:** `paused_insufficient_funds`.
    *   **Notification:** "Daily Story paused. Top up credits to resume."

---

## 3. FINANCIAL LOGIC: THE "SUCCESS TAX" ENGINE
**Source:** `Admin Dashboard v3.5`.

**Objective:** Calculate the *True Net Profit* per transaction to prevent margin erosion.

**Formula:**
`Net_Platform_Profit` = `Total_Invoiced` - `VAT` - `Stripe_Fees` - `CCA_Payout` - `Compute_Cost`

**The "Mixed-Payment" Split:**
When a user pays €50 via Stripe and 10 Credits (Value €30):
1.  **Invoice A (Cash):** €50. VAT applied (25.5%). Stripe Fees applied.
2.  **Invoice B (Credits):** €30. VAT = 0 (Paid at credit purchase). Stripe Fees = 0.
3.  **CCA Payout:** Calculated on the sum (€80) minus the proportional costs.

---

## 4. CONSOLIDATED STATE MACHINE (Expanded)
Includes new "Validation" states derived from `ProductsSold.docx`.

| Status ID | Label | Owner | Trigger Event | System Action | Permission |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `draft` | **Drafting** | User | User selects Product. | Form rendered based on `required_data` JSON. | 🟢 User editing. |
| `offer_req` | **Offer Requested** | User | "Special/Collection" form submitted. | **1-Hour Deposit Invoice Generated.** | 🚫 Work cannot start. |
| `awaiting_pay` | **Awaiting Payment** | System | User accepts Offer. | Final Invoice Generated (Total - Deposit). | 🚫 Assets locked. |
| `in_queue` | **In Queue** | System | Payment Confirmed. | Routed to **AI Queue** or **Marketplace**. | 🔓 Claimable. |
| `delivered` | **Under Review** | User | CCA uploads assets. | 14-Day Timer Starts. Watermarked preview. | ⏳ Funds Locked. |
| `completed` | **Completed** | System | Timer expires OR **Waiver Accepted**. | **Payout Release Triggered.** | ✅ Funds Released. |

---

## 5. MACHINE-READABLE SUMMARY (JSON)
```json
{
  "logic_version": "1.2",
  "legal_hooks": {
    "implicit_acceptance_trigger": ["download_high_res", "social_share"],
    "required_modal_confirmation": true
  },
  "automation_rules": {
    "credit_check_frequency": "daily_cron",
    "insufficient_funds_action": "pause_and_notify"
  },
  "financial_engine": "success_tax_mixed_reconciliation",
  "affected_files": ["project_rules.md", "Pricing System.docx"]
}
```

## 6. THE ABANDONMENT & RESTORATION PROTOCOL ("Phoenix")

### A. The Sunset Clause (30 Days)
**Trigger:** Order status is `offer_sent` or `offer_req` for > 30 Days.
**System Action:**
1.  Status -> `archived_abandoned`.
2.  Deposit -> Released to CCA as "Consultation Fee" (Final).

### B. The Phoenix (Restoration) Flow
**User Action:** User views `archived_abandoned` offer and clicks **"Revive Request"**.
**System Action:**
1.  Status -> `offer_restored` (New Negotiation).
2.  Data -> Cloned from original order into new Order ID.
3.  Flag -> `is_restored: true`.
4.  **CCA View:** "⚠️ This is a revived offer. Check if pricing/schedule is still valid."


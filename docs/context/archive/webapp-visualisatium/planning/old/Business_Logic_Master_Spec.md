> **Status:** historical — family F13 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old/Business_Logic_Master_Spec.md`. 

# Business Logic Master Spec: The Constitution of Visualisatium
**Version:** 1.0
**Date:** 2026-01-17
**Status:** BATTLE-TESTED SPECIFICATION
**Author:** The Planning Gem (CPO)

---

## 1. EXECUTIVE SUMMARY & CRITICAL LOGIC PATCH
This document serves as the "Laws of Physics" for the Visualisatium platform. It supersedes individual disjointed documents by connecting Money, Time, and Permission into a single logical framework.

### 🚨 CRITICAL ALERT: The "Bankruptcy Bug"
**The Issue:** The `PricingTable` allows users to buy credits at a **40% discount** (1000 credits @ €3,000 = €3.00/credit). The List Price of a Manhour is €75 (or 15 Credits).
*   **Scenario:** A user buys the bulk pack (€3.00/credit) and orders 1 Manhour (15 Credits).
*   **Realized Revenue:** 15 * €3.00 = **€45.00**.
*   **Current Rule:** "CCA gets 75% of invoiced amount." If interpreted as *List Price* (€75), the CCA payout is **€56.25**.
*   **Result:** Revenue (€45.00) - Cost (€56.25) = **LOSS of €11.25 per hour.**

**The Fix (Constitution Article 1):**
The "Invoiced Amount" used for CCA Payout calculations must be the **Realized Value** (Net Revenue), not the Nominal List Price.
*   **Logic:** The system must track the *Purchase Price* of the specific credits used (FIFO - First In, First Out).
*   **Corrected Flow:**
    1. User burns 15 Credits (bought at €3.00).
    2. Taxable Revenue = €45.00.
    3. CCA Payout = 75% of €45.00 = **€33.75**.
    4. Platform Gross Margin = **€11.25** (25%).

---

## 2. THE CONSOLIDATED STATE MACHINE
Every order moves through this strict, deterministic lifecycle. No action can be taken outside these states.

### Phase 1: Negotiation & Commitment
| Status ID | Label | Owner | Trigger Event | System Action | Permission / Restriction |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `offer_req` | **Offer Requested** | User | User submits "Special/Collection" form. | **1-Hour Deposit Invoice Generated.** | 🚫 Work cannot start. CCA notified. |
| `offer_sent` | **Offer Sent** | CCA | CCA submits price & timeline. | Deposit applied as credit against total. | 🚫 User cannot edit request. |
| `awaiting_pay` | **Awaiting Payment** | System | User clicks "Accept Offer" OR selects Standard Product. | Final Invoice Generated. | 🚫 Assets locked. |
| `partially_pay`| **Partially Paid** | System | User pays Invoice A (Split Payment). | Work Timer starts *only* for paid segment. | ⚠️ Work limited to paid milestone. |
| `paid` | **Paid** | System | Stripe/Credit transaction successful. | **Funds Moved to Escrow (Hold).** | ✅ Order moves to Queue. |

### Phase 2: Production (The Factory)
| Status ID | Label | Owner | Trigger Event | System Action | Permission / Restriction |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `in_queue` | **In Queue** | System | Payment Confirmed. | Visible in "Marketplace" (Manual) or "AI Queue". | 🔓 Claimable by eligible CCA. |
| `in_progress` | **In Progress** | CCA | CCA clicks "Claim Job". | Job **Soft Locked** to CCA. | 🚫 Cannot be claimed by others. |
| `action_req` | **Action Required** | CCA | CCA flags "Missing Info". | Timer Paused. User notified. | ⚠️ SLA Clock Stops. |
| `prod_ready` | **Production Ready** | CCA | CCA uploads final assets. | Assets processed (Watermarked). | 🔒 Assets not yet downloadable. |

### Phase 3: Delivery & Quality (The Trust Zone)
| Status ID | Label | Owner | Trigger Event | System Action | Permission / Restriction |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `delivered` | **Under Review** | User | CCA clicks "Deliver". | **Review Timer Starts (14 Days).** | ⏳ **FUNDS LOCKED.** CCA cannot withdraw. |
| `disputed` | **Disputed** | Admin | User clicks "File Dispute" (within 14 days). | Review Timer Paused. Ticket created. | 🚨 Payout Blocked Indefinitely. |
| `redo_progress`| **Redo in Progress** | CCA | Admin resolves Dispute as "Redo". | Status reverts to `in_progress`. | ⚠️ Previous assets archived. |
| `refunded` | **Refunded** | System | Admin resolves Dispute as "Refund". | Stripe Refund triggered. | 💸 **Money returned to User.** CCA gets €0. |
| `completed` | **Completed** | System | Timer expires OR User clicks "Accept". | **Payout Release Triggered.** | ✅ **75% Funds moved to CCA Wallet.** |

---

## 3. FINANCIAL LOGIC & FLOWS

### A. The "Split Invoice" Protocol
Used when User pays partially with Credits and partially with Cash.
1.  **Input:** Total Cart Value €100. User wants to use 10 Credits (Value €50).
2.  **System Action:**
    *   **Invoice A (Virtual):** €50 equivalent. Paid via Credit Ledger. (VAT = 0% on invoice, as VAT was paid at credit purchase).
    *   **Invoice B (Transactional):** €50. Paid via Stripe. (VAT = 25.5% added to this portion).
3.  **Accounting Tagging:**
    *   `Invoice_A` tagged `source: credit_redemption` -> CCA Payout calc uses **FIFO Realized Value** of those credits.
    *   `Invoice_B` tagged `source: stripe` -> CCA Payout calc uses **Net amount** (minus Stripe Fees).

### B. The Payout Logic Flow (Mermaid)
```mermaid
sequenceDiagram
    participant User
    participant Platform_Escrow
    participant CCA_Wallet
    participant Admin_Tribunal

    User->>Platform_Escrow: 1. PAY (Credits + Cash)
    Note right of Platform_Escrow: VAT & Stripe Fees Deducted
    Platform_Escrow->>Platform_Escrow: LOCK FUNDS (Status: PAID)
    
    rect rgb(240, 248, 255)
    Note over User, CCA_Wallet: Production Phase
    end

    CCA_Wallet->>User: 2. DELIVER (Start 14-Day Timer)
    
    alt No Dispute (Happy Path)
        Platform_Escrow->>Platform_Escrow: Timer Expired
        Platform_Escrow->>CCA_Wallet: 3. RELEASE PAYOUT (75% of RNR)
    else Dispute Filed
        User->>Admin_Tribunal: File Dispute
        Admin_Tribunal->>Platform_Escrow: FREEZE FUNDS
        opt Redo
            Admin_Tribunal->>CCA_Wallet: Order Redo
        end
        opt Refund
            Platform_Escrow->>User: RETURN FUNDS
        end
    end
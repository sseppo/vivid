> **Status:** historical — family F6; superseded by `docs/context/sources/02-business-logic-constitution.md`. Kept for provenance; not current. Source: `Visualisatium/planning/handover-to-new-sessions/combined-v1.8/old/02_Business_Logic_Constitution_BusinessLogicEconomics-temp.md`. 



## 2. AUTOMATION & SUBSCRIPTION LOGIC (The "Creation Service" Protocol)
Users subscribe to a **Creation Service**, not a static feed. These products allow *zero* manual modifications.
1.  **Product Type:** "Automated Creation Task" (e.g., Daily Character Adventure).
2.  **Trigger:** Daily Cron Edge Function runs at 00:00 UTC.
3.  **The "Credit Tank" Check:**
    * Check: `User_Credit_Balance >= Product_Cost`.
    * **IF Pass:**
        * Deduct Credit (FIFO).
        * Route Job to **Default Creator (AI)**.
        * Deliver Result -> Notify User: "Your daily story is ready."
    * **IF Fail:**
        * **Do NOT** process the job.
        * **Status:** `paused_insufficient_funds`.
        * **Notification:** "Daily Story paused. Top up credits to resume." (Send "Low Balance" Email).
---

## 3. FINANCIAL LOGIC & FLOWS
> **Source:** `Business_Logic_Master_Spec_combined_v1.md` & `Smart_Ledger_Economics.md`

### A. The "Split Invoice" Protocol
Used when User pays partially with Credits and partially with Cash.
1.  **Input:** Total Cart Value €100. User wants to use €40 worth of credits, and 60 € with Transaction.
2.  **System Action:**
    *   **Invoice A (Virtual):** €40 equivalent. Paid via Credit Ledger. (VAT = 0% on invoice, as VAT was paid at credit purchase).
    *   **Invoice B (Transactional):** €60. Paid via Stripe. (VAT = 25.5% added to this portion).
3.  **Accounting Tagging:**
    *   `Invoice_A` tagged `source: credit_redemption` -> CCA Payout calc uses **FIFO Realized Value** of those credits.
    *   `Invoice_B` tagged `source: stripe` -> CCA Payout calc uses **Net amount** (minus Stripe Fees).
4.  ** Payout Logic:** CCA Payout calculated on the *sum* of (Realized Value of A) + (Net Amount of B).

### B. The Payout Logic Flow (Escrow)
1.  **PAY:** User pays (Credits + Cash). Funds locked in `escrow_pool`.
2.  **DELIVER:** CCA delivers. 14-Day Review Timer starts.
3.  **RELEASE:**
    * **Happy Path:** Timer Expired -> Release 75% of RNR to CCA.
    * **Dispute:** Funds Frozen. Admin Tribunal decides (Redo or Refund).

---

## 4. PRICING & INVOICING RULES
> **Source:** `Business_Logic_Master_Spec_combined_v1.md`

### A. The "Work Starts on Payment" Rule
* **Strict Logic:** No work for final product begins until payment is confirmed.
* **Exception:** The Negotiation Phase (Status: `offer_req`).

### B. The "1-Hour Minimum" (Offer Protocol)
* **Context:** For "Offer based, invoiced Products".
* **Rule:** To ensure initiation of a custom negotiation, the User can pay a **1-Hour Deposit Invoice** (e.g., €75).
* **Purpose:** Covers the CCA's time to analyze requirements and making of offer.
* **Outcome:** Deducted from Final Invoice (if Accepted) or retained as "Analysis Fee" (if Rejected/Ghosted).

### C. The "Success Tax" & Split Invoice Protocol
**Objective:** Calculate *True Net Profit* per transaction to prevent margin erosion.
**Formula:** `Net_Platform_Profit` = `Total_Invoiced` - `VAT` - `Stripe_Fees` - `CCA_Payout` - `Compute_Cost`

**The Mixed-Payment Scenario (Cash + Credits):**
When a user pays €50 via Stripe and 10 Credits (Value €30):
1.  **Invoice A (Cash):** €50. VAT applied (25.5%). Stripe Fees applied.
2.  **Invoice B (Credits):** €30. VAT = 0 (Paid at credit purchase). Stripe Fees = 0.
3.  **CCA Payout:** Calculated on the sum (€80) minus the proportional costs.

---

## 5. PRICING STRATEGY (Updated)
> **Source:** `Pricing_Strategy_v2.md` & `Creative_Safety_Net_Pricing.md`
> **User Instruction:** Video Price updated to €3.90. Re-Roll updated to €0.50.

### The "Preview Protocol" (Re-Rolls)
We stop selling "1 Image". We sell "The Result".
1.  **Commitment:** User pays 1 Credit (or equivalent).
2.  **Preview:** System generates 4 Low-Res (Turbo) previews.
3.  **Selection:**
    * *Like it?* Finalize -> Upscale to 4K -> Done.
    * *Hate it?* Click **Re-Roll**.
4.  **Re-Roll Cost (The "Computing Fee"):**
    * **Image:** €1.00 (0.2 Credits).
    * **Text:** Free (Max 3).
    * **Video:** **€0.50 (0.1 Credits)**. (Updated).
        * *Logic:* Since Base Video Price is ~€3.90, the Preview/Re-Roll is priced proportionally.

#### THE "RE-ROLL" TIERS
We cannot apply the same Re-Roll logic to Video as Image.

| Media Type | Cost to Us (Est) | Standard Price | Re-Roll Price | Re-Roll Margin |
| :--- | :--- | :--- | :--- | :--- |
| **Image** | €0.04 | €5.00 | **€1.00** | ✅ Safe (96%) |
| **Text** | €0.01 | €5.00 | **Free** (Max 3) | ✅ Safe (99%) |
| **Audio** | €0.05 | €10.00 | **€1.00** | ✅ Safe (95%) |
| **Video** | €0.50 - €1.50 | €25.00 | **€5.00** | ⚠️ High Risk |

**Video Rule:** Video Re-Rolls are NOT heavily discounted.
* *Why?* Generating a video consumes massive GPU.
* *Compromise:* "Preview Mode". Generate a low-res GIF (Cost €0.10). If user likes it, they pay full price to "Render 4K".


### Why this works?
* **User Psychology:** They see the initial €5 as the "Setup Fee". The €1 re-roll feels cheap ("I'm just tweaking").
* **Economics:** Turbo/Preview models are 10x cheaper than High-Res Upscaling. We don't lose money on previews.
### The "CCA Rescue" Button
* **Trigger:** If a User re-rolls 3 times (Spent €5 + €1 + €1 + €1) and is still unhappy.
* **System Action:** Pop-up appears.
    * *"Having trouble? Let a Pro handle it."*
    * *Offer:* "Convert your spent credits (€8 total) into a discount on a CCA Job."
* **Result:** Converts a frustrated user into a High-Value Service customer.

---
## 6. THE ABANDONMENT & RESTORATION PROTOCOL ("Phoenix")

### A. The Sunset Clause (30 Days)
**Trigger:** Order status `offer_sent` or `offer_req` > 30 Days.
**System Action:**
1.  Status -> `archived_abandoned`.
2.  Deposit -> Released to CCA as "Consultation Fee" (Final).

### B. The Phoenix (Restoration) Flow
**User Action:** User views `archived_abandoned` offer -> Clicks **"Revive Request"**.
**System Action:**
1.  Status -> `offer_restored` (New Negotiation).
2.  Data -> Cloned to new Order ID (`is_restored: true`).
3.  CCA Warning: "⚠️ Revived offer. Check pricing validity."

## 7. THE CONSOLIDATED STATE MACHINE
Includes Validation states, Production states, and Delivery states.

### Phase 1: Negotiation & Commitment
These states track the initial phase, especially for "Offer-based" products like Collections or Special products that require manual calculation.

| Status ID | Label | Owner | Trigger Event | System Action | Permission  / Restriction |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `draft` | **Drafting** | User | User selects Product. | Form rendered (`required_data`). | 🟢 User editing. |
| `offer_req` | **Offer Requested and paid for** | User | User has submitted the request and paid for 1st hour. | **1-Hour Deposit Invoice Generated from payment. Shown ad CCA list as ready to take** | 🚫 Actual Work cannot start, buf offer preaparation / generation can. |
| `offer_req_without_pay` | **Offer Requested Without 1-Hour Puchase** | User | User has submitted the request without payment for 1st hour. | **Shown to CCA list as ready to take-at-your-own-risk.** | 🚫 Actual Work cannot start, buf offer preaparation / generation can. |
| `claimable` | **In Queue** | System | 1st hour Payment Confirmed or Offer requested withtout Payment. | Routed to **Marketplace**. | 🔓 Claimable. |
| `claimed` | **In Progress for Offer** | CCA | CCA clicks "Claim". | Job **Soft Locked** to CCA. | 🚫 Locked to CCA. |
| `offer_sent` | **Offer Sent** | CCA | CCA submits offer including price/time/details. | Deposit applied as part payment of total. | 🚫 User can accept, reject of make counter offer editing the one made by CCA. |
| `counter_offer_received` | **Counter Offer Received** | USer | User has submitted counter offer. Waiting for CCA to accept, reject (relates back to original offer as offer_sent) or make new counter offer (relates to new offer and back to state as offer_sent) | Deposit still applied as part payment of total. | 🚫 User can accept, reject of make counter offer editing the one made by CCA. |
| `offer_rejected` | **Offer Rejected** | System | User Rejects Offer. | Both CCA and User Informed. | 🚫 User can restart the prosess by changing to Accpeted or make counter offer. |
| `awaiting_pay` | **Accepted, Invoice Generated by Offer. Awaiting Payment** | System | Offer or Counter Offer is accepted by receiving party (User or CCA). | Final Invoice Generated. Price as mentioned in Offer. | 🚫 Work is not to be started before payment has arrived. But this is for CCA to decide. |
| `parting_requested`| **User has requested to split payments to certain parts. Invoice generated for each part. ** | System | User has requested to split the payments |  System tries to do it automatically, if fails informs Admin. If successul, returns to state awaiting_pay | 🚫 Assets locked. |
| `partially_pay`| **Partially Paid** | System | User pays Invoice A. | Work Timer starts *only* for paid segment. | ⚠️ Limited scope. |
| `paid` | **Paid** | System | Transaction successful. | **Funds Moved to Escrow.** | ✅ Moves to Job Queue for the CCA in question (diffrent from common queue). |

### Phase 2: Production (The Factory)
Once payment is confirmed, the order moves into the "Job Queue" or AI processing. Statuses are same, but name of queue differs: “Job Queue” or “AI job Queue”

| Status ID | Label | Owner | Trigger Event | System Action | Permission |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `in_progress` | **In Progress** | CCA | CCA has started / is processing order. | Job **Locked** to CCA. | 🚫 Locked to CCA. |
| `action_req` | **Action Required** | CCA | CCA flags missing or fault info. | Timer Paused. SLA Stops. When user send missing or corrected info, returns to in_progress | ⚠️ User notified when information is required, CCA is notified when User has responded (CCA may then ask again more informaiton). |
| `prod_ready` | **Production Ready** | CCA | CCA uploads assets. | Assets processed (Watermarked). | 🔒 Assets not yet downloadable. |

### Phase 3: Delivery, Quality & Acceptance
This phase is critical for the "Quality of Service" and the Content Creator’s payout.

| Status ID | Label | Owner | Trigger Event | System Action | Permission |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `delivered` | **Under Review** | User | CCA has delivered the results. | **Review Timer Starts (14 Days).**. Watermarked preview. | ⏳ Funds Locked. |
| `disputed` | **Disputed** | Admin | User files Dispute (Day 1-14). The case is to be reviewed by Admin to decide if it is approved or disapproved | Review Timer Paused. Ticket created. | 🚨 Payout Blocked. |
| `redo_progress`| **Redo in Progress** | CCA | Admin orders "Redo". | Reverts to `in_progress`. | ⚠️ Old assets archived.|
| `refunded` | **Refunded** | System | Admin orders "Refund" partly or fully. | Stripe Refund. CCA gets either €0 or part of the payment, depending how much was refunded to customer. | 💸 Money returned partly or fully. |
| `completed` | **Completed** | System | Timer expires OR Dispute was disapproved. | **Payout Release Triggered.** | ✅ Funds Released. |


### Exceptions: Out of normal processes
In case the process is cancelled or moved to other CCA or something else happens that does not fit into normal process, this status list is used.

*  **None:** No exception status has been raised
*  **Needs More Information:** The process is halted until more information is received. Reason will be informed.
*  **Production Cancelled:** For some reason the production was cancelled. The reason will be informed to customer. Possible reasons: Guidelines / Legal issues
*  **Failure:** Some failure has occurred and customer will be informed. Possible reasons:  Technical / Other

### Partner Status: Prior or after normal processes
In case physical originals need to be digitalized before using them in products and the process for that is bought from the company.  Or finished digital products are sent for physical printing after they are ready, the processes are described here

*  **None:** No partner used
*  **Waiting for Delivery:** Products waiting to be delivered to / from Partner
*  **At Delivery:** Physical goods are on their way to partner / customer
*  **Delivered:** physical goods are delivered to partner / customer
*  **In Queue at partner:** Physical goods are at the wait queue of the partner
*  **Processing at Partner:** Physical goods are at the process by the partner

###Invoice issues: Related to invoicing process
In case invoicing is not straightforward

*  **None:** No special invoicing process going on.
*  **Invoice under generation:** Original invoice, or modifications under way.
*  **Invoice sent:** Invoice is sent to customer
*  **Invoice cancelled:** Invoice is split (new invoices will replace this one) or order cancelled before payment.



---

## 8. THE SMART LEDGER (SCHEMA)
> **Source:** `Smart_Ledger_Economics.md`

### The Ledger Table Definition
| Column | Type | Definition |
| :--- | :--- | :--- |
| `Transaction_ID` | UUID | Unique Key. |
| `Source_Wallet` | String | `user_wallet_A`, `escrow_pool`, `cca_wallet_B`. |
| `Dest_Wallet` | String | Target. |
| `Amount` | Numeric | The value. |
| `Currency` | String | EUR / CREDIT. |
| `Status` | Enum | `HELD`, `PENDING`, `CLEARED`, `PAID`, `VOID`. |
| `Trigger_Event` | String | `Order_Placed`, `Job_Delivered`, `Review_Period_End`. |

---

## 9. SPECS: THE SMART LEDGER (Economic Engine)
**Reference:** `Pricing System.docx`, `PricingTable.csv`, `Content Creator Agent.docx`

### 1. THE "DOUBLE-ENTRY" LOGIC
To replace the manual "Bank Transfer" chaos with an audit-proof system  "Double-Entry" logic.

#### The Ledger Table (Supabase)
| Transaction_ID | Source_Wallet | Dest_Wallet | Amount | Currency | Status | Trigger_Event |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| tx_101 | `user_wallet_A` | `escrow_pool` | 75.00 | EUR | HELD | Order_Placed |
| tx_102 | `escrow_pool` | `cca_wallet_B` | 67.50 | EUR | PENDING | Job_Delivered |
| tx_103 | `escrow_pool` | `platform_rev` | 7.50 | EUR | CLEARED | Job_Delivered |
| tx_104 | `cca_wallet_B` | `payout_stripe` | 67.50 | EUR | PAID | Review_Period_End |

### 2. PRICING LOGIC (The Algorithm)
**Source:** `PricingTable.csv`

#### A. The "Hybrid" Calculator
User can pay with Mixed Methods (Credits + Cash).
* **Logic:**
    1.  Calculate Total Cost (e.g., €100).
    2.  Check User Credit Balance (e.g., 10 Credits).
    3.  Convert Credits to Cash Value (1 Credit = €5.00 base, but scaled? *Correction: Table says 1 Credit = €5.00 in small packs, €3.00 in large packs. We must track "Acquisition Cost" or use a Blended Average.*). Using Current Face Value.
    * **Decision:** To simplify, we use **Current Face Value** (€5.00/credit) for redemption to encourage credit usage.
    4.  `Cash_Due = Total_Cost - (Credits * 5.00)`
    5.  Generate Stripe Invoice for `Cash_Due`.

#### B. The CCA Payout Formula
* **Input:** `Job_Value` (e.g., €75.00 Manhour).
* **Variable:** `Platform_Fee` (Standard 10% - configurable).
* **Variable:** `Review_Period` (14 Days).
* **Execution:**
    * On `Order_Completed` (Delivery): Money moves to `CCA_Pending`.
    * On `Review_Period_expired` (No Dispute): Money moves to `CCA_Available`.

### 3. THE "OFFER" STATE MACHINE
**Source:** `Statuses.docx` & `Content Creator Agent.docx`

* **State 1: Offer_Requested** (User submits brief).
* **State 2: Offer_Drafting** (CCA calculates hours).
    * *System Assist:* If `Product` = "Standard Video", System suggests "0.5 Manhours" automatically.
* **State 3: Offer_Sent** (Price locked).
* **State 4: Negotiation** (User counters).
    * *Limit:* Max 3 rounds of counter-offers to prevent spam.
* **State 5: Agreed -> Awaiting_Payment**.

---

## 10. THE "BOOK" PRICING MODEL (By Arc, Not Chapter)
Standardizing the text product.

* **Product:** "The Novella"
* **Measure:** **Narrative Beats** (Key Plot Points).
* **Input:** User provides 5 Beats (e.g., "Meet Hero", "Find Map", "Kill Dragon").
* **AI Output:** System expands each Beat into ~1,000 words.
* **Price:** **€25 Flat Fee** (up to 20k words).
    * *Cost Check:* 20k words = ~30k tokens. Cost ~€0.10 on Claude Haiku/Sonnet.
    * *Profit:* €24.90.
    * *Why so cheap?* Because text is cheap. The value is in the *structure*.

---

## 11. THE "API ARBITRAGE" SYSTEM
**Logic:** The system dynamically selects the cheapest provider that meets the quality threshold.
* **Task:** "Generate Anime Girl".
    * *Option A (Midjourney):* $0.08 (Best Quality).
    * *Option B (Flux.1 Dev):* $0.03 (Good Quality).
* **Router Logic:**
    * If User = "Pro Member" -> Use Midjourney.
    * If User = "Free/Standard" -> Use Flux.1.
> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/project_description.md`. 

# Project Description: Visualisatium

## 1. System Overview
**Visualisatium** is an eCommerce platform for AI-assisted image and video generation.
* **Primary Goal:** Automated generation via AI prompts (using database-driven lists and user attachments) or manual generation by work of human **Content Creator Agents (CCA)**.
* **Secondary Goal:** A marketplace for **Content Creator Agents (CCA)** to perform manual work (Manhours).
* **Language:** Multilingual (Origin: Finland).
* **Platform:** Web (Backend: Supabase/Node) + Mobile (Native elements).

## 2. User Roles

### A. The User (Customer)
* Browses by **Result** (Image/Video) or **Category**.
* Provides "Free Text" and "Attachments" to guide generation.
* Can request "Offers" for complex products.

### B. Content Creator Agent (CCA)
* **Role:** A user with special status who claims jobs from the "Job Queue" requiring manual work.
* **Requirements:** Must provide ID and Tax ID (TIN).
* **Responsibilities:**
    * Calculate prices for "Offer-based" requests.
    * Execute the work (Image/Video generation + Post-processing).
    * Handle Invoicing logic (via dashboard).
    * Answer customer questions during the process and the **Review Period**.
* **Compensation:**
    * Earns a percentage of the taxless invoiced amount (Currently **75%**).
    * Payout occurs **only** after the Review Period ends with no approved disputes.
* **Default CCA:** The system has a "Default CCA" for purely automated AI workflows.

## 3. Order Status & Workflow (The State Machine)

### Phase 1: Negotiation & Payment
1.  **Offer Requested:** User sends details. CCA calculates price.
2.  **Offer Sent:** Admin/CCA sends price. User can Accept/Deny/Counter.
3.  **Awaiting Payment:** Invoice generated. **Work has NOT started.**
4.  **Partially Paid:** Used for split invoices.
5.  **Paid:** Funds received. Moves to Queue.

### Phase 2: Production (Job Queue)
6.  **In Queue:** Waiting for CCA pickup or AI processing.
7.  **In Progress:** CCA is working or AI is generating.
    * *Analogy:* "The suit is on the tailor's workbench."
8.  **Action Required:** Process stuck (needs user info).
9.  **Redo in Progress:** Dispute approved; work restarting.
10. **Production Ready:** Work done, moving to delivery.

### Phase 3: Delivery & Quality Assurance
11. **Delivered / Under Review:** Product visible to user. **Review Period** starts.
12. **Disputed:** Customer filed complaint. Admin reviewing.
13. **Completed:** Review period ended (or dispute disapproved). **CCA gets paid.**
14. **Refunded:** Dispute approved; money returned.

### Special Statuses
* **Partner Status:** `In Queue at partner`, `Processing at Partner`, `At Delivery` (for Physical goods).
* **Exceptions:** `Production Cancelled`, `Failure` (Technical).

## 4. Governance & Quality of Service

### The Review Period
* **Definition:** A set number of days (Default: **14 Days**) after delivery where the customer can check the quality.
* **Analogy:** "Taking the custom suit home for a week to see if it fits."
* **Dispute Logic:**
    * If **Dispute Filed:** Company reps review it.
    * **Approved:** Work is Redone OR Refunded.
    * **Disapproved:** Case closed. No further appeal within the system.
* **Closing:** Once the Review Period ends without active dispute, the transaction is **Final**.

## 5. Architectural Notes
* **Database:** Contains "Premade Lists" (Styles, Artists, Eras) to minimize user typing and optimize prompts.
* **Logic:** Users select options one-by-one to ensure quality (vs. batch processing).
* **Navigation:** Flexible entry points (Select Result first OR Category first).
* **Support:** Chat based, tied to specific subjects/orders.
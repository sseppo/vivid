> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Smart_Ledger_Economics.md`. 

# STRATEGIC BLUEPRINT: LOGIC CONVERGENCE (v2.0)
**Context:** Synthesis of `Products.xlsx`, `Updates.docx`, and `Lists-In-database.docx`.

## 1. THE "SMART LIST" TRANSFORMATION
**Source:** `Lists-In-database.docx`
**Analysis:** The document lists "Styles" (Watercolor, Noir) and "Recipes" (The Hero Reveal). In the Agentic Era, these cannot be static text.
**Architecture Upgrade:**
* **Vector Embeddings:** We will not just match the string "Noir"; we will inject a hidden "Prompt Payload" associated with "Noir" (e.g., `(chiaroscuro lighting:1.4), (black and white:1.2)`).
* **Dependency:** These lists become the **Configuration Nodes** for the *Smart Collections* engine.

## 2. THE PRODUCT HIERARCHY (Validated)
**Source:** `Products.xlsx` (All Sheets)
**The Structure:**
1.  **Category** (e.g., "Memories")
2.  **Product** (e.g., "Enhancement of Photo")
3.  **Input Requirement** (e.g., "One Image") -> **Validator Logic**
4.  **Data Requirement** (e.g., "Select from List") -> **UI Component (Split Choice)**

## 3. THE "PHOENIX PROTOCOL" (Abandoned Offers)
**Source:** `Updates.docx`
**Logic:**
* **Trigger:** User abandons an "Offer Requested" state for > 30 days.
* **Action:** Status moves to `Archived`.
* **Revival:** User clicks "Restore".
* **Safety:** System flags `is_restored = true`. CCA must re-validate pricing (inflation/availability) before re-enabling the payment link.

## 4. DOMAIN GLOSSARY (Terminology Fix)
**Source:** `Updates.docx`
* **User sees:** "Collections"
* **DB stores:** "Projects"
* **User sees:** "Character"
* **DB stores:** "Asset_Entity" (with DNA JSON)


# SPECS: CHARACTER PERSISTENCE ENGINE ("The Vault")
**Reference:** `Updates.docx` (Character Vault), `SoldProduct.docx` (Reuse), `Products.xlsx` (Special.csv)

## 1. OBJECTIVE
To solve the "Consistency Problem" identified in `Updates.docx`. When a user buys a "Mascot" today, they must be able to use the *exact same* mascot in a video next week without re-prompting or getting random variations.

## 2. DATA STRUCTURE: "THE DNA CONTAINER"
Instead of just saving an image, we save the **Recipe**.

### The Schema (JSONB)
```json
{
  "entity_id": "char_998877",
  "user_id": "user_123",
  "name": "Captain Whiskers",
  "thumbnail_url": "s3://...",
  "dna_payload": {
    "base_model": "SDXL_Turbo_v1",
    "seed": 4829104,
    "lora_weights": ["lora_cat_mascot_v2:0.8"],
    "trigger_words": ["wearing a space helmet", "orange fur"],
    "negative_prompt": "dog, blurry, distorted paws",
    "face_id_embedding": "[vector_array...]"
  },
  "usage_stats": {
    "created_at": "2026-01-26",
    "jobs_used_in": 12
  },
  "status": "active" // or "dormant" if subscription lapses
}
```

## 3. USER JOURNEY: "REUSE"
### Phase 1: Creation (The "Special" Product)
* **GIVEN** the user is on the "Create Character" product page
* **WHEN** they finalize the order and mark "Save to Vault"
* **THEN** the System extracts the `seed` and `prompts` used by the AI and saves them to the `User_Vault` table.

### Phase 2: Injection (The "Adventure" Product)
* **GIVEN** the user is buying "Adventures of Character" (from `Products.xlsx`)
* **WHEN** the UI asks for "Character Reference"
* **THEN** the "Split Choice" Input displays their **Vault Items** (Visual Grid).
* **AND** selecting "Captain Whiskers" injects the `dna_payload` into the CCA's `Active_Workbench`.

## 4. LOGIC: THE "CONSISTENCY GUARD"
* **Automated Check:** If the user selects a Vault Character, the Generator Node **LOCKS** the Seed and LoRA fields.
* **CCA Override:** The CCA can tweak the `strength` but cannot remove the `trigger_words` without a warning popup ("Warning: Deviating from Character DNA").

# SPECS: THE SMART LEDGER (Economic Engine)
**Reference:** `Pricing System.docx`, `PricingTable.csv`, `Content Creator Agent.docx`

## 1. THE "DOUBLE-ENTRY" LOGIC
To replace the manual "Bank Transfer" chaos with an audit-proof system (as requested in `Updates.docx`).

### The Ledger Table (Supabase)
| Transaction_ID | Source_Wallet | Dest_Wallet | Amount | Currency | Status | Trigger_Event |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| tx_101 | `user_wallet_A` | `escrow_pool` | 75.00 | EUR | HELD | Order_Placed |
| tx_102 | `escrow_pool` | `cca_wallet_B` | 67.50 | EUR | PENDING | Job_Delivered |
| tx_103 | `escrow_pool` | `platform_rev` | 7.50 | EUR | CLEARED | Job_Delivered |
| tx_104 | `cca_wallet_B` | `payout_stripe` | 67.50 | EUR | PAID | Review_Period_End |

## 2. PRICING LOGIC (The Algorithm)
**Source:** `PricingTable.csv`

### A. The "Hybrid" Calculator
User can pay with Mixed Methods (Credits + Cash).
* **Logic:**
    1.  Calculate Total Cost (e.g., €100).
    2.  Check User Credit Balance (e.g., 10 Credits).
    3.  Convert Credits to Cash Value (1 Credit = €5.00 base, but scaled? *Correction: Table says 1 Credit = €5.00 in small packs, €3.00 in large packs. We must track "Acquisition Cost" or use a Blended Average.*)
    * **Decision:** To simplify, we use **Current Face Value** (€5.00/credit) for redemption to encourage credit usage.
    4.  `Cash_Due = Total_Cost - (Credits * 5.00)`
    5.  Generate Stripe Invoice for `Cash_Due`.

### B. The CCA Payout Formula
* **Input:** `Job_Value` (e.g., €75.00 Manhour).
* **Variable:** `Platform_Fee` (Standard 10% - configurable).
* **Variable:** `Review_Period` (14 Days).
* **Execution:**
    * On `Order_Completed` (Delivery): Money moves to `CCA_Pending`.
    * On `Review_Period_expired` (No Dispute): Money moves to `CCA_Available`.

## 3. THE "OFFER" STATE MACHINE
**Source:** `Statuses.docx` & `Content Creator Agent.docx`

* **State 1: Offer_Requested** (User submits brief).
* **State 2: Offer_Drafting** (CCA calculates hours).
    * *System Assist:* If `Product` = "Standard Video", System suggests "0.5 Manhours" automatically.
* **State 3: Offer_Sent** (Price locked).
* **State 4: Negotiation** (User counters).
    * *Limit:* Max 3 rounds of counter-offers to prevent spam.
* **State 5: Agreed -> Awaiting_Payment**.
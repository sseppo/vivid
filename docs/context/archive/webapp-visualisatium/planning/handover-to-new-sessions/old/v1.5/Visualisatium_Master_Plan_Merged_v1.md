> **Status:** historical — family F34 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/handover-to-new-sessions/old/v1.5/Visualisatium_Master_Plan_Merged_v1.md`. 

# VISUALISATIUM: THE MASTER PLAN (MERGED v1)
**Session Focus:** Product Expansion, Partner Logic, and Economic Refinement.

---

## 1. LOGIC CONVERGENCE & DATA STRUCTURES
**Context:** Synthesis of `Products.xlsx`, `Updates.docx`, and `Lists-In-database.docx`.

### A. The "Smart List" Transformation
**Source:** `Lists-In-database.docx`
**Architecture Upgrade:**
* **Vector Embeddings:** We will not just match the string "Noir"; we will inject a hidden "Prompt Payload" associated with "Noir" (e.g., `(chiaroscuro lighting:1.4), (black and white:1.2)`).
* **Dependency:** These lists become the **Configuration Nodes** for the *Smart Collections* engine.

### B. Domain Glossary (Terminology Fix)
* **User sees:** "Collections" / "Odysseys"
* **DB stores:** "Projects"
* **User sees:** "Character"
* **DB stores:** "Asset_Entity" (with DNA JSON)

### C. The "Phoenix Protocol" (Abandoned Offers)
* **Trigger:** User abandons an "Offer Requested" state for > 30 days.
* **Action:** Status moves to `Archived`.
* **Revival:** User clicks "Restore".
* **Safety:** System flags `is_restored = true`. CCA must re-validate pricing (inflation/availability) before re-enabling the payment link.

---

## 2. THE CHARACTER PERSISTENCE ENGINE ("THE VAULT")
**Objective:** To solve the "Consistency Problem". When a user buys a "Mascot" today, they must be able to use the *exact same* mascot in a video next week.

### The Schema (JSONB)
```json
{
  "entity_id": "char_998877",
  "user_id": "user_123",
  "name": "Captain Whiskers",
  "dna_payload": {
    "base_model": "SDXL_Turbo_v1",
    "seed": 4829104,
    "lora_weights": ["lora_cat_mascot_v2:0.8"],
    "trigger_words": ["wearing a space helmet", "orange fur"],
    "negative_prompt": "dog, blurry, distorted paws"
  },
  "status": "active"
}
```

### User Journey: "Reuse"
* **Phase 1: Creation (The "Special" Product):** When user marks "Save to Vault", System extracts the `seed` and `prompts` used by the AI.
* **Phase 2: Injection (The "Adventure" Product):** When buying "Adventures of Character", the "Split Choice" Input displays their Vault Items. Selecting "Captain Whiskers" **LOCKS** the Seed and LoRA fields for the generator.

---

## 3. THE SMART LEDGER (ECONOMIC ENGINE)
**Objective:** Replace manual bank transfers with audit-proof "Double-Entry" logic.

### The Ledger Table
| Transaction_ID | Source | Destination | Amount | Trigger |
| :--- | :--- | :--- | :--- | :--- |
| tx_101 | `user_wallet` | `escrow_pool` | 75.00 | Order_Placed |
| tx_102 | `escrow_pool` | `cca_wallet` | 67.50 | Job_Delivered |
| tx_103 | `escrow_pool` | `platform_rev` | 7.50 | Job_Delivered |

### Pricing Logic: The "Hybrid" Calculator
1.  Calculate Total Cost (e.g., €100).
2.  Check User Credit Balance.
3.  Convert Credits to Cash Value (Using Current Face Value €5.00/credit).
4.  `Cash_Due = Total_Cost - (Credits * 5.00)`

---

## 4. PARTNER ECOSYSTEM: "THE UNLOCK & ROYALTY PROTOCOL"
**Context:** We are the Middle-man. We do not handle physical goods.

### A. The "Unlock Protocol" (Selling Information)
* **Product:** "Partner Information" (Price: 2 Credits / €10).
* **Value:** System analyzes User Location + Media Type -> Returns "Best Match" Report with contact details and a "Referral Code".
* **Partner Incentive:** Partners can pay to be "Verified", making their info **FREE** to users (removing the friction).

### B. The "Origin Royalty" (The Growth Hack)
**Concept:** Turn Partners into Affiliates.
* **The Logic:** `If (File_Origin == Partner_X) AND (User_Buys_Edit_Service) THEN (Pay Partner_X 5% Commission)`.
* **Pre-Processing:** Partner embeds their `Partner_ID` in metadata when uploading digitized files to the user's Vault.
* **Post-Processing:** Printers attach a "Loop-Back QR Code" (`visualisatium.com/p/reorder?partner=X`) to physical goods. Scanning it links the re-order to them.

### C. The "Digital Handshake" (Logistics Tracking)
* **User Action:** Clicks "I have sent the package".
* **Partner Action:** Clicks "Package Received" on their dashboard.
* **Liability Shield:** The UI clearly delineates where Visualisatium ends and Partner begins. "Dealings regarding physical goods are solely between you and [Partner Name]."

---

## 5. THE ODYSSEY ENGINE (NEW PRODUCT LINES)
**Concept:** Multi-step product lines ("Journeys") where the User builds towards a Grand Finale.

### The Catalog (Approved)
1.  **"The Visual Biography" (Flagship):**
    * Steps: Interview (Text) -> Restoration (Image) -> Script (Text) -> Voice Model (Audio) -> Production (Video).
2.  **"The Dream Home" Architect:**
    * Steps: Room Scan -> Style Match -> 3D Visualization -> Commerce Link.
3.  **"The Music Video Director":**
    * Steps: Audio Analysis (BPM) -> Treatment (Theme) -> Rush Generation (Clips) -> Assembly.
4.  **"The Child's Imagination" Toy:**
    * Steps: Upload Doodle -> 3D Character Render -> Animation (Dance).
5.  **"The Corporate Origin" Doc:**
    * B2B History video.
6.  **"The WhatsApp Time Capsule":**
    * Steps: Upload `_chat.txt` -> Analysis (Dates/Quotes) -> Digital Scrapbook PDF.
7.  **"The Meditation Guide" (Personalized):**
    * Steps: State Description -> Visual Loop -> Audio Script -> Voice Gen.

### Mechanics
* **Structure:** Odyssey contains `n` Steps. Step 2 locked until Step 1 complete.
* **Narrative Glue:** `Odyssey_Context.json` passes data (e.g., "Hero has red scarf") from Step 1 to Step 5.
* **Commitment Discount:** Pay-As-You-Go (€15/chapter) vs Odyssey Pass (€100 upfront).

---

## 6. PRICING STRATEGY V2: "THE CREATIVE SAFETY NET"
**Objective:** Eliminate "Re-Roll Anxiety".

### The "Preview Protocol"
1.  **Input:** User prompts.
2.  **Payment:** User commits **1 Credit (€5)**.
3.  **Generation:** System generates **4 Low-Res Previews**.
4.  **Selection:**
    * **Success:** User selects one -> System upscales to 4K.
    * **Fail (Re-Roll):** User pays **0.2 Credits (€1)** to generate 4 new previews.
    * *Note:* Video Re-Rolls are NOT discounted due to GPU costs.

### The "CCA Rescue"
* **Trigger:** If User re-rolls 3 times and is still unhappy.
* **Action:** Offer to convert spent credits into a discount on a Manual CCA Job.

### The "Book" Pricing (Text)
* **Measure:** Narrative Beats (Key Plot Points), not Chapters.
* **Price:** **€25 Flat Fee** for Structure + Text Generation (up to 20k words). High margin product.

---

## 7. PRODUCT EXPANSION: THE IMMERSION SUITE
**Constraint:** No generic AI wrappers.

* **Audio: "The Voice Keeper":** Trains a Voice Clone from old VHS/Audio. Narrates new content.
* **Text: "The Family Fable":** Generates a physical Children's Book from Family Photos + Narrative Wizard answers.
* **Interactive: "The Digital Seance":** RAG-based Video Call with the `Digital_Person` using `Lore_Bible` and `Voice_Model`.
* **Time: "The Time Capsule":** Delayed delivery of messages to 2030.

---

## 8. GAMIFICATION V2
**Focus:** Recognizing the "Family Archivist".

* **New Role: "The Curator":** The family admin who manages the history.
* **Feature: "The Contributor Link":** Allows family members to upload photos/credits to the Curator's project without an account.
* **Metric: "Preservation Score":** A gauge (0-100%) tracking legacy security (Backups, Voice Models, Time Capsules).

---

## 9. IP PARTNER PROGRAM
**Strategy:** "Legally Distinct" vs "Official".

* **Tier 1 (Internal):** "Legally Distinct" Themes (e.g., "Galaxy Wars", "Wizard Academy"). Managed by us.
* **Tier 2 (External):** "Official Partner Portal". Indie Authors/Game Studios upload their **Official LoRA** and **Lore Bible**.
    * **Revenue:** User pays 20% premium -> Goes to Creator.

---

## 10. CCA SMART COPILOT
**Role:** Drafting Assistant for Content Creator Agents.

* **Trigger:** CCA opens a generic "Offer Request".
* **Action:** Engine scans input (File count, Keywords).
* **Output:** Suggests a "Draft Offer" (e.g., "1.5 Manhours - High Complexity").
* **DB Integration:** Checks `Lists` database. If user requested "Complex Style", Copilot increases the estimate.
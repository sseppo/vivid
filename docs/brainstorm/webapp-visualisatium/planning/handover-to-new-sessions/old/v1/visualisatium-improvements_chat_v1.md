# VISUALISATIUM: IMPROVEMENTS & LOGIC LOG (Session v1)
**Status:** Accepted Planning Notes
**Scope:** Detailed record of all approved ideas from the Jan 2026 Strategy Session.

---

## 1. THE "CHAIN OF CUSTODY" (Physical Logistics)
**Context:** Tracking physical items (photos, VHS) sent by users to partners.
**Status:** Revised to "Integrated vs Directory" model.

### The Protocol
* **1. Initiation:** `Awaiting_Shipment`. System generates a unique **QR Shipping Label** for the user to attach to their package (Integrated Partners only).
* **2. Transit:** `In_Transit_Inbound`. Integration with carrier API (Posti/DHL) updates status automatically.
* **3. Intake:** `Physical_Received`. Partner scans the QR code upon arrival. Triggers "Safe Arrival" notification to User.
* **4. Digitizing:** `Processing_Digital`. The standard "In Progress" work happens here.
* **5. Return:** `In_Transit_Outbound`. Partner ships physical items back.
* **6. Closure:** `Items_Returned`. User confirms receipt of physical goods. Only *then* is the order fully closed.

### User Stories
* **As a User**, I want to download a shipping label with a unique QR code so that my package is linked to my digital order.
* **As a User**, I want to receive a notification when the Partner physically scans my package so I know it didn't get lost in the mail.
* **As a Partner**, I want a "Logistics View" to scan incoming QR codes and update statuses to "Received" instantly.

---

## 2. THE "ASSET DNA" (Cross-Media Consistency)
**Context:** Ensuring a character created in Order A looks the same in Order B.

### The Logic
1.  When an Order of type `Character` or `3D Model` is completed, the system automatically extracts the **Seed**, **Negative Prompts**, **LoRA weights**, and **OBJ/GLB files**.
2.  This bundle is saved as an `Asset_DNA` object.
3.  **Future Orders:** When a user orders "Video of [Character Name]", the CCA receives not just the name, but the full `Asset_DNA` bundle. This ensures the video looks exactly like the image.

### Data Structure (JSON Model)
~~~json
{
  "asset_dna_id": "dna_12345",
  "character_name": "Agent Smith",
  "visual_genome": {
    "base_model": "SDXL_Turbo",
    "seed": 8934759834,
    "positive_prompt": "man in black suit, sunglasses, matrix background",
    "negative_prompt": "cartoon, 3d render, bright colors",
    "lora_weights": ["matrix_v2:0.7", "suit_detail:0.4"]
  },
  "reference_files": [
    "s3://vault/user_x/ref_front.png",
    "s3://vault/user_x/ref_side.png"
  ]
}
~~~

---

## 3. THE "DYNAMIC BIDDING" ENGINE (Marketplace Liquidity)
**Context:** Ensuring "boring" or "hard" jobs get picked up by CCAs without raising prices for the user.

### Mechanism
* **Hour 0-24:** Standard Payout (e.g., €15).
* **Hour 24-48:** Payout + 5% (Subsidized by Platform Margin).
* **Hour 48+:** Payout + 10% + "Hero Badge" progress.
* **Why:** Ensures 100% fulfillment rate without changing the price the User pays. It eats slightly into the platform's margin to protect User Retention.

---

## 4. THE "DRAFT SAFEGUARD" (Anti-Dispute Layer)
**Context:** Preventing users from stealing high-quality drafts.

### Logic
* **Intercept:** Any image/video uploaded by a CCA to the chat/preview window *before* the status is `Completed` is automatically intercepted by an Edge Function.
* **Overlay:** The function overlays a diagonal "PREVIEW - [User ID]" watermark.
* **Unlock:** The Clean Version is only released to the "Files" tab once the status moves to `Review_Period` (where the clock starts ticking) or `Completed`.

---

## 5. SMART COLLECTIONS & ORCHESTRATION
**Context:** Transforming "Bundles" into "Dependency-Driven Workflows".

### The Concept: "The Director's Pipeline"
**Problem:** Currently, buying a "Collection" (e.g., Wedding Package) just dumps 5 empty slots into the user's dashboard. The user has to configure each one manually.
**Solution:** **Template-Driven Orchestration.**
When a user buys a Collection, the system loads a **Dependency Graph**.
* **Node A (Source):** "Upload the Couple's Photo."
* **Node B (Style):** "Select a Style" (Linked to `Lists-In-database` -> e.g., 'Watercolor').
* **Node C (Output 1):** Generates Image using Source A + Style B.
* **Node D (Output 2):** Generates Video using Output C + "Cinematic Recipe" (Linked to `Lists-In-database` -> 'The Intimate Moment').

### Business Value
* **Completion Rate:** This forces the user to complete the *whole* collection because the later items become "easier" (pre-filled) as they progress.
* **Upsell:** It makes the "Collection" feel like a premium *service*, not just a bulk discount.

### User Journey: The "Auto-Pilot" Wizard
**Scenario:** User buys "The Life Story Collection".
1.  **Step 1 (The Anchor):** User uploads *one* main photo of "Grandpa".
2.  **Step 2 (The Vibe):** User selects a "Style" from the `Lists` database (e.g., "Sepia / Daguerreotype").
3.  **Step 3 (The Automation):**
    * **Chapter 1 (Image):** System generates Grandpa in 1950 (applies Sepia).
    * **Chapter 2 (Video):** System takes Chapter 1 Image + applies "Slow Pan Right" (from `Lists` Camera Angles).
    * **Chapter 3 (Text):** System generates a "War Story" (using the Narrative Layer).
4.  **Result:** User provided **1 input**, System generated **3 consistent outputs**.

### New Feature: "Recipe Marketplace"
**Context:** Your `Lists-In-database.docx` contains "Pro Combo Recipes" (e.g., *The Hero Reveal*).
**Strategy:** We treat these "Recipes" as **Micro-Products** or Unlockables.

---

## 6. GAMIFICATION: "THE DIRECTOR'S CHAIR"
**Context:** User Retention System.
**Status:** REVISED (Progressive Disclosure / Guidance, NOT Gating).

### The Core Philosophy: "Mastery, Not Exclusivity"
**Objective:** Move users from "One-off Buyers" to "recurring Studio Heads."
**The Currency:** **"Production XP"** (Experience Points).
**Constraint:** All *Physical Products* (Prints, Digitization) are available to ALL users immediately. We do not block revenue.

### The Rank Ladder
* **Rank 1: The Intern (0 - 500 XP)**
    * **UI:** Simplified "Easy Mode" (AI handles settings).
    * **Access:** Full Product Catalog.
* **Rank 2: The Indie Director (501 - 2,000 XP)**
    * **Unlock:** **"Pro Mode" UI Toggle.** (Gives control over Negative Prompts, Seed Control, Model Selection).
    * **Unlock:** **"The Recipe Book" (Tier 1).** One-click access to basic Camera Styles (e.g., "Vintage Super 8").
* **Rank 3: The Studio Head (2,001 - 10,000 XP)**
    * **Unlock:** **"The Recipe Book" (Tier 2 - Pro).** Access to complex, multi-shot recipes (e.g., "The Hero Reveal", "The Hitchcock Zoom").
    * **Perk:** **Priority Queue.** Bypass Surge Pricing.
* **Rank 4: The Mogul (10,000+ XP)**
    * **Unlock:** **"Beta Channel".** Access to experimental models (Voice V2).
    * **Perk:** **"Director's Cut" Badge.**

### The "Preservation Gauge" (Psychological Hook)
**Visual:** "Family Archive Status: 12% Secure."
**Logic:**
* System estimates family media based on User Age (e.g., "You likely have 10 VHS tapes").
* **Action:** "Digitize 5 tapes to reach 'Safe' status."
* **Why:** Leverages the "Sticky-Shed" fear found in research files.

---

## 7. THE IMMERSION LAYER (TEXT & AUDIO)
**Context:** Selling "Story" and "Voice" as the "Soul" of visual assets.

### A. The Interactive Narrative Wizard (Option 2)
**Logic:** Instead of a blank text box, the user plays a "Game" to define the story.
**Flow:**
1.  **User Selects:** "Create Backstory for this Image."
2.  **System Asks (Interaction 1):** "What is the genre?" (Sci-Fi / Fantasy / Noir).
3.  **System Asks (Interaction 2):** "What is their greatest fear?" (User types or selects).
4.  **System Asks (Interaction 3):** "Who is their enemy?"
5.  **Output:** System generates a `Lore_Bible.txt` which serves as the "Script" for future Video products.

### B. The "Digital Twin" Subscription
**Economic Model:**
* **Product:** "Digital Twin Hosting"
* **Cost:** 5 Credits / Month (deducted from Membership or Credit Balance).
* **Feature:** If credits run out, the Twin goes "Dormant" (Storage only, no interactive API access).

---

## 8. PARTNER INTEGRATION (PASSTHROUGH MODEL)
**Context:** Handling physical services without holding inventory.
**Status:** REVISED to "Middle-Man/Connector".

### The "Directory" Approach
We do not set the price. We display the price (or an estimate) and pass the order.

### User Journey
1.  **Selection:** User selects "Digitize VHS".
2.  **Matching:** System queries `Partner_Database`.
3.  **Handoff:**
    * **Scenario A (Integrated Partner):** We generate the Shipping Label via their API. User pays Us -> We pay Partner.
    * **Scenario B (Directory Partner):** We show the Partner's details/Map. User goes there physically.

### The "Digital Bridge" (Our Core Value)
Even if the Partner does the scanning, **WE** are the destination for the files.
* **Requirement:** The Partner uploads the resulting `MP4` / `JPG` files directly to the User's "Visualisatium Vault" (S3 Bucket).
* **Value:** This keeps the user on our platform for the *next* step (Editing/Enhancing).

---

## 9. DASHBOARD GAP ANALYSIS

### Admin Dashboard
* **Logistics Monitor:** `Global_Shipment_Tracker` (Integrated partners). Alert if `Status` = "Delayed" > 5 days.
* **Asset DNA Editor:** `Project_Deep_Dive` -> `Asset_DNA_Tab`. Admin can manually edit the JSON.
* **Smart Template Builder:** Drag-and-drop tool to link Collection Nodes.

### CCA Dashboard
* **Surge Pricing UI:** `Job_Queue_Card`. If `surge_multiplier > 1.0`, display a **Fire Icon** and the boosted price.
* **Asset DNA Injection:** `Active_Workbench`. "Import DNA" button to auto-fill Prompts/Seeds from previous orders.
* **Narrative Context Panel:** `Story_Context`. View the `Lore_Bible` (Fear, Enemy, Genre) side-by-side with the work area.

### User Dashboard
* **Physical Items Tab:** `My_Vault` -> `Physical_Source_Items`. List all VHS/Photos sent to partners.
* **Twin Control Center:** `Digital_Twin_Status`. "Battery" icon showing remaining Credits for hosting.
* **The Narrative Interface:** `Wizard_Overlay`. A stepped, game-like interface appearing when "Add Backstory" is clicked.
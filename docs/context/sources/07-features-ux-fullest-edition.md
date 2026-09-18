> **Status:** fuller earlier edition — content lost to Gem context limits in later revisions, not superseded in substance. Current edition: `docs/context/sources/07-features-ux.md`. Reconciliation is Architect work. Source: `Visualisatium/planning/handover-to-new-sessions/combined-v1.8/07_Features_UX_Master.md`. 

# FEATURES, UX & GAMIFICATION MASTER SPEC (v1.5)
> **Status:** CONSOLIDATED
> **Philosophy:** "Mastery, not Exclusivity."
> **Scope:** Gamification, Agent Tools, UI Components, and Operational Rules.

## 1. GAMIFICATION V2: "THE CURATOR"
> **Source:** `Gamification_v2_Curator.md` & `Gamification_Logic_v1.0.md`
> **Insight:** Families usually have one "Admin" (The Curator) and many consumers.

### A. New User Type: "The Curator" (Family History Manager)
**Insight:** Usually, *one* person in a family manages the history. The others just consume it.
* **Problem:** The Curator does all the work but has to pay for everything.
* **Feature: "The Contributor Link"**
    * Curator sends a link to 5 family members.
    * Family members can upload photos to the Curator's project *without* an account.
    * **Monetization:** "Crowdfund this Project." Family members can chip in Credits to pay for the expensive "Life Story" video.


### B. Metric: "Preservation Score" (The Hook)
Replaces generic XP. A gauge A gauge (0-100%) measures / tracking "Legacy Security" (Backups, Voice Models, Time Capsules). Instead of just "XP", we give them a score that plays on their anxiety/responsibility.
* **Visual:** A gauge on the dashboard (`Preservation_Gauge` module).
* **Scoring:**
    * +10 pts: First Upload.
    * +50 pts: Physical Backup (Partner Digitization).
    * +100 pts: Voice Model trained.
    * +200 pts: "Legacy Secured" (Time Capsule set).
* **Rank Names:**
    * 0-20%: *The Novice*
    * 20-50%: *The Keeper*
    * 50-80%: *The Archivist*
    * 100%: * The Guardian*

### C. RANKING
**THE CORE PHILOSOPHY: "MASTERY, NOT EXCLUSIVITY"**
**Objective:** Incentivize users to become "Power Users" of the AI tools.
**Constraint:** All *Physical Products* (Prints, Digitization) are available to ALL users immediately. We do not block revenue.


### D. PRICING MODEL TWEAK: "THE LEGACY SUBSCRIPTION"
Current pricing is transactional. We need recurring revenue.
* **The Offer:** "Archive Tier" (€9/month).
* **Benefits:**
    * Unlimited Storage (Standard cloud is expensive, but cold storage is cheap).
    * 1 Free "Restoration" per month.
    * **Key:** "Vault Insurance." We guarantee 3-location backup of their precious memories.

#### THE RANK LADDER (Revised Rewards)

##### Rank 1: The Intern (0 - 500 XP)
* **Status:** Default.
* **Access:** Full Product Catalog (Images, Videos, Partners, Prints).
* **UI Mode:** "Simple" (AI handles settings).

##### Rank 2: The Indie Director (501 - 2,000 XP)
* **Unlock:** **"Pro Mode" UI Toggle.**
    * *Value:* Gives control over Negative Prompts, Seeds, and Steps.
* **Unlock:** **"The Recipe Book" (Tier 1).**
    * *Value:* One-click access to basic Camera Styles (e.g., "Vintage Super 8", "Cinematic Pan").

##### Rank 3: The Studio Head (2,001 - 10,000 XP)
* **Unlock:** **"The Recipe Book" (Tier 2 - Pro).**
    * *Value:* Access to complex, multi-shot recipes (e.g., "The Hero Reveal", "The Hitchcock Zoom").
* **Perk:** **Priority Rendering.**
    * *Value:* Jobs skip the "Low Priority" AI queue during high traffic.
* **Perk:** **Extended Draft Retention.**
    * *Value:* Draft files are kept for 60 days (vs standard 14) before deletion.

##### Rank 4: The Mogul (10,000+ XP)
* **Unlock:** **"Beta Channel".**
    * *Value:* Access to new Experimental Models (e.g., "Voice Synthesis V2", "3D Model Gen V2") before the public.
* **Perk:** **"Director's Cut" Badge.**
    * *Value:* Visual flair on their profile/reviews.

### D. THE "PRESERVATION GAUGE" (Psychological Hook)
**Status:** **APPROVED.**
**Visual:** "Family Archive Status: 12% Secure."
**Logic:**
* **Goal:** Encourage users to use the "Partner Digitization" service.
* **Mechanism:** Purely informational/motivational. "You have digitized 2 VHS tapes. Estimated remaining legacy risk: High."

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

## 3. CCA TOOLS: THE "SMART COPILOT"
> **Source:** `CCA_Smart_Copilot.md`
> **Problem:** CCAs quote inconsistent prices (1 hour vs 5 hours) for the same task. For example, Calculating manhours for "Make a funny video from my 50 photos" is inconsistent. Some CCAs quote 1 hour, others 5.
**Role:** Drafting Assistant for Content Creator Agents.

### 1. THE PROBLEM
Calculating manhours for "Make a funny video from my 50 photos" is inconsistent. Some CCAs quote 1 hour, others 5.

### 2. THE "COPILOT" LOGIC
**Trigger:** CCA opens a generic "Offer Request".

#### Step 1: Input Analysis
The Engine scans the User's Request (Text + Attachments).
* **File Count:** "50 Images detected."
* **Keywords:** "Funny" (Low complexity) vs "Sync to beat" (High complexity).
* **Historical Data:** "Average time for 50-image slideshow is 1.2 hours."

#### Step 2: The Template Suggestion
The UI presents a "Draft Offer" card to the CCA.
> **🤖 Copilot Suggestion:**
> * **Task:** Dynamic Slideshow
> * **Est. Hours:** 1.5 Manhours (€112.50)
> * **Reasoning:** High file count, simple transition request.
> * **Recommended Text:** "I can create a dynamic slideshow with beat-sync. Based on 50 photos, this will take approx 1.5 hours."

#### Step 3: CCA Control (The Human Loop)
* **Accept:** CCA clicks "Use this Quote".
* **Adjust:** CCA changes 1.5 -> 2.0 (slider).
* **Reject:** CCA writes custom offer from scratch.

### DATABASE: LISTS INTEGRATION
**Note:** As requested, the `Lists` (Styles, Recipes) are stored in the DB.
* **Copilot Access:** The Copilot checks if the user referenced a specific *List Item* (e.g., "Style: Noir"). If "Noir" is tagged as `complexity: high` in the DB, the Copilot increases the hour estimate automatically.

### Surge Pricing UI (`Job_Queue_Card`)
* **Visual:** If `surge_multiplier > 1.0`, display **Fire Icon** and Green Price.
* **Tooltip:** "High demand. Payout +10%."

### THE "DYNAMIC BIDDING" ENGINE (Marketplace Liquidity)
**Objective:** Ensure "boring" or "hard" jobs get picked up by CCAs without raising prices for the user. CCAs are paid more for old jobs.
**Why:** Ensures 100% fulfillment rate without changing the price the User pays. It eats slightly into the platform's margin to protect User Retention.

#### Logic Table
| Time in Queue | CCA Payout Modifier | Platform Margin | Status Badge |
| :--- | :--- | :--- | :--- |
| 0 - 24 Hours | 1.0x (Standard) | Standard | `New` |
| 24 - 48 Hours | 1.05x (+5%) | Reduced | `Surge` |
| 48 - 72 Hours | 1.10x (+10%) | Minimal | `Priority` |
| 72+ Hours | 1.15x + Admin Alert | Loss Leader | `Critical` |

---

## 3. IMMERSION FEATURES (NARRATIVE & AUDIO)
> **Source:** `Feature_Pack_Master_v1.1.md`
**One Objective:** Sell "Story" and "Voice" not only as generic text products, but also as "Soul" for the visual assets.

### A. The Interactive Narrative Wizard (Option 2)
**Logic:** Instead of a blank text box, the user plays a "Game" to define the story.
**Flow:**
1.  **User Selects:** "Create Backstory for this Image."
2.  **System Asks (Interaction 1):** "What is the genre?" (Sci-Fi / Fantasy / Noir).
3.  **System Asks (Interaction 2):** "What is their greatest fear?" (User types or selects).
4.  **System Asks (Interaction 3):** "Who is their enemy?"
5.  **Output:** System generates a `Lore_Bible.txt` which serves as the "Script" for future Video products.
6.  **Dashboard View:** `Story_Context_Panel` shows these answers to the CCA while they edit.

### B. The "Digital Twin" Subscription
**Economic Model:**
* **Product:** "Digital Twin Hosting"
* **Cost:** 5 Credits / Month (deducted from Membership or Credit Balance).
* **Feature:** If credits run out, the Twin goes "Dormant" (Storage only, no interactive API access).

### C. Audio/Voice Skins
**Logic:** Audio files are treated as "Assets" linked to a Character DNA.
**UI Requirement:** Files tab must include a **Waveform Player** (not just a download link) to preview Voice Skins.
**Input:** >5 mins of audio (VHS rip, voicemail).
**Processing:** Trains RVC/LoRA Voice Model.
**Safety:** **Consent Protocol**. User must digitally sign rights.

---

## 4. UI PATTERNS: "HYBRID INPUTS"
> **Source:** `UI_Input_Specs.md` & `Operational_Manual.md`

### The "Split Choice" Input
**Use Case:** Selecting a Style (e.g., "Cyberpunk" vs Custom).
* **State A (Default):** **Visual Grid  + Fast-Track Custom Text**. Grid of images, and Textarea.
* **State B (Fast-Track):** Only text area used.
    * *Backend:* Submits as `custom_text` instead of `style_id`.

### The Visual Grid#
1.  **Visual:** Grid of Cards (Images/Icons).
2.  **The Anchor:** Last card is **"Custom / Write Your Own"**.
3.  **Behavior:** Clicking a card selects it. Clicking "Custom" acts like the Fast-Track toggle.

---

## 5. DASHBOARD MODULE INVENTORY
> **Source:** `project_status-combined.json`, `Dashboard_Updates_v1.0.md`, `Dashboard_Architecture_Blueprint.md`

These are specific UI widgets that must be implemented in the Frontend Component Library.

### A. Admin Dashboard ("Mission Control")
**Core Philosophy:** Forensic Observability & "Ghosting".

#### Some Modules
*   **The "Forensic Hover":**
    *   *Problem:* Admin tables are too dense.
    *   *Solution:* Hovering over a status (e.g., "Failed") triggers a popover with the *exact* technical error (e.g., "Stripe: do_not_honor"). Admin can hover over a "Failed" status to see the raw error log (e.g., Stripe JSON response) without opening the DB.
    *   *Tech:* Radix UI Popover + TanStack Query (Prefetch on hover).
*   **The "Shadowing" Engine (Clerk Integration):**
    *   *Logic:* Admin clicks "Shadow User" (Troubleshoot). Admin can "Login as User" or "Watch CCA" in real-time (using Supabase Presence).
    *   *Safety Protocol:*
        1.  **Ghost Mode (Default):** Admin sees what User sees (Read-Only). No alerts.
        2.  **Intervention Mode:** Admin toggles "Take Control".
            *   **CCA View:** "⚠️ Admin is modifying this job." (Inputs Locked).
            *   **Logging:** Action recorded in `admin_shadow_logs`.
    *   *Restriction:* Admin **CANNOT** view Biometric Vault (ID/TIN) data in Shadow Mode.
* **`Success_Tax_Engine`**: Visual calculator showing the spread between "Realized Revenue" and "CCA Payouts".
* **`Global_Shipment_Tracker`**: Aggregates carrier webhooks. Columns: `Tracking_ID`, `Partner_Loc`, `Status` (In_Transit, Delayed, Delivered). Alert: Red flag if `Status` = "Delayed" > 5 days.
* **`Asset_DNA_Editor`**: JSON Editor for `assets.character_seed`. Allows "God Mode" edits.
* **`Smart_Template_Builder`**: Visual Node Editor for creating new `Smart_Collections`.

#### 1. ADMIN DASHBOARD UPDATES

##### A. Logistics Monitor
* **New Module:** `Global_Shipment_Tracker`
* **Data Source:** Aggregated carrier Webhooks.
* **Columns:** `Tracking ID`, `User`, `Partner`, `Status` (In_Transit, Delayed, Delivered).
* **Alert:** Red flag if `Status` = "Delayed" > 5 days.

##### B. Asset DNA Editor
* **New View:** `Project_Deep_Dive` -> `Asset_DNA_Tab`
* **Function:** Admin can manually edit the JSON (e.g., change a Seed) if a user complains about character consistency.

##### The "Smart Template Editor" (Admin Dashboard)
A tool to build these packages without coding.
* **Drag & Drop:** Drag an "Image Generator" node. Connect it to a "Video Generator" node. Drag-and-drop tool to link Collection Nodes.
* **Select Preset:** Apply "The Epic Landscape" recipe to the video node.
* **Save:** Publish as "New Collection Product".

### B. CCA Dashboard ("The Workbench")
**Core Philosophy:** Flow, Urgency & Conflict Prevention.

### Some Modules
*   **The "Soft Lock" (Conflict Prevention):**
    *   *Scenario:* Admin and CCA open the same job to edit.
    *   *Tech:* **Supabase Presence**.
    *   *UI:* If Admin is editing, CCA sees a "Locked by HQ" badge.
	*    **If locked by antother CCA: Visual indicator ("Locked by CCA_123") prevents two agents from claiming the same job.
*   **Gamified Urgency:**
    *   *Visual:* Timeline bars change color (Green -> Yellow -> Red) as the deadline approaches.
*   **Delta Pattern Drafting:**
    *   *Tech:* **Zustand** stores local edits. **TanStack Query** syncs to server only on "Save".
    *   *Benefit:* No work lost if mobile network drops.
*   **`Job_Queue_Card`**: Displays `est_time`, `payout_amt` (Green if Surge), `deadline_countdown`.
*   **`Story_Context_Panel`**: Read-only view of `Lore_Bible` data (Genre, Fear, Enemy).
*   **`Active_Workbench`**: The main editing interface. Includes "Import DNA" button.

#### 2. CCA DASHBOARD UPDATES

##### A. Surge Pricing UI
* **Update to:** `Job_Queue_Card`
* **Visual:** If `surge_multiplier > 1.0`, display a **Fire Icon** and the boosted price in Green.
* **Tooltip:** "This job pays +10% due to wait time."

##### B. Asset DNA Injection
* **Update to:** `Active_Workbench`
* **Action:** "Import DNA" button to auto-fill Prompts/Seeds from previous orders.
* **Behavior:** Dragging a previous Order ID into the workbench auto-fills the Prompts, Negative Prompts, and Seed fields.

##### C. Narrative Wizard Viewer
* **New Panel:** `Story_Context`
* **Function:** View the `Lore_Bible` (Fear, Enemy, Genre) side-by-side with the work area. If the User used the "Interactive Wizard," the CCA sees the generated answers (Fear, Enemy, Genre) in a side panel to guide their video creation.


### C. User Dashboard ("The Vault")
**Core Philosophy:** Genealogy & Ownership.

#### Some Modules
*   **The Genealogy Explorer:**
    *   *Concept:* "Make the rabbit white" -> "Now put it on the moon".
    *   *UI:* A "Tree View" (using Motion for React) showing the lineage: `Original -> Variant A -> Variant A.1`. A visual node graph showing asset lineage (`Original` -> `Edit 1` -> `Edit 2`).
    *   *Action:* User can click any past node to "Branch Off" a new order.
*   **R2 Integration:**
    *   All thumbnails served via **Cloudflare R2** (Zero Egress Fees) to save money on "Gallery Browsing".
*   **Partner Pipeline Meter:**
    *   Visual tracker for Physical Goods: `Waiting Delivery` -> `Processing at Partner` -> `At Delivery`.
*   **`Comparison_Slider`**: Before/After slider component for reviewing Restorations/Edits.
*   **`Project_Folder_View`**: Organizing assets into "Collections" (Visual Directories).
*   **`My_Vault_Physical`**: Grid view of physical items (VHS, Photos) currently at Partner facilities.
*   **`Digital_Twin_Status`**: "Battery Level" widget showing remaining hosting credits.
*   **`Preservation_Gauge`**: Gamification metric (0-100%) showing data safety level.

#### USER DASHBOARD UPDATES

##### A. Physical Items Tab
* **New Tab:** `My_Vault` -> `Physical_Source_Items`
* **List:** Shows all VHS/Photos sent to partners.
* **Actions:** "Track Shipment", "Report Lost".

##### B. The Twin Control Center
* **New Widget:** `Digital_Twin_Status`
* **Visual:** A "Battery" icon showing remaining Credits for hosting.
* **Toggle:** "Active" (Chat enabled) vs "Dormant" (Storage only).

##### C. The Narrative Interface
* **New Modal:** `Wizard_Overlay`
* **UX:** A stepped, game-like interface (Step 1 of 3...) appearing when "Add Backstory" is clicked.

##### The "Collection Canvas" (User Dashboard)
Instead of a list of files, the User sees a **Timeline View** ("Studio View").
* **Left:** The Source Files (Uploads).
* **Middle:** The "Processing Nodes" (Visualizing the AI working).
* **Right:** The Outputs.
* **Why:** It looks like a "Studio" rather than a "Shopping Cart".

---

## 6. OPERATIONAL CONFIGURATION
> **Source:** `project_status-combined.json` & `Operational_Manual.md`

* **Context-Aware Chat:** Chat widgets are explicitly linked to `Order_ID` or `Ticket_ID`. There is no "General Support" chat that floats without context.
* **Chat Retention:** `infinite`. History is never deleted; soft-archived only. Parties can "Revive" closed threads.
* **Liability Clause:** "Platform holds no liability for Partner printing errors." (Must be visible in Checkout). Platform acts as a "Middle Man". Liability for printing errors remains with the Partner.
* **Navigation Mode:** `dual_entry`. Users can browse by **Product** (e.g., "Restore Photo") OR **Category** (e.g., "Memories"). Both views must be supported - Products are always visible to minimize clicks.
* **Multi-Party Support:** Chat supports `User + Admin + Partner` visibility if Physical Goods are involved..
* **Wishlist Feature:** Integrated into Support Area. Users upvote ideas for Phase 3 Inventory expansion.

---

## 7. THE "DRAFT SAFEGUARD" (Anti-Theft)
**Objective:** Prevent users from screenshotting / stealing high-quality drafts and filing a dispute.

### Logic
* **Intercept:** Any image/video uploaded by a CCA to the chat/preview window *before* the status is `Completed` is automatically intercepted by an Edge Function.
* **Overlay:** The function overlays a diagonal "PREVIEW - [User ID]" watermark.
* **Unlock:** The Clean Version is only released to the "Files" tab once the status moves to `Review_Period` (where the clock starts ticking) or `Completed`.


### Technical Logic (Mermaid)
~~~mermaid
flowchart TD
    CCA[CCA Uploads Draft] --> Edge[Edge Function Interceptor]
    Edge --> Overlay[Apply 'PREVIEW' Watermark]
    Overlay --> Chat[User Chat Window]
    User[User Accepts Work] --> Status[Status: Review_Period]
    Status --> Unlock[Original File Unlocked in 'Files' Tab]
~~~

---

## 8. THE PRODUCT HIERARCHY (Validated)
**The Structure:**
1.  **Category** (e.g., "Memories")
2.  **Product** (e.g., "Enhancement of Photo")
3.  **Input Requirement** (e.g., "One Image") -> **Validator Logic**
4.  **Data Requirement** (e.g., "Select from List") -> **UI Component (Split Choice)**

---

## 9. DOMAIN GLOSSARY (Terminology Fix)
* **User sees:** "Collections"
* **DB stores:** "Projects"
* **User sees:** "Character"
* **DB stores:** "Asset_Entity" (with DNA JSON)

---

## 10. SPECS: CHARACTER PERSISTENCE ENGINE ("The Vault")
**Reference:** `Updates.docx` (Character Vault), `SoldProduct.docx` (Reuse), `Products.xlsx` (Special.csv)
**Problem:** Keeping "Captain Whiskers" consistent across 5 videos.
**Solution:** Asset DNA.
**Logic:** When a user selects a Vault Character, the Generator Node LOCKS the Seed and LoRA fields.

### 1. OBJECTIVE
To solve the "Consistency Problem" identified in `Updates.docx`. When a user buys a "Mascot" today, they must be able to use the *exact same* mascot in a video next week without re-prompting or getting random variations.

### 2. DATA STRUCTURE: "THE DNA CONTAINER"
Instead of just saving an image, we save the **Recipe**.

#### The Schema (JSONB), Structure
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

### 3. USER JOURNEY: "REUSE"
### Phase 1: Creation (The "Special" Product)
* **GIVEN** the user is on the "Create Character" product page
* **WHEN** they finalize the order and mark "Save to Vault"
* **THEN** the System extracts the `seed` and `prompts` used by the AI and saves them to the `User_Vault` table.

#### Phase 2: Injection (The "Adventure" Product)
* **GIVEN** the user is buying "Adventures of Character" (from `Products.xlsx`)
* **WHEN** the UI asks for "Character Reference"
* **THEN** the "Split Choice" Input displays their **Vault Items** (Visual Grid).
* **AND** selecting "Captain Whiskers" injects the `dna_payload` into the CCA's `Active_Workbench`.

### 4. LOGIC: THE "CONSISTENCY GUARD"
* **Automated Check:** If the user selects a Vault Character, the Generator Node **LOCKS** the Seed and LoRA fields.
* **CCA Override:** The CCA can tweak the `strength` but cannot remove the `trigger_words` without a warning popup ("Warning: Deviating from Character DNA").

---

## 11. SMART COLLECTIONS & ORCHESTRATION
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

## 12. GAMIFICATION: "THE DIRECTOR'S CHAIR"
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

> **Status:** fuller earlier edition — content lost to Gem context limits in later revisions, not superseded in substance. Current edition: `docs/context/sources/01-master-vision.md`. Reconciliation is Architect work. Source: `Visualisatium/planning/handover-to-new-sessions/combined-v1.8/01_Master_Vision_VIVID_strategyVision.md`. 

# VIVID: THE MASTER ARCHITECTURE
> **Version:** 5.0 (Consolidated)
> **Date:** 2026-01-21 (from JSON)
> **Phase:** Planning Phase 3 (Inventory & Schema)

## 1. CORE IDENTITY & PHILOSOPHY
> **Source:** `VIVID.docx`

* **Project Name:** VIVID (Working Title).
* **Core Philosophy:** "Outcome over Tool." We do not sell "Image Generation"; we sell "Memories," "Stories," and "Heirlooms."
* **The Model:** Hybrid Marketplace.
    * **Digital:** "Vending Machine" utility (Low cost, high volume, instant).
    * **Physical:** "Boutique" manufacturing (High margin, slow, premium).
    * **Service:** "CCA on Demand" (Manual override for complex tasks).

### User Architecture
* **The Curator (Admin):** The family historian. They pay for the "Saga Pass" and manage the Vault.
* **The Contributor (Guest):** Family members invited via "Magic Link." They upload assets to the Curator’s project and can "Crowdfund" (chip in credits) for expensive physical prints.
* **The Partner (Creator/Vendor):** IP rights holders (Creators) or Physical Manufacturers.

### B. The Immersion Layer (Narrative)
* **Strategy:** We do not sell "Text Generation." We sell **Story**.
* **Tool:** The "Interactive Narrative Wizard." Users play a text-game to generate a `Lore_Bible`, which then drives video consistency.
* **Tool:** "Digital Twin" Hosting. A subscription service to keep a generated persona "alive" and chat-enabled.

--

## 2. THE CORE DIRECTIVES (IMMUTABLE)
* **Business Model:** Hybrid Marketplace + SaaS.
    * **Platform:** Automated AI generation.
    * **Service:** CCA (Content Creator Agents) for manual overrides.
    * **Partners:** Directory/Passthrough model. We do NOT hold inventory. We monetize the *connection* and the *digital file*, not the physical service.
* **Product Philosophy:** "No Generic Wrappers." All text/audio products must anchor to the Visual/Memory core.
* **Naming Candidates:** VIVID, LUMINA (Previous placeholder: Visualisatium).


## 3. STRATEGIC DEFINITIONS & LOGIC
> **Source:** `Visualisatium_Master_Plan_Merged_v1.md` & `Odyssey_Product_Line.md`

### A. The "Odyssey" vs "Collection" Distinction
**Concept of Sagas (Odysseys):** Multi-step product lines where the User builds towards a Grand Finale.
* **Collections:** "A bucket of items." (Static).
* **Odysseys (Sagas):** "A path with a destination." (Dynamic, Sequential).
    * **Mechanism:** Sequential Locking. Step 2 physically cannot exist until Step 1 is completed.
    * **Context Inheritance:** The System maintains a `Odyssey_Context.json`. If Step 1 establishes "Hero wears a red scarf," Step 5 automatically injects "(wearing a red scarf)" into the prompt.

#### THE STRUCTURE Of Odysseys
An Odyssey is a "Meta-Product" containing `n` Steps.
* **Example:** "The Children's Adventure Book" (10 Steps + 1 Print).
* **Step Logic:** Step 2 cannot be started until Step 1 is "Locked".

#### The Dashboard View of Odysseys
* **Visual:** A Roadmap / Level Select screen (like a game).
* **Status Indicators:**
    * 🟢 *Chapter 1: The Call to Adventure* (Completed)
    * 🟡 *Chapter 2: The Meeting* (In Progress)
    * 🔒 *Chapter 3: The Journey* (Locked)

### B. The "Smart List" Transformation
* **Old Way:** Text match ("Noir").
* **New Way:** Vector Embeddings. We match the string "Noir" to a hidden "Prompt Payload" (e.g., `(chiaroscuro lighting:1.4), (black and white:1.2)`).

### C. The "Phoenix Protocol" (Abandoned Offers)
* **Trigger:** User abandons an "Offer Requested" state for > 30 days.
* **Action:** Status moves to `Archived`.
* **Revival:** User clicks "Restore".
* **Safety:** System flags `is_restored = true`. CCA must re-validate pricing (inflation/availability) before re-enabling the payment link.

## 4. THE PRODUCT CATALOG (CONSOLIDATED)
> **Note on Naming:** `VIVID.docx` refers to these as "The Saga Engine". `Odyssey_Catalog` refers to them as "Odysseys". I have preserved all unique details from both.

### A. The "Saga" Engine (Multi-Step Workflows)
1.  **The Visual Biography (Flagship):**
    * *Flow:* Interview User (Text) -> Restoration (Image) -> Script Generation -> Voice Model Training (Audio) -> Documentary Production (Video).
    * *Price:* €150 (Bundle). Margin: ~€145.
2.  **The Time Traveler’s Diary:**
    * *Flow:* User Uploads Selfie -> Selects Eras (Viking, 1920s, Cyberpunk) -> AI Generates Photos + First-Person Diary Entries -> Result: Digital History Album (PDF).
3.  **The Pet’s Secret Life:**
    * *Flow:* Upload Pet Photo -> Select Personality (Spy, Chef) -> Generate 3D Character (Asset DNA) -> Animate 5 Scenarios -> Result: "Day in the Life" Reel.
4.  **The Culinary Legacy:**
    * *Flow:* Upload Grandma’s Handwritten Recipe -> Transcription -> AI Visualizes the finished dish -> AI Animates steam/sizzle -> Result: Motion Recipe Card.
5.  **The Career Simulator (Kids):**
    * *Flow:* Upload Child’s Photo -> Select Careers (Mars Colonist, President) -> Generate "Future Self" Portraits -> Result: Inspirational Poster.
6.  **The Love Story Trailer:**
    * *Flow:* Upload Couple Photos -> Input "How we met" -> AI Scripts Trailer -> AI Generates Voiceover -> AI Generates Scenes -> Result: Cinematic Movie Trailer.
7.  **The Corporate Origin (B2B):**
    * *Flow:* Founder Photos + Logo + Mission -> Script -> B-Roll -> Avatar Video -> Result: 60s Brand Documentary.
8.  **The Dream Home Architect:**
    * *Flow:* Room Scan (Photo) -> Style Match -> 3D Visualization -> Commerce Link -> Result: Renovation Preview.
9.  **The WhatsApp Time Capsule:**
    * *Flow:* Upload `_chat.txt` -> AI Analysis (Key Dates/Quotes) -> Layout Generation -> Result: Digital Scrapbook PDF.
10. **The RPG Campaign Sourcebook:**
    * *Flow:* DM Pastes Notes -> AI Identifies NPCs -> Generates Consistent Portraits -> Generates Maps -> Result: Campaign PDF.
11. **The Family Fable (Physical Book):**
    * *Also listed as "The Bedtime Story" in Odyssey_Product_Line.*
    * *Flow:* 10 Family Photos + Narrative Wizard answers -> LLM writes story ("Captain Grandpa") -> ControlNet styles photos -> Physical Hardcover.

### B. Utility Assets (Single-Step / "Vending Machine")
* **The Ink Architect:** Tattoo design visualization.
* **The Interior Stager:** Furnishing empty room photos (Real Estate).
* **The Fashion Try-On:** Dressing user avatars in specific styles.
* **The Dream Visualizer:** Text-to-Surrealist Art.
* **The Colorizer Pro:** Historical accuracy colorization.
* **The Living Painting:** Subtle loop motion (cinemagraphs).
* **The Logo Reveal:** 3D elemental animation.
* **The Reaction GIF:** Anime/Cartoon character acting out user emotion.
* **The Music Visualizer:** Audio-reactive geometry.
* **The Quote Reel:** Kinetic typography video.

### C. Physical Specials (The Phygital Layer)
> **Source:** `VIVID.docx` (Specific Partners Identified)
> **[CONFLICT]:** `Deep_Research_Needs.md` asks to "Find 3 EU Partners". `VIVID.docx` lists specific partners.
> **[RESOLUTION]:** VIVID v5.0 appears newer. I list the partners below, but keep the Research Task active in Section 8 for verification.

* **The Forever Pet:** 3D Printed Full-Color Sandstone/PolyJet figurine. (Partner: **i.materialise**, Belgium).
* **The Lithophane Lightbox:** 3D printed white box revealing high-res photo when lit. (Partner: **Manubim**, Hungary).
* **The Vinyl Single:** Lathe-cut 7" record of AI-generated music. (Partner: **Dr. Dub**, Austria).
* **The Soundwave Ring:** Laser-engraved waveform on silver/gold. (Partner: **OwnPrint**, Netherlands).
* **The Infinite Frame:** 7" Acrylic Video Screen (Video Brochure). (Partner: **Media Plant**, UK).
* **The Memory Stone:** Polymer/Resin object with embedded NFC chip. (Partner: **NFC-Tag-Shop**, Germany).

## 5. BUSINESS LOGIC & ROUTING
> **Source:** `VIVID.docx`

### A. The "Traffic Light" API Router
Objective: We do not rely on a single provider. We route based on Cost, Quality, and Safety.

* **🟢 GREEN LANE (Public APIs - Low Cost/High Volume):
    * **Content:** Landscapes, Pets, Generic Avatars, Architecture, Safe Sagas.
    * **Routing / Infrastructure:**
	  **Public APIx:** For example:
        * *Text:* Google Gemini 1.5 Flash (Fast/Cheap).
        *  *Image:* Flux.1 [schnell] via Fal.ai / Replicate (Speed: ~0.003€).
        *  *Video:* Luma Ray 2 or Runway Gen-3 Turbo (via API).
* **🟡 YELLOW LANE (The "Sanctuary Server" - Control Layer):
    * **Content:** Swimwear (e.g. Family photos), Artistic Nudity (e.g. Classical), Parody, Satire, "Edgy" Humor, Complex LoRAs (e.g. Official Partners).
    * **Routing / Infrastructure:** 
	  **Self-Hosted Infrastructure / Sacntuary Server:** For example:
        * **Hardware:** NVIDIA RTX 4090 (24GB VRAM) or A6000 (48GB).
        * **Software:** ComfyUI backend running Uncensored Flux.1 [dev] and Hunyuan Video.
		* **Safety Layer:** A Local **Classifier** (e.g., **NudeNet** or **Hive Moderation**) runs *before* generation to catch Red Lane prompts, and after generation to verify output safety.
    * **Logic:** If content is legal but violates OpenAI/Google "Puritan" filters, it goes here.
* **🔴 RED LANE (The Block - Safety Layer):
    * **Content:** CSAM, Non-Consensual Deepfakes, Extreme Gore, Hate Speech.
    * **Action:** HARD BLOCK at the prompt level. User Account Flagged.
	* ** Routing / Infrastructure:**
	  **Blocked:** Request rejected. User flagged.
    * **Tool:** Local Classifier (NudeNet or Hive) running on the Sanctuary Server.


### B. The "Safe Harbor" Interceptor (Copyright)
**Trigger:** User prompts a protected brand (e.g., "Star Wars").
**System Action:** BLOCK GENERATION. Display Modal.
**User Choices:**
  1.	Option A: "Switch to 'Galactic Civil War' (Our Legally Distinct Fork)."
  2.	Option B: "Cancel Generation (No charge)."
  * **Universal Option:** "Notify me if VIVID acquires the official license for [Brand]." (Data used for BizDev leverage).

### C. The "Silent Royalty" Protocol (IP Strategy)
**Strategy:** We do not have separate consumer prices for "Premium" brands.
**Mechanism:** If Asset_Type = "Licensed" (e.g., Official Creator World), the System automatically deducts 5-15% of the Net Revenue and credits the Creator's Wallet.
**Benefit:** Pricing changes do not break contracts (percentage basis).


## 6. SUPPLY CHAIN LOGIC ("VIRTUAL WAREHOUSE")
> **Source:** `VIVID.docx`

**Strategy:** Middleware Automation routes orders based on SKU prefixes.

| Product | SKU Prefix | Primary Partner | Location | Logic / Integration |
| :--- | :--- | :--- | :--- | :--- |
| 3D Pet Figurine | `FIG-` | i.materialise | Belgium | **API**. Send .obj. Use PolyJet (Multicolor+). |
| Lithophane Box | `LITHO-` | Manubim | Hungary | **Manual/CSV**. Send image via email parser. |
| Vinyl Record | `VINYL-` | Dr. Dub | Austria | **Manual/Portal**. Send Audio Link + Cover Art. |
| Jewelry | `RING-` | OwnPrint | Netherlands | **API**. Send Vector Waveform. |
| Video Brochure | `VBOOK-` | Media Plant | UK | **Trade/FTP**. Send MP4. Must use IOSS for EU. |
| NFC Stone | `NFC-` | NFC-Tag-Shop | Germany | **Configurator**. Send Link to write to chip. |

**Loop-Back Logic:** Every physical item generates a unique **QR Code** (or NFC link)sent to the printer. Scanning the physical item opens the Digital Saga in the VIVID App, driving re-engagement.

## 7. ECONOMICS: THE "VIVID" PRICING MODEL
> **Philosophy:** "Vending Machine" pricing for digital; "Boutique" pricing for physical.
> **Currency:** 1 Credit = €1.00.
**Strategy:** We do not confuse users with separate "Premium Prices."
**Mechanism:**
* **User Price:** Standard (e.g., €0.90).
* **Backend Logic:**
    * IF Asset_Type == "Generic" THEN Platform_Keep = 100%
    * IF Asset_Type == "Licensed" (e.g. Indie Comic Character) THEN Platform_Keep = 85%, Creator_Wallet = 15%
**Benefit:** Pricing changes do not break contracts because royalties are a percentage of Net Revenue.



### The Pricing Table
| Product Tier | Cost (Credits) | Price (EUR) | Margin Note |
| :--- | :--- | :--- | :--- |
| Draft / Re-Roll | 0.1 | €0.10 | "Play is cheap." Subsidized to remove anxiety. |
| Standard Image | 0.5 - 0.9 | €0.50 - €0.90 | Utility pricing. API cost is negligible. |
| Standard Video | 2.9 - 3.9 | €2.90 - €3.90 | Covers GPU cost (€0.20-0.50) + Margin. |
| Saga Step | 3.5 | €3.50 | Volume discount logic. |
| Digital Person (Sub)| 10 / mo | €10.00/mo | Recurring revenue for hosting. |
| Physical Specials | 35 - 150 | €35+ | High margin (2.5x - 3x markup). |
| CCA Booking Fee | 15 | €15.00 | Deducted from final invoice. Filters spam. |

**The Smart Ledger (Escrow):**
* **Flow:** User_Wallet -> Escrow_Pool (Hold 14 Days) -> CCA_Wallet (75%) + Platform_Revenue (25%).
* **Trigger:** Funds release only after Review Period expires without dispute.
* **Success Tax:** CCA Payout is calculated on **Net Revenue** (after Stripe Fees/VAT), not List Price.


### Pricing Logic Notes
* **Video Strategy:** We prioritize **Volume** (Vending Machine model) over Margin. The lower price point (€3.90) is designed to encourage mass adoption of video features.
* **Re-Roll Implications:** Since the base video price is low, Video Re-Rolls (Previews) must be priced proportionally lower (e.g., **€0.50** for a GIF preview) rather than the €5.00 listed in older strategy docs.

## 8. ASSET CONSISTENCY ("THE VAULT")
> **Source:** `VIVID.docx`
**Objective:** Ensure a character created in Order A looks the same in Order B (Image -> Video -> 3D).
**Data:** When a Character is created, we save: { Seed, LoRA_Weights, Trigger_Words, Embedding_Vector }.

### User Stories
* **As a User**, I want to reuse my "Cyberpunk Mascot" created last month for a new video today without describing him again.
* **As a CCA**, I want to download a "DNA Pack" containing the original Seed, LoRA, and Negative Prompts to match the style perfectly.

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

* **Problem:** Character consistency.
* **Solution:** Asset DNA.
* **Structure:**
    ```json
    {
      "entity_id": "char_123",
      "dna_payload": {
        "base_model": "SDXL_Turbo",
        "seed": 4829104,
        "lora_weights": ["lora_cat_v2:0.8"],
        "trigger_words": ["orange fur", "space helmet"],
        "embedding_vector": "[0.12, 0.44...]"
      }
    }
    ```
* **Logic:** Selecting a Vault Character **LOCKS** these fields in the Generator Node.

## 9. PROJECT METADATA & GAP ANALYSIS
> **Source:** `project_status-combined.json` (Raw Data)

### Project Metadata
* **Version:** 5.0 (Consolidated)
* **Environment:** Antigravity / VS Code
* **Phase:** Planning Phase 3 (Inventory & Schema)

### Active Decisions (Axioms)
1.  **Payout Model:** Realized Net Revenue (FIFO Basis). *Detailed in File 02.*
2.  **Deposit Rule:** 1-Hour Non-Refundable Deposit for Manual Offers.
3.  **Acceptance Protocol:** Passive Implicit (Download/Share = Final).
4.  **Implicit Triggers:** `download_high_res`, `social_share`.
5.  **Subscription Rule:** "Service of Creation" (Tool Access).


## 10. DEEP RESEARCH REQUISITIONS
> **Source:** `Deep_Research_Needs.md`
> **Status:** Open Questions.

1.  **The "Physical Bridge" Partners:**
    * *Note:* VIVID v5.0 lists partners (i.materialise, etc.). Use this task to **verify** if they have White Label APIs.
2.  **Legal / IP Framework:**
    * Task: "Parody vs. Infringement in AI Generations (EU Law)." Can we sell a "Space Knights" LoRA?
3.  **Audio API Costing:**
    * Task: Evaluate Open Source Voice Models (XTTS-v2, Tortoise) vs ElevenLabs. Can we host XTTS on the "Sanctuary Server" to save money?

## 11. NEXT SESSION GUIDE
> **Source:** `VIVID.docx`

1.  **NotebookLM Integration:**
    * Capability: Confirmed. 50 sources per project.
    * Instruction: Create a single notebook named `Visualisatium_Master`.
	
## 12. THE VISUAL ENGINE: "SMART COLLECTIONS"
Unlike competitors who sell generic bundles of credits, we sell **"Production Pipelines"** (Dependency Graphs).

**The Problem:** Buying a "Wedding Collection" usually just gives a user 50 blank image slots. It’s overwhelming.
**The Visualisatium Solution:** Template-Driven Orchestration.

### Example Scenario: "The Wedding Deluxe Collection"
1.  **Step 1 (The Anchor):** The User uploads *one* main photo of the couple.
2.  **Step 2 (The Style):** The User selects "Watercolor" from the Style List.
3.  **Step 3 (The Automation):**
    * **Output A (Image):** System generates a stylized "Save the Date" card using the Anchor Photo + Watercolor Style.
    * **Output B (Video):** System takes Output A and applies the **"Intimate Moment" Camera Recipe** (Slow Zoom + Particle Effects) to create a motion invite.
    * **Output C (Text):** System generates a "Thank You" note using the tone derived from the style.
4.  **Result:** The user provides **1 input** and gets **3 consistent, linked products**.

---

## 13. GAMIFICATION: "THE DIRECTOR'S CHAIR"
**Philosophy:** **Guidance, Not Gating.**
We do not artificially restrict tools. If a Level 1 user wants to use "Negative Prompts," they can finding the "Advanced" toggle. However, our Gamification system uses XP to *guide* them.

* **The Mechanic:** As users earn "Production XP" (by spending or preserving memories), the interface adapts.
* **Level 1 (Intern):** Interface is clean. Focus on one-click results.
* **Level 2 (Director):** System actively suggests: *"You've made 10 images. Try using 'Camera Angles' to improve your results."*
* **Level 3 (Studio Head):** System unlocks "Pro Presets" (e.g., specific LoRA weights for consistency) that simplify complex tasks.
* **The Hook:** **"The Preservation Gauge."** A visual indicator on the dashboard showing how much of the user's family history is digitized vs. at risk of decay (Sticky-shed syndrome).

---

## 14. THE IMMERSION LAYER (NARRATIVE SOUL)
**Strategy:** We do not sell "Text Generation" (generic copywriting). We sell **Story**.
* **The Narrative Wizard:** An interactive "game" where users answer questions (e.g., "What is your character's greatest fear?") to generate a `Lore_Bible`. This bible ensures future videos of that character adhere to the story.
* **Digital Twin Hosting:** A subscription service where users pay monthly credits to keep a generated character "alive" and chat-accessible.

---

## 15. THE PHYSICAL BRIDGE (TRUST)
**Model:** **Passthrough / Middle-man.** We do not own scanners or printers.
* **Digitization:** We connect users to Partners. For "Integrated Partners," we track the Chain of Custody via API. For others, we act as a Directory.
* **Physical Output:** We connect digital assets to Print Partners for high-value items (Lithophanes, Video Brochures).

---

### 16. The "Smart List" Transformation
**Architecture Upgrade:**
* **Vector Embeddings:** We will not just match the string "Noir"; we will inject a hidden "Prompt Payload" associated with "Noir" (e.g., `(chiaroscuro lighting:1.4), (black and white:1.2)`).
* **Dependency:** These lists become the **Configuration Nodes** for the *Smart Collections* engine.

--



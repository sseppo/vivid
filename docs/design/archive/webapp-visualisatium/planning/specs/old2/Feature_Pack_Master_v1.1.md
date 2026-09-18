> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Feature_Pack_Master_v1.1.md`. 

# PRODUCT REQUIREMENT DOCUMENT: TRUST, CONTINUITY & IMMERSION (v1.1)
**Author:** Planning Gem (CPO)
**Status:** DRAFT
**Scope:** 7 Core Features covering Logistics, Asset Consistency, and the new Narrative/Audio Layer.

---

## 1. THE "CHAIN OF CUSTODY" (Physical Logistics)
**Objective:** Track physical items (photos, VHS) sent by users to partners for digitization.

### User Stories
* **As a User**, I want to download a shipping label with a unique QR code so that my package is linked to my digital order.
* **As a User**, I want to receive a notification when the Partner physically scans my package so I know it didn't get lost in the mail.
* **As a Partner**, I want a "Logistics View" to scan incoming QR codes and update statuses to "Received" instantly.

### Technical Logic (Mermaid)
~~~mermaid
sequenceDiagram
    participant User
    participant System
    participant Carrier_API
    participant Partner
    
    User->>System: Order "VHS Digitization"
    System->>User: Generates PDF Label (Order ID embedded)
    User->>Carrier_API: Ships Package
    Carrier_API->>System: Webhook: "In Transit"
    System->>User: Notification: "Package on its way"
    Partner->>System: Scans QR Code (Arrival)
    System->>System: Update Status: "Physical_Received"
    System->>User: Notification: "Safe at Partner Facility"
~~~

---

## 2. THE "ASSET DNA" (Character Consistency)
**Objective:** Ensure a character created in Order A looks the same in Order B (Image -> Video -> 3D).

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

---

## 3. THE "DYNAMIC BIDDING" ENGINE (Marketplace Liquidity)
**Objective:** Ensure "boring" or "hard" jobs get picked up by CCAs without raising prices for the user.

### Logic Table
| Time in Queue | CCA Payout Modifier | Platform Margin | Status Badge |
| :--- | :--- | :--- | :--- |
| 0 - 24 Hours | 1.0x (Standard) | Standard | `New` |
| 24 - 48 Hours | 1.05x (+5%) | Reduced | `Surge` |
| 48 - 72 Hours | 1.10x (+10%) | Minimal | `Priority` |
| 72+ Hours | 1.15x + Admin Alert | Loss Leader | `Critical` |

---

## 4. THE "DRAFT SAFEGUARD" (Anti-Theft)
**Objective:** Prevent users from screenshotting high-quality drafts and filing a dispute.

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

## 5. THE "DIGITAL TWIN" SUBSCRIPTION
**Objective:** Turn one-off "Digital Person" sales into recurring revenue (MRR).

### Economic Model
* **Product:** "Digital Twin Hosting"
* **Cost:** 5 Credits / Month (deducted from Membership or Credit Balance).
* **Feature:** If credits run out, the Twin goes "Dormant" (Storage only, no interactive API access).

---

## 6. THE "IMMERSION LAYER" (Text & Audio)
**Objective:** Sell "Story" and "Voice" not as generic text products, but as "Soul" for the visual assets.

### A. The Interactive Narrative Wizard (Option 2)
**Logic:** Instead of a blank text box, the user plays a "Game" to define the story.
**Flow:**
1.  **User Selects:** "Create Backstory for this Image."
2.  **System Asks (Interaction 1):** "What is the genre?" (Sci-Fi / Fantasy / Noir).
3.  **System Asks (Interaction 2):** "What is their greatest fear?" (User types or selects).
4.  **System Asks (Interaction 3):** "Who is their enemy?"
5.  **Output:** System generates a `Lore_Bible.txt` which serves as the "Script" for future Video products.

### B. Audio/Voice Skins
**Logic:** Audio files are treated as "Assets" linked to a Character DNA.
**UI Requirement:** Files tab must include a **Waveform Player** (not just a download link) to preview Voice Skins.

---

## MACHINE-READABLE SUMMARY
~~~json
{
  "pack_id": "feature_pack_master_v1.1",
  "features": [
    "physical_logistics", 
    "asset_dna", 
    "dynamic_bidding", 
    "draft_safeguard", 
    "digital_twin_sub",
    "interactive_narrative_wizard",
    "audio_waveform_player"
  ],
  "complexity": "Very High",
  "requires_db_migration": true
}
~~~
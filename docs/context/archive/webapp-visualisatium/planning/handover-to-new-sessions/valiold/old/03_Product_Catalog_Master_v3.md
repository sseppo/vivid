> **Status:** historical — family F7; superseded by `docs/context/sources/03-product-catalog.md`. Kept for provenance; not current. Source: `Visualisatium/planning/handover-to-new-sessions/valiold/old/03_Product_Catalog_Master_v3.md`. 

# PRODUCT CATALOG: SAGAS & SMART COLLECTIONS (v2.1)
**Philosophy:** "Don't buy a file. Start a Journey."
**Mechanism:** Sequential Locking (Step 2 unlocks only after Step 1 is approved).

## 1. THE SAGA ENGINE (The "Saga" Products)
**Definition:** Multi-step workflows where the User builds towards a Grand Finale.
**Concept:** "Don't buy a file. Start a Journey."
**Mechanic:** Sequential locking. Step 2 unlocks only after Step 1 is approved. Chapter Locking" and "Context Inheritance" (Step 5 knows what Step 1 generated).

### A. The Classics (Complex Workflows)
1.  **The Visual Biography (Memorial)**
    * **Target:** Families / Memorials.
    * **Flow (5 Steps):**
        1.  **The Interview (Text):** AI interviews user about Grandpa's life (20 questions). Output: `Lore_Bible`.
        2.  **The Restoration (Image):** User uploads 10 old photos. AI restores/colorizes them.
        3.  **The Script (Text):** AI writes a 3-minute narration script based on the Interview.
        4.  **The Voice (Audio):** User uploads 30s of Grandpa's audio. AI trains Voice Model.
        5.  **The Production (Video):** System combines Photos + Script + Voice + Ken Burns Effects.
    * **Price:** €150 (Bundle).
	* **Margin:** Cost ~€5.00 (mostly compute). Profit ~€145.

2.  **The Family Fable (Physical Book)**
    * **Concept:** Narrative generation -> Physical Output.
	* **The Hook:** "Turn your family history into a bedtime story."
	* **Target:** Family members.
    * **Flow:**
        1.  **Input:** 10 Family Photos + Narrative Wizard answers.
		      * Narrative: Answers from the "Interactive Wizard" (e.g. Grandpa was brave, loved fishing).
        2.  **Story Gen:** LLM generates a 10-page story: "The Adventures of Captain Grandpa."
        3.  **Art Gen:** ControlNet stylizes photos into "Watercolor Illustrations."
    * **Output:** Physical Hardcover Book (via Print Partner).

3.  **The Time Traveler’s Diary**
    * **Flow:** User Selfie -> Select Eras (Viking, 1920s, Cyberpunk) -> AI Generates Photos + First-Person Diary Entries.
    * **Output:** Digital History Album (PDF).

4.  **The Corporate Origin (B2B)**
    * **Target:** SMBs / Startups.
    * **Flow:** Similar to Biography, but focused on Company History. Founder Photos + Logo + Mission Statement -> Script -> B-Roll Generation -> Avatar Video.
    * **Output / Upsell:** 60s Brand Documentary + "Social Media Cut" (30s vertical).

5.  **"The Bedtime Story"** (Text -> Image -> Print)
    * Steps: 10 Chapters.
    * Goal: Physical Hardcover Book.

6.  **"The Origin Story Video"** (Image -> Video -> Edit)
    * Step 1: Generate Character.
    * Step 2: Generate 5 Key Scenes.
    * Step 3: Generate Voiceover.
    * Goal: 3-Minute 4K Video.

7.  **"The Digital Twin Evolution"** (Data -> Training -> Chat)
    * Step 1: Upload Photos.
    * Step 2: Train Model.
    * Step 3: Define Personality.
    * Goal: Interactive "Digital Person" on Tablet.

8. **The "Sports Highlight" Reel:** Upload raw game footage -> AI Detection (Goals/Baskets) -> Slow Mo + Music Sync -> Result: ESPN-style clip.
9. **The "Cosplay Crafter":** Upload character reference -> AI generates sewing patterns & foam templates -> Result: Printable PDF Blueprints.
10. **The "Genealogy Map":** Upload GEDCOM (Family Tree file) -> AI generates a visual stylized Family Tree Poster (Lord of the Rings style map).
11. **The "Podcast Visualizer":** Upload Audio -> AI generates animated talking heads/puppets summarizing the podcast -> Result: Viral Short Video.
12. **The "Vacation Itinerary" Book:** Upload travel photos + map data -> AI generates a "Travel Guide" of where you went (text + maps) -> Result: Physical Book.


### B. The "Fun & Social" Sagas
13.  **The Pet’s Secret Life**
    * **Flow:** Upload Pet Photo -> Select Personality (Spy, Chef) -> Generate 3D Character (Asset DNA) -> Animate 5 Scenarios.
    * **Result:** "Day in the Life" Reel.

14.  **The Child's Imagination Toy**
    * **Flow:** Upload child's bad drawing (Doodle) -> AI renders as "Pixar-style 3D Character" -> Character Dances (Video).
    * **Note:** distinct from "Pet's Secret Life" as input is a *Drawing*, not a Photo.

15.  **The Love Story Trailer**
    * **Flow:** Upload Couple Photos -> Input "How we met" -> AI Scripts Trailer -> AI Generates Voiceover -> AI Generates Scenes.
    * **Result:** Cinematic Movie Trailer.

16.  **The WhatsApp Time Capsule**
    * **Target:** Gen Z / Couples.
    * **Flow:**
      1.  **Data Dump:** Upload `_chat.txt` (WhatsApp export).
      2.  **Analysis:** AI finds "Key Dates" and "Quotes".
      3.  **Output:** A "Digital Scrapbook" PDF with photos and text bubbles arranged chronologically.

17.  **The RPG Campaign Sourcebook**
    * **Flow:** DM Pastes Notes -> AI Identifies NPCs -> Generates Consistent Portraits -> Generates Maps -> Result: Campaign PDF.

18. **THE "MUSIC VIDEO DIRECTOR"**
    * **Target:** Musicians / Rappers.
    * **Flow (4 Steps):**
      1.  **The Vibe (Audio Analysis):** User uploads track. AI analyzes BPM and Mood.
      2.  **The Treatment (Text):** AI suggests 3 visual themes (e.g., "Neon Tokyo", "Desert Drifter").
      3.  **The Rush (Video Gen):** AI generates 20 x 4-second clips synced to the beat.
      4.  **The Edit (Assembly):** User drags clips onto timeline. System stitches them.
    * **Constraint:** No lip-sync (too expensive/hard). Focus on "Vibe/B-Roll".

19. **THE "CHILD'S IMAGINATION" TOY**
    * **Target:** Parents.
    * **Flow (2 Steps):**
      1.  **The Doodle (Input):** Upload child's bad drawing of a monster.
      2.  **The Realization (Image):** AI renders it as a "Pixar-style 3D Character".
      3.  **The Action (Video):** The 3D Character dances.

20. **THE "MEDITATION GUIDE" (Personalized)**
    * **Target:** Wellness.
    * **Flow:**
      1.  **State:** User describes current stress ("Anxious about work").
      2.  **Visual:** AI generates a calming loop (Waterfall).
      3.  **Audio:** AI generates a guided meditation script tailored to "Work Anxiety" and reads it in a soothing voice.

21.  **The Career Simulator (Kids)**
    * **Flow:** Upload Child’s Photo -> Select Careers (Mars Colonist, President) -> Generate "Future Self" Portraits -> Result: Inspirational Poster.

### C. The Utility Sagas
22. **The Culinary Legacy**
    * **Flow:** Upload Grandma’s Handwritten Recipe -> Transcription -> AI Visualizes dish -> AI Animates steam/sizzle.
    * **Result:** Motion Recipe Card.

23. **The Dream Home Architect**
    * **Target:** Renovators / Decorators.
    * **Flow (3 Steps):**
      1.  **The Scan (Image):** User uploads photo of empty room.
      2.  **The Style Match (Selection):** User picks "Scandi-Minimalist" + "Cyberpunk".
      3.  **The Visualization (3D/Image):** AI generates 4 variations of the furnished room.
      4.  **Bonus Step (Commerce):** "Where to buy this chair?" (Link to generic items).
    * **Tech:** ControlNet (Depth Map) is critical here to keep walls in place.
	* **Result:** Renovation Preview.

---

## 2. PRICING LOGIC: "THE COMMITMENT DISCOUNT" OF SAGAS
* **Pay-As-You-Go:** User pays €15 per Chapter. Total = €150.
* **The Sagas Pass:** User pays €100 upfront. Unlocks all 10 chapters.
* **The "Hook" Discount:** "Complete the first 3 chapters, get the 4th free."

---

## 3. SMART COLLECTIONS & ORCHESTRATION
**Context:** Transforming "Bundles" into "Dependency-Driven Workflows".
Unlike competitors who sell generic bundles of credits, we sell **"Production Pipelines"** (Dependency Graphs).
**The Problem:** Buying a "Wedding Collection" usually just gives a user 50 blank image slots. It’s overwhelming.
**The Vivid Solution:** Template-Driven Orchestration.

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
**Strategy:** We treat these "Recipes" as **Micro-Products** or Unlockables.

### The "Narrative Glue" (Context Inheritance)
* **The Problem:** In a Collection, Image 5 doesn't know about Image 1.
* **The Sagas Fix:** The System maintains a `Saga Context`.
    * *Step 1 Output:* "Hero wears a red scarf." -> Saved to Context.
    * *Step 5 Input:* User prompts "Hero climbing a mountain."
    * *System Injection:* Automatically adds "(wearing a red scarf)" to the prompt to ensure continuity.

### Dashboard View: "The Collection Canvas"
Instead of a list, the User sees a **Timeline View**.
* **Left:** Source Files.
* **Middle:** Processing Nodes (Visualizing the AI working).
* **Right:** Outputs.

### TECHNICAL LOGIC: THE DEPENDENCY GRAPH
**Database Requirement:** There could be a `collection_templates` table that defines needed relationships.

---

## 4. PRODUCT EXPANSION: THE IMMERSION SUITE

### A. "The Voice Keeper" (Audio Product)
**Concept:** Audio Styling / Voice Cloning.
* **The Hook:** "Don't just watch the video. Hear him tell the story."
* **Input:** User uploads >5 minutes of audio (VHS rip, voicemail, cassette).
* **Processing:** System trains a `Voice_Model` (RVC/LoRA).
* **Usage:**
    * **User:** Types a script (or uses the Narrative Wizard).
    * **Output:** The video narration is generated in the *relative's* voice.
* **Safety:** "Consent Protocol" required (User must certify rights to the voice).
* **Use Case:** Narrating the "Visual Biography" in the relative's own voice.

### B. "The Digital Seance" (Interactive Product)
**Concept:** A conversational interface with the `Digital_Person`.
* **The Hook:** "Ask your history questions."
* **Input:** The `Lore_Bible.txt` + `Voice_Model`.
* **Mechanism:** RAG (Retrieval Augmented Generation). The AI answers based mainly *only* on the uploaded documents/letters (if selected, the AI can access internet too).
* **UX:** It is not a chat window. It is a "Video Call" interface where the Digital Person (Animated Head) speaks the answers.

### C. "The Time Capsule" (Hybrid Product)
**Concept:** Delayed Delivery.
* **Logic:** User creates a video/message *now*.
* **Trigger:** "Deliver to [Email] on [Date: 2030-01-01]."
* **Business Value:** Long-term retention. Keeps the account active.
* **Gamification:** +200 pts to "Preservation Score".

---

## 5. MASTER CATEGORY TREE

1.  **Memories (`memories`)**
    * Enhancement (Photo) [`IMG-MEM`]
    * Holiday Trip [`IMG-HOL`]
    * Video Memories [`VID-MEM`]
2.  **History (`history`)**
    * Moment in History [`IMG-HIST`]
    * Person into History [`IMG-HIST-PERS`]
3.  **Fun & Social (`fun`)**
    * Person in Situation [`IMG-FUN-SIT`]
    * Face Swap & Caricature [`IMG-FUN-FACE`]
    * Music & Video [`VID-FUN`]
4.  **Company (`company`)**
    * Corporate Origin Doc (Video).
	* Mascot & Character [`IMG-BIZ-CHAR`]
	* Advertisement [`IMG-BIZ-AD`]
5. **Specials (`specials`)**
    * Physical Output [`PHY-OUT`].
	* Collections [`COL-SET`]
	
---

## 6. UTILITY ASSETS (Single-Step Tools)
High-volume, low-friction tools. "Vending Machine" usage.

1.	The Ink Architect: Tattoo design visualization on user skin.
2.	The Interior Stager: Furnishing empty room photos (Real Estate).
3.	The Fashion Try-On: Dressing user avatars in specific styles.
4.	The Dream Visualizer: Text-to-Surrealist Art interpretation.
5.	The Colorizer Pro: Historical accuracy colorization of B&W photos.
6.	The Living Painting: Subtle loop motion (cinemagraphs) from static photo.
7.	The Logo Reveal: 3D elemental animation (Fire/Water/Tech) of static logos.
8.	The Reaction GIF: Stylized Anime/Cartoon character acting out user emotion.
9.	The Music Visualizer: Audio-reactive geometry pulsing to BPM.
10.	The Quote Reel: Kinetic typography video for social media.

---

## 7. PHYSICAL SPECIALS (The Phygital Layer)
Partners selected via Deep Research.

1.	3D Printed Full-Color Sandstone/PolyJet figurine. For example: The Forever Pet. Possible Partner: i.materialise, Belgium (Send .obj Use PolyJet (Multicolor+)) 
2.	The Lithophane Lightbox: 3D printed white box revealing high-res photo when lit. Possible Partner: Manubim, Hungary (Send via email parser).
3.	The Vinyl Single / Record: Lathe-cut 7" record of AI-generated music or restored voice. Possible Partner: Dr. Dub, Austria (Send Audio Link + Cover Art).
4.	Jewelry / The Soundwave Ring: Laser-engraved waveform on silver/gold jewelry. Possible Partner: OwnPrint, Netherlands (Send Vector Waveform).
5.	Video Brochure: 7" Acrylic Video Screen ("The Infinite Frame") pre-loaded with video art. Possible Partner: Media Plant, UK (**Trade/FTP**. Send MP4. **Must use IOSS** for EU.).
6.	The NFC Stone: Polymer/Resin object with embedded NFC chip linking to a Saga ("Memory Stone"). Possible Partner: NFC-Tag-Shop, Germany (Send Link to write to chip).

---

## 8. THE "BOOK" PRICING MODEL (By Arc, Not Chapter)
Standardizing the text product.

* **Product:** "The Novella"
* **Measure:** **Narrative Beats** (Key Plot Points), not Chapters.
* **Input:** User provides 5 Beats (e.g., "Meet Hero", "Find Map", "Kill Dragon").
* **AI Output:** System expands each Beat into ~1,000 words.
* **Price:** **Flat Fee** (up to 20k words).
    * *Cost Check:* 20k words = ~30k tokens. Cost ~€0.10 on Claude Haiku/Sonnet.
    * *Why so cheap?* Because text is cheap. The value is in the *structure*.

> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Odyssey_Product_Line.md`. 

# PRODUCT SPEC: THE ODYSSEY ENGINE (Sequential Journeys)
**Concept:** Multi-step product lines where the User builds towards a Grand Finale.
**Differentiation:**
* **Collections:** "A bucket of items." (Static)
* **Odysseys:** "A path with a destination." (Dynamic, Sequential)

## 1. THE STRUCTURE
An Odyssey is a "Meta-Product" containing `n` Steps.
* **Example:** "The Children's Adventure Book" (10 Steps + 1 Print).
* **Step Logic:** Step 2 cannot be started until Step 1 is "Locked".

### The Dashboard View
* **Visual:** A Roadmap / Level Select screen (like a game).
* **Status Indicators:**
    * 🟢 *Chapter 1: The Call to Adventure* (Completed)
    * 🟡 *Chapter 2: The Meeting* (In Progress)
    * 🔒 *Chapter 3: The Journey* (Locked)

## 2. PRICING MECHANIC: "THE COMMITMENT DISCOUNT"
* **Pay-As-You-Go:** User pays €15 per Chapter. Total = €150.
* **The Odyssey Pass:** User pays €100 upfront. Unlocks all 10 chapters.
* **The "Hook" Discount:** "Complete the first 3 chapters, get the 4th free."

## 3. THE "NARRATIVE GLUE" (Context Inheritance)
* **The Problem:** In a Collection, Image 5 doesn't know about Image 1.
* **The Odyssey Fix:** The System maintains a `Odyssey_Context.json`.
    * *Step 1 Output:* "Hero wears a red scarf." -> Saved to Context.
    * *Step 5 Input:* User prompts "Hero climbing a mountain."
    * *System Injection:* Automatically adds "(wearing a red scarf)" to the prompt to ensure continuity.

## 4. EXAMPLE ODYSSEYS
1.  **"The Bedtime Story"** (Text -> Image -> Print)
    * Steps: 10 Chapters.
    * Goal: Physical Hardcover Book.
2.  **"The Origin Story Video"** (Image -> Video -> Edit)
    * Step 1: Generate Character.
    * Step 2: Generate 5 Key Scenes.
    * Step 3: Generate Voiceover.
    * Goal: 3-Minute 4K Video.
3.  **"The Digital Twin Evolution"** (Data -> Training -> Chat)
    * Step 1: Upload Photos.
    * Step 2: Train Model.
    * Step 3: Define Personality.
    * Goal: Interactive "Digital Person" on Tablet.
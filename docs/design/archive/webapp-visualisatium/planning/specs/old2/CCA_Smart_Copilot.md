> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/CCA_Smart_Copilot.md`. 

# SPECIFICATION: CCA "SMART ESTIMATE" COPILOT
**Reference:** `Updates.docx` (Smart Estimate), `Content Creator Agent.docx`.
**Role:** Tool, not Agent. The CCA is the Pilot; this is the Nav Computer.

## 1. THE PROBLEM
Calculating manhours for "Make a funny video from my 50 photos" is inconsistent. Some CCAs quote 1 hour, others 5.

## 2. THE "COPILOT" LOGIC
**Trigger:** CCA opens a generic "Offer Request".

### Step 1: Input Analysis
The Engine scans the User's Request (Text + Attachments).
* **File Count:** "50 Images detected."
* **Keywords:** "Funny" (Low complexity) vs "Sync to beat" (High complexity).
* **Historical Data:** "Average time for 50-image slideshow is 1.2 hours."

### Step 2: The Template Suggestion
The UI presents a "Draft Offer" card to the CCA.
> **🤖 Copilot Suggestion:**
> * **Task:** Dynamic Slideshow
> * **Est. Hours:** 1.5 Manhours (€112.50)
> * **Reasoning:** High file count, simple transition request.
> * **Recommended Text:** "I can create a dynamic slideshow with beat-sync. Based on 50 photos, this will take approx 1.5 hours."

### Step 3: CCA Control (The Human Loop)
* **Accept:** CCA clicks "Use this Quote".
* **Adjust:** CCA changes 1.5 -> 2.0 (slider).
* **Reject:** CCA writes custom offer from scratch.

## 3. DATABASE: LISTS INTEGRATION
**Note:** As requested, the `Lists` (Styles, Recipes) are stored in the DB.
* **Copilot Access:** The Copilot checks if the user referenced a specific *List Item* (e.g., "Style: Noir"). If "Noir" is tagged as `complexity: high` in the DB, the Copilot increases the hour estimate automatically.
> **Status:** current edition (F5, newest). A fuller earlier edition is at `docs/context/sources/01-master-vision-fullest-edition.md`; later revisions lost content to Gem context limits. Reconciliation is Architect work. Source: `vivid/.chat_attachments/start/01_Master_Vision_VIVID_strategyVision_v4.md`. 

# VIVID: THE MASTER ARCHITECTURE
> **Version:** 5.0 (Consolidated)
> **Date:** 2026-01-21 (from JSON)
> **Phase:** Planning Phase 3 (Inventory & Schema)

## 1. STRATEGIC DEFINITIONS & LOGIC

### The "Sagas" vs "Collection" Distinction
**Concept of Sagas:** Multi-step product lines where the User builds towards a Grand Finale.
* **Collections:** "A collection of items, but not necessarily guided generation or the items there does not necessarily depend on othere ones in same collection".
* **Sagas:** "A path with a destination." (Dynamic, Sequential).
    * **Mechanism:** Sequential Locking. Step 2 physically cannot exist until Step 1 is completed.
    * **Context Inheritance:** The System maintains a `Asset DNA`. If Step 1 establishes "Hero wears a red scarf," Step 5 automatically injects "(wearing a red scarf)" into the prompt.

#### THE STRUCTURE Of Sagas
An Saga is a "Meta-Product" containing `n` Steps.
* **Example:** "The Children's Adventure Book" (10 Steps + 1 Print).
* **Step Logic:** Step 2 cannot be started until Step 1 is "Locked".


## 2. BUSINESS LOGIC & ROUTING

### A. The "Traffic Light" API Router
Objective: We do not rely on a single provider. We route based on Cost, Quality, and Safety.

* **🟢 GREEN LANE (Public APIs - Low Cost/High Volume):
    * **Content:** Landscapes, Pets, Generic Avatars, Architecture, Safe Sagas.
    * **Routing / Infrastructure:**
	  **Public APIx:** For example:
        * *Text:* e.g. Google Gemini 1.5 Flash (Fast/Cheap) or similar.
        *  *Image:* e.g. Flux.1 [schnell] via Fal.ai / Replicate or similar.
        *  *Video:* e.g. Luma Ray 2 or Runway Gen-3 Turbo (via API) or similars.
* **🟡 YELLOW LANE (The "Sanctuary Server" - Control Layer):
    * **Content:** Swimwear (e.g. Family photos), Artistic Nudity (e.g. Classical), Parody, Satire, "Edgy" Humor, Complex LoRAs (e.g. Official Partners).
    * **Routing / Infrastructure:** 
	  **Self-Hosted Infrastructure / Sacntuary Server:** For example:
        * **Hardware:** e.g. NVIDIA RTX 4090 (24GB VRAM) or A6000 (48GB).
        * **Software:** ComfyUI backend running Uncensored Flux.1 [dev] and Hunyuan Video.
		* **Safety Layer:** A Local **Classifier** (e.g., **NudeNet** or **Hive Moderation**) runs *before* generation to catch Red Lane prompts, and after generation to verify output safety.
    * **Logic:** If content is legal but violates OpenAI/Google "Puritan" filters, it goes here.
* **🔴 RED LANE (The Block - Safety Layer):
    * **Content:** CSAM, Non-Consensual Deepfakes, Extreme Gore, Hate Speech.
    * **Action:** HARD BLOCK at the prompt level. User Account Flagged.
	* ** Routing / Infrastructure:**
	  **Blocked:** Request rejected. User flagged.
    * **Tool:** Local Classifier (NudeNet or Hive) running on the Sanctuary Server.








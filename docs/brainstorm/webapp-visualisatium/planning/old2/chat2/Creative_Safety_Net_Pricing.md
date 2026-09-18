# BUSINESS LOGIC: THE CREATIVE SAFETY NET (Re-Rolls)
**Objective:** Eliminate the "Fear of Bad Results" without bankrupting the GPU budget.

## 1. THE "PREVIEW PROTOCOL"
We stop selling "1 Image". We sell "The Result".

### The Flow
1.  **Input:** User prompts "Cyberpunk Cat".
2.  **Payment:** User commits **1 Credit (€5)**.
3.  **Generation:** System generates **4 Low-Res Previews** (512x512 or Turbo models).
4.  **Selection:**
    * **Scenario A (Success):** User likes Image #2. Clicks "Finalize". System upscales to 4K. Transaction Complete.
    * **Scenario B (Fail):** User hates all 4.
        * Action: User clicks "Refine / Re-Roll".
        * Cost: **0.2 Credits (€1)**. (The "Computing Fee").
        * Logic: We acknowledge the first attempt failed, so we subsidize the second attempt.

### Why this works?
* **User Psychology:** They see the initial €5 as the "Setup Fee". The €1 re-roll feels cheap ("I'm just tweaking").
* **Economics:** Turbo/Preview models are 10x cheaper than High-Res Upscaling. We don't lose money on previews.

## 2. THE "CCA RESCUE" BUTTON
* **Trigger:** If a User re-rolls 3 times (Spent €5 + €1 + €1 + €1) and is still unhappy.
* **System Action:** Pop-up appears.
    * *"Having trouble? Let a Pro handle it."*
    * *Offer:* "Convert your spent credits (€8 total) into a discount on a CCA Job."
* **Result:** Converts a frustrated user into a High-Value Service customer.

## 3. THE "FREE TWEAK" WINDOW
* **Policy:** After "Finalizing" an image, the User has **15 Minutes** to request *minor* variations (e.g., "Remove the hat") for free.
* **Technical Limit:** Uses `img2img` with high strength. Max 2 free tweaks.
# BUSINESS LOGIC: PRICING & MARGIN PROTECTION
**Objective:** Ensure "Cheap" user pricing covers "Expensive" API costs.

## 1. THE "RE-ROLL" TIERS
We cannot apply the same Re-Roll logic to Video as Image.

| Media Type | Cost to Us (Est) | Standard Price | Re-Roll Price | Re-Roll Margin |
| :--- | :--- | :--- | :--- | :--- |
| **Image** | €0.04 | €5.00 | **€1.00** | ✅ Safe (96%) |
| **Text** | €0.01 | €5.00 | **Free** (Max 3) | ✅ Safe (99%) |
| **Audio** | €0.05 | €10.00 | **€1.00** | ✅ Safe (95%) |
| **Video** | €0.50 - €1.50 | €25.00 | **€5.00** | ⚠️ High Risk |

**Video Rule:** Video Re-Rolls are NOT heavily discounted.
* *Why?* Generating a video consumes massive GPU.
* *Compromise:* "Preview Mode". Generate a low-res GIF (Cost €0.10). If user likes it, they pay full price to "Render 4K".

## 2. THE "BOOK" PRICING MODEL (By Arc, Not Chapter)
Standardizing the text product.

* **Product:** "The Novella"
* **Measure:** **Narrative Beats** (Key Plot Points).
* **Input:** User provides 5 Beats (e.g., "Meet Hero", "Find Map", "Kill Dragon").
* **AI Output:** System expands each Beat into ~1,000 words.
* **Price:** **€25 Flat Fee** (up to 20k words).
    * *Cost Check:* 20k words = ~30k tokens. Cost ~€0.10 on Claude Haiku/Sonnet.
    * *Profit:* €24.90.
    * *Why so cheap?* Because text is cheap. The value is in the *structure*.

## 3. THE "API ARBITRAGE" SYSTEM
**Logic:** The system dynamically selects the cheapest provider that meets the quality threshold.
* **Task:** "Generate Anime Girl".
    * *Option A (Midjourney):* $0.08 (Best Quality).
    * *Option B (Flux.1 Dev):* $0.03 (Good Quality).
* **Router Logic:**
    * If User = "Pro Member" -> Use Midjourney.
    * If User = "Free/Standard" -> Use Flux.1.
> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/UI_Input_Specs.md`. 

# UI Component Specs (Phase 3)

## 1. THE "SPLIT CHOICE" INPUT (Hybrid)
**Use Case:** "Select from List OR Free Text".

### A. The "Fast-Track" Toggle
*   **Placement:** Prominent switch at the top of the Input Card.
*   **Label:** "I know what I want (Skip Lists)".
*   **Interaction:**
    *   **OFF (Default):** Shows the Visual Grid (Easy List).
    *   **ON:** Collapses Grid. Expands "Custom Description" Textarea with focus.

### B. The Visual Grid
1.  **Visual:** Grid of Cards (Images/Icons).
2.  **The Anchor:** Last card is **"Custom / Write Your Own"**.
3.  **Behavior:** Clicking a card selects it. Clicking "Custom" acts like the Fast-Track toggle.
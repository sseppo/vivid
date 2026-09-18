> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Dashboard_Updates_v1.0.md`. 

# DASHBOARD GAP ANALYSIS & SPECIFICATION
**Reference Documents:** Admin v3.5, CCA 0.5, User 0.5

## 1. ADMIN DASHBOARD UPDATES
### A. Logistics Monitor
* **New Module:** `Global_Shipment_Tracker`
* **Data Source:** Aggregated carrier Webhooks.
* **Columns:** `Tracking ID`, `User`, `Partner`, `Status` (In_Transit, Delayed, Delivered).
* **Alert:** Red flag if `Status` = "Delayed" > 5 days.

### B. Asset DNA Editor
* **New View:** `Project_Deep_Dive` -> `Asset_DNA_Tab`
* **Function:** Admin can manually edit the JSON (e.g., change a Seed) if a user complains about character consistency.

## 2. CCA DASHBOARD UPDATES
### A. Surge Pricing UI
* **Update to:** `Job_Queue_Card`
* **Visual:** If `surge_multiplier > 1.0`, display a **Fire Icon** and the boosted price in Green.
* **Tooltip:** "This job pays +10% due to wait time."

### B. Asset DNA Injection
* **Update to:** `Active_Workbench`
* **Action:** "Import DNA" button.
* **Behavior:** Dragging a previous Order ID into the workbench auto-fills the Prompts, Negative Prompts, and Seed fields.

### C. Narrative Wizard Viewer
* **New Panel:** `Story_Context`
* **Function:** If the User used the "Interactive Wizard," the CCA sees the generated answers (Fear, Enemy, Genre) in a side panel to guide their video creation.

## 3. USER DASHBOARD UPDATES
### A. Physical Items Tab
* **New Tab:** `My_Vault` -> `Physical_Source_Items`
* **List:** Shows all VHS/Photos sent to partners.
* **Actions:** "Track Shipment", "Report Lost".

### B. The Twin Control Center
* **New Widget:** `Digital_Twin_Status`
* **Visual:** A "Battery" icon showing remaining Credits for hosting.
* **Toggle:** "Active" (Chat enabled) vs "Dormant" (Storage only).

### C. The Narrative Interface
* **New Modal:** `Wizard_Overlay`
* **UX:** A stepped, game-like interface (Step 1 of 3...) appearing when "Add Backstory" is clicked.
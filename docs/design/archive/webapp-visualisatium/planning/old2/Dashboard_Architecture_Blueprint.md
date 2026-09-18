> **Status:** historical — family F4; superseded by `docs/design/dashboards/dashboards-blueprint.md`. Kept for provenance; not current. Source: `Visualisatium/planning/old2/Dashboard_Architecture_Blueprint.md`. 

### **Artifact 2: Phase 2 Synthesis (Dashboard Architecture)**
**Filename:** `planning/Dashboard_Architecture_Blueprint.md`
**Purpose:** We synthesized the `Admin`, `User`, and `CCA` docs into a unified architectural view (One App, Three Masks).

```markdown```
# Dashboard Architecture Blueprint
**Phase:** 2 (The Interface)
**Tech Stack:** TanStack Start, Supabase Realtime, Clerk, ThorVG, Capacitor.
**Sources:** Admin v3.5, User 0.5, CCA 0.5

## 1. THE UNIFIED NAVIGATION SHELL (One App, Three Masks)
Instead of separate deployments, we use a **Role-Based Masking Strategy**.
*   **Global State:** `useActivePersonaStore` (Zustand).
*   **Modes:** `Buyer` (Default) | `CCA` (Role-Gated) | `Admin` (Role-Gated).
*   **The Switch:** A top-bar "Privilege Selector" (visible only to elevated users) that toggles the UI Mask instantly.

## 2. ADMIN DASHBOARD: "MISSION CONTROL"
**Core Philosophy:** Forensic Observability & "Ghosting".

### Key Modules
*   **The "Forensic Hover":**
    *   *Problem:* Admin tables are too dense.
    *   *Solution:* Hovering over a status (e.g., "Failed") triggers a popover with the *exact* technical error (e.g., "Stripe: do_not_honor").
    *   *Tech:* Radix UI Popover + TanStack Query (Prefetch on hover).
*   **The "Shadowing" Engine (Clerk Integration):**
    *   *Logic:* Admin clicks "Shadow User" (Troubleshoot).
    *   *Safety Protocol:*
        1.  **Ghost Mode (Default):** Admin sees what User sees (Read-Only). No alerts.
        2.  **Intervention Mode:** Admin toggles "Take Control".
            *   **CCA View:** "⚠️ Admin is modifying this job." (Inputs Locked).
            *   **Logging:** Action recorded in `admin_shadow_logs`.
    *   *Restriction:* Admin **CANNOT** view Biometric Vault (ID/TIN) data in Shadow Mode.

## 3. CCA DASHBOARD: "THE COCKPIT"
**Core Philosophy:** Flow, Urgency & Conflict Prevention.

### Key Modules
*   **The "Soft Lock" (Conflict Prevention):**
    *   *Scenario:* Admin and CCA open the same job to edit.
    *   *Tech:* **Supabase Presence**.
    *   *UI:* If Admin is editing, CCA sees a "Locked by HQ" badge.
*   **Gamified Urgency:**
    *   *Visual:* Timeline bars change color (Green -> Yellow -> Red) as the deadline approaches.
*   **Delta Pattern Drafting:**
    *   *Tech:* **Zustand** stores local edits. **TanStack Query** syncs to server only on "Save".
    *   *Benefit:* No work lost if mobile network drops.

## 4. USER DASHBOARD: "THE VAULT"
**Core Philosophy:** Genealogy & Ownership.

### Key Modules
*   **The Genealogy Explorer:**
    *   *Concept:* "Make the rabbit white" -> "Now put it on the moon".
    *   *UI:* A "Tree View" (using Motion for React) showing the lineage: `Original -> Variant A -> Variant A.1`.
    *   *Action:* User can click any past node to "Branch Off" a new order.
*   **R2 Integration:**
    *   All thumbnails served via **Cloudflare R2** (Zero Egress Fees) to save money on "Gallery Browsing".
*   **Partner Pipeline Meter:**
    *   Visual tracker for Physical Goods: `Waiting Delivery` -> `Processing at Partner` -> `At Delivery`.

## 5. MACHINE-READABLE SUMMARY (JSON)
```json
{
  "blueprint_version": "1.0",
  "architecture_style": "single_spa_multi_mask",
  "key_components": [
    "Forensic Hover (Admin)",
    "Soft Lock Presence (CCA)",
    "Genealogy Tree (User)"
  ],
  "tech_dependencies": ["Supabase Realtime", "Clerk Shadowing", "ThorVG"]
}
```

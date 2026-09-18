> **Status:** historical — family F8; superseded by `docs/architecture/tech-stack-master.md`. Kept for provenance; not current. Source: `Visualisatium/planning/04_Tech_Architecture_Master_v2.md`. 

# VISUALISATIUM TECH ARCHITECTURE (v6.0 - REDACTED)
> **Status:** LOGIC & PATTERNS ONLY (Stack detailed in `04_TECH_STACK_MASTER` and `05_TECH_STACK_DESCRIPTIONS`)
> **Environment:** Antigravity / VS Code

## 1. DASHBOARD ARCHITECTURE (One App, Three Masks)
> **Context:** Architectural Strategy for Role Management.

Instead of separate deployments, we use a **Role-Based Masking Strategy**.
* **Global State:** `useActivePersonaStore` (Zustand).
* **Modes:**
    1.  `Buyer / User` (Default).
    2.  `CCA` (Role-Gated Agent View).
    3.  `Admin` (Role-Gated Mission Control).
* **The Switch:** A top-bar "Privilege Selector" (visible only to elevated users).

### Key Dashboard Modules
* **Admin:** "Forensic Hover" (See raw error logs on hover), "Shadowing" (Supabase Presence).
* **User:** "Genealogy Explorer" (Tree View of asset history), "Partner Pipeline Meter".
* **CCA:** "Gamified Urgency" (Time-based color coding), "Delta Pattern Drafting" (Local saves).

## 2. THE "DRAFT SAFEGUARD" PROTOCOL (Anti-Theft)
**Objective:** Prevent screenshot disputes.
1.  **Interceptor:** Edge Function intercepts all CCA uploads tagged as `draft`.
2.  **Processing:** Applies a 'PREVIEW' watermark overlay server-side.
3.  **Delivery:** Chat window receives only the watermarked URL.
4.  **Unlock:** Original file URL is only released to the 'Files' tab after `status: completed`.

## 3. SERVER FUNCTION SPECIFICATION (RPC)
> **Context:** Business Logic Implementation details (not just tool listing).

* `createOrderFn(cartData)`: Calculates Price -> Checks Credits -> Creates `orders` row.
* `reviveOrderFn(oldOrderId)`: (**Phoenix Protocol**) Clones abandoned order data -> Creates new Order ID -> Notifies CCA.
* `submitDepositFn(orderId)`: Generates Stripe Invoice for 1-Hour Deposit.
* `claimJobFn(jobId)`: Atomic check `status == 'in_queue'` -> Sets `cca_id` -> Sets `in_progress`.
* `smartTagFn(inputText)`: Analysis text input -> Returns matching List IDs (e.g., "Van Gogh" -> `style_id_123`).
* `submitAssetsFn(jobId, r2Paths[])`: Updates `assets` table -> Sets `is_watermarked = true`.
* `toggleSoftLockFn(jobId, isLocked)`: Broadcasts Supabase Realtime event for "Admin Shadowing".
* `fetchGenealogyTreeFn(assetId)`: Returns recursive parent/child tree for the Comparison Slider.

## 4. ARCHITECTURAL PHILOSOPHY
> **Context:** General building guidelines.

We do not build "Webviews". We build "Native Apps using Web Tech".
* **Graphics Optimization:** Render Lottie animations on Android GPU (ThorVG) rather than standard web canvas.
* **Offline First:** Cache large datasets (Style Lists, Chat History) to SQLite so the app feels instant even in dead zones.
* **Zero Egress:** High-volume image/video delivery must route through R2 to avoid bankruptcy risks.
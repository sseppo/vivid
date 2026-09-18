> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/old2/Server_Functions_Spec.md`. 

# Server Function Specification (RPC)
**Framework:** TanStack Start
**Auth:** Clerk (Backend) / Zod (Validation)

## 1. ORDER & WORKFLOW
*   `createOrderFn(cartData)`: Calculates Price -> Checks Credits -> Creates `orders` row.
*   `reviveOrderFn(oldOrderId)`: (Phoenix Protocol) Clones abandoned order data -> Creates new Order ID -> Notifies CCA.
*   `submitDepositFn(orderId)`: Generates Stripe Invoice for 1-Hour Deposit.

## 2. CCA WORKBENCH
*   `claimJobFn(jobId)`: Atomic check `status == 'in_queue'` -> Sets `cca_id` -> Sets status `in_progress`.
*   `submitAssetsFn(jobId, r2Paths[])`: Updates `assets` table -> Sets `is_watermarked = true`.
*   `toggleSoftLockFn(jobId, isLocked)`: Broadcasts Supabase Realtime event for "Admin Shadowing".

## 3. DATA & AI
*   `smartTagFn(inputText)`: Analysis text input -> Returns matching List IDs (e.g., "Van Gogh" -> `style_id_123`).
*   `fetchGenealogyTreeFn(assetId)`: Returns recursive parent/child tree for the Comparison Slider.
> **Status:** historical — family F8; superseded by `docs/architecture/tech-stack-master.md`. Kept for provenance; not current. Source: `Visualisatium/planning/handover-to-new-sessions/combined-v1.8/old/04_Tech_Architecture_Master.md`. 

# VISUALISATIUM TECH ARCHITECTURE (v5.3)
> **Status:** DEFINITIVE / SYNTHESIZED
> **Environment:** Antigravity / VS Code
> **Source:** Consolidated from Master Stack, Blueprints, and JSON Config.

## 1. THE APPLICATION FRAMEWORK
> **Source:** `Tech_Stack_Master-combined.md` (Section 1) & `project_status-combined.json`

### Core Shell
* **Framework:** **[TanStack Start](https://tanstack.com/start)**.
    * *Role:* Full-stack SSR. Replaces Next.js.
    * *Key Feature:* **Server Functions** allow us to write backend logic directly in component files (RPC), eliminating a separate API layer.
* **Server Engine:** **Nitro Engine**.
    * *Deployment:* **Netlify Edge** (V8 Isolates).
    * *Performance:* Sub-50ms cold starts.
* **Routing:** **[TanStack Router](https://tanstack.com/router)**.
    * *Feature:* "Optimistic Pre-fetching". Data loads *before* the user clicks, based on hover/intent.
* **State Management:**
    * **Server State:** TanStack Query.
    * **Client Logic:** Zustand (for UI state like "Modal Open").

## 2. DATA & INFRASTRUCTURE LAYER
> **Source:** `Tech_Stack_Master-combined.md` (Section 2) & `project_status-combined.json` (`backend_infra`)

### Storage Strategy
* **Transactional DB:** **Supabase (PostgreSQL + RBAC) + JSONB**.
    * *Role:* User profiles, Orders, Credits, Relational data.
    * *Config:* Row Level Security (RLS) enabled.
* **Data Lake (Cold):** **Apache Iceberg**.
    * *Role:* Long-term analytics, historical User Logs, and "Big Data" queries that would slow down Postgres.
* **Object Storage (Media):** **Cloudflare R2**.
    * *Role:* Hosting the high-res Assets (`/assets`).
    * *Benefit:* **Zero Egress Fees** (Critical for high-volume image/video delivery).
* **Transient Storage:** **Netlify Blobs**.
    * *Role:* Temporary upload buffers, Session Heatmaps, and generated "Preview GIFs" that expire after 24h.

## 3. MOBILE & NATIVE OPTIMIZATION
> **Source:** `Tech_Stack_Master-combined.md` (Section 3)

We do not build "Webviews". We build "Native Apps using Web Tech".
* **Container:** **[Capacitor](https://capacitorjs.com)** (iOS/Android).
* **Graphics Engine:** **[ThorVG](https://www.thorvg.org) + Motion for React**.
    * *Role:* C++ Vector Graphics Engine.
    * *Performance:* Renders Lottie animations **80% faster** on Android GPU than standard web canvas.
* **Offline Persistence:** **Capacitor SQLite**.
    * *Role:* Caches large datasets (e.g., the "Styles" list, "Chat History") so the app feels instant even in dead zones.
* **Native Bridge:** **Rust JNI**.
    * *Role:* Handles high-frequency events (Haptics, Vibration patterns) via custom Android native code to avoid JS bridge lag.
* **DevOps:** **Ionic Appflow**.
    * *Feature:* **Live Updates** (Hot Code Push). We can patch JS logic instantly without waiting for Apple App Store review.

## 4. IDENTITY & COMMERCIAL SECURITY
> **Source:** `Tech_Stack_Master-combined.md` (Section 4) & `project_status-combined.json` (`auth_commercial`)

* **Authentication:** **[Clerk](https://clerk.com)**.
    * *Integration:* Synced to Supabase via Custom Claims (JWT).
    * *Feature:* **"Shadowing Mode"**. Allows Admin to log in *as* a User (or view what they see) for support.
* **Secure Enclave:** **Ionic Identity Vault**.
    * *Requirement:* CCAs store their Tax IDs and Biometric Tokens in the device's **Hardware Secure Enclave** (not LocalStorage).
* **Payments:** **Stripe Connect**.
    * *Role:* Handles the "Marketplace Split" (User pays €100 -> Platform keeps €25 -> Partner gets €75).
* **Tax Compliance:** **Stripe Tax**.
    * *Role:* Automated VAT calculation (Finnish ALV 25.5%) and EU VIES validation.
* **Communications:** **Resend**.
    * *Role:* Transactional Email API (Magic Links, Receipts, "Job Finished" alerts).

## 5. AI & INTERNATIONALIZATION
> **Source:** `Tech_Stack_Master-combined.md` (Section 5) & `project_status-combined.json` (`ai_intl`)

* **LLM Inference:** **OpenAI (GPT-4o) + TanStack AI SDK**.
    * *Use Case:* Narrative Generation, "Lore Bible" creation, Metadata tagging.
* **Translation:** **DeepL API**.
    * *Role:* High-fidelity translation of UI strings and *Generated Stories* (English <-> Finnish).
* **i18n Framework:** **react-i18next**.
    * *Config:* Client-side localization.
* **Validation:** **Zod + Standard Schema**.
    * *Role:* Type-safe validation of AI outputs (ensuring the LLM returns valid JSON).

## 6. DASHBOARD ARCHITECTURE (One App, Three Masks)
> **Source:** `Dashboard_Architecture_Blueprint.md`

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

## 7. The "Draft Safeguard" Protocol (Anti-Theft)
**Objective:** Prevent screenshot disputes.
1.  **Interceptor:** Edge Function intercepts all CCA uploads tagged as `draft`.
2.  **Processing:** Applies a 'PREVIEW' watermark overlay server-side.
3.  **Delivery:** Chat window receives only the watermarked URL.
4.  **Unlock:** Original file URL is only released to the 'Files' tab after `status: completed`.

## 8. SERVER FUNCTION SPECIFICATION (RPC)
> **Source:** `Server_Functions_Spec.md`

* `createOrderFn(cartData)`: Calculates Price -> Checks Credits -> Creates `orders` row.
* `reviveOrderFn(oldOrderId)`: (**Phoenix Protocol**) Clones abandoned order data -> Creates new Order ID -> Notifies CCA.
* `submitDepositFn(orderId)`: Generates Stripe Invoice for 1-Hour Deposit.
* `claimJobFn(jobId)`: Atomic check `status == 'in_queue'` -> Sets `cca_id` -> Sets `in_progress`.
* `smartTagFn(inputText)`: Analysis text input -> Returns matching List IDs (e.g., "Van Gogh" -> `style_id_123`).
*   `submitAssetsFn(jobId, r2Paths[])`: Updates `assets` table -> Sets `is_watermarked = true`.
*   `toggleSoftLockFn(jobId, isLocked)`: Broadcasts Supabase Realtime event for "Admin Shadowing".
*   `fetchGenealogyTreeFn(assetId)`: Returns recursive parent/child tree for the Comparison Slider.

## 9. TECHNICAL STACK (2026 STANDARD)
* Frontend: TanStack Start (Streaming SSR) + ThorVG (Vector Graphics).
* Mobile: Capacitor + Ionic Identity Vault (Biometrics).
* Backend: Supabase (Database + Realtime).
* Auth: Clerk (Identity) synced to Supabase via Custom Claims.
* Edge Logic: Netlify Edge Functions (V8 Isolates).
* Infrastructure: RunPod (Serverless GPU) -> Scaling to Hetzner (Dedicated GPU in Finland).


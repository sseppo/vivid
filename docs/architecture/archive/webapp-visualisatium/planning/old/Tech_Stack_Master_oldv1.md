> **Status:** historical — family F14 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old/Tech_Stack_Master_oldv1.md`. 

# Visualisatium Technology Stack: The Golden Record (v3.1)
**Status:** DEFINITIVE
**Environment:** Antigravity / VS Code

## 1. THE CORE ENGINE (Frontend & Routing)
*   **Framework:** **TanStack Start** (Full-stack SSR).
*   **Routing:** **TanStack Router** (Type-safe URL management).
*   **State (Server):** **TanStack Query v5**.
*   **State (Client):** **Zustand**.
*   **Validation:** **Zod** + **Standard Schema**.

## 2. THE DATA LAYER (Backend)
*   **Database:** **Supabase** (PostgreSQL 17).
    *   *Feature:* **JSONB** for Dynamic Forms.
*   **Asset Storage:** **Cloudflare R2**.
    *   *Why:* **Zero Egress Fees.** Critical for a media-heavy platform.
*   **Transient Storage:** **Netlify Blobs**.
    *   *Role:* Storing temporary large JSON objects (e.g., Job Metrics, Heatmaps) to spare the DB.
*   **Archives:** **Apache Iceberg (REST Catalog)**.
*   **Compute:** **Netlify Edge Functions**.

## 3. DEPLOYMENT & OPS
*   **Web Deployment:** **Netlify**.
    *   *Config:* `nitro: netlify-edge` preset (V8 Isolates).
*   **Mobile CI/CD:** **Ionic Appflow**.
    *   *Role:* Live Deployments (Hot Code Push) & Cloud Builds for Android/iOS binaries.

## 4. MOBILE & NATIVE
*   **Container:** **Capacitor 7**.
*   **Persistence:** **Capacitor SQLite**.
    *   *Role:* High-performance local storage for offline lists and large result histories.
*   **Optimization:** **Rust JNI Bridge** (Android).
*   **Rendering:** **ThorVG** + **Motion for React**.
*   **Secrets:** **Ionic Identity Vault** (Secure Enclave).

## 5. IDENTITY & COMMERCIAL
*   **Auth:** **Clerk** (Shadowing enabled).
*   **Payments:** **Stripe Connect** + **Stripe Tax** (Finnish ALV 25.5%).
*   **Emails:** **Resend**.

## 6. AI INTEGRATION
*   **Translation:** **DeepL API** + **TanStack AI SDK**.
*   **Generation:** **OpenAI** (GPT-5 / Sora / Veo Adapters).
> **Status:** historical — family F8; superseded by `docs/architecture/tech-stack-master.md`. Kept for provenance; not current. Source: `Visualisatium/planning/04_TECH_STACK_MASTER_v8.0.md`. 

# VISUALISATIUM TECH ARCHITECTURE (v8.0)
> **Status:** DEFINITIVE / LINKED
> **Environment:** Antigravity / VS Code

## VIEW 1: THE QUICK LIST (Inventory)
*   **Framework:** [TanStack Start](https://tanstack.com/start), [TanStack Router](https://tanstack.com/router), [Nitro Engine](https://nitro.unjs.io)
*   **State Management:** [TanStack Query](https://tanstack.com/query), [Zustand](https://github.com/pmndrs/zustand)
*   **Mobile Container:** [Capacitor](https://capacitorjs.com), [Capacitor SQLite](https://github.com/capacitor-community/sqlite), [Rust JNI Bridge](https://jni.rs)
*   **Graphics/UI:** [ThorVG](https://www.thorvg.org), [Motion for React](https://motion.dev), [Shadcn/UI](https://ui.shadcn.com), [Tailwind CSS](https://tailwindcss.com)
*   **Backend & Auth:** [Supabase](https://supabase.com) (PostgreSQL + Realtime), [Clerk](https://clerk.com), [Ionic Identity Vault](https://ionic.io/docs/identity-vault)
*   **Storage:** [Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/) (Media), [Apache Iceberg](https://iceberg.apache.org) (Analytics), [Netlify Blobs](https://docs.netlify.com/platform/blobs/) (Transient)
*   **Serverless:** [Netlify Edge Functions](https://docs.netlify.com/edge-functions/overview/)
*   **Payments:** [Stripe Connect](https://stripe.com/connect), [Stripe Tax](https://stripe.com/tax)
*   **Media Assembly:** [Shotstack API](https://shotstack.io) (Video Stitching), [ElevenLabs](https://elevenlabs.io) (Long-form Audio)
*   **AI & Intl:** [OpenAI](https://openai.com), [DeepL](https://www.deepl.com), [TanStack AI SDK](https://tanstack.com/ai), [react-i18next](https://react.i18next.com)

---

## VIEW 2: DETAILED SPECIFICATION

### 1. CORE APPLICATION FRAMEWORK
*   **[TanStack Start](https://tanstack.com/start):** Full-stack SSR framework. Uses **Server Functions** (RPC) to colocate backend logic with UI components.
*   **[Nitro Engine](https://nitro.unjs.io):** The underlying server engine, configured for **Netlify Edge** to ensure sub-50ms cold starts globally.
*   **[TanStack Router](https://tanstack.com/router):** Handles type-safe routing with "Optimistic Pre-fetching" (loading data on hover).
*   **[TanStack Query](https://tanstack.com/query):** Manages Server State (Caching, Deduping, Optimistic Updates). Replaces "TanStack DB" logic via **Supabase Realtime**.
*   **[Zustand](https://github.com/pmndrs/zustand):** Manages Client-only UI state (Sidebar toggle, Active Persona mask).

### 2. DATA INFRASTRUCTURE
*   **[Supabase (PostgreSQL)](https://supabase.com):** The Single Source of Truth for transactional data. Secured via RLS.
*   **[Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/):** Object storage for high-res Assets. Selected for **Zero Egress Fees** (vital for video delivery).
*   **[Apache Iceberg](https://iceberg.apache.org):** Cold storage for historical analytics (Year-End summaries) to keep Postgres light.
*   **[Netlify Blobs](https://docs.netlify.com/platform/blobs/):** Transient storage for temporary uploads and generated session heatmaps.

### 3. MOBILE & NATIVE OPTIMIZATION
*   **[Capacitor](https://capacitorjs.com):** Wraps the web app into a Native Android/iOS binary.
*   **[ThorVG](https://www.thorvg.org):** A lightweight C++ Vector Graphics engine. Renders Lottie animations and icons on the GPU.
*   **[Capacitor SQLite](https://github.com/capacitor-community/sqlite):** Persists large datasets (e.g., the "Styles" list, Chat History) locally for offline capability.
*   **Rust JNI Bridge:** Handles high-frequency native events (Haptics) to avoid JavaScript bridge latency.

### 4. IDENTITY & COMMERCIAL SECURITY
*   **[Clerk](https://clerk.com):** Handles Authentication. Synced to Supabase via Custom JWT Claims. Features **"Shadowing Mode"** (Admin logs in as User).
*   **[Ionic Identity Vault](https://ionic.io/docs/identity-vault):** Stores sensitive CCA data (Tax IDs, Biometrics) in the device's **Hardware Secure Enclave**.
*   **[Stripe Connect](https://stripe.com/connect):** Manages the marketplace split (Platform vs. CCA).
*   **[Stripe Tax](https://stripe.com/tax):** Automates VAT calculation (Finnish ALV 25.5%) and B2B VIES validation.

### 5. AI & INTERNATIONALIZATION
*   **[react-i18next](https://react.i18next.com):** Handles the Multilingual Shell.
*   **[DeepL API](https://www.deepl.com):** Handles high-fidelity dynamic content translation (Finnish <-> English).
*   **[TanStack AI SDK](https://tanstack.com/ai):** Standardized adapter for streaming LLM responses (OpenAI) to the client.
> **Status:** historical — family F14 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old3/Tech_Stack_Master-combined.md`. 

# Visualisatium Technology Stack: The Golden Record (Consolidated v5.1)
**Status:** DEFINITIVE / SYNTHESIZED
**Environment:** Antigravity / VS Code

---

## VIEW 1: THE QUICK LIST (Package Inventory)
* **Framework:** TanStack Start, TanStack Router, Nitro Engine
* **State:** TanStack Query v5, Zustand, TanStack DB (Experimental)
* **Mobile:** Capacitor 7, ThorVG, Capacitor SQLite, Rust JNI Bridge
* **Backend:** Supabase (PG17), Cloudflare R2, Netlify Blobs, Apache Iceberg, Neon Serverless Driver
* **Auth/Ops:** Clerk, Ionic Identity Vault, Ionic Appflow, Netlify
* **Payments:** Stripe Connect, Stripe Tax
* **AI/Intl:** OpenAI, DeepL, TanStack AI SDK, react-i18next, Standard Schema
* **UI:** React 19, Motion for React, Shadcn/UI, Tailwind CSS v4, Zod

---

## VIEW 2: DETAILED SPECIFICATION

### 1. CORE APPLICATION FRAMEWORK
* **[TanStack Start](https://tanstack.com/start):** Full-stack SSR framework using Server Functions.
* **[Nitro Engine](https://nitro.unjs.io):** Underlying server engine, configured with `netlify-edge` (V8 Isolates).
* **[TanStack Router](https://tanstack.com/router):** Type-safe routing with "Optimistic" pre-fetching.
* **[TanStack Query (v5)](https://tanstack.com/query):** Manages Server State (Orders, Invoices).
* **[Zustand](https://github.com/pmndrs/zustand):** Manages Client-only UI state (Sidebar, Persona Store).
* **[Standard Schema](https://github.com/standard-schema/standard-schema) + Zod:** Universal validation interface.

### 2. DATA INFRASTRUCTURE
* **[Supabase (PostgreSQL 17)](https://supabase.com):** Primary DB with **RBAC** via RLS Policies. Use **JSONB** for Dynamic Forms.
* **[TanStack DB (0.5+)](https://tanstack.com/db):** Used for differential dataflow (Experimental).
* **[Neon Serverless Driver](https://neon.tech):** Used within Edge Functions to query Postgres via HTTP/WebSockets.
* **[Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/):** Asset Storage. **Zero Egress Fees** (Critical for media).
* **[Apache Iceberg](https://iceberg.apache.org):** Archival Storage. Moves "Sold Items" logs here after 1 year to maintain PG17 performance.
* **[Netlify Blobs](https://docs.netlify.com/platform/blobs/):** Transient storage for large metrics/heatmaps.

### 3. MOBILE & NATIVE OPTIMIZATION
* **[Capacitor 7](https://capacitorjs.com):** Native Container (iOS/Android).
* **[ThorVG](https://www.thorvg.org):** C++ Vector Graphics Engine (Renders icons/Lottie 80% faster on Android GPU).
* **[Capacitor SQLite](https://github.com/capacitor-community/sqlite):** Offline Persistence for large datasets (Styles, Artists).
* **Rust JNI Bridge:** Custom Android native code for high-frequency events (Haptics) without Webview lag.
* **[Ionic Appflow](https://ionic.io/appflow):** Mobile CI/CD and **Live Updates** (Hot Code Push).

### 4. IDENTITY & COMMERCIAL
* **[Clerk](https://clerk.com):** Auth. Features **Shadowing** (Admin logs in as User).
* **[Ionic Identity Vault](https://ionic.io/docs/identity-vault):** Stores CCA Tax IDs/Biometrics in device's **Hardware Secure Enclave**.
* **[Stripe Connect](https://stripe.com/connect):** Marketplace payments.
* **[Stripe Tax](https://stripe.com/tax):** Auto-calculates Finnish ALV (25.5%) via VIES validation.

### 5. AI & INTERNATIONALIZATION
* **[react-i18next](https://react.i18next.com):** Multilingual Shell.
* **[TanStack AI SDK](https://tanstack.com/ai):** Provider-agnostic adapter for AI streaming.
* **[DeepL API](https://www.deepl.com):** High-quality translation.
* **[OpenAI](https://openai.com):** GPT-5 / Sora / Veo Adapters.
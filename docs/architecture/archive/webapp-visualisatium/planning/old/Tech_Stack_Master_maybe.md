> **Status:** historical — family F14 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old/Tech_Stack_Master_maybe.md`. 

# Visualisatium Technology Stack: The Golden Record (v5.0)
**Status:** DEFINITIVE
**Environment:** Antigravity / VS Code

---

## VIEW 1: THE QUICK LIST (Package Inventory)
*   **Framework:** TanStack Start, TanStack Router, Nitro Engine
*   **State:** TanStack Query v5, Zustand, TanStack DB (Experimental)
*   **Mobile:** Capacitor 7, ThorVG, Capacitor SQLite, Rust JNI Bridge
*   **Backend:** Supabase (PG17), Cloudflare R2, Netlify Blobs, Apache Iceberg, Neon Serverless Driver
*   **Auth/Ops:** Clerk, Ionic Identity Vault, Ionic Appflow, Netlify
*   **Payments:** Stripe Connect, Stripe Tax
*   **AI/Intl:** OpenAI, DeepL, TanStack AI SDK, react-i18next, Standard Schema
*   **UI:** React 19, Motion for React, Shadcn/UI, Tailwind CSS v4

---

## VIEW 2: DETAILED SPECIFICATION

### 1. CORE APPLICATION FRAMEWORK
*   **[TanStack Start](https://tanstack.com/start):** Full-stack SSR.
*   **[Nitro Engine](https://nitro.unjs.io):** The underlying server engine (configured with `netlify-edge`).
*   **[TanStack Router](https://tanstack.com/router):** Type-safe routing with "Optimistic" pre-fetching.
*   **[TanStack Query (v5)](https://tanstack.com/query):** Server State management.
*   **[Zustand](https://github.com/pmndrs/zustand):** Client-only UI state (Sidebar, Personas).
*   **[Standard Schema](https://github.com/standard-schema/standard-schema):** Universal validation interface.

### 2. DATA INFRASTRUCTURE
*   **[Supabase (PostgreSQL 17)](https://supabase.com):** Primary DB with RBAC (Row Level Security).
*   **[TanStack DB (0.5+)](https://tanstack.com/db):** Used for differential dataflow.
*   **[Neon Serverless Driver](https://neon.tech):** Used within Edge Functions to query Postgres via HTTP/WebSockets.
*   **[Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/):** Zero-egress asset storage.
*   **[Netlify Blobs](https://docs.netlify.com/platform/blobs/):** Transient storage for large metrics/heatmaps.

### 3. MOBILE & NATIVE
*   **[Capacitor 7](https://capacitorjs.com):** Native Runtime.
*   **[ThorVG](https://www.thorvg.org):** C++ Vector Engine (80% faster icons/Lottie).
*   **[Capacitor SQLite](https://github.com/capacitor-community/sqlite):** Offline persistence for large datasets.
*   **Rust JNI Bridge:** Custom Android bridge for high-performance haptics.
*   **[Ionic Appflow](https://ionic.io/appflow):** Mobile CI/CD and Live Updates.

### 4. IDENTITY & COMMERCIAL
*   **[Clerk](https://clerk.com):** Auth with "Shadowing".
*   **[Ionic Identity Vault](https://ionic.io/docs/identity-vault):** Biometric storage for CCA secrets.
*   **[Stripe Tax](https://stripe.com/tax):** Automated Finnish ALV (25.5%).

### 5. AI & INTERNATIONALIZATION
*   **[react-i18next](https://react.i18next.com):** Multilingual shell.
*   **[TanStack AI SDK](https://tanstack.com/ai):** Provider-agnostic adapter for AI streaming.
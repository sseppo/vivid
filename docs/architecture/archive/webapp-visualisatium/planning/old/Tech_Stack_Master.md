> **Status:** historical — family F14 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/planning/old/Tech_Stack_Master.md`. 

# Visualisatium Technology Stack: The Golden Record (v4.0)
**Status:** DEFINITIVE
**Environment:** Antigravity / VS Code

---

## VIEW 1: THE QUICK LIST (Package Inventory)
*   **Framework:** TanStack Start, TanStack Router
*   **State:** TanStack Query v5, Zustand
*   **Mobile:** Capacitor 7, ThorVG, Capacitor SQLite, Rust JNI Bridge
*   **Backend:** Supabase (PG17), Cloudflare R2, Netlify Blobs, Apache Iceberg
*   **Auth/Ops:** Clerk, Ionic Identity Vault, Ionic Appflow, Netlify
*   **Payments:** Stripe Connect, Stripe Tax
*   **AI/Intl:** OpenAI, DeepL, TanStack AI SDK, react-i18next
*   **UI:** React 19, Motion for React, Shadcn/UI, Tailwind CSS v4

---

## VIEW 2: DETAILED SPECIFICATION

### 1. CORE APPLICATION FRAMEWORK
*   **[TanStack Start](https://tanstack.com/start):**
    *   *Usage:* Full-stack SSR framework. Eliminates separate API backend by using Server Functions.
*   **[TanStack Router](https://tanstack.com/router):**
    *   *Usage:* Type-safe routing with "Optimistic" pre-fetching.
*   **[TanStack Query (v5)](https://tanstack.com/query):**
    *   *Usage:* Manages Server State (Orders, Invoices).
*   **[Zustand](https://github.com/pmndrs/zustand):**
    *   *Usage:* Manages Client-only state (Sidebar toggle, Persona Store).
*   **[react-i18next](https://react.i18next.com):**
    *   *Usage:* Multilingual Shell.
    *   *Strategy:* Uses `filesystem-backend` for SSR performance and `chained-backend` for mobile offline support.

### 2. DATA INFRASTRUCTURE
*   **[Supabase (PostgreSQL 17)](https://supabase.com):**
    *   *Usage:* Primary DB.
    *   *Feature:* **RBAC** (Role-Based Access Control) via RLS Policies.
*   **[Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/):**
    *   *Usage:* Asset Storage.
    *   *Why:* **Zero Egress Fees** (Vital for media-heavy apps).
*   **[Apache Iceberg](https://iceberg.apache.org):**
    *   *Usage:* Archival. Moves "Sold Items" logs here after 1 year to keep Postgres fast.
*   **[Netlify Blobs](https://docs.netlify.com/platform/blobs/):**
    *   *Usage:* Transient storage for large Heatmaps/Metrics that don't need SQL storage.

### 3. MOBILE & NATIVE OPTIMIZATION
*   **[Capacitor 7](https://capacitorjs.com):**
    *   *Usage:* Native Container (iOS/Android).
*   **[ThorVG](https://www.thorvg.org):**
    *   *Usage:* Vector Graphics Engine. Renders icons/Lottie files 80% faster on Android GPU than JS.
*   **[Capacitor SQLite](https://github.com/capacitor-community/sqlite):**
    *   *Usage:* Offline Persistence. Caches large lists (Styles, Artists) locally.
*   **Rust JNI Bridge:**
    *   *Usage:* Custom Android native code to handle high-frequency events (Haptics) without Webview lag.
*   **[Ionic Appflow](https://ionic.io/appflow):**
    *   *Usage:* Mobile CI/CD and **Live Updates** (Hot Code Push).

### 4. IDENTITY, SECURITY & COMMERCIAL
*   **[Clerk](https://clerk.com):**
    *   *Usage:* Auth. Features **Shadowing** (Admin logs in as User).
*   **[Ionic Identity Vault](https://ionic.io/docs/identity-vault):**
    *   *Usage:* Stores CCA Tax IDs/Biometrics in the device's **Hardware Secure Enclave**.
*   **[Stripe Tax](https://stripe.com/tax):**
    *   *Usage:* Auto-calculates Finnish ALV (25.5%) via VIES validation.
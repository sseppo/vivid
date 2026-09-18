> **Status:** current canonical as at dormancy (2026-04-19). Pre-repository planning text, not yet verified against the code by the Architect. Source: `Visualisatium/planning/05_TECH_STACK_DESCRIPTIONS_v2.2.md`. 

# TECH STACK USAGE & IMPLEMENTATION MAP (v1.0)
**Purpose:** Defines the specific architectural role of each component.

## 1. CORE FRAMEWORK (The Engine)
* **TanStack Start:** Used as the primary "Shell". It handles Server-Side Rendering (SSR) for the Landing Page and SEO. It replaces the need for a separate Express/Node API by using **Server Functions** to execute backend logic directly from UI components. Type-safe server functions, and seamless hydration to prevent UI "flicker". 
* **Nitro Engine:** The underlying engine that powers TanStack Start. It is configured with the `netlify_edge` preset to ensure the application runs on V8 Isolates (sub-50ms startup) rather than cold-start-prone Lambda containers.
* **TanStack Router:** Manages navigation. Used for Type-safe routing with "Optimistic Pre-fetching" (loading data *before* the user clicks, based on hover/intent) to make the web app feel like a native app. It also uses isomorphic authentication guards (beforeLoad) and built-in data prefetching.

## 2. DATA & BACKEND (The Nervous System)
* **Supabase (PostgreSQL):** Primary DB with **RBAC** via RLS (Row Level Security) Policies. Holds User Profiles, Order History, and Ledger Transactions. Use **JSONB** for Dynamic Forms. It ensures ACID compliance, utilizing JSONB for localization storage.
* **TanStack DB:** Used to implement "Query-Driven Sync" for real-time differential dataflow. It handles predicate pushdown synchronization to handle massive collections with sub-millisecond updates.
* **Neon Serverless Driver:** Used *inside* Netlify Edge Functions to query Supabase via WebSockets/HTTP. This prevents the "Connection Limit" errors common with standard Postgres clients in serverless environments.
* **Cloudflare R2:** The "Vault". Stores high-resolution user assets (Images, Videos). Selected for **Zero Egress Fees**, allowing users to browse their galleries without bankrupting the platform.
* **Netlify Blobs:** "Transient" storage. Used to store temporary session data, Admin Dashboard heatmaps, generated "Preview GIFs" that expire after 24h, and hourly metric snapshots that don't need to be in the main database.´Handles "Big Data" queries that would otherwise slow down Postgres.
* **Apache Iceberg:** "Cold" storage / Data Lake. After 1 year, Order Logs are moved here via REST Catalog to keep the main Postgres database fast.
* **RunPod (Serverless GPU):** On-demand GPU infrastructure for burstable AI rendering tasks.
* **Hetzner (Dedicated GPU):** Finland-based dedicated infrastructure for scaling heavy compute tasks (cost-optimized).

## 3. MOBILE & NATIVE (The Bridge)
* **Capacitor:** Native Container (iOS/Android). Wraps the React web app into `.apk` and `.ipa` binaries. The mobile bridge providing a "Web-Native" experience in a WKWebView/System WebView, optimized to eliminate perceived "jank". 
* **Ionic Appflow:** Handles the CI/CD pipeline for mobile. Used for **Live Updates** (Hot Code Push), allowing us to fix bugs in the app without waiting for App Store review.
* **Rust JNI Bridge:** A custom native module for Android. Used to handle high-frequency events (like haptic feedback patterns) without the latency of the JavaScript bridge.
* **ThorVG:** A C++ vector graphics engine. Used to render Lottie animations (icons, loading states) on the mobile GPU, using 80% less memory and rendering **80% faster** than standard web canvas on Android.
* **Capacitor SQLite:** Local database on the user's phone. Caches the "Style Lists" and "Chat History" so the app works offline. Recommended persistent store for large result histories to prevent OS data eviction and improve offline synchronization.
* **@capacitor/preferences:** Used for lightweight persistence of active roles, small datasets, and auth tokens.

## 4. STATE MANAGEMENT (The Brain)
* **TanStack Query:** Manages **Server State** (Orders, Invoices). It handles caching, deduping requests, and "Optimistic Updates" (onMutate, showing a "Like" instantly before the server confirms) for a native-feel interface.
* **TanStack Store:** Reactive state management used specifically for complex "Workbench" updates and high-frequency shadowing updates without triggering parent re-renders.
* **Zustand:** Manages **Client State** (UI Only). Handles the "Persona Switcher" (toggling between User/CCA views) and Sidebar state and local "Delta Pattern" drafts, and UI states like "Modal Open". It persists this state to the device using `@capacitor/preferences`.

## 5. IDENTITY & SECURITY (The Gatekeeper)
* **Clerk:** Auth. Handles Login/Signup. Critical feature: **"Shadowing"**, which allows an Admin to log in *as* a specific user (or view what they see) to troubleshoot issues. Authentication provider utilizing stateless JWT verification (synced to Supabase via Custom Claims) and custom metadata to manage multi-persona role switching (Buyer/CCA/Partner/Admin).
* **Ionic Identity Vault:** A biometric security layer. Used specifically for **Content Creator Agents (CCAs)** to store their Tax IDs and Secrets/Biometric Tokens in the phone's Hardware Secure Enclave (FaceID/Fingerprint), ensuring these never leak (not stored in LocalStorage).
* **Zod & Standard Schema:** The "Universal Validator". Ensures that data coming from the API matches exactly what the Frontend expects. Enforcing data integrity across Clerk metadata, Supabase tables, and server functions. Allows TanStack Form/Conform to consume validators from multiple libraries (Zod, Valibot, ArkType) without diverging types.

## 6. AI & MEDIA (The Factory)
* **TanStack AI SDK:** A unified adapter for AI. It manages the streaming connection to OpenAI, handling the complex logic of "Tool Calling" (e.g., allowing the AI to query the database) and Suomi-specific translation logic.
* **Shotstack:** The "Stitching Engine". Used when a user orders a "Saga". It takes 100 short AI clips and programmatically edits them into one long video file.
* **ElevenLabs:** Used for long-form narration (Audiobooks). Selected for its 40k character input limit (vs OpenAI's 4k).
* **Creatomate:** Used for generating social media roll-ups and marketing assets from templates.
* **Groq / DeepInfra:** Used for "Invisible AI" tasks like categorizing prompts or generating SEO tags. Selected for extreme speed and low cost.
* **Luma Ray:** Could be used also for video generation.
* **Runway:**  Could be used also for video generation.
* **Flux:**  Could be used also for image generation.
* **Midjorney:**  Could be used also for image generation.

## 7. COMMERCIAL & COMPLIANCE
* **Stripe Connect:** Handles the transactions, credit packs, "Marketplace Split" (taking user money, holding it in Escrow, and paying the CCA).
* **Stripe Tax:** Automatically validates EU VIES IDs and calculates the Finnish VAT (25.5%).
* **Resend & React Email:** Sends transactional emails (Receipts, Magic Links, "Job Finished" alerts). Uses React components to ensure emails look consistent with the app design.

## 8. INTERNATIONALIZATION
* **react-i18next:** Manages the multilingual shell with environment-aware loading strategies (Filesystem for SSR, Chained/Async for Mobile).
* **DeepL API:** Integrated for one-click "Translate All" functionality to localize product data, categories, Generated Stories, and custom asset names instantly (e.g. English <-> Finnish).
* **OpenAI:** GPT / Sora / Veo Adapters.

## 9. UI, Design & Animation
* **Shadcn/UI & Tailwind CSS:** A utility-driven, high-density interface framework adapted for Capacitor WebView with an emphasis on white space and mobile usability.
* **TanStack Table:** Implements advanced multi-column sorting and grouping for complex order and commercial histories.
* **Motion for React & Lottie:** Employed to emulate native navigation transitions and high-fidelity animations within the WebView.
* **EventSplash:** A custom non-blocking view overlay component used to reduce perceived load time by up to 90% during initial data hydration. Link as conceptual reference for mobile performance.

## 10. Deployment
* **Netlify:** Deployment platform utilizing the Nitro engine and Edge network for globally distributed, low-latency execution.

---
## Documentation Links
* [TanStack Start](https://tanstack.com/start)
* [TanStack Router](https://tanstack.com/router)
* [TanStack Store](https://tanstack.com/store)
* [TanStack DB](https://tanstack.com/db)
* [Supabase](https://supabase.com)
* [Cloudflare R2](https://www.cloudflare.com/developer-platform/r2/)
* [TanStack Query](https://tanstack.com/query)
* [Zustand](https://zustand-demo.pmnd.rs/)
* [Zod](https://zod.dev/)
* [Clerk](https://clerk.com/)
* [Capacitor](https://capacitorjs.com)
* [Capacitor SQLite](https://github.com/capacitor-community/sqlite)
* [@capacitor/preferences](https://capacitorjs.com/docs/apis/preferences)
* [Shotstack API](https://shotstack.io)
* [ElevenLabs API](https://elevenlabs.io)
* [Ionic Vault](https://ionic.io/docs/identity-vault)
* [Stripe Tax](https://stripe.com/tax)
* [Resend](https://resend.com/)
* [react-i18next](https://react.i18next.com)
* [DeepL API](https://www.deepl.com/pro-api)
* [OpenAI](https://openai.com)
* [Shadcn/UI](https://ui.shadcn.com/)
* [TanStack Table](https://tanstack.com/table)
* [Motion For React](https://www.framer.com/motion/)
* [EventSplash](https://capacitorjs.com/docs/guides/splash-screens)
* [Netlify](https://www.netlify.com/)
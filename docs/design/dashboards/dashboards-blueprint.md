> **Status:** canonical dashboards **specification** (ruling Q2). The strategic layer above it is `dashboards-ultimate-synthesis.md` + `dashboards-ultimate-mechanics-prd.md` (2026-04-19). A different, 5,679 B document shared this filename; it is archived at `docs/design/archive/webapp-visualisatium/planning/Dashboard/Dashboards_Blueprint.md` (ADR-0001). Source: `vivid/.chat_attachments/start/Dashboards_Blueprint.md`. 

# VIVID DASHBOARDS MASTER RECORD
> **Source of Truth:** Base Dashboard Plans, `planning/Dashboards_Blueprint.md`, `specs/Dashboards_Features_PRD.md`, `planning/Dashboards_Master_Blueprint.md`, `specs/Dashboards_Unified_PRD.md`
> **Version:** 1.0
> **Status:** Synthesized (Zero Data Loss Enforced)

## 1. STRATEGIC VISION & CORE ARCHITECTURE
Dashboards are traditionally administrative dead-zones. In VIVID, the Dashboards *are* the product experience. They are tailored, psychological environments built on a multi-tenant React shell powered by **TanStack Start**, **TanStack Router**, and **Zustand**. A single codebase serves all four personas, utilizing a "Zustand Persona Switcher" to dynamically swap layouts, routing permissions, and API boundaries. 

*   **For the User:** It is a "Digital Studio" and a gamified legacy builder, shifting psychology from "buying a file" to "funding a legacy."
*   **For the CCA:** It is a high-speed, gamified trading terminal optimized for maximum throughput and quality.
*   **For the Partner:** It is a passive-income "Royalty Radar" and streamlined logistics hub.
*   **For the Admin:** It is an "Air Traffic Control" tower with predictive AI and forensic economic observability.

**Constraint Engine:** All pricing, credits, discounts, man-hours, and royalty splits referenced in the UI are fetched dynamically from the `PricingTable` and `pricing-plan-vivid-v2` data stores.

---

## 2. ADMIN DASHBOARD: "MISSION CONTROL / THE AI SENTINEL"

### 2.1 Unified Mission Control (Home Overview)
The landing page provides a high-level summary of the site's health through centralized reporting and real-time data flow, providing forensic observability, proactive AI intervention, and strict economic tracking.

**Features:**
* **Real-Time Stat Streaming:** Employs **Server-Sent Events (SSE)** via TanStack Start to stream KPI updates (e.g., active job counts) without manual refreshes, preventing Netlify timeouts on complex aggregate queries.
* **Differential KPI Stream:** Utilizes **TanStack DB 0.5+** for differential dataflow, enabling sub-millisecond updates to platform metrics as the database changes. Uses TanStack Start (SSE) to stream real-time metrics (Active Jobs, Revenue vs. Virtual Credits, Disputed Orders).
* **KPI Cards (God-Eye View):** High-level summaries of platform health, including platform status and performance metrics.
  * **Active Job Monitors:** Real-time counts of "In Queue" (AI vs. Content Creator Agent (CCA)), "In Progress," and "Action Required" tasks.
  * **Financial Pulse:** Total revenue (with/without VAT), credit sales vs. transaction sales, and active monthly memberships.
  * **Quality Alerts:** Count of active "Disputed" orders and orders nearing the end of their "Review Period".
  * **System Health:** Monitoring of automated AI workflows (Default Content Creator performance) and "Failure" status alerts.
  * **Predictive Queue Load:** KPI cards showing "Estimated Time to Clear" for specific categories based on current CCA activity.
  * **AI Agent Efficiency Tracker:** A card comparing Default Creator (AI) success rates versus manual CCA redos.
  * **Predictive SLA Radar:** An AI-driven KPI card that forecasts queue bottlenecks 48 hours in advance by analyzing "In Queue" volume against active CCA count. Warns: *"SLA breach likely in Video category by Tuesday."*
  * **The GPU Fraud Canary:** A security monitor tracking "Re-Roll" (2 Credit / €0.20) velocity. If an account triggers >20 Re-Rolls in 5 minutes via a script, it flags the account for "Anomalous Compute Drain" and temporarily pauses generation to protect RunPod margins. Edge functions track high-velocity generative abuse.
  * **Real-Time Escrow Heatmap:** Visualizes exactly how much cash is locked in `delivered` status (Review Period) vs `completed` (Available for Payout), essential for cash flow management.
* **Contextual Market Demand Toggle:** Includes a toggle to view "Market Demand" (longest queues) alongside earnings to assist in resource allocation.
* **Forensic KPI Drill-down (Hover Forensics):** KPI cards support **"Hover Forensics,"** revealing a popover with a 5-item list of specific issues (e.g., "3DS2 Stripe Failure" or "Missing Image Attachment") to reduce navigation depth. Hovering over a "Failed" status meter instantly reveals the raw technical error without requiring a click-through.
* **Real-Time Alerts:** Dashboard notifications for new disputes or AI queue failures.
* **Urgency-Based Activity Ribbon:** A dynamic UI section surfacing expiring Review Periods or urgent disputes.

**Technical Considerations:**
* **Streaming SSR for Metrics:** Utilizes TanStack Start’s defaultStreamHandler to deliver the dashboard shell immediately while streaming in financial and job metrics in **\<200ms**.
* **Zustand-Powered Persona Store:** A global state manager that synchronizes the "Active Persona" (Buyer/CCA/Partner/Admin) across mobile and desktop.
* **Privilege Selector:** A top-bar toggle allowing the Super Admin to switch active workspace contexts or test sub-role UX.
* **Optimistic Status Toggles:** Uses TanStack Query’s onMutate to reflect changes immediately before server confirmation for a "native-feel".
* **Manual Hydration Control:** Implements skipHydration: true for the financial store to prevent "flashes of un-synced content" during initial mobile paint in the Capacitor WebView.
* **UI Framework:** Employs **Shadcn/UI and Tailwind CSS** to provide a utility-driven, native-first feel within the Capacitor WebView.
* **TanStack Store Integration:** Implements reactive state management for complex "Workbench" updates without triggering parent re-renders.
* **Netlify Blob Persistent Metrics:** Store hourly snapshots of platform metrics in **Netlify Blobs** for rapid "Daily Comparison" rendering without re-querying the DB.
* **Differential Prefetching:** Use TanStack Router to prefetch deeper KPI data only when the Admin hovers over a Pulse Card for \>300ms.

### 2.2 Order Management & Governance
The central area for handling all customer transactions and order fulfillment.

**Features:**
* **List of all orders:** Filterable by success/failure or other relevant indicators.
* **Virtualized High-Density Lists:** Implements row virtualization for order lists via **TanStack Table v8** to maintain 60 FPS performance when viewing histories exceeding 100+ orders within the Capacitor WebView.
* **Concurrent Edit "Soft Lock":** A visual indicator and WebSocket trigger via **Supabase Realtime** that shows if another Admin is currently "Shadowing" or editing a specific order to prevent state conflicts.
* **Order Details View:** Comprehensive view and modification of all details regarding a specific order.
  * **Order Tracking:** Independent meters for Negotiation/Payment, Production/Fulfillment, Delivery/QA, Exceptions, Partner Status, and Invoicing.
  * **Partner Status Tracking:** Monitoring physical goods through partners (Waiting for Delivery to Processing at Partner).
  * **Invoice Status Monitor:** Tracking generation, sending, and cancellation.
  * **Production Links:** Links to the CCA that has taken the job.
  * **Financial Integration:** Invoice information and links to Invoice Management.
* **"Contact for Offer" Queue Management:** A specific dashboard view for "uncertain" requests (users who contacted for an offer without adding to cart) to prevent cluttering the main paid job queue.
* **Support/CRM Integration:** Link to buyer profile and ability to initiate order-specific chat isolated from other chats with the same buyer.
* **Genealogy Explorer:** A view allowing Admins to trace the "Middle Stage" history of modified assets.
* **Shadowing Playback:** Ability to view a recorded log of CCA actions on the workbench for quality audit.
* **The Shadowing Engine (Clerk Integration):** Allows Admins to securely "Log in as CCA" or "Log in as Buyer." Defaults to "Ghost Mode" (Read-Only). Explicit toggle required for "Intervention Mode" (triggers Soft Lock).
* **Smart Job Re-routing:** One-click redistribution of jobs to the "Default Creator" if a CCA is inactive for \>24h.

**Technical Considerations:**
* **Predicate Pushdown Sync:** Utilizes **TanStack DB 0.5+** to fetch only the precise subset of order metadata required for the active viewport, ensuring sub-millisecond updates.
* **Neon Serverless Driver:** Implemented for querying over HTTP/WebSockets in Netlify Edge Functions, reducing database cold-start latency to \~12ms.
* **Optimistic "Taking a Job":** Uses TanStack Query’s onMutate to immediately reflect status changes when an Admin reassigns a job before server confirmation.
* **Waiting Offer State Distinction:** The dashboard visually distinguishes between standard **"Offer Requested"** (purchase path) and **"Waiting Offer"** (contact for offer) to assist in prioritizing projects.
* **Manual Overrides:** Ability for Admin to manually change any status meter.
* **TanStack Table v8:** Implemented with multi-column sorting and "Optimistic Status" toggles.
* **Status "Pulse" with Hover Forensics:** Meters reveal specific failure reasons (e.g., "Stripe 3DS2 failure") on hover.
* **Progressive Disclosure:** Primary order lists show a **"Consolidated Health Status"**; detailed meters are visible only upon expansion to prevent UI clutter on small screens.
* **Secret Boundary Checks:** All status mutations use updateOrderStatusFn to ensure roles like "Partner" can only mutate the Partner Meter.
* **Secret Key Isolation:** Sensitive keys (Supabase Service Role) must lack the VITE\_ prefix to ensure they never leak to the client bundle.
* **Zod-Validated RLS Injection:** Ensure the Drizzle client strictly validates the user's role before injecting it into the Supabase Postgres session for RLS enforcement.
* **Idempotent Job Transfer:** Use Stripe-style Idempotency Keys for the updateOrderStatusFn to ensure a job is never reassigned twice during a network retry.

### 2.3 Product Management (Catalog Configuration)
A comprehensive no-code interface for managing the digital catalog.

**Features:**
* **Intent-Based Creation:** Utilizes **Conform "Intent" buttons** for adding product variations or "Required Information" fields, allowing list manipulations to function even if the JavaScript bundle is still hydrating.
* **Advanced Filtering & Profiles:** Mechanisms to find products easily and manage detailed profiles, including images, descriptions, and "Required Information" forms.
* **Detailed Product Profile:** Main image, description, sample results, price (with override/discount), social sharing, and "Required Information" forms.
* **Advanced Editor / The Smart Template Editor:** Full CRUD operations; a no-code visual builder to adjust product lists, "Required Data" fields (using Conform intent-based validation), and automated workflows. Creating a product under a category automatically assigns that category.
* **Merchandising:** Checkbox or dropdown system for marking products as featured on the frontpage or specific category pages.
* **AI-Powered "Translate All" Integration:** Side-drawer tool utilizing DeepL (for UI) or GPT-5 (for marketing copy) to auto-fill JSONB translation fields instantly.
* **Automation Rules:** Manage "Automate" rules for evolving products (daily/weekly/monthly creations).
* **Commerce Links:** Direct links in the product list/editor to the Commerce section.
* **Variation Configuration:** Set the maximum number of variations a user can request for a specific product.
* **Finnish Morphological Checker:** An AI-powered validation step in the drawer that ensures Finnish product names correctly follow vowel harmony.
* **Product Result Simulation:** A button to trigger a "test prompt" through the Default Creator directly from the editor to see sample results before going live.

**Technical Considerations:**
* **Isomorphic Validation Firewall:** Strictly enforces **Zod validation** within the createServerFn to reject malformed product payloads at the server boundary.
* **Standard Schema Specification:** Implementation allows the Product Form to consume validators from multiple libraries (Zod, Valibot) without diverging types.
* **i18n Localization Drawer:** Side-by-side translation fields for every product name, description, and "Required Information" label.
* **Dynamic Form Builder:** UI to set "Required Information" (OR, AND/OR logic) and attachment rules (e.g., "Many Media," "One Image").
* **Validation Logic:** Uses **Zod and Conform** for complex "Required Data" validation on both client and server.
* **Conditional Layouts:** Automatically hides man-hour estimation fields for automated AI products while making them mandatory for "Offer-based" products.
* **Conform Intent-Based Translation:** Allow the "Translate All" button to be an "Intent" button that triggers a server function to populate the JSONB fields without requiring a client-side state update.
* **Nitro Dynamic Function Lock:** Explicitly mark the product creation server function as dynamic to prevent the Netlify 404 deployment bug.

### 2.4 Category Management
Management of the hierarchical organization of the platform.

**Features:**
* **Dnd Hierarchy Management (Category/Product Dnd Manager):** Implements drag-and-drop for unlimited nested categories using **Motion for React** (v12) to provide hardware-accelerated, native-feel transitions for rearranging the catalog. Integrated with DeepL/OpenAI for 1-click "Translate All" JSONB localization.
* **Category Profiles & Merchandising:** Manage images, sample results, descriptions, and "Featured Products" for category pages.
* **Commerce Links:** Direct links to sales insights pre-filtered for the specific category.
* **Global Drag-to-Reorder:** A unified view to reorder the root category tree for the mobile app navigation shell.

**Technical Considerations:**
* **JSONB Localization Pattern:** Multilingual content stored in JSONB objects to keep database row density low.
* **i18n Localization Drawer:** Side-by-side translation fields for every category name and description.
* **Prisma Recursive CTEs:** Utilize Prisma's stable recursive relation support for fetching the entire hierarchy in a single query.

### 2.5 Commercial Management
Analytics and lists focused on sales performance and historical data.

**Features:**
* **ThorVG Heatmaps:** Employs the **ThorVG engine** to render sales timing heatmaps, ensuring **80% faster rendering** and lower memory usage on low-end mobile hardware.
* **Commerce Analysis:** Filters to identify items never sold or items below a sales threshold.
* **Sold Items List:** Detailed list of all buyers, CCAs, dates, related purchases, parameters used, and sent attachments.
* **Temporal Analytics:** Visualization of sales by month, weekday, and time, including seasonal trends.
* **Inventory Insights:** Data on low-volume items and sales performance trends.
* **Egress-Free Thumbnail Gallery:** Admin view of all generative results served via **Cloudflare R2's Tiered Read Cache** to eliminate bandwidth costs during massive audits.
* **Currency/Credit Split View:** A commercial report specifically separating revenue from virtual credit packs vs. direct transactions for tax reconciliation.

**Technical Considerations:**
* **Iceberg Analytical Drawer:** Uses the **Apache Iceberg REST catalog** to filter massive historical sales datasets by AI version or resolution without performance degradation.
* **TanStack Query Caching:** Used for large commercial datasets to minimize network calls over mobile data.
* **Iceberg Schema Evolution:** Automate the mapping of new AI prompt parameters into the Iceberg catalog to maintain historical queryability.

### 2.6 Accounting Management & Ledger Control
The terminal for financial oversight and Finnish tax compliance.

**Features:**
* **Mixed-Payment Reconciliation:** Explicitly displays the split between **Virtual Credits** and **Direct Transaction** amounts in individual order views to comply with Finnish accounting standards.
* **Batch PDF Export:** Bulk ZIP download for invoices and purchase summaries using **Netlify Functions** as a secure proxy to handle high-volume PDF generation.
* **Review Period Management:** Mandatory window where payments are held before CCA payout.
* **Financial Pulse:** Real-time tracking of received amounts (with/without VAT) and total VAT.
* **Failure Forensics:** Detailed logs of why purchases failed (e.g., "3DS2 failure") with immediate recovery links to order-specific chat.
* **Unpaid Orders Tracker:** Track "Waiting Payment" status with time-elapsed indicators and ability to "trash" (hide) unpaid orders.
* **Success Tax Engine (Visualizer):** Tracks the "Stripe Fee" vs. the "CCA Share" vs. "Partner Royalty" to calculate actual net profit. Calculates true platform margin dynamically using the formula: `(Realized FIFO Revenue) - VAT - Stripe Fees - CCA Share - Partner Royalty`. Admin hovering over financial metrics instantly sees this calculated Net Profit.
* **Accounting Exports:** Downloads for purchase lists and individual PDFs.
* **Invoice Management:** Real-time mutation (split/modify/resend) and list of all invoices with individual or bulk ZIP download options.
  * **Offer-to-Invoice Conversion Logic:** Implement a **"One-Click Conversion"** to turn an accepted offer into a formal invoice, deducting the "Preparation/Calculation Hour".
  * **Invoice Splitting (Mixed-Payment Splitter):** Automatic replacement of one invoice with two if paid via mixed methods (Cash + Credits) for accounting purity.
  * **Special Splitting:** Ability to split work and invoice amounts into periods for customers needing smaller payment chunks.
* **Mixed-Payment Separation:** Separate data for orders paid with Virtual Credits versus Direct Transactions.
* **Credit/Cash Reconciliation:** View separating revenue from virtual credit packs vs. direct transactions.
* **Automatic Payout Invoice Generation:** One-click generation of the self-service invoices CCAs need for Finnish tax reporting.

**Technical Considerations:**
* **Edge-Ready Webhook Verification:** Routes Stripe webhooks through Netlify Functions using constructEventAsync with **ArrayBuffer payloads** to handle signature verification in V8 edge runtimes.
* **Finnish ALV/VAT (25.5%) Automation:** Integrated with **Stripe Tax** to automatically apply rates and validate B2B Tax IDs via VIES.
* **Idempotency Keys:** Mandatory for all Stripe PaymentIntent and Refund actions in server functions to prevent double-processing during retries.
* **Stripe-Integrated Settlement View:** Reflects actual Net vs. Gross after Stripe's Interchange Plus fees.
* **Conform VIES Validation:** Use Conform's onValidate hook to perform a debounced B2B VIES check during manual invoice creation.
* **Drizzle Transaction-Locked Refunds:** Ensure partial refunds are handled in a single Drizzle ACID transaction to update the Success Tax Engine and Order state simultaneously.

### 2.7 Job Management
Queue and task oversight for CCAs and the Default Creator.

**Features:**
* **Job List:** Comprehensive view of all production tasks.
* **Centralized Task View:** Links to assigned CCA, Buyer, and parent Purchase.
* **Data Access:** Direct access to attachments, form selections, and user instructions.
* **One-Click "Shadowing" Integration:** A "Troubleshoot" toggle within the Job Details view allows an Admin to initiate a **Clerk-integrated shadowing session** (see workbench as the CCA).
* **Job Redistribution:** Ability for Admin to forcibly move jobs between agents with a mandatory reason message.
* **Status Indicators:** OK to start (Paid), Start by own risk (Offer Requested), Review Period status (days left), and Dispute information.
* **CCA Conflict Warning:** Visual alert if an Admin reassigns a job while a CCA has unsaved drafts in their local **Delta Pattern** store.

**Technical Considerations:**
* **Payment-First Execution:** Status logic enforces that work begins only after confirmed payment.
* **TanStack Store for Workbench:** Implements reactive state management for high-frequency "Workbench" updates without full-page re-renders.
* **Supabase Realtime Workbench Soft Lock:** Broadcast a "Shadowing Active" event via Supabase Realtime to disable CCA submit buttons while an Admin is troubleshooting.

### 2.8 Workforce (CCA) Management
Lifecycle and performance management for content creator agents.

**Features:**
* **Agent Oversight:** Approve, pause, or cancel statuses; manage Tax ID (TIN) and ID in a **Legal Vault**.
* **Default Creator Management:** Oversee the AI agent used for automated workflows.
* **Agent Directory:** Filterable directory with editable details.
  * **CCA Profile Vault:** Access to address, contact details, TIN, and ID verification.
* **Agent ID Legal Vault:** Secure biometric-protected area utilizing **Ionic Identity Vault** for viewing sensitive CCA documents in the **Secure Enclave**.
* **Performance Metrics:** Grid showing average stars, reviews, and jobs done categorized by product type.
* **Link to Jobs:** List of jobs taken by an agent with links to descriptions.
* **Earnings Tracker:** Monitor the CCA share triggered only after the Review Period ends without dispute.
* **Secure Document Expunge:** Automated workflow to delete sensitive ID/TIN documents after a CCA status is "Cancelled" for \>90 days for GDPR compliance.

**Technical Considerations:**
* **Clerk-Integrated Shadowing:** **"Log in as CCA"** to troubleshoot specific dashboard views while maintaining secure state.
* **Role Lifecycle:** Privileges are escalated only after manual Admin approval of ID and TIN documents.
* **Identity Vault Biometric Gate:** Require a fresh biometric re-auth on the Admin's device before decrypting CCA ID documents from the Secure Enclave.

### 2.9 Buyer & CRM Management
Customer directory and troubleshooting tools.

**Features:**
* **Subject-Based Chat Isolation:** Support chats are permanently tied to specific **Order IDs**, isolating troubleshooting from general billing.
* **Buyer Directory:** Filter/search by join date, last purchase, or spending.
* **Profile Management:** Modify details, view full purchase history, and inspect results.
* **Shadowing:** Clerk-integrated session impersonation to see the site as the buyer does.
* **Buy/Spend Heatmap:** Visualization of buyer activity across categories to identify "Collection" fans.

**Technical Considerations:**
* **TanStack Query Caching:** Used to maintain metric accuracy while minimizing mobile data usage.
* **Clerk Metadata Schema Nexus:** Use Zod as the nexus to share the Buyer Profile schema between Clerk metadata and the CRM form.

### 2.10 AI Infrastructure & Prompt Engine
Control center for generative intelligence.

**Features:**
* **Semantic Caching Metrics:** Displays potential cost savings by showing the hit-rate of **OpenAI Semantic Caching**.
* **Hierarchical Prompt Tree:** UI to manage complex sub-event lists (e.g., WW2 → Operation Barbarossa).
* **Prompt & List Control:** Update premade lists (Styles, Enchantments, Voices) and hidden AI prompts.
* **Prompt Logic Sandbox:** A field to test "Pro Combo Recipes" (e.g., \[Low Angle\] \+ \[Dolly In\]) directly against the Sora/Veo models.

**Technical Considerations:**
* **Async Generator Streaming:** High-reasoning prompt tests must use **async generator streaming** to keep the connection active beyond Netlify's 10s timeout.
* **Localization Mapping:** Tool distinguishes between "Internal AI Prompts" (English) and "User-Facing Labels".
* **TanStack AI SDK:** Implemented for type-safe tool calling and streaming of Finnish-specific translation logic via OpenAI.
* **OpenAI Batch API Manager:** A UI to queue non-urgent translation or prompt refinement tasks for the 50% "Batch" discount.

### 2.11 Dispute & Quality Assurance (QA)
Handling customer complaints during the Review Period.

**Features:**
* **Dispute Logic Tree:** Integrated "Resolution Combinations" that automatically update the **Success Tax Engine** based on approved partial refunds.
* **Dispute Resolution Center:** Review cases filed during the Review Period.
* **Resolution Actions:** Approve (Trigger Redo or Refund) or Disapprove.
* **Accounting Integration:** Print combinations of resolutions for accounting purposes.
* **Redo Terminal Observer:** Ability for Admin to watch a CCA's redo process in the workbench to ensure quality compliance.

**Technical Considerations:**
* **TanStack Query Optimistic Updates:** To reflect resolution actions immediately in the UI.
* **Atomic Redo Invalidation:** Use router.invalidate() to refresh both the Admin dispute view and the CCA's redo workbench simultaneously after a resolution.

### 2.12 System Governance
Standard administrative controls and security.

**Features:**
* **Persona Toggle Skeletons:** Implements custom **Skeleton screens** when switching between persona masks to mitigate visual "jank".
* **Role-Based Access Control (RBAC):** Access levels for Support, Accountant, and Super-Admin.
* **Audit Logs:** Records of which administrator made specific status or price changes.
* **Real-Time Alerts:** Notifications for disputes or AI queue failures.
* **Administrative Shadowing Log:** A record of whenever an Admin shadows a Buyer or CCA to maintain privacy standards.

**Technical Considerations:**
* **Task Masking:** Visual "masks" hide unnecessary widgets based on role (e.g., Accountant Mask hides chat).
* **Zustand Persist Versioning:** Use the Zustand migrate function to handle schema updates for the persona store during platform upgrades.

### 2.13 Support & Communication
Omnichannel support and system logs.

**Features:**
* **Centralized Chat & Shadowing:** Real-time interface with a shadowing button directly inside the chat window.
* **System Logs:** History of failed purchases with reasons and links to Buyer, Order, and CCA.
* **Bug & System Logs:** Area for reporting site problems and viewing failures.
* **Wishlist & Support:** Monitoring area for user-submitted feature requests and "Upvoting".
* **AI-Enhanced Helpdesk:** Integration of the OpenAI Realtime API (Suomi voice) for low-latency voice-to-voice support.

**Technical Considerations:**
* **Multilingual Shell:** Employs **react-i18next** with synchronous filesystem loading for SSR performance.
* **WebView Optimization:** Utilizing a non-blocking view overlay (**EventSplash**) in Capacitor to reduce perceived "jank" and load time.
* **SSE Search Streaming:** Ensure the Command Palette global search uses SSE to avoid Netlify task timeouts during complex AI retrievals.

### 2.14 Pricing Management
Centralized control for financial and tax rules.

**Features:**
* **VIES B2B Validation:** Automated **Stripe Tax** identity validation (VIES) for correct VAT exemptions.
* **Common Pricing Rules:** Global base pricing for credits, man-hours, and result types.
* **Advanced Discount Engine:** Temporal and Conditional (Nationality, Name, Domain) discounts.
* **VAT Management:** Global interface to modify platform-wide VAT rates.
* **Finnish Inflation Auto-Adjust:** A toggle to automatically adjust "Precision Partner Estimator" values based on local market data.

**Technical Considerations:**
* **Invoicing Minimum:** System enforces a 1-hour minimum charge for all invoiced products.
* **Drizzle ACID Pricing:** Ensure global price updates are executed in an ACID transaction to prevent "split-pricing" during the transition period.

### 2.15 Site-Wide Configuration (No-Code)
Site-wide visual and structural management.

**Features:**
* **Direct String Transform Priority:** High-velocity layout animations must use **direct string transforms** rather than CSS variables for GPU acceleration on older Android WebViews.
* **Visual Identity:** Manage global color palettes and element color pickers.
* **Dynamic Forms:** Set attachment rules and required information per product.
* **Prompt & List Control:** Update premade lists (Styles, Historical Events, etc.) and hidden prompts.
* **Lottie Previewer:** A drag-and-drop area to upload and test new .lottie icons via the **ThorVG engine** before deployment.

**Technical Considerations:**
* **Real-time Theme Updates:** Updates to colors reflect in the Capacitor mobile app theme in real-time via CSS Variables.
* **Motion LazyMotion feature tiering:** In the Config editor, load only the domAnimation subset initially to keep the TTI low while editing colors.

---

## 3. CONTENT CREATOR AGENT (CCA) DASHBOARD: "THE EXCELLENCE ENGINE"

### 3.1 CCA Home Page (Overview)
The landing page serves as the "Mission Control" for agents, providing real-time summaries of production health, earnings, and market demand.

**Features:**
* **Agent Pulse Cards (KPIs):** High-level summaries of the agent's standing: 
  * **Available Jobs:** Real-time count of manual tasks in the public queue.
  * **Active Workbench:** Count of jobs currently "In Progress" or "Redo in Progress".
  * **Negotiation Count:** Pending "Offer Requested" items requiring a quote.
* **Persona-Filtered Market Trends:** KPI cards include a toggle to view "Market Demand" (e.g., categories with the longest queues) alongside individual earnings to assist CCAs in prioritizing high-value tasks.
* **Dynamic Bidding & Surge UI:** Jobs waiting longer than target SLAs show a "Fire Icon" and a dynamically increased payout multiplier to ensure marketplace liquidity.
* **Earnings Transparency:** 
  * **Available Payout:** Revenue from completed jobs past the Review Period.
  * **Pending Share:** Revenue currently held in the Review Period buffer.
* **Quality Streak Multiplier (Gamification):** Balances the "Surge Pricing" (which incentivizes speed). A visual widget showing consecutive 5-star jobs without a dispute. Hitting a streak of 5 grants a "Flame Badge" and a temporary +5% increase (dynamically fetched) to their payout share.
* **Urgency-Based Production Timers:** Color-coded progress bars (Green \> 48h, Yellow \< 24h, Red \< 6h) showing time remaining until target delivery.
* **AI Workflow Health Monitor:** A notification tile surfacing automated AI queue failures or processing delays for hybrid jobs.
* **Dispute Alerts:** Instant notification tiles for any "Disputed" job requiring immediate response or a redo.
* **SSE-Powered Global Search:** The command palette utilizes **Server-Sent Events (SSE)** streaming for AI-enhanced searches across active jobs and instructions, preventing Netlify timeouts on complex tasks.
* **Role-Specific Action Ribbon:** A dynamic UI section surfacing "Urgent Dispute Response" or "Expiring Review Periods" to minimize manual scrolling.
* **Hover Forensics on KPIs:** KPI cards reveal specific status details on hover (e.g., "Negotiation Count: 2 (Awaiting B2B Tax Validation)") to reduce click-depth.

**Technical Considerations:**
* **Optimistic Status Toggles:** Implementation of onMutate via **TanStack Query** for "Taking a Job," allowing projects to appear on the workbench immediately while the server processes the assignment.
* **Hover-Triggered Data Pre-fetching:** Implementation of **TanStack Router** pre-fetching on job card hovers to ensure instantaneous transitions to the Workbench.
* **Streaming SSR for Metrics:** Utilization of TanStack Start’s defaultStreamHandler to deliver the dashboard shell immediately while streaming in earnings and job counts in **\<200ms**.
* **Manual Hydration Control:** Utilization of the skipHydration: true property for the earnings store to prevent "flashes of un-synced content" during initial mobile paint.
* **Nitro "Netlify\_Edge" Preset:** Configuration of the backend to utilize **V8 isolates** for **50ms-200ms cold starts** on high-frequency agent actions.

### 3.2 Overall Layout and Navigation (Persistent UI)
Elements visible throughout the session to ensure high-fidelity navigation and workspace management.

**Features:**
* **Dual-Queue Visibility:** Visual distinction between **"Offer Requested"** (initiated during purchase) and **"Waiting Offer"** (requested via contact/risk unpaid quote requests) to prioritize paid projects.
* **Persona Switching:** A **Zustand-powered store** manages the seamless transition between Buyer and CCA views without a full page reload.
* **Transition Skeleton Screens:** Tailored skeleton loaders for the switch between "Buyer" and "CCA" personas to mitigate visual "jank".
* **Native-Sync Back Button:** Synchronization of the Capacitor @capacitor/app listener with the **TanStack Router useCanGoBack hook** to prevent accidental app exits.
* **Haptic Signature Patterns:** Distinct patterns to distinguish between "New Job Available" (soft pulse) and "Dispute Alert" (sharp vibration).
* **Multilingual Shell:** Language toggle linked to billing locale, controlled via **react-i18next**.

**Technical Considerations:**
* **Rust-Based Bridge Optimization:** Enable the **Rust-based bridge** in capacitor.config.ts for Android 7.0+ devices to reduce haptic and gesture latency.
* **ThorVG Vector Icon Runtimes:** Utilization of the **ThorVG C++ engine** for all sidebar icons to ensure **80% faster rendering** and **70% lower memory usage** on low-end Android hardware.
* **LazyMotion Feature Tiering:** Use of **Motion for React LazyMotion** to load only the domAnimation subset initially, deferring heavy gesture logic until the agent enters the Workbench.
* **Non-Blocking EventSplash:** A custom Capacitor overlay allowing the React application to hydrate in the background while a brand animation plays.

### 3.3 Production Management (Queue & Active Workbench)
An action-oriented production terminal replacing standard buyer histories.

**Features:**
* **The "Marketplace" Queue:** A filterable list of available jobs categorized by product type and estimated manual work hours.
  * **Claim the job:** CCA has the ability to claim the job to themselves. System prevents simultaneous claiming, and returns as failed it another agent got the job.
* **P2P Job Transfer Auction:** If a CCA claims a job but realizes they lack a specific skill (e.g., complex 3D rendering), they can transfer it to a "Priority Sub-Marketplace" for another CCA, offering to split their fee (e.g., "I'll take 10% for the lead, you take 90% for the work").
* **Shared Element Navigation:** Use of Motion’s layoutId to morph job cards from the Queue into the active Workbench view during navigation for spatial consistency.
* **Consolidated Workbench:** 
  * **Flow State UX:** When a job is claimed, navigation collapses. Zustand manages local `Delta Pattern` drafting so edits are safe offline (`Capacitor SQLite`). It syncs to TanStack Query only upon "Save/Submit".
  * **Claimed jobs**: List of jobs claimed with integrated customer chat.
  * **Action Required Priority Lane:** A dedicated sub-view isolating jobs waiting for "Needs More Information" or "Faulty Attachments".
  * **Redo Terminal:** Dedicated view for approved disputes where agents restart the process from the point of failure.
  * **Access all data:** Access to all customer-provided info, instructions, and downloads provided attachments.
  * **Asset DNA Injection & Pre-Flight Check:** A button instantly auto-fills Prompts from the user's `Asset_DNA`. Before hitting "Submit for Review," an automated pre-flight local classifier checks the output draft against the DNA triggers to warn the CCA: *"Warning: 'Red Scarf' missing from output."*
  * **Job ready:** Ability to send / set resulted files for customer / buyer / user and view dispute/payment statuses.
* **Offer & Invoice Terminal (Internal to Production Management)**
  * **Smart Copilot Offer Drafter:** Scans user instructions and file counts, suggesting a "Manhour Quote" based on historical averages and `Lists` complexity. The CCA can accept or tweak it.
  * **Offer Template:** Template-based generation for specific job types. Agents may provide offers even if the buyer hasn't paid the first "Prep Hour," accepting the risk of non-acceptance.
  * **One-Click Offer-to-Invoice:** Converts an accepted offer into an invoice, automatically **deducting the "Preparation/Calculation Hour"** already paid by the buyer.
* **Genealogy View Integration:** Visibility of "Middle Stage" results for modifications to existing generative assets.
* **Iceberg Metadata Filtering:** An analytical side-drawer using the **Apache Iceberg REST catalog** to filter historical "Jobs Done" by AI version or resolution.
* **Workbench "Soft Lock" UI:** Visual indicator showing if an Admin is currently **"Shadowing"** the workbench or reassigning the job to prevent state conflicts. Supabase Presence broadcasts a "Locked by HQ" or "Locked by CCA_123" badge to prevent concurrent editing collisions.

**Technical Considerations:**
* **TanStack Table v8 Grouping:** High-performance grouping by "Status Meter" (e.g., "In Progress") to reduce visual density.
* **Delta Pattern Drafting:** Zustand stores manage local edits and result drafts, merging them with the base **TanStack Query** server state only upon final submission.
* **Predicate Pushdown Sync:** Utilization of **TanStack DB 0.5+** to fetch only the precise subset of job metadata required for the active viewport, maintaining sub-millisecond updates.
* **Capacitor SQLite Persistence:** Persistent local store for "In Progress" job metadata to prevent data loss during OS-level data eviction.
* **WebSocket "Soft Lock" Resolution:** Implement via **Supabase Realtime**; if an Admin reassigns a job, the CCA local state receives a DELETE event that optimistically clears the workbench with a mandatory reason notification.
* **Mandatory Idempotency Keys:** Enforced Stripe keys for every invoice generation attempt.
* **Stripe Tax Identity Integration:** Automatic validation of B2B Tax IDs via VIES before offer finalization for business customers.
* **Idempotency Key Transparency:** Surfaces **Stripe Idempotency Keys** in failure forensics to prevent double-charging during mobile network retries.

### 3.4 Profile & Legal Vault (CCA-Specific)
Dedicated area for professional standing and legal compliance.

**Features:**
* **Profile Management:** Modify name (requires re-identification), email, company, address, phone, and bank details for payouts.
* **Biometric Identity Vault:** Integration of **Ionic Identity Vault** for secure storage of the agent's TIN and ID status within the device's **Secure Enclave**. 
  * **Agent ID Security:** Identification documents are visible only to Admins/Super Admins; not even the agent can view them after submission.
* **Performance Badge Grid:** Public-facing metrics including average stars, reviews, and completion counts by product type.
* **Self-Service Payout Invoices:** CCAs have a dedicated area within Profile Management to download automatically generated invoices regarding their own earnings (e.g., share of taxless amounts), formatted for Finnish accounting. One-click generation of self-service payout invoices formatted for Finnish accounting.

**Technical Considerations:**
* **Conform Intent-Based Uploads:** Use of **"Intent" buttons** for document submissions to allow list manipulation before JavaScript hydration is complete.
* **Isomorphic Validation Firewall:** Strict **Zod validation** enforced within createServerFn to reject malicious payloads before they touch the vault.
* **Biometric Secure Enclave Integration:** Utilize Ionic's **Identity Vault** to store the agent's TIN and ID verification status within the device's Secure Enclave, ensuring these sensitive keys never reside in standard storage.

### 3.5 Support
Dedicated area for CCA-related assistance.

**Features:**
* **Contact Admins:** Form and real-time chat tied to the subject at hand.
* **Shadowing Toggle:** In-chat toggle allowing agents to grant temporary shadowing access to Admins for troubleshooting.

---

## 4. USER DASHBOARD: "THE LEGACY STUDIO"

### 4.1 User Home Page (Overview)
The landing page provides a high-level summary of account health and active projects, tailored for the buyer journey.

**Features:**
* **Buyer Pulse Cards (KPIs):** Real-time summaries of the user's standing: 
  * **Virtual Credit Balance:** Current available credits for automated purchases.
  * **Active Jobs Monitor:** Real-time counts of "In Queue" (AI/CCA), "In Progress," and "Action Required" (e.g., missing attachments) tasks.
  * **Quality & Review Timers:** Visualization of the **Review Period** expiration for delivered products and active disputes.
* **Preservation Score Gauge:** A visual meter (0-100%) tracking "Legacy Security" (e.g., Uploading raw photos = points; Ordering physical backups or Voice Models maximizes the score).
* **The "Curator's Co-Op" Tracker:** A widget for the "Family History Manager" to manage their `Contribute_Link`. They can see a progress bar for an expensive Saga (e.g., €150 Visual Biography) filling up as family members donate Credits.
* **Urgency-Based Review Timers:** Color-coded progress bars (Green \> 48h, Yellow \< 24h, Red \< 6h) to prompt users to finalize quality checks before the period expires.
* **Real-Time AI Workflow Alerts:** A "System Health" notification tile surfacing automated AI queue failures or processing delays specifically for the user’s active jobs.
* **Financial Savings Tracker:** A KPI card displaying total credits saved through membership plans or seasonal discounts.
* **Credit/Cash Reconciliation View:** A breakdown within Pulse Cards showing revenue spent via Virtual Credit packs versus direct transaction sales to help users track funding sources.
* **Hover Forensics on KPIs:** Cards reveal specific status details on hover (e.g., "Missing Image Attachment") to reduce click-depth.
* **Hybrid Language Experience:** Utilize a "Golden Path" linguistic model where static UI labels are rendered with **DeepL** (for morphological precision) while dynamic user-facing status messages are handled by **GPT-5 Mini** (for *puhekieli*/informal nuance).
* **Quick Action-Ribbon:** UI section dynamically surfacing priority actions like "Claim Unpaid Offer" or "Resolve Failed Payment".

**Technical Considerations:**
* **Nitro "Netlify\_Edge" Preset:** Configure the TanStack Start build engine to utilize the netlify\_edge preset, targeting V8 isolates for a **50ms-200ms cold start** improvement over traditional regional Lambda execution.
* **TanStack Query onMutate:** Implementation of optimistic updates for actions such as "Claim Unpaid Offer," allowing the UI to reflect status changes immediately while the server processes the transaction.
* **Predicate Pushdown Sync:** Utilization of **TanStack DB 0.5+** to fetch only active job metadata required for the Home Page, ensuring sub-millisecond initial load times.
* **Streaming SSR for Metrics:** Utilization of TanStack Start’s defaultStreamHandler to deliver the application shell immediately while streaming in "Buyer Pulse" data as it resolves on the server.
* **Stripe Tax Identity Integration:** Implement automatic B2B Tax ID validation via **VIES** within the checkout flow to apply correct VAT exemptions for international users. if user is presenting a company.
* **Query Caching:** Managed via TanStack Query to maintain metric accuracy while minimizing mobile data usage.
* **Optimistic Status Toggles:** Uses TanStack Query’s onMutate to reflect UI changes (like claiming an offer) immediately before server confirmation.

### 4.2 Overall Layout and Navigation (Persistent UI)
Elements visible throughout the session to ensure high-fidelity navigation and workspace management.

**Features:**
* **Contextual Multi-tenant Sidebar:** A dynamic system that adapts based on the active "Persona" (Buyer/CCA/Partner/Admin) stored in the global **Zustand** state.
* **Skeleton Role-Switching:** "Skeleton" screen overlays during persona transitions to mitigate visual "jank".
* **Privilege Selector:** A top-bar toggle allowing users with elevated permissions to switch workspace contexts seamlessly.
* **AI-Enhanced Command Palette:** A global search interface indexing Order IDs, Category names, and specific Result Metadata for rapid retrieval.
* **Native-Sync Back Button:** Synchronize the Capacitor @capacitor/app listener with the **TanStack Router useCanGoBack hook** to prevent users from exiting the app when navigating to previous dashboard views.
* **Haptic Signature Patterns:** Implement distinct Capacitor haptic vibration patterns for "Action Required" notifications vs. "Production Ready" alerts to increase the native-feel.
* **Haptic-Feedback Gestures:** Capacitor-native haptic triggers for sidebar persona switching and "Privilege Selector" toggles to enhance the "native-feel".
* **"Handshake" Component Protocol:** A "code cleaning" protocol for UI components imported via Framer Handshake to replace internal framer routing with **TanStack Router** links, ensuring seamless file-based navigation.
* **Multilingual Shell:** Language toggle linked to billing locale, controlled via **react-i18next**.

**Technical Considerations:**
* **Rust-Based Bridge Optimization:** Enable the **Rust-based bridge** configuration in capacitor.config.ts for Android 7.0+ devices to reduce JNI call overhead and improve haptic/gesture response times.
* **LazyMotion Feature Tiering:** Implement the **Motion for React LazyMotion** component with the domAnimation feature set to reduce the initial JavaScript thread parse time by **86%**.
* **Non-Blocking EventSplash:** A custom Capacitor overlay allowing the React application and **TanStack Router** to hydrate in the background while a brand animation plays, reducing perceived load time by 90%.
* **ThorVG Animation Engine for icons:** Use of the **dotLottie/ThorVG** runtime for sidebar icons to ensure 80% faster rendering on low-end Android hardware compared to standard JSON.
* **Persona Synchronization:** Managed via the Zustand-powered Persona Store to align roles across mobile and desktop environments.

### 4.3 Profile Management
Dedicated area for managing identity and applying for elevated status.

**Features:**
* **Progressive CCA Onboarding:** A multi-step application form for **Content Creator Agent (CCA)** status using **"Intent" buttons** for document uploads, preventing user overwhelm.
* **Enterprise Identity Vault:** Integrate Ionic’s **Identity Vault** for CCA applicants to securely store biometric-protected tax documents (ID/TIN) in the device's Secure Enclave.
* **Legal Vault Integration:** A secure section within the profile for CCA applicants to view the status of ID and TIN (Tax Identification Number) documents, featuring field-level masking for sensitive data.
* **Basic Details & Avatar:** Management of Name, Email, Address, Phone, public profile description, and avatar.

**Technical Considerations:**
* **Conform Intent-Based Submissions:** Utilize **Conform "Intent" buttons** for profile updates, allowing list manipulations to function even during the background hydration of the JavaScript bundle.
* **Isomorphic Validation Firewall:** Force strict **Zod validation** within the createServerFn .inputValidator() to ensure malicious document payloads are rejected before they touch the CCA Legal Vault.
* **Delta Pattern Storage:** Zustand manages local drafts during editing, while TanStack Query maintains the server's source of truth.

### 4.4 Purchase & Financial History
Focused on historical data retrieval and lifecycle tracking.

**Features:**
* **Purchase History Vault:** A comprehensive list of purchased products, filterable by status grouping or success/failure.
* **Mixed-Payment Reconciliation:** Explicitly display the split between **Virtual Credits** and **Direct Transaction** amounts in the order history, ensuring compliance with Finnish accounting standards for mixed-payment invoices.
* **Consolidated Health Status:** "Progressive Disclosure" where the primary order list shows a single status; detailed **"6-Meter"** tracking indicators are visible only upon row expansion to prevent UI clutter.
  * **Hover Forensics for Failures:** Status indicators reveal specific technical failure reasons (e.g., "Stripe 3DS2 failure") on hover.
* **Financial Documentation:** Capability to download invoices or purchase summaries as PDF files.
* **Idempotency Key Transparency:** Surface **Stripe Idempotency Keys** in the "Failure Forensics" hover tooltip to provide references for preventing double-charging during network retries.
* **One-Click Offer Conversion:** Direct **"Accept & Pay"** buttons for "Offer Requested" items to trigger immediate Stripe sessions or credit deductions.
* **Unpaid Order "Trash" Bin:** Capability to hide or "trash" expired "Waiting Payment" orders to maintain a clean history, with a 30-day auto-delete for hidden items.
* **Active Editing Window:** Permission-based ability to modify order details if the product is not yet "In Making" or "Delivered".

**Technical Considerations:**
* **Row-Level Security (RLS) Parity:** Utilize a custom Drizzle/Supabase client to inject the **Clerk JWT sub claim** into the Postgres session, ensuring users only query their own financial records at the database level.
* **TanStack Table v8 Virtualization:** Implementation of row virtualization for users with large histories (\>100 orders) to maintain high FPS within the Capacitor WebView.
* **Query-Driven Sync (TanStack DB 0.5+):** Employs **Predicate Pushdown** to fetch only the precise subset of order data required by active filters.

### 4.5 Asset Management Vault
Central repository for organizing and downloading generative results.

**Features:**
* **Unprocessed Raw Materials Inbox (NEW):** When a Partner digitizes a physical item, the high-res file lands here automatically. The UI presents it as raw material ready for the user to select an AI product to apply to it.
* **Smart Result Gallery:** High-performance thumbnail grid with advanced filtering and hierarchical organization.
* **Hierarchical Organization:** User-defined categories and subcategories to organize generative results.
* **Egress-Free Batch Previews / Zero-Egress Gallery:** Leverage **Cloudflare R2’s Tiered Read Cache** to serve asset thumbnails, ensuring high-frequency gallery browsing incurs **zero egress bandwidth costs**. Includes an Apache Iceberg-powered side-drawer to filter assets by AI engine or Enchantment tags.
* **Regional Jurisdictional Markers:** Visual badges indicating if assets are stored within EU-restricted R2 buckets to confirm GDPR compliance and data sovereignty.
* **Iceberg Metadata Filtering:** Integrate the **Apache Iceberg REST catalog** into the side-drawer to filter massive vaults by AI engine version (e.g., "Veo" vs. "Sora") or specific enchantment parameters.
* **Batch "Move-to-Category":** Multi-select and drag-and-drop interactions using **Motion for React** to organize files into folders.
* **AI-Powered "Translate All" Drawer:** Side-drawer tool utilizing DeepL or OpenAI to translate custom categories and descriptions into the user's billing locale.
* **Asset DNA Integration:** Characters saved to the vault retain their "Recipe" (Seeds, Prompts, LoRAs) for perfect consistency in future orders.
* **Bulk Actions:** Capability to download assets individually or as combined **ZIP archives**.
* **Social Integration:** Direct sharing of results to social media platforms.

**Technical Considerations:**
* **R2 Synchronous Write Verification:** Ensure asset uploads return an HTTP 200 only after the **Synchronous Write** to R2 is persisted, preventing eventual consistency "ghosting".
* **Cloudflare R2 Zero-Egress Storage:** Thumbnails and full-resolution downloads are routed through **R2** to eliminate egress costs.
* **Capacitor SQLite:** Persistent store for large result histories to prevent OS data eviction and improve offline access.

### 4.6 Expansion Workflows
Workflows for further purchases and physical conversions.

**Features:**
* **The Interactive Saga Storyboard:** Before purchasing a Saga, the user accesses a visual drag-and-drop canvas. They drag their pet's `Asset DNA` or items from the Unprocessed Inbox into "Scene" slots to plan the story, building emotional investment before hitting the paywall.
* **The 3D Phygital Previewer:** Before a user buys a physical "Memory Stone" (€35) or Lithophane, they can click a button on their generated image to open a 3D WebGL preview (rendered via ThorVG or similar lightweight engine on device) showing exactly how it will look as a physical object. Pulls real-time pricing from local printing partners.
* **Visual Modification Comparison:** A **"Split-View"** comparison between a current asset and a proposed expansion/modification result.
* **Physical Prototype Estimator:** Real-time price estimator for converting digital assets into 3D Lithophanes or Metal Prints prior to ordering.
  * **Precision Partner Estimator:** Integrate real-time pricing from the user's **Local printing landscape** (e.g., in Finland Ifolor 10cm prints at €0.14-€0.28) directly into the physical prototype estimator.
* **Partner Pipeline Tracker:** A visual tracker for physical products showing the transition from "Waiting for Delivery" to "Processing at Partner" and finally "At Delivery".
* **Iterative Modification Branching / Genealogy Explorer 2.0:** A **"Genealogy View"** visual, interactive node-graph allowing users to see the history of a result and jump back to a "middle stage" to start a new modification path.
* **Physical Product Orders:** One-click paths to convert digital results into physical products via authorized partners.
* **Recommendation Engine:** Smart suggestions for future purchases based on result metadata.

**Technical Considerations:**
* **One-Click Offer-to-Invoice Logic:** Implement a dashboard trigger that **Deducts the "Preparation/Calculation Hour"** (1-hour minimum) from the final converted invoice when a user accepts an offer.
* **Recursive Metadata Linking:** Use of the parent order ID as a metadata link in new expansion orders to maintain a traceable database genealogy.
* **One-Click Conversion:** createServerFn handles complex logic for digital-to-partner physical orders.

### 4.7 Support & Communication
Standalone area for resolving issues and feature requests.

**Features:**
* **Integrated Support Center:** Access to contact forms, bug reporting, and site-wide contact details.
* **Order-Specific Thread Isolation:** Permanently tie support chats to specific **Order IDs**, isolating technical troubleshooting from general billing inquiries to reduce agent confusion and prevent context collapse.
* **Admin Shadowing Trigger:** A **"Troubleshoot View"** toggle in support chat that grants temporary **Clerk-integrated** shadowing access to administrators.
* **Subject-Based Chat:** Order-specific chat interfaces permanently tied to the Order ID.
  * **In-Chat Shadowing Button:** A toggle within the subject-based chat that allows a user to grant an Admin temporary **Clerk-integrated** shadowing access for troubleshooting.
* **Wishlist:** A specific area for users to submit requests for new features or products.
  * **Wishlist Voting:** Capability for users to "Upvote" existing feature requests to help prioritize development.

**Technical Considerations:**
* **Edge-Ready Webhook Verification:** Route Stripe webhooks through **Netlify Functions** using the constructEventAsync method to handle signature verification with ArrayBuffer payloads, avoiding Node-specific Buffer dependencies at the edge.
* **ConstructEventAsync Verification:** Routing of all Stripe-triggered transactional emails through **Netlify Functions** to ensure signature verification is compatible with edge runtimes.
* **Resend & React Email:** Infrastructure used for transactional updates regarding support tickets and order-specific chat notifications.
  * **Resend Transactional Proxy:** Chat and ticket notifications are routed through **Netlify Functions** to securely manage API keys and **React Email** templates.

---

## 5. PARTNER DASHBOARD: "THE LOGISTICS & ROYALTY HUB"
Frictionless ingestion that turns local digitization shops into passive-income affiliates.

### 5.1 Logistics Signal Board & Intake
**Features:**
* **Partner Pipeline Tracker:** A visual "logistics timeline" showing physical goods transitioning from "Waiting for Delivery" to "Processing at Partner".
* **Capacitor Native QR Scanner:** A giant "Scan Package" button utilizing the mobile device's camera to scan the VIVID shipping label, instantly advancing the User's `Partner Pipeline Tracker`.
* **Lead Radar:** A list of Users who paid the "Information Unlock" fee to see the Partner's details, allowing Partners to log off-platform physical deals. (Information Sales Oversight).

### 5.2 The Digital Bridge & Passive Royalty Engine
**Features:**
* **Frictionless Ingest:** When digitization is complete, the Partner bulk-uploads the high-res files directly via a drag-and-drop gateway. The system injects these directly into the User's `Unprocessed Raw Materials Inbox`.
* **The Tracking Tag:** The system automatically and silently injects the Partner's `origin_partner_id` into the file's metadata. 
* **The Phygital Upsell Loop:** When a Partner marks a physical package as `Processing_Digital` and uploads the file, they are prompted: *"Suggest an AI Enhancement to the User?"* They can select a recommendation (e.g., *Standard 4K Video* edit). The User gets a push notification, and if they convert, the Partner earns their 10% Royalty automatically.
* **The Royalty Ticker (FOMO):** A real-time counter showing: *"Lifetime Royalties Earned: €412.50"*. If they haven't uploaded files recently, it shows *"Missed Revenue Warning: Upload digital files to activate your 5-10% perpetual royalty."* If the User *ever* uses that digitized file to buy a generated product, the System detects the tag and routes the configured percentage to the Partner's Escrow.

### 5.3 Partner Management (Organization Hub & Vault)
**Features:**
* **Partner Directory:** Filterable by activity and date.
* **Organization Hub:** Manages partner companies and their representative teams.
* **Profile Vault:** Access to partner address, TIN, and ID verification.
* **Contact & Chat:** Initiate tri-party chats (Admin-Partner-Buyer).
* **Founder-First Onboarding:** Users apply to create a Partner Company; once approved, they can invite staff.
* **Admin Invitation Tool:** Out-of-band email invitations via **Resend** that create a "Shadow User".
* **Partner Inventory Integration:** Display current local printing prices (e.g., Ifolor 10cm prints) directly in the partner dashboard for Admin price-matching.

**Technical Considerations:**
* **Resend Transactional Proxy:** All partner invitations and status updates are routed through **Netlify Functions** using **React Email** templates to securely manage API keys.
* **Scoped Partner Access:** Restricted UI for external partners masks internal CCA/financial data.
* **Automated Onboarding:** Employs **Resend and React Email** for standardized flows.
* **Partner Status Authority:** Only approved representatives can advance the Partner Status meter.
* **Scoped RLS Policies:** Ensure Partner-assigned representatives can only query orders where they are the designated "Fulfillment Partner"

---

## 6. ECONOMIC SIMULATION (The Success Tax & Upsell Loop)

*Scenario: A Partner uploads a digitized photo and suggests a "Love Story Trailer" Saga. The User buys it (249 Credits) using a 1000-Credit Pack bought at a 40% discount.*

| Ledger Element | Amount | Source / Logic |
| :--- | :--- | :--- |
| **Gross List Price** | 249 Credits (€24.90) | `Pricing-plan-vivid-v2` |
| **Realized Revenue (FIFO)** | **€14.94** | User bought credits at 40% discount (€60/1000 * 249) |
| **Finnish VAT (25.5%)** | - €3.03 | Extracted from Realized Revenue (`€14.94 - (€14.94 / 1.255)`) |
| **Stripe Fees (~2.9%)** | - €0.43 | Gateway fee on Realized Revenue |
| **Net Platform Value** | **€11.48** | Pre-Payout Margin |
| **Partner Royalty (10%)** | - €1.14 | 10% of Net Value (Affiliate Reward) |
| **CCA Share (e.g., 75%)** | - €8.61 | 75% of Net Value |
| **VIVID Net Profit** | **€1.73** | Platform Margin |

*Directive enforced: The Admin "Success Tax Visualizer" MUST run this exact calculation. If payouts were based on the €24.90 List Price, VIVID would lose money. Realized FIFO Revenue is the only truth.*

**THE RIPPLE EFFECT (System Dependencies)**
1.  **Database (Supabase):** `Orders` table requires an `upsell_origin_partner_id`. `Users` table requires a `preservation_score` integer. `CCAs` table requires a `quality_streak_count`.
2.  **State (TanStack Store & Zustand):** The Interactive Saga Storyboard requires complex client-side drag-and-drop state.
3.  **Mobile (Capacitor):** Partner QR Scanner requires native camera permissions payload.

---

## 7. TECHNICAL SPECIFICATIONS & BEHAVIORAL LOGIC (PRD)

**1. OBJECTIVE**
To implement the "Phygital Upsell Loop" for Partners, the "Saga Storyboard" for Users, and the "Quality Streak" for CCAs to drive revenue, retention, and quality, while integrating high-density administrative control, high-frequency CCA throughput, gamified User retention, and automated Partner royalty logistics, built strictly on the TanStack/Capacitor stack.

**2. USER STORIES**
*   **As a Partner**, I want to suggest AI enhancements when I upload digitized files, so I can earn a 10% royalty if the user buys the enhancement.
*   **As a Partner**, I want to quickly scan a QR code to mark a physical package as received, and securely upload the digitized files so they are tagged to my account for future passive royalties.
*   **As a User**, I want to drag and drop my saved Character DNA into a storyboard before buying a Saga, so I can visualize the final product and build my narrative.
*   **As a User**, I want to find my digitized files in an "Unprocessed Inbox" and drag them onto a visual storyboard so I can plan my narrative before spending credits.
*   **As a CCA**, I want to earn a visual badge and a payout bonus for consecutive 5-star jobs, so I am rewarded for high-quality work, not just speed.
*   **As a CCA**, I want the Workbench to suggest a Manhour quote and reward me with a Quality Streak multiplier so my efficiency and accuracy are maximized.
*   **As an Admin**, I want to hover over financial metrics to instantly see the calculated Net Profit (Realized Revenue - Discount - VAT - Fees - Payouts) without manually checking the ledger.

**3. ACCEPTANCE CRITERIA (GHERKIN)**

~~~gherkin
Feature 1: Partner Phygital Upsell Loop
GIVEN a Partner is on the "Logistics Signal" board uploading a digitized file
WHEN they check "Suggest Enhancement" and select "Standard 4K Video"
THEN the system flags the file with `upsell_origin_partner_id`
AND sends a push notification to the User
AND if the User converts, the Partner Dashboard "Royalty Ticker" increments by 10% of the Net Realized Value.

Feature 2: Partner Passive Royalty Engine
GIVEN a Partner uses the Capacitor QR Scanner to receive a physical package
WHEN the Partner digitizes and uses the "Ingest Bridge" to upload the resulting file
THEN the system saves the file to the User's Cloudflare R2 Vault (Unprocessed Inbox)
AND silently applies the Partner's `origin_partner_id` to the file metadata
AND WHEN the User purchases any product using that file
THEN the Smart Ledger calculates the Net Realized Value and applies the `[Partner_Split]` variable from the Pricing Sheet to the Partner's wallet.

Feature 3: User Saga Storyboard (Drag & Drop) & Curator Co-Op
GIVEN the User is viewing a Saga product (e.g., "Love Story Trailer") in the "Legacy Studio" Dashboard
WHEN they click "Plan Storyboard"
THEN a UI canvas opens using `TanStack Store` for state management
AND the UI renders a node-based visual tree (`Motion for React`)
AND the user can drag their `Asset_DNA` cards from their Vault or items from their R2 Vault into "Scene" slots
AND the selected DNA payloads are attached to the order upon checkout.
AND IF they lack sufficient credits, they can generate a `Contribute_Link`
THEN external family members can fund the project directly into the User's locked Escrow.

Feature 4: CCA Quality Streak Multiplier
GIVEN a CCA completes a job and the 14-Day Review Period ends
WHEN the User leaves a 5-Star review with no dispute
THEN the CCA's `quality_streak_count` increments by 1
AND if the count reaches 5, the CCA Dashboard renders a "Flame Badge"
AND the next job claimed applies a +5% payout modifier to their Ledger entry.

Feature 5: CCA Workbench "Smart Copilot" & Pre-Flight Check
GIVEN a CCA opens a "Waiting Offer" job in the Workbench
WHEN the system detects 50 attached images and requests a "Video Saga"
THEN the Smart Copilot evaluates historical database averages and `Lists` complexity
AND injects a "Draft Quote" (e.g., `[Calculated_Manhours]`) into the CCA's input field for review.
AND WHEN the CCA attempts to submit the final asset
THEN the Pre-Flight Guard verifies the asset against the User's `Asset_DNA` triggers, warning the CCA if core stylistic elements are missing.

Feature 6: Admin Success Tax & Fraud Canary
GIVEN the Admin views the Financial Pulse dashboard
WHEN a job is completed
THEN the Success Tax Visualizer displays the margin breakdown (FIFO Realized Revenue minus dynamic variables: VAT, Gateway, CCA Share, Partner Share)
AND IF a User triggers a specific product (e.g., Re-Roll) beyond the velocity threshold
THEN the GPU Fraud Canary halts the User's generation capability and flags the account for Admin review.
~~~

**4. TECHNICAL LOGIC (MERMAID)**

~~~mermaid
sequenceDiagram
    participant PartnerUI as Partner Dashboard
    participant API as Netlify Edge (TanStack)
    participant DB as Supabase Ledger
    participant R2 as User Vault (Cloudflare R2)
    participant UserUI as User Dashboard
    participant CCAUI as CCA Workbench

    Note over PartnerUI, UserUI: The Phygital Upsell Loop & Frictionless Ingest
    PartnerUI->>API: Scans QR, Uploads File + Suggest '4K Video'
    API->>R2: Store File securely
    API->>DB: Save File Metadata ([upsell_origin_partner_id])
    API->>UserUI: Push Notification "Partner Suggests 4K Video / New Raw Materials"
    
    Note over UserUI, DB: The Legacy Studio (Storyboard)
    UserUI->>UserUI: Drags File & Asset_DNA onto Storyboard
    UserUI->>API: User Purchases 4K Video (Uses 40% Discount Credits / Friends fund via Co-Op Link)
    API->>DB: Process Payment & Deduct VAT/Stripe Fees
    API->>DB: Create Order & Lock Escrow, Generates Job Queue
    
    Note over CCAUI, DB: The Workbench & Copilot
    DB-->>CCAUI: Streams Job to Workbench (TanStack DB Sync)
    CCAUI->>CCAUI: Edits applied locally (Delta Pattern)
    CCAUI->>API: Submits Final Asset
    API->>API: Pre-Flight AI checks DNA consistency
    
    Note over API, DB: Job Completed & Review Period Ends
    API->>DB: Read [origin_partner_id] from source file
    API->>DB: Calculate Net Value based on FIFO (€14.94)
    DB->>DB: Route 10% [Partner_Royalty] to Partner Wallet & calculate [CCA_Share]
    DB-->>PartnerUI: Update Royalty Ticker (SSE Stream)
~~~

**5. CONFLICT WARNINGS & SYSTEM SAFEGUARDS**
*   **Job Redistribution Conflict:** All forcible job reassignments by Admins utilize **Supabase Realtime** to optimistically clear local CCA states and display a mandatory reason notification.
*   **Animation Performance vs Variables:** **Real-time mobile app theme updates** via CSS Variables may conflict with hardware-accelerated animations in **Motion for React v12**, which prioritizes string transforms on Android. 
    *   **Resolution:** Dynamic colors will still utilize **CSS Variables**. However, high-frequency layout animations will prioritize **direct string transforms** (e.g., `transform: "translateX(100px)"`) to ensure they stay on the GPU compositor.
*   **AI Search Timeouts:** **AI-enhanced fuzzy search** GPT-5 calls can take 10-26 seconds, exceeding Netlify's 10s default timeout. 
    *   **Resolution:** All AI-driven features **must** use **Server-Sent Events (SSE)** streaming via TanStack Start server functions to keep the connection active and provide word-by-word updates.

**6. MACHINE-READABLE SUMMARY (JSON)**

~~~json
[
  {
    "feature_id": "dashboards_gamification_upsell_v1",
    "complexity": "high",
    "requires_db_migration": true,
    "affected_roles": ["admin", "user", "cca", "partner"],
    "stack_components": [
      "TanStack Start",
      "TanStack Store",
      "Supabase DB (RLS & Triggers)",
      "Netlify Edge",
      "Capacitor Camera API"
    ]
  },
  {
    "feature_id": "vivid_unified_dashboards_master",
    "complexity": "extreme",
    "requires_db_migration": true,
    "affected_roles": ["admin", "user", "cca", "partner"],
    "stack_components": [
      "TanStack Start",
      "TanStack Store",
      "Motion for React",
      "Cloudflare R2",
      "Ionic Capacitor",
      "Supabase",
      "Apache Iceberg"
    ],
    "variable_dependencies": [
      "PricingTable Sheet (Manhours, Credits, Discounts)",
      "pricing-plan-vivid Sheet (Partner Splits, Fixed Prices)"
    ]
  }
]
~~~
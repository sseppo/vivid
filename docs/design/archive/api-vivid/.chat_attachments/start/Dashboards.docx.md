> **Status:** historical — family F4; superseded by `docs/design/dashboards/` canon (Q2). Kept for provenance; not current. Source: `vivid/.chat_attachments/start/Dashboards.docx.md`. 

**Admin Dashboard**

**1\. Unified Mission Control (Home Overview)**

The landing page provides a high-level summary of the site's health through centralized reporting and real-time data flow.

**Features:**

* **Real-Time Stat Streaming:** Employs **Server-Sent Events (SSE)** via TanStack Start to stream KPI updates (e.g., active job counts) without manual refreshes, preventing Netlify timeouts on complex aggregate queries.

* **Differential KPI Stream:** Utilizes **TanStack DB 0.5+** for differential dataflow, enabling sub-millisecond updates to platform metrics as the database changes.

* **KPI Cards:** High-level summaries of platform health, including platform status and performance metrics.

  * **Active Job Monitors:** Real-time counts of "In Queue" (AI vs. Content Creator Agent (CCA)), "In Progress," and "Action Required" tasks.

  * **Financial Pulse:** Total revenue (with/without VAT), credit sales vs. transaction sales, and active monthly memberships.

  * **Quality Alerts:** Count of active "Disputed" orders and orders nearing the end of their "Review Period".

  * **System Health:** Monitoring of automated AI workflows (Default Content Creator performance) and "Failure" status alerts.

  * **Predictive Queue Load:** KPI cards showing "Estimated Time to Clear" for specific categories based on current CCA activity.

  * **AI Agent Efficiency Tracker:** A card comparing Default Creator (AI) success rates versus manual CCA redos.

* **Contextual Market Demand Toggle:** Includes a toggle to view "Market Demand" (longest queues) alongside earnings to assist in resource allocation.

* **Forensic KPI Drill-down:** KPI cards support **"Hover Forensics,"** revealing a popover with a 5-item list of specific issues (e.g., "3DS2 Stripe Failure" or "Missing Image Attachment") to reduce navigation depth.

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

---

**2\. Order Management**

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

---

**3\. Product Management**

A comprehensive no-code interface for managing the digital catalog.

**Features:**

* **Intent-Based Creation:** Utilizes **Conform "Intent" buttons** for adding product variations or "Required Information" fields, allowing list manipulations to function even if the JavaScript bundle is still hydrating.

* **Advanced Filtering & Profiles:** Mechanisms to find products easily and manage detailed profiles, including images, descriptions, and "Required Information" forms.

* **Detailed Product Profile:** Main image, description, sample results, price (with override/discount), social sharing, and "Required Information" forms.

* **Advanced Editor:** Full CRUD operations; creating a product under a category automatically assigns that category.

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

---

**4\. Category Management**

Management of the hierarchical organization of the platform.

**Features:**

* **Dnd Hierarchy Management:** Implements drag-and-drop for unlimited nested categories using **Motion for React** (v12) to provide hardware-accelerated, native-feel transitions.

* **Category Profiles & Merchandising:** Manage images, sample results, descriptions, and "Featured Products" for category pages.

* **Commerce Links:** Direct links to sales insights pre-filtered for the specific category.

* **Global Drag-to-Reorder:** A unified view to reorder the root category tree for the mobile app navigation shell.

**Technical Considerations:**

* **JSONB Localization Pattern:** Multilingual content stored in JSONB objects to keep database row density low.

* **i18n Localization Drawer:** Side-by-side translation fields for every category name and description.

* **Prisma Recursive CTEs:** Utilize Prisma's stable recursive relation support for fetching the entire hierarchy in a single query.

---

**5\. Commercial Management**

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

---

**6\. Accounting Management**

The terminal for financial oversight and Finnish tax compliance.

**Features:**

* **Mixed-Payment Reconciliation:** Explicitly displays the split between **Virtual Credits** and **Direct Transaction** amounts in individual order views to comply with Finnish accounting standards.

* **Batch PDF Export:** Bulk ZIP download for invoices and purchase summaries using **Netlify Functions** as a secure proxy to handle high-volume PDF generation.

* **Review Period Management:** Mandatory window where payments are held before CCA payout.

* **Financial Pulse:** Real-time tracking of received amounts (with/without VAT) and total VAT.

* **Failure Forensics:** Detailed logs of why purchases failed (e.g., "3DS2 failure") with immediate recovery links to order-specific chat.

* **Unpaid Orders Tracker:** Track "Waiting Payment" status with time-elapsed indicators and ability to "trash" (hide) unpaid orders.

* **Success Tax Engine:** Tracks the "Stripe Fee" vs. the "CCA Share" to calculate actual net profit.

* **Accounting Exports:** Downloads for purchase lists and individual PDFs.

* **Invoice Management:** Real-time mutation (split/modify/resend) and list of all invoices with individual or bulk ZIP download options.

  * **Offer-to-Invoice Conversion Logic:** Implement a **"One-Click Conversion"** to turn an accepted offer into a formal invoice, deducting the "Preparation/Calculation Hour".

  * **Invoice Splitting:** Automatic replacement of one invoice with two if paid via mixed methods for accounting purity.

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

---

**7\. Job Management**

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

---

**8\. Workforce (CCA) Management**

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

---

**9\. Partner Management**

Management of third-party logistics and partners.

**Features:**

* **Partner Pipeline Tracker:** A visual "logistics timeline" showing physical goods transitioning from "Waiting for Delivery" to "Processing at Partner".

* **Partner Directory:** Filterable by activity and date.

* **Organization Hub:** Manages partner companies and their representative teams.

* **Profile Vault:** Access to partner address, TIN, and ID verification.

* **Contact & Chat:** Initiate tri-party chats (Admin-Partner-Buyer).

* **Information Sales Oversight:** Monitoring of orders where only partner contact details are sold.

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

**10\. Buyer & CRM Management**

Customer directory and troubleshooting tools.

**Features:**

* **Subject-Based Chat Isolation:** Support chats are permanently tied to specific **Order IDs**, isolating troubleshooting from general billing.

* **Buyer Directory:** Filter/search by join date, last purchase, or spending.

* **Profile Management:** Modify details, view full purchase history, and inspect results.

* **Shadowing:** Clerk-integrated session impersonation to see the site as the buyer does.

* **Buy/Spend Heatmap:** Visualization of buyer activity across categories to identify "Collection" fans

**Technical Considerations:**

* **TanStack Query Caching:** Used to maintain metric accuracy while minimizing mobile data usage.

* **Clerk Metadata Schema Nexus:** Use Zod as the nexus to share the Buyer Profile schema between Clerk metadata and the CRM form

---

**11\. AI Infrastructure & Prompt Engine**

Control center for generative intelligence.

**Features:**

* **Semantic Caching Metrics:** Displays potential cost savings by showing the hit-rate of **OpenAI Semantic Caching**.

* **Hierarchical Prompt Tree:** UI to manage complex sub-event lists (e.g., WW2 → Operation Barbarossa).

* **Prompt & List Control:** Update premade lists (Styles, Enchantments, Voices) and hidden AI prompts.

* **Prompt Logic Sandbox:** A field to test "Pro Combo Recipes" (e.g., \[Low Angle\] \+ \[Dolly In\]) directly against the Sora/Veo models

**Technical Considerations:**

* **Async Generator Streaming:** High-reasoning prompt tests must use **async generator streaming** to keep the connection active beyond Netlify's 10s timeout.

* **Localization Mapping:** Tool distinguishes between "Internal AI Prompts" (English) and "User-Facing Labels".

* **TanStack AI SDK:** Implemented for type-safe tool calling and streaming of Finnish-specific translation logic via OpenAI.

* **OpenAI Batch API Manager:** A UI to queue non-urgent translation or prompt refinement tasks for the 50% "Batch" discount

---

**12\. Dispute & Quality Assurance (QA)**

Handling customer complaints during the Review Period.

**Features:**

* **Dispute Logic Tree:** Integrated "Resolution Combinations" that automatically update the **Success Tax Engine** based on approved partial refunds.

* **Dispute Resolution Center:** Review cases filed during the Review Period.

* **Resolution Actions:** Approve (Trigger Redo or Refund) or Disapprove.

* **Accounting Integration:** Print combinations of resolutions for accounting purposes.

* **Redo Terminal Observer:** Ability for Admin to watch a CCA's redo process in the workbench to ensure quality compliance

**Technical Considerations:**

* **TanStack Query Optimistic Updates:** To reflect resolution actions immediately in the UI.

* **Atomic Redo Invalidation:** Use router.invalidate() to refresh both the Admin dispute view and the CCA's redo workbench simultaneously after a resolution

---

**13\. System Governance**

Standard administrative controls and security.

**Features:**

* **Persona Toggle Skeletons:** Implements custom **Skeleton screens** when switching between persona masks to mitigate visual "jank".

* **Role-Based Access Control (RBAC):** Access levels for Support, Accountant, and Super-Admin.

* **Audit Logs:** Records of which administrator made specific status or price changes.

* **Real-Time Alerts:** Notifications for disputes or AI queue failures.

* **Administrative Shadowing Log:** A record of whenever an Admin shadows a Buyer or CCA to maintain privacy standards

**Technical Considerations:**

* **Task Masking:** Visual "masks" hide unnecessary widgets based on role (e.g., Accountant Mask hides chat).

* **Zustand Persist Versioning:** Use the Zustand migrate function to handle schema updates for the persona store during platform upgrades

---

**14\. Support & Communication**

Omnichannel support and system logs.

**Features:**

* **Centralized Chat & Shadowing:** Real-time interface with a shadowing button directly inside the chat window.

* **System Logs:** History of failed purchases with reasons and links to Buyer, Order, and CCA.

* **Bug & System Logs:** Area for reporting site problems and viewing failures.

* **Wishlist & Support:** Monitoring area for user-submitted feature requests and "Upvoting".

* **AI-Enhanced Helpdesk:** Integration of the OpenAI Realtime API (Suomi voice) for low-latency voice-to-voice support

**Technical Considerations:**

* **Multilingual Shell:** Employs **react-i18next** with synchronous filesystem loading for SSR performance.

* **WebView Optimization:** Utilizing a non-blocking view overlay (**EventSplash**) in Capacitor to reduce perceived "jank" and load time.

* **SSE Search Streaming:** Ensure the Command Palette global search uses SSE to avoid Netlify task timeouts during complex AI retrievals

---

**15\. Pricing Management**

Centralized control for financial and tax rules.

**Features:**

* **VIES B2B Validation:** Automated **Stripe Tax** identity validation (VIES) for correct VAT exemptions.

* **Common Pricing Rules:** Global base pricing for credits, man-hours, and result types.

* **Advanced Discount Engine:** Temporal and Conditional (Nationality, Name, Domain) discounts.

* **VAT Management:** Global interface to modify platform-wide VAT rates.

* **Finnish Inflation Auto-Adjust:** A toggle to automatically adjust "Precision Partner Estimator" values based on local market data

**Technical Considerations:**

* **Invoicing Minimum:** System enforces a 1-hour minimum charge for all invoiced products.

* **Drizzle ACID Pricing:** Ensure global price updates are executed in an ACID transaction to prevent "split-pricing" during the transition period

---

**16\. Site-Wide Configuration (No-Code)**

Site-wide visual and structural management.

**Features:**

* **Direct String Transform Priority:** High-velocity layout animations must use **direct string transforms** rather than CSS variables for GPU acceleration on older Android WebViews.

* **Visual Identity:** Manage global color palettes and element color pickers.

* **Dynamic Forms:** Set attachment rules and required information per product.

* **Prompt & List Control:** Update premade lists (Styles, Historical Events, etc.) and hidden prompts.

* **Lottie Previewer:** A drag-and-drop area to upload and test new .lottie icons via the **ThorVG engine** before deployment

**Technical Considerations:**

* **Real-time Theme Updates:** Updates to colors reflect in the Capacitor mobile app theme in real-time via CSS Variables.

* **Motion LazyMotion feature tiering:** In the Config editor, load only the domAnimation subset initially to keep the TTI low while editing colors

**Content Creator Agent (CCA) Dashboard** 

---

**1\. CCA Home Page (Overview)**

The landing page serves as the "Mission Control" for agents, providing real-time summaries of production health, earnings, and market demand.

**Features**

* **Agent Pulse Cards (KPIs):** High-level summaries of the agent's standing: 

  * **Available Jobs:** Real-time count of manual tasks in the public queue.

  * **Active Workbench:** Count of jobs currently "In Progress" or "Redo in Progress".

  * **Negotiation Count:** Pending "Offer Requested" items requiring a quote.

* **Persona-Filtered Market Trends:** KPI cards include a toggle to view "Market Demand" (e.g., categories with the longest queues) alongside individual earnings to assist CCAs in prioritizing high-value tasks.

* **Earnings Transparency:** 

  * **Available Payout:** Revenue from completed jobs past the Review Period.

  * **Pending Share:** Revenue currently held in the Review Period buffer.

* **Urgency-Based Production Timers:** Color-coded progress bars (Green \> 48h, Yellow \< 24h, Red \< 6h) showing time remaining until target delivery.

* **AI Workflow Health Monitor:** A notification tile surfacing automated AI queue failures or processing delays for hybrid jobs.

* **Dispute Alerts:** Instant notification tiles for any "Disputed" job requiring immediate response or a redo.

* **SSE-Powered Global Search:** The command palette utilizes **Server-Sent Events (SSE)** streaming for AI-enhanced searches across active jobs and instructions, preventing Netlify timeouts on complex tasks.

* **Role-Specific Action Ribbon:** A dynamic UI section surfacing "Urgent Dispute Response" or "Expiring Review Periods" to minimize manual scrolling.

* **Hover Forensics on KPIs:** KPI cards reveal specific status details on hover (e.g., "Negotiation Count: 2 (Awaiting B2B Tax Validation)") to reduce click-depth.

**Technical Considerations**

* **Optimistic Status Toggles:** Implementation of onMutate via **TanStack Query** for "Taking a Job," allowing projects to appear on the workbench immediately while the server processes the assignment.

* **Hover-Triggered Data Pre-fetching:** Implementation of **TanStack Router** pre-fetching on job card hovers to ensure instantaneous transitions to the Workbench.

* **Streaming SSR for Metrics:** Utilization of TanStack Start’s defaultStreamHandler to deliver the dashboard shell immediately while streaming in earnings and job counts in **\<200ms**.

* **Manual Hydration Control:** Utilization of the skipHydration: true property for the earnings store to prevent "flashes of un-synced content" during initial mobile paint.

* **Nitro "Netlify\_Edge" Preset:** Configuration of the backend to utilize **V8 isolates** for **50ms-200ms cold starts** on high-frequency agent actions.

---

**2\. Overall Layout and Navigation (Persistent UI)**

Elements visible throughout the session to ensure high-fidelity navigation and workspace management.

**Features**

* **Dual-Queue Visibility:** Visual distinction between **"Offer Requested"** (initiated during purchase) and **"Waiting Offer"** (requested via contact) to prioritize paid projects.

* **Persona Switching:** A **Zustand-powered store** manages the seamless transition between Buyer and CCA views without a full page reload.

* **Transition Skeleton Screens:** Tailored skeleton loaders for the switch between "Buyer" and "CCA" personas to mitigate visual "jank".

* **Native-Sync Back Button:** Synchronization of the Capacitor @capacitor/app listener with the **TanStack Router useCanGoBack hook** to prevent accidental app exits.

* **Haptic Signature Patterns:** Distinct patterns to distinguish between "New Job Available" (soft pulse) and "Dispute Alert" (sharp vibration).

* **Multilingual Shell:** Language toggle linked to billing locale, controlled via **react-i18next**.

**Technical Considerations**

* **Rust-Based Bridge Optimization:** Enable the **Rust-based bridge** in capacitor.config.ts for Android 7.0+ devices to reduce haptic and gesture latency.

* **ThorVG Vector Icon Runtimes:** Utilization of the **ThorVG C++ engine** for all sidebar icons to ensure **80% faster rendering** and **70% lower memory usage** on low-end Android hardware.

* **LazyMotion Feature Tiering:** Use of **Motion for React LazyMotion** to load only the domAnimation subset initially, deferring heavy gesture logic until the agent enters the Workbench.

* **Non-Blocking EventSplash:** A custom Capacitor overlay allowing the React application to hydrate in the background while a brand animation plays.

---

**3\. Production Management (Queue & Workbench)**

An action-oriented production terminal replacing standard buyer histories.

**Features**

* **The "Marketplace" Queue:** A filterable list of available jobs categorized by product type and estimated manual work hours.

  * **Claim the job:** CCA has the ability to claim the job to themselves. System prevents simultaneous claiming, and returns as failed it another agent got the job.

* **Shared Element Navigation:** Use of Motion’s layoutId to morph job cards from the Queue into the active Workbench view during navigation for spatial consistency.

* **Consolidated Workbench:** 

  * **Claimed jobs**: List of jobs claimed with integrated customer chat.

  * **Action Required Priority Lane:** A dedicated sub-view isolating jobs waiting for "Needs More Information" or "Faulty Attachments".

  * **Redo Terminal:** Dedicated view for approved disputes where agents restart the process from the point of failure.

  * **Access all data:** Access to all customer-provided info, instructions, and downloads provided attachments.

  * **Job ready:** Abil Ability to send / set resulted files for customer / buyer / user and view dispute/payment statuses

* **Offer & Invoice Terminal (Internal to Production Management)**

  * **Offer Template:** Template-based generation for specific job types. Agents may provide offers even if the buyer hasn't paid the first "Prep Hour," accepting the risk of non-acceptance.

  * **One-Click Offer-to-Invoice:** Converts an accepted offer into an invoice, automatically **deducting the "Preparation/Calculation Hour"** already paid by the buyer.

* **Genealogy View Integration:** Visibility of "Middle Stage" results for modifications to existing generative assets.

* **Iceberg Metadata Filtering:** An analytical side-drawer using the **Apache Iceberg REST catalog** to filter historical "Jobs Done" by AI version or resolution.

* **Workbench "Soft Lock" UI:** Visual indicator showing if an Admin is currently **"Shadowing"** the workbench or reassigning the job to prevent state conflicts.

**Technical Considerations**

* **TanStack Table v8 Grouping:** High-performance grouping by "Status Meter" (e.g., "In Progress") to reduce visual density.

* **Delta Pattern Drafting:** Zustand stores manage local edits and result drafts, merging them with the base **TanStack Query** server state only upon final submission.

* **Predicate Pushdown Sync:** Utilization of **TanStack DB 0.5+** to fetch only the precise subset of job metadata required for the active viewport, maintaining sub-millisecond updates.

* **Capacitor SQLite Persistence:** Persistent local store for "In Progress" job metadata to prevent data loss during OS-level data eviction.

* **WebSocket "Soft Lock" Resolution:** Implement via **Supabase Realtime**; if an Admin reassigns a job, the CCA local state receives a DELETE event that optimistically clears the workbench with a mandatory reason notification.

* **Mandatory Idempotency Keys:** Enforced Stripe keys for every invoice generation attempt.

* **Stripe Tax Identity Integration:** Automatic validation of B2B Tax IDs via VIES before offer finalization for business customers.

* **Idempotency Key Transparency:** Surfaces **Stripe Idempotency Keys** in failure forensics to prevent double-charging during mobile network retries.

---

**4\. Profile & Legal Vault (CCA-Specific)**

Dedicated area for professional standing and legal compliance.

**Features**

* **Profile Management:** Modify name (requires re-identification), email, company, address, phone, and bank details for payouts.

* **Biometric Identity Vault:** Integration of **Ionic Identity Vault** for secure storage of the agent's TIN and ID status within the device's **Secure Enclave**. 

  * **Agent ID Security:** Identification documents are visible only to Admins/Super Admins; not even the agent can view them after submission.

* **Performance Badge Grid:** Public-facing metrics including average stars, reviews, and completion counts by product type.

* **Self-Service Payout Invoices:** CCAs have a dedicated area within Profile Management to download automatically generated invoices regarding their own earnings (e.g., share of taxless amounts), formatted for Finnish accounting.

**Technical Considerations**

* **Conform Intent-Based Uploads:** Use of **"Intent" buttons** for document submissions to allow list manipulation before JavaScript hydration is complete.

* **Isomorphic Validation Firewall:** Strict **Zod validation** enforced within createServerFn to reject malicious payloads before they touch the vault.

* **Biometric Secure Enclave Integration:** Utilize Ionic's **Identity Vault** to store the agent's TIN and ID verification status within the device's Secure Enclave, ensuring these sensitive keys never reside in standard storage.

---

**5\. Support**

Dedicated area for CCA-related assistance.

**Features**

* **Contact Admins:** Form and real-time chat tied to the subject at hand.

* **Shadowing Toggle:** In-chat toggle allowing agents to grant temporary shadowing access to Admins for troubleshooting.

---

**Conflict Warnings**

* **Job Redistribution:** All forcible job reassignments by Admins utilize **Supabase Realtime** to optimistically clear local CCA states and display a mandatory reason notification.

* **Animation Performance:** Dynamic colors will utilize **CSS Variables**. However, high-velocity layout animations (e.g., Workbench sliding panels) **must** prioritize **direct string transforms** (e.g., transform: "translateX(100px)") to remain on the GPU compositor, as CSS variables are not always hardware-accelerated on older Android WebViews.

* **AI Search Timeouts:** All AI-driven search features (e.g., Command Palette) **must** use **Server-Sent Events (SSE)** streaming via TanStack Start to keep the connection active and avoid Netlify’s default 10s timeout.

**User Dashboard**

**1\. User Home Page (Overview)**

The landing page provides a high-level summary of account health and active projects, tailored for the buyer journey.

**Features**

* **Buyer Pulse Cards (KPIs):** Real-time summaries of the user's standing: 

  * **Virtual Credit Balance:** Current available credits for automated purchases.

  * **Active Jobs Monitor:** Real-time counts of "In Queue" (AI/CCA), "In Progress," and "Action Required" (e.g., missing attachments) tasks.

  * **Quality & Review Timers:** Visualization of the **Review Period** expiration for delivered products and active disputes.

* **Urgency-Based Review Timers:** Color-coded progress bars (Green \> 48h, Yellow \< 24h, Red \< 6h) to prompt users to finalize quality checks before the period expires.

* **Real-Time AI Workflow Alerts:** A "System Health" notification tile surfacing automated AI queue failures or processing delays specifically for the user’s active jobs.

* **Financial Savings Tracker:** A KPI card displaying total credits saved through membership plans or seasonal discounts.

* **Credit/Cash Reconciliation View:** A breakdown within Pulse Cards showing revenue spent via Virtual Credit packs versus direct transaction sales to help users track funding sources.

* **Hover Forensics on KPIs:** Cards reveal specific status details on hover (e.g., "Missing Image Attachment") to reduce click-depth.

* **Hybrid Language Experience:** Utilize a "Golden Path" linguistic model where static UI labels are rendered with **DeepL** (for morphological precision) while dynamic user-facing status messages are handled by **GPT-5 Mini** (for *puhekieli*/informal nuance).

* **Quick Action-Ribbon:** UI section dynamically surfacing priority actions like "Claim Unpaid Offer" or "Resolve Failed Payment".

**Technical Considerations**

* **Nitro "Netlify\_Edge" Preset:** Configure the TanStack Start build engine to utilize the netlify\_edge preset, targeting V8 isolates for a **50ms-200ms cold start** improvement over traditional regional Lambda execution.

* **TanStack Query onMutate:** Implementation of optimistic updates for actions such as "Claim Unpaid Offer," allowing the UI to reflect status changes immediately while the server processes the transaction.

* **Predicate Pushdown Sync:** Utilization of **TanStack DB 0.5+** to fetch only active job metadata required for the Home Page, ensuring sub-millisecond initial load times.

* **Streaming SSR for Metrics:** Utilization of TanStack Start’s defaultStreamHandler to deliver the application shell immediately while streaming in "Buyer Pulse" data as it resolves on the server.

* **Stripe Tax Identity Integration:** Implement automatic B2B Tax ID validation via **VIES** within the checkout flow to apply correct VAT exemptions for international users. if user is presenting a company.

* **Query Caching:** Managed via TanStack Query to maintain metric accuracy while minimizing mobile data usage.

* **Optimistic Status Toggles:** Uses TanStack Query’s onMutate to reflect UI changes (like claiming an offer) immediately before server confirmation.

---

**2\. Overall Layout and Navigation (Persistent UI)**

Elements visible throughout the session to ensure high-fidelity navigation and workspace management.

**Features**

* **Contextual Multi-tenant Sidebar:** A dynamic system that adapts based on the active "Persona" (Buyer/CCA/Partner/Admin) stored in the global **Zustand** state.

* **Skeleton Role-Switching:** "Skeleton" screen overlays during persona transitions to mitigate visual "jank".

* **Privilege Selector:** A top-bar toggle allowing users with elevated permissions to switch workspace contexts seamlessly.

* **AI-Enhanced Command Palette:** A global search interface indexing Order IDs, Category names, and specific Result Metadata for rapid retrieval.

* **Native-Sync Back Button:** Synchronize the Capacitor @capacitor/app listener with the **TanStack Router useCanGoBack hook** to prevent users from exiting the app when navigating to previous dashboard views.

* **Haptic Signature Patterns:** Implement distinct Capacitor haptic vibration patterns for "Action Required" notifications vs. "Production Ready" alerts to increase the native-feel.

* **Haptic-Feedback Gestures:** Capacitor-native haptic triggers for sidebar persona switching and "Privilege Selector" toggles to enhance the "native-feel".

* **"Handshake" Component Protocol:** A "code cleaning" protocol for UI components imported via Framer Handshake to replace internal framer routing with **TanStack Router** links, ensuring seamless file-based navigation.

* **Multilingual Shell:** Language toggle linked to billing locale, controlled via **react-i18next**.

**Technical Considerations**

* **Rust-Based Bridge Optimization:** Enable the **Rust-based bridge** configuration in capacitor.config.ts for Android 7.0+ devices to reduce JNI call overhead and improve haptic/gesture response times.

* **LazyMotion Feature Tiering:** Implement the **Motion for React LazyMotion** component with the domAnimation feature set to reduce the initial JavaScript thread parse time by **86%**.

* **Non-Blocking EventSplash:** A custom Capacitor overlay allowing the React application and **TanStack Router** to hydrate in the background while a brand animation plays, reducing perceived load time by 90%.

* **ThorVG Animation Engine for icons:** Use of the **dotLottie/ThorVG** runtime for sidebar icons to ensure 80% faster rendering on low-end Android hardware compared to standard JSON.

* **Persona Synchronization:** Managed via the Zustand-powered Persona Store to align roles across mobile and desktop environments.

---

**3\. Profile Management**

Dedicated area for managing identity and applying for elevated status.

**Features**

* **Progressive CCA Onboarding:** A multi-step application form for **Content Creator Agent (CCA)** status using **"Intent" buttons** for document uploads, preventing user overwhelm.

* **Enterprise Identity Vault:** Integrate Ionic’s **Identity Vault** for CCA applicants to securely store biometric-protected tax documents (ID/TIN) in the device's Secure Enclave.

* **Legal Vault Integration:** A secure section within the profile for CCA applicants to view the status of ID and TIN (Tax Identification Number) documents, featuring field-level masking for sensitive data.

* **Basic Details & Avatar:** Management of Name, Email, Address, Phone, public profile description, and avatar.

**Technical Considerations**

* **Conform Intent-Based Submissions:** Utilize **Conform "Intent" buttons** for profile updates, allowing list manipulations to function even during the background hydration of the JavaScript bundle.

* **Isomorphic Validation Firewall:** Force strict **Zod validation** within the createServerFn .inputValidator() to ensure malicious document payloads are rejected before they touch the CCA Legal Vault.

* **Delta Pattern Storage:** Zustand manages local drafts during editing, while TanStack Query maintains the server's source of truth.

---

**4\. Purchase & Financial History**

Focused on historical data retrieval and lifecycle tracking.

**Features**

* **Purchase History Vault:** A comprehensive list of purchased products, filterable by status grouping or success/failure.

* **Mixed-Payment Reconciliation:** Explicitly display the split between **Virtual Credits** and **Direct Transaction** amounts in the order history, ensuring compliance with Finnish accounting standards for mixed-payment invoices.

* **Consolidated Health Status:** "Progressive Disclosure" where the primary order list shows a single status; detailed **"6-Meter"** tracking indicators are visible only upon row expansion to prevent UI clutter.

  * **Hover Forensics for Failures:** Status indicators reveal specific technical failure reasons (e.g., "Stripe 3DS2 failure") on hover.

* **Financial Documentation:** Capability to download invoices or purchase summaries as PDF files.

* **Idempotency Key Transparency:** Surface **Stripe Idempotency Keys** in the "Failure Forensics" hover tooltip to provide references for preventing double-charging during network retries.

* **One-Click Offer Conversion:** Direct **"Accept & Pay"** buttons for "Offer Requested" items to trigger immediate Stripe sessions or credit deductions.

* **Unpaid Order "Trash" Bin:** Capability to hide or "trash" expired "Waiting Payment" orders to maintain a clean history, with a 30-day auto-delete for hidden items.

* **Active Editing Window:** Permission-based ability to modify order details if the product is not yet "In Making" or "Delivered".

**Technical Considerations**

* **Row-Level Security (RLS) Parity:** Utilize a custom Drizzle/Supabase client to inject the **Clerk JWT sub claim** into the Postgres session, ensuring users only query their own financial records at the database level.

* **TanStack Table v8 Virtualization:** Implementation of row virtualization for users with large histories (\>100 orders) to maintain high FPS within the Capacitor WebView.

* **Query-Driven Sync (TanStack DB 0.5+):** Employs **Predicate Pushdown** to fetch only the precise subset of order data required by active filters.

---

**5\. Asset Management Vault**

Central repository for organizing and downloading generative results.

**Features**

* **Smart Result Gallery:** High-performance thumbnail grid with advanced filtering and hierarchical organization.

* **Hierarchical Organization:** User-defined categories and subcategories to organize generative results.

* **Egress-Free Batch Previews:** Leverage **Cloudflare R2’s Tiered Read Cache** to serve asset thumbnails, ensuring high-frequency gallery browsing incurs **zero egress bandwidth costs**.

* **Regional Jurisdictional Markers:** Visual badges indicating if assets are stored within EU-restricted R2 buckets to confirm GDPR compliance and data sovereignty.

* **Iceberg Metadata Filtering:** Integrate the **Apache Iceberg REST catalog** into the side-drawer to filter massive vaults by AI engine version (e.g., "Veo" vs. "Sora") or specific enchantment parameters.

* **Batch "Move-to-Category":** Multi-select and drag-and-drop interactions using **Motion for React** to organize files into folders.

* **AI-Powered "Translate All" Drawer:** Side-drawer tool utilizing DeepL or OpenAI to translate custom categories and descriptions into the user's billing locale.

* **Bulk Actions:** Capability to download assets individually or as combined **ZIP archives**.

* **Social Integration:** Direct sharing of results to social media platforms.

**Technical Considerations**

* **R2 Synchronous Write Verification:** Ensure asset uploads return an HTTP 200 only after the **Synchronous Write** to R2 is persisted, preventing eventual consistency "ghosting".

* **Cloudflare R2 Zero-Egress Storage:** Thumbnails and full-resolution downloads are routed through **R2** to eliminate egress costs.

* **Capacitor SQLite:** Persistent store for large result histories to prevent OS data eviction and improve offline access.

---

**6\. Expansion Workflows**

Workflows for further purchases and physical conversions.

**Features**

* **Visual Modification Comparison:** A **"Split-View"** comparison between a current asset and a proposed expansion/modification result.

* **Physical Prototype Estimator:** Real-time price estimator for converting digital assets into 3D Lithophanes or Metal Prints prior to ordering.

  * **Precision Partner Estimator:** Integrate real-time pricing from the user's **Local printing landscape** (e.g., in Finland Ifolor 10cm prints at €0.14-€0.28) directly into the physical prototype estimator.

* **Partner Pipeline Tracker:** A visual tracker for physical products showing the transition from "Waiting for Delivery" to "Processing at Partner" and finally "At Delivery".

* **Iterative Modification Branching:** A **"Genealogy View"** allowing users to see the history of a result and jump back to a "middle stage" to start a new modification path.

* **Physical Product Orders:** One-click paths to convert digital results into physical products via authorized partners.

* **Recommendation Engine:** Smart suggestions for future purchases based on result metadata.

**Technical Considerations**

* **One-Click Offer-to-Invoice Logic:** Implement a dashboard trigger that **Deducts the "Preparation/Calculation Hour"** (1-hour minimum) from the final converted invoice when a user accepts an offer.

* **Recursive Metadata Linking:** Use of the parent order ID as a metadata link in new expansion orders to maintain a traceable database genealogy.

* **One-Click Conversion:** createServerFn handles complex logic for digital-to-partner physical orders.

---

**7\. Support & Communication**

Standalone area for resolving issues and feature requests.

**Features**

* **Integrated Support Center:** Access to contact forms, bug reporting, and site-wide contact details.

* **Order-Specific Thread Isolation:** Permanently tie support chats to specific **Order IDs**, isolating technical troubleshooting from general billing inquiries to reduce agent confusion.

* **Admin Shadowing Trigger:** A **"Troubleshoot View"** toggle in support chat that grants temporary **Clerk-integrated** shadowing access to administrators.

* **Subject-Based Chat:** Order-specific chat interfaces permanently tied to the Order ID.

  * **In-Chat Shadowing Button:** A toggle within the subject-based chat that allows a user to grant an Admin temporary **Clerk-integrated** shadowing access for troubleshooting.

* **Wishlist:** A specific area for users to submit requests for new features or products.

  * **Wishlist Voting:** Capability for users to "Upvote" existing feature requests to help prioritize development.

**Technical Considerations**

* **Edge-Ready Webhook Verification:** Route Stripe webhooks through **Netlify Functions** using the constructEventAsync method to handle signature verification with ArrayBuffer payloads, avoiding Node-specific Buffer dependencies at the edge.

* **ConstructEventAsync Verification:** Routing of all Stripe-triggered transactional emails through **Netlify Functions** to ensure signature verification is compatible with edge runtimes.

* **Resend & React Email:** Infrastructure used for transactional updates regarding support tickets and order-specific chat notifications.

  * **Resend Transactional Proxy:** Chat and ticket notifications are routed through **Netlify Functions** to securely manage API keys and **React Email** templates.

---

**Conflict Warning**

* **Conflict:** **Real-time mobile app theme updates** via CSS Variables may conflict with hardware-accelerated animations in **Motion for React v12**, which prioritizes string transforms on Android. 

  * **Resolution:** Dynamic colors will still utilize **CSS Variables**. However, high-frequency layout animations will prioritize **direct string transforms** (e.g., transform: "translateX(100px)") to ensure they stay on the GPU compositor.

* **Conflict:** **AI-enhanced fuzzy search** GPT-5 calls can take 10-26 seconds, exceeding Netlify's 10s default timeout. 

  * **Resolution:** All AI-driven features **must** use **Server-Sent Events (SSE)** streaming via TanStack Start server functions to keep the connection active and provide word-by-word updates.


> **Status:** historical — family F4; superseded by `docs/design/dashboards/dashboards-blueprint.md`. Kept for provenance; not current. Source: `Visualisatium/planning/Dashboard/Dashboards_Master_Blueprint.md`. 

# THE STRATEGIC BLUEPRINT: VIVID MASTER DASHBOARDS
**Filename:** `planning/Dashboards_Master_Blueprint.md`
**Phase:** 4 (Synthesis & Idealization)

## 1. STRATEGIC VISION & CORE ARCHITECTURE
Dashboards in VIVID are not administrative backends; they are tailored, psychological environments built on a multi-tenant React shell powered by **TanStack Start**, **TanStack Router**, and **Zustand**. A single codebase serves all four personas, utilizing a "Zustand Persona Switcher" to dynamically swap layouts, routing permissions, and API boundaries. 

*Constraint Engine:* All pricing, credits, discounts, man-hours, and royalty splits referenced in the UI are fetched dynamically from the `PricingTable` and `pricing-plan-vivid-v2` data stores.

---

## 2. THE USER DASHBOARD: "THE LEGACY STUDIO"
**Concept:** A gamified, interactive space focused on narrative building and data preservation, abstracting away the feeling of an "eCommerce cart".

### A. The Buyer Pulse & Gamification (Home)
*   **Preservation Score Gauge:** A visual meter (0-100%) tracking "Legacy Security" (e.g., Uploading raw photos = points; Ordering physical backups or Voice Models maximizes the score).
*   **Curator's Co-Op:** A crowdfunding widget allowing the "Family History Manager" to generate a `Contribute_Link`. Relatives can donate Credits to fund expensive, high-tier Sagas.
*   **Financial & Urgency Monitors:** Color-coded progress bars for expiring 14-Day Review Periods. Explicit Credit/Cash Reconciliation views showing total value saved via Credit Pack discounts.

### B. The Smart Asset Vault & Genealogy
*   **Unprocessed Raw Materials Inbox (NEW):** When a Partner digitizes a physical item, the high-res file lands here automatically. The UI presents it as raw material ready for the user to select an AI product to apply to it.
*   **Zero-Egress Gallery:** Powered by Cloudflare R2 Tiered Read Cache, allowing users to browse thousands of thumbnails without platform bandwidth costs. Includes an Apache Iceberg-powered side-drawer to filter assets by AI engine or Enchantment tags.
*   **The Genealogy Explorer 2.0:** A visual, interactive node-graph (using Motion for React). Users can trace an asset's history: `Raw VHS Upload` -> `Restored Image` -> `Animated Video`. They can click any "middle stage" node to branch off a new order.
*   **Asset DNA Integration:** Characters saved to the vault retain their "Recipe" (Seeds, Prompts, LoRAs) for perfect consistency in future orders.

### C. Expansion Workflows & The Saga Canvas
*   **Interactive Saga Storyboard:** Before purchasing a complex Collection or Saga, the user accesses a drag-and-drop canvas. They drag their `Asset DNA` or items from the Unprocessed Inbox into "Scene" slots to outline the narrative.
*   **Phygital 3D Previewer:** Before converting a digital asset into a physical "Memory Stone" or Lithophane, a WebGL canvas previews the physical object directly in the browser, pulling real-time pricing from local printing partners.
*   **Order-Isolated Support:** Support chats are permanently tied to specific Order IDs to prevent context collapse. Includes an "Allow Admin Shadowing" toggle for troubleshooting.

---

## 3. THE CCA DASHBOARD: "THE EXCELLENCE ENGINE"
**Concept:** A high-speed, distraction-free environment optimized for flow, extreme quality control, and transparent earnings.

### A. Mission Control & Marketplace
*   **Dual-Queue Visibility:** Visual separation between standard "In Queue" (paid) jobs and "Waiting Offer" (risk/unpaid quote requests).
*   **Dynamic Bidding & Surge UI:** Jobs waiting longer than target SLAs show a "Fire Icon" and a dynamically increased payout multiplier to ensure marketplace liquidity.
*   **Quality Streak Engine (NEW):** Completing a set number of consecutive 5-star jobs (with zero disputes) grants a "Flame Badge" and a temporary payout multiplier (dynamically fetched) to incentivize perfection, not just speed.
*   **P2P Job Transfer Auction (NEW):** If a CCA claims a job but lacks a specific skill, they can transfer it to a sub-marketplace for another CCA, offering to split their fee.

### B. The Active Workbench (Production Mode)
*   **Flow State UX:** When a job is claimed, navigation collapses. Zustand manages local `Delta Pattern` drafting so edits are safe offline (`Capacitor SQLite`). It syncs to TanStack Query only upon "Save/Submit".
*   **Smart Copilot Offer Drafter:** Scans user instructions and file counts, suggesting a "Manhour Quote" based on historical averages and `Lists` complexity. The CCA can accept or tweak it.
*   **Asset DNA Injection & Pre-Flight Check:** A button instantly auto-fills Prompts from the user's `Asset_DNA`. An automated pre-flight local classifier checks the output draft against the DNA triggers, warning if core elements are missing.
*   **Concurrent Edit "Soft Lock":** Supabase Presence broadcasts a "Locked by HQ" or "Locked by CCA_123" badge to prevent concurrent editing collisions.

### C. Profile & Legal Vault
*   **Biometric Enclave:** Tax ID (TIN) and Identity documents are stored securely via Ionic Identity Vault, requiring hardware biometric authentication to access.
*   **Automated Self-Invoicing:** One-click generation of self-service payout invoices formatted for Finnish accounting, detailing their taxless share of the work.

---

## 4. THE PARTNER DASHBOARD: "THE LOGISTICS & ROYALTY HUB"
**Concept:** Frictionless ingestion that turns local digitization shops into passive-income affiliates.

### A. Logistics Signal Board & Intake
*   **Capacitor Native QR Scanner (NEW):** A massive, native camera button. When a physical package arrives, the Partner scans the VIVID tracking label. This instantly updates the User's `Partner Pipeline Tracker` to *"Safe at Partner Facility."*
*   **Lead Radar:** A list of Users who paid the "Information Unlock" fee to see the Partner's details, allowing Partners to log off-platform physical deals.

### B. The Digital Bridge & Passive Royalty Engine
*   **Frictionless Ingest:** When digitization is complete, the Partner bulk-uploads the high-res files directly via a drag-and-drop gateway. The system injects these directly into the User's `Unprocessed Raw Materials Inbox`.
*   **The Tracking Tag:** The system automatically and silently injects the Partner's `origin_partner_id` into the file's metadata. 
*   **The Royalty Ticker:** If the User *ever* uses that digitized file to buy a generated product, the System detects the tag and routes the configured percentage (from the Pricing Sheets) to the Partner's Escrow. A real-time ticker displays: *"Lifetime Passive Royalties: €[Variable]. Upload more digital deliveries to grow your passive revenue stream."*

---

## 5. THE ADMIN DASHBOARD: "MISSION CONTROL"
**Concept:** Forensic observability, proactive AI intervention, and strict economic tracking.

### A. God-Eye View & Predictive Pulse
*   **Differential KPI Streaming:** Uses TanStack Start (SSE) and TanStack DB to stream real-time metrics (Active Jobs, Revenue vs. Virtual Credits, Disputed Orders) in sub-milliseconds without Netlify timeouts.
*   **Predictive SLA Radar (NEW):** AI forecasts potential queue bottlenecks based on active CCA counts and incoming job volume.
*   **GPU Fraud Canary (NEW):** Edge functions track high-velocity generative abuse (like scripts spamming "Re-Rolls"), flagging anomalous RunPod compute drain and temporarily pausing generation capabilities for malicious accounts.

### B. Forensics, Governance & Shadowing
*   **Hover Forensics:** Hovering over a "Failed" status meter instantly reveals the raw technical error (e.g., "Stripe 3DS2 Failure") without requiring a click-through.
*   **The Shadowing Engine (Clerk Integration):** Allows Admins to securely "Log in as CCA" or "Log in as Buyer." Defaults to "Ghost Mode" (Read-Only). Explicit toggle required for "Intervention Mode" (triggers Soft Lock).
*   **Virtualized Order Lists:** Implements TanStack Table v8 to maintain 60 FPS performance when viewing histories exceeding 100+ orders.

### C. Catalog Configuration & Accounting Ledger
*   **Category/Product Dnd Manager:** Drag-and-drop interface (`Motion for React`) for rearranging the catalog, integrated with DeepL/OpenAI for 1-click "Translate All" JSONB localization.
*   **The Smart Template Editor:** A no-code visual builder to adjust product lists, "Required Data" fields (using Conform intent-based validation), and automated workflows.
*   **Success Tax Visualizer:** Calculates true platform margin dynamically using the formula: `(Realized FIFO Revenue) - VAT - Stripe Fees - CCA Share - Partner Royalty`. 
*   **Mixed-Payment Splitter:** Automatically generates split invoices for accounting purity when a user pays with a mix of Credits and Cash.
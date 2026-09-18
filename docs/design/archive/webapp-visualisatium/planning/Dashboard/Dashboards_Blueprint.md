> **Status:** historical — family F4; superseded by `docs/design/dashboards/dashboards-blueprint.md`. Kept for provenance; not current. Source: `Visualisatium/planning/Dashboard/Dashboards_Blueprint.md`. 

# THE STRATEGIC BLUEPRINT: VIVID DASHBOARD EVOLUTION
**Filename:** `planning/Dashboards_Blueprint.md`
**Phase:** 4 (Expansion & Ideation)

## 1. PITCH & HOOK
Dashboards are traditionally administrative dead-zones. In VIVID, the Dashboards *are* the product experience.
*   **For the User:** It is a "Digital Studio" and a gamified legacy builder, shifting psychology from "buying a file" to "funding a legacy."
*   **For the CCA:** It is a high-speed, gamified trading terminal optimized for maximum throughput and quality.
*   **For the Partner:** It is a passive-income "Royalty Radar" and streamlined logistics hub.
*   **For the Admin:** It is an "Air Traffic Control" tower with predictive AI and forensic economic observability.

## 2. NEW FEATURE EXPANSIONS BY PERSONA

### A. The User Dashboard: "The Legacy Studio"
1.  **The 3D Phygital Previewer:** Before a user buys a physical "Memory Stone" (€35) or Lithophane, they can click a button on their generated image to open a 3D WebGL preview (rendered via ThorVG or similar lightweight engine on device) showing exactly how it will look as a physical object. 
2.  **The "Curator's Co-Op" Tracker:** A widget for the "Family History Manager" to manage their `Contribute_Link`. They can see a progress bar for an expensive Saga (e.g., €150 Visual Biography) filling up as family members donate Credits.
3.  **The Interactive Saga Storyboard:** Before purchasing a Saga, the user accesses a visual drag-and-drop canvas. They drag their pet's `Asset DNA` from their Vault into "Scene" slots to plan the story, building emotional investment before hitting the paywall.

### B. The CCA Dashboard: "The Excellence Engine"
1.  **Quality Streak Multiplier (Gamification):** Balances the "Surge Pricing" (which incentivizes speed). A visual widget showing consecutive 5-star jobs without a dispute. Hitting a streak of 5 grants a "Flame Badge" and a temporary +5% increase to their payout share.
2.  **P2P Job Transfer Auction:** If a CCA claims a job but realizes they lack a specific skill (e.g., complex 3D rendering), they can transfer it to a "Priority Sub-Marketplace" for another CCA, offering to split their fee (e.g., "I'll take 10% for the lead, you take 90% for the work").
3.  **Pre-Flight AI Consistency Check:** Before hitting "Submit for Review," an automated local classifier compares the output image against the `Asset_DNA` triggers to warn the CCA: *"Warning: 'Red Scarf' missing from output."*

### C. The Partner Dashboard: "The Sales Engine"
1.  **The Phygital Upsell Loop:** When a Partner marks a physical package as `Processing_Digital` and uploads the file, they are prompted: *"Suggest an AI Enhancement to the User?"* They can select a recommendation (e.g., *Standard 4K Video* edit). The User gets a push notification, and if they convert, the Partner earns their 10% Royalty automatically.
2.  **The Royalty Ticker (FOMO):** A real-time counter showing: *"Lifetime Royalties Earned: €412.50"*. If they haven't uploaded files recently, it shows *"Missed Revenue Warning: Upload digital files to activate your 5-10% perpetual royalty."*
3.  **Capacitor Native QR Scanner:** A giant "Scan Package" button utilizing the mobile device's camera to scan the VIVID shipping label, instantly advancing the User's `Partner Pipeline Tracker`.

### D. The Admin Dashboard: "The AI Sentinel"
1.  **Predictive SLA Radar:** An AI-driven KPI card that forecasts queue bottlenecks 48 hours in advance by analyzing "In Queue" volume against active CCA count. Warns: *"SLA breach likely in Video category by Tuesday."*
2.  **The GPU Fraud Canary:** A security monitor tracking "Re-Roll" (2 Credit / €0.20) velocity. If an account triggers >20 Re-Rolls in 5 minutes via a script, it flags the account for "Anomalous Compute Drain" and temporarily pauses generation to protect RunPod margins.
3.  **Real-Time Escrow Heatmap:** Visualizes exactly how much cash is locked in `delivered` status (Review Period) vs `completed` (Available for Payout), essential for cash flow management.

## 3. ECONOMIC SIMULATION (The Success Tax & Upsell Loop)

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

## 4. THE RIPPLE EFFECT (System Dependencies)
1.  **Database (Supabase):** `Orders` table requires an `upsell_origin_partner_id`. `Users` table requires a `preservation_score` integer. `CCAs` table requires a `quality_streak_count`.
2.  **State (TanStack Store & Zustand):** The Interactive Saga Storyboard requires complex client-side drag-and-drop state.
3.  **Mobile (Capacitor):** Partner QR Scanner requires native camera permissions payload.
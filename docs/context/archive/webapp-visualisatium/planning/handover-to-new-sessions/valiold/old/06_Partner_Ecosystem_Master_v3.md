> **Status:** historical — family F11; superseded by `docs/context/sources/06-partner-ecosystem.md`. Kept for provenance; not current. Source: `Visualisatium/planning/handover-to-new-sessions/valiold/old/06_Partner_Ecosystem_Master_v3.md`. 

# PARTNER ECOSYSTEM & LOGISTICS MASTER SPEC (v2.2)
**Role:** The "Middle Man" Architecture. We sell connections and assets, not services.
**Key Pivot:** Turning Partners from "Vendors" into "Affiliates" via Royalties.
**Context:** We are the Middle-man. We do not handle physical goods or payments for digitization. We sell *connections*.
**Pricing of partners: ** We do not set the price. We display the price (or an estimate) and possibly pass the order.
**Requirement:** The Partner **SHOULD** upload the resulting digital files to the User's "Vivid Vault" (R2 Bucket). This is the "Hook" for our editing services.

---

## 1. THE PARTNER MODEL: "THE UNLOCK PROTOCOL"
We monetize the *connection*, not the physical service.

### A. Product A: "The Scout Service" (Directory)

#### Product A1: User pays to unlock
* **Scenario:** User has a box of 8mm tapes and doesn't know where to go.
* **The Product:** "Partner Information Unlock".
* **Price:** As in Pricing table.
* **Mechanism:** User enters Location + Media Type -> System returns "Best Match" Report + Referral Code.
* **Scenario B (The "Verified Listing"):** Partners can pay a monthly "Marketing Fee" to make their contact info **FREE** to users (removing the 2 Credit barrier).
* **Value:** System analyzes User Location + Media Type (VHS/8mm) -> Matches with `Partner_Database` capabilities -> Returns the "Best Match" Report with contact details and a "Referral Code" (for potential discount).

#### Product A2: Partner pays to reveal
* **Scenario:** Partner wants more volume.
* **The Deal:** Partner pays a monthly "Marketing Fee" to Vivid.
* **Benefit:** Their contact info becomes **FREE** to users (removing the 2 Credit barrier).
* **Badge:** Displayed as "Verified Partner" on the map.

### B. Product B: "The Digital Bridge" (Integration)
* **Scenario:** User wants the full package.
* **Mechanism:** We contact both User and Partner to organize their deal. We charge both User and Partner (amount on hourly basis).


### C. Liability Shield
* **The "Yellow Line" Rule:** The UI clearly delineates where Vivid ends and Partner begins.
* **Disclaimer:** "You are leaving Vivid. Dealings regarding physical goods are solely between you and [Partner Name]. Vivid holds no liability for shipping loss or damage."
* **Requirement:** User must check "I Understand" before the Contact Info is revealed.


### D. The "Origin Royalty" (The Growth Hack)
**Concept:** Turn Partners into Affiliates.
* **The Logic:** `If (File_Origin == Partner_X) AND (User_Buys_Edit_Service) THEN (Pay Partner_X 5% Commission)`.
* **Pre-Processing:** Partner embeds their `Partner_ID` in metadata when uploading digitized files to the user's Vault.


---

## 2. THE "ROYALTY" MODEL (THE ORIGIN STAMP)
**Concept:** Turn Partners from "Vendors" into "Affiliates."
**Logic:** Digitalization Partner uploads file to us. If User *ever* spends money on that file (enhancing, animating, printing), Partner gets a cut.
**Old Model:** User pays Partner for digitization. We get nothing. Partner forgets us.


### The Technical Flow
1.  **Ingest:** Partner uploads file via Dashboard.
2.  **Tagging:** System stamps metadata:
    ~~~json
    {
      "origin_partner_id": "helsinki_digitointi_oy",
      "royalty_eligible": true,
      "royalty_rate": 0.05,
      "expiry": "2028-01-01" // 2 Year Trailing Commission
    }
    ~~~
3.  **Conversion:** 
* **Scenario:** User logs in 3 months later. They see their digitized VHS.
* **Purchase:** User buys "Make Highlight Reel" (e.g. €50.00).
* **Execution:**
    * System checks input files. Finds `origin_partner_id`.
    * Transaction Split:
        * Vivid Revenue: e.g. €47.50
        * Partner Wallet (Pending): e.g. €2.50
* **Notification:** Partner gets an email: "Your digitized file just generated €2.50. Keep uploading!"
4.  **Payout:** Partner Wallet receives €2.50 (5%).
5.  **Notification:** "Your scan just generated revenue."

### . PARTNER TIERS
* **Bronze (Directory Only):** No commission. Just listed on the map.
* **Silver (Uploader):** 3% Royalty on files they upload.
* **Gold (Integrated):** 5% Royalty + "Verified" Badge. (Requires API integration).

---

## 3. LOGISTICS: "CHAIN OF CUSTODY" (Physical Logistics)
**Objective:** Track physical items sent between users and partners. Even though we don't handle the money/shipping, we need the *Status* to trigger our Digital Products (e.g., "Start Video Editing when VHS is digitized").

### The "Digital Handshake" Flow
1.  **Match:** User unlocks Partner Info.
2.  **Handoff:** User contacts Partner off-platform (email/phone).
3.  **The Signal:**
    * **User Action:** In Dashboard, User clicks "I have sent the package".
    * **Partner Action:** Partner (if logged in) clicks "Package Received" on their dashboard.
    * **Incentive:** Why does the Partner click? Because *we* might send them the "Digitization Metadata Form" (a printed sheet user puts in box) that makes their job easier.
	
### User Stories
* **As a User**, I want to download a shipping label with a unique QR code so that my package is linked to my digital order.
* **As a User**, I want to receive a notification when the Partner physically scans my package so I know it didn't get lost in the mail.
* **As a Partner**, I want a "Logistics View" to scan incoming QR codes and update statuses to "Received" instantly.

### Technical Logic (Mermaid)
~~~mermaid
sequenceDiagram
    participant User
    participant System
    participant Carrier_API
    participant Partner
    
    User->>System: Order "VHS Digitization"
    System->>User: Generates PDF Label (Order ID embedded)
    User->>Carrier_API: Ships Package
    Carrier_API->>System: Webhook: "In Transit"
    System->>User: Notification: "Package on its way"
    Partner->>System: Scans QR Code (Arrival)
    System->>System: Update Status: "Physical_Received"
    System->>User: Notification: "Safe at Partner Facility"
~~~

### The Status State Machine
1.  **Initiation:** `Awaiting_Shipment`. System generates **QR Shipping Label** (Integrated Partners only).
2.  **Transit:** `In_Transit_Inbound`. Carrier webhook updates status. Possible integration with carrier API (e.g. Posti/DHL)
3.  **Intake:** `Physical_Received`. Partner scans QR code. -> **Notification:** "Safe at Partner Facility."
4.  **Processing:** `Processing_Digital`.
5.  **Return:** `In_Transit_Outbound`. Partner ships physical items back to user.
6.  **Closure:** `Items_Returned`. User confirms receipt.

---

## 4. SUPPLY CHAIN PARTNERS (VIRTUAL WAREHOUSE)
**Note:** Research Task (File 01) is to *verify* the API capabilities of these specific vendors.
**Strategy:** Middleware Automation routes orders based on SKU prefixes.


| Product | SKU Prefix | Primary Partner | Location | Integration Type |
| :--- | :--- | :--- | :--- | :--- |
| **3D Pet Figurine** | `FIG-` | **i.materialise** | Belgium | **API**. Send .obj Use PolyJet (Multicolor+) |
| **Lithophane Box** | `LITHO-` | **Manubim** | Hungary | **Manual/CSV**. Send via email parser |
| **Vinyl Record** | `VINYL-` | **Dr. Dub** | Austria | **Manual/Portal**. Send Audio Link + Cover Art. |
| **Jewelry** | `RING-` | **OwnPrint** | Netherlands | **API**. Send Vector Waveform. |
| **Video Brochure** | `VBOOK-` | **Media Plant** | UK | **Trade/FTP**. Send MP4. **Must use IOSS** for EU.) |
| **NFC Stone** | `NFC-` | **NFC-Tag-Shop** | Germany | **Configurator**. Send Link to write to chip. |

---

## 5. THE IP PARTNER PROGRAM ("OFFICIAL WORLDS")
**Context:** Solving the Copyright/Trademark issue. User wants "Star Wars". We can't give it. But we can give "Galactic Knights" OR "Official Indie Worlds".
**Strategy:** "Legally Distinct" vs "Official".
**User Choices:**
  1.	Option A: "Switch to 'Galactic Civil War' (Our Legally Distinct Fork)."
  2.	Option B: "Cancel Generation (No charge)."
  * **Universal Option:** "Notify me if VIVID acquires the official license for [Brand]." (Data used for BizDev leverage).

### Tier 1: "Legally Distinct" Themes (Internal)
Managed by us.
* **Content:** Generic LoRAs that capture a *vibe* without infringing. "Legally Distinct" Themes
* **Examples:** "The Galaxy Wars" (Not Star Wars), "The Wizarding Academy" (Not Harry Potter), "The Wasteland Wanderer" (Not Fallout).
* **Asset:** We train generic LoRAs that capture the *vibe* without infringing trademarks.

### Tier 2: The "Official Partner" Portal (External)
"Official Partner Portal". Indie Authors/Game Studios upload their **Official LoRA** and **Lore Bible**.
**Target example:** Indie Authors, Comic Creators, Game Studios, Influencers.
* **The Pitch:** "Let fans put themselves in YOUR world."
* **The Mechanism:**
    * Creator uploads their **Official LoRA** (Art Style + Characters).
    * Creator uploads their **Lore Bible** (World Rules).
* **Product:** "Official [Book Name] Character Creator".

### The Revenue Split
* **Price:** User pays **Standard Price + 20%** (e.g., €6 instead of €5).
* **Split:** The 5-20% Premium goes *directly* to the IP Holder.
* **Benefit:**
    * **For Us:** Exclusive content, free marketing (Creator tells their fans).
    * **For Creator:** Passive income, fan engagement.

### THE "IP REQUEST" FORM
* **Location:** In the "Theme Selector" (Split Choice UI).
* **Text:** "Don't see your favorite world? Request it!"
* **Action:**
    * User suggests "Warhammer 40k".
    * If we get 100 requests, our BizDev team contacts Games Workshop: "We have 100 users ready to pay. Let's talk."

---

## 6. PARTNER DASHBOARD SPEC
**Access:** Users with `role: partner`.
**Audience:** Partners (Digitization Shops, Print Labs).
**Goal:** Manage Leads and Signal Status. (No financial transactions for service).

### A. The "Lead Radar"  (Home View)
A list of users who have "Unlocked" this partner's information.
* **Incoming Inquiries:**
    * `User_ID` (Alias/Name)
    * `Interest`: "VHS Digitization" (Derived from the Product they clicked).
    * `Status`: "Information Revealed" / "Contacted".
* **Action:** "Log Deal" (Partner marks if the user actually booked a service).

### B. The "Logistics Signal" Board
Allows the Partner to update the status of physical goods so the User stops worrying.
* **Input:** "Enter Order ID / Scan QR" (If user included our slip).
* **Actions:**
    * `Mark Received`: Sends "Safe Arrival" notification to User.
    * `Mark Completed`: Signals that digital files are ready.
* **The Upload Gateway (The "Bridge"):**
    * Even if paid off-platform, the Partner *uploads* the result here.
    * **Why?** It pushes the content directly into the User's `Smart Collection` pipeline.

### C. Profile Manager
* **My Services:** Checkboxes for what they can do (VHS, 3D Print, Canvas, 8mm, Photo Slide).
* **Availability:** Toggle "Accepting New Jobs".
* **Listing Tier:** "Standard" (User pays to see info) vs "Verified" (Free for user).

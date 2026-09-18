> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Partner_Ecosystem_Logic.md`. 

# BUSINESS LOGIC: THE PARTNER ECOSYSTEM (Reseller/Info Model)
**Context:** We are the Middle-man. We do not handle physical goods or payments for digitization. We sell *connections*.

## 1. THE BUSINESS MODEL: "THE UNLOCK PROTOCOL"
We monetize the *connection*, not the service.

### Product A: "The Scout Service" (User Pays)
* **Scenario:** User has a box of 8mm tapes and doesn't know where to go.
* **The Product:** Defined in `Products.xlsx` as "Information / Partner Information".
* **Price:** 2 Credits (~€10).
* **Value:** System analyzes User Location + Media Type (VHS/8mm) -> Matches with `Partner_Database` capabilities -> Returns the "Best Match" Report with contact details and a "Referral Code" (for potential discount).

### Product B: "The Verified Listing" (Partner Pays - Future)
* **Scenario:** Partner wants more volume.
* **The Deal:** Partner pays a monthly "Marketing Fee" to Visualisatium.
* **Benefit:** Their contact info becomes **FREE** to users (removing the 2 Credit barrier).
* **Badge:** Displayed as "Verified Partner" on the map.

## 2. THE LOGISTICS: "HANDS-OFF TRACKING"
Even though we don't handle the money/shipping, we need the *Status* to trigger our Digital Products (e.g., "Start Video Editing when VHS is digitized").

### The "Digital Handshake" Flow
1.  **Match:** User unlocks Partner Info.
2.  **Handoff:** User contacts Partner off-platform (email/phone).
3.  **The Signal:**
    * **User Action:** In Dashboard, User clicks "I have sent the package".
    * **Partner Action:** Partner (if logged in) clicks "Package Received" on their dashboard.
    * **Incentive:** Why does the Partner click? Because *we* might send them the "Digitization Metadata Form" (a printed sheet user puts in box) that makes their job easier.

## 3. LIABILITY SHIELD
* **The "Yellow Line" Rule:** The UI clearly delineates where Visualisatium ends and Partner begins.
* **Disclaimer:** "You are leaving Visualisatium. Dealings regarding physical goods are solely between you and [Partner Name]. Visualisatium holds no liability for shipping loss or damage."
* **Requirement:** User must check "I Understand" before the Contact Info is revealed.
# BUSINESS LOGIC: THE PARTNER ROYALTY SYSTEM ("The Origin Stamp")

## 1. THE CORE CONCEPT
We turn Partners from "Vendors" into "Affiliates."
* **Old Model:** User pays Partner for digitization. We get nothing. Partner forgets us.
* **New Model:** Partner uploads file to us. If User *ever* spends money on that file (enhancing, animating, printing), Partner gets a cut.

## 2. THE LOGIC FLOW (Pre-Processing / Digitizers)
### Step 1: The "Origin Stamp"
* **Action:** Partner uses the "Partner Dashboard" to upload the digitized VHS/Photos.
* **Metadata:** System tags the file object in the DB:
    * `origin_partner_id: "helsinki_digitointi_oy"`
    * `royalty_eligible: true`
    * `royalty_rate: 0.05` (5%)
    * `expiry: "2028-01-01"` (2 Year trailing commission)

### Step 2: The Conversion
* **Scenario:** User logs in 3 months later. They see their digitized VHS.
* **Purchase:** User buys "Make Highlight Reel" (€50.00).
* **Execution:**
    * System checks input files. Finds `origin_partner_id`.
    * Transaction Split:
        * Visualisatium Revenue: €47.50
        * Partner Wallet (Pending): €2.50
* **Notification:** Partner gets an email: "Your digitized file just generated €2.50. Keep uploading!"

## 3. THE LOGIC FLOW (Post-Processing / Printers)
### The "Loop-Back" QR Code
Printers usually mark the *end* of a journey. We want to make them the *start* of the next.
* **The Asset:** When a Partner prints a canvas, they stick a branded label on the back.
* **The Code:** `visualisatium.com/p/reorder?id=123&partner=print_shop_x`
* **The Pitch:** "Scan to animate this photo or order copies."
* **The Reward:** If the user scans and buys, the Printer gets the commission.

## 4. PARTNER TIERS
* **Bronze (Directory Only):** No commission. Just listed on the map.
* **Silver (Uploader):** 3% Royalty on files they upload.
* **Gold (Integrated):** 5% Royalty + "Verified" Badge. (Requires API integration).
> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Partner_Logic_v1.0.md`. 

# BUSINESS LOGIC: PARTNER INTEGRATION (PASSTHROUGH MODEL)

## 1. THE "DIRECTORY" APPROACH
We do not set the price. We display the price (or an estimate) and pass the order.

### User Journey
1.  **Selection:** User selects "Digitize VHS".
2.  **Matching:** System queries `Partner_Database` (based on Location/Capabilities).
3.  **Handoff:**
    * **Scenario A (Integrated Partner):** We generate the Shipping Label via their API. User pays Us -> We pay Partner (minus referral fee, if exists).
    * **Scenario B (Directory Partner):** We show the Partner's details/Map. User goes there physically. User manually marks "I did this" to gain XP (Preservation Gauge).

## 2. THE "DIGITAL BRIDGE" (Our Core Value)
Even if the Partner does the scanning, **WE** are the destination for the files.
* **Requirement:** The Partner uploads the resulting `MP4` / `JPG` files directly to the User's "Visualisatium Vault" (S3 Bucket).
* **Value:** This keeps the user on our platform for the *next* step (Editing/Enhancing).

## 3. TECHNICAL LOGIC (Database)
~~~json
{
  "partner_id": "partner_88",
  "name": "Helsinki Digitointi Oy",
  "integration_level": "api_connected", 
  "capabilities": ["vhs", "8mm", "photo_slide"],
  "upload_target": "s3://visualisatium-intake/partner_88/"
}
~~~
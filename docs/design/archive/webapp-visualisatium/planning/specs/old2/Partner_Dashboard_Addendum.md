> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Partner_Dashboard_Addendum.md`. 

# SPECIFICATION: PARTNER DASHBOARD (Addendum)
**Parent File:** `Dashboards.docx` (This fills the missing Partner Section).
**Audience:** Partners (Digitization Shops, Print Labs).

## 1. OVERVIEW
**Access:** Users with `role: partner`.
**Goal:** Manage Leads and Signal Status. (No financial transactions for service).

## 2. THE "LEAD RADAR" (Home View)
A list of users who have "Unlocked" this partner's information.
* **Incoming Inquiries:**
    * `User_ID` (Alias/Name)
    * `Interest`: "VHS Digitization" (Derived from the Product they clicked).
    * `Status`: "Information Revealed" / "Contacted".
* **Action:** "Log Deal" (Partner marks if the user actually booked a service).

## 3. THE "LOGISTICS SIGNAL" BOARD
Allows the Partner to update the status of physical goods so the User stops worrying.
* **Input:** "Enter Order ID / Scan QR" (If user included our slip).
* **Actions:**
    * `Mark Received`: Sends "Safe Arrival" notification to User.
    * `Mark Completed`: Signals that digital files are ready.
* **The Upload Gateway (The "Bridge"):**
    * Even if paid off-platform, the Partner *uploads* the result here.
    * **Why?** It pushes the content directly into the User's `Smart Collection` pipeline.

## 4. PROFILE & CAPABILITIES MANAGER
* **My Services:** Checkboxes for what they can do (VHS, 3D Print, Canvas).
* **Availability:** Toggle "Accepting New Jobs".
* **Listing Tier:** "Standard" (User pays to see info) vs "Verified" (Free for user).
> **Status:** current edition (F6, newest). A fuller earlier edition is at `docs/context/sources/02-business-logic-constitution-fullest-edition.md`; later revisions lost content to Gem context limits. Reconciliation is Architect work. Source: `vivid/.chat_attachments/start/02_Business_Logic_Constitution_BusinessLogicEconomics_v6_v4.md`. 

# BUSINESS LOGIC CONSTITUTION (v6.0)
**Naming Candidates:** VIVID (current working name), LUMINA (Previous working name: Visualisatium).

## 1. Description and purpose of the website
An eCommerce site contracting on image and video generation with help of AI. Mostly and as far as possible as automated processes, but some requiring human work in between.

**Secondary purpose**
While the above is the main purpose of the site, there is also a secondary: it serves as platform where anyone with content creator status with their account, can take jobs from the queue and make them for the customer. They are called Content Creator Agents (CCA).

The purpose is that only Content Creators make the requests that require man hours / manual work. If the work is solely AI based automated workflow, it belongs to default Content Creator (CCA-AI).

### Partners
Partners include companies that ralate to products in some way. 
For example, before images, videos, text or audio can be modified or used by this site, they maybe need to be digitalized. Therefore, there are digitalization partners, pre-processing partners. 
After the product has been made at this site, user might want it in physical format. Therefore, there are printing (including 3D-printing) and other related partners that produce physical product from digital, post-processing partners.
For physical product partners, the purpose is maily to work as "middle man" or connecting site. This site only sells information to connect customer and company related to physical goods.  
Some of the generated outcomes follow  the style, story or some other property from famous movie, book, cartoon or other brand. To use these brands, we need licenses from them. Therefore, there are brand-partners. 

## 2. Pricing system
The prices can change anytime, and there might also be seasonal or other discounts. Free items in both credit packs and monthly memberships might be announced from time to time.
*   **Payment Methods:** Products can be purchased with virtual credits or transaction, or both (=partly with credits, rest with transaction). Transaction means credit card payment, bank/wire transfer, bank transfer with invoice, or any other directly money related transfer.
*   **Work Start:** Work is always started only after payment.
*   **Credits:** Credits may be purchased through transaction. Credit may be automatically added monthly if user belongs to some membership plan. Membership plans are purchased through transaction. The credits are not equal to typical AI credits, so they are not comparable.

### Invoiced products
If product is to be invoiced, separate invoice is sent to customer for bank transfer. Same invoice is placed to customer dashboard for online payment with i.e. credit card or credits already purchased.
*   **Credit Payment:** If customer pays all with credits, the invoice is replaced with one to show virtual payment made. In admin dashboard / marking in the database, it is also separated from the ones paid with transactions, so that it is easier to send data for accounting purposes.
*   **Split Payment:** If customer pays partly with credits, the invoice is replaced with two new ones, one of which indicates already paid part with credits, and another one to be paid with transaction. Also they are marked accordingly to send correct data for accounting purposes. In dashboard, both invoices are then shown under same product purchase. Note: The part paid with credits has VAT as 0% since for that part VAT was paid when the credits were purchased. CCA Payout calc uses sum of **FIFO Realized Value** of those credits and **Net amount** (minus Stripe Fees) of the transaction part. 

**The Offer Generation Fee:**
All offer based, invoiced products include manual work as man hours. Usually it requires some manual work just to prepare the offer. Thus to start the process, first a minimum amount, 1 or 0.5 hour, is charged. This includes analyzing the requirements and creation of the actual offer. In the later created invoice (by the offer made) the already purchased hour is taken into concern, if the offer was accepted. This means that also invoiced products start with purchase by credits or transaction. If the offer was rejected / ghosted, that amount is kept to cover the fees for work done for the offer itself. Customer may make counter offer, and thus offer can go back-and forth until it is rejected or accepted. If there is no response for long time, it will go to dormant state.

However, for offer-based products customer has ability to ask for details (offer) and negotiate before the purchase of first man hour. In such case, customer does not place the product to cart or purchase it. Instead, customer might click to contact for offer request (including all the details given with the product in similar manner if customer made the purchase).

It is up to worker to decide when and how much time is spent on the subject before invoice is sent. The purpose is not leave customer unanswered, but to take into concern possibly high demand on already purchased projects compared to that uncertainty of getting work invoiced if customer rejects the order. Thus by paying the deposit, customer makes sure that the preparation and calculation for their desired special use case is underway.
*   **Standard Option:** 1 Manhour.
*   **Small Option:** 0.5 Manhour. Available for smaller tasks where offer preparation is quick.
*   If offer is rejected and if the offer was done on risk (customer did not purchase 1 hour of work), it means CCA does not get paid.
*   If customer did purchase 1 hour (or 0.5 hour) of work and offer was rejected, CCA will get paid by that purchased amount, for it was for the work of the offer. This is paid also, if the offer went to dormant state due to customer not replying in required time.


Actual work starts only after the invoice has been paid. If it needs to be broken to smaller invoices, that can be done from the admin dashboard and customer can pay them one by one. However, same applies there: work is done in periods defined by those invoices, and only continues when next invoice is paid. All invoiced and work-requiring man hours go to job queue, from where they may be picked up for work.

### Offer
Some products require that their pricing is calculated from information user gives. Those are considered offer-based products (usually same as invoiced -products). For example, all collection -products are such. When offer is made, user may accept or deny it or make counter offer. Offers are seen at dashboard by both admin and user. When both parties have accepted the offer, an invoice for the user is created automatically.   

### Automated purchases
Few products, mainly those that is intended to have some sort of story behind them which can evolve over time, include possibility to make their purchase automated by predefined rules. In those cases the task for purchase is automated in much similar manner than automatic payments with credit card for recurring membership, with the exception that also virtual credits may be used in these, if enough is available. 

### DEFINITIONS: THE PRICING VARIABLES
To avoid "Hardcoded Chaos," all pricing references these prices set  currently at `pricing-plan-vivid` and `PricingTable`. 


### PRICING STRATEGY

#### The "Preview Protocol" (Re-Rolls)
Instead of selling "1 Image" we sell "The Result".
1.  **Commitment:** User pays for image or video.
2.  **Preview:** System generates 4 Low-Res (Turbo) previews.
3.  **Selection:**
    * *Like it?* Finalize -> Upscale to 4K -> Done.
    * *Hate it?* Click **Re-Roll**.
4.  **Re-Roll Cost (The "Computing Fee"):**
    * User pays **much smaller amount of Credits (e.g. 20%)** to generate 4 new previews.
    * *Note:* Video Re-Rolls are NOT discounted due to GPU costs.

##### THE "RE-ROLL" TIERS
We cannot apply the same Re-Roll logic to Video as Image.

**Video Rule:** Video Re-Rolls are NOT heavily discounted.
* *Why?* Generating a video consumes massive GPU.
* *Compromise:* "Preview Mode". Generate a low-res GIF (Cost much less than video). If user likes it, they pay full price to "Render 4K".


##### Why this works?
* **User Psychology:** They see the initial cost as the "Setup Fee". The small portion of it (e.g. 20%) re-roll feels cheap ("I'm just tweaking").
* **Economics:** Turbo/Preview models are 10x cheaper than High-Res Upscaling. We don't lose money on previews.

#### The "CCA Rescue" Button
* **Trigger:** If a User re-rolls 3 times (Spent original + discounted re-roll + discounted re-roll + discounted re-roll) and is still unhappy.
* **System Action:** Pop-up appears.
    * *"Having trouble? Let a Pro handle it."*
    * *Offer:* "Convert your spent credits into a discount on a CCA Job."
* **Result:** Converts a frustrated user into a High-Value Service customer.


## 3. Content Creator as an agent (CCA)
Since the Content Creator Agent (CAA) makes the work and gets paid most of it’s payments, they also make the offer to the customer. That is, if they take the job it means that they need to do it fully, from offer to invoicing to making of it. They do all the parts at Content Creator Dashboard.

Each job CCA takes needs an offer. It may be largely automated, but it is always required. Offer means, that CCA calculates the costs and makes an offer to customer of what it costs to make the whole product.

**Transfer:**
Content Creator can transfer the job to another Content Creator. If such takes place, it is among themselves to make deal of how profit is divided – the system will pay the compensation only to one placing it for customer to download when ready. System saves information about the transfer of Content Creator to another, but other than that it takes no part in the deals between the Content Creators. Also admin has the ability to make such transfer of job to new Content Creator. This admin-made transfer is meant to take place only on cases there is some misbehaviour by the originating Content Creator, or that the originating Content Creator is unable to continue the work, or any other reason admin sees fit.


**Profit for content creator:**
When Content Creator Agent makes the work, they get certain percentage of the invoiced, taxless amount for themselves. The percentage is defined in sheet “Pricing Table”. It can change anytime. Payouts are calculated based on the **net realized value** of the transaction (e.g. if customer pays with credits they goth with discount, it means product value is also smaller -> payout to CCA from specific product might differ based on product value to customer).

The Content Creator Agent will get their share of the payment after Review Period, if no dispute has been made by the customer.

If during that time dispute made, it is reviewed by company representatives. If approved, Content Creator Agent needs to redo the work (process starts over from where it got faulty), or customer gets the money returned partly or fully. 
If customer downloads the product or shares it to social media, the Review Period might be shortened or considered immediately as not disputed. 

**Default Content Creator:**
The system has two default Content Creators, set when developing the site. All automated workflows made by AI automation (not requiring manual work) go to one of these default Content Creator (CCA-AI). The other default Content Creator is as human Content Creators, but default to system (admins can work with it to investigate some issue, to work on customer request or it can be used for other tasks when needed)  


### Rights and Responsibilities of Content Creators (CCA)
Content Creator Agents need to behave as representatives of company, and handle all jobs assigned to them with great detail and quality. 
If for any reason the job is transferred away from CCA it is possible they are not paid for their job until that moment. This non-payment is not intention, but it is impossible to define all reasons beforehand. As such, each CCA applicant need to comply with this before becoming an CCA.

Content Creator Agent is also required to answer any questions that may arise from customer during or after the creation of the work. The requirement to answer after the creation of the work continues the period of Review Period (time in which the customer may raise dispute). After that, it is voluntary.


### Content creator status
In order to get Content Creator Agent status, the creator needs to provide ID and Tax Identification Number (TIN) (their local Tax ID).
Content Creator Agent information
To each CAA the following information is collected:
*  amount of jobs done
     * devised by category and particular type or products
*  reviews
     * given by customers
*  stars
     * given by customers
*  amount of money earned (seen only by CAA and admin)
*  list of jobs done
     * with link to project details

To become content creator, they start as normal user and then apply for CCA status.



## 4. Order States (The 6-Meter System)
To ensure eastier order status tracking, the following order states are available.

### Phase 1: Negotiation and Payment (The Deal and The Money)
These states track the initial phase, especially for "Offer-based" products like Collections or Special products that require manual calculation.

| Status ID | Label | Owner | Trigger Event | System Action | Permission  / Restriction |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `draft` | **Drafting** | User | User selects Product. | Form rendered (`required_data`). | 🟢 User editing. |
| `offer_req` | **Offer Requested and paid for** | User | User has submitted the request and paid for 1st hour. | **1-Hour Deposit Invoice Generated from payment. Shown ad CCA list as ready to take** | 🚫 Actual Work cannot start, buf offer preaparation / generation can. |
| `offer_req_without_pay` | **Offer Requested Without 1-Hour Puchase** | User | User has submitted the request without payment for 1st hour. | **Shown to CCA list as ready to take-at-your-own-risk.** | 🚫 Actual Work cannot start, buf offer preaparation / generation can. |
| `claimable` | **In Queue** | System | 1st hour Payment Confirmed or Offer requested withtout Payment. | Routed to **Marketplace**. | 🔓 Claimable. |
| `claimed` | **In Progress for Offer** | CCA | CCA clicks "Claim". | Job **Soft Locked** to CCA. | 🚫 Locked to CCA. |
| `offer_sent` | **Offer Sent** | CCA | CCA submits offer including price/time/details. | Deposit applied as part payment of total. | 🚫 User can accept, reject of make counter offer editing the one made by CCA. |
| `counter_offer_received` | **Counter Offer Received** | USer | User has submitted counter offer. Waiting for CCA to accept, reject (relates back to original offer as offer_sent) or make new counter offer (relates to new offer and back to state as offer_sent) | Deposit still applied as part payment of total. | 🚫 User can accept, reject of make counter offer editing the one made by CCA. |
| `offer_rejected` | **Offer Rejected** | System | User Rejects Offer. | Both CCA and User Informed. | 🚫 User can restart the prosess by changing to Accpeted or make counter offer. |
| `awaiting_pay` | **Accepted, Invoice Generated by Offer. Awaiting Payment** | System | Offer or Counter Offer is accepted by receiving party (User or CCA). | Final Invoice Generated. Price as mentioned in Offer. | 🚫 Work is not to be started before payment has arrived. But this is for CCA to decide. |
| `parting_requested`| **User has requested to split payments to certain parts. Invoice generated for each part. ** | System | User has requested to split the payments |  System tries to do it automatically, if fails informs Admin. If successul, returns to state awaiting_pay | 🚫 Assets locked. |
| `partially_pay`| **Partially Paid** | System | User pays Invoice A. | Work Timer starts *only* for paid segment. | ⚠️ Limited scope. |
| `paid` | **Paid** | System | Transaction successful. | **Funds Moved to Escrow.** | ✅ Moves to Job Queue for the CCA in question (diffrent from common queue). |

* *System Assist during offer generation:* If `Product` = "Standard Video", System suggests "0.5 Manhours" automatically.

### Phase 2: Production (The Work, The Factory)
Once payment is confirmed, the order moves into the "Job Queue" or AI processing. Statuses are same, but name of queue differs: “Job Queue” or “AI job Queue”

| Status ID | Label | Owner | Trigger Event | System Action | Permission |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `in_progress` | **In Progress** | CCA | CCA has started / is processing order. | Job **Locked** to CCA. | 🚫 Locked to CCA. |
| `action_req` | **Action Required** | CCA | CCA flags missing or fault info. | Timer Paused. SLA Stops. When user send missing or corrected info, returns to in_progress | ⚠️ User notified when information is required, CCA is notified when User has responded (CCA may then ask again more informaiton). |
| `prod_ready` | **Production Ready** | CCA | CCA uploads assets. | Assets processed (Watermarked). | 🔒 Assets not yet downloadable. |

### Phase 3: Delivery, Quality & Acceptance (QA & Review)
This phase is critical for the "Quality of Service" and the Content Creator’s payout.

| Status ID | Label | Owner | Trigger Event | System Action | Permission |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `delivered` | **Under Review** | User | CCA has delivered the results. | **Review Timer Starts (14 Days).**. Watermarked preview. | ⏳ Funds Locked. |
| `disputed` | **Disputed** | Admin | User files Dispute (Day 1-14). The case is to be reviewed by Admin to decide if it is approved or disapproved | Review Timer Paused. Ticket created. | 🚨 Payout Blocked. |
| `redo_progress`| **Redo in Progress** | CCA | Admin orders "Redo". | Reverts to `in_progress`. | ⚠️ Old assets archived.|
| `refunded` | **Refunded** | System | Admin orders "Refund" partly or fully. | Stripe Refund. CCA gets either €0 or part of the payment, depending how much was refunded to customer. | 💸 Money returned partly or fully. |
| `completed` | **Completed** | System | Timer expires OR Dispute was disapproved. | **Payout Release Triggered.** | ✅ Funds Released. |


### Exceptions: Out of normal processes
In case the process is cancelled or moved to other CCA or something else happens that does not fit into normal process, this status list is used.

*  **None:** No exception status has been raised
*  **Needs More Information:** The process is halted until more information is received. Reason will be informed.
*  **Production Cancelled:** For some reason the production was cancelled. The reason will be informed to customer. Possible reasons: Guidelines / Legal issues
*  **Failure:** Some failure has occurred and customer will be informed. Possible reasons:  Technical / Other

###Invoice issues: Related to invoicing process
In case invoicing is not straightforward

*  **None:** No special invoicing process going on.
*  **Invoice under generation:** Original invoice, or modifications under way.
*  **Invoice sent:** Invoice is sent to customer
*  **Invoice cancelled:** Invoice is split (new invoices will replace this one) or order cancelled before payment.


## 5. Legal & Brand Strategy (Trademark Trap Solution)
Regarding the use of "Known Contexts" (e.g., Tintin, Marvel):
1.  **Permission Protocol:** We attempt to get permission from the right holders to use the name and style. This is beneficial for them (Revenue Share model).
2.  **Licensed Scenario:** If we have permission, we use the official name (e.g., "**Tintin**").
3.  **Unlicensed Scenario:** If we do not have the license yet, we use "**Tintin-like**" or "Belgian Reporter Style" to be distinct enough to be legal (Pastiche).
4.  **Transparency:** We warn the user if we do not have the license yet, ensuring they understand the distinction.

## 6. Quality of Service
In order to comply with quality of service, customers have certain period of time, “Review Period”, in which they must make a complaint or dispute after the delivery of the product. If no dispute is made, case is closed and no money return is possible.
*   If customer makes the dispute during that time, it is reviewed by company representatives. If dispute is approved, either the work is redone, or money returned partly or fully.
*   If the dispute is disapproved, customer gets reason of why it was disapproved. After that the case is considered closed by the company, even if the customer still would disagree. That means, there is only one review for the task. If further arises, it is voluntary and not part of the system or process design.

### AI-First Dispute Arbitration
Before a human Admin sees a dispute, use the AI to analyze:
*  The Prompt (Request).
*  The Result (Image/Video).
*  The Complaint text.
*  **Output:** A confidence score. "The image contains 'blue sky' as requested. Dispute likely invalid."


## 7. About Background Processes
To make creation of images and videos with AI as automated as possible, some premade prompts are already at the database, connected to each product. That information is then connected to selections made by user from premade lists or similar to focus the needed result, further information given by user as description / free text, and also to images and videos uploaded by user as attachments. All these are combined to make the actual prompt used in the internal process that uses AI to generate the desired images and videos.


### Lists
To help to make prompts better and explanations needed form user shorter, many premade lists are used. These lists are described at “Lists-in-database.docx”.
*   **Usage:** For each in list there is description and 1-2 examples user can see. Typically the examples are shown on the examples pages, or at the side of page when selecting the product. In case user is using mobile app version, the example might be showing through some extra click. It is anyway matter of layout design and will be decided later.
*   **Variations:** While there is many variations that one can make to images or videos by the lists, the purpose is to do them one by one. While it maybe costs a bit more, the overall quality is better, and it also allows customer to go back to some middle stage and continue with other adjustments from there. For this reason, most of the points is list are single select choices. 
* **Vector Embeddings:** We will not just match the string "Noir"; we will inject a hidden "Prompt Payload" associated with "Noir" (e.g., `(chiaroscuro lighting:1.4), (black and white:1.2)`).

## 8. Database Structure (Preliminary)
Database should include at least these:
*   **Categories:** Category, subcategory.
*    **Possible product result list:**  image, multiple images, video, multiple videos, 3d-model, collection.
*   **Products:** Product name, product type, category, result, description, required information, sample textarea, manual work amount estimation, is-attachment-required, price, example price.
*   **Prompts:** prompt, related to product id.
*   **PricesInCredits:** image price, video price.
*   **PriceOfCredits:** Partners pricing by product.

## 9. Support
Site has support area. In case user finds a problem at the site they should be able to report it, sending message or chat, or bug report. The chat remains always so that involved parties can get back to it at any time.
*   **Wishlist:** The add to Wishlist -feature should be at support area too.
*   **Chat:** In case user starts chat, it is mainly between the user and administrator, although other users / entities (i.e. partner) can be added. It is also tied to the subject at hand.

## 10. Technical Note: Video Stitching
For longer video sets, we utilize **Shotstack API** to stitch generated clips together, as native AI models (Runway/Luma) typically generate short clips (5s). This ensures we can deliver the "Product Promise" of longer videos.

## 11. About Layout and navigation
While layout is to be designed, the purpose is, that user can browse in the manner of first selecting the end result (image, video, collection, 3D-model) and then category or product. 
Or, user can first select the category, and then the end result (image, video, collection, 3D model) or product. In here, it is meant that while there might be further categories or end results to select from already after the initial choice, the products are already also visible, so that user may select them straightly. Same applies even before first choice of category or end result – user does see the products also already then, and thus skip the category or end result selection first, and go straight to product.

## 12. Mixed notes
Site is to be multilingual and it is intended to get users from all over the world. However, it originates from Finland and as such, the specialities concerning Finland needs to be taken into consideration. 



## 13. ECONOMIC AXIOMS

### A. The "Success Tax" (Net Profit Calculation)
**Objective:** Protect platform margin against Bulk Discounts and other margin erosion.
**Formula:** `Net_Profit` = `Realized_Revenue` - `VAT` - `Stripe_Fees` - `CCA_Payout` - `Compute_Cost`
*   **Rule:** CCA Payouts are calculated on **Realized Revenue** (FIFO), not List Price. If a user bought credits at 40% off, the CCA payout base reflects that specific acquisition cost.

### B. The "Irreversible Action" Protocol
**Context:** To shorten the "Review Period" (cash-flow delay).
**Trigger:** User Downloads Original (High-Res) version OR Shares result to Social Media OR manually clicks acceptance, such as "Mark as Complete".
**Result:**
1.  Watermarks are removed.
2.  Status moves immediately to `Completed`.
2.  Review Timer zeros out.
3.  Funds are released to CCA.
**Terms:** Users have knowledge by accepted terms that this will stop their right to refund / dispute.

## 14. AUTOMATION & SUBSCRIPTION LOGIC (The "Creation Service" Protocol)
Users subscribe to a **Creation Service**, not a static feed. These products allow *zero* manual modifications.
1.  **Product Type:** "Automated Creation Task" (e.g., Daily Character Adventure).
2.  **Trigger:** Daily Cron Edge Function runs at 00:00 UTC.
3.  **The "Credit Tank" Check:**
    * Check: `User_Credit_Balance >= Product_Cost`.
    * **IF Pass:**
        * Deduct Credit (FIFO).
        * Route Job to **Default Content Creator (CCA-AI)**.
        * Deliver Result -> Notify User: "Your daily story is ready."
    * **IF Fail:**
        * **Do NOT** process the job.
        * **Status:** `paused_insufficient_funds`.
        * **Notification:** "Daily Story paused. Top up credits to resume." (Send "Low Balance" Email).
---

## 15. FINANCIAL LOGIC & FLOWS

### A. The Payout Logic Flow (Escrow)
1.  **PAY:** User pays (Credits + Cash). Funds locked in `escrow_pool`.
2.  **DELIVER:** CCA delivers. 14-Day Review Timer starts.
3.  **RELEASE:**
    * **Happy Path:** Timer Expired -> Release 75% of RNR to CCA.
    * **Dispute:** Funds Frozen. Admin Tribunal decides (Redo or Refund partly or Refund fully).

### B. "Tipping" as a Quality Signal
Add a "Tip CCA" feature post-delivery.
*  **Logic:** Tips bypass the 14-day hold (Instant Payout).
*  **Psychology:** Encourages CCAs to over-deliver for instant gratification.

---
## 16. THE ABANDONMENT & RESTORATION PROTOCOL ("Phoenix")

### A. The Sunset Clause (30 Days)
**Trigger:** Order status `offer_sent` or `offer_req` > 30 Days.
**System Action:**
1.  Status -> `archived_abandoned`.
2.  Deposit -> Released to CCA as "Consultation Fee" (Final).

### B. The Phoenix (Restoration) Flow
**User Action:** User views `archived_abandoned` offer -> Clicks **"Revive Request" or "Restore"**.
**System Action:**
1.  Status -> `offer_restored` (New Negotiation).
2.  Data -> Cloned to new Order ID (`is_restored: true`).
3.  CCA Warning: "⚠️ Revived offer. Check pricing validity."

---

## 17. THE SMART LEDGER (SCHEMA)

### The Ledger Table Definition
| Column | Type | Definition |
| :--- | :--- | :--- |
| `Transaction_ID` | UUID | Unique Key. |
| `Source_Wallet` | String | `user_wallet_A`, `escrow_pool`, `cca_wallet_B`. |
| `Dest_Wallet` | String | Target. |
| `Amount` | Numeric | The value. |
| `Currency` | String | EUR / CREDIT. |
| `Status` | Enum | `HELD`, `PENDING`, `CLEARED`, `PAID`, `VOID`. |
| `Trigger_Event` | String | `Order_Placed`, `Job_Delivered`, `Review_Period_End`. |

---

## 18. SPECS: THE SMART LEDGER (Economic Engine)

### 1. THE "DOUBLE-ENTRY" LOGIC
To replace the manual "Bank Transfer" chaos with an audit-proof system  "Double-Entry" logic.

#### The Ledger Table (Supabase)
| Transaction_ID | Source_Wallet | Dest_Wallet | Amount | Currency | Status | Trigger_Event |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| tx_101 | `user_wallet_A` | `escrow_pool` | 75.00 | EUR | HELD | Order_Placed |
| tx_102 | `escrow_pool` | `cca_wallet_B` | 67.50 | EUR | PENDING | Job_Delivered |
| tx_103 | `escrow_pool` | `platform_rev` | 7.50 | EUR | CLEARED | Job_Delivered |
| tx_104 | `cca_wallet_B` | `payout_stripe` | 67.50 | EUR | PAID | Review_Period_End |

### 2. PRICING LOGIC (The Algorithm)

#### A. The "Hybrid" Calculator
User can pay with Mixed Methods (Credits + Cash).
* **Logic:**
    1.  Calculate Total Cost (e.g., €100).
    2.  Check User Credit Balance (e.g., 10 Credits).
    3.  Convert Credits to Cash Value based on possible discounts and other value affecting issues with Credits.
    4.  Cash_Due = Total_Cost - (Credits as Cash Value)
    5.  Generate Stripe Invoice for `Cash_Due`.

#### B. The CCA Payout Formula
* **Input:** `Job_Value` (net realized value of Manhour).
* **Variable:** `Platform_Fee` (Standard 10% - configurable).
* **Variable:** `Review_Period` (14 Days).
* **Execution:**
    * On `Order_Completed` (Delivery): Money moves to `CCA_Pending`.
    * On `Review_Period_expired` (No Dispute): Money moves to `CCA_Available`.

---

## 19. THE "API ARBITRAGE" SYSTEM
**Logic:** The system dynamically selects the cheapest provider that meets the quality threshold.
* **Task:** "Generate Anime Girl".
    * *Option A (Midjourney):* $0.08 (Best Quality).
    * *Option B (Flux.1 Dev):* $0.03 (Good Quality).
* **Router Logic:**
    * If User = "Pro Member" -> Use Midjourney.
    * If User = "Free/Standard" -> Use Flux.1.
	
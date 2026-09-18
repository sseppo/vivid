> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/old2/Domain_Glossary.md`. 

# Domain Glossary & Terminology Map

## 1. Core Entities
| User-Facing Term | System/DB Term | Definition |
| :--- | :--- | :--- |
| **Collection / Story** | `Project` | A container for multiple related Assets (e.g., "Grandpa's Life Story"). |
| **Order / Item** | `Order` | A single financial transaction unit (contains 1 or more assets). |
| **Result / File** | `Asset` | The actual file (Image/Video) generated and stored in R2. |
| **Middle Stage** | `Parent_Asset` | A previous version of an asset in the Genealogy tree. |

## 2. Status Mapping
| User UI Label | System Status ID | Meaning |
| :--- | :--- | :--- |
| **"Waiting for Quote"** | `offer_req` | User sent request, CCA hasn't replied. |
| **"Quote Ready"** | `offer_sent` | CCA sent price, waiting for User. |
| **"Archived"** | `archived_abandoned` | 30 days no activity. |
| **"Restored"** | `offer_restored` | User brought back an archived offer (Phoenix Protocol). |
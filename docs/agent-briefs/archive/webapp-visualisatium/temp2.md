> **Status:** historical — family F30 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/temp2.md`. 

*** SYSTEM BOOT PROTOCOL: VIVID - ARCHITECTURE PHASE ***

**Target:** Architect Gem (v1.2)
**Environment:** Antigravity IDE (You have filesystem access. Read the project files, then write/diff files directly to the workspace).
**Current Sprint:** 01 - The Data Foundation

**CONTEXT HANDSHAKE:**
Please read the following Master Spec documents from our project workspace to understand the system constraints and logic:
1. `VIVID TECH ARCHITECTURE v11.0` (Supabase, Postgres 17, Clerk).
2. `BUSINESS LOGIC CONSTITUTION v6.0` (Specifically the "Smart Ledger" double-entry logic and 6-Meter Order States).
3. `PRODUCT CATALOG v2.1` & Pricing Tables (For pricing variables and Partner splits).
4. `FEATURES, UX & GAMIFICATION v1.5` (For `Asset_DNA` JSONB payload structure).
5. `project_context.md` & `active_sprint.md`.

**YOUR MISSION:**
We are translating the Master Specs into the strict Supabase PostgreSQL Schema and TypeScript contracts. 

Because the business logic is highly complex (Escrow, Royalties, Sagas, Asset DNA, Multi-Persona RBAC), we will execute this in TWO phases to prevent hallucination.

**PHASE 1: THE ERD & BLUEPRINT (Do this now)**
Do not write the `schema.sql` yet. First, analyze the files and output a `docs/Database_Schema_Blueprint.md` containing:
1. **Core Enums:** e.g., `order_status` (draft, offer_req, claimed, in_progress, delivered, completed, disputed, etc.), `wallet_types` (user, escrow, cca_pending, platform).
2. **Entities (Tables):** List the required tables with their primary columns and foreign keys (e.g., `Users`, `Products`, `Orders`, `Asset_DNA`, `Smart_Ledger`, `Partner_Vault`).
3. **Relationships:** A Mermaid.js ER Diagram mapping how an Order connects to Asset_DNA, a User, a CCA, a Partner, and the Smart Ledger.
4. **RLS Strategy:** A brief bulleted list of how we will enforce Row Level Security using Clerk's `publicMetadata.role` (Buyer, CCA, Partner, Admin).

Stop after generating this Markdown file and wait for my approval before writing the `.sql` migrations.
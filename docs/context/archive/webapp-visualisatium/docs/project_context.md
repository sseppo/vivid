> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/docs/project_context.md`. 

# Project Context: Visualisatium (v1.0)
**Last Updated:** 2026-01-13
**Topology:** Macro-Project (SaaS + Marketplace)
**Status:** Initialization Phase

## 1. High-Level Vision
A hybrid eCommerce platform for Generative Media:
*   **Primary Loop (Automated):** "Default Creator" (AI) handles standard requests instantly.
*   **Secondary Loop (Manual):** "Content Creator Agents" (CCAs) claim complex jobs (Collections, Physical Goods) from a Marketplace Queue.
*   **Key Constraint:** "Payment First" policy. Work never starts until the transaction is cleared.
*   **Compliance:** Strict Finnish VAT (25.5%) and VIES validation.

## 2. The Tech Stack ("The Golden Record")
*   **Framework:** TanStack Start (SSR, Server Functions) + TanStack Router (File-based).
*   **Mobile:** Capacitor 7 (Android Rust Bridge + ThorVG).
*   **Database:** Supabase (PostgreSQL 17) + TanStack DB (Sync).
*   **Auth:** Clerk (Multi-persona: Admin, Buyer, CCA, Partner).
*   **Storage:** Cloudflare R2 (Assets) + Apache Iceberg (Logs/History).
*   **State:** TanStack Query v5+ (Server) / Zustand (Client).
*   **UI:** React 19 + Motion for React (v12) + Tailwind v4.

## 3. Core Operational Rules
*   **Security:** RLS (Row Level Security) is mandatory. Clerk Metadata injected into Supabase session.
*   **Financial:** Mixed Payments (Virtual Credits + Direct Euro). Invoices must split automatically.
*   **Architecture:** Monorepo. No "Separate API" (use Server Functions).

## 4. Immediate Focus
Translating "Descriptions" into a concrete Supabase Schema (SQL) and deciding on the Video Processing infrastructure.
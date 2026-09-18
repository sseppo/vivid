> **Status:** historical — family F8; superseded by `docs/architecture/tech-stack-master.md`. Kept for provenance; not current. Source: `Visualisatium/planning/04_TECH_STACK_MASTER_v10.0.md`. 

# VISUALISATIUM TECH ARCHITECTURE (v10.0)
> **Status:** DEFINITIVE / SPLIT FORMAT
> **Environment:** Antigravity / VS Code

## PART 1: THE INVENTORY (Quick List)

### Core Application
*   TanStack Start
*   Nitro Engine
*   TanStack Router
*   TanStack Query
*   Zustand

### Mobile & Native
*   Capacitor
*   ThorVG
*   Capacitor SQLite
*   Rust JNI Bridge

### Backend & Infrastructure
*   Supabase (PostgreSQL + Realtime)
*   Cloudflare R2
*   Apache Iceberg
*   Netlify Edge Functions

### Identity & Security
*   Clerk
*   Ionic Identity Vault

### Media Processing (The Assembly Layer)
*   Shotstack (Video Stitching)
*   ElevenLabs (Long-Form Audio)
*   Creatomate (Templating)
*   Groq / DeepInfra (Text Intelligence)

### Payments & Compliance
*   Stripe Connect
*   Stripe Tax

---

## PART 2: REFERENCE LINKS & DETAILS

| Tool | Role | Documentation / Link |
| :--- | :--- | :--- |
| **TanStack Start** | Full-stack SSR Framework | [tanstack.com/start](https://tanstack.com/start) |
| **Supabase** | Transactional DB (Postgres 17) | [supabase.com](https://supabase.com) |
| **Shotstack** | API for stitching 100+ clips into Sagas | [shotstack.io](https://shotstack.io) |
| **ElevenLabs** | Long-form Audio (40k char limit) | [elevenlabs.io](https://elevenlabs.io) |
| **ThorVG** | Lightweight Lottie Renderer | [thorvg.org](https://www.thorvg.org) |
| **Cloudflare R2** | Zero-Egress Object Storage | [cloudflare.com/r2](https://www.cloudflare.com/developer-platform/r2/) |
| **Groq** | Ultra-low latency LPU Inference | [groq.com](https://groq.com) |
| **Clerk** | Auth with "Shadowing" support | [clerk.com](https://clerk.com) |
| **Ionic Vault** | Biometric storage for CCA Secrets | [ionic.io/docs/identity-vault](https://ionic.io/docs/identity-vault) |
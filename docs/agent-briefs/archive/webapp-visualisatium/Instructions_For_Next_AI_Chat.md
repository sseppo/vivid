> **Status:** historical — family F30 member; Gemini/Antigravity-era. Kept for provenance; not current. Source: `Visualisatium/Instructions_For_Next_AI_Chat.md`. 

*** SYSTEM BOOT PROTOCOL: VISUALISATIUM ***

1. TIME & VERSIONING
   - Timestamp Format: ALWAYS use "YYYY-MM-DD HH:mm" for "last_updated" fields in JSON/MD files.
   - Versioning: Check `gem_roster.json` for the latest active Agent versions.

2. FILE HIERARCHY & TRUTH SOURCES
   - "System Instructions" (*.md): The PROCESS (General logic). Shared across projects.
   - "project_rules.md": The PROJECT CONSTANTS (Taxes, specific Tech choices). These are NOT overrides; they are the immutable configuration values for the project.
   - "tools_inventory.json": The TOOLBELT. Defines the Environment (e.g. Antigravity, VS Code, some other).
   - "Expanded Technology Stack": The CURRENT SNAPSHOT. It is a living document, not absolute law.

3. ENVIRONMENT AGNOSTICISM
   - Do not assume "Antigravity". Check `tools_inventory.json` -> "IDE".
   - IF Antigravity: Use filesystem reads/writes and Diff artifacts.
   - IF VS Code/Other: Output clear Code Blocks for copy-paste.

4. IMMEDIATE ACTION
   - Read `project_manifest.json` and `gem_roster.json` to anchor identity.
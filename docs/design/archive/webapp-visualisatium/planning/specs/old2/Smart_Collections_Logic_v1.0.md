> **Status:** historical — Gemini-era planning material, superseded as a layer by the Feb-2026 master series. Kept for provenance; not current. Source: `Visualisatium/planning/specs/old2/Smart_Collections_Logic_v1.0.md`. 

# PRODUCT REQUIREMENT DOCUMENT: SMART COLLECTIONS & ORCHESTRATION (v1.0)
**Author:** Planning Gem (CPO)
**Status:** DRAFT
**Scope:** Transforming "Bundles" into "Dependency-Driven Workflows".

---

## 1. THE CONCEPT: "THE DIRECTOR'S PIPELINE"
**Problem:** Currently, buying a "Collection" (e.g., Wedding Package) just dumps 5 empty slots into the user's dashboard. The user has to configure each one manually.
**Solution:** **Template-Driven Orchestration.**
When a user buys a Collection, the system loads a **Dependency Graph**.
* **Node A (Source):** "Upload the Couple's Photo."
* **Node B (Style):** "Select a Style" (Linked to `Lists-In-database` -> e.g., 'Watercolor').
* **Node C (Output 1):** Generates Image using Source A + Style B.
* **Node D (Output 2):** Generates Video using Output C + "Cinematic Recipe" (Linked to `Lists-In-database` -> 'The Intimate Moment').

---

## 2. USER JOURNEY: THE "AUTO-PILOT" WIZARD
**Scenario:** User buys "The Life Story Collection".

1.  **Step 1 (The Anchor):** User uploads *one* main photo of "Grandpa".
2.  **Step 2 (The Vibe):** User selects a "Style" from the `Lists` database (e.g., "Sepia / Daguerreotype").
3.  **Step 3 (The Automation):**
    * **Chapter 1 (Image):** System generates Grandpa in 1950 (applies Sepia).
    * **Chapter 2 (Video):** System takes Chapter 1 Image + applies "Slow Pan Right" (from `Lists` Camera Angles).
    * **Chapter 3 (Text):** System generates a "War Story" (using the Narrative Layer we defined earlier).
4.  **Result:** User provided **1 input**, System generated **3 consistent outputs**.

---

## 3. TECHNICAL LOGIC: THE DEPENDENCY GRAPH
**Database Requirement:** We need a `collection_templates` table that defines these relationships.

### The "Recipe" Data Structure
This JSON defines a "Smart Collection" template. Notice how it references your `Lists-In-database.docx`.

~~~json
{
  "collection_template_id": "wedding_deluxe_v1",
  "name": "The Perfect Wedding",
  "nodes": [
    {
      "id": "node_1",
      "type": "input_upload",
      "label": "Upload Couple Photo",
      "required": true
    },
    {
      "id": "node_2",
      "type": "input_selection",
      "source_list": "list_styles_painting",
      "label": "Choose Art Style"
    },
    {
      "id": "node_3",
      "type": "generator_image",
      "dependency": "node_1",
      "style_ref": "node_2",
      "prompt_logic": "Make the people in {node_1} look like a {node_2} painting."
    },
    {
      "id": "node_4",
      "type": "generator_video",
      "dependency": "node_3",
      "camera_recipe": "recipe_intimate_moment", 
      "note": "Uses the 'Intimate Moment' combo from Lists-In-database (Close-Up + Shallow Depth)"
    }
  ]
}
~~~

---

## 4. NEW FEATURE: "RECIPE MARKETPLACE"
**Context:** Your `Lists-In-database.docx` contains "Pro Combo Recipes" (e.g., *The Hero Reveal*).
**The Opportunity:**
* **Standard Users:** Get basic camera moves (Pan, Zoom).
* **Paid/Leveled Users:** Unlock "Pro Recipes" (The Hitchcock Zoom, The Bayhem Spin).
* **Strategy:** We treat these "Recipes" as **Micro-Products**.

### Logic Flow (Mermaid)


~~~mermaid
graph TD
    User[User] -->|Uploads Photo| Node1[Node 1: Source Image]
    User -->|Selects Style: Watercolor| Node2[Node 2: Style Config]
    
    Node1 & Node2 -->|Combine| Node3[Node 3: Generated Invitation]
    
    Node3 -->|Input| Node4[Node 4: Video Generator]
    Recipe[List: 'The Intimate Moment'] -->|Applies Camera Move| Node4
    
    Node4 -->|Output| Final[Final Video File]
~~~

---

## 5. DASHBOARD IMPLICATIONS
### A. The "Collection Canvas" (User Dashboard)
Instead of a list of files, the User sees a **Timeline View**.
* **Left:** The Source Files (Uploads).
* **Middle:** The "Processing Nodes" (Visualizing the AI working).
* **Right:** The Outputs.
* **Why:** It looks like a "Studio" rather than a "Shopping Cart".

### B. The "Smart Template Editor" (Admin Dashboard)
A tool for YOU to build these packages without coding.
* **Drag & Drop:** Drag an "Image Generator" node. Connect it to a "Video Generator" node.
* **Select Preset:** Apply "The Epic Landscape" recipe to the video node.
* **Save:** Publish as "New Collection Product".

---

## MACHINE-READABLE SUMMARY
~~~json
{
  "feature_id": "smart_collections",
  "core_logic": "dependency_graph",
  "new_tables": ["collection_templates", "node_definitions", "recipe_library"],
  "integration": "lists_database_docx",
  "complexity": "High"
}
~~~
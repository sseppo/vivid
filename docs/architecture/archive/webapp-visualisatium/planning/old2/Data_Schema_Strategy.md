> **Status:** historical — family F10; superseded by `docs/architecture/Database_Schema_Blueprint.md`. Kept for provenance; not current. Source: `Visualisatium/planning/old2/Data_Schema_Strategy.md`. 

### **Artifact 3: Phase 3 Strategy (Data & Inventory)**
**Filename:** `planning/Data_Schema_Strategy.md`
**Purpose:** Maps the complex CSV inputs ("One Image", "Select from List") to a JSON-driven database strategy.

```markdown```
# Data Schema & Inventory Strategy
**Phase:** 3 (The Inventory)
**Objective:** Map "Tuotteet" & "Lists" to a flexible Database Schema.

## 1. THE "DYNAMIC PRODUCT" SCHEMA
**Problem:** `ProductsSold.docx` defines varying input rules (e.g., "OR", "AND/OR", "Free Text").
**Solution:** Store the *Input Contract* in the `products` table using JSONB.

### Table: `products`
| Column | Type | Description |
| :--- | :--- | :--- |
| `id` | UUID | Primary Key |
| `sku` | TEXT | e.g., "IMG-MEM-ENHANCE" |
| `category_path` | LTREE | Hierarchy (e.g., `Image.Memories.Enhancement`) |
| **`form_config`** | **JSONB** | **Defines the Form UI (See below)** |

### The `form_config` JSON Structure
This tells the Frontend what to render (based on your `Tuotteet` CSVs).

```json
// Example for "Image - Enhancement"
{
  "attachments": {
    "required": true,
    "mode": "one_image", // Options: one_image, many_media, none
    "label": "Upload photo to enhance"
  },
  "inputs": [
    {
      "id": "style",
      "type": "multi_select", 
      "source_list": "enchantments", // Linked to Reference Table
      "logic": "AND", // User must pick this AND Free Text
      "label": "Select Enhancements"
    },
    {
      "id": "instructions",
      "type": "textarea",
      "label": "Describe details",
      "required": false
    }
  ]
}
```

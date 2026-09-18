> **Status:** historical — family F10; superseded by `docs/architecture/Database_Schema_Blueprint.md`. Kept for provenance; not current. Source: `Visualisatium/planning/old2/Database_Schema_Plan.md`. 

# Database Schema Blueprint
**Phase:** 3 (Inventory)
**Strategy:** JSON-Driven Forms (No hardcoded columns).

## 1. THE DYNAMIC PRODUCT TABLE
**Problem:** `ProductsSold.docx` defines complex inputs ("Select from History List OR Free Text", "AND/OR logic").
**Solution:** We store the *Form Rules* in a JSONB column.

### Table: `products`
| Column | Type | Description |
| :--- | :--- | :--- |
| `id` | UUID | Primary Key |
| `sku` | TEXT | Unique ID (e.g., `IMG-FUN-FACESWAP`) |
| `category_id` | TEXT | Link to Category JSON |
| **`form_config`** | **JSONB** | **Defines the UI Form (See below)** |

### Example `form_config` JSON
This is what the App reads to generate the "Moment in History" form:
```json
{
  "attachments": {
    "required": true,
    "label": "Upload Reference",
    "max_count": 5
  },
  "inputs": [
    {
      "id": "event_select",
      "type": "reference_list",
      "source": "historical_events", // Loads from Reference Table
      "allow_custom_text": true,   // Handles the "OR Free Text" rule
      "label": "Select Event or Describe"
    }
  ]
}
```


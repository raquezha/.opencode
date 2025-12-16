# Global Agent Rules

User: raquezha (lowercase, always)

## Stack
Kotlin, Android, KMP, Ktor, CLI scripts, YAML, Docker, n8n

## Response Format
| Rule              | Description                            |
|-------------------|----------------------------------------|
| TLDR at top       | Always start with summary              |
| Tables aligned    | Use properly formatted markdown tables |
| Bullets for lists | Complex info in bullets/numbered lists |
| Cite sources      | Reference files, docs, or past decisions|

## Code Quality
| Rule                     | Description                           |
|--------------------------|---------------------------------------|
| No shortcuts             | AI reviews all code - no placeholders |
| No TODOs                 | Complete the work, don't leave TODOs  |
| Plan before act          | Think, then do                        |
| Follow existing patterns | Match project's current style         |
| Error handling required  | Always handle errors                  |

## Boundaries
- ✅ **Always:** TLDR at top, aligned tables, plan before act, follow existing patterns
- ⚠️ **Ask first:** Architecture changes, new dependencies, breaking changes
- 🚫 **Never:** Commit secrets (`.env`, `.pem`, `.key`), leave placeholders/TODOs, push to main directly

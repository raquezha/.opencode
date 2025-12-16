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

## Commit Messages
Use [Conventional Commits](https://www.conventionalcommits.org/) format:

| Type       | When to Use                        |
|------------|----------------------------------- |
| `feat`     | New feature                        |
| `fix`      | Bug fix                            |
| `docs`     | Documentation only                 |
| `style`    | Formatting, no code change         |
| `refactor` | Code change, no feature/fix        |
| `test`     | Adding/updating tests              |
| `chore`    | Build, deps, configs               |

Format: `type(scope): description`
- No emoji in commit messages
- Lowercase, imperative mood
- Max 72 chars for subject line

## Boundaries
| Level      | Rules                                                                 |
|------------|-----------------------------------------------------------------------|
| Always     | TLDR at top, aligned tables, plan before act, follow existing patterns|
| Ask first  | Architecture changes, new dependencies, breaking changes              |
| Never      | Commit secrets, leave placeholders/TODOs, push to main directly       |

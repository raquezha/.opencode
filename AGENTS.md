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

## Self-Critique (Reflexion Pattern)

Before finalizing significant outputs (commits, PRs, implementations), pause and ask:

| Question                        | Purpose                              |
|---------------------------------|--------------------------------------|
| What's missing?                 | Catch incomplete work                |
| What's superfluous?             | Remove unnecessary additions         |
| Any errors or wrong assumptions?| Validate logic and understanding     |
| Confidence level? (1-5)         | Flag uncertainty for human review    |

When to apply:
- ✅ Commits with 3+ files changed
- ✅ PR descriptions
- ✅ Implementation plans
- ✅ Architecture decisions
- ❌ Simple file reads, minor edits

Source: [Reflexion pattern](https://arxiv.org/abs/2303.11366) - self-reflection improves agent accuracy.

## Boundaries
| Level      | Rules                                                                 |
|------------|-----------------------------------------------------------------------|
| Always     | TLDR at top, aligned tables, plan before act, follow existing patterns|
| Ask first  | Architecture changes, new dependencies, breaking changes              |
| Never      | Commit secrets, leave placeholders/TODOs, push to main directly       |

## Web Search
**Always use `brave_search` tools by default** for any web lookups. Do not use other web fetch methods unless Brave Search is unavailable or explicitly requested otherwise.

**Priority order:**
1. `brave_search` tools (primary - always try first)
2. `webfetch` or other methods (fallback only if Brave fails)

| Tool                  | Use Case                                      |
|-----------------------|-----------------------------------------------|
| `brave_web_search`    | General web search, documentation lookup      |
| `brave_news_search`   | Current events, recent announcements          |
| `brave_local_search`  | Local businesses, places (Pro plan)           |
| `brave_image_search`  | Image search                                  |
| `brave_video_search`  | Video tutorials, demos                        |
| `brave_summarizer`    | AI summaries from search results (Pro plan)   |

When to use Brave Search:
- Looking up documentation or API references
- Checking latest versions of libraries/frameworks
- Researching errors or troubleshooting
- Finding current news or announcements
- Any question requiring up-to-date web information

## Documentation Lookup (Context7)
Use `context7` tools to get up-to-date library documentation directly.

| Tool                          | Use Case                              |
|-------------------------------|---------------------------------------|
| `context7_resolve-library-id` | Find library ID for docs lookup       |
| `context7_get-library-docs`   | Get current library documentation     |

When to use Context7:
- Looking up Kotlin, Android, Ktor, Gradle, Compose docs
- Need accurate, versioned documentation
- Reducing hallucination on library APIs

## Code Examples (Grep by Vercel)
Use `gh_grep` to search real code examples from GitHub repositories.

| Tool             | Use Case                                      |
|------------------|-----------------------------------------------|
| `gh_grep_search` | Search code patterns across GitHub repos      |

When to use gh_grep:
- "How do others implement X?"
- Finding real-world usage patterns
- Looking for code examples

## GitHub MCP (Official)

GitHub's official MCP server for repository operations. Uses Docker.

| Tool Pattern | Use Case                                      |
|--------------|-----------------------------------------------|
| `github_*`   | Issues, PRs, repos, actions, code search      |

Available operations:
- Repository management (files, branches, commits)
- Issues and pull requests
- GitHub Actions workflows
- Code search and security scanning
- Notifications and discussions

Source: https://github.com/github/github-mcp-server

## GitLab MCP

GitLab MCP server for self-hosted GitLab instances.

| Tool Pattern | Use Case                                      |
|--------------|-----------------------------------------------|
| `gitlab_*`   | Issues, MRs, repos on GitLab                  |

Available operations:
- Repository management
- Issues and merge requests
- Project pipelines

Source: https://github.com/zereight/gitlab-mcp

## MCP Setup - Complete Fix Guide

### Current Status

| MCP | Status | Issue | Solution |
|-----|--------|-------|----------|
| **GitLab** | ✅ Working | None | Ready to use |
| **GitLab Docs** | ✅ Working | None | Ready to use |
| **GitHub** | ✅ Working | None | Docker installed, ready to use |
| **Brave Search** | ✅ Working | None | Ready to use |
| **Context7** | ✅ Working | None | Ready to use |
| **gh_grep** | ✅ Working | None | Ready to use |

**Last Updated:** 2025-12-25 - Docker installed, all MCPs enabled

---

### GitLab MCP - WORKING ✅

**Test Results:**
```
✅ Configuration validation passed
✅ Server initializes with stdio transport
✅ API URL configured: https://gitlab.nweca.com/api/v4
✅ GitLab 18.7.0-ee connection verified
```

**If you still see "Connection close" error:**
1. Restart opencode completely
2. Check opencode logs for detailed error
3. Verify no other process is using the MCP

**Test manually:**
```bash
cd ~/.config/opencode
GITLAB_PERSONAL_ACCESS_TOKEN="$(cat .secrets/gitlab-token)" \
GITLAB_API_URL="$(cat .secrets/gitlab-api-url)" \
npx -y @zereight/mcp-gitlab
```

---

### GitHub MCP - WORKING ✅

**Status:** Docker Desktop installed (version 29.1.3)

**Configuration:**
- Docker image: `ghcr.io/github/github-mcp-server:latest`
- Authentication: GitHub Personal Access Token
- Status: Enabled and ready to use

**Config after Docker install:**
```json
{
  "github": {
    "command": "docker",
    "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github_token}"
    }
  }
}
```

#### Option 2: Build from Source (Advanced)

**Requirements:**
- Go 1.21+ installed
- Git
- ~5 minutes build time

**Steps:**
```bash
# 1. Install Go
brew install go

# 2. Clone and build
git clone https://github.com/github/github-mcp-server.git
cd github-mcp-server
go build -o github-mcp-server ./cmd/github-mcp-server

# 3. Move binary
mkdir -p ~/.local/bin
mv github-mcp-server ~/.local/bin/

# 4. Update opencode.json
```

**Config for built binary:**
```json
{
  "github": {
    "command": "/Users/raquezha/.local/bin/github-mcp-server",
    "args": ["stdio"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github_token}"
    }
  }
}
```

#### Option 3: Keep Disabled (Current)

**Use `gh` CLI instead:**
```bash
# Already installed: gh version 2.76.2

# Common operations:
gh repo list
gh issue list
gh pr list
gh pr create
gh workflow list
```

**Pros:**
- No Docker needed
- No build needed
- Already working

**Cons:**
- No MCP integration
- Manual commands only

---

### Recommended Action Plan

**Immediate (No changes needed):**
1. ✅ GitLab MCP is working - just restart opencode
2. ✅ GitLab Docs MCP is working
3. ✅ All other MCPs working

**Optional (If you want GitHub MCP):**
1. Install Docker Desktop
2. Rename `_github_disabled_no_docker` → `github` in opencode.json
3. Restart opencode
4. Test with: `@github list my repositories`

**Alternative (If you don't want Docker):**
- Keep using `gh` CLI for GitHub operations
- No MCP needed for basic GitHub tasks

---

### Testing After Restart

**Test GitLab MCP:**
```
# In opencode:
@gitlab help me with CI/CD caching
```

**Test GitLab Docs MCP:**
```
# The gitlab agent will automatically use it:
@gitlab what's new in GitLab 18.7?
```

**Test GitHub (if enabled):**
```
@github list my repositories
```

---

### Files Modified

```
~/.config/opencode/
├── opencode.json (modified - github disabled, gitlab fixed)
└── .secrets/
    ├── gitlab-api-url (fixed - added https://)
    ├── gitlab-token (cleaned - removed newlines)
    └── github-token (ready for when Docker installed)
```

---

### Quick Reference

| Task | Command |
|------|---------|
| Test GitLab API | `curl -H "PRIVATE-TOKEN: $(cat ~/.config/opencode/.secrets/gitlab-token)" "$(cat ~/.config/opencode/.secrets/gitlab-api-url)/api/v4/version"` |
| Test GitLab MCP | See "Test manually" section above |
| Install Docker | `open https://www.docker.com/products/docker-desktop` |
| Install Go | `brew install go` |
| Use gh CLI | `gh --help` |


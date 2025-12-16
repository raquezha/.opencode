# /analyze-issue

**Issue → Implementation Spec** - Turn issue URL into actionable plan.

## Usage
```
/analyze-issue <url-or-id>
/analyze-issue https://github.com/owner/repo/issues/123
/analyze-issue https://gitlab.com/owner/repo/-/issues/456
/analyze-issue https://company.atlassian.net/browse/PROJ-789
/analyze-issue #123              (GitHub - current repo)
/analyze-issue PROJ-789          (Jira project key format)
```

## Platform Detection

| Input Pattern                          | Platform | Example                                      |
|----------------------------------------|----------|----------------------------------------------|
| URL contains `/-/issues/`              | GitLab   | `https://gitlab.nweca.com/team/repo/-/issues/24` |
| URL contains `github.com`              | GitHub   | `https://github.com/owner/repo/issues/123`   |
| URL contains `atlassian.net/browse`    | Jira     | `https://acme.atlassian.net/browse/PROJ-789` |
| `#N` (number only)                     | GitHub   | `#123` (uses current git remote)             |
| `KEY-N` (uppercase letters + number)   | Jira     | `PROJ-789`                                   |

**GitLab Detection:** The `/-/issues/` path pattern is unique to GitLab and works for:
- `gitlab.com` (public)
- `gitlab.yourcompany.com` (self-hosted)
- Any GitLab instance regardless of domain

## Execution Steps

### Step 1: Detect Platform

**REQUIRED:** Before proceeding, explicitly state the detected platform:
> "Detected platform: [PLATFORM] based on [PATTERN] in URL: [URL]"

Detection rules (check in this order):
1. URL contains `/-/issues/` → **GitLab** (works for any GitLab instance)
2. URL contains `github.com` → **GitHub**
3. URL contains `atlassian.net/browse` → **Jira**
4. Input matches `#N` format → **GitHub** (current repo)
5. Input matches `[A-Z]+-\d+` format (e.g., `PROJ-123`) → **Jira**

**Important:** GitLab uses `/-/issues/` path structure which is unique. This catches:
- `gitlab.com/.../-/issues/N`
- `gitlab.yourcompany.com/.../-/issues/N`
- Any self-hosted GitLab instance

### Step 2: Verify CLI Tool Availability

Run `which <tool>` to check if the required CLI is installed:

| Platform | CLI Tool | Check Command |
|----------|----------|---------------|
| GitHub   | `gh`     | `which gh`    |
| GitLab   | `glab`   | `which glab`  |
| Jira     | `jira`   | `which jira`  |

**If CLI not installed:** Stop execution immediately and display this message:

```
## CLI Not Found

| Item      | Value                              |
|-----------|------------------------------------|
| Platform  | [GitHub/GitLab/Jira]               |
| Required  | [gh/glab/jira]                     |
| Status    | Not installed                      |

### Install

[Platform-specific installation below]

**GitHub:**
brew install gh
gh auth login

**GitLab:**
brew install glab
glab auth login

**Jira:**
brew install jira-cli
jira init

After installing, run `/analyze-issue` again.
```

**Do not proceed with issue analysis if CLI is missing.**

### Step 3: Fetch Issue Details

| Platform | Command                                        |
|----------|------------------------------------------------|
| GitHub   | `gh issue view <num> --comments`               |
| GitLab   | `glab issue view <num> --comments`             |
| Jira     | `jira issue view <key> --comments`             |

### Step 4: Analyze and Output

## Output Format
```
## Issue Analysis: [PLATFORM] [ID]

| Aspect     | Value                          |
|------------|--------------------------------|
| Platform   | GitHub / GitLab / Jira         |
| Title      | Issue title here               |
| Type       | Feature / Bug / Enhancement    |
| Priority   | From labels or inferred        |
| Complexity | Low / Medium / High            |
| Assignee   | username or Unassigned         |
| Labels     | label1, label2                 |

## Understanding
<1-2 sentence summary of what's being asked>

## Affected Areas
| Area              | Impact                     |
|-------------------|----------------------------|
| UI/Settings       | Add toggle component       |
| Theme/Styles      | Add dark color palette     |
| Storage           | Persist preference         |

## Implementation Spec
1. [ ] First task
2. [ ] Second task
3. [ ] Third task

## Questions/Blockers
- Any clarifications needed?
- Dependencies or blockers?

## Ready to Implement?
Run `/fix-issue [ID]` to start implementation.
```

## Platform Priority
GitLab and Jira issues are primary focus. Detection order:
1. GitLab (if URL contains `/-/issues/` - unique to GitLab)
2. Jira (if input matches `KEY-N` pattern or `atlassian.net`)
3. GitHub (if URL contains `github.com` or `#N` format)

## Boundaries
- ✅ **Always:** Check CLI availability first, read-only analysis, ask clarifying questions
- ⚠️ **Ask first:** If platform is ambiguous from input
- 🚫 **Never:** Start implementation without approval, proceed without required CLI

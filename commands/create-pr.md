# /create-pr

**Create PR with good description** - Branch ready, create the PR.

## Usage
```
/create-pr
/create-pr --draft
```

## What It Does
1. Check current branch and commits
2. Compare with main/master
3. Analyze all changes for PR
4. Generate title and description
5. Create PR via `gh`

## Output Format
```
## PR Ready

| Aspect        | Value                              |
|---------------|------------------------------------|
| Branch        | feature/add-dark-mode              |
| Base          | main                               |
| Commits       | 3 commits                          |
| Files changed | 7 files                            |

## Generated PR

### Title
feat(settings): add dark mode toggle

### Description
## Summary
- Add dark mode toggle in Settings screen
- Persist preference using DataStore
- Apply theme on app startup

## Changes
| File                  | Change                    |
|-----------------------|---------------------------|
| ThemeManager.kt       | New - theme state logic   |
| SettingsScreen.kt     | Add toggle component      |
| Theme.kt              | Add dark color palette    |

## Testing
- [x] Manual toggle works
- [x] Preference persists across restart
- [x] Unit tests added

## Result
✅ PR created: https://github.com/user/repo/pull/45
```

## Commands Used
| Command                                  | Purpose              |
|------------------------------------------|----------------------|
| `git log main..HEAD --oneline`           | Commits in branch    |
| `git diff main..HEAD --stat`             | Files changed        |
| `gh pr create --title "x" --body "y"`    | Create PR            |

## Boundaries
- ✅ **Always:** Summarize all commits (not just latest), include testing status
- ⚠️ **Ask first:** If PR spans multiple features, suggest splitting
- 🚫 **Never:** Create PR with incomplete description, merge automatically

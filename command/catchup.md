# /catchup

**"What was I doing?"** - Catch up on project state after a break.

## What It Does
1. Show current git branch and status
2. Show recent commits (last 5)
3. Show uncommitted changes
4. Show any stashed work
5. Summarize: "You were working on X"

## Output Format
```
## Status: <project-name>

| Item              | Value                          |
|-------------------|--------------------------------|
| Branch            | feature/xyz                    |
| Last commit       | 2 hours ago: "feat: add login" |
| Uncommitted files | 3 modified, 1 untracked        |
| Stashes           | 1 stash                        |

## Recent Commits
1. feat: add login validation (2h ago)
2. fix: null check in UserService (yesterday)
3. ...

## Summary
You were working on login feature. 3 files modified, not yet committed.
```

## Commands Used
| Command                          | Purpose              |
|----------------------------------|----------------------|
| `git branch --show-current`      | Current branch       |
| `git status --short`             | Uncommitted changes  |
| `git log --oneline -5`           | Recent commits       |
| `git stash list`                 | Stashed work         |

## Boundaries
- ✅ **Always:** Read-only, just report state
- 🚫 **Never:** Modify files, make commits, change branches

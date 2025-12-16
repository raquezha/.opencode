# /cleanup

**Reset workspace for new task** - Checkout main, pull, prune, delete merged branches.

## What It Does
1. Check for uncommitted changes (warn if found)
2. Checkout main/master
3. Pull latest changes
4. Prune deleted remote branches
5. Delete local branches already merged to main
6. Report clean state

## Output Format
```
## Cleanup Complete

| Step                   | Result                   |
|------------------------|--------------------------|
| Uncommitted changes    | ✅ None                  |
| Checkout               | ✅ main                  |
| Pull                   | ✅ 3 commits pulled      |
| Prune remotes          | ✅ 2 stale refs removed  |
| Delete merged branches | ✅ 3 deleted             |

## Deleted Branches
| Branch            | Status         |
|-------------------|----------------|
| feature/login-fix | Merged, deleted|
| feature/dark-mode | Merged, deleted|
| fix/typo          | Merged, deleted|

## Kept (unmerged)
| Branch          | Status            |
|-----------------|-------------------|
| feature/new-api | 5 commits ahead   |

## Ready
Clean slate. Start new task!
```

## Commands Used
| Command                                           | Purpose                |
|---------------------------------------------------|------------------------|
| `git status --porcelain`                          | Check uncommitted      |
| `git checkout main \|\| git checkout master`      | Switch to main         |
| `git pull`                                        | Get latest             |
| `git fetch --prune`                               | Remove stale remotes   |
| `git branch --merged main \| grep -v "main\|master"` | Find merged branches|
| `git branch -d <branch>`                          | Delete merged branch   |

## Boundaries
- ✅ **Always:** Show what will be deleted before doing it, use safe delete (-d not -D)
- ⚠️ **Ask first:** If current branch has uncommitted changes
- 🚫 **Never:** Delete unmerged branches, force delete (-D), delete main/master

# /fix-issue

**Full workflow: Issue → Branch → Fix → Test → PR**

## Usage
```
/fix-issue <github-issue-url>
/fix-issue #123
```

## What It Does
1. Analyze issue (like `/analyze-issue`)
2. Create feature branch
3. Implement the fix
4. Run tests
5. Commit with issue reference
6. Create PR

## Workflow Steps
```
┌─────────────┐
│ Analyze     │ Understand issue, plan implementation
└──────┬──────┘
       ▼
┌─────────────┐
│ Branch      │ Create feature/fix-<issue>-<slug>
└──────┬──────┘
       ▼
┌─────────────┐
│ Implement   │ Make changes, follow patterns
└──────┬──────┘
       ▼
┌─────────────┐
│ Test        │ Run tests, fix if failing
└──────┬──────┘
       ▼
┌─────────────┐
│ Commit      │ ✨ feat: <desc> (fixes #123)
└──────┬──────┘
       ▼
┌─────────────┐
│ PR          │ Create PR with full description
└─────────────┘
```

## Output Format
```
## Fixing Issue #123: Add dark mode toggle

### Step 1: Analysis ✅
| Aspect     | Value            |
|------------|------------------|
| Type       | Feature          |
| Complexity | Medium           |
| Files      | ~5 files         |

### Step 2: Branch ✅
Created: feature/fix-123-dark-mode-toggle

### Step 3: Implementation ✅
| File              | Change              |
|-------------------|---------------------|
| ThemeManager.kt   | Created             |
| SettingsScreen.kt | Modified            |
| Theme.kt          | Modified            |

### Step 4: Tests ✅
All tests passing (42 passed, 0 failed)

### Step 5: Commit ✅
✨ feat(settings): add dark mode toggle (fixes #123)

### Step 6: PR ✅
https://github.com/user/repo/pull/45

## Summary
Issue #123 fixed and PR ready for review.
```

## Boundaries
- ✅ **Always:** Follow existing patterns, run tests, reference issue in commit
- ⚠️ **Ask first:** If implementation unclear, if tests fail unexpectedly
- 🚫 **Never:** Skip tests, force push, merge own PR

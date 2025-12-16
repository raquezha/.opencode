# /commit

**Smart commits** - Stage, generate message, commit.

## What It Does
1. Show current changes (`git status`)
2. Analyze what changed
3. Generate conventional commit message with emoji
4. Stage relevant files
5. Commit with generated message
6. Show result

## Commit Format
```
<emoji> <type>(<scope>): <description>

<optional body>
```

## Emoji + Type Reference
| Emoji | Type     | When                        |
|-------|----------|-----------------------------|
| ✨    | feat     | New feature                 |
| 🐛    | fix      | Bug fix                     |
| 📝    | docs     | Documentation only          |
| 💄    | style    | Formatting, no code change  |
| ♻️    | refactor | Code change, no feature/fix |
| ✅    | test     | Adding/updating tests       |
| 🔧    | chore    | Config, build, tooling      |
| ⬆️    | deps     | Dependency updates          |

## Example Output
```
## Changes Detected
| File                  | Change   |
|-----------------------|----------|
| src/LoginViewModel.kt | Modified |
| src/AuthService.kt    | Modified |
| test/LoginTest.kt     | Added    |

## Commit Message
✨ feat(auth): add login validation with error handling

Added input validation for email/password fields and proper error
state handling in LoginViewModel.

## Result
✅ Committed: abc1234
```

## Commands Used
| Command                            | Purpose            |
|------------------------------------|--------------------|
| `git status --short`               | See changes        |
| `git diff --staged`                | Analyze staged     |
| `git add <files>`                  | Stage files        |
| `git commit -m "<msg>"`            | Create commit      |

## Boundaries
- ✅ **Always:** Show changes before committing, use conventional format
- ⚠️ **Ask first:** If changes span multiple unrelated features
- 🚫 **Never:** Commit secrets, commit unrelated files, push automatically

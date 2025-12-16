# /check

**Run quality checks** - Test, lint, build and fix issues.

## Usage
```
/check           # Run all checks
/check test      # Tests only
/check lint      # Lint only
/check build     # Build only
```

## What It Does
1. Detect project type
2. Run appropriate checks
3. Report results
4. Offer to fix issues

## Check Commands by Project Type
| Project Type | Test              | Lint                    | Build                |
|--------------|-------------------|-------------------------|----------------------|
| Kotlin/Gradle| `./gradlew test`  | `./gradlew ktlintCheck` | `./gradlew build`    |
| Android      | `./gradlew test`  | `./gradlew lint`        | `./gradlew assemble` |
| Node/npm     | `npm test`        | `npm run lint`          | `npm run build`      |
| Python       | `pytest`          | `ruff check .`          | N/A                  |

## Output Format
```
## Quality Check Results

| Check  | Status | Details                  |
|--------|--------|--------------------------|
| Lint   | ⚠️ 3   | 3 warnings in 2 files    |
| Test   | ✅ Pass | 42 passed, 0 failed      |
| Build  | ✅ Pass | BUILD SUCCESSFUL         |

## Issues Found

### Lint Warnings
| File              | Line | Issue                    |
|-------------------|------|--------------------------|
| UserService.kt    | 45   | Unused import            |
| LoginViewModel.kt | 23   | Line too long (120>100)  |
| LoginViewModel.kt | 67   | Missing newline at EOF   |

## Auto-fix Available
Run `/check --fix` to auto-fix 3 lint issues.
```

## Boundaries
- ✅ **Always:** Run checks before suggesting fixes, report all issues
- ⚠️ **Ask first:** Before auto-fixing, before modifying test files
- 🚫 **Never:** Skip failing tests, hide errors, modify code without showing what changed

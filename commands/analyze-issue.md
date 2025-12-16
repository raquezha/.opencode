# /analyze-issue

**Issue → Implementation Spec** - Turn issue URL into actionable plan.

## Usage
```
/analyze-issue <github-issue-url>
/analyze-issue #123
```

## What It Does
1. Fetch issue details (title, body, labels, comments)
2. Understand the request
3. Identify affected files/areas
4. Create implementation spec
5. Estimate complexity

## Output Format
```
## Issue Analysis: #123

| Aspect     | Value                          |
|------------|--------------------------------|
| Title      | Add dark mode toggle           |
| Type       | Feature / Bug / Enhancement    |
| Priority   | From labels or inferred        |
| Complexity | Low / Medium / High            |

## Understanding
<1-2 sentence summary of what's being asked>

## Affected Areas
| Area              | Impact                     |
|-------------------|----------------------------|
| UI/Settings       | Add toggle component       |
| Theme/Styles      | Add dark color palette     |
| Storage           | Persist preference         |

## Implementation Spec
1. [ ] Create ThemeManager for state
2. [ ] Add dark color definitions
3. [ ] Create toggle in Settings screen
4. [ ] Persist preference to DataStore
5. [ ] Apply theme on app start

## Questions/Blockers
- Need design specs for dark colors?
- Should respect system theme?

## Ready to Implement?
Run `/fix-issue #123` to start implementation.
```

## Commands Used
| Command                         | Purpose           |
|---------------------------------|-------------------|
| `gh issue view <num>`           | Fetch issue       |
| `gh issue view <num> --comments`| Include comments  |

## Boundaries
- ✅ **Always:** Read-only analysis, ask clarifying questions
- 🚫 **Never:** Start implementation without approval

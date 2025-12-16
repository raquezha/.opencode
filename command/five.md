# /five

**5 Whys Analysis** - Root cause analysis for problems.

Based on [5 Whys technique](https://en.wikipedia.org/wiki/Five_whys).

## Usage
```
/five <problem description>
/five "Tests are flaky in CI"
```

## What It Does
1. State the problem clearly
2. Ask "Why?" 5 times, digging deeper
3. Identify root cause
4. Suggest actionable fix

## Output Format
```
## 5 Whys Analysis

### Problem
Tests are flaky in CI

### Analysis
| #   | Why?                              | Answer                                    |
|-----|-----------------------------------|-------------------------------------------|
| 1   | Why do tests fail in CI?         | Timing-dependent assertions fail randomly |
| 2   | Why are assertions timing-dependent? | Tests assume immediate async completion|
| 3   | Why do tests assume immediate completion? | Missing proper async test utilities |
| 4   | Why are async utilities missing? | Tests written before async patterns established |
| 5   | Why weren't they updated?        | No test review process, tech debt accumulated |

### Root Cause
Tests written without proper async handling, no process to update legacy tests.

### Recommended Actions
| Priority | Action                                |
|----------|---------------------------------------|
| 1        | Add async test utilities (runTest)    |
| 2        | Fix flaky tests with proper awaits    |
| 3        | Add test review to PR checklist       |
| 4        | Schedule tech debt review quarterly   |
```

## When to Use
| Situation                    | Use /five? |
|------------------------------|------------|
| Bug keeps coming back        | ✅ Yes     |
| Process problem              | ✅ Yes     |
| One-time simple bug          | ❌ No      |
| Need quick fix               | ❌ No      |

## Boundaries
- ✅ **Always:** Dig to actual root cause, suggest actionable fixes
- 🚫 **Never:** Stop at surface symptoms, blame people

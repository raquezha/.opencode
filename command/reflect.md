# /reflect

**Self-critique any work** - Pause and evaluate before finalizing.

Based on [Reflexion pattern](https://arxiv.org/abs/2303.11366) - self-reflection improves agent accuracy.

## Usage
```
/reflect                    # Reflect on current work
/reflect <topic>           # Reflect on specific topic
```

## What It Does
1. Identify the work to reflect on
2. Apply the 4-question framework
3. Rate confidence level
4. Suggest improvements or flag issues

## The 4 Questions

| #  | Question                        | Purpose                              |
|----|---------------------------------|--------------------------------------|
| 1  | What's missing?                 | Catch incomplete work                |
| 2  | What's superfluous?             | Remove unnecessary additions         |
| 3  | Any errors or wrong assumptions?| Validate logic and understanding     |
| 4  | Confidence level? (1-5)         | Flag uncertainty for human review    |

## Confidence Scale

| Level | Meaning                          | Action                       |
|-------|----------------------------------|------------------------------|
| 5     | Certain - no issues              | Proceed                      |
| 4     | High - minor uncertainty         | Proceed, note caveats        |
| 3     | Medium - some gaps               | Review with user             |
| 2     | Low - significant uncertainty    | Pause, get user input        |
| 1     | Very low - likely wrong          | Stop, escalate to user       |

## When to Use

Apply automatically for:
- ✅ Commits with 3+ files changed
- ✅ PR descriptions
- ✅ Implementation plans
- ✅ Architecture decisions
- ✅ Complex refactoring

Skip for:
- ❌ Simple file reads
- ❌ Minor single-file edits
- ❌ Informational responses

## Output Format
```
## Self-Critique: <topic>

### 1. What's Missing?
- <item 1>
- <item 2>

### 2. What's Superfluous?
- <item 1> (remove because...)

### 3. Errors or Wrong Assumptions?
- <item 1> (actually should be...)

### 4. Confidence Level
**Rating: 4/5** - High confidence, minor caveats noted above.

## Recommendation
<Proceed / Review with user / Stop and discuss>
```

## Example
```
/reflect my implementation plan for dark mode
```

Output:
```
## Self-Critique: Dark Mode Implementation Plan

### 1. What's Missing?
- System preference detection (auto dark mode)
- Transition animation between themes

### 2. What's Superfluous?
- None - plan is minimal

### 3. Errors or Wrong Assumptions?
- Assumed DataStore is already in project (need to verify)

### 4. Confidence Level
**Rating: 4/5** - High confidence, just need to verify DataStore dependency.

## Recommendation
Proceed after confirming DataStore in build.gradle.
```

## Boundaries
- ✅ **Always:** Answer all 4 questions, give confidence rating, recommend action
- ⚠️ **Ask first:** If confidence < 3, pause for user input
- 🚫 **Never:** Skip reflection for complex changes, inflate confidence

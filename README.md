# Global OpenCode Setup

raquezha's global agent rules and commands for all projects.

## Structure
```
~/.opencode/
├── AGENTS.md              # Global rules
├── agents/
│   └── docs-agent.md      # Universal documenter
├── commands/
│   ├── status.md          # "What was I doing?"
│   ├── commit.md          # Smart commits
│   ├── context.md         # "What is this project?"
│   ├── analyze-issue.md   # Issue → spec
│   ├── create-pr.md       # Good PR descriptions
│   ├── fix-issue.md       # Issue → fix → PR
│   ├── five.md            # 5 Whys analysis
│   └── check.md           # Quality checks
└── README.md              # This file
```

## Commands Reference
| Command          | Purpose                          |
|------------------|----------------------------------|
| `/status`        | Show git state, recent work      |
| `/commit`        | Generate good commit message     |
| `/context`       | Analyze project structure        |
| `/analyze-issue` | Turn issue into implementation spec |
| `/create-pr`     | Create PR with good description  |
| `/fix-issue`     | Full workflow: issue → PR        |
| `/five`          | 5 Whys root cause analysis       |
| `/check`         | Run tests, lint, build           |

## Agents
| Agent        | Purpose                     |
|--------------|-----------------------------|
| `docs-agent` | Document anything, anywhere |

## Usage
These files are automatically loaded by OpenCode when working in any project.

## Adding to Git
```bash
cd ~/.opencode
git init
git add .
git commit -m "✨ feat: initial global opencode setup"
git remote add origin git@github.com:raquezha/opencode-global.git
git push -u origin main
```

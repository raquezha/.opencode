# Global OpenCode Config

Personal AI agent rules and slash commands for [OpenCode](https://opencode.ai).

## Why This Exists

| Problem                            | Solution                        |
|------------------------------------|---------------------------------|
| Forget context after breaks        | `/catchup` catches you up       |
| Inconsistent commit messages       | `/commit` generates good ones   |
| Context switching between projects | `/context` explains any project |
| Issues sit unanalyzed              | `/analyze-issue` creates specs  |
| PRs lack good descriptions         | `/create-pr` writes them        |
| Bugs recur without root cause      | `/five` digs to the why         |
| Messy branches after task done     | `/cleanup` resets workspace     |

## Structure

```
~/.config/opencode/
├── AGENTS.md              # Global rules (stack, response format, boundaries)
├── agent/
│   └── docs-agent.md      # Universal documentation agent
├── command/
│   ├── catchup.md         # "What was I doing?"
│   ├── commit.md          # Smart conventional commits
│   ├── context.md         # "What is this project?"
│   ├── analyze-issue.md   # Issue → implementation spec
│   ├── create-pr.md       # PR with good description
│   ├── fix-issue.md       # Full workflow: issue → PR
│   ├── five.md            # 5 Whys root cause analysis
│   ├── check.md           # Run tests, lint, build
│   └── cleanup.md         # Reset workspace for new task
├── plugin/
│   └── env-protection.js  # Blocks reading .env, secrets, keys
└── README.md
```

## Commands

| Command          | Purpose                              |
|------------------|--------------------------------------|
| `/catchup`       | Show git state and recent work       |
| `/commit`        | Generate conventional commit + emoji |
| `/context`       | Analyze project structure            |
| `/analyze-issue` | Turn issue into implementation spec  |
| `/create-pr`     | Create PR with good description      |
| `/fix-issue`     | Full workflow: issue → PR            |
| `/five`          | 5 Whys root cause analysis           |
| `/check`         | Run tests, lint, build               |
| `/cleanup`       | Reset workspace, prune branches      |

## Agents

| Agent        | Purpose                                  |
|--------------|------------------------------------------|
| `docs-agent` | Document anything: code, processes, notes|

## Plugins

| Plugin           | Purpose                                  |
|------------------|------------------------------------------|
| `env-protection` | Blocks reading `.env`, credentials, keys |

### Blocked Patterns

The env-protection plugin prevents reading files matching:

| Pattern       | Examples                          |
|---------------|-----------------------------------|
| `.env`        | `.env`, `.env.local`, `.env.prod` |
| `credentials` | `credentials.json`                |
| `.pem`        | `private.pem`, `cert.pem`         |
| `.key`        | `server.key`, `api.key`           |
| `id_rsa`      | `~/.ssh/id_rsa`                   |
| `id_ed25519`  | `~/.ssh/id_ed25519`               |
| `.p12`        | `certificate.p12`                 |
| `.pfx`        | `certificate.pfx`                 |
| `secret`      | `secret.yaml`, `mysecret.json`    |

## Design Principles

Based on [GitHub's analysis of 2,500+ agent files](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/):

| Principle        | Applied                                             |
|------------------|-----------------------------------------------------|
| Commands early   | Each command lists executable commands              |
| 3-tier boundaries| ✅ Always, ⚠️ Ask first, 🚫 Never                   |
| Specific stack   | Kotlin, Android, KMP, Ktor in AGENTS.md             |
| Code examples    | Commands show example output                        |
| Cover 6 areas    | Commands, testing, structure, style, git, boundaries|

## Response Format

All agents follow:

| Rule              | Description                             |
|-------------------|-----------------------------------------|
| TLDR at top       | Always start with summary               |
| Tables aligned    | Properly formatted markdown tables      |
| Bullets for lists | Complex info in bullets/numbered lists  |
| Cite sources      | Reference files, docs, or past decisions|

## Setup

Clone this repo to your OpenCode config directory on any device:

```bash
# macOS / Linux
git clone git@github.com:raquezha/.opencode.git ~/.config/opencode

# Windows (PowerShell)
git clone git@github.com:raquezha/.opencode.git $env:USERPROFILE\.config\opencode
```

### Already have a config directory?

```bash
# Backup existing config
mv ~/.config/opencode ~/.config/opencode.bak

# Clone fresh
git clone git@github.com:raquezha/.opencode.git ~/.config/opencode

# Merge any local customizations from backup if needed
```

### Updating on all devices

```bash
cd ~/.config/opencode && git pull
```

## Sources & References

- [OpenCode Documentation](https://opencode.ai/docs)
- [How to write a great agents.md](https://github.blog/ai-and-ml/github-copilot/how-to-write-a-great-agents-md-lessons-from-over-2500-repositories/) - GitHub Blog
- [Conventional Commits](https://www.conventionalcommits.org/)
- [5 Whys Technique](https://en.wikipedia.org/wiki/Five_whys)

# INSTALL.md — CHIPS Copilot Deployment

How to install and configure CHIPS Copilot on each of the three target CLI platforms.

## Prerequisites (all platforms)

```bash
# Required: Node.js 20+ (for most MCP servers)
node --version    # should be v20 or later

# Recommended: exiftool (for PDF forensics)
# macOS:
brew install exiftool

# Ubuntu / Debian:
sudo apt install libimage-exiftool-perl

# Optional but recommended: Python 3.10+ with pikepdf (fallback PDF tool)
python3 --version
pip3 install pikepdf
```

## Step 1: Set up your case directory

```bash
# Clone or copy this package somewhere stable
git clone https://github.com/noraslaw/chips-copilot ~/chips-copilot

# OR if you have a tarball:
tar xzf chips-copilot-v1.1.tar.gz -C ~/

# Initialize YOUR case directory from the template (idempotent; safe to re-run)
mkdir -p ~/Documents/my-case
~/chips-copilot/scripts/init-case.sh ~/Documents/my-case

# Edit the master index — fill in your case identity (jurisdiction, child name,
# docket number, parties, current track status)
cd ~/Documents/my-case
$EDITOR 00-MASTER-INDEX.md
```

`init-case.sh` copies the full template (numbered subfolders, `_session-log.md`,
`_evidence-hashes.md`, `00-MASTER-INDEX.md`) into your target directory without
overwriting anything that already exists.

## Step 2: Set environment variables

Add to your shell profile (`.zshrc` / `.bashrc`):

```bash
# Case directory
export CHIPS_CASE_DIR="$HOME/Documents/my-case"

# Optional MCP API keys
export COURTLISTENER_API_TOKEN="get-from-courtlistener.com/help/api/"
export FIRECRAWL_API_KEY="get-from-firecrawl.dev"
export JINA_API_KEY="get-from-jina.ai"
# Gmail authenticates via OAuth on first use; no key here
# Dropbox: optional
# GitHub: optional
```

Reload: `source ~/.zshrc` (or close and reopen terminal).

## Step 3a: Claude Code installation

```bash
# Install
npm install -g @anthropic-ai/claude-code

# Authenticate (one-time)
claude login

# Launch from your case directory
cd $CHIPS_CASE_DIR
claude
```

Claude Code automatically reads:
- `CLAUDE.md` (agent instructions)
- `.claude/settings.json` (permissions)
- `.claude/commands/*.md` (slash commands)
- `.claude/agents/*.md` (subagents)
- `.claude/skills/*/SKILL.md` (skills)
- `.mcp.json` (MCP servers)

First-time: Claude Code will ask permission for each MCP server. Approve those you've configured API keys for; skip others.

Try:
```
/triage
/analyze-pdf path/to/some.pdf
```

## Step 3b: OpenCode installation

```bash
# Install (Bun or npm)
curl -fsSL https://opencode.ai/install | bash

# OR
npm install -g opencode-ai

# Authenticate
opencode auth login anthropic

# Launch from case directory
cd $CHIPS_CASE_DIR
opencode
```

OpenCode reads:
- `opencode.json` (main config)
- `AGENTS.md` (agent instructions; also reads `CLAUDE.md` per opencode.json)
- Commands and modes declared in opencode.json

Notes:
- OpenCode "modes" are equivalent to Claude Code "subagents"
- Permissions are configured in opencode.json directly, not a separate file
- MCP servers are configured in opencode.json (parallel content to `.mcp.json`)

## Step 3c: Codex CLI installation

```bash
# Install via pip or npm depending on your Codex variant
# (Codex CLI is OpenAI's; check current install method)

# Codex respects AGENTS.md as the project contract
cd $CHIPS_CASE_DIR
codex
```

Codex will read `AGENTS.md` which references `CLAUDE.md` for full instructions.

Limitations on Codex:
- Codex's `apply_patch` workflow assumes source code; treat `case-template/` as data not patches
- Codex does not natively support the `.claude/` directory structure; the AGENTS.md contract is sufficient
- Codex may not natively recognize the `.mcp.json` format; consult Codex docs

## Step 4: Verify installation

First, run the bundled structural verifier — this confirms commands, agents,
skills, JSON validity, scripts, hashing tools, and (online) MCP package
reachability:

```bash
cd ~/chips-copilot
./scripts/verify-install.sh            # full check
./scripts/verify-install.sh --offline  # skip npm reachability
```

Exit code is `0` (PASS or PASS-with-warnings) or `1` (BLOCKER). A clean run
means the bundle is correctly assembled on your machine.

Then, inside the agent (any platform), run:

```
/triage
```

You should get an initial triage of your case based on whatever you've added to `00-MASTER-INDEX.md` and other files. If the agent asks for jurisdiction first, that's correct — answer once and it persists for the session.

Then try:
```
What can I do here?
```

The agent should describe the slash commands and offer to help with the most pressing items.

## Step 5: Add your first evidence

```bash
# Outside the agent:
./scripts/add-evidence.sh /path/to/court-order.pdf "Order dated YYYY-MM-DD from CHIPS proceeding"

# Or inside the agent:
# Drop the file path in chat; the agent will offer to add it via the script
```

## Step 6: Set up backups

```bash
# Run a backup now to establish baseline
./scripts/backup-case.sh

# Add a cron job for daily backups
crontab -e

# Add:
0 23 * * * cd $HOME/Documents/my-case && ./scripts/backup-case.sh
```

## Troubleshooting

### "MCP server failed to connect"

- Most MCP servers need API keys via environment variables (see Step 2).
- Some servers (Gmail, Dropbox) require OAuth on first use; follow the prompts.
- If a server isn't critical, comment it out in `.mcp.json` / `opencode.json`.

### "Permission denied" when running scripts

```bash
chmod +x scripts/*.sh
```

### "shasum: command not found"

```bash
# Most macOS and Linux systems have shasum or sha256sum already.
# If not:
# macOS: brew install coreutils
# Ubuntu: apt install coreutils
```

### MCP package names (v1.1)

The official `@modelcontextprotocol/*` org no longer ships `courtlistener`,
`gmail`, `fetch`, `sqlite`, or `dropbox` packages. v1.1 of CHIPS Copilot uses
these verified replacements:

| Server         | npm package                              |
|----------------|------------------------------------------|
| courtlistener  | `@us-legal-tools/courtlistener-sdk`      |
| gmail          | `@monsoft/mcp-gmail`                     |
| filesystem     | `@modelcontextprotocol/server-filesystem`|
| dropbox        | `@missionsquad/mcp-dropbox`              |
| firecrawl      | `firecrawl-mcp`                          |
| web-fetch      | `mcp-fetch-server`                       |
| playwright     | `@playwright/mcp`                        |
| sqlite-case-db | `mcp-sqlite`                             |
| github         | `@modelcontextprotocol/server-github`    |

`scripts/verify-install.sh` checks each of these against the live npm registry
when run without `--offline`.

### "exiftool: command not found"

The PDF forensics workflow falls back to `pdfinfo` (from `poppler-utils`) or Python `pikepdf`. Install one:

```bash
# macOS
brew install exiftool

# Ubuntu
sudo apt install libimage-exiftool-perl

# Python fallback
pip3 install pikepdf
```

### Agent doesn't recognize slash commands

- Claude Code: Check `.claude/commands/*.md` exists in the directory you launched from.
- OpenCode: Check `opencode.json` `command` block lists each command.
- Codex: Slash commands may not be supported; invoke equivalent prompts manually.

### Agent says "I don't have access to ..."

Check `.claude/settings.json` (Claude Code) or the `permissions` block in `opencode.json`. Defaults are intentionally conservative (ask before writes to evidence/orders, deny destructive bash operations). Edit if you need to broaden — but understand each change.

## Security checklist before going live

- [ ] Case directory is on encrypted storage (FileVault, LUKS, BitLocker)
- [ ] Backups are encrypted at rest and in transit
- [ ] API keys are in environment variables, not committed to git
- [ ] If using git: `.gitignore` excludes `_session-log.md` and any sensitive raw evidence
- [ ] Cloud sync (iCloud, Dropbox, Google Drive) understands HIPAA / FERPA / state confidentiality requirements — verify before using for evidence
- [ ] Two-factor authentication enabled on your email account (heavily used by the agent)
- [ ] Backup tarball stored offsite (encrypted USB, trusted family member, secure cloud)

## Upgrades

When a new CHIPS Copilot version is released:

```bash
cd ~/chips-copilot
git pull   # or extract new tarball

# Copy updated configs to your case (but NOT your case data):
cp -r ~/chips-copilot/.claude $CHIPS_CASE_DIR/
cp ~/chips-copilot/CLAUDE.md $CHIPS_CASE_DIR/
cp ~/chips-copilot/AGENTS.md $CHIPS_CASE_DIR/
cp ~/chips-copilot/scripts/* $CHIPS_CASE_DIR/scripts/
# Review changes to .mcp.json and opencode.json before overwriting
```

Your case-template data is never overwritten by an upgrade.

## Getting help

- This package is open-source and community-developed.
- Issues and discussion: contact Nora's Law Foundation at noraslaw.io
- For platform-specific issues:
  - Claude Code: docs.claude.com
  - OpenCode: opencode.ai/docs
  - Codex: OpenAI documentation

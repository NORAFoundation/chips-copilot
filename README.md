# CHIPS Copilot v1.2

A CLI agent configuration for parents navigating Child Protective Services / CHIPS / dependency / TPR proceedings. Deploys on Claude Code, OpenCode, and Codex CLI.

**New in v1.2 — built-in walkthrough.** Cold start to triage memo in one command. See `WELCOME.md` for the 30-second pitch, then run `/start` inside any case directory. Added: `/start`, `/next`, `/help`, `/intake`, `/setup-jurisdiction`. Filled the case-template gaps (`05-evidence/`, `06-transcripts/`, `12-financial/`, `_session-log.md`, `_evidence-hashes.md`).

| Total | Component |
|------:|-----------|
|  31   | Slash commands |
|  12   | Specialized subagents |
|  12   | Domain skills |
|   9   | MCP server integrations |
|   4   | Utility scripts |
|  16   | Case-template subfolders |

## Quickstart — cold to triage memo in 15 minutes

```bash
# 1. Get the toolkit
git clone https://github.com/noraslaw/chips-copilot ~/chips-copilot

# 2. Make YOUR case directory (separate from the tool)
~/chips-copilot/scripts/init-case.sh ~/Documents/my-case
export CHIPS_CASE_DIR="$HOME/Documents/my-case"   # add to ~/.zshrc to persist

# 3. Launch the AI tool inside the case directory
cd "$CHIPS_CASE_DIR"
claude          # or: opencode    or: codex

# 4. Inside the tool, ONE command:
#       /start
```

`/start` walks you through case identity → jurisdiction → first triage memo. After that, your day-to-day loop is just `/next` (one specific next action) or whichever `/draft-*` / `/analyze-*` you need.

If you've never used a CLI agent before: read `WELCOME.md` first — that's the human-language explanation. Read `INSTALL.md` if step 1–3 hit a snag.

## What you get

```
chips-copilot/
├── CLAUDE.md                    # Master agent identity (Claude Code)
├── AGENTS.md                    # Same identity for OpenCode / Codex
├── .mcp.json                    # 9 MCP servers (CourtListener, Gmail, Playwright, etc.)
├── opencode.json                # OpenCode-specific full config
├── README.md                    # This file
├── INSTALL.md                   # Per-platform install instructions
├── .claude/
│   ├── settings.json            # Tool permissions (Claude Code)
│   ├── commands/                # 26 slash commands
│   ├── agents/                  # 12 specialized subagents
│   └── skills/                  # 12 domain skills
├── case-template/               # 16-folder workspace with master index
└── scripts/                     # add-evidence, backup-case, extract-pdf-metadata
```

## Capability modules

### Intake & analysis
- `/analyze-pdf` — PDF metadata forensics with consumer-software red-flag detection
- `/analyze-order` — Court order analyzer (requirements, deadlines, rights, gaps)
- `/analyze-report` — Adversarial read of CPS/GAL reports
- `/extract-admissions` — Party-opponent admissions from transcripts
- `/chronology` — Master case timeline builder
- `/compliance-audit` — Statutory compliance audit against state child welfare law

### Evidence management
- `/index-evidence` — Master Evidence Index with hash verification, exhibit numbering, cross-references
- `/exhibit-package` — Court-ready exhibit packages with FRE 901/902 authentication paths
- `/battle-map` — Element-by-element evidence map; witness order; cross targets
- `/preserve` — Full backup with hash re-verification and manifest

### Drafting (beyond motions)
- `/draft-motion` — State court motions (compel, suppress, reconsideration, emergency, etc.)
- `/draft-email` — Caseworker / GAL / attorney correspondence
- `/draft-declaration` — §1746 declarations and notarized affidavits
- `/draft-records-request` — FOIA / state open records / agency records requests
- `/draft-discovery` — Coordinated interrogatories, RFPs, RFAs, subpoenas
- `/draft-witness-prep` — Direct and cross-examination outlines

### Federal & appellate
- `/pre-demand` — Pre-litigation demand letter (fact-heavy, argument-light)
- `/federal-complaint` — §1983 / §1985 / Monell complaint with abstention analysis

### Strategy
- `/triage` — Prioritized action list (today / week / month)
- `/case-theory` — One-paragraph case theory with multiple framings
- `/leverage-analysis` — What each side has; asymmetries; time decay
- `/endgame` — Work backward from desired outcome; critical path; Plan B/C

### Research & verification
- `/find-precedent` — Verified case law and statutory authority via free tools
- `/cite-check` — Citation verification before any filing
- `/stress-test` — Adversarial review of any draft

### Sustainability
- `/check-in` — Brief wellbeing check-in; 988 escalation on crisis signals

## Philosophy

Six rules govern this agent:

1. **Evidence integrity is non-negotiable.** SHA-256 hashing, no modification of originals, documented chain of custody.

2. **Never hallucinate legal citations.** Every case, statute, and rule verified before any filing. The case-law-researcher and citation-verifier subagents pair as a firewall.

3. **Never practice law.** Drafts and analyses only. The user decides, signs, files.

4. **Preserve everything; delete nothing.** Deletes go to archive. Overwrites get .bak suffixes. Session logs are append-only.

5. **Calibrated for a parent in crisis.** Direct, warm, specific, no false reassurance. Wellbeing-checker runs when crisis signals appear.

6. **Strategy presents options, not recommendations.** The strategist subagent has explicit guardrails: tradeoffs, conditional language, reversibility flags, escalation to attorney consultation for high-stakes irreversible decisions.

## Module structure (each capability module = skill + subagent + commands)

| Module | Skill | Subagent | Primary commands |
|--------|-------|----------|------------------|
| Evidence Management | evidence-management/SKILL.md | evidence-manager | /index-evidence, /battle-map, /exhibit-package |
| Legal Drafting | legal-drafting/SKILL.md | drafting-specialist | /draft-declaration, /draft-records-request, /draft-witness-prep, /draft-discovery |
| Case Strategy | case-strategy/SKILL.md | strategist | /case-theory, /leverage-analysis, /endgame, /triage |
| Case Law Research | case-law-research/SKILL.md | case-law-researcher | /find-precedent, /cite-check |

Plus the foundational modules from v1.0: PDF forensics, court filing format, federal civil rights, evidence chain of custody, citation verification, pre-litigation demand, discovery drafting, recording protocols.

## Quick start

```bash
# Extract
tar xzf chips-copilot-v1.1.tar.gz
cd chips-copilot

# Set up your case directory
cp -r . ~/my-case
cd ~/my-case
# Move template contents to top level (one-time)
cp -r case-template/* case-template/.[!.]* . 2>/dev/null || true
# Edit 00-MASTER-INDEX.md with your case identity
$EDITOR 00-MASTER-INDEX.md

# Install Claude Code (or OpenCode / Codex — see INSTALL.md)
npm install -g @anthropic-ai/claude-code

# Optional API keys for MCP servers
export COURTLISTENER_API_TOKEN=...
export FIRECRAWL_API_KEY=...

# Launch
claude

# First commands to try:
#   /triage              — get oriented
#   /index-evidence      — build the Master Evidence Index
#   /case-theory         — develop the one-paragraph spine
#   /chronology          — build the master timeline
```

## The 100-Prompt Library

This config is designed to be paired with `CPS_Parent_Prompt_Library.md` — a 100-prompt jurisdiction-neutral playbook for CPS cases. Slash commands invoke specific prompts; skills encode the deep domain knowledge. Place the library file at the project root so the agent can reference it.

Library licensed CC BY-SA 4.0 by Nora's Law Foundation (noraslaw.io).

## What this isn't

- Not legal advice. The agent produces drafts; the user decides and acts.
- Not a replacement for a lawyer. If you can get one, get one.
- Not therapy. The wellbeing-checker is a check-in, not treatment.
- Not strategic advice. The strategist presents options. The user decides.
- Not magic. The agent does the work; you do the case.

## Status

v1.1 — June 2026. Tested on:
- Claude Code (anthropic/claude-opus-4-7)
- OpenCode (anthropic/claude-opus-4-7)
- Codex CLI (anthropic/claude-opus-4-7 via AGENTS.md)

## Origin

Built in service of parents in the CPS system. Maintained by Nora's Law Foundation (noraslaw.io), a Minnesota 501(c)(3) focused on evidence integrity reform in child welfare proceedings.

The child is at the center. Everything else is in service of bringing them home.

## License

MIT for code and configurations. CC BY-SA 4.0 for the prompt library.

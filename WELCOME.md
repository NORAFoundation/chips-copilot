# Welcome — CHIPS Copilot

You are about to use an AI litigation assistant built for parents navigating Child Protective Services, CHIPS, dependency, or TPR proceedings. This file is the shortest path from "I just opened a terminal" to "I have a working setup and a triage memo."

If you are in crisis right now — or in danger — stop reading and call **988** (call or text). The legal work waits.

## What this is

CHIPS Copilot is a configuration for three different AI command-line tools: Claude Code, OpenCode, and Codex CLI. It teaches whichever tool you pick how to act like a litigation paralegal who has read every relevant statute, knows the court rules in your state, and won't sleep until your filings are ready.

It does NOT replace a lawyer. It does the work a paralegal would do so that the lawyer-shaped work (or your pro se equivalent) is faster, sharper, and better-documented.

It runs locally. Your case stays on your machine.

## What you do, in order

### 1. Install (10 minutes)

Follow `INSTALL.md`. The short version:

```bash
# Clone or unpack this repo to ~/chips-copilot
git clone https://github.com/noraslaw/chips-copilot ~/chips-copilot

# Set up YOUR case directory (separate from the tool)
~/chips-copilot/scripts/init-case.sh ~/Documents/my-case
export CHIPS_CASE_DIR="$HOME/Documents/my-case"
```

Then add that `export` line to your shell profile (`~/.zshrc` or `~/.bashrc`) so it persists.

### 2. Start the AI tool inside your case directory

```bash
cd "$CHIPS_CASE_DIR"
claude         # or: opencode    or: codex
```

### 3. Type ONE command

```
/start
```

That's it. `/start` will:

- Greet you and confirm you're not in crisis
- Walk you through filling in the master index (case number, jurisdiction, parties, next hearing)
- Lock in your jurisdiction (statutes, court rules, recording-consent law)
- Generate your first triage memo — what to do today, this week, this month
- Tell you the four commands you'll use most: `/next`, `/help`, `/analyze-order`, `/check-in`

Roughly 10–15 minutes. Then you have a working setup.

## What "working setup" actually means

When `/start` is done, you'll have:

- A populated `00-MASTER-INDEX.md` — every later command reads it instead of asking you again
- A locked `_jurisdiction.md` — every later draft formats citations correctly
- A first `triage-YYYYMMDD.md` in `08-research/` — your prioritized list
- A `_session-log.md` entry — so the next session knows where you left off

From there, every interaction is one of three patterns:

**A document arrived** — court order, CPS report, GAL report, anything:
```
/analyze-order   (paste it)
/analyze-report  (paste it)
/analyze-pdf     (forensic metadata pass on PDFs you suspect)
```

**You need to write something** — motion, declaration, records request, email to the caseworker:
```
/draft-motion
/draft-declaration
/draft-records-request
/draft-email
```

**You're not sure what to do**:
```
/next     — one specific next action based on case state
/help     — full command index organized by need
/triage   — refresh the priority list
```

## What to upload first

Once your case directory exists, drop these files into the matching folders as you have them:

| What you have | Where it goes |
|---|---|
| The CHIPS petition or dependency petition that started this | `02-petitions-filings/` |
| Every court order (TPO, dispositional, review, permanency, etc.) | `01-orders/` |
| Every CPS report, social study, GAL report, expert report | `03-reports/` |
| Emails with caseworker, GAL, opposing counsel | `04-correspondence/` |
| Anything you might use as evidence — recordings, photos, messages, records, your own documentation | `05-evidence/` (run `scripts/add-evidence.sh` to hash) |
| Hearing transcripts | `06-transcripts/` |
| Your service-plan compliance documents — UAs, class certificates, evaluations | `10-services/` |
| Visitation logs | `11-visits/` |

Don't worry about getting it all in at once. The tool works with whatever you have. The more you add, the sharper it gets.

## The hard rules

These rules exist because violating them has cost pro se parents their cases.

1. **Originals in `05-evidence/` are read-only.** If you need to annotate, copy to `07-drafts/` first.
2. **Hash every evidence file** with `scripts/add-evidence.sh`. Without a hash, it isn't court-ready.
3. **Verify every legal citation** in any draft before filing. Use `/cite-check`. Hallucinated case law has sanctioned pro se litigants and attorneys both.
4. **Adversarial review every filing.** Use `/stress-test` before anything goes to the court.
5. **Back up weekly.** Run `/preserve` or `scripts/backup-case.sh`.

## When you can't keep going

Type `/check-in`. It's a real command. It pauses legal work, runs a brief non-clinical wellbeing check, and helps you decide whether to push through, take a break, sleep, or call someone. If anything in your messages signals acute crisis, the tool will surface 988 and stop legal work until you're safe.

The motion is for the child. So is your sleep.

## Where to look when you're stuck

- `chips-copilot-README.md` — full reference for the toolkit (commands, skills, subagents, MCP servers)
- `CPS_Parent_Prompt_Library.md` — the 100 prompts that this whole system is built on, readable end-to-end
- `INSTALL.md` — installation troubleshooting
- `case-template/00-MASTER-INDEX.md` — the master index template, in case you want to see what `/intake` is filling in

## One more thing

If you're reading this for the first time and the install seems like too much, do exactly this:

```bash
git clone https://github.com/noraslaw/chips-copilot ~/chips-copilot
~/chips-copilot/scripts/init-case.sh ~/Documents/my-case
cd ~/Documents/my-case
claude
```

Then type `/start` and let the tool do the rest. You can fix the environment variables and MCP keys later. The triage memo is more valuable than the polish.

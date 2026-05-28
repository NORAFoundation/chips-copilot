---
description: Build or refresh the Master Evidence Index from the evidence vault
argument-hint: <optional: specific evidence to add or update>
---

# Build / Refresh Master Evidence Index

Delegate to `evidence-manager` subagent.

Read `.claude/skills/evidence-management/SKILL.md`.

Workflow:

1. If `05-evidence/MASTER-INDEX.md` exists, read it and update. Otherwise, create it.
2. Scan `05-evidence/` for all files.
3. For each file:
   - Verify hash against `_evidence-hashes.md` (flag mismatches)
   - Assign / preserve internal ID (E001, E002, ...)
   - Identify or update: date, title, source, format
   - If user input describes purpose/auth/objections, capture that
   - Cross-reference any filings citing the evidence
4. Update the Master Index table.
5. Surface to user:
   - Total evidence items
   - Hash verification failures (if any)
   - Items missing key metadata (auth path, "proves" theory)
   - Recent additions since last index update

Save to `05-evidence/MASTER-INDEX.md`. Log in `_session-log.md`.

This is the most important standing document in the case. Run after every evidence addition and before every major filing.

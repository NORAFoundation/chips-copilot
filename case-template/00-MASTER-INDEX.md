# CASE MASTER INDEX

**Case identity** — fill in:
- Case Name:
- Case Number(s):
- Court / Jurisdiction:
- Child(ren) (initials only in this file):
- Parent / Self:
- Co-parent / Co-respondent:
- Agency / CPS office:
- Caseworker:
- Supervisor:
- Guardian ad Litem:
- Judge:
- Agency / opposing counsel:
- Your appointed counsel (if any):

## Parallel proceedings

- CHIPS / dependency: [case number, court]
- Criminal (you): [case number, court]
- Family / custody: [case number, court]
- Federal civil rights: [planned / filed; case number, court]
- Protective order / no-contact: [case number, court]
- Appellate: [case number, court]
- Child support: [case number, court]

## Critical dates (current and upcoming)

(Update after every hearing.)

| Date | Time | Event | Forum | What's at stake |
|------|------|-------|-------|-----------------|

## Folder map

- `01-orders/` — Every court order, sorted by date
- `02-petitions-filings/` — Petitions, my filings, opposing filings
- `03-reports/` — CPS reports, GAL reports, expert reports, social studies
- `04-correspondence/` — Emails, letters, formal communications
- `05-evidence/` — Evidence with chain-of-custody hashes (DO NOT MODIFY originals here)
- `06-transcripts/` — Hearing transcripts, recording transcripts
- `07-drafts/` — Your working drafts (motions, briefs, letters, analyses)
- `08-research/` — Statutory research, case law, statutory compliance audits
- `09-chronology/` — Master chronology and deadline calendar
- `10-services/` — Service compliance documentation (drug tests, classes, evaluations)
- `11-visits/` — Visitation logs and incident reports
- `12-financial/` — Case expenses, damages tracking
- `13-federal/` — Federal civil rights case materials
- `14-appellate/` — Appellate materials
- `15-criminal/` — Parallel criminal case
- `99-archive/` — Old / closed items
- `_session-log.md` — Append-only log of AI-assisted work
- `_evidence-hashes.md` — Chain of custody hash registry

## Working principles

- Documentation is the parent's primary weapon. Document everything.
- Originals stay in `05-evidence/` unmodified. Work on copies in `07-drafts/`.
- Hash every file added to evidence.
- Back up weekly (run `/preserve` or `scripts/backup-case.sh`).
- Verify every legal citation before filing.
- Calendar every deadline twice (paper and digital).
- Tell the truth in writing. Always.

## Quick links to the most important reference materials

- The 100-Prompt Library: `CPS_Parent_Prompt_Library.md` (at project root)
- Master agent instructions: `CLAUDE.md` / `AGENTS.md`
- Slash commands: `.claude/commands/`
- Skills: `.claude/skills/`

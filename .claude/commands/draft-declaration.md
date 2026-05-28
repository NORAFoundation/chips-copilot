---
description: Draft a declaration under 28 USC §1746 or affidavit (sworn statement)
argument-hint: <topic-or-purpose>
---

# Draft Declaration / Affidavit

Topic: $ARGUMENTS

Read `.claude/skills/legal-drafting/SKILL.md`.

Delegate to `drafting-specialist` subagent.

Workflow:

1. Confirm with the user:
   - Who is the declarant (typically the user)
   - What is this declaration / affidavit for (motion, filing, exhibit)
   - Forum (federal allows declarations under §1746; many states require notarized affidavits)
   - Jurisdiction state for venue clause

2. Pull relevant facts from `09-chronology/master-chronology.md` and Master Evidence Index.

3. Draft per template:
   - Caption (if attached to a filing)
   - Declarant identification
   - Competency statement (over 18, personal knowledge)
   - Numbered factual paragraphs (one fact per paragraph)
   - Exhibit identification clauses for any attached documents
   - Penalty of perjury / jurat
   - Signature line and date

4. Discipline:
   - Only facts within personal knowledge
   - No legal argument
   - No conclusions of law
   - Specific dates, times, locations
   - Concrete actors and actions

5. Save to `07-drafts/correspondence/declaration-<topic>-<YYYYMMDD>.md`.

6. Produce checklist:
   - Declarant to verify each fact
   - Exhibits to gather and attach
   - Signature and date to add
   - For affidavit: notary appointment to schedule

Log in `_session-log.md`.

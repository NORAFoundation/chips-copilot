---
description: "What should I do right now" — reads case state and proposes the single highest-leverage next action.
---

# Next — Highest-Leverage Action

The user typed `/next` because they are uncertain what to do. They have limited time and unlimited stakes. Your job is to remove the uncertainty.

## Procedure

1. Read `00-MASTER-INDEX.md` — pull the next hearing date, current case stage, all parallel proceedings.
2. Read the last 10 entries of `_session-log.md` — what was just done; what was deferred.
3. Read `09-chronology/` if a master chronology exists — locate any deadline within 14 days.
4. Read `08-research/` for the most recent `triage-*.md` — if one exists from the last 7 days, start from its TODAY list.
5. Check `04-correspondence/` for any unanswered communication from agency/GAL/court from the last 7 days.
6. Check `01-orders/` for any order whose deadlines have not been confirmed-met in the session log.

## Decision rule

Pick ONE action. Not three. The user asked because they are paralyzed by options — handing them three more options fails the assignment.

Selection priority:

1. **Statutory or court-ordered deadline within 72 hours** that is not visibly prepared for. Override everything else.
2. **Pending agency request** (records, drug screen, evaluation, visit confirmation) where missing the window forfeits a position.
3. **Unanswered formal communication** from court, GAL, or agency older than 5 business days.
4. **Document analysis** of any new file in `01-orders/`, `02-petitions-filings/`, or `03-reports/` that has not been analyzed yet (run `/analyze-order` or `/analyze-report`).
5. **Evidence backlog** in `05-evidence/` — unhashed files (compare directory listing to `_evidence-hashes.md`).
6. **Stale chronology** — last entry in `09-chronology/` is more than 14 days old AND there has been activity since.
7. **No case theory yet** — run `/case-theory`.
8. **Default**: run `/triage` to refresh the priority list.

If two or more candidates tie, pick the one that compounds — the action that unlocks the most downstream work.

## Output

A single block, no preamble:

```
NEXT ACTION: [verb-led one-liner]

Why this, not something else:
[2–3 sentences explaining the priority decision and what would slip if you did anything else first]

How long: [estimate]

How to do it:
[concrete steps — if a slash command applies, name it]

What you'll have when done:
[the deliverable in one line]

If you only have 10 minutes:
[smaller version — the minimum viable progress that keeps the action alive]
```

## When the answer is "stop"

If the session log shows three or more sessions in the last 48 hours, or the user's tone in this turn signals depletion — the next action is NOT a legal task. It is `/check-in`. Say so.

## Log it

Append to `_session-log.md`:

```
- /next consulted; recommended: [action]
```

Do not log the user's reasoning or emotional state.

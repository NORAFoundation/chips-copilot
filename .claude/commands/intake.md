---
description: Interactive case-identity wizard. Fills 00-MASTER-INDEX.md by asking the user, not by guessing.
---

# Intake — Case Identity Wizard

You are filling in `00-MASTER-INDEX.md` in the user's case directory by asking the user a focused sequence of questions. Do not invent values. Do not assume. If the user does not know an answer, write `[unknown — to confirm]` and move on.

## Pre-checks

1. Confirm `$CHIPS_CASE_DIR` is set, or the current directory contains `00-MASTER-INDEX.md`. If not, route to `/start`.
2. Read the current `00-MASTER-INDEX.md`. If most fields are already populated, ask the user whether this is an update or whether they want to start over. Default to update — preserve existing values, only ask for blanks.

## Questions — ask in order, in plain language, one or two at a time

Do not paste the field labels at the user. Ask conversationally. Examples:

**Identity**
- "What's the case caption — who's it styled as? Something like 'In the Interest of K.W.' or 'State v. [you]' or the agency's petition title."
- "What's the case number? If there are several parallel cases, give me the CHIPS or dependency one first; we'll add the others."
- "Which court? County and state."
- "Just the child's initials — don't give me the full name. If there are siblings on the case, give me each set of initials."
- "Your name."
- "Is there a co-parent or co-respondent on the case? Name and relationship."

**Agency side**
- "Which agency? County DHS, state DCFS, etc."
- "Caseworker name and email if you have it."
- "Caseworker's supervisor — name if you know it."
- "Guardian ad Litem (GAL) — name and contact?"
- "Judge?"
- "Agency or county counsel — the lawyer on the other side?"
- "Do you have appointed counsel? If yes, name and contact. If no, are you pro se by choice or because you were denied appointment?"

**Parallel proceedings**
- "Is there a parallel criminal case against you? Case number and court if yes."
- "Family court / custody / divorce case open? Case number and court."
- "Any protective order or no-contact order? Case number and court."
- "Child support docket?"
- "Have you filed or are you planning a federal civil rights case?"
- "Anything on appeal?"

**Critical dates**
- "When's your next hearing? Date, time, type of hearing, what's at stake."
- "Any pending deadlines from court orders or agency requests in the next 30 days? Date and what's due."

**Case stage**
- "Where are you in the process — initial removal, dispositional, review hearings, permanency plan filed, TPR petition filed, post-TPR appeal, or other?"
- "Have you been served with a TPR petition? When?"

## Output

Update `00-MASTER-INDEX.md` in place. Preserve every section header that exists. Fill in the **Case identity**, **Parallel proceedings**, and **Critical dates** sections. Do not touch **Folder map**, **Working principles**, or **Quick links**.

For the critical dates table, add one row per hearing/deadline the user named. Sort by date ascending.

## After

Read the result back to the user as a short summary (not the whole file). Confirm:

- Case stage understood
- Jurisdiction set (if not, prompt them to run `/setup-jurisdiction` next)
- Next hearing date captured

Append to `_session-log.md`:

```
- /intake completed; master index populated
- Jurisdiction: [if set]
- Next hearing: [date or none]
- Open parallel proceedings: [list]
```

Then suggest the next command — usually `/setup-jurisdiction` if not yet set, then `/triage`.

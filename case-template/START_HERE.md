# START HERE

This is your case directory. The numbered folders below hold everything for your case. The AI tool reads from them; you put files in them.

## If you have not used this tool before

Open your terminal in this directory and run:

```bash
claude        # or: opencode    or: codex
```

Then type:

```
/start
```

The `/start` command walks you through the rest. About 10–15 minutes. By the end you'll have:

- A filled-in `00-MASTER-INDEX.md`
- A locked jurisdiction (`_jurisdiction.md`)
- A first triage memo with concrete next actions

## If you've used it before

```bash
claude
```

Then either:

- `/next` — one specific next action based on case state
- `/triage` — refresh the priority list
- `/help` — full command index

## If a crisis is happening right now

Type `/check-in` instead of any of the above. The tool will pause legal work and help you ground.

If you are in immediate danger: call or text **988**.

## The folders

| Folder | What goes here |
|---|---|
| `01-orders/` | Every court order |
| `02-petitions-filings/` | Petitions, your filings, opposing filings |
| `03-reports/` | CPS reports, GAL reports, expert reports |
| `04-correspondence/` | Emails, letters, formal communications |
| `05-evidence/` | Originals — DO NOT modify after adding (use `scripts/add-evidence.sh` to hash) |
| `06-transcripts/` | Hearing transcripts, recording transcripts |
| `07-drafts/` | Your working drafts (motions, briefs, letters) |
| `08-research/` | Statutory research, case law, audits, triage memos |
| `09-chronology/` | Master chronology and deadline calendar |
| `10-services/` | Service-plan compliance docs (UAs, classes, evaluations) |
| `11-visits/` | Visitation logs |
| `12-financial/` | Case expenses, damages tracking |
| `13-federal/` | Federal civil rights case materials |
| `14-appellate/` | Appellate materials |
| `15-criminal/` | Parallel criminal case materials |
| `99-archive/` | Old / closed items |

## The hard rules

1. Files in `05-evidence/` are originals. Never modify them. If you need to annotate, copy to `07-drafts/` first.
2. Hash every evidence file with `scripts/add-evidence.sh`. No hash, no court-ready exhibit.
3. Verify every legal citation before filing (`/cite-check`).
4. Adversarial review every filing (`/stress-test`).
5. Back up weekly (`/preserve` or `scripts/backup-case.sh`).

That's it. Open the terminal. Type `/start`. The tool takes it from there.

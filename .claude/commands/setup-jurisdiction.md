---
description: Lock in the user's jurisdiction once. Governs statute citation, court rules, evidence rules, recording consent.
---

# Setup Jurisdiction

The jurisdiction governs:

- Statutory citation format (e.g. Wis. Stat. § 48.415 vs. Minn. Stat. § 260C.301 vs. Cal. Welf. & Inst. Code § 300)
- Court rules (filing format, page limits, service of process, electronic filing)
- Evidence rules (which version of Rule 901/902/803 applies)
- Recording consent law (one-party vs. two-party — see `recording-protocols` skill)
- Notice-of-claim / tort-claims-act deadlines for any future state-tort piece of a federal action
- Appellate procedure

Getting this wrong contaminates every later draft. Get it right once.

## Procedure

1. Ask the user: "What state is your CHIPS/dependency case in?" State or two-letter code is enough. If they have parallel cases in different states (e.g., CHIPS in Wisconsin, criminal in Minnesota), capture each.
2. Ask the county/court for the CHIPS case specifically — "Pierce County Circuit Court", "Hennepin County Juvenile", etc.
3. Confirm whether the case is in state court (default for CHIPS) or in tribal court (ICWA-applicable cases may be in tribal court — ask whether the child is enrolled or eligible for enrollment in a federally recognized tribe).
4. If ICWA may apply, flag it loud: ICWA changes the burden of proof, qualified expert witness requirements, active efforts standard, and placement preferences. Make a note in `_session-log.md` to revisit with the `federal-civil-rights` and `case-law-research` skills.

## Storage

Write a `_jurisdiction.md` file at the root of the case directory:

```markdown
# Jurisdiction

- CHIPS case: [State, County, Court, Division]
- Criminal case (if any): [State, County, Court]
- Recording consent: [one-party / two-party — cite statute]
- Notice of claim deadline: [statute and number of days]
- ICWA applicable: [yes / no / under investigation]
- Statutory citation format: [example]
- Court rules source: [URL or local citation]
```

Reference this file from `00-MASTER-INDEX.md` under the case identity block.

## After

Append to `_session-log.md`:

```
- Jurisdiction locked: [primary state/court]
- ICWA flag: [yes/no/unknown]
- Recording consent law: [one-party / two-party]
```

Suggest the next command — usually `/triage` if this is part of `/start`, or back to whatever the user was doing.

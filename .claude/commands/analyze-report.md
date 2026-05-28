---
description: Forensic adversarial read of a CPS report, social study, or GAL report
argument-hint: <path-to-report>
---

# Analyze CPS Report Adversarially

Apply Prompt 12 (CPS Report Forensic Read) from the Prompt Library to the report at: $ARGUMENTS.

For every significant factual claim in the report:
- Identify the source category (personal observation, hearsay, document reference, unsourced conclusion, opinion-as-fact)
- Flag loaded language with neutral alternatives
- Identify internal contradictions
- Identify omissions
- Extract exculpatory content
- Identify unverified claims
- Identify expert-domain claims (where the author lacks qualifications)
- Identify chronological issues

Generate 10 cross-examination questions for the report author.

Save to `07-drafts/analysis/cps-report-<basename>-<YYYYMMDD>.md`.

Log in `_session-log.md`.

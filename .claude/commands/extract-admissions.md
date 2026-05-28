---
description: Extract party-opponent admissions, contradictions, and key quotes from a meeting transcript or recording transcript
argument-hint: <path-to-transcript>
---

# Extract Admissions from Transcript

Apply Prompt 16 (Recorded Meeting Transcript Analysis) from the Prompt Library to the transcript at: $ARGUMENTS.

Extract:
1. PARTY-OPPONENT ADMISSIONS (FRE 801(d)(2)) — quoted with timestamps if available
2. CONTRADICTIONS with the written record
3. ADMISSIONS OF NON-COMPLIANCE
4. ADMISSIONS OF EVIDENCE GAPS
5. RETALIATORY STATEMENTS
6. INAPPROPRIATE CONDUCT
7. WITNESS OPPORTUNITIES (people mentioned)
8. DOCUMENT REFERENCES (for discovery)
9. POSITIVE CHARACTER EVIDENCE about the parent
10. TOP 5 KEY QUOTES for use in filings

For each item: verbatim quote, speaker, timestamp, one-sentence significance.

Save to `07-drafts/analysis/transcript-admissions-<basename>-<YYYYMMDD>.md`.

If the transcript reveals retaliation patterns or recent admissions affecting active filings, flag this prominently in the output and recommend immediate follow-up.

Log in `_session-log.md`.

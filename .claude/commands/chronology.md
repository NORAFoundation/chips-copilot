---
description: Build or update the master case chronology from events, emails, and documents
argument-hint: <optional: specific event or document to incorporate>
---

# Build Case Chronology

Apply Prompt 5 (Fact Chronology Builder) from the Prompt Library.

If `09-chronology/master-chronology.md` exists, read it first and update / extend it. Otherwise, create it.

Process:

1. Scan `04-correspondence/`, `01-orders/`, `03-reports/`, `06-transcripts/` for dated material.
2. Process any additional input provided in $ARGUMENTS.
3. Build / update the master chronology as a table:
   | Date | Time | Event | Participants | Source/Evidence | Significance |
4. Identify:
   - GAPS — periods unaccounted for
   - PATTERNS — clusters suggesting coordination, retaliation, escalation
   - INCONSISTENCIES — contradictions across sources
   - EVIDENCE GAPS — corroboration needed
   - CONSTITUTIONAL/STATUTORY DEADLINES intersecting the events
   - KEY TURNING POINTS

5. Save the chronology at `09-chronology/master-chronology.md`.
6. Save the analysis (gaps, patterns, etc.) at `09-chronology/chronology-analysis-<YYYYMMDD>.md`.
7. Log in `_session-log.md`.

The chronology is the spine of the case. Every motion, brief, and demand should reference it. Keep it accurate and updated.

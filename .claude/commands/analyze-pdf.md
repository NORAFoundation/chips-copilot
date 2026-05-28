---
description: Forensic metadata analysis of a PDF — extracts metadata, identifies fabrication indicators, produces report
argument-hint: <path-to-pdf>
---

# Analyze PDF Forensically

Target file: $ARGUMENTS

Read the skill at `.claude/skills/pdf-forensics/SKILL.md` before proceeding.

Workflow:

1. Verify the file exists and is readable.
2. Run `exiftool` on the file. If exiftool not installed, fall back to `pdfinfo` or instruct the user to install: `brew install exiftool` or `apt install libimage-exiftool-perl`.
3. Run `shasum -a 256` on the file to capture its hash.
4. Capture the full metadata output.
5. Analyze for the red flags described in the pdf-forensics skill: consumer-software producer fields (PDFSharp, Microsoft Print to PDF, Telerik Reporting), suspicious author fields, brief modification windows, missing digital signatures, LIMS absence (for toxicology), EMR absence (for medical), clerk-of-court absence (for court documents).
6. Produce a structured forensic analysis report at `07-drafts/analysis/pdf-forensic-<basename>-<YYYYMMDD>.md` with:
   - Document identity (filename, SHA-256 hash, file size, page count)
   - Full metadata as raw evidence
   - Red flag analysis with severity (CRITICAL / SUSPICIOUS / NOTABLE / NORMAL)
   - Authentication path challenge (what would need to be true for this to be admissible; what's missing)
   - Cross-examination targets based on metadata
   - Discovery items implied (calibration logs, native source data, software licenses, audit trails)
7. Append the hash to `_evidence-hashes.md`.
8. Log the action in `_session-log.md`.
9. Output a brief summary to the user including the most critical red flag (if any).

DO NOT modify the source PDF. DO NOT re-save it. Work on a copy only if pixel-level inspection is needed.

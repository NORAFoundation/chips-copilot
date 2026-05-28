---
name: pdf-forensics
description: PDF metadata extraction and forensic authentication analysis for documents used in CPS proceedings. Use when analyzing any PDF received from the agency, GAL, lab, hospital, or court — especially toxicology reports, medical records, social studies, and "official" documents.
---

# PDF Forensics

This skill enables forensic analysis of PDF documents to determine institutional authenticity. Used in CPS cases to identify documents that were not produced through legitimate institutional processes (LIMS, EMR, court clerk systems).

## Core principle

Legitimate institutional documents carry institutional fingerprints in their metadata. The absence of expected fingerprints — or the presence of consumer software fingerprints where institutional fingerprints should be — is an authentication problem the proponent must explain.

## Required tools

Install at least one:

```bash
# macOS
brew install exiftool

# Ubuntu / Debian
sudo apt install libimage-exiftool-perl

# Python alternative
pip install pikepdf
```

## Extraction commands

```bash
# Primary
exiftool path/to/document.pdf

# More detail
exiftool -a -G1 -s path/to/document.pdf

# XMP metadata
exiftool -xmp:all path/to/document.pdf

# Python with pikepdf
python3 -c "import pikepdf; pdf = pikepdf.open('path/to/document.pdf'); print(pdf.docinfo); print(pdf.Root.Metadata.read_bytes() if '/Metadata' in pdf.Root else 'no XMP')"

# Quick check with pdfinfo (Poppler)
pdfinfo path/to/document.pdf

# Hash for chain of custody (always do this)
shasum -a 256 path/to/document.pdf
```

## What you are looking for

### Fields and their meaning

- **Producer** — software that produced the PDF bytes
- **Creator** — application that generated the source content
- **Author** — listed author (often unreliable but informative)
- **Title** — document title (sometimes reveals templates)
- **CreateDate** — when the PDF was created
- **ModifyDate** — last modification time
- **Subject**, **Keywords** — may reveal classification
- **Trapped**, **PDFVersion**, **Linearized** — production tooling

### Legitimate institutional fingerprints by document type

**Toxicology reports** — should come from LIMS:
- Quest Diagnostics, LabCorp, Aegis Sciences, US Drug Test Centers, Omega Laboratories, Psychemedics, Cordant Health Solutions
- LIMS software examples: STARLIMS, LabWare, LabVantage, Confluence, Q-Pulse
- Expect: lab letterhead native render, certifying scientist signature, accreditation references (SAMHSA, CAP-FDT, ISO 17025), reference range tables, instrument and method identification
- Often accompanied by: chain of custody form (CCF), specimen ID, batch QC summary

**Hair toxicology specifically** — additional indicators:
- Washing protocol documented
- Decontamination wash test results
- Segmental analysis if length-specific
- Methodology: GC-MS or LC-MS/MS confirmation (not ELISA-only)
- Cutoff levels per SAMHSA workplace guidelines or stated alternate cutoffs

**Hospital / medical records** — should come from EMR:
- Epic, Cerner (Oracle Health), Athenahealth, eClinicalWorks, NextGen, Allscripts, Meditech
- Expect: institutional letterhead, audit trail metadata, MRN, encounter ID, signing provider with credentials and NPI

**Court records** — should come from clerk-of-court systems:
- State-specific: WCCA (Wisconsin), MCRO (Minnesota), PACER (federal), etc.
- Expect: clerk digital signature, court seal, case caption, filed-stamp with timestamp

**Police reports** — should come from records management systems (RMS):
- Examples: Niche RMS, Spillman, Caliber, LERMS

### Red-flag producers/creators (when you see these on "official" documents)

CRITICAL red flags (consumer software masquerading as institutional output):

- **PDFsharp / PDFSharp** — open-source library; common in fraudulent / non-LIMS generation
- **Microsoft Print to PDF** — Windows OS print driver; not an institutional output
- **Microsoft: Print To PDF** — same
- **Microsoft Word** producer or creator — Word documents converted to PDF (not LIMS)
- **Telerik Reporting** — generic business reporting library; not lab-specific LIMS
- **iText 5 / iText 7** without institutional configuration — generic PDF library
- **TCPDF / FPDF / DOMPDF** — open-source PHP libraries; common in cheap web tools
- **Foxit PhantomPDF** producer with no institutional creator — consumer PDF editor
- **Adobe Acrobat** producer with consumer Creator (Word, Pages) — re-rendered, not original LIMS

SUSPICIOUS red flags:

- Author field containing the name of a collection agent rather than the laboratory or certifying scientist
- Brief modification window (Create and Modify times <5 minutes apart) for a "long-form" report
- No digital signature
- No XMP metadata
- PDF/A noncompliance for documents claiming archival status
- Missing standard accreditation references
- Mismatched fonts (institutional reports use embedded institutional fonts)
- Inconsistent date formats within the document
- Embedded image-of-text where native text rendering would be expected (suggests screenshot reassembly)

### The trilemma

When metadata indicates a problem, the proponent has three choices, all bad for them:

1. AUTHENTICATE — produce the original LIMS source, custodian declaration, and chain of custody — which may confirm the metadata problem
2. REFUSE — refuse to produce authentication discovery — which is itself a discovery violation
3. ADMIT NON-AUTHENTICATION — concede the document cannot be authenticated — which collapses the foundation

Frame this in your analysis output. Do not directly accuse fabrication. Identify the institutional fingerprint absence and let the trier of fact or the trilemma do the work.

## Output format

See `agents/forensic-analyzer.md` for the structured output format.

## When NOT to declare fabrication

You don't. You identify authentication risk and missing institutional fingerprints. You preserve your credibility (and the user's) by speaking in evidentiary terms, not accusatory ones.

The metadata speaks for itself. The trilemma forces the proponent. Your job is to surface the facts.

## Limitations

- Metadata can be stripped or modified — absence of evidence is not evidence of absence
- Some legitimate institutions do use generic PDF tooling
- Modification dates can legitimately update through routine system operations
- Always corroborate with: institutional letterhead analysis, chain of custody documentation, certifying scientist verification, lab accreditation lookup

You produce analysis. The user and counsel decide what to do with it.

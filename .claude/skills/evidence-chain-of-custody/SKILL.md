---
name: evidence-chain-of-custody
description: Chain of custody auditing and preservation for documents, recordings, and physical evidence in CPS proceedings. Use when adding new evidence to the case, auditing custody on agency-produced evidence, or preparing exhibits.
---

# Evidence Chain of Custody

Chain of custody is what makes evidence usable. Break the chain and the evidence either gets excluded or weakens significantly. This applies to both the agency's evidence (where breaks help you) and your own (where breaks hurt you).

## Core principle

Chain of custody is a documented, unbroken trail of possession from creation/collection to presentation in court. Every transfer, every possessor, every storage condition documented.

## For YOUR evidence

When you add evidence to `05-evidence/`, you become its custodian. Document:

1. ORIGIN — where did this come from?
2. METHOD OF OBTAINING — request, subpoena, FOIA, observation, third-party transmission
3. DATE / TIME of acquisition
4. MEDIUM — original, photocopy, scan, screenshot, recording
5. HASH — SHA-256 of the file at intake
6. STORAGE LOCATION — your case directory subfolder
7. ANY SUBSEQUENT HANDLING — copies made, derivatives created (always work on copies)

Use `scripts/add-evidence.sh` to standardize this.

## For AGENCY-produced evidence

When the agency or another party produces evidence, audit:

1. WHO had custody at each step from origin to production
2. WHEN each transfer occurred
3. WHERE the evidence was stored between transfers
4. HOW the evidence was secured (locked? logged? signed?)
5. WHAT changes were made (if any) and by whom
6. WHO witnessed transfers
7. WHAT DOCUMENTATION exists for each step

Look for breaks:
- Periods where custody is undocumented
- Transfers without signatures or logs
- Storage in unsecured locations
- Access by personnel not in the chain
- Modifications without authorization documentation
- Inconsistent dates or times
- Personnel without proper credentials or training

## Specific evidence types

### Toxicology specimens

Required custody documentation:
- Specimen collection form (CCF — Chain of Custody Form)
- Collector identity and qualifications
- Specimen ID matching across all documents
- Tamper-evident seal documentation
- Transport documentation (FedEx tracking, courier signature)
- Lab receipt documentation
- Lab internal handling log
- Aliquot tracking
- Instrument run documentation
- Result reporting documentation

Breaks here often invalidate the test result.

### Hair samples

Additional documentation:
- Cutting location on scalp (vertex posterior typically)
- Length and segment
- Storage container
- Decontamination protocol applied
- Washing test results
- Segmental analysis if applicable

### Court documents

Custody is typically established through court clerk records — request a certified copy.

### Recordings

Required for admissibility (varies by jurisdiction):
- Identification of recorder
- Equipment used
- Date, time, location
- Continuous recording vs. edited (raw is preferred)
- Storage and transfer log
- Hash at preservation
- Compliance with consent law (one-party / two-party — see `recording-protocols` skill)

### Digital evidence (emails, texts, files)

- Native file preservation with metadata intact
- Forensic export when possible (e.g., emlx, eml, raw text export for SMS)
- Hash at preservation
- Storage in unaltered form
- Working copies separate from preservation copies

### Photographs

- Original digital file with EXIF metadata intact
- Camera/phone identification
- GPS coordinates if available
- Time/date stamp
- Witness to photo if any
- Continuous chain to court

## Authentication paths (FRE 901)

To get evidence admitted, you need an authentication path:

- 901(b)(1) — Witness with personal knowledge
- 901(b)(3) — Comparison by trier or expert
- 901(b)(4) — Distinctive characteristics
- 901(b)(7) — Public records
- 901(b)(8) — Ancient documents (20+ years)
- 901(b)(9) — Process or system (digital evidence often)
- 902 — Self-authentication (business records 902(11), public records 902(4), certified copies 902(4))

For each piece of evidence, identify the path BEFORE you need it.

## The hash-and-log workflow

Every file added to `05-evidence/`:

```bash
# Compute hash
HASH=$(shasum -a 256 path/to/evidence | awk '{print $1}')

# Log to evidence registry
echo "$(date +%Y-%m-%d) | path/to/evidence | $HASH | source: <where it came from>" >> _evidence-hashes.md
```

Verify hashes periodically. If a hash changes, the file changed — either you have a bug or you have a chain of custody issue.

## Working on copies

Never modify, annotate, or analyze the original. Always copy to `07-drafts/` first.

```bash
cp 05-evidence/original.pdf 07-drafts/working/original.copy.pdf
# Then work on the copy
```

This preserves the original for production, exhibits, and integrity checks.

## When you find a break in the agency's chain

In your evidence inventory, mark:

```
Chain of custody: PARTIAL
  Gap: From [date] when [step] was complete until [date] when [step] was performed by [person]
  Significance: Foundation challenge — Defendant cannot establish that the [evidence] is in the same condition as when collected
  Available remedy: Motion to suppress / motion in limine / weight argument at hearing
```

The strongest evidence challenges are often not "the test result is wrong" but "the test result is not properly authenticated."

## Sealing and confidentiality

CPS records contain confidential information about the child and third parties. Even with the right to access them, the user has obligations to protect:

- The child's identity in public filings (use initials)
- Third-party identifying information (other parents, witnesses, foster parents)
- Medical information (HIPAA-protected even when you have access)
- Other children's information
- School records (FERPA-protected)

Redact before filing publicly. Maintain confidentiality designations in productions.

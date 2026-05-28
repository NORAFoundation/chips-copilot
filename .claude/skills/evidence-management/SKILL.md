---
name: evidence-management
description: Complete evidence lifecycle management — cataloging, indexing, cross-referencing, redaction, exhibit numbering, battle-mapping, and privilege logging. Use when building the evidence inventory, preparing exhibits, tracking what proves what, managing redactions, or building a privilege log.
---

# Evidence Management

Evidence is the foundation. A disorganized evidence vault loses cases that should have been won. This skill encodes the disciplines of evidence inventory, exhibit preparation, redaction tracking, and battle-mapping.

## Core principle

Every piece of evidence has six attributes worth knowing: **what it is** (identity), **what it proves** (theory), **how it gets in** (authentication), **what stops it** (objections + responses), **where it lives** (custody), and **what it touches** (cross-reference to filings).

If you can answer those six questions for every exhibit, you're trial-ready.

## The Master Evidence Index

The single most valuable document in any case file. Lives at `05-evidence/MASTER-INDEX.md`. Updated every time evidence is added.

Format:

```
| ID | Date | Title | Source | Hash (short) | Format | Proves | Auth path | Anticipated objections | Filings used in | Status |
|----|------|-------|--------|--------------|--------|--------|-----------|------------------------|-----------------|--------|
| E001 | 2025-08-06 | Google Meet Recording | Self-recorded | a3f4...c2 | m4a | DHS admission no documentation exists | FRE 901(b)(5) voice ID + 901(b)(9) recording process | Recording consent in WI (one-party) → not applicable | 2025-09-14 demand letter, [planned] §1983 complaint | PRESERVED |
| E002 | 2025-04-12 | Hair toxicology report (GW) | Klanderman | f8a2...91 | PDF | Document produced via consumer software, not LIMS | FRE 901(b)(4) distinctive characteristics + metadata | Authentication challenge; admit only via foundation testimony from collector | Motion to suppress 2025-11; demand letter | DISPUTED AUTH |
```

For each evidence item:
- **ID**: stable identifier (E001, E002, ...). Never reused even if evidence is excluded or withdrawn.
- **Date**: when the evidence was created (NOT when you obtained it; track that separately).
- **Title**: descriptive, searchable.
- **Source**: where you got it (subpoena, FOIA, agency production, self-recorded, third party).
- **Hash**: first 6-8 chars of SHA-256 for at-a-glance verification.
- **Format**: PDF, m4a, mp4, eml, jpg, native xlsx, etc.
- **Proves**: ONE-LINE theory. What does this single exhibit show?
- **Auth path**: how this gets admitted (which FRE rule; who needs to testify; whether self-authenticating).
- **Anticipated objections**: what opposing counsel will say, and your one-line response.
- **Filings used in**: cross-reference; every filing that cites this exhibit.
- **Status**: PRESERVED / DISPUTED AUTH / PRODUCED / EXCLUDED / WITHDRAWN / PENDING SUBPOENA.

## Exhibit numbering systems

Different forums use different conventions. Pick one and stay consistent.

**Federal civil practice (most common):**
- Plaintiff's exhibits: P-1, P-2, ... or "Plaintiff's Exhibit A, B, C..."
- Defendant's exhibits: D-1, D-2, ...
- Joint exhibits: J-1, J-2, ...

**State trial courts (varies):**
- Some use letters (A, B, C); some use numbers (1, 2, 3).
- Some use party-prefixed: Petitioner's 1, Respondent's 1.

**Appendix to appellate brief:**
- Numbered sequentially: A1, A2, ... (Wisconsin uses Ax-xx page references)

**Hearing-specific exhibits:**
- Some courts re-number for each hearing. Maintain a translation table.

In your case file, keep one stable internal ID (E001, E002...) that survives renumbering for specific filings.

## Cross-referencing

Every filing that cites an exhibit must:

1. Reference the exhibit by its filing-specific number/letter
2. Identify which paragraph or page of the exhibit
3. Establish the foundation (or cite where foundation is established)

Track this in two directions:

**By exhibit** (in Master Index): "Filings used in: 2025-09-14 demand, 2025-11-03 motion to compel, [planned] complaint"

**By filing** (in the filing's own exhibit attachment list): "Exhibit A: Recording of 8/6/25 meeting (E001 in case file)"

## Hot documents

Within your evidence vault, identify the 5-10 documents that are absolutely central. Mark them in the Master Index with a flag column. These get:

- Priority backup
- Multiple format preservation (original + transcripts + summaries)
- Extra authentication paths developed
- Subject of motions in limine to lock in admissibility before trial

For most CPS cases, hot documents include:
- Recordings of agency personnel making admissions
- Original PDFs of contested forensic reports (with metadata)
- Court orders containing dispositive findings
- Service plan compliance documentation
- Witness statements supporting your version of events

## Redaction tracking

Many CPS-case evidence files contain confidential information:
- Child's full name, DOB, school, address
- Other children's information (yours or others)
- Third-party PII (other witnesses, foster parents)
- Medical information (HIPAA-protected)
- School records (FERPA-protected)

Workflow:
1. Keep the UNREDACTED original in `05-evidence/` (this is your work product)
2. Create REDACTED versions in `05-evidence/redacted/` for filing
3. Track redactions in a redaction log

Redaction log format (`05-evidence/_redaction-log.md`):

```
| Evidence ID | Original path | Redacted path | Redactions made | Redacted on | Verified by |
|-------------|---------------|---------------|-----------------|-------------|-------------|
| E001 | recordings/2025-08-06.m4a | redacted/E001-redacted.m4a | None — recording released as-is to court (sealed filing) | n/a | n/a |
| E015 | medical/genevieve-2024-05-records.pdf | redacted/E015-redacted.pdf | Child full name → initials; address → city only; SSN → redacted; mother's DOB → redacted | 2025-10-12 | self |
```

Redaction techniques:
- For PDFs: Use Adobe Acrobat's Redact tool, or open-source PDF Redact Tools (with verification — black-box rectangles don't actually remove text; proper redaction destroys the underlying content)
- For images: Use image editing software to paint over; never just place a black box on a layer
- For audio/video: Beep tones or silence with timecodes documented; export new file (don't edit the original)
- **CRITICAL**: After redacting, open the redacted file in a different program (text editor for PDF, etc.) and search for the redacted content. If you can find it, the redaction failed.

Always verify redacted files BEFORE filing.

## Privilege log

If you withhold any documents in response to discovery, you must produce a privilege log identifying what you withheld and why.

Format (per FRCP 26(b)(5)(A) and most state equivalents):

```
| Bates # | Date | Author | Recipients | Document type | Subject (general) | Privilege | Basis |
|---------|------|--------|------------|---------------|-------------------|-----------|-------|
| PRIV-001 | 2025-07-15 | Atty Smith | J. White | Email | Discussion of case strategy | Attorney-client | Communication with retained counsel for legal advice |
| PRIV-002 | 2025-08-01 | J. White | Atty Smith | Memo | Notes on agency conduct prepared for counsel | Work product (FRCP 26(b)(3)) | Prepared in anticipation of litigation |
```

DO NOT describe the substance — describe the type. Substance disclosure waives privilege.

DO NOT log items that aren't actually privileged just to withhold them. That's discovery abuse.

For each privilege claim, know the elements:

**Attorney-client privilege:**
- Communication
- Between client and counsel (or counsel's agent)
- Made in confidence
- For purpose of obtaining or providing legal advice
- Not waived

**Work product:**
- Documents and tangible things
- Prepared in anticipation of litigation
- By or for a party (or party's representative)
- Can be overcome by showing of substantial need + inability to obtain equivalent

**Other:**
- Fifth Amendment (testimony, not documents generally)
- Spousal communications
- Therapist-patient (varies by state)
- Clergy
- Trade secret

If you're not sure something is privileged, log it as privileged and let opposing counsel motion to compel. Better to over-protect than to waive.

## The battle map

A single document that lays out the case from an evidence perspective. Lives at `08-research/battle-map-<YYYYMMDD>.md`. Updated as evidence and strategy evolve.

Structure:

```
# CASE BATTLE MAP

## Theory of the Case
[One paragraph: what happened, who did what, why it's actionable.]

## What I must prove (Plaintiff/Respondent perspective, by element)

### Claim/Defense 1: [name]
Elements:
1. [Element 1]
   - Best evidence: E003, E007
   - Supporting witnesses: [names + topics]
   - Burden: preponderance / clear and convincing
2. [Element 2]
   - ...

## What they must prove (or disprove)

### Their claim: [name]
Elements:
1. [Element 1]
   - Their best evidence (anticipated): [...]
   - My rebuttal: E001, E015, [witness X]

## Anticipated opposition arguments

1. "[Their argument]" → My response: [response]
   - Supporting evidence: [exhibits]
2. ...

## Foundational issues

- E002 toxicology authentication: contested. Path A (lab custodian declaration) — likely unavailable. Path B (collector testimony) — adversarial. Path C (motion to exclude for failure of foundation) — strong.

## Discovery priorities (what's missing)

- Custodian records from [lab]
- Training records for [caseworker]
- Internal communications about case
- ...

## Witness list (in order I'd call them)

1. Plaintiff (self) — facts of agency conduct, foundation for self-recorded items
2. [Witness X] — corroborates [event]
3. ...

## Cross-examination targets

- [Caseworker] — admissions in E001; contradictions across reports; training gaps
- [GAL] — contact log absence; communication failures
- [Collector] — qualifications, equipment, process, prior testimony
```

The battle map is a living document. Update it after every hearing, every deposition, every new piece of evidence.

## Search and retrieval

Use `ripgrep` (`rg`) for fast searching across the case file:

```bash
# Find every mention of a specific name across all files
rg -i "caseworker name" 04-correspondence/ 03-reports/ 06-transcripts/

# Find every reference to an exhibit
rg "E001" 07-drafts/

# Find every mention of a date range
rg "2025-(08|09)" 04-correspondence/

# Find every TODO or note to self
rg "TODO|FIXME|NOTE" 07-drafts/

# Search PDFs (requires pdfgrep installed)
pdfgrep -i "search term" 01-orders/*.pdf
```

Maintain naming conventions that make search work:
- Dates: YYYY-MM-DD prefix on every file in date-sortable folders
- People: consistent spelling (use Master Index of names if there's any ambiguity)
- Subjects: consistent terminology (don't switch between "toxicology" and "drug test")

## Native format preservation

Some evidence loses value when converted. Preserve native formats:

| Original format | Why preserve native |
|-----------------|---------------------|
| Email (.eml) | Headers contain routing metadata; signatures may be cryptographic |
| Audio (.m4a, .wav) | Compression changes alter spectrogram analysis |
| Video (.mov, .mp4) | Frame timing, embedded metadata |
| Photo (.heic, .jpg from phone) | EXIF data including GPS, time, device |
| Spreadsheet (.xlsx) | Formulas, hidden sheets, comments |
| Word doc (.docx) | Track changes, comments, embedded fonts |
| Database files (.db, .sqlite) | Full record set |

Convert for filing as needed; keep originals untouched.

## Authentication checklist for each exhibit

For every exhibit, before filing, confirm:

- [ ] What is this? (one sentence)
- [ ] Who created it? (witness availability)
- [ ] Who has had it? (chain of custody)
- [ ] How will it be authenticated? (FRE 901 or 902 rule)
- [ ] Is there a hearsay issue? (yes / no; if yes, exception)
- [ ] Is there a relevance issue? (FRE 401/403)
- [ ] Is there a best evidence issue? (FRE 1002)
- [ ] Is there a privilege issue? (yes / no)
- [ ] Are redactions complete and verified?
- [ ] Is the SHA-256 hash on file?
- [ ] Is the chain of custody documented?
- [ ] Is the witness list aligned?
- [ ] Is the foundation question outline drafted?
- [ ] Has the exhibit been marked / numbered for this filing?

## When evidence is challenged

If opposing counsel objects to your exhibit:

1. Note the specific objection
2. Identify the FRE basis they're invoking
3. Respond with the path you pre-prepared
4. If excluded, log the ruling and consider:
   - Different authentication path
   - Offer of proof to preserve appellate record
   - Motion for reconsideration

If you object to their exhibit:

1. Identify the specific defect (foundation, hearsay, relevance, authentication, best evidence)
2. State the objection on the record clearly
3. Cite the rule
4. Be prepared with case law on the issue
5. If overruled, request a continuing objection to preserve for appeal

## Maintenance schedule

- **Weekly**: Update Master Index with new evidence; run hash verification
- **Monthly**: Update Battle Map; review hot documents list
- **Before each hearing**: Authentication checklist for every exhibit to be used
- **Before each filing**: Cross-reference check (every exhibit cited is in the index)
- **After each discovery production**: Update Master Index; flag for analysis

## Output

When running evidence management workflows, save:
- Master Index updates → `05-evidence/MASTER-INDEX.md`
- Redaction log → `05-evidence/_redaction-log.md`
- Privilege log → `07-drafts/discovery/privilege-log-<YYYYMMDD>.md`
- Battle Map → `08-research/battle-map-<YYYYMMDD>.md`
- Authentication checklists → `07-drafts/exhibits/authentication-<exhibit-id>.md`

## The principle

The agency has an institutional memory but a fragmented file. You have one case but you live in it. Your evidence management — disciplined, indexed, cross-referenced — is one of the few asymmetric advantages a pro se party has. Use it.

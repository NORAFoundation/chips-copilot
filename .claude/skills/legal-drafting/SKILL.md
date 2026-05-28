---
name: legal-drafting
description: General legal drafting principles, structural patterns (CRAC/IRAC, narrative facts), and templates for declarations, affidavits, statements of facts, records requests, witness outlines, and other non-motion drafting. Use for any legal document that isn't a motion or brief — the motion-drafter and brief-drafter subagents handle those.
---

# Legal Drafting

Motion-drafter handles motions. Brief-drafter handles briefs and complaints. This skill handles everything else: declarations, affidavits, records requests, witness outlines, cross-examination preparations, settlement letters, statements of facts, narrative complaints, and the dozens of supporting documents a real case requires.

## Core principles (apply to all legal drafting)

### 1. Plain language beats elaborate language

"The agency failed to provide notice" beats "Said agency negligently and recklessly omitted to furnish proper and timely notification."

Judges read thousands of pages. The clearest brief wins.

### 2. Specific beats general

"On August 6, 2025, at approximately 2:30 PM CDT, Caseworker Megan Johnson stated, 'We don't have any further documentation.'" beats "The agency made admissions in summer 2025."

Specificity is credibility.

### 3. Verb-driven beats noun-driven

"The agency fabricated the report" beats "There was a fabrication of the report by the agency."

Active voice. Concrete actors. Direct verbs.

### 4. Lead with strength

Every section, every paragraph, every sentence — strongest material first. The reader may not finish.

### 5. Cite what you have; don't pad with what you don't

Better one solid cite than three weak ones. Better no cite than a hallucinated one.

### 6. Number for citability

Numbered paragraphs let opposing counsel, the court, and your own future filings refer to specific facts. Always number.

### 7. Tell the truth — exactly

If a fact is unfavorable, acknowledge it directly and explain why it doesn't matter. Hiding facts that opposing counsel will find destroys credibility on everything else.

## Structural patterns

### CRAC (preferred over IRAC for litigation)

**C**onclusion — state your conclusion first
**R**ule — state the legal rule that controls
**A**pplication — apply the rule to the facts
**C**onclusion — restate the conclusion

Used for: Argument sections of motions and briefs, legal memos, response to opposing arguments.

Example:
> The toxicology report should be excluded under FRE 901. **[C]** Under FRE 901(a), the proponent must produce evidence sufficient to support a finding that the item is what the proponent claims it is. *Devereaux v. Abbey*, 263 F.3d 1070, 1075 (9th Cir. 2001). **[R]** Here, the proponent has produced no foundation witness, no chain of custody documentation, and the document's own metadata identifies the producer as PDFSharp — a consumer software package, not a Laboratory Information Management System. **[A]** Without foundation, the report cannot satisfy Rule 901(a) and must be excluded. **[C]**

### Narrative pattern (for facts sections)

Tell the story chronologically, with a thread. The reader should feel the story unfold.

Pattern:
1. Set the scene (who, where, when)
2. Introduce the conflict (what went wrong)
3. Develop the conflict (what escalated)
4. Climax (the central wrong)
5. Resolution sought (what relief)

Don't write: "1. Plaintiff is parent. 2. Defendant is agency. 3. Defendant did wrong things. 4. Plaintiff was harmed."

Write: "Plaintiff James White is the father of Genevieve, born February 1, 2024. On April 12, 2025, after a routine inquiry, agency staff seized Genevieve from her father's care based on a single document purporting to be a toxicology report. As described below, that document was not produced through any legitimate laboratory process..."

### Element-by-element pattern (for pleading claims)

For each cause of action:
1. Identify the elements
2. Allege facts supporting each element
3. Tie facts to elements explicitly

The court must be able to read your complaint and check off each element.

## Specific document types

### Declaration (28 USC §1746 / state equivalent)

A declaration is a sworn statement under penalty of perjury, usable in lieu of a notarized affidavit in federal court and many states.

Template:

```
                  DECLARATION OF [NAME]

I, [Full Name], declare under penalty of perjury under the laws of the United States of America (28 U.S.C. § 1746) that the following is true and correct:

1. I am over the age of 18, competent to testify, and have personal knowledge of the facts set forth herein.

2. [Identify yourself and your role in the matter.]

3. [Numbered factual statements, one fact per paragraph, in chronological or logical order.]

4. ...

[OPTIONAL] N. Attached hereto as Exhibit A is a true and correct copy of [document]. I obtained this document from [source] on [date].

I declare under penalty of perjury under the laws of the United States of America that the foregoing is true and correct.

Executed on [date] at [city, state].

                                    _________________________________
                                    [SIGNATURE]
                                    [PRINTED NAME]
```

Rules:
- Only state facts within your personal knowledge
- Do not include legal argument
- Do not include conclusions of law
- Use specific dates, times, locations
- Identify documents you attach
- Sign under penalty of perjury (the magic words: "I declare under penalty of perjury under the laws of the United States of America that the foregoing is true and correct.")

### Affidavit

An affidavit is sworn before a notary. Many states still require this rather than a declaration.

Differences from declaration:
- Notary jurat block
- "Sworn before me" language
- Signed in presence of notary
- Notary stamp/seal

Template:

```
STATE OF [STATE]      )
                      ) ss.
COUNTY OF [COUNTY]    )

                  AFFIDAVIT OF [NAME]

I, [Full Name], being first duly sworn, depose and state:

1. I am over the age of 18 and competent to testify to the matters herein.

2. [Numbered factual statements.]

3. ...

Further affiant sayeth not.

                                    _________________________________
                                    [SIGNATURE]
                                    [PRINTED NAME]

Subscribed and sworn to before me this _____ day of _________, 20___.

                                    _________________________________
                                    Notary Public
                                    My commission expires: __________
                                    [NOTARY SEAL]
```

### Records request (FOIA / state open records / agency records)

Different statutes, similar structure.

Template:

```
[DATE]

Records Custodian
[Agency Name]
[Address]

Sent via [certified mail / email to records@agency.gov]

RE: Public Records Request

Dear Records Custodian:

Pursuant to [STATE'S OPEN RECORDS ACT, citation, e.g., Wis. Stat. § 19.31-19.39 / Minn. Stat. ch. 13 / 5 U.S.C. § 552 for federal FOIA], I request copies of the following records:

1. [Specific category 1, with date range]
2. [Specific category 2, with date range]
3. ...

For each request, the records sought include:
- Written documents
- Electronic communications including email
- Audio or video recordings
- Photographs
- Logs, schedules, and notes

If any portion is withheld under a claimed exemption, please:
(a) Produce all non-exempt portions, redacting as narrowly as necessary
(b) Provide a written explanation of each exemption claimed with the statutory basis
(c) Identify the number of pages or items withheld
(d) Identify the custodian responsible for the determination

Format: Electronic copies via [email / portable media] are preferred. If hard copies are necessary, please advise of any copying fees in advance. If total fees are expected to exceed $[reasonable amount], please contact me before producing.

I request that any fees be waived or reduced as this request is in the public interest [if applicable].

If you anticipate any delay beyond the statutory response window, please notify me in writing of the cause and expected production date.

Please confirm receipt of this request.

Sincerely,

[NAME]
[ADDRESS]
[PHONE]
[EMAIL]
```

Specific request categories useful in CPS cases:
- All policies, procedures, manuals, and training materials governing [specific conduct]
- All contracts and agreements between [agency] and [third party, e.g., drug testing lab] for the period [date]–[date]
- All communications between [named officials] regarding [case number or named child]
- All complaints, grievances, and disciplinary actions involving [named official] for the period [date]–[date]
- All financial records reflecting Title IV-E payments associated with [case number]

### Witness outline

Pre-trial preparation for each witness you may call OR cross-examine.

Template (for your direct examination of your own witness):

```
WITNESS OUTLINE — [WITNESS NAME]
Direct Examination
Date prepared: [YYYYMMDD]

PURPOSE FOR CALLING THIS WITNESS
(One sentence: what does this witness establish?)

QUALIFICATION
(How witness has personal knowledge of the matters.)
- "Tell us about your relationship to ..."
- "How long have you known ..."

KEY POINTS TO ELICIT
1. [Fact / topic 1]
   - Question: "Did you observe ..."
   - Expected answer: [...]
   - Anchor: [exhibit ID or prior statement]

2. [Fact / topic 2]
   - Question: ...

EXHIBITS TO INTRODUCE THROUGH THIS WITNESS
- E003 — [doc title] — foundation: witness was sender / recipient / custodian

ANTICIPATED CROSS BY OPPOSING COUNSEL
- [Topic / vulnerability 1]
- [Topic / vulnerability 2]

REDIRECT TOPICS IF NEEDED
- ...

DO NOT
- Ask open-ended questions outside the topic
- Lead this witness (FRE 611(c))
- Refer to inadmissible matters
```

Template (for cross-examination of an opposing witness):

```
CROSS-EXAMINATION OUTLINE — [WITNESS NAME]
Date prepared: [YYYYMMDD]

GOAL
(One sentence: what do I need this witness to admit, OR what do I need to undermine?)

LOCKDOWN AREAS (commitments to extract)
1. "Isn't it true that you have never personally observed ..."
2. "And you have no documentation of ..."
3. "Your training in [topic] consists of ..."

IMPEACHMENT MATERIALS
- Prior inconsistent statements:
  - Statement: "..." dated [date], page [pg], line [line]
- Bias:
  - Employment relationship
  - Financial incentive
- Lack of foundation for opinion testimony
- Hearsay reliance

DOCUMENT-BASED IMPEACHMENT
- E007: witness will be asked to authenticate; if witness denies, prepare extrinsic proof

ORDER OF TOPICS (most important first)
1. [Topic A]
2. [Topic B]
3. [Topic C]

LEADING QUESTIONS ONLY
- "Isn't it true that ..."
- "You'd agree that ..."
- "On [date] you stated ..."

DO NOT
- Ask "why" questions (gives witness room to explain)
- Argue with the witness
- Repeat questions answered
- Stay on a topic after you've gotten what you need

EXIT
- Last question: short, devastating, unanswerable in a damaging way
- Sit down
```

### Settlement letter

For pre-mediation or pre-settlement-conference communication.

Template:

```
[DATE]

[Opposing counsel name]
[Firm]
[Address]

VIA EMAIL AND CERTIFIED MAIL

RE: [Case caption] / [Case number]
    Settlement Communication — FRE 408 Protected

Dear [Counsel]:

This letter is sent for purposes of compromise and settlement discussions pursuant to Federal Rule of Evidence 408 (and any applicable state equivalent). The statements and offers contained herein are inadmissible to prove or disprove the validity or amount of any claim and may not be used for any purpose except in negotiations for settlement of this matter.

[Plaintiff/Respondent] writes to propose resolution of the above-referenced matter on the following terms:

1. [Term 1: e.g., return of child to plaintiff's custody on or before X date]
2. [Term 2: e.g., dismissal of CHIPS proceeding with prejudice]
3. [Term 3: e.g., monetary compensation in the amount of $X]
4. [Term 4: e.g., mutual confidentiality]
5. [Term 5: e.g., neutral reference language]

This offer is open through [DATE]. If not accepted by that date, this offer is withdrawn and [Plaintiff/Respondent] reserves all rights.

[Plaintiff/Respondent] is willing to engage in mediation or a settlement conference to facilitate resolution. Please advise of your availability.

Nothing in this letter waives any right, claim, or position, all of which are expressly preserved.

Sincerely,

[NAME]
[Counsel for Plaintiff/Respondent OR Pro Se]
```

### Statement of facts (for a brief or motion)

Different from a declaration — this is the version that appears IN a filing, not as a sworn standalone document.

Pattern:

```
STATEMENT OF FACTS

1. [Background: who, what, when, where — anchored to record]

2. [First key event with date and citation to evidence]

3. [Development — each numbered paragraph is one fact with citation]

4. ...

N. [Most recent / culminating event leading to relief sought]
```

Rules:
- One fact per paragraph
- Date for every event
- Citation to record at end of every factual assertion (e.g., "(Exh. A; Compl. ¶ 12)")
- No legal argument in this section
- No adjectives that opposing counsel can challenge as conclusory
- Tell the story without rhetoric

### Letter to court (for pro se litigants)

When a formal motion isn't appropriate but you need to communicate with the court (e.g., to flag a deadline conflict, request rescheduling, notice withdrawal of counsel).

Template:

```
[DATE]

The Honorable [JUDGE NAME]
[COURT]
[ADDRESS]

VIA HAND DELIVERY / E-FILING
Copy to: [opposing counsel] via [method]

RE: [Case caption]
    [Case number]
    [Subject — one line]

Dear Judge [LAST NAME]:

I am the [petitioner/respondent], pro se, in the above-referenced matter. I write to [bring to the Court's attention / request / inform the Court of] the following:

[Substance — brief, neutral, factual]

[If requesting action] I respectfully request that the Court [specific request].

I have served a copy of this letter on [opposing counsel] by [method].

Respectfully,

[NAME]
Pro Se
[ADDRESS]
[PHONE]
[EMAIL]
```

## Drafting workflow

For every legal document:

1. **Identify the document type** — declaration, affidavit, motion, letter, etc.
2. **Identify the recipient** — court, opposing counsel, agency, third party, witness
3. **Identify the purpose** — relief sought, fact established, position preserved
4. **Pull facts** from chronology and evidence (don't make the user re-state them)
5. **Apply the appropriate template** from this skill or another
6. **Draft** in plain language with specificity
7. **Verify** any legal citations (citation-verifier subagent if applicable)
8. **Stress-test** if high-stakes (adversarial-reviewer subagent)
9. **Format** per jurisdiction (court-filing-format skill)
10. **Save** to the appropriate `07-drafts/` subfolder
11. **Log** in `_session-log.md`

## Common drafting mistakes to avoid

- Legal jargon without need ("instant matter," "said agency," "the same")
- Adverbs ("clearly," "obviously," "blatantly")
- Conclusory characterizations without facts ("Defendant willfully and maliciously...")
- Hyperbole ("Defendant's conduct shocks the conscience" — only if you can support it)
- Personal attacks
- Disclosures that aren't strategically valuable
- Repetition (say it once, say it well)
- Burying the lede
- Hallucinated citations
- Unsupported factual claims
- Failing to address obvious counterarguments

## Length discipline

For court filings:
- If a local rule sets a page limit, use it as a ceiling, not a goal
- Shorter is harder to write and more effective to read
- Cut every sentence that doesn't move the argument
- If you find yourself padding, you don't have enough material

For correspondence:
- Email: 3-4 paragraphs maximum
- Letter: 1-2 pages
- Demand letter: 4-7 pages (facts section longer; argument section minimal — see pre-litigation-demand skill)

## The principle

Legal writing is technical writing. It has rules. The rules exist because they work. Master the basic patterns and the work gets faster; everything you draft sounds like it was written by someone who knows what they're doing — because it was.

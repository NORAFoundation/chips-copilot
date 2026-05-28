---
name: case-law-research
description: Free-tool case law and statutory research workflow — finding controlling and persuasive authority, building string cites, identifying circuit splits, tracking down secondary sources, and avoiding hallucinated citations. Use when researching legal questions, before drafting any argument with citations, or when verifying authority found elsewhere.
---

# Case Law Research

The agency has Westlaw and Lexis. You have free tools and discipline. This skill describes how to do effective legal research without paid databases — and without hallucinated citations.

## CRITICAL: Hallucination defense

LLMs sometimes confidently produce citations that don't exist. This is a career-ending mistake for attorneys and a credibility-destroying one for pro se litigants.

**NON-NEGOTIABLE RULES:**

1. **Every citation must be verified at the authoritative source.** "Verified" means: you opened the case (not a summary), confirmed the name, court, year, reporter, and that the cited proposition is actually in the opinion.

2. **The case-law-researcher subagent NEVER outputs an unverified citation.** Outputs include the verification source URL.

3. **If verification fails, the citation is removed.** Not "let me try another search." Removed. Find a different case.

4. **Pin-cites must be verified.** Citing "Smith v. Jones, 100 F.3d 100, 105 (3d Cir. 2010)" means page 105 contains the proposition. If page 105 doesn't, the cite is wrong.

5. **Quotes must be exact.** A quote attributed to a case must appear in that case in that form. Paraphrases must be marked as such.

## Free research tools (use in this order)

### CourtListener (courtlistener.com)

**Best for**: Federal cases (all levels), state appellate cases (most states), recent opinions.

Features:
- Full-text search
- Citation lookup
- Citation network ("How often cited," "What cites this")
- Free RECAP archive of PACER documents
- API access via MCP

Search strategy:
1. Search by case name first (party name)
2. Search by reporter cite if you have it
3. Search by proposition (full-text search for distinctive language)
4. Filter by court and date range

URLs follow pattern: `courtlistener.com/opinion/[id]/[slug]/`

### Google Scholar (scholar.google.com)

**Best for**: Cases (federal and state), citing references, finding cases discussing a specific topic.

Features:
- "Case law" filter — federal courts, state courts, or specific jurisdiction
- "How cited" — shows you how courts have used the case (positive, distinguished, criticized)
- Year filters
- "Cited by" — find later cases applying the cited case
- Snippets often show exactly where the cited proposition appears

Search strategy:
1. Search the legal question in quotes: `"qualified immunity" "child welfare"`
2. Filter by jurisdiction
3. Use the "How cited" link to find more cases on the same topic
4. Use "Cited by" to find current applications

### Justia (justia.com)

**Best for**: State statutes, state cases, US Supreme Court cases, well-organized topical browsing.

Features:
- US Supreme Court — full opinions with annotation
- Federal Circuit opinions
- State case law (varies by state)
- Free state code browsing

### Cornell Legal Information Institute (law.cornell.edu)

**Best for**: US Code, Code of Federal Regulations, Federal Rules (FRCP, FRE, FRAP, FRCrP), US Supreme Court, secondary materials.

Features:
- USC by title — always current
- CFR by title
- Federal Rules with annotations
- Wex legal encyclopedia (secondary source)

### State court websites

Every state has an official case search system. Quality varies dramatically.

For Wisconsin specifically:
- Wisconsin Supreme Court and Court of Appeals: wicourts.gov
- Wisconsin Statutes: docs.legis.wisconsin.gov/statutes
- WSCA: Wisconsin Supreme Court archive

For Minnesota:
- Minnesota Judicial Branch: mncourts.gov
- Minnesota Statutes: revisor.mn.gov/statutes
- MN Court of Appeals opinions: mncourts.gov

For your jurisdiction, identify these resources early.

### Other valuable free resources

- **Caselaw Access Project (case.law)** — Harvard Law Library digitization of state and federal cases through 2018; useful for historical research
- **Free Law Project (free.law)** — parent organization of CourtListener
- **PACER** — federal court records; paid but RECAP archive on CourtListener is free
- **Federal Judicial Center** — research and education materials
- **State bar associations** — many publish free practice manuals
- **Law school clinic publications** — often free legal research aids

## Research workflow

### Step 1: Define the question precisely

A precise question gets precise answers. A vague question wastes research time.

Bad: "Can I sue them?"
Better: "Can a parent state a §1983 procedural due process claim against a county CPS agency for using fabricated evidence to support a CHIPS petition, in the Seventh Circuit?"

Elements of a good question:
- Specific cause of action
- Specific factual posture
- Specific jurisdiction
- Specific procedural moment (motion to dismiss, summary judgment, trial)

### Step 2: Identify the controlling authority hierarchy

Start with mandatory authority for your forum, work outward.

**For federal court:**
1. US Supreme Court
2. Your circuit (binding)
3. Other circuits (persuasive)
4. Your district court (highly persuasive within same district)
5. Other district courts (persuasive)

**For state trial court:**
1. State supreme court (binding)
2. Your state's court of appeals (binding)
3. Other state appellate (persuasive within state)
4. Other states (persuasive only)
5. Federal courts on state law (sometimes persuasive)
6. Federal courts on federal law (binding if federal question)

### Step 3: Find the starting point

For any new question, find ONE good source and chain forward:
- A recent appellate opinion in your jurisdiction on the topic
- A treatise or restatement section
- A law review article surveying the topic
- A practice guide chapter

Use that source's citations as your starting list. Then expand:
- Cases cited by your starting point
- Cases that cited your starting point (forward chaining)
- Cases on the same topic by the same court
- Cases on the same topic by sister courts

### Step 4: Read the cases — actually read them

Reading the headnote or summary is not enough.

- Read the procedural posture (motion to dismiss vs. summary judgment vs. appeal from final judgment — standard of review and what's at stake differ)
- Read the facts — find the case with the closest factual analog to yours
- Read the holding — what the court actually decided
- Read the rule — the principle the court applied
- Read the dicta — discussion not necessary to the holding; persuasive only
- Read concurrences and dissents — flag if the law is unsettled

A case that "supports" your position based on a headnote may not support it on the facts when you read it.

### Step 5: Verify current status

A case good when written may have been overruled, distinguished, abrogated, or qualified.

Free Shepardizing / KeyCite alternatives:
- **CourtListener citation depth** — shows citing cases; flag if "abrogated" or "overruled" appears
- **Google Scholar "How cited"** — shows positive vs. negative treatment by later courts; specifically flags red squares for "negative treatment"
- **Search Westlaw/Lexis via your state bar's free attorney portal** if you have any law school or bar access

If a case has been negatively treated, you may still cite it for a proposition the negative treatment didn't address — but you must disclose the treatment.

### Step 6: Build the string

Once you have the right cases, organize them as a string cite:

- Mandatory authority first
- Most recent first within each tier (usually)
- Most factually similar first within recent
- Parenthetical signal indicates strength:
  - No signal: case directly supports the proposition
  - "See" — case implicitly supports
  - "See also" — additional support
  - "Cf." — analogous but different
  - "But see" — contrary authority
  - "Accord" — agreeing with cited case

Example:

> Social workers who deliberately misrepresent facts in child welfare proceedings violate clearly established due process rights. *Devereaux v. Abbey*, 263 F.3d 1070, 1075 (9th Cir. 2001) (en banc); *see also Cook v. City of Buena Park*, 1996 WL [...] (9th Cir.); *cf. Manuel v. City of Joliet*, 580 U.S. 357 (2017) (analogous fabrication doctrine in pretrial detention context).

## Building authority for specific arguments

### Procedural due process (in CPS cases)

Foundation cases (verify before citing):
- *Stanley v. Illinois*, 405 U.S. 645 (1972)
- *Santosky v. Kramer*, 455 U.S. 745 (1982)
- *Troxel v. Granville*, 530 U.S. 57 (2000)
- *Mathews v. Eldridge*, 424 U.S. 319 (1976) (balancing test)

Look for: Circuit-level applications to dependency proceedings; recent reaffirmations.

### Evidence fabrication

Foundation cases:
- *Devereaux v. Abbey*, 263 F.3d 1070 (9th Cir. 2001) (en banc)
- *Pierce v. Gilchrist*, 359 F.3d 1279 (10th Cir. 2004)
- *Wilson v. Russo*, 212 F.3d 781 (3d Cir. 2000)

Look for: Cases in your circuit applying these principles to forensic / scientific evidence.

### First Amendment retaliation

- *Mt. Healthy City School Dist. Bd. of Ed. v. Doyle*, 429 U.S. 274 (1977)
- *Hartman v. Moore*, 547 U.S. 250 (2006)
- *Nieves v. Bartlett*, 139 S. Ct. 1715 (2019)

### Fourth Amendment in CPS context

- *Tenenbaum v. Williams*, 193 F.3d 581 (2d Cir. 1999)
- *Wallis v. Spencer*, 202 F.3d 1126 (9th Cir. 2000)
- *Croft v. Westmoreland County Children & Youth Servs.*, 103 F.3d 1123 (3d Cir. 1997)

### Monell liability

- *Monell v. Dept. of Social Services*, 436 U.S. 658 (1978)
- *City of Canton v. Harris*, 489 U.S. 378 (1989)
- *Connick v. Thompson*, 563 U.S. 51 (2011)

### Abstention (defending against)

- *Younger v. Harris*, 401 U.S. 37 (1971)
- *Sprint Communications, Inc. v. Jacobs*, 571 U.S. 69 (2013) (narrowing Younger)
- *Exxon Mobil Corp. v. Saudi Basic Industries Corp.*, 544 U.S. 280 (2005) (narrowing Rooker-Feldman)
- *Heck v. Humphrey*, 512 U.S. 477 (1994)

### Qualified immunity (defeating)

- *Hope v. Pelzer*, 536 U.S. 730 (2002) (obvious-violation exception)
- *Saucier v. Katz*, 533 U.S. 194 (2001)
- *Pearson v. Callahan*, 555 U.S. 223 (2009)

Look for: Cases in your circuit specifically denying QI in CPS contexts; "robust consensus" cases.

These are starting points. Always verify, always update for current status, always check for your circuit's specific applications.

## Secondary sources (free)

- **Cornell LII Wex** — legal encyclopedia
- **Justia practice areas** — overview articles
- **Federal Practice and Procedure (Wright & Miller)** — at any law library; many sections excerpted online
- **Restatements** — at law libraries
- **Law review articles** — Google Scholar finds free versions; SSRN has author preprints
- **State bar publications** — many publish free practice manuals
- **Federal Judicial Center** — judicial education materials publicly available
- **ACLU and similar advocacy organization legal manuals** — for civil rights specifically

## Research log discipline

Maintain `08-research/research-log-<topic>.md`:

```
# Research Log: [Topic]

Date started: [YYYY-MM-DD]

## Question
[Specific question being researched]

## Hierarchy
1. Mandatory in [jurisdiction]: [...]
2. Persuasive: [...]

## Cases found and verified

### [Case 1 name]
- Citation (verified): [...]
- Source URL: [...]
- Verification date: [YYYY-MM-DD]
- Holding: [...]
- Why useful: [...]
- Pin-cite for [proposition]: page [...]
- Treatment: [positive / mixed / negative]

### [Case 2 name]
...

## Statutes found and verified

### [Statute citation]
- Source URL: [...]
- Effective date: [...]
- Current as of: [...]
- Operative text: "[...]"
- Notes: [...]

## Outstanding research questions
- [...]

## Authority NOT to use
- [Case] — cited by ChatGPT but NOT FOUND in CourtListener / Google Scholar / Justia; presumed hallucinated
- [Case] — found but distinguished by [later case]; weak
```

This log:
- Documents what you found and where
- Lets you reuse research across filings
- Lets you verify every cite before refiling
- Creates a record if a question arises about your work

## When you find no good authority

Sometimes the case you want doesn't exist. Options:

1. **Argue from principle** — cite foundational cases for the principle, then argue that the same principle applies here
2. **Argue from analogy** — cite cases in related areas and analogize
3. **Argue against precedent** — distinguish unfavorable cases on facts
4. **Acknowledge novelty** — if it's a novel issue, say so; novelty isn't disqualifying but pretending precedent exists is fatal
5. **Find a treatise or law review** — secondary sources can support a proposition where case law is sparse

What you do NOT do: invent the citation.

## When LLMs lie

If you (the agent) think you remember a case but cannot verify it through the tools above, the most likely explanation is hallucination. Common patterns:
- Plausible-sounding case names with fabricated reporter cites
- Real cases attributed to wrong court or wrong year
- Real cases with fabricated quotes
- Combination of real party names from different cases

Resolution: If you cannot independently verify via authoritative source, do not use the citation. Period.

## The principle

The agency has paid databases and institutional research support. You have free tools, time, and discipline. The asymmetry can favor you: a pro se litigant who has actually read every cited case often outperforms an attorney with paralegals who didn't. Read the cases. Verify the citations. Build the record honestly.

The credibility you build by never citing anything you can't back up is the most valuable thing in the courtroom.

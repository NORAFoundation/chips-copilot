---
name: citation-verification
description: Procedures for verifying legal citations against authoritative sources to prevent hallucinated case law from entering filings. Use before any draft containing citations is finalized.
---

# Citation Verification

Hallucinated legal citations have ended careers. They have caused sanctions against attorneys. They are catastrophic for pro se credibility. This skill prevents them.

## The threat

LLMs sometimes generate plausible-looking but nonexistent legal citations. The citation may:
- Use a real case name with wrong reporter cite
- Use a real case but invent the proposition
- Combine party names from different cases
- Invent a case entirely
- Quote language that doesn't exist
- Cite an overruled or distinguished case as good law

ANY draft going to court must have every citation verified.

## Free verification sources

### Primary (case law)

- **CourtListener.com** — Free federal and state case law; search by citation, party, full-text
- **Google Scholar** — scholar.google.com — Free legal documents search; case law tab
- **Justia** — justia.com — Free statutes and cases; well-organized
- **Cornell Legal Information Institute** — law.cornell.edu — Federal materials, USC, CFR, Supreme Court

### Secondary (when primary unavailable)

- **State court websites** — Every state has an official case search system (varying quality)
- **Federal court PACER** — Paid, but RECAP archive on CourtListener is free
- **Findlaw** — findlaw.com — Has free case law (some advertising)

### For statutes

- State's official legislative website (always check)
- Cornell LII for federal
- Justia for state and federal
- Legal Information Institute mirror sites

## Verification procedure for each citation

1. **Parse the citation**
   - Case name (or statute number)
   - Reporter volume, page
   - Court (parenthetical)
   - Year

2. **Search the primary source**
   - Search by case name first
   - If multiple results, confirm with reporter cite
   - If no results, search by parties separately
   - If still no results, mark as likely hallucinated

3. **Verify each element**
   - Case name spelling and party order
   - Volume and page numbers
   - Court (Cir., S.D.N.Y., etc.)
   - Year
   - If pin-cite provided, verify the cited page contains the cited proposition

4. **Check current status**
   - Look for "overruled," "abrogated," "vacated," "distinguished" notations
   - Check subsequent citing references (CourtListener "citation depth")
   - Google Scholar shows citing cases

5. **Verify quoted language**
   - If the draft contains a direct quote attributed to the case, find the exact quote in the case
   - Look for partial quotes that distort meaning
   - Verify the quote is from the case, not from a treatise quoting the case

6. **Document the verification**
   - Record where you verified (URL or source)
   - Date of verification (cases get overruled; verification is time-stamped)

## When verification fails

If a citation cannot be verified:

1. **Do not assume it's real.** The likely explanation is hallucination.
2. **Try alternate spellings** — Smith v. Jones might be Jones v. Smith.
3. **Try the proposition** — Search for the legal rule the citation claims to support. If you can find a real case supporting that rule, that's your replacement.
4. **If no real case supports the proposition, remove the proposition.**
5. **Flag in the draft** with `[CITATION REMOVED — could not verify; do not refile]`.

NEVER add a citation back if you can't verify it. Better to argue without authority than with hallucinated authority.

## Sample verification output

```
Original citation: Smith v. Jones, 123 F.3d 456 (7th Cir. 2019)

VERIFICATION STATUS: VERIFIED
  Source: CourtListener (https://www.courtlistener.com/opinion/...)
  Confirmed: Case name, reporter, court, year
  Pin-cite p. 460 contains the cited proposition: YES
  Current status: Cited 47 times, no negative treatment
  Verification date: 2026-05-27
```

```
Original citation: Doe v. Roe, 999 F.3d 999 (9th Cir. 2020)

VERIFICATION STATUS: NOT FOUND (LIKELY HALLUCINATED)
  Searched: CourtListener, Google Scholar, Justia, 9th Cir. opinion archive
  No case matching name + reporter + court + year found
  Searched for proposition "[the proposition]" — found supporting authority in:
    Real Case v. Real Party, 456 F.3d 789 (9th Cir. 2017) — verified
  RECOMMENDATION: Remove "Doe v. Roe" cite. Substitute "Real Case v. Real Party, 456 F.3d 789 (9th Cir. 2017)" after verifying it supports the same proposition.
```

## Statute verification

Statutes are easier — they're maintained on official sites.

1. Identify the statute (e.g., 42 USC §1983)
2. Pull current text from:
   - Federal: uscode.house.gov or law.cornell.edu/uscode
   - State: state's official statutory database (often legis.state.XX.us or similar)
3. Confirm:
   - Section number current and accurate
   - Subsection citation (e.g., (a), (b)(1)(C)) current
   - Quoted text matches current statute
4. Check effective date — statutes get amended; the version applicable to the conduct may differ from current version

## Rule verification

Federal rules (FRCP, FRE, FRAP, FRCrP):
- Pull from uscourts.gov
- Cornell LII has current versions

State rules:
- State supreme court website typically has current rules

## When the LLM resists

If an AI tells you a citation is real and you can't find it, the AI is more likely wrong than you are. Verify against the actual source. Don't argue with the model; verify.

## Workflow integration

Run citation-verifier subagent against every draft before finalizing:
- After motion-drafter completes
- After brief-drafter completes
- After any output containing legal citations

Do not mark any draft "ready to file" until citation-verifier reports zero unverified citations.

## The principle

Better to file a draft with NO citation than a draft with a HALLUCINATED citation. The first is unsupported; the second is sanctionable.

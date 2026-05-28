---
description: Research case law and statutory authority on a specific legal question
argument-hint: <legal question, as precise as possible>
---

# Find Precedent

Question: $ARGUMENTS

Delegate to `case-law-researcher` subagent.

Read `.claude/skills/case-law-research/SKILL.md`.

Workflow:

1. Refine the question if vague:
   - Specific cause of action
   - Specific factual posture
   - Specific jurisdiction
   - Specific procedural moment

2. Identify the authority hierarchy for the forum:
   - Federal: USSC → your circuit → other circuits → districts
   - State: state supreme → state appellate → trial courts → federal interpretations of state law

3. Search free tools in order:
   - CourtListener (MCP if available; otherwise web)
   - Google Scholar (case law filter, jurisdiction filter)
   - Justia
   - Cornell LII (for statutes and rules)
   - State court websites

4. **VERIFY EVERY CITATION**:
   - Open each opinion
   - Confirm name, court, year, reporter
   - Read facts and holding
   - Find the pin-cite for any proposition you'll attribute
   - Check citing references for current status (positive / mixed / negative treatment)

5. **REMOVE UNVERIFIABLE CITATIONS**. If a case cannot be found at an authoritative source, do not include it. Find a real case supporting the same proposition, or report that no support exists.

6. Build the research report:
   - Controlling authority (mandatory in this forum)
   - Persuasive authority (other circuits, secondary sources)
   - Statutory / rule authority with current text
   - Counterauthority (cases cutting against; disclose proactively)
   - Limitations on authority

7. Save to `08-research/research-<topic>-<YYYYMMDD>.md`.

8. Run citation-verifier as final pass.

Log in `_session-log.md`.

**NEVER produce a citation without verification source URL and date.**

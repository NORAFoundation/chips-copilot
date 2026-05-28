---
description: Draft an open records / FOIA / agency records request
argument-hint: <agency-or-target-and-topic>
---

# Draft Records Request

Target and topic: $ARGUMENTS

Read `.claude/skills/legal-drafting/SKILL.md`.

Delegate to `drafting-specialist` subagent.

Workflow:

1. Identify the statute controlling the request:
   - **Federal agency** → 5 U.S.C. § 552 (FOIA)
   - **Wisconsin agency** → Wis. Stat. §§ 19.31-19.39 (Wisconsin Open Records Law)
   - **Minnesota agency** → Minn. Stat. ch. 13 (Minnesota Government Data Practices Act)
   - **Other state** → state's open records statute

2. Identify specific records sought. Common categories in CPS cases:
   - Policies, procedures, manuals, training materials governing [specific conduct]
   - Contracts between agency and third-party service providers (drug testing labs, evaluators)
   - Communications between named officials regarding [case or named child]
   - Complaints, grievances, and disciplinary actions involving named personnel
   - Financial records reflecting funding (Title IV-E) associated with case
   - Calibration and accreditation records for forensic equipment / laboratories
   - Audit trails and access logs for case management systems

3. Draft per template (legal-drafting skill):
   - Citation to controlling statute
   - Specific categories with date ranges
   - Format preferences (electronic / native files)
   - Fee handling
   - Exemption disclosure requirements
   - Response deadline reference
   - Contact information

4. Save to `07-drafts/correspondence/records-request-<agency>-<YYYYMMDD>.md`.

5. Calendar:
   - Send date
   - Statutory response deadline
   - Follow-up date if no response

Log in `_session-log.md`.

Pro tip: One records request can produce months of usable material. Be comprehensive but not so broad that the agency objects to scope.

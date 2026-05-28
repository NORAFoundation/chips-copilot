---
description: Draft a coordinated discovery set — interrogatories, RFPs, RFAs, and subpoenas
argument-hint: <topic or party-to-discover>
---

# Draft Discovery Set

Target: $ARGUMENTS

Read `.claude/skills/discovery-drafting/SKILL.md`.

Delegate to `drafting-specialist` subagent.

Workflow:

1. Confirm with the user: what proposition(s) is the discovery designed to prove or disprove?
2. Identify the discovery instruments needed:
   - **Interrogatories** for facts within opposing party's knowledge
   - **Requests for Production** for documents and ESI
   - **Requests for Admission** for locking in undisputed facts and forcing authentication
   - **Subpoenas duces tecum** for third-party records
   - **Notices of deposition** for witness testimony
3. Draft each instrument with proper definitions, instructions, and individual requests.
4. Anticipate objections (overbroad, vague, burdensome, privileged) and draft to defeat them.
5. Coordinate across instruments — interrogatories set up RFAs which set up depositions.
6. Include privilege log requirement and format-as-kept production format.

Save each instrument:
- Interrogatories → `07-drafts/discovery/interrogatories-<topic>-<YYYYMMDD>.md`
- RFPs → `07-drafts/discovery/rfp-<topic>-<YYYYMMDD>.md`
- RFAs → `07-drafts/discovery/rfa-<topic>-<YYYYMMDD>.md`
- Subpoenas → `07-drafts/discovery/subpoena-<recipient>-<YYYYMMDD>.md`

Produce a coordination overview at `07-drafts/discovery/discovery-strategy-<YYYYMMDD>.md` linking instruments to objectives.

Log in `_session-log.md`.

---
description: Verify every legal citation in a draft against authoritative sources
argument-hint: <path-to-draft>
---

# Citation Verification

Target: $ARGUMENTS

Read the skill at `.claude/skills/citation-verification/SKILL.md`.

Delegate to `citation-verifier` subagent.

Workflow:
1. Extract every case, statute, rule, and constitutional citation from the draft.
2. For each citation, verify against authoritative source:
   - Cases: CourtListener MCP (preferred) or Google Scholar (fallback) — confirm name, year, court, reporter pin-cite
   - Statutes: state's official statutory database or Cornell LII
   - Constitutional provisions: text match
   - Federal rules: text match against current version
3. For each citation, output: VERIFIED / INCORRECT / NOT FOUND / NEEDS_USER_REVIEW
4. For INCORRECT citations, provide the correct form.
5. For NOT FOUND, flag as potentially hallucinated and remove or replace.
6. Check shepardizing / KeyCite status if available — flag overruled or distinguished citations.

Save the verification report at `07-drafts/reviews/cite-check-<basename>-<YYYYMMDD>.md`.

DO NOT mark the original draft "ready" until every citation is verified.

Log in `_session-log.md`.

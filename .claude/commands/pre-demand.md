---
description: Draft a fact-heavy, argument-light pre-litigation demand letter
argument-hint: <optional: target audience / agency>
---

# Draft Pre-Litigation Demand

Apply Prompt 26 (Demand Letter — Pre-Litigation) and Prompt 79 (Federal Pre-Litigation Demand) from the Prompt Library.

Read the skill at `.claude/skills/pre-litigation-demand/SKILL.md`.

CRITICAL DRAFTING RULES:
- FACT-HEAVY, ARGUMENT-LIGHT. Marshal the facts; do not detail legal theory; do not educate opposing counsel.
- Numbered factual paragraphs. Each anchored to evidence.
- Litigation hold language.
- Statutory notice references (if applicable in jurisdiction).
- Settlement window (30-day default).
- No attached evidence (preserves discovery leverage).
- Professional tone, no rhetoric.

Produce sections:
1. ADDRESSEES (officials, counsel, agency head, risk management, insurance carrier)
2. SUBJECT LINE
3. STATEMENT OF FACTS (3-5 pages numbered paragraphs)
4. POTENTIAL CLAIMS (generic categorical reference; do NOT detail theory)
5. LITIGATION HOLD
6. STATUTORY NOTICES
7. SETTLEMENT INVITATION
8. RESPONSE DEADLINE
9. NO-WAIVER LANGUAGE
10. SIGNATURE / CONTACT

Save to `07-drafts/correspondence/pre-litigation-demand-<YYYYMMDD>.md`.

Route through `adversarial-reviewer` subagent to test that no theory is revealed and no settlement floor is implied.

Log in `_session-log.md`.

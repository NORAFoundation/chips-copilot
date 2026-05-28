---
description: Draft witness outline for direct examination or cross-examination
argument-hint: <witness-name> <direct or cross>
---

# Draft Witness Outline

Target: $ARGUMENTS

Read `.claude/skills/legal-drafting/SKILL.md`.

Delegate to `drafting-specialist` subagent.

Workflow:

1. Identify:
   - Witness name and role in case
   - Direction (direct examination of your own witness, OR cross-examination of opposing witness)
   - Hearing this is for
   - What you need this witness to establish OR what you need to extract / undermine

2. Pull relevant facts:
   - From chronology
   - From Master Evidence Index — what exhibits will go through this witness
   - From prior statements by this witness (depositions, declarations, reports)
   - From transcripts of prior testimony

3. **For direct examination**:
   - Qualification questions (foundation for witness's knowledge)
   - Key topics in order (most important first)
   - Specific questions (non-leading; open-ended)
   - Exhibit introduction points
   - Anticipated cross
   - Redirect topics

4. **For cross-examination**:
   - Goal statement (one sentence)
   - Lockdown areas (admissions to extract)
   - Impeachment materials (prior inconsistent statements, bias, lack of foundation)
   - Document-based impeachment
   - Order of topics (most important first)
   - All questions as leading
   - Exit question (short, devastating)

5. Save to `07-drafts/witness-prep/<witness-name>-<direct-or-cross>-<YYYYMMDD>.md`.

6. Stress-test through `adversarial-reviewer` if high-stakes — what will go wrong, how to recover.

Log in `_session-log.md`.

Practice the outline out loud before the hearing. The first time you say a leading question shouldn't be in court.

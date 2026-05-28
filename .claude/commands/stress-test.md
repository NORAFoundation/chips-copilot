---
description: Adversarial stress-test a draft, position, or strategy
argument-hint: <path-to-draft-or-description-of-position>
---

# Adversarial Stress Test

Apply Prompt 82 (Adversarial Stress Test) from the Prompt Library.

Target: $ARGUMENTS

Delegate to `adversarial-reviewer` subagent (`.claude/agents/adversarial-reviewer.md`).

The reviewer will play opposing counsel and identify:
1. WEAKEST FACT and how opposing counsel will use it
2. WEAKEST INFERENCE
3. CONTRADICTORY EVIDENCE in your own file
4. ALTERNATIVE EXPLANATIONS
5. LEGAL VULNERABILITIES (cases / rules cutting against you)
6. PROCEDURAL ATTACKS (standing, ripeness, mootness, waiver, exhaustion)
7. SYMPATHY GAPS
8. CREDIBILITY GAPS
9. NARRATIVE COUNTER-FRAMING

Recommendations:
- Fixes (additional evidence, framing changes, claim narrowing)
- Acknowledgments to make on direct
- Risks to accept
- Course corrections

Save the review at `07-drafts/reviews/stress-test-<basename>-<YYYYMMDD>.md`.

Output the strongest concern surfaced to the user immediately.

Log in `_session-log.md`.

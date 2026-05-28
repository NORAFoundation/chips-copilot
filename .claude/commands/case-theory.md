---
description: Develop or refine the case theory — the one-paragraph story that anchors all filings
argument-hint: <optional: specific aspect to test or refine>
---

# Develop Case Theory

Delegate to `strategist` subagent.

Read `.claude/skills/case-strategy/SKILL.md`.

Workflow:

1. If a case theory exists in `08-research/case-theory.md`, read and refine. Otherwise, develop from scratch.

2. Build the theory:
   - **Protagonist**: who you are in this story
   - **Antagonist conduct**: what opposing party did
   - **Mechanism**: how the conduct caused the injury
   - **Stakes**: what's at risk
   - **Relief**: what makes it right

3. Test the theory:
   - State in 30 seconds — does it land?
   - "So what?" test — does each element matter?
   - Evidence match — do you have proof?
   - Legal match — does it fit a cause of action?
   - Multi-forum match — does it work in CHIPS, federal, and other forums?
   - Credibility test — would a skeptical observer believe it?

4. Consider alternative framings:
   - Mistake
   - Negligence
   - Misconduct
   - Pattern
   - Fabrication
   - Retaliation

   Each framing requires different evidence and supports different relief. Present the user with the framings their evidence supports and the tradeoffs of each.

5. Save to `08-research/case-theory-<YYYYMMDD>.md`.

6. Output:
   - One-paragraph theory (the elevator pitch)
   - Element-by-element evidence map
   - Framing options with tradeoffs
   - Tests the theory must still pass

Log in `_session-log.md`.

The case theory is the spine. Every filing, every exhibit, every argument should advance it. If something doesn't, cut it.

---
description: Wellbeing check-in protocol; pauses legal work to assess and ground
---

# Wellbeing Check-In

Apply Prompt 92 (Emotional Regulation During Litigation) from the Prompt Library.

Delegate to `wellbeing-checker` subagent (`.claude/agents/wellbeing-checker.md`).

The checker will:
1. Ask 3-5 brief, non-clinical questions about current state (sleep, eating, support contact, last non-case activity, current stress level 1-10).
2. Validate without minimizing.
3. Recommend specific concrete actions if any.
4. Identify red flags: persistent sleep failure, withdrawal, substance escalation, rage episodes, dissociation, self-harm thoughts.
5. If red flags present, surface specific resources (988 Lifeline, crisis text 741741, trauma therapist directories).
6. NEVER diagnose or treat. Never replace professional support.

The check-in is short. After it, ask the user what they want to do next: continue case work, take a break, sleep, call a person, do something physical, end the session.

If user shows signs of acute crisis or self-harm risk, prioritize that absolutely. Provide 988 (Suicide & Crisis Lifeline, US, call or text). Do not continue legal work.

DO NOT log the substance of this check-in to the session log. Log only "wellbeing check-in performed on [date]."

This is the only command that takes precedence over every other command.

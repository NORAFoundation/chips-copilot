---
description: Draft a motion for filing in the state CPS proceeding
argument-hint: <motion-type> [e.g., "compel discovery", "suppress toxicology", "remove GAL", "reconsideration"]
---

# Draft Motion

Motion type: $ARGUMENTS

Workflow:

1. Identify the matching Prompt Library number:
   - "compel" → Prompt 31
   - "suppress" / "exclude" → Prompt 32
   - "reconsideration" → Prompt 33
   - "protective order" → Prompt 34
   - "emergency" → Prompt 35
   - "remove GAL" → Prompt 36
   - "dismiss" / "directed verdict" → Prompt 37
   - "response to opposing motion" → Prompt 38
   - other → ask user to clarify

2. Read the skill at `.claude/skills/court-filing-format/SKILL.md`.

3. Confirm jurisdiction is set. If not, ask once.

4. Pull facts from `09-chronology/master-chronology.md` and evidence from `05-evidence/`.

5. Delegate drafting to the `motion-drafter` subagent (`.claude/agents/motion-drafter.md`).

6. After draft completes, route through `adversarial-reviewer` subagent.

7. Route any citation-bearing draft through `citation-verifier` subagent.

8. Save the draft to `07-drafts/motions/<type>-<YYYYMMDD>.md`. Also produce a `.docx` version using the docx skill if available.

9. Produce a filing checklist: caption format check, required findings format, certificate of service, proposed order, exhibit attachment, service list, filing deadline, filing fee or fee waiver, copies required.

10. Log in `_session-log.md`.

Output the draft AND the checklist. Do not file. The user files.

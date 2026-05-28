---
description: Draft (or update) a federal civil rights complaint under 42 U.S.C. §1983
argument-hint: <optional: focus on specific claim or count>
---

# Draft Federal Civil Rights Complaint

Apply Prompts 71-80 from the Prompt Library, especially Prompt 76 (Federal Complaint Structure).

Read the skill at `.claude/skills/federal-civil-rights/SKILL.md`.

Delegate to `brief-drafter` subagent.

Workflow:
1. Verify jurisdiction (USDC district and circuit).
2. Pull facts from `09-chronology/master-chronology.md`.
3. Pull defendants from `00-MASTER-INDEX.md` or ask user.
4. Verify capacities (individual + official) and basis for each defendant's liability.
5. Run abstention analysis (Younger / Rooker-Feldman / Heck) — see Prompt 75. Document conclusion.
6. Run §1983 claim assessment (Prompt 71) for each constitutional theory.
7. Run Monell analysis (Prompt 72) for entity liability.
8. Run qualified immunity preemption (Prompt 73) for individual defendants.
9. Run §1985(3) conspiracy analysis (Prompt 74) if multiple parties acted in concert.

Produce / update:
- Verified Complaint at `13-federal/complaint/verified-complaint-<YYYYMMDD>.md`
- Memorandum of Law (if needed) at `13-federal/complaint/memorandum-<YYYYMMDD>.md`
- Exhibit index at `13-federal/complaint/exhibit-index.md`
- Civil Cover Sheet template
- IFP application template (if applicable)

Route through `adversarial-reviewer` subagent.
Route every citation through `citation-verifier` subagent.

Log in `_session-log.md`.

DO NOT file. The user files.

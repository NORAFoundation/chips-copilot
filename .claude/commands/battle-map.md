---
description: Generate or update the case battle map — elements, evidence, witnesses, cross targets
argument-hint: <optional: filing or hearing this is for>
---

# Generate Battle Map

Delegate to `evidence-manager` subagent in coordination with `strategist`.

Read `.claude/skills/evidence-management/SKILL.md`.

Workflow:

1. Read existing battle map at `08-research/battle-map-<latest>.md` if it exists.
2. Read Master Evidence Index, chronology, and active claims/defenses.
3. Build sections:
   - **Theory of the Case** (one paragraph)
   - **What I must prove (by element)** — evidence and witnesses per element
   - **What they must prove / disprove** — anticipated arguments, my rebuttal
   - **Anticipated opposition arguments** — each with response
   - **Foundational issues** — authentication challenges and paths
   - **Discovery priorities** — what's still missing
   - **Witness list** in call order
   - **Cross-examination targets** for opposing witnesses

4. Save to `08-research/battle-map-<YYYYMMDD>.md`.
5. Surface to user:
   - Weakest element (least evidence)
   - Highest-priority missing evidence
   - Strongest cross-examination opportunities

Log in `_session-log.md`.

Update before every major filing, hearing, deposition, or mediation.

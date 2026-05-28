---
description: Audit agency and court conduct against jurisdiction's child welfare statutes
argument-hint: <optional: specific event or time period to audit>
---

# Statutory Compliance Audit

Apply Prompt 19 (Statutory Compliance Audit) from the Prompt Library.

Delegate to the `statutory-auditor` subagent.

The auditor will:
1. Read the case chronology from `09-chronology/master-chronology.md`.
2. Read orders from `01-orders/`.
3. Read reports from `03-reports/`.
4. Identify the jurisdiction.
5. Map every event / agency action / court action against the applicable child welfare statute requirements.
6. Identify every potential violation with: citation, quoted language, factual basis, available remedy, preservation status.

Cover: intake, investigation timelines, removal authorization, notice, hearing timeliness (initial / adjudication / disposition / permanency / review), reasonable efforts, case plan, visitation, counsel, discovery, standards of proof, required findings in orders, permanency timeline (ASFA), ICWA if applicable, ICPC if multi-state, confidentiality, independent evaluation, mediation.

Save to `08-research/statutory-compliance-audit-<YYYYMMDD>.md`.

Log in `_session-log.md`.

Surface the 3 most actionable violations to the user.

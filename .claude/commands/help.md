---
description: Show all CHIPS Copilot commands organized by what the user needs to do right now.
---

# Help — Commands by Need

Print exactly the table below. Do not summarize, do not omit. The user is looking for the right command, not a tour.

After the table, end with: "Type the command name (with the slash) to run it. If you're not sure which to use, type `/next`."

---

## I just got a document — what is it telling me?

| Command | When to use |
|---|---|
| `/analyze-order` | A court order arrived. Extract every requirement, deadline, and right. Do this same day. |
| `/analyze-report` | CPS report, GAL report, social study, or expert report arrived. Find the contradictions before the hearing. |
| `/analyze-pdf` | Forensic metadata read of any PDF — useful for toxicology reports, "official" documents you suspect were rushed or backdated. |
| `/extract-admissions` | Transcript or recording of a meeting/hearing. Pull party-opponent admissions and contradictions. |

## I need to write something for the court or the agency

| Command | When to use |
|---|---|
| `/draft-motion` | State-court motion (compel, suppress, reconsideration, emergency, return of child, etc.). |
| `/draft-email` | Email to caseworker / GAL / opposing counsel — builds a paper trail, neutral tone. |
| `/draft-declaration` | Sworn statement under penalty of perjury (§1746) or notarized affidavit. |
| `/draft-records-request` | FOIA / state open records / agency records request. |
| `/draft-discovery` | Coordinated discovery set — interrogatories, RFPs, RFAs, subpoenas. |
| `/draft-witness-prep` | Direct or cross-examination outline for an upcoming hearing. |
| `/pre-demand` | Pre-litigation demand letter — fact-heavy, argument-light, builds leverage before federal complaint. |
| `/federal-complaint` | 42 U.S.C. §1983 complaint (and related §§1985/1986). Use only after pre-demand and only with the federal-civil-rights skill loaded. |

## I need to think strategically, not produce a document

| Command | When to use |
|---|---|
| `/triage` | Refresh the TODAY / THIS WEEK / THIS MONTH priority list. Use weekly or after any major event. |
| `/case-theory` | Lock in the one-paragraph story that anchors every filing. Do this early; revisit when facts change. |
| `/leverage-analysis` | Map what each side has, time decay, asymmetries. Use before any settlement discussion. |
| `/endgame` | Work backward from the desired outcome. Use when stuck or before a major strategic pivot. |
| `/stress-test` | Adversarial review of a draft, position, or plan. Mandatory before any court-facing filing. |

## I need to organize evidence

| Command | When to use |
|---|---|
| `/index-evidence` | Build or refresh the Master Evidence Index with hash verification. |
| `/exhibit-package` | Court-ready exhibit package with FRE 901/902 authentication paths. Do before each hearing. |
| `/battle-map` | Element-by-element evidence map — which exhibit proves which element, which witness, which cross. |
| `/chronology` | Build or update the master case chronology. |
| `/preserve` | Full backup with hash re-verification and manifest. Run weekly minimum. |

## I need to research the law

| Command | When to use |
|---|---|
| `/find-precedent` | Research case law and statutory authority on a specific legal question. |
| `/cite-check` | Verify every citation in a draft before filing. Mandatory. Hallucinated citations get sanctions. |
| `/compliance-audit` | Audit agency/court conduct against your state's child welfare statute. Surfaces preserved and unpreserved violations. |

## I'm not sure what to do, or I don't have anything in particular

| Command | When to use |
|---|---|
| `/start` | First time using the tool. Sets up your case directory and master index. |
| `/next` | "What's the highest-leverage thing I should do right now?" Reads your case state and answers in one block. |
| `/help` | This list. |
| `/check-in` | Wellbeing pause. This is a real command. Use it. |

---

Pair commands as needed. Common chains:

- New document → `/analyze-*` → `/chronology` (update timeline) → `/triage` (re-prioritize)
- Drafting a motion → `/find-precedent` → `/draft-motion` → `/cite-check` → `/stress-test`
- Before a hearing → `/exhibit-package` → `/battle-map` → `/draft-witness-prep` → `/stress-test`
- Federal track → `/compliance-audit` → `/pre-demand` → (wait the notice period) → `/federal-complaint`

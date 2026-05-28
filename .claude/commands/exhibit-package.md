---
description: Build a court-ready exhibit package with authentication paths
argument-hint: <hearing or filing this is for>
---

# Build Exhibit Package

Apply Prompt 20 (Exhibit Package Builder) from the Prompt Library.

Filing / hearing: $ARGUMENTS

Workflow:
1. List candidate exhibits from `05-evidence/` and user input.
2. Delegate to `evidence-organizer` subagent.
3. For each exhibit: title, date, description, what it proves, authentication path, anticipated objections, response to objections.
4. Produce numbered exhibit index (A, B, C or 1, 2, 3 per jurisdiction convention).
5. Produce a one-page court-facing summary chart.
6. Identify missing exhibits to obtain.
7. Identify needed sponsoring declarations.

Save to `07-drafts/exhibits/exhibit-index-<YYYYMMDD>.md`.

Log in `_session-log.md`.

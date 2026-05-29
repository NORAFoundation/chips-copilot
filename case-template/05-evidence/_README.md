# 05-evidence

Originals only. **DO NOT MODIFY** anything in this folder once added.

Every file added here MUST be SHA-256 hashed and the hash logged in `../_evidence-hashes.md`. Use `scripts/add-evidence.sh <file>` to do both atomically. Naming: `YYYY-MM-DD_Source_Description.ext` (e.g. `2026-03-14_DHS_caseworker-email-chain.pdf`).

If you need to analyze, redact, or annotate — copy to `../07-drafts/` first and work on the copy. The chain-of-custody rule is absolute: a file that has been modified in `05-evidence/` is no longer trial-ready evidence.

Subfolders are optional but useful when volume grows: `audio/`, `documents/`, `images/`, `messages/`, `video/`, `financial/`. Hash everything regardless of subfolder.

Backup before any reorganization — run `scripts/backup-case.sh` or `/preserve`.

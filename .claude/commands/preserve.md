---
description: Run a complete case backup with hashing and timestamping
---

# Preserve Case Files

Workflow:

1. Confirm with user before running (this writes to disk).
2. Run `scripts/backup-case.sh`.
3. The script will:
   - Create a timestamped tarball of the entire case directory
   - Generate SHA-256 hashes for every file in `05-evidence/`
   - Update `_evidence-hashes.md` with any new hashes
   - Write a backup manifest listing all files included
   - Store backup at the path configured in the script (default: `../chips-backups/`)
4. Confirm backup completed and report:
   - Backup location
   - Total files backed up
   - New evidence files hashed since last backup
   - Total size

5. Recommend offsite copy: encrypted USB, cloud backup (Tresorit, Proton Drive, encrypted Dropbox folder), or sealed envelope with trusted family member.

Log in `_session-log.md`.

This is the most important command in this library. Run it weekly minimum. Run it after every new piece of evidence is added.

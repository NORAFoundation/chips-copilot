# Evidence Hashes — Chain of Custody Registry

Every file added to `05-evidence/` is SHA-256 hashed and logged here on the day it arrives. This is the chain of custody. Do not delete entries. If a file is later moved, archived, or superseded, append a new entry noting the move — do not edit the original.

Use `scripts/add-evidence.sh <file>` to hash and log atomically. Manual entries use the format below.

## Registry

| Date added | File path | SHA-256 | Source / how obtained | Notes |
|------------|-----------|---------|-----------------------|-------|

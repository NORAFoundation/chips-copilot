#!/usr/bin/env bash
# backup-case.sh — Full timestamped case backup with hash verification
# Usage: ./scripts/backup-case.sh [optional-backup-root]

set -euo pipefail

# Find case root
CASE_ROOT="$(pwd)"
while [ ! -f "$CASE_ROOT/00-MASTER-INDEX.md" ] && [ "$CASE_ROOT" != "/" ]; do
  CASE_ROOT="$(dirname "$CASE_ROOT")"
done

if [ ! -f "$CASE_ROOT/00-MASTER-INDEX.md" ]; then
  echo "ERROR: Not in a CHIPS case directory"
  exit 1
fi

CASE_NAME=$(basename "$CASE_ROOT")
BACKUP_ROOT="${1:-$(dirname "$CASE_ROOT")/chips-backups}"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
BACKUP_DIR="$BACKUP_ROOT/$CASE_NAME-$TIMESTAMP"
TARBALL="$BACKUP_DIR.tar.gz"

mkdir -p "$BACKUP_ROOT"

echo "Backing up: $CASE_ROOT"
echo "Destination: $TARBALL"
echo ""

# Re-hash all evidence to verify integrity
echo "Verifying evidence hashes..."
EVIDENCE_DIR="$CASE_ROOT/05-evidence"
HASH_LOG="$CASE_ROOT/_evidence-hashes.md"
MANIFEST="/tmp/chips-backup-manifest-$TIMESTAMP.txt"

if [ -d "$EVIDENCE_DIR" ]; then
  find "$EVIDENCE_DIR" -type f ! -name '_*' | while read -r f; do
    if command -v shasum >/dev/null 2>&1; then
      H=$(shasum -a 256 "$f" | awk '{print $1}')
    else
      H=$(sha256sum "$f" | awk '{print $1}')
    fi
    REL="${f#$CASE_ROOT/}"
    echo "$H  $REL" >> "$MANIFEST"
  done
fi

# Create the tarball
echo "Creating tarball..."
tar czf "$TARBALL" -C "$(dirname "$CASE_ROOT")" "$(basename "$CASE_ROOT")"

# Add manifest
if [ -f "$MANIFEST" ]; then
  cp "$MANIFEST" "$BACKUP_ROOT/$CASE_NAME-$TIMESTAMP.manifest.txt"
  rm -f "$MANIFEST"
fi

SIZE=$(du -h "$TARBALL" | awk '{print $1}')
FILE_COUNT=$(tar tzf "$TARBALL" | wc -l)

echo ""
echo "BACKUP COMPLETE"
echo "  Tarball:  $TARBALL"
echo "  Manifest: $BACKUP_ROOT/$CASE_NAME-$TIMESTAMP.manifest.txt"
echo "  Size:     $SIZE"
echo "  Files:    $FILE_COUNT"
echo ""
echo "RECOMMENDED NEXT STEPS:"
echo "  - Copy backup to offsite location (encrypted USB, cloud backup, trusted family member)"
echo "  - Verify backup integrity with: tar tzf $TARBALL > /dev/null"

# Log to session log
SESSION_LOG="$CASE_ROOT/_session-log.md"
if [ -f "$SESSION_LOG" ]; then
  if ! grep -q "^## $(date +%Y-%m-%d)" "$SESSION_LOG" 2>/dev/null; then
    {
      echo ""
      echo "## $(date +%Y-%m-%d)"
      echo ""
    } >> "$SESSION_LOG"
  fi
  echo "- Backup created: $TARBALL ($SIZE, $FILE_COUNT files)" >> "$SESSION_LOG"
fi

#!/usr/bin/env bash
# add-evidence.sh — Add a file to the evidence vault with hashing and logging
# Usage: ./scripts/add-evidence.sh <source-file> [optional-source-note]

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <source-file> [source-note]"
  echo "  Hashes the file, copies it to 05-evidence/, appends to _evidence-hashes.md."
  exit 1
fi

SOURCE="$1"
NOTE="${2:-}"

if [ ! -f "$SOURCE" ]; then
  echo "ERROR: Source file not found: $SOURCE"
  exit 1
fi

# Find case root (looks for 00-MASTER-INDEX.md)
CASE_ROOT="$(pwd)"
while [ ! -f "$CASE_ROOT/00-MASTER-INDEX.md" ] && [ "$CASE_ROOT" != "/" ]; do
  CASE_ROOT="$(dirname "$CASE_ROOT")"
done

if [ ! -f "$CASE_ROOT/00-MASTER-INDEX.md" ]; then
  echo "ERROR: Not in a CHIPS case directory (no 00-MASTER-INDEX.md found)"
  exit 1
fi

EVIDENCE_DIR="$CASE_ROOT/05-evidence"
HASH_LOG="$CASE_ROOT/_evidence-hashes.md"
SESSION_LOG="$CASE_ROOT/_session-log.md"

# Compute hash before moving
if command -v shasum >/dev/null 2>&1; then
  HASH=$(shasum -a 256 "$SOURCE" | awk '{print $1}')
elif command -v sha256sum >/dev/null 2>&1; then
  HASH=$(sha256sum "$SOURCE" | awk '{print $1}')
else
  echo "ERROR: Neither shasum nor sha256sum available. Install one and retry."
  exit 1
fi

# Build destination path
BASENAME=$(basename "$SOURCE")
DEST="$EVIDENCE_DIR/$BASENAME"

# Don't overwrite
if [ -f "$DEST" ]; then
  TIMESTAMP=$(date +%Y%m%d-%H%M%S)
  DEST="$EVIDENCE_DIR/${BASENAME%.*}__${TIMESTAMP}.${BASENAME##*.}"
fi

cp "$SOURCE" "$DEST"

# Verify hash post-copy
if command -v shasum >/dev/null 2>&1; then
  DEST_HASH=$(shasum -a 256 "$DEST" | awk '{print $1}')
else
  DEST_HASH=$(sha256sum "$DEST" | awk '{print $1}')
fi

if [ "$HASH" != "$DEST_HASH" ]; then
  echo "ERROR: Hash mismatch after copy. Source=$HASH Dest=$DEST_HASH"
  rm -f "$DEST"
  exit 1
fi

# Log to evidence hashes
SIZE=$(wc -c < "$DEST" | tr -d ' ')
NOW=$(date '+%Y-%m-%d %H:%M:%S')
REL_PATH="${DEST#$CASE_ROOT/}"

echo "$NOW | $REL_PATH | SHA-256: $HASH | Size: $SIZE bytes | Source: ${NOTE:-not specified}" >> "$HASH_LOG"

# Log to session log
if [ -f "$SESSION_LOG" ]; then
  if ! grep -q "^## $(date +%Y-%m-%d)" "$SESSION_LOG" 2>/dev/null; then
    {
      echo ""
      echo "## $(date +%Y-%m-%d)"
      echo ""
    } >> "$SESSION_LOG"
  fi
  echo "- Evidence added: $REL_PATH (SHA-256: ${HASH:0:16}...)" >> "$SESSION_LOG"
fi

echo "EVIDENCE ADDED"
echo "  Path:   $REL_PATH"
echo "  SHA-256: $HASH"
echo "  Size:   $SIZE bytes"
echo "  Source: ${NOTE:-not specified}"
echo ""
echo "Logged to: _evidence-hashes.md"

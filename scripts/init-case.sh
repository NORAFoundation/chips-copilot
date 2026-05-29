#!/usr/bin/env bash
# init-case.sh — Bootstrap a new CHIPS Copilot case directory.
# Copies the case-template/ structure to the current directory and seeds
# the master index. Safe to re-run — won't overwrite existing files.
#
# Usage:
#   ./scripts/init-case.sh                  # initialize $PWD as a case dir
#   ./scripts/init-case.sh /path/to/case    # initialize the given dir

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
TEMPLATE_DIR="$REPO_ROOT/case-template"
TARGET_DIR="${1:-$(pwd)}"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "ERROR: case-template/ not found at $TEMPLATE_DIR" >&2
  echo "       Are you running from a chips-copilot checkout?" >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Refuse to wipe an existing case (presence of 00-MASTER-INDEX.md is the marker)
if [ -f "00-MASTER-INDEX.md" ]; then
  echo "INFO: $TARGET_DIR already contains 00-MASTER-INDEX.md — refusing to reinitialize."
  echo "      Existing case. Edit files in place. Nothing changed."
  exit 0
fi

echo "Initializing case directory at: $TARGET_DIR"
echo "Source template:                $TEMPLATE_DIR"
echo ""

# Copy every entry from case-template/ (including dotfiles like _session-log.md).
# We use find + cp -n so existing files in TARGET_DIR are preserved.
( cd "$TEMPLATE_DIR" && find . -mindepth 1 -maxdepth 1 -print0 ) \
  | while IFS= read -r -d '' entry; do
    rel="${entry#./}"
    if [ -e "$TARGET_DIR/$rel" ]; then
      echo "  skip (exists): $rel"
    else
      cp -R "$TEMPLATE_DIR/$rel" "$TARGET_DIR/$rel"
      echo "  copied:        $rel"
    fi
  done

# Seed _session-log.md with today's header
SESSION_LOG="$TARGET_DIR/_session-log.md"
if [ -f "$SESSION_LOG" ] && ! grep -q "^## $(date +%Y-%m-%d)" "$SESSION_LOG"; then
  {
    echo ""
    echo "## $(date +%Y-%m-%d)"
    echo ""
    echo "- Case initialized via scripts/init-case.sh"
  } >> "$SESSION_LOG"
fi

echo ""
echo "DONE."
echo ""
echo "Next steps (in order):"
echo ""
echo "  1. export CHIPS_CASE_DIR=\"$TARGET_DIR\""
echo "     (add that line to your ~/.zshrc or ~/.bashrc so it persists)"
echo ""
echo "  2. cd \"$TARGET_DIR\""
echo ""
echo "  3. claude        # or: opencode    or: codex"
echo ""
echo "  4. Inside the tool, type ONE command:"
echo ""
echo "         /start"
echo ""
echo "     That walks you through case identity, jurisdiction, and your"
echo "     first triage memo. About 10-15 minutes. See START_HERE.md."
echo ""

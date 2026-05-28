#!/usr/bin/env bash
# release.sh — Build a distributable tarball of the CHIPS Copilot CLI bundle.
# Excludes build artifacts, node_modules, user state, and OS junk.
#
# Usage:
#   ./scripts/release.sh               # writes ./chips-copilot-vX.Y.Z.tar.gz
#   ./scripts/release.sh /tmp          # writes /tmp/chips-copilot-vX.Y.Z.tar.gz

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
OUT_DIR="${1:-$REPO_ROOT}"
VERSION="$(cat "$REPO_ROOT/VERSION" | tr -d '[:space:]')"
NAME="chips-copilot-v${VERSION}"
TARBALL="$OUT_DIR/${NAME}.tar.gz"

if [ -e "$TARBALL" ]; then
  echo "ERROR: $TARBALL already exists; refusing to overwrite." >&2
  exit 1
fi

cd "$(dirname "$REPO_ROOT")"
BASENAME="$(basename "$REPO_ROOT")"

# Run verifier first — refuse to release if structural checks fail
echo "Running scripts/verify-install.sh --offline ..."
( cd "$REPO_ROOT" && ./scripts/verify-install.sh --offline >/dev/null )

echo "Building tarball: $TARBALL"

tar czf "$TARBALL" \
  --exclude="$BASENAME/.git" \
  --exclude="$BASENAME/.DS_Store" \
  --exclude="$BASENAME/**/.DS_Store" \
  --exclude="$BASENAME/.claude/settings.local.json" \
  --exclude="$BASENAME/ai-extension/node_modules" \
  --exclude="$BASENAME/ai-extension/dist" \
  --exclude="$BASENAME/ai-extension/*.vsix" \
  --exclude="$BASENAME/custom-ide/node_modules" \
  --exclude="$BASENAME/custom-ide/lib" \
  --exclude="$BASENAME/custom-ide/src-gen" \
  --exclude="$BASENAME/custom-ide/.theia" \
  --exclude="$BASENAME/node_modules" \
  --exclude="$BASENAME/05-evidence/*" \
  --exclude="$BASENAME/_session-log.md" \
  --exclude="$BASENAME/_evidence-hashes.md" \
  "$BASENAME"

SHA=$(shasum -a 256 "$TARBALL" | awk '{print $1}')
SIZE=$(du -h "$TARBALL" | awk '{print $1}')
FILES=$(tar tzf "$TARBALL" | wc -l | tr -d ' ')

echo ""
echo "RELEASE BUILT"
echo "  Path:    $TARBALL"
echo "  Size:    $SIZE"
echo "  Files:   $FILES"
echo "  SHA-256: $SHA"
echo ""
echo "Publish checklist:"
echo "  1. git tag v$VERSION && git push --tags"
echo "  2. Upload $TARBALL as a release asset on GitHub"
echo "  3. Paste this SHA into the release notes: $SHA"

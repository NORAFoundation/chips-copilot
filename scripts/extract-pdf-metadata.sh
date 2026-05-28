#!/usr/bin/env bash
# extract-pdf-metadata.sh — Forensic metadata extraction for a PDF
# Usage: ./scripts/extract-pdf-metadata.sh <path-to-pdf> [--save]
#
# Tries exiftool first, falls back to pdfinfo, then to a Python pikepdf one-liner.

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <path-to-pdf> [--save]"
  echo "  --save: also write structured output to 07-drafts/analysis/"
  exit 1
fi

PDF="$1"
SAVE="${2:-}"

if [ ! -f "$PDF" ]; then
  echo "ERROR: File not found: $PDF"
  exit 1
fi

BASENAME=$(basename "$PDF")
NAME="${BASENAME%.*}"

# Hash
if command -v shasum >/dev/null 2>&1; then
  HASH=$(shasum -a 256 "$PDF" | awk '{print $1}')
else
  HASH=$(sha256sum "$PDF" | awk '{print $1}')
fi

SIZE=$(wc -c < "$PDF" | tr -d ' ')

OUTPUT=""
TOOL_USED=""

if command -v exiftool >/dev/null 2>&1; then
  TOOL_USED="exiftool"
  OUTPUT=$(exiftool -a -G1 -s "$PDF" 2>&1)
elif command -v pdfinfo >/dev/null 2>&1; then
  TOOL_USED="pdfinfo"
  OUTPUT=$(pdfinfo "$PDF" 2>&1)
elif command -v python3 >/dev/null 2>&1 && python3 -c "import pikepdf" 2>/dev/null; then
  TOOL_USED="pikepdf"
  OUTPUT=$(python3 -c "
import pikepdf, sys
pdf = pikepdf.open('$PDF')
print('-- docinfo --')
for k, v in pdf.docinfo.items():
    print(f'{k}: {v}')
print()
if '/Metadata' in pdf.Root:
    print('-- XMP metadata --')
    print(pdf.Root.Metadata.read_bytes().decode('utf-8', errors='replace'))
else:
    print('No XMP metadata present.')
")
else
  echo "ERROR: No PDF metadata tool available."
  echo "  Install one of:"
  echo "    macOS:    brew install exiftool"
  echo "    Ubuntu:   sudo apt install libimage-exiftool-perl"
  echo "    Or:       pip install pikepdf"
  exit 1
fi

REPORT="
DOCUMENT IDENTITY
  Filename: $BASENAME
  Path:     $PDF
  SHA-256:  $HASH
  Size:     $SIZE bytes
  Tool:     $TOOL_USED
  Extracted: $(date '+%Y-%m-%d %H:%M:%S')

RAW METADATA
$OUTPUT

QUICK RED-FLAG SCAN
"

# Quick red flag detection
RED_FLAGS=""
for flag in "PDFsharp" "PDFSharp" "Microsoft Print to PDF" "Microsoft: Print To PDF" "Microsoft Word" "Telerik Reporting" "TCPDF" "FPDF" "DOMPDF" "iText" "Word "; do
  if echo "$OUTPUT" | grep -i -q "$flag"; then
    RED_FLAGS="$RED_FLAGS\n  CRITICAL: '$flag' detected in producer/creator fields"
  fi
done

if [ -z "$RED_FLAGS" ]; then
  REPORT="$REPORT  No common consumer-software fingerprints detected.\n  (Manual review still required — see .claude/skills/pdf-forensics/SKILL.md)"
else
  REPORT="$REPORT$RED_FLAGS"
  REPORT="$REPORT\n\n  These fingerprints are consumer software, not institutional LIMS/EMR/clerk systems.\n  See .claude/skills/pdf-forensics/SKILL.md for analysis framework."
fi

echo -e "$REPORT"

if [ "$SAVE" = "--save" ]; then
  # Find case root
  CASE_ROOT="$(pwd)"
  while [ ! -f "$CASE_ROOT/00-MASTER-INDEX.md" ] && [ "$CASE_ROOT" != "/" ]; do
    CASE_ROOT="$(dirname "$CASE_ROOT")"
  done

  if [ -f "$CASE_ROOT/00-MASTER-INDEX.md" ]; then
    SAVE_DIR="$CASE_ROOT/07-drafts/analysis"
    mkdir -p "$SAVE_DIR"
    SAVE_PATH="$SAVE_DIR/pdf-metadata-$NAME-$(date +%Y%m%d).md"
    echo "# PDF Metadata Extract: $BASENAME" > "$SAVE_PATH"
    echo "" >> "$SAVE_PATH"
    echo "\`\`\`" >> "$SAVE_PATH"
    echo -e "$REPORT" >> "$SAVE_PATH"
    echo "\`\`\`" >> "$SAVE_PATH"
    echo ""
    echo "Saved to: ${SAVE_PATH#$CASE_ROOT/}"
  fi
fi

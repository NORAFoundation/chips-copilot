#!/usr/bin/env bash
# verify-install.sh — Post-install sanity check for CHIPS Copilot.
# Runs structural validation on the bundle: command/agent/skill counts,
# JSON validity, Bash utility availability, optional MCP package
# reachability. Exits non-zero if a BLOCKER check fails.
#
# Usage:
#   ./scripts/verify-install.sh             # full check
#   ./scripts/verify-install.sh --offline   # skip MCP npm reachability

set -uo pipefail  # NOT -e: we want to keep going after non-blocking fails

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
OFFLINE=0
[ "${1:-}" = "--offline" ] && OFFLINE=1

FAIL=0
WARN=0

red()   { printf "\033[31m%s\033[0m" "$*"; }
green() { printf "\033[32m%s\033[0m" "$*"; }
yel()   { printf "\033[33m%s\033[0m" "$*"; }

check() {
  local label="$1" status="$2"
  case "$status" in
    OK)   printf "  [%s] %s\n" "$(green ' OK ')" "$label" ;;
    WARN) printf "  [%s] %s\n" "$(yel  'WARN')" "$label"; WARN=$((WARN+1)) ;;
    FAIL) printf "  [%s] %s\n" "$(red  'FAIL')" "$label"; FAIL=$((FAIL+1)) ;;
  esac
}

echo "CHIPS Copilot — install verification"
echo "Repo root: $REPO_ROOT"
echo

# 1. Required files at repo root
echo "Required files:"
for f in CLAUDE.md AGENTS.md README.md INSTALL.md LICENSE CHANGELOG.md VERSION .mcp.json opencode.json; do
  if [ -f "$REPO_ROOT/$f" ]; then check "$f present" OK; else check "$f missing" FAIL; fi
done
echo

# 2. .claude/ structure
echo ".claude/ structure:"
CMD_COUNT=$(find "$REPO_ROOT/.claude/commands" -maxdepth 1 -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
AGENT_COUNT=$(find "$REPO_ROOT/.claude/agents" -maxdepth 1 -name '*.md' 2>/dev/null | wc -l | tr -d ' ')
SKILL_COUNT=$(find "$REPO_ROOT/.claude/skills" -mindepth 2 -name 'SKILL.md' 2>/dev/null | wc -l | tr -d ' ')

[ "$CMD_COUNT" -ge 26 ]   && check "slash commands: $CMD_COUNT (>=26)"        OK || check "slash commands: $CMD_COUNT (expected >=26)" FAIL
[ "$AGENT_COUNT" -ge 12 ] && check "subagents: $AGENT_COUNT (>=12)"           OK || check "subagents: $AGENT_COUNT (expected >=12)"   FAIL
[ "$SKILL_COUNT" -ge 12 ] && check "skills (SKILL.md files): $SKILL_COUNT (>=12)" OK || check "skills: $SKILL_COUNT (expected >=12)"  FAIL

[ -f "$REPO_ROOT/.claude/settings.json" ] && check ".claude/settings.json present"     OK || check ".claude/settings.json missing"    FAIL
[ -f "$REPO_ROOT/.claude/settings.local.json" ] \
  && check ".claude/settings.local.json present (should not ship in releases — see .gitignore)" WARN \
  || check "no .claude/settings.local.json (good for shipped release)" OK
echo

# 3. JSON validity
echo "JSON files parse:"
if command -v python3 >/dev/null 2>&1; then
  for j in .mcp.json opencode.json .claude/settings.json; do
    if [ -f "$REPO_ROOT/$j" ]; then
      if python3 -c "import json,sys; json.load(open(sys.argv[1]))" "$REPO_ROOT/$j" 2>/dev/null; then
        check "$j parses" OK
      else
        check "$j does not parse as JSON" FAIL
      fi
    fi
  done
elif command -v node >/dev/null 2>&1; then
  for j in .mcp.json opencode.json .claude/settings.json; do
    if [ -f "$REPO_ROOT/$j" ]; then
      if node -e "JSON.parse(require('fs').readFileSync(process.argv[1],'utf8'))" "$REPO_ROOT/$j" 2>/dev/null; then
        check "$j parses" OK
      else
        check "$j does not parse" FAIL
      fi
    fi
  done
else
  check "no python3 or node available for JSON validation" WARN
fi
echo

# 4. case-template structure
echo "case-template/ structure:"
for d in 01-orders 02-petitions-filings 03-reports 04-correspondence 05-evidence \
         06-transcripts 07-drafts 08-research 09-chronology 10-services 11-visits \
         12-financial 13-federal 14-appellate 15-criminal 99-archive; do
  [ -d "$REPO_ROOT/case-template/$d" ] && check "$d/" OK || check "$d/ missing" FAIL
done
[ -f "$REPO_ROOT/case-template/00-MASTER-INDEX.md" ] && check "00-MASTER-INDEX.md" OK || check "00-MASTER-INDEX.md missing" FAIL
echo

# 5. Scripts executable
echo "scripts/ executable:"
for s in add-evidence.sh backup-case.sh extract-pdf-metadata.sh init-case.sh verify-install.sh; do
  if [ -f "$REPO_ROOT/scripts/$s" ]; then
    if [ -x "$REPO_ROOT/scripts/$s" ]; then check "$s +x" OK; else check "$s not executable (run: chmod +x scripts/*.sh)" WARN; fi
  else
    check "$s missing" FAIL
  fi
done
echo

# 6. Required Bash utilities
echo "Bash utilities (for /preserve, /add-evidence, /analyze-pdf):"
for tool in shasum sha256sum tar find awk grep; do
  if command -v "$tool" >/dev/null 2>&1; then check "$tool" OK; else check "$tool missing (one of shasum/sha256sum is sufficient)" WARN; fi
done
# At least one hashing tool must exist
if ! command -v shasum >/dev/null 2>&1 && ! command -v sha256sum >/dev/null 2>&1; then
  check "neither shasum nor sha256sum installed — evidence hashing will fail" FAIL
fi
echo

# 7. Optional PDF tools
echo "PDF forensics tools (any one is sufficient):"
PDF_TOOL_FOUND=0
for t in exiftool pdfinfo; do
  if command -v "$t" >/dev/null 2>&1; then check "$t" OK; PDF_TOOL_FOUND=1; fi
done
if command -v python3 >/dev/null 2>&1 && python3 -c "import pikepdf" 2>/dev/null; then
  check "python3 + pikepdf" OK
  PDF_TOOL_FOUND=1
fi
[ "$PDF_TOOL_FOUND" -eq 0 ] && check "no PDF metadata tool installed (install exiftool, pdfinfo, or pikepdf)" WARN
echo

# 8. Node + npm (required for MCP servers)
echo "Node / npm:"
if command -v node >/dev/null 2>&1; then
  NODE_VER=$(node -v | sed 's/^v//')
  NODE_MAJOR=$(echo "$NODE_VER" | cut -d. -f1)
  if [ "$NODE_MAJOR" -ge 20 ]; then check "node $NODE_VER (>=20)" OK; else check "node $NODE_VER (need >=20)" FAIL; fi
else
  check "node not installed (required for MCP servers)" FAIL
fi
command -v npx >/dev/null 2>&1 && check "npx available" OK || check "npx not available" FAIL
echo

# 9. MCP package reachability (optional; off in --offline)
if [ "$OFFLINE" -eq 0 ] && command -v npm >/dev/null 2>&1; then
  echo "MCP packages reachable on npm registry:"
  for pkg in \
    "@us-legal-tools/courtlistener-sdk" \
    "@monsoft/mcp-gmail" \
    "@modelcontextprotocol/server-filesystem" \
    "@missionsquad/mcp-dropbox" \
    "firecrawl-mcp" \
    "mcp-fetch-server" \
    "@playwright/mcp" \
    "mcp-sqlite" \
    "@modelcontextprotocol/server-github"; do
    if npm view "$pkg" version >/dev/null 2>&1; then
      check "$pkg" OK
    else
      check "$pkg not found on npm" WARN
    fi
  done
  echo
fi

# Summary
echo "============================="
if [ "$FAIL" -gt 0 ]; then
  echo "$(red 'FAILED'): $FAIL blocker(s), $WARN warning(s)"
  exit 1
elif [ "$WARN" -gt 0 ]; then
  echo "$(yel 'PASSED with warnings'): $WARN warning(s)"
  exit 0
else
  echo "$(green 'PASSED'): all checks clean"
  exit 0
fi

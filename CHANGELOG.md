# Changelog

All notable changes to CHIPS Copilot are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] — 2026-05-28

### Added
- **Evidence Management module** — skill (`evidence-management/SKILL.md`),
  subagent (`evidence-manager`), and commands `/index-evidence`,
  `/exhibit-package`, `/battle-map`, `/preserve`.
- **Legal Drafting module** — skill (`legal-drafting/SKILL.md`), subagent
  (`drafting-specialist`), and commands `/draft-declaration`,
  `/draft-records-request`, `/draft-discovery`, `/draft-witness-prep`.
- **Case Strategy module** — skill (`case-strategy/SKILL.md`), subagent
  (`strategist`), and commands `/case-theory`, `/leverage-analysis`,
  `/endgame`, `/triage`.
- **Case Law Research module** — skill (`case-law-research/SKILL.md`),
  subagent (`case-law-researcher`), and commands `/find-precedent`,
  `/cite-check`.
- `LICENSE` (MIT for code, CC BY-SA 4.0 for the Prompt Library).
- `.gitignore` covering case evidence, secrets, build artifacts, and
  local Claude Code state.
- `scripts/verify-install.sh` — post-install sanity checker that
  validates Node version, slash command/agent/skill counts, MCP package
  reachability, and required Bash utilities.
- `scripts/init-case.sh` — idempotent case directory bootstrapper that
  replaces the fragile `cp -r` snippet from the previous INSTALL.md.
- GitHub Actions CI (`.github/workflows/ci.yml`) — validates JSON,
  markdown frontmatter on every command/agent, and shellcheck on
  scripts.
- `ai-extension/`: real Anthropic SDK integration with streaming,
  `vscode.SecretStorage` for the API key, settings UI for model
  selection, XSS-safe webview with CSP nonce, `.vscodeignore`, and
  updated `package.json` (repository, license, bugs, homepage).
- `custom-ide/`: `electron-builder` configuration in `package.json` for
  unsigned `.dmg` beta distribution, with documented signing path for
  production.

### Changed
- `.mcp.json` — corrected four broken package references:
  - `@modelcontextprotocol/server-courtlistener` → `@us-legal-tools/courtlistener-sdk`
  - `@modelcontextprotocol/server-gmail` → `@monsoft/mcp-gmail`
  - `@modelcontextprotocol/server-fetch` (for jina-reader) →
    `mcp-fetch-server` and renamed to `web-fetch`
  - `mcp-server-dropbox` → `@missionsquad/mcp-dropbox`
  - `@modelcontextprotocol/server-sqlite` → `mcp-sqlite`
- `.claude/settings.json` — `CHIPS_VERSION` corrected from `1.0` to
  `1.1`; explicit `_fallback_models` order documented.
- INSTALL.md — removed the spurious `npm install -g docx` step (no
  command actually invokes docx), and replaced the fragile case-bootstrap
  one-liner with `scripts/init-case.sh`.
- README.md — added Jurisdiction Support section and full slash-command
  list reference.

### Removed
- `.claude/settings.local.json` (was a leftover test fixture with
  hardcoded `/private/var/folders/...` paths; now gitignored, and a
  sanitized `.claude/settings.local.json.example` documents the
  per-machine override pattern).

### Security
- ai-extension webview no longer writes user input into `innerHTML`;
  all dynamic content goes through `textContent` or a sanitizer with
  CSP nonce-restricted script execution. Closes XSS path noted in audit
  (`extension.ts:164,181`).
- `.gitignore` now blocks `**/credentials.json`, `.env*`, `*.pem`,
  `*.key`, the case `_session-log.md`, the `_evidence-hashes.md`, and
  the `05-evidence/`, `06-transcripts/`, `12-financial/` trees from any
  repo created inside a case directory.

## [1.0.0] — 2025

Initial release: 14 slash commands, 8 subagents, 8 skills, 9 MCP
integrations, 3 utility scripts, 16-folder case template.

# Changelog

All notable changes to CHIPS Copilot are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] — 2026-05-29

### Added — built-in walkthrough layer
- `WELCOME.md` (repo root) — human-language landing doc; what the tool is, the cold-to-triage-memo flow, the hard rules, the "if you can't keep going" guidance.
- `case-template/START_HERE.md` — first thing a new user sees inside their case directory; tells them exactly which command to type.
- `/start` — interactive onboarding command. Detects new vs. returning user, walks through case directory setup, delegates to `/intake` and `/setup-jurisdiction`, ends with `/triage`. Crisis-aware (routes to `/check-in` on distress signals).
- `/next` — "what should I do right now" — reads master index, session log, chronology, recent triage, and produces ONE specific next action with rationale, time estimate, how-to, and a 10-minute fallback.
- `/help` — full 31-command index organized by user need (analyzing a document / writing something / thinking strategically / organizing evidence / researching law / not sure). Includes common command chains.
- `/intake` — interactive case-identity wizard. Fills `00-MASTER-INDEX.md` conversationally without inventing values; unknowns marked `[unknown — to confirm]`.
- `/setup-jurisdiction` — locks state, county, court, recording-consent law, notice-of-claim deadline, ICWA flag. Writes `_jurisdiction.md`. Referenced by every later draft.

### Fixed — case-template gaps
The README and `00-MASTER-INDEX.md` referenced folders and files that didn't actually exist in the template — running `init-case.sh` left users with broken references. Added:
- `case-template/05-evidence/_README.md` — the chain-of-custody rules folder.
- `case-template/06-transcripts/_README.md` — hearing + recording transcripts.
- `case-template/12-financial/_README.md` — case expenses + §1983 damages tracking.
- `case-template/_session-log.md` — append-only session log seed.
- `case-template/_evidence-hashes.md` — chain-of-custody hash registry seed.

### Changed
- `.gitignore` — added `!case-template/...` exception rules. Without these the v1.1 ignore patterns (`05-evidence/`, `06-transcripts/`, `12-financial/`, `_session-log.md`, `_evidence-hashes.md`) silently stripped the same paths out of the template at commit time, which is why those folders never made it into v1.1. User case directories remain ignored.
- `scripts/init-case.sh` — final "Next steps" output rewritten. Now explicitly tells the user the four steps including the literal `/start` command, instead of saying "edit master index in $EDITOR" (which assumed knowledge users don't have).
- `README.md` — replaced the v1.1 capability-module lead with a Quickstart section showing the 4-step cold-start path. Updated counts: 31 slash commands, 4 utility scripts.

### Notes
- All v1.2 additions are additive — every v1.1 command still works the same way.
- The walkthrough layer exists to remove the need for the maintainer to manually walk each new user through the system. Cold-to-triage-memo should now take ~15 minutes without external guidance.

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

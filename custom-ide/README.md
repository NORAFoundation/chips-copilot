# Custom Stripped-Down IDE (Theia-based)

This is a minimal, modular IDE platform designed to run custom extensions only.

## Architecture
- **Engine:** Eclipse Theia (Modular Code-OSS foundation)
- **Editor:** Monaco (Same as VS Code/Cursor)
- **Extension Engine:** VS Code Plugin Support

## Getting Started

1. **Install Dependencies:**
   ```bash
   yarn install
   ```

2. **Add Your Custom Extensions:**
   Place any `.vsix` files in the `./plugins` directory.

3. **Build & Start:**
   ```bash
   yarn build
   yarn start
   ```
   Open `http://localhost:3000` to see your custom platform.

## What's been stripped out?
- No Git integration (optional)
- No Debugging tools (optional)
- No Tasks or standard VS Code bloat
- Minimal menu structure

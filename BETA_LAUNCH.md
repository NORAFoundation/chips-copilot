# HolyClaude IDE: Private Beta Launch Guide

The HolyClaude IDE is a hardened, AI-first workspace built for child welfare litigation. This guide covers how to launch the platform for verification and how to package it for your private beta testers.

## 🚀 1. Local Launch (Verification)

To launch the IDE on your machine with the branded splash screen and the AI Sidepane active:

```bash
cd custom-ide
./node_modules/.bin/electron src-gen/backend/electron-main.js --plugins=local-dir:./plugins
```

**What to expect on launch:**
- **Splash Screen:** A dark "HOLYCLAUDE" loading screen with the branded logo.
- **Startup:** The `WELCOME.md` file will open automatically in the editor.
- **AI Sidepane:** Click the **Star Icon** in the Activity Bar.
  - Test the `FILES` button to see the repository structure.
  - Highlight code in `WELCOME.md` and see it appear as context in the chat.

---

## 📦 2. Distributing for Private Beta

Since we are in the "Pre-Alpha" phase of the private beta, the most reliable way to distribute this to testers (who have Node.js installed) is to package the build artifacts.

### Option A: The "Portable" Folder (Easiest for Beta)
Compress the `custom-ide` directory into a `.zip` file. This folder contains the `node_modules`, the `plugins` (.vsix), and the compiled `lib`.

1.  **Harden the folder:**
    ```bash
    cd custom-ide
    yarn theia build --mode production
    ```
2.  **Zip it:**
    ```bash
    cd ..
    zip -r holyclaude-beta-v0.1.zip custom-ide -x "*.git*" "*/.theia/*"
    ```

### Option B: Native Installer (DMG/App)
To build a true `.app` or `.dmg` for macOS, we will use `electron-builder`. 
*Note: This requires a stable network connection to download the Electron distributable (which failed in the previous step due to a transient error).*

**Once your network is stable, run:**
```bash
cd custom-ide
yarn add --dev electron-builder
./node_modules/.bin/electron-builder build --mac
```

---

## 🛡️ 3. Hardened Features
- **Stripped UI:** The Debug, Terminal, Run, and Selection menus are hidden via `package.json` config.
- **Pinned Core:** Dependencies are pinned to **Theia 1.48.0** to prevent "version drift" during the beta.
- **Offline Aware:** The AI Sidepane is currently using a mock response architecture, ready for you to plug in your private LLM API keys.

---
**Status:** The production build is complete. You are ready to launch.

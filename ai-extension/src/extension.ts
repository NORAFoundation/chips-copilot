import * as vscode from 'vscode';

export async function activate(context: vscode.ExtensionContext) {
    const provider = new AISidebarProvider(context.extensionUri);

    // Open Welcome file on first launch
    const welcomeKey = 'holyclaude.welcomeShown';
    const welcomeShown = context.globalState.get(welcomeKey);
    if (!welcomeShown) {
        const welcomePath = vscode.Uri.joinPath(context.extensionUri, 'resources', 'WELCOME.md');
        try {
            const doc = await vscode.workspace.openTextDocument(welcomePath);
            await vscode.window.showTextDocument(doc, { preview: false });
            context.globalState.update(welcomeKey, true);
        } catch (e) {
            console.error('Could not find welcome file', e);
        }
    }

    context.subscriptions.push(
        vscode.window.registerWebviewViewProvider(
            'ai-sidepane-view',
            provider
        )
    );

    // Command to apply AI code to the editor
    context.subscriptions.push(
        vscode.commands.registerCommand('ai-sidepane.applyCode', (code: string) => {
            const editor = vscode.window.activeTextEditor;
            if (editor) {
                editor.edit(editBuilder => {
                    editBuilder.replace(editor.selection, code);
                });
            }
        })
    );
}

class AISidebarProvider implements vscode.WebviewViewProvider {
    constructor(private readonly _extensionUri: vscode.Uri) {}

    public resolveWebviewView(
        webviewView: vscode.WebviewView,
        _context: vscode.WebviewViewResolveContext,
        _token: vscode.CancellationToken,
    ) {
        webviewView.webview.options = {
            enableScripts: true,
            localResourceRoots: [this._extensionUri]
        };

        webviewView.webview.html = this._getHtmlForWebview(webviewView.webview);

        webviewView.webview.onDidReceiveMessage(data => {
            switch (data.type) {
                case 'askAI':
                    this._handleAIRequest(webviewView, data.value);
                    break;
                case 'listProject':
                    this._handleListProject(webviewView);
                    break;
                case 'applyCode':
                    vscode.commands.executeCommand('ai-sidepane.applyCode', data.value);
                    break;
            }
        });
    }

    private _handleAIRequest(webviewView: vscode.WebviewView, prompt: string) {
        const editor = vscode.window.activeTextEditor;
        const selectedText = editor ? editor.document.getText(editor.selection) : '';
        
        // Mocking AI Response logic
        const response = `I see you are working on: \n\n\`\`\`\n${selectedText || 'No text selected'}\n\`\`\`\n\nHow can I help with this?`;
        
        webviewView.webview.postMessage({ 
            type: 'aiResponse', 
            value: response,
            isCode: !!selectedText
        });
    }

    private async _handleListProject(webviewView: vscode.WebviewView) {
        const workspaceFolders = vscode.workspace.workspaceFolders;
        if (!workspaceFolders) {
            webviewView.webview.postMessage({ type: 'aiResponse', value: "No workspace folder open." });
            return;
        }

        const rootUri = workspaceFolders[0].uri;
        const files = await vscode.workspace.fs.readDirectory(rootUri);
        const fileList = files.map(([name, type]) => `${type === vscode.FileType.Directory ? '[DIR] ' : ''}${name}`).join('\n');

        webviewView.webview.postMessage({ 
            type: 'aiResponse', 
            value: `Workspace Files:\n\`\`\`\n${fileList}\n\`\`\`` 
        });
    }

    private _getHtmlForWebview(webview: vscode.Webview) {
        return `<!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style>
                    body { font-family: 'Segoe UI', sans-serif; padding: 15px; color: #ccc; background: #1e1e1e; line-height: 1.5; }
                    #chat { height: calc(100vh - 160px); overflow-y: auto; margin-bottom: 15px; padding-right: 5px; }
                    .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px; border-bottom: 1px solid #333; padding-bottom: 5px; }
                    .header span { font-size: 0.7em; letter-spacing: 1px; color: #888; }
                    .header div { display: flex; gap: 5px; }
                    #clear-btn, #project-btn { background: transparent; color: #888; border: 1px solid #444; border-radius: 3px; cursor: pointer; font-size: 10px; padding: 2px 6px; }
                    #clear-btn:hover, #project-btn:hover { color: #ccc; border-color: #666; }
                    .input-container { position: fixed; bottom: 15px; left: 15px; right: 15px; }
                    input { 
                        width: 100%; box-sizing: border-box; background: #2d2d2d; color: #fff; 
                        border: 1px solid #3d3d3d; padding: 10px; border-radius: 4px; outline: none;
                    }
                    input:focus { border-color: #007acc; }
                    .message { margin-bottom: 15px; border-bottom: 1px solid #333; padding-bottom: 10px; }
                    .user { color: #569cd6; font-size: 0.8em; text-transform: uppercase; margin-bottom: 4px; display: block; }
                    .ai { color: #ce9178; font-size: 0.8em; text-transform: uppercase; margin-bottom: 4px; display: block; }
                    pre { background: #000; padding: 10px; border-radius: 4px; overflow-x: auto; position: relative; }
                    .apply-btn { 
                        position: absolute; top: 5px; right: 5px; background: #007acc; color: #fff; 
                        border: none; padding: 4px 8px; border-radius: 3px; cursor: pointer; font-size: 10px;
                    }
                    .apply-btn:hover { background: #005a9e; }
                </style>
            </head>
            <body>
                <div class="header">
                    <span>HOLYCLAUDE ASSISTANT</span>
                    <div>
                        <button id="project-btn" title="List Project Files">FILES</button>
                        <button id="clear-btn">CLEAR</button>
                    </div>
                </div>
                <div id="chat">
                    <div class="message"><span class="ai">HolyClaude</span> Welcome. Highlight code and ask me to refactor it.</div>
                </div>
                <div class="input-container">
                    <input type="text" id="prompt" placeholder="Message HolyClaude..." autofocus />
                </div>
                <script>
                    const vscode = acquireVsCodeApi();
                    const chat = document.getElementById('chat');
                    const prompt = document.getElementById('prompt');
                    const clearBtn = document.getElementById('clear-btn');
                    const projectBtn = document.getElementById('project-btn');

                    clearBtn.addEventListener('click', () => {
                        chat.innerHTML = '<div class="message"><span class="ai">HolyClaude</span> Chat cleared. How can I help?</div>';
                    });

                    projectBtn.addEventListener('click', () => {
                        vscode.postMessage({ type: 'listProject' });
                    });

                    prompt.addEventListener('keydown', (e) => {
                        if (e.key === 'Enter') {
                            const val = prompt.value;
                            chat.innerHTML += '<div class="message"><span class="user">You</span>' + val + '</div>';
                            vscode.postMessage({ type: 'askAI', value: val });
                            prompt.value = '';
                            chat.scrollTop = chat.scrollHeight;
                        }
                    });

                    window.addEventListener('message', event => {
                        const message = event.data;
                        if (message.type === 'aiResponse') {
                            let content = message.value;
                            // Basic markdown code block detection for demo
                            if (content.includes('\`\`\`')) {
                                content = content.replace(/\`\`\`([\\s\\S]*?)\`\`\`/g, (match, code) => {
                                    return '<pre><code>' + code.trim() + '</code><button class="apply-btn" onclick="apply(\\'' + btoa(code.trim()) + '\\')">Apply</button></pre>';
                                });
                            }
                            chat.innerHTML += '<div class="message"><span class="ai">HolyClaude</span> ' + content + '</div>';
                            chat.scrollTop = chat.scrollHeight;
                        }
                    });

                    function apply(encodedCode) {
                        const code = atob(encodedCode);
                        vscode.postMessage({ type: 'applyCode', value: code });
                    }
                </script>
            </body>
            </html>`;
    }
}

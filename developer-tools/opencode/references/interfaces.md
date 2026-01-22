# Opencode - Interfaces

**Pages:** 7

---

## Server | OpenCode

**URL:** https://opencode.ai/docs/server

**Contents:**
- Server
  - Usage
    - Options
  - Authentication
  - How it works
    - Connect to an existing server
- Spec
- APIs
  - Global
  - Project

Interact with opencode server over HTTP.

The opencode serve command runs a headless HTTP server that exposes an OpenAPI endpoint that an opencode client can use.

--cors can be passed multiple times:

Set OPENCODE_SERVER_PASSWORD to protect the server with HTTP basic auth. The username defaults to opencode, or set OPENCODE_SERVER_USERNAME to override it. This applies to both opencode serve and opencode web.

When you run opencode it starts a TUI and a server. Where the TUI is the client that talks to the server. The server exposes an OpenAPI 3.1 spec endpoint. This endpoint is also used to generate an SDK.

Use the opencode server to interact with opencode programmatically.

This architecture lets opencode support multiple clients and allows you to interact with opencode programmatically.

You can run opencode serve to start a standalone server. If you have the opencode TUI running, opencode serve will start a new server.

When you start the TUI it randomly assigns a port and hostname. You can instead pass in the --hostname and --port flags. Then use this to connect to its server.

The /tui endpoint can be used to drive the TUI through the server. For example, you can prefill or run a prompt. This setup is used by the OpenCode IDE plugins.

The server publishes an OpenAPI 3.1 spec that can be viewed at:

For example, http://localhost:4096/doc. Use the spec to generate clients or inspect request and response types. Or view it in a Swagger explorer.

The opencode server exposes the following APIs.

**Examples:**

Example 1 (unknown):
```unknown
opencode serve
```

Example 2 (typescript):
```typescript
opencode serve [--port <number>] [--hostname <string>] [--cors <origin>]
```

Example 3 (typescript):
```typescript
opencode serve [--port <number>] [--hostname <string>] [--cors <origin>]
```

Example 4 (json):
```json
opencode serve --cors http://localhost:5173 --cors https://app.example.com
```

---

## Migrating to 1.0 | OpenCode

**URL:** https://opencode.ai/docs/1-0/

**Contents:**
- Migrating to 1.0
- Upgrading
- UX changes
- Breaking changes
  - Keybinds renamed
  - Keybinds removed

What's new in OpenCode 1.0.

OpenCode 1.0 is a complete rewrite of the TUI.

We moved from the go+bubbletea based TUI which had performance and capability issues to an in-house framework (OpenTUI) written in zig+solidjs.

The new TUI works like the old one since it connects to the same opencode server.

You should not be autoupgraded to 1.0 if you are currently using a previous version. However some older versions of OpenCode always grab latest.

To upgrade manually, run

To downgrade back to 0.x, run

The session history is more compressed, only showing full details of the edit and bash tool.

We added a command bar which almost everything flows through. Press ctrl+p to bring it up in any context and see everything you can do.

Added a session sidebar (can be toggled) with useful information.

We removed some functionality that we weren’t sure anyone actually used. If something important is missing please open an issue and we’ll add it back quickly.

**Examples:**

Example 1 (unknown):
```unknown
$ opencode upgrade 1.0.0
```

Example 2 (unknown):
```unknown
$ opencode upgrade 1.0.0
```

Example 3 (unknown):
```unknown
$ opencode upgrade 0.15.31
```

Example 4 (unknown):
```unknown
$ opencode upgrade 0.15.31
```

---

## Web | OpenCode

**URL:** https://opencode.ai/docs/web/

**Contents:**
- Web
- Getting Started
- Configuration
  - Port
  - Hostname
  - mDNS Discovery
  - CORS
  - Authentication
- Using the Web Interface
  - Sessions

Using OpenCode in your browser.

OpenCode can run as a web application in your browser, providing the same powerful AI coding experience without needing a terminal.

Start the web interface by running:

This starts a local server on 127.0.0.1 with a random available port and automatically opens OpenCode in your default browser.

If OPENCODE_SERVER_PASSWORD is not set, the server will be unsecured. This is fine for local use but should be set for network access.

You can configure the web server using command line flags or in your config file.

By default, OpenCode picks an available port. You can specify a port:

By default, the server binds to 127.0.0.1 (localhost only). To make OpenCode accessible on your network:

When using 0.0.0.0, OpenCode will display both local and network addresses:

Enable mDNS to make your server discoverable on the local network:

This automatically sets the hostname to 0.0.0.0 and advertises the server as opencode.local.

To allow additional domains for CORS (useful for custom frontends):

To protect access, set a password using the OPENCODE_SERVER_PASSWORD environment variable:

The username defaults to opencode but can be changed with OPENCODE_SERVER_USERNAME.

Once started, the web interface provides access to your OpenCode sessions.

View and manage your sessions from the homepage. You can see active sessions and start new ones.

Click “See Servers” to view connected servers and their status.

You can attach a terminal TUI to a running web server:

This allows you to use both the web interface and terminal simultaneously, sharing the same sessions and state.

You can also configure server settings in your opencode.json config file:

Command line flags take precedence over config file settings.

**Examples:**

Example 1 (unknown):
```unknown
opencode web
```

Example 2 (unknown):
```unknown
opencode web
```

Example 3 (unknown):
```unknown
OPENCODE_SERVER_PASSWORD
```

Example 4 (unknown):
```unknown
opencode web --port 4096
```

---

## TUI | OpenCode

**URL:** https://opencode.ai/docs/tui/

**Contents:**
- TUI
- File references
- Bash commands
- Commands
  - connect
  - compact
  - details
  - editor
  - exit
  - export

Using the OpenCode terminal user interface.

OpenCode provides an interactive terminal interface or TUI for working on your projects with an LLM.

Running OpenCode starts the TUI for the current directory.

Or you can start it for a specific working directory.

Once you’re in the TUI, you can prompt it with a message.

You can reference files in your messages using @. This does a fuzzy file search in the current working directory.

You can also use @ to reference files in your messages.

The content of the file is added to the conversation automatically.

Start a message with ! to run a shell command.

The output of the command is added to the conversation as a tool result.

When using the OpenCode TUI, you can type / followed by a command name to quickly execute actions. For example:

Most commands also have keybind using ctrl+x as the leader key, where ctrl+x is the default leader key. Learn more.

Here are all available slash commands:

Add a provider to OpenCode. Allows you to select from available providers and add their API keys.

Compact the current session. Alias: /summarize

Toggle tool execution details.

Open external editor for composing messages. Uses the editor set in your EDITOR environment variable. Learn more.

Exit OpenCode. Aliases: /quit, /q

Export current conversation to Markdown and open in your default editor. Uses the editor set in your EDITOR environment variable. Learn more.

Show the help dialog.

Create or update AGENTS.md file. Learn more.

List available models.

Start a new session. Alias: /clear

Redo a previously undone message. Only available after using /undo.

Any file changes will also be restored.

Internally, this uses Git to manage the file changes. So your project needs to be a Git repository.

List and switch between sessions. Aliases: /resume, /continue

Share current session. Learn more.

List available themes.

Toggle the visibility of thinking/reasoning blocks in the conversation. When enabled, you can see the model’s reasoning process for models that support extended thinking.

This command only controls whether thinking blocks are displayed - it does not enable or disable the model’s reasoning capabilities. To toggle actual reasoning capabilities, use ctrl+t to cycle through model variants.

Undo last message in the conversation. Removes the most recent user message, all subsequent responses, and any file changes.

Any file changes made will also be reverted.

Internally, this uses Git to manage the file changes. So your project needs to be a Git repository.

Unshare current session. Learn more.

Both the /editor and /export commands use the editor specified in your EDITOR environment variable.

To make it permanent, add this to your shell profile; ~/.bashrc, ~/.zshrc, etc.

To make it permanent, use System Properties > Environment Variables.

To make it permanent, add this to your PowerShell profile.

Popular editor options include:

Some editors like VS Code need to be started with the --wait flag.

Some editors need command-line arguments to run in blocking mode. The --wait flag makes the editor process block until closed.

You can customize TUI behavior through your OpenCode config file.

You can customize various aspects of the TUI view using the command palette (ctrl+x h or /help). These settings persist across restarts.

Toggle whether your username appears in chat messages. Access this through:

**Examples:**

Example 1 (unknown):
```unknown
opencode /path/to/project
```

Example 2 (unknown):
```unknown
opencode /path/to/project
```

Example 3 (unknown):
```unknown
Give me a quick summary of the codebase.
```

Example 4 (unknown):
```unknown
Give me a quick summary of the codebase.
```

---

## TUI | OpenCode

**URL:** https://opencode.ai/docs/tui

**Contents:**
- TUI
- File references
- Bash commands
- Commands
  - connect
  - compact
  - details
  - editor
  - exit
  - export

Using the OpenCode terminal user interface.

OpenCode provides an interactive terminal interface or TUI for working on your projects with an LLM.

Running OpenCode starts the TUI for the current directory.

Or you can start it for a specific working directory.

Once you’re in the TUI, you can prompt it with a message.

You can reference files in your messages using @. This does a fuzzy file search in the current working directory.

You can also use @ to reference files in your messages.

The content of the file is added to the conversation automatically.

Start a message with ! to run a shell command.

The output of the command is added to the conversation as a tool result.

When using the OpenCode TUI, you can type / followed by a command name to quickly execute actions. For example:

Most commands also have keybind using ctrl+x as the leader key, where ctrl+x is the default leader key. Learn more.

Here are all available slash commands:

Add a provider to OpenCode. Allows you to select from available providers and add their API keys.

Compact the current session. Alias: /summarize

Toggle tool execution details.

Open external editor for composing messages. Uses the editor set in your EDITOR environment variable. Learn more.

Exit OpenCode. Aliases: /quit, /q

Export current conversation to Markdown and open in your default editor. Uses the editor set in your EDITOR environment variable. Learn more.

Show the help dialog.

Create or update AGENTS.md file. Learn more.

List available models.

Start a new session. Alias: /clear

Redo a previously undone message. Only available after using /undo.

Any file changes will also be restored.

Internally, this uses Git to manage the file changes. So your project needs to be a Git repository.

List and switch between sessions. Aliases: /resume, /continue

Share current session. Learn more.

List available themes.

Toggle the visibility of thinking/reasoning blocks in the conversation. When enabled, you can see the model’s reasoning process for models that support extended thinking.

This command only controls whether thinking blocks are displayed - it does not enable or disable the model’s reasoning capabilities. To toggle actual reasoning capabilities, use ctrl+t to cycle through model variants.

Undo last message in the conversation. Removes the most recent user message, all subsequent responses, and any file changes.

Any file changes made will also be reverted.

Internally, this uses Git to manage the file changes. So your project needs to be a Git repository.

Unshare current session. Learn more.

Both the /editor and /export commands use the editor specified in your EDITOR environment variable.

To make it permanent, add this to your shell profile; ~/.bashrc, ~/.zshrc, etc.

To make it permanent, use System Properties > Environment Variables.

To make it permanent, add this to your PowerShell profile.

Popular editor options include:

Some editors like VS Code need to be started with the --wait flag.

Some editors need command-line arguments to run in blocking mode. The --wait flag makes the editor process block until closed.

You can customize TUI behavior through your OpenCode config file.

You can customize various aspects of the TUI view using the command palette (ctrl+x h or /help). These settings persist across restarts.

Toggle whether your username appears in chat messages. Access this through:

**Examples:**

Example 1 (unknown):
```unknown
opencode /path/to/project
```

Example 2 (unknown):
```unknown
opencode /path/to/project
```

Example 3 (unknown):
```unknown
Give me a quick summary of the codebase.
```

Example 4 (unknown):
```unknown
Give me a quick summary of the codebase.
```

---

## Server | OpenCode

**URL:** https://opencode.ai/docs/server/

**Contents:**
- Server
  - Usage
    - Options
  - Authentication
  - How it works
    - Connect to an existing server
- Spec
- APIs
  - Global
  - Project

Interact with opencode server over HTTP.

The opencode serve command runs a headless HTTP server that exposes an OpenAPI endpoint that an opencode client can use.

--cors can be passed multiple times:

Set OPENCODE_SERVER_PASSWORD to protect the server with HTTP basic auth. The username defaults to opencode, or set OPENCODE_SERVER_USERNAME to override it. This applies to both opencode serve and opencode web.

When you run opencode it starts a TUI and a server. Where the TUI is the client that talks to the server. The server exposes an OpenAPI 3.1 spec endpoint. This endpoint is also used to generate an SDK.

Use the opencode server to interact with opencode programmatically.

This architecture lets opencode support multiple clients and allows you to interact with opencode programmatically.

You can run opencode serve to start a standalone server. If you have the opencode TUI running, opencode serve will start a new server.

When you start the TUI it randomly assigns a port and hostname. You can instead pass in the --hostname and --port flags. Then use this to connect to its server.

The /tui endpoint can be used to drive the TUI through the server. For example, you can prefill or run a prompt. This setup is used by the OpenCode IDE plugins.

The server publishes an OpenAPI 3.1 spec that can be viewed at:

For example, http://localhost:4096/doc. Use the spec to generate clients or inspect request and response types. Or view it in a Swagger explorer.

The opencode server exposes the following APIs.

**Examples:**

Example 1 (unknown):
```unknown
opencode serve
```

Example 2 (typescript):
```typescript
opencode serve [--port <number>] [--hostname <string>] [--cors <origin>]
```

Example 3 (typescript):
```typescript
opencode serve [--port <number>] [--hostname <string>] [--cors <origin>]
```

Example 4 (json):
```json
opencode serve --cors http://localhost:5173 --cors https://app.example.com
```

---

## Web | OpenCode

**URL:** https://opencode.ai/docs/web

**Contents:**
- Web
- Getting Started
- Configuration
  - Port
  - Hostname
  - mDNS Discovery
  - CORS
  - Authentication
- Using the Web Interface
  - Sessions

Using OpenCode in your browser.

OpenCode can run as a web application in your browser, providing the same powerful AI coding experience without needing a terminal.

Start the web interface by running:

This starts a local server on 127.0.0.1 with a random available port and automatically opens OpenCode in your default browser.

If OPENCODE_SERVER_PASSWORD is not set, the server will be unsecured. This is fine for local use but should be set for network access.

You can configure the web server using command line flags or in your config file.

By default, OpenCode picks an available port. You can specify a port:

By default, the server binds to 127.0.0.1 (localhost only). To make OpenCode accessible on your network:

When using 0.0.0.0, OpenCode will display both local and network addresses:

Enable mDNS to make your server discoverable on the local network:

This automatically sets the hostname to 0.0.0.0 and advertises the server as opencode.local.

To allow additional domains for CORS (useful for custom frontends):

To protect access, set a password using the OPENCODE_SERVER_PASSWORD environment variable:

The username defaults to opencode but can be changed with OPENCODE_SERVER_USERNAME.

Once started, the web interface provides access to your OpenCode sessions.

View and manage your sessions from the homepage. You can see active sessions and start new ones.

Click “See Servers” to view connected servers and their status.

You can attach a terminal TUI to a running web server:

This allows you to use both the web interface and terminal simultaneously, sharing the same sessions and state.

You can also configure server settings in your opencode.json config file:

Command line flags take precedence over config file settings.

**Examples:**

Example 1 (unknown):
```unknown
opencode web
```

Example 2 (unknown):
```unknown
opencode web
```

Example 3 (unknown):
```unknown
OPENCODE_SERVER_PASSWORD
```

Example 4 (unknown):
```unknown
opencode web --port 4096
```

---

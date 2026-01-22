# Opencode - Commands

**Pages:** 6

---

## Share | OpenCode

**URL:** https://opencode.ai/docs/share/

**Contents:**
- Share
- How it works
- Sharing
  - Manual (default)
  - Auto-share
  - Disabled
- Un-sharing
- Privacy
  - Data retention
  - Recommendations

Share your OpenCode conversations.

OpenCode’s share feature allows you to create public links to your OpenCode conversations, so you can collaborate with teammates or get help from others.

Shared conversations are publicly accessible to anyone with the link.

When you share a conversation, OpenCode:

OpenCode supports three sharing modes that control how conversations are shared:

By default, OpenCode uses manual sharing mode. Sessions are not shared automatically, but you can manually share them using the /share command:

This will generate a unique URL that’ll be copied to your clipboard.

To explicitly set manual mode in your config file:

You can enable automatic sharing for all new conversations by setting the share option to "auto" in your config file:

With auto-share enabled, every new conversation will automatically be shared and a link will be generated.

You can disable sharing entirely by setting the share option to "disabled" in your config file:

To enforce this across your team for a given project, add it to the opencode.json in your project and check into Git.

To stop sharing a conversation and remove it from public access:

This will remove the share link and delete the data related to the conversation.

There are a few things to keep in mind when sharing a conversation.

Shared conversations remain accessible until you explicitly unshare them. This includes:

For enterprise deployments, the share feature can be:

Learn more about using opencode in your organization.

**Examples:**

Example 1 (unknown):
```unknown
opncd.ai/s/<share-id>
```

Example 2 (json):
```json
{  "$schema": "https://opncd.ai/config.json",  "share": "manual"}
```

Example 3 (json):
```json
{  "$schema": "https://opncd.ai/config.json",  "share": "manual"}
```

Example 4 (json):
```json
{  "$schema": "https://opncd.ai/config.json",  "share": "auto"}
```

---

## CLI | OpenCode

**URL:** https://opencode.ai/docs/cli

**Contents:**
- CLI
  - tui
    - Flags
- Commands
  - agent
  - attach
    - Flags
    - create
    - list
  - auth

OpenCode CLI options and commands.

The OpenCode CLI by default starts the TUI when run without any arguments.

But it also accepts commands as documented on this page. This allows you to interact with OpenCode programmatically.

Start the OpenCode terminal user interface.

The OpenCode CLI also has the following commands.

Manage agents for OpenCode.

Attach a terminal to an already running OpenCode backend server started via serve or web commands.

This allows using the TUI with a remote OpenCode backend. For example:

Create a new agent with custom configuration.

This command will guide you through creating a new agent with a custom system prompt and tool configuration.

List all available agents.

Command to manage credentials and login for providers.

OpenCode is powered by the provider list at Models.dev, so you can use opencode auth login to configure API keys for any provider you’d like to use. This is stored in ~/.local/share/opencode/auth.json.

When OpenCode starts up it loads the providers from the credentials file. And if there are any keys defined in your environments or a .env file in your project.

Lists all the authenticated providers as stored in the credentials file.

Or the short version.

Logs you out of a provider by clearing it from the credentials file.

Manage the GitHub agent for repository automation.

Install the GitHub agent in your repository.

This sets up the necessary GitHub Actions workflow and guides you through the configuration process. Learn more.

Run the GitHub agent. This is typically used in GitHub Actions.

Manage Model Context Protocol servers.

Add an MCP server to your configuration.

This command will guide you through adding either a local or remote MCP server.

List all configured MCP servers and their connection status.

Or use the short version.

Authenticate with an OAuth-enabled MCP server.

If you don’t provide a server name, you’ll be prompted to select from available OAuth-capable servers.

You can also list OAuth-capable servers and their authentication status.

Or use the short version.

Remove OAuth credentials for an MCP server.

Debug OAuth connection issues for an MCP server.

List all available models from configured providers.

This command displays all models available across your configured providers in the format provider/model.

This is useful for figuring out the exact model name to use in your config.

You can optionally pass a provider ID to filter models by that provider.

Use the --refresh flag to update the cached model list. This is useful when new models have been added to a provider and you want to see them in OpenCode.

Run opencode in non-interactive mode by passing a prompt directly.

This is useful for scripting, automation, or when you want a quick answer without launching the full TUI. For example.

You can also attach to a running opencode serve instance to avoid MCP server cold boot times on every run:

Start a headless OpenCode server for API access. Check out the server docs for the full HTTP interface.

This starts an HTTP server that provides API access to opencode functionality without the TUI interface. Set OPENCODE_SERVER_PASSWORD to enable HTTP basic auth (username defaults to opencode).

Manage OpenCode sessions.

List all OpenCode sessions.

Show token usage and cost statistics for your OpenCode sessions.

Export session data as JSON.

If you don’t provide a session ID, you’ll be prompted to select from available sessions.

Import session data from a JSON file or OpenCode share URL.

You can import from a local file or an OpenCode share URL.

Start a headless OpenCode server with a web interface.

This starts an HTTP server and opens a web browser to access OpenCode through a web interface. Set OPENCODE_SERVER_PASSWORD to enable HTTP basic auth (username defaults to opencode).

Start an ACP (Agent Client Protocol) server.

This command starts an ACP server that communicates via stdin/stdout using nd-JSON.

Uninstall OpenCode and remove all related files.

Updates opencode to the latest version or a specific version.

To upgrade to the latest version.

To upgrade to a specific version.

The opencode CLI takes the following global flags.

OpenCode can be configured using environment variables.

These environment variables enable experimental features that may change or be removed.

**Examples:**

Example 1 (unknown):
```unknown
opencode run "Explain how closures work in JavaScript"
```

Example 2 (unknown):
```unknown
opencode run "Explain how closures work in JavaScript"
```

Example 3 (unknown):
```unknown
opencode [project]
```

Example 4 (unknown):
```unknown
opencode [project]
```

---

## Commands | OpenCode

**URL:** https://opencode.ai/docs/commands

**Contents:**
- Commands
- Create command files
- Configure
  - JSON
  - Markdown
- Prompt config
  - Arguments
  - Shell output
  - File references
- Options

Create custom commands for repetitive tasks.

Custom commands let you specify a prompt you want to run when that command is executed in the TUI.

Custom commands are in addition to the built-in commands like /init, /undo, /redo, /share, /help. Learn more.

Create markdown files in the commands/ directory to define custom commands.

Create .opencode/commands/test.md:

The frontmatter defines command properties. The content becomes the template.

Use the command by typing / followed by the command name.

You can add custom commands through the OpenCode config or by creating markdown files in the commands/ directory.

Use the command option in your OpenCode config:

Now you can run this command in the TUI:

You can also define commands using markdown files. Place them in:

The markdown file name becomes the command name. For example, test.md lets you run:

The prompts for the custom commands support several special placeholders and syntax.

Pass arguments to commands using the $ARGUMENTS placeholder.

Run the command with arguments:

And $ARGUMENTS will be replaced with Button.

You can also access individual arguments using positional parameters:

Use !command to inject bash command output into your prompt.

For example, to create a custom command that analyzes test coverage:

Or to review recent changes:

Commands run in your project’s root directory and their output becomes part of the prompt.

Include files in your command using @ followed by the filename.

The file content gets included in the prompt automatically.

Let’s look at the configuration options in detail.

The template option defines the prompt that will be sent to the LLM when the command is executed.

This is a required config option.

Use the description option to provide a brief description of what the command does.

This is shown as the description in the TUI when you type in the command.

Use the agent config to optionally specify which agent should execute this command. If this is a subagent the command will trigger a subagent invocation by default. To disable this behavior, set subtask to false.

This is an optional config option. If not specified, defaults to your current agent.

Use the subtask boolean to force the command to trigger a subagent invocation. This is useful if you want the command to not pollute your primary context and will force the agent to act as a subagent, even if mode is set to primary on the agent configuration.

This is an optional config option.

Use the model config to override the default model for this command.

This is an optional config option.

opencode includes several built-in commands like /init, /undo, /redo, /share, /help; learn more.

Custom commands can override built-in commands.

If you define a custom command with the same name, it will override the built-in command.

**Examples:**

Example 1 (unknown):
```unknown
/my-command
```

Example 2 (unknown):
```unknown
/my-command
```

Example 3 (unknown):
```unknown
.opencode/commands/test.md
```

Example 4 (yaml):
```yaml
---description: Run tests with coverageagent: buildmodel: anthropic/claude-3-5-sonnet-20241022---
Run the full test suite with coverage report and show any failures.Focus on the failing tests and suggest fixes.
```

---

## Commands | OpenCode

**URL:** https://opencode.ai/docs/commands/

**Contents:**
- Commands
- Create command files
- Configure
  - JSON
  - Markdown
- Prompt config
  - Arguments
  - Shell output
  - File references
- Options

Create custom commands for repetitive tasks.

Custom commands let you specify a prompt you want to run when that command is executed in the TUI.

Custom commands are in addition to the built-in commands like /init, /undo, /redo, /share, /help. Learn more.

Create markdown files in the commands/ directory to define custom commands.

Create .opencode/commands/test.md:

The frontmatter defines command properties. The content becomes the template.

Use the command by typing / followed by the command name.

You can add custom commands through the OpenCode config or by creating markdown files in the commands/ directory.

Use the command option in your OpenCode config:

Now you can run this command in the TUI:

You can also define commands using markdown files. Place them in:

The markdown file name becomes the command name. For example, test.md lets you run:

The prompts for the custom commands support several special placeholders and syntax.

Pass arguments to commands using the $ARGUMENTS placeholder.

Run the command with arguments:

And $ARGUMENTS will be replaced with Button.

You can also access individual arguments using positional parameters:

Use !command to inject bash command output into your prompt.

For example, to create a custom command that analyzes test coverage:

Or to review recent changes:

Commands run in your project’s root directory and their output becomes part of the prompt.

Include files in your command using @ followed by the filename.

The file content gets included in the prompt automatically.

Let’s look at the configuration options in detail.

The template option defines the prompt that will be sent to the LLM when the command is executed.

This is a required config option.

Use the description option to provide a brief description of what the command does.

This is shown as the description in the TUI when you type in the command.

Use the agent config to optionally specify which agent should execute this command. If this is a subagent the command will trigger a subagent invocation by default. To disable this behavior, set subtask to false.

This is an optional config option. If not specified, defaults to your current agent.

Use the subtask boolean to force the command to trigger a subagent invocation. This is useful if you want the command to not pollute your primary context and will force the agent to act as a subagent, even if mode is set to primary on the agent configuration.

This is an optional config option.

Use the model config to override the default model for this command.

This is an optional config option.

opencode includes several built-in commands like /init, /undo, /redo, /share, /help; learn more.

Custom commands can override built-in commands.

If you define a custom command with the same name, it will override the built-in command.

**Examples:**

Example 1 (unknown):
```unknown
/my-command
```

Example 2 (unknown):
```unknown
/my-command
```

Example 3 (unknown):
```unknown
.opencode/commands/test.md
```

Example 4 (yaml):
```yaml
---description: Run tests with coverageagent: buildmodel: anthropic/claude-3-5-sonnet-20241022---
Run the full test suite with coverage report and show any failures.Focus on the failing tests and suggest fixes.
```

---

## CLI | OpenCode

**URL:** https://opencode.ai/docs/cli/

**Contents:**
- CLI
  - tui
    - Flags
- Commands
  - agent
  - attach
    - Flags
    - create
    - list
  - auth

OpenCode CLI options and commands.

The OpenCode CLI by default starts the TUI when run without any arguments.

But it also accepts commands as documented on this page. This allows you to interact with OpenCode programmatically.

Start the OpenCode terminal user interface.

The OpenCode CLI also has the following commands.

Manage agents for OpenCode.

Attach a terminal to an already running OpenCode backend server started via serve or web commands.

This allows using the TUI with a remote OpenCode backend. For example:

Create a new agent with custom configuration.

This command will guide you through creating a new agent with a custom system prompt and tool configuration.

List all available agents.

Command to manage credentials and login for providers.

OpenCode is powered by the provider list at Models.dev, so you can use opencode auth login to configure API keys for any provider you’d like to use. This is stored in ~/.local/share/opencode/auth.json.

When OpenCode starts up it loads the providers from the credentials file. And if there are any keys defined in your environments or a .env file in your project.

Lists all the authenticated providers as stored in the credentials file.

Or the short version.

Logs you out of a provider by clearing it from the credentials file.

Manage the GitHub agent for repository automation.

Install the GitHub agent in your repository.

This sets up the necessary GitHub Actions workflow and guides you through the configuration process. Learn more.

Run the GitHub agent. This is typically used in GitHub Actions.

Manage Model Context Protocol servers.

Add an MCP server to your configuration.

This command will guide you through adding either a local or remote MCP server.

List all configured MCP servers and their connection status.

Or use the short version.

Authenticate with an OAuth-enabled MCP server.

If you don’t provide a server name, you’ll be prompted to select from available OAuth-capable servers.

You can also list OAuth-capable servers and their authentication status.

Or use the short version.

Remove OAuth credentials for an MCP server.

Debug OAuth connection issues for an MCP server.

List all available models from configured providers.

This command displays all models available across your configured providers in the format provider/model.

This is useful for figuring out the exact model name to use in your config.

You can optionally pass a provider ID to filter models by that provider.

Use the --refresh flag to update the cached model list. This is useful when new models have been added to a provider and you want to see them in OpenCode.

Run opencode in non-interactive mode by passing a prompt directly.

This is useful for scripting, automation, or when you want a quick answer without launching the full TUI. For example.

You can also attach to a running opencode serve instance to avoid MCP server cold boot times on every run:

Start a headless OpenCode server for API access. Check out the server docs for the full HTTP interface.

This starts an HTTP server that provides API access to opencode functionality without the TUI interface. Set OPENCODE_SERVER_PASSWORD to enable HTTP basic auth (username defaults to opencode).

Manage OpenCode sessions.

List all OpenCode sessions.

Show token usage and cost statistics for your OpenCode sessions.

Export session data as JSON.

If you don’t provide a session ID, you’ll be prompted to select from available sessions.

Import session data from a JSON file or OpenCode share URL.

You can import from a local file or an OpenCode share URL.

Start a headless OpenCode server with a web interface.

This starts an HTTP server and opens a web browser to access OpenCode through a web interface. Set OPENCODE_SERVER_PASSWORD to enable HTTP basic auth (username defaults to opencode).

Start an ACP (Agent Client Protocol) server.

This command starts an ACP server that communicates via stdin/stdout using nd-JSON.

Uninstall OpenCode and remove all related files.

Updates opencode to the latest version or a specific version.

To upgrade to the latest version.

To upgrade to a specific version.

The opencode CLI takes the following global flags.

OpenCode can be configured using environment variables.

These environment variables enable experimental features that may change or be removed.

**Examples:**

Example 1 (unknown):
```unknown
opencode run "Explain how closures work in JavaScript"
```

Example 2 (unknown):
```unknown
opencode run "Explain how closures work in JavaScript"
```

Example 3 (unknown):
```unknown
opencode [project]
```

Example 4 (unknown):
```unknown
opencode [project]
```

---

## Share | OpenCode

**URL:** https://opencode.ai/docs/share

**Contents:**
- Share
- How it works
- Sharing
  - Manual (default)
  - Auto-share
  - Disabled
- Un-sharing
- Privacy
  - Data retention
  - Recommendations

Share your OpenCode conversations.

OpenCode’s share feature allows you to create public links to your OpenCode conversations, so you can collaborate with teammates or get help from others.

Shared conversations are publicly accessible to anyone with the link.

When you share a conversation, OpenCode:

OpenCode supports three sharing modes that control how conversations are shared:

By default, OpenCode uses manual sharing mode. Sessions are not shared automatically, but you can manually share them using the /share command:

This will generate a unique URL that’ll be copied to your clipboard.

To explicitly set manual mode in your config file:

You can enable automatic sharing for all new conversations by setting the share option to "auto" in your config file:

With auto-share enabled, every new conversation will automatically be shared and a link will be generated.

You can disable sharing entirely by setting the share option to "disabled" in your config file:

To enforce this across your team for a given project, add it to the opencode.json in your project and check into Git.

To stop sharing a conversation and remove it from public access:

This will remove the share link and delete the data related to the conversation.

There are a few things to keep in mind when sharing a conversation.

Shared conversations remain accessible until you explicitly unshare them. This includes:

For enterprise deployments, the share feature can be:

Learn more about using opencode in your organization.

**Examples:**

Example 1 (unknown):
```unknown
opncd.ai/s/<share-id>
```

Example 2 (json):
```json
{  "$schema": "https://opncd.ai/config.json",  "share": "manual"}
```

Example 3 (json):
```json
{  "$schema": "https://opncd.ai/config.json",  "share": "manual"}
```

Example 4 (json):
```json
{  "$schema": "https://opncd.ai/config.json",  "share": "auto"}
```

---

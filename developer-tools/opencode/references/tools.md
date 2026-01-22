# Opencode - Tools

**Pages:** 8

---

## MCP servers | OpenCode

**URL:** https://opencode.ai/docs/mcp-servers/

**Contents:**
- MCP servers
    - Caveats
- Enable
  - Overriding remote defaults
- Local
    - Options
- Remote
    - Options
- OAuth
  - Automatic

Add local and remote MCP tools.

You can add external tools to OpenCode using the Model Context Protocol, or MCP. OpenCode supports both local and remote servers.

Once added, MCP tools are automatically available to the LLM alongside built-in tools.

When you use an MCP server, it adds to the context. This can quickly add up if you have a lot of tools. So we recommend being careful with which MCP servers you use.

MCP servers add to your context, so you want to be careful with which ones you enable.

Certain MCP servers, like the GitHub MCP server, tend to add a lot of tokens and can easily exceed the context limit.

You can define MCP servers in your OpenCode Config under mcp. Add each MCP with a unique name. You can refer to that MCP by name when prompting the LLM.

You can also disable a server by setting enabled to false. This is useful if you want to temporarily disable a server without removing it from your config.

Organizations can provide default MCP servers via their .well-known/opencode endpoint. These servers may be disabled by default, allowing users to opt-in to the ones they need.

To enable a specific server from your organization’s remote config, add it to your local config with enabled: true:

Your local config values override the remote defaults. See config precedence for more details.

Add local MCP servers using type to "local" within the MCP object.

The command is how the local MCP server is started. You can also pass in a list of environment variables as well.

For example, here’s how you can add the test @modelcontextprotocol/server-everything MCP server.

And to use it I can add use the mcp_everything tool to my prompts.

Here are all the options for configuring a local MCP server.

Add remote MCP servers by setting type to "remote".

The url is the URL of the remote MCP server and with the headers option you can pass in a list of headers.

OpenCode automatically handles OAuth authentication for remote MCP servers. When a server requires authentication, OpenCode will:

For most OAuth-enabled MCP servers, no special configuration is needed. Just configure the remote server:

If the server requires authentication, OpenCode will prompt you to authenticate when you first try to use it. If not, you can manually trigger the flow with opencode mcp auth <server-name>.

If you have client credentials from the MCP server provider, you can configure them:

You can manually trigger authentication or manage credentials.

Authenticate with a specific MCP server:

List all MCP servers and their auth status:

Remove stored credentials:

The mcp auth command will open your browser for authorization. After you authorize, OpenCode will store the tokens securely in ~/.local/share/opencode/mcp-auth.json.

If you want to disable automatic OAuth for a server (e.g., for servers that use API keys instead), set oauth to false:

If a remote MCP server is failing to authenticate, you can diagnose issues with:

The mcp debug command shows the current auth status, tests HTTP connectivity, and attempts the OAuth discovery flow.

Your MCPs are available as tools in OpenCode, alongside built-in tools. So you can manage them through the OpenCode config like any other tool.

This means that you can enable or disable them globally.

We can also use a glob pattern to disable all matching MCPs.

Here we are using the glob pattern my-mcp* to disable all MCPs.

If you have a large number of MCP servers you may want to only enable them per agent and disable them globally. To do this:

The glob pattern uses simple regex globbing patterns:

MCP server tools are registered with server name as prefix, so to disable all tools for a server simply use:

Below are examples of some common MCP servers. You can submit a PR if you want to document other servers.

Add the Sentry MCP server to interact with your Sentry projects and issues.

After adding the configuration, authenticate with Sentry:

This will open a browser window to complete the OAuth flow and connect OpenCode to your Sentry account.

Once authenticated, you can use Sentry tools in your prompts to query issues, projects, and error data.

Add the Context7 MCP server to search through docs.

If you have signed up for a free account, you can use your API key and get higher rate-limits.

Here we are assuming that you have the CONTEXT7_API_KEY environment variable set.

Add use context7 to your prompts to use Context7 MCP server.

Alternatively, you can add something like this to your AGENTS.md.

Add the Grep by Vercel MCP server to search through code snippets on GitHub.

Since we named our MCP server gh_grep, you can add use the gh_grep tool to your prompts to get the agent to use it.

Alternatively, you can add something like this to your AGENTS.md.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "mcp": {    "name-of-mcp-server": {      // ...      "enabled": true,    },    "name-of-other-mcp-server": {      // ...    },  },}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "mcp": {    "name-of-mcp-server": {      // ...      "enabled": true,    },    "name-of-other-mcp-server": {      // ...    },  },}
```

Example 3 (unknown):
```unknown
.well-known/opencode
```

Example 4 (yaml):
```yaml
enabled: true
```

---

## Permissions | OpenCode

**URL:** https://opencode.ai/docs/permissions/

**Contents:**
- Permissions
- Actions
- Configuration
- Granular Rules (Object Syntax)
  - Wildcards
  - Home Directory Expansion
- Available Permissions
- Defaults
- What “Ask” Does
- Agents

Control which actions require approval to run.

OpenCode uses the permission config to decide whether a given action should run automatically, prompt you, or be blocked.

As of v1.1.1, the legacy tools boolean config is deprecated and has been merged into permission. The old tools config is still supported for backwards compatibility.

Each permission rule resolves to one of:

You can set permissions globally (with *), and override specific tools.

You can also set all permissions at once:

For most permissions, you can use an object to apply different actions based on the tool input.

Rules are evaluated by pattern match, with the last matching rule winning. A common pattern is to put the catch-all "*" rule first, and more specific rules after it.

Permission patterns use simple wildcard matching:

You can use ~ or $HOME at the start of a pattern to reference your home directory. This is particularly useful for external_directory rules.

OpenCode permissions are keyed by tool name, plus a couple of safety guards:

If you don’t specify anything, OpenCode starts from permissive defaults:

When OpenCode prompts for approval, the UI offers three outcomes:

The set of patterns that always would approve is provided by the tool (for example, bash approvals typically whitelist a safe command prefix like git status*).

You can override permissions per agent. Agent permissions are merged with the global config, and agent rules take precedence. Learn more about agent permissions.

Refer to the Granular Rules (Object Syntax) section above for more detailed pattern matching examples.

You can also configure agent permissions in Markdown:

Use pattern matching for commands with arguments. "grep *" allows grep pattern file.txt, while "grep" alone would block it. Commands like git status work for default behavior but require explicit permission (like "git status *") when arguments are passed.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "*": "ask",    "bash": "allow",    "edit": "deny"  }}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "*": "ask",    "bash": "allow",    "edit": "deny"  }}
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": "allow"}
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": "allow"}
```

---

## Custom Tools | OpenCode

**URL:** https://opencode.ai/docs/custom-tools/

**Contents:**
- Custom Tools
- Creating a tool
  - Location
  - Structure
    - Multiple tools per file
  - Arguments
  - Context
- Examples
  - Write a tool in Python

Create tools the LLM can call in opencode.

Custom tools are functions you create that the LLM can call during conversations. They work alongside opencode’s built-in tools like read, write, and bash.

Tools are defined as TypeScript or JavaScript files. However, the tool definition can invoke scripts written in any language — TypeScript or JavaScript is only used for the tool definition itself.

The easiest way to create tools is using the tool() helper which provides type-safety and validation.

The filename becomes the tool name. The above creates a database tool.

You can also export multiple tools from a single file. Each export becomes a separate tool with the name <filename>_<exportname>:

This creates two tools: math_add and math_multiply.

You can use tool.schema, which is just Zod, to define argument types.

You can also import Zod directly and return a plain object:

Tools receive context about the current session:

You can write your tools in any language you want. Here’s an example that adds two numbers using Python.

First, create the tool as a Python script:

Then create the tool definition that invokes it:

Here we are using the Bun.$ utility to run the Python script.

**Examples:**

Example 1 (unknown):
```unknown
.opencode/tools/
```

Example 2 (unknown):
```unknown
~/.config/opencode/tools/
```

Example 3 (sql):
```sql
import { tool } from "@opencode-ai/plugin"
export default tool({  description: "Query the project database",  args: {    query: tool.schema.string().describe("SQL query to execute"),  },  async execute(args) {    // Your database logic here    return `Executed query: ${args.query}`  },})
```

Example 4 (sql):
```sql
import { tool } from "@opencode-ai/plugin"
export default tool({  description: "Query the project database",  args: {    query: tool.schema.string().describe("SQL query to execute"),  },  async execute(args) {    // Your database logic here    return `Executed query: ${args.query}`  },})
```

---

## MCP servers | OpenCode

**URL:** https://opencode.ai/docs/mcp-servers

**Contents:**
- MCP servers
    - Caveats
- Enable
  - Overriding remote defaults
- Local
    - Options
- Remote
    - Options
- OAuth
  - Automatic

Add local and remote MCP tools.

You can add external tools to OpenCode using the Model Context Protocol, or MCP. OpenCode supports both local and remote servers.

Once added, MCP tools are automatically available to the LLM alongside built-in tools.

When you use an MCP server, it adds to the context. This can quickly add up if you have a lot of tools. So we recommend being careful with which MCP servers you use.

MCP servers add to your context, so you want to be careful with which ones you enable.

Certain MCP servers, like the GitHub MCP server, tend to add a lot of tokens and can easily exceed the context limit.

You can define MCP servers in your OpenCode Config under mcp. Add each MCP with a unique name. You can refer to that MCP by name when prompting the LLM.

You can also disable a server by setting enabled to false. This is useful if you want to temporarily disable a server without removing it from your config.

Organizations can provide default MCP servers via their .well-known/opencode endpoint. These servers may be disabled by default, allowing users to opt-in to the ones they need.

To enable a specific server from your organization’s remote config, add it to your local config with enabled: true:

Your local config values override the remote defaults. See config precedence for more details.

Add local MCP servers using type to "local" within the MCP object.

The command is how the local MCP server is started. You can also pass in a list of environment variables as well.

For example, here’s how you can add the test @modelcontextprotocol/server-everything MCP server.

And to use it I can add use the mcp_everything tool to my prompts.

Here are all the options for configuring a local MCP server.

Add remote MCP servers by setting type to "remote".

The url is the URL of the remote MCP server and with the headers option you can pass in a list of headers.

OpenCode automatically handles OAuth authentication for remote MCP servers. When a server requires authentication, OpenCode will:

For most OAuth-enabled MCP servers, no special configuration is needed. Just configure the remote server:

If the server requires authentication, OpenCode will prompt you to authenticate when you first try to use it. If not, you can manually trigger the flow with opencode mcp auth <server-name>.

If you have client credentials from the MCP server provider, you can configure them:

You can manually trigger authentication or manage credentials.

Authenticate with a specific MCP server:

List all MCP servers and their auth status:

Remove stored credentials:

The mcp auth command will open your browser for authorization. After you authorize, OpenCode will store the tokens securely in ~/.local/share/opencode/mcp-auth.json.

If you want to disable automatic OAuth for a server (e.g., for servers that use API keys instead), set oauth to false:

If a remote MCP server is failing to authenticate, you can diagnose issues with:

The mcp debug command shows the current auth status, tests HTTP connectivity, and attempts the OAuth discovery flow.

Your MCPs are available as tools in OpenCode, alongside built-in tools. So you can manage them through the OpenCode config like any other tool.

This means that you can enable or disable them globally.

We can also use a glob pattern to disable all matching MCPs.

Here we are using the glob pattern my-mcp* to disable all MCPs.

If you have a large number of MCP servers you may want to only enable them per agent and disable them globally. To do this:

The glob pattern uses simple regex globbing patterns:

MCP server tools are registered with server name as prefix, so to disable all tools for a server simply use:

Below are examples of some common MCP servers. You can submit a PR if you want to document other servers.

Add the Sentry MCP server to interact with your Sentry projects and issues.

After adding the configuration, authenticate with Sentry:

This will open a browser window to complete the OAuth flow and connect OpenCode to your Sentry account.

Once authenticated, you can use Sentry tools in your prompts to query issues, projects, and error data.

Add the Context7 MCP server to search through docs.

If you have signed up for a free account, you can use your API key and get higher rate-limits.

Here we are assuming that you have the CONTEXT7_API_KEY environment variable set.

Add use context7 to your prompts to use Context7 MCP server.

Alternatively, you can add something like this to your AGENTS.md.

Add the Grep by Vercel MCP server to search through code snippets on GitHub.

Since we named our MCP server gh_grep, you can add use the gh_grep tool to your prompts to get the agent to use it.

Alternatively, you can add something like this to your AGENTS.md.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "mcp": {    "name-of-mcp-server": {      // ...      "enabled": true,    },    "name-of-other-mcp-server": {      // ...    },  },}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "mcp": {    "name-of-mcp-server": {      // ...      "enabled": true,    },    "name-of-other-mcp-server": {      // ...    },  },}
```

Example 3 (unknown):
```unknown
.well-known/opencode
```

Example 4 (yaml):
```yaml
enabled: true
```

---

## Tools | OpenCode

**URL:** https://opencode.ai/docs/tools

**Contents:**
- Tools
- Configure
- Built-in
  - bash
  - edit
  - write
  - read
  - grep
  - glob
  - list

Manage the tools an LLM can use.

Tools allow the LLM to perform actions in your codebase. OpenCode comes with a set of built-in tools, but you can extend it with custom tools or MCP servers.

By default, all tools are enabled and don’t need permission to run. You can control tool behavior through permissions.

Use the permission field to control tool behavior. You can allow, deny, or require approval for each tool.

You can also use wildcards to control multiple tools at once. For example, to require approval for all tools from an MCP server:

Learn more about configuring permissions.

Here are all the built-in tools available in OpenCode.

Execute shell commands in your project environment.

This tool allows the LLM to run terminal commands like npm install, git status, or any other shell command.

Modify existing files using exact string replacements.

This tool performs precise edits to files by replacing exact text matches. It’s the primary way the LLM modifies code.

Create new files or overwrite existing ones.

Use this to allow the LLM to create new files. It will overwrite existing files if they already exist.

The write tool is controlled by the edit permission, which covers all file modifications (edit, write, patch, multiedit).

Read file contents from your codebase.

This tool reads files and returns their contents. It supports reading specific line ranges for large files.

Search file contents using regular expressions.

Fast content search across your codebase. Supports full regex syntax and file pattern filtering.

Find files by pattern matching.

Search for files using glob patterns like **/*.js or src/**/*.ts. Returns matching file paths sorted by modification time.

List files and directories in a given path.

This tool lists directory contents. It accepts glob patterns to filter results.

Interact with your configured LSP servers to get code intelligence features like definitions, references, hover info, and call hierarchy.

This tool is only available when OPENCODE_EXPERIMENTAL_LSP_TOOL=true (or OPENCODE_EXPERIMENTAL=true).

Supported operations include goToDefinition, findReferences, hover, documentSymbol, workspaceSymbol, goToImplementation, prepareCallHierarchy, incomingCalls, and outgoingCalls.

To configure which LSP servers are available for your project, see LSP Servers.

Apply patches to files.

This tool applies patch files to your codebase. Useful for applying diffs and patches from various sources.

The patch tool is controlled by the edit permission, which covers all file modifications (edit, write, patch, multiedit).

Load a skill (a SKILL.md file) and return its content in the conversation.

Manage todo lists during coding sessions.

Creates and updates task lists to track progress during complex operations. The LLM uses this to organize multi-step tasks.

This tool is disabled for subagents by default, but you can enable it manually. Learn more

Read existing todo lists.

Reads the current todo list state. Used by the LLM to track what tasks are pending or completed.

This tool is disabled for subagents by default, but you can enable it manually. Learn more

Allows the LLM to fetch and read web pages. Useful for looking up documentation or researching online resources.

Ask the user questions during execution.

This tool allows the LLM to ask the user questions during a task. It’s useful for:

Each question includes a header, the question text, and a list of options. Users can select from the provided options or type a custom answer. When there are multiple questions, users can navigate between them before submitting all answers.

Custom tools let you define your own functions that the LLM can call. These are defined in your config file and can execute arbitrary code.

Learn more about creating custom tools.

MCP (Model Context Protocol) servers allow you to integrate external tools and services. This includes database access, API integrations, and third-party services.

Learn more about configuring MCP servers.

Internally, tools like grep, glob, and list use ripgrep under the hood. By default, ripgrep respects .gitignore patterns, which means files and directories listed in your .gitignore will be excluded from searches and listings.

To include files that would normally be ignored, create a .ignore file in your project root. This file can explicitly allow certain paths.

For example, this .ignore file allows ripgrep to search within node_modules/, dist/, and build/ directories even if they’re listed in .gitignore.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "edit": "deny",    "bash": "ask",    "webfetch": "allow"  }}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "edit": "deny",    "bash": "ask",    "webfetch": "allow"  }}
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "mymcp_*": "ask"  }}
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "mymcp_*": "ask"  }}
```

---

## Permissions | OpenCode

**URL:** https://opencode.ai/docs/permissions

**Contents:**
- Permissions
- Actions
- Configuration
- Granular Rules (Object Syntax)
  - Wildcards
  - Home Directory Expansion
- Available Permissions
- Defaults
- What “Ask” Does
- Agents

Control which actions require approval to run.

OpenCode uses the permission config to decide whether a given action should run automatically, prompt you, or be blocked.

As of v1.1.1, the legacy tools boolean config is deprecated and has been merged into permission. The old tools config is still supported for backwards compatibility.

Each permission rule resolves to one of:

You can set permissions globally (with *), and override specific tools.

You can also set all permissions at once:

For most permissions, you can use an object to apply different actions based on the tool input.

Rules are evaluated by pattern match, with the last matching rule winning. A common pattern is to put the catch-all "*" rule first, and more specific rules after it.

Permission patterns use simple wildcard matching:

You can use ~ or $HOME at the start of a pattern to reference your home directory. This is particularly useful for external_directory rules.

OpenCode permissions are keyed by tool name, plus a couple of safety guards:

If you don’t specify anything, OpenCode starts from permissive defaults:

When OpenCode prompts for approval, the UI offers three outcomes:

The set of patterns that always would approve is provided by the tool (for example, bash approvals typically whitelist a safe command prefix like git status*).

You can override permissions per agent. Agent permissions are merged with the global config, and agent rules take precedence. Learn more about agent permissions.

Refer to the Granular Rules (Object Syntax) section above for more detailed pattern matching examples.

You can also configure agent permissions in Markdown:

Use pattern matching for commands with arguments. "grep *" allows grep pattern file.txt, while "grep" alone would block it. Commands like git status work for default behavior but require explicit permission (like "git status *") when arguments are passed.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "*": "ask",    "bash": "allow",    "edit": "deny"  }}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "*": "ask",    "bash": "allow",    "edit": "deny"  }}
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": "allow"}
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": "allow"}
```

---

## Custom Tools | OpenCode

**URL:** https://opencode.ai/docs/custom-tools

**Contents:**
- Custom Tools
- Creating a tool
  - Location
  - Structure
    - Multiple tools per file
  - Arguments
  - Context
- Examples
  - Write a tool in Python

Create tools the LLM can call in opencode.

Custom tools are functions you create that the LLM can call during conversations. They work alongside opencode’s built-in tools like read, write, and bash.

Tools are defined as TypeScript or JavaScript files. However, the tool definition can invoke scripts written in any language — TypeScript or JavaScript is only used for the tool definition itself.

The easiest way to create tools is using the tool() helper which provides type-safety and validation.

The filename becomes the tool name. The above creates a database tool.

You can also export multiple tools from a single file. Each export becomes a separate tool with the name <filename>_<exportname>:

This creates two tools: math_add and math_multiply.

You can use tool.schema, which is just Zod, to define argument types.

You can also import Zod directly and return a plain object:

Tools receive context about the current session:

You can write your tools in any language you want. Here’s an example that adds two numbers using Python.

First, create the tool as a Python script:

Then create the tool definition that invokes it:

Here we are using the Bun.$ utility to run the Python script.

**Examples:**

Example 1 (unknown):
```unknown
.opencode/tools/
```

Example 2 (unknown):
```unknown
~/.config/opencode/tools/
```

Example 3 (sql):
```sql
import { tool } from "@opencode-ai/plugin"
export default tool({  description: "Query the project database",  args: {    query: tool.schema.string().describe("SQL query to execute"),  },  async execute(args) {    // Your database logic here    return `Executed query: ${args.query}`  },})
```

Example 4 (sql):
```sql
import { tool } from "@opencode-ai/plugin"
export default tool({  description: "Query the project database",  args: {    query: tool.schema.string().describe("SQL query to execute"),  },  async execute(args) {    // Your database logic here    return `Executed query: ${args.query}`  },})
```

---

## Tools | OpenCode

**URL:** https://opencode.ai/docs/tools/

**Contents:**
- Tools
- Configure
- Built-in
  - bash
  - edit
  - write
  - read
  - grep
  - glob
  - list

Manage the tools an LLM can use.

Tools allow the LLM to perform actions in your codebase. OpenCode comes with a set of built-in tools, but you can extend it with custom tools or MCP servers.

By default, all tools are enabled and don’t need permission to run. You can control tool behavior through permissions.

Use the permission field to control tool behavior. You can allow, deny, or require approval for each tool.

You can also use wildcards to control multiple tools at once. For example, to require approval for all tools from an MCP server:

Learn more about configuring permissions.

Here are all the built-in tools available in OpenCode.

Execute shell commands in your project environment.

This tool allows the LLM to run terminal commands like npm install, git status, or any other shell command.

Modify existing files using exact string replacements.

This tool performs precise edits to files by replacing exact text matches. It’s the primary way the LLM modifies code.

Create new files or overwrite existing ones.

Use this to allow the LLM to create new files. It will overwrite existing files if they already exist.

The write tool is controlled by the edit permission, which covers all file modifications (edit, write, patch, multiedit).

Read file contents from your codebase.

This tool reads files and returns their contents. It supports reading specific line ranges for large files.

Search file contents using regular expressions.

Fast content search across your codebase. Supports full regex syntax and file pattern filtering.

Find files by pattern matching.

Search for files using glob patterns like **/*.js or src/**/*.ts. Returns matching file paths sorted by modification time.

List files and directories in a given path.

This tool lists directory contents. It accepts glob patterns to filter results.

Interact with your configured LSP servers to get code intelligence features like definitions, references, hover info, and call hierarchy.

This tool is only available when OPENCODE_EXPERIMENTAL_LSP_TOOL=true (or OPENCODE_EXPERIMENTAL=true).

Supported operations include goToDefinition, findReferences, hover, documentSymbol, workspaceSymbol, goToImplementation, prepareCallHierarchy, incomingCalls, and outgoingCalls.

To configure which LSP servers are available for your project, see LSP Servers.

Apply patches to files.

This tool applies patch files to your codebase. Useful for applying diffs and patches from various sources.

The patch tool is controlled by the edit permission, which covers all file modifications (edit, write, patch, multiedit).

Load a skill (a SKILL.md file) and return its content in the conversation.

Manage todo lists during coding sessions.

Creates and updates task lists to track progress during complex operations. The LLM uses this to organize multi-step tasks.

This tool is disabled for subagents by default, but you can enable it manually. Learn more

Read existing todo lists.

Reads the current todo list state. Used by the LLM to track what tasks are pending or completed.

This tool is disabled for subagents by default, but you can enable it manually. Learn more

Allows the LLM to fetch and read web pages. Useful for looking up documentation or researching online resources.

Ask the user questions during execution.

This tool allows the LLM to ask the user questions during a task. It’s useful for:

Each question includes a header, the question text, and a list of options. Users can select from the provided options or type a custom answer. When there are multiple questions, users can navigate between them before submitting all answers.

Custom tools let you define your own functions that the LLM can call. These are defined in your config file and can execute arbitrary code.

Learn more about creating custom tools.

MCP (Model Context Protocol) servers allow you to integrate external tools and services. This includes database access, API integrations, and third-party services.

Learn more about configuring MCP servers.

Internally, tools like grep, glob, and list use ripgrep under the hood. By default, ripgrep respects .gitignore patterns, which means files and directories listed in your .gitignore will be excluded from searches and listings.

To include files that would normally be ignored, create a .ignore file in your project root. This file can explicitly allow certain paths.

For example, this .ignore file allows ripgrep to search within node_modules/, dist/, and build/ directories even if they’re listed in .gitignore.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "edit": "deny",    "bash": "ask",    "webfetch": "allow"  }}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "edit": "deny",    "bash": "ask",    "webfetch": "allow"  }}
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "mymcp_*": "ask"  }}
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "permission": {    "mymcp_*": "ask"  }}
```

---

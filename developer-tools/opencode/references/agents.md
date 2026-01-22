# Opencode - Agents

**Pages:** 7

---

## Agent Skills | OpenCode

**URL:** https://opencode.ai/docs/skills/

**Contents:**
- Agent Skills
- Place files
- Understand discovery
- Write frontmatter
- Validate names
- Follow length rules
- Use an example
- Recognize tool description
- Configure permissions
- Override per agent

Define reusable behavior via SKILL.md definitions

Agent skills let OpenCode discover reusable instructions from your repo or home directory. Skills are loaded on-demand via the native skill tool—agents see available skills and can load the full content when needed.

Create one folder per skill name and put a SKILL.md inside it. OpenCode searches these locations:

For project-local paths, OpenCode walks up from your current working directory until it reaches the git worktree. It loads any matching skills/*/SKILL.md in .opencode/ and any matching .claude/skills/*/SKILL.md along the way.

Global definitions are also loaded from ~/.config/opencode/skills/*/SKILL.md and ~/.claude/skills/*/SKILL.md.

Each SKILL.md must start with YAML frontmatter. Only these fields are recognized:

Unknown frontmatter fields are ignored.

description must be 1-1024 characters. Keep it specific enough for the agent to choose correctly.

Create .opencode/skills/git-release/SKILL.md like this:

OpenCode lists available skills in the skill tool description. Each entry includes the skill name and description:

The agent loads a skill by calling the tool:

Control which skills agents can access using pattern-based permissions in opencode.json:

Patterns support wildcards: internal-* matches internal-docs, internal-tools, etc.

Give specific agents different permissions than the global defaults.

For custom agents (in agent frontmatter):

For built-in agents (in opencode.json):

Completely disable skills for agents that shouldn’t use them:

When disabled, the <available_skills> section is omitted entirely.

If a skill does not show up:

**Examples:**

Example 1 (typescript):
```typescript
.opencode/skills/<name>/SKILL.md
```

Example 2 (typescript):
```typescript
~/.config/opencode/skills/<name>/SKILL.md
```

Example 3 (typescript):
```typescript
.claude/skills/<name>/SKILL.md
```

Example 4 (typescript):
```typescript
~/.claude/skills/<name>/SKILL.md
```

---

## Rules | OpenCode

**URL:** https://opencode.ai/docs/rules

**Contents:**
- Rules
- Initialize
- Example
- Types
  - Project
  - Global
  - Claude Code Compatibility
- Precedence
- Custom Instructions
- Referencing External Files

Set custom instructions for opencode.

You can provide custom instructions to opencode by creating an AGENTS.md file. This is similar to Cursor’s rules. It contains instructions that will be included in the LLM’s context to customize its behavior for your specific project.

To create a new AGENTS.md file, you can run the /init command in opencode.

You should commit your project’s AGENTS.md file to Git.

This will scan your project and all its contents to understand what the project is about and generate an AGENTS.md file with it. This helps opencode to navigate the project better.

If you have an existing AGENTS.md file, this will try to add to it.

You can also just create this file manually. Here’s an example of some things you can put into an AGENTS.md file.

We are adding project-specific instructions here and this will be shared across your team.

opencode also supports reading the AGENTS.md file from multiple locations. And this serves different purposes.

Place an AGENTS.md in your project root for project-specific rules. These only apply when you are working in this directory or its sub-directories.

You can also have global rules in a ~/.config/opencode/AGENTS.md file. This gets applied across all opencode sessions.

Since this isn’t committed to Git or shared with your team, we recommend using this to specify any personal rules that the LLM should follow.

For users migrating from Claude Code, OpenCode supports Claude Code’s file conventions as fallbacks:

To disable Claude Code compatibility, set one of these environment variables:

When opencode starts, it looks for rule files in this order:

The first matching file wins in each category. For example, if you have both AGENTS.md and CLAUDE.md, only AGENTS.md is used. Similarly, ~/.config/opencode/AGENTS.md takes precedence over ~/.claude/CLAUDE.md.

You can specify custom instruction files in your opencode.json or the global ~/.config/opencode/opencode.json. This allows you and your team to reuse existing rules rather than having to duplicate them to AGENTS.md.

You can also use remote URLs to load instructions from the web.

Remote instructions are fetched with a 5 second timeout.

All instruction files are combined with your AGENTS.md files.

While opencode doesn’t automatically parse file references in AGENTS.md, you can achieve similar functionality in two ways:

The recommended approach is to use the instructions field in opencode.json:

You can teach opencode to read external files by providing explicit instructions in your AGENTS.md. Here’s a practical example:

This approach allows you to:

For monorepos or projects with shared standards, using opencode.json with glob patterns (like packages/*/AGENTS.md) is more maintainable than manual instructions.

**Examples:**

Example 1 (markdown):
```markdown
# SST v3 Monorepo Project
This is an SST v3 monorepo with TypeScript. The project uses bun workspaces for package management.
## Project Structure
- `packages/` - Contains all workspace packages (functions, core, web, etc.)- `infra/` - Infrastructure definitions split by service (storage.ts, api.ts, web.ts)- `sst.config.ts` - Main SST configuration with dynamic imports
## Code Standards
- Use TypeScript with strict mode enabled- Shared code goes in `packages/core/` with proper exports configuration- Functions go in `packages/functions/`- Infrastructure should be split into logical files in `infra/`
## Monorepo Conventions
- Import shared modules using workspace names: `@my-app/core/example`
```

Example 2 (markdown):
```markdown
# SST v3 Monorepo Project
This is an SST v3 monorepo with TypeScript. The project uses bun workspaces for package management.
## Project Structure
- `packages/` - Contains all workspace packages (functions, core, web, etc.)- `infra/` - Infrastructure definitions split by service (storage.ts, api.ts, web.ts)- `sst.config.ts` - Main SST configuration with dynamic imports
## Code Standards
- Use TypeScript with strict mode enabled- Shared code goes in `packages/core/` with proper exports configuration- Functions go in `packages/functions/`- Infrastructure should be split into logical files in `infra/`
## Monorepo Conventions
- Import shared modules using workspace names: `@my-app/core/example`
```

Example 3 (unknown):
```unknown
~/.config/opencode/AGENTS.md
```

Example 4 (unknown):
```unknown
~/.claude/CLAUDE.md
```

---

## ACP Support | OpenCode

**URL:** https://opencode.ai/docs/acp/

**Contents:**
- ACP Support
- Configure
  - Zed
  - JetBrains IDEs
  - Avante.nvim
  - CodeCompanion.nvim
- Support

Use OpenCode in any ACP-compatible editor.

OpenCode supports the Agent Client Protocol or (ACP), allowing you to use it directly in compatible editors and IDEs.

For a list of editors and tools that support ACP, check out the ACP progress report.

ACP is an open protocol that standardizes communication between code editors and AI coding agents.

To use OpenCode via ACP, configure your editor to run the opencode acp command.

The command starts OpenCode as an ACP-compatible subprocess that communicates with your editor over JSON-RPC via stdio.

Below are examples for popular editors that support ACP.

Add to your Zed configuration (~/.config/zed/settings.json):

To open it, use the agent: new thread action in the Command Palette.

You can also bind a keyboard shortcut by editing your keymap.json:

Add to your JetBrains IDE acp.json according to the documentation:

To open it, use the new ‘OpenCode’ agent in the AI Chat agent selector.

Add to your Avante.nvim configuration:

If you need to pass environment variables:

To use OpenCode as an ACP agent in CodeCompanion.nvim, add the following to your Neovim config:

This config sets up CodeCompanion to use OpenCode as the ACP agent for chat.

If you need to pass environment variables (like OPENCODE_API_KEY), refer to Configuring Adapters: Environment Variables in the CodeCompanion.nvim documentation for full details.

OpenCode works the same via ACP as it does in the terminal. All features are supported:

Some built-in slash commands like /undo and /redo are currently unsupported.

**Examples:**

Example 1 (unknown):
```unknown
opencode acp
```

Example 2 (unknown):
```unknown
~/.config/zed/settings.json
```

Example 3 (json):
```json
{  "agent_servers": {    "OpenCode": {      "command": "opencode",      "args": ["acp"]    }  }}
```

Example 4 (json):
```json
{  "agent_servers": {    "OpenCode": {      "command": "opencode",      "args": ["acp"]    }  }}
```

---

## Agent Skills | OpenCode

**URL:** https://opencode.ai/docs/skills

**Contents:**
- Agent Skills
- Place files
- Understand discovery
- Write frontmatter
- Validate names
- Follow length rules
- Use an example
- Recognize tool description
- Configure permissions
- Override per agent

Define reusable behavior via SKILL.md definitions

Agent skills let OpenCode discover reusable instructions from your repo or home directory. Skills are loaded on-demand via the native skill tool—agents see available skills and can load the full content when needed.

Create one folder per skill name and put a SKILL.md inside it. OpenCode searches these locations:

For project-local paths, OpenCode walks up from your current working directory until it reaches the git worktree. It loads any matching skills/*/SKILL.md in .opencode/ and any matching .claude/skills/*/SKILL.md along the way.

Global definitions are also loaded from ~/.config/opencode/skills/*/SKILL.md and ~/.claude/skills/*/SKILL.md.

Each SKILL.md must start with YAML frontmatter. Only these fields are recognized:

Unknown frontmatter fields are ignored.

description must be 1-1024 characters. Keep it specific enough for the agent to choose correctly.

Create .opencode/skills/git-release/SKILL.md like this:

OpenCode lists available skills in the skill tool description. Each entry includes the skill name and description:

The agent loads a skill by calling the tool:

Control which skills agents can access using pattern-based permissions in opencode.json:

Patterns support wildcards: internal-* matches internal-docs, internal-tools, etc.

Give specific agents different permissions than the global defaults.

For custom agents (in agent frontmatter):

For built-in agents (in opencode.json):

Completely disable skills for agents that shouldn’t use them:

When disabled, the <available_skills> section is omitted entirely.

If a skill does not show up:

**Examples:**

Example 1 (typescript):
```typescript
.opencode/skills/<name>/SKILL.md
```

Example 2 (typescript):
```typescript
~/.config/opencode/skills/<name>/SKILL.md
```

Example 3 (typescript):
```typescript
.claude/skills/<name>/SKILL.md
```

Example 4 (typescript):
```typescript
~/.claude/skills/<name>/SKILL.md
```

---

## Rules | OpenCode

**URL:** https://opencode.ai/docs/rules/

**Contents:**
- Rules
- Initialize
- Example
- Types
  - Project
  - Global
  - Claude Code Compatibility
- Precedence
- Custom Instructions
- Referencing External Files

Set custom instructions for opencode.

You can provide custom instructions to opencode by creating an AGENTS.md file. This is similar to Cursor’s rules. It contains instructions that will be included in the LLM’s context to customize its behavior for your specific project.

To create a new AGENTS.md file, you can run the /init command in opencode.

You should commit your project’s AGENTS.md file to Git.

This will scan your project and all its contents to understand what the project is about and generate an AGENTS.md file with it. This helps opencode to navigate the project better.

If you have an existing AGENTS.md file, this will try to add to it.

You can also just create this file manually. Here’s an example of some things you can put into an AGENTS.md file.

We are adding project-specific instructions here and this will be shared across your team.

opencode also supports reading the AGENTS.md file from multiple locations. And this serves different purposes.

Place an AGENTS.md in your project root for project-specific rules. These only apply when you are working in this directory or its sub-directories.

You can also have global rules in a ~/.config/opencode/AGENTS.md file. This gets applied across all opencode sessions.

Since this isn’t committed to Git or shared with your team, we recommend using this to specify any personal rules that the LLM should follow.

For users migrating from Claude Code, OpenCode supports Claude Code’s file conventions as fallbacks:

To disable Claude Code compatibility, set one of these environment variables:

When opencode starts, it looks for rule files in this order:

The first matching file wins in each category. For example, if you have both AGENTS.md and CLAUDE.md, only AGENTS.md is used. Similarly, ~/.config/opencode/AGENTS.md takes precedence over ~/.claude/CLAUDE.md.

You can specify custom instruction files in your opencode.json or the global ~/.config/opencode/opencode.json. This allows you and your team to reuse existing rules rather than having to duplicate them to AGENTS.md.

You can also use remote URLs to load instructions from the web.

Remote instructions are fetched with a 5 second timeout.

All instruction files are combined with your AGENTS.md files.

While opencode doesn’t automatically parse file references in AGENTS.md, you can achieve similar functionality in two ways:

The recommended approach is to use the instructions field in opencode.json:

You can teach opencode to read external files by providing explicit instructions in your AGENTS.md. Here’s a practical example:

This approach allows you to:

For monorepos or projects with shared standards, using opencode.json with glob patterns (like packages/*/AGENTS.md) is more maintainable than manual instructions.

**Examples:**

Example 1 (markdown):
```markdown
# SST v3 Monorepo Project
This is an SST v3 monorepo with TypeScript. The project uses bun workspaces for package management.
## Project Structure
- `packages/` - Contains all workspace packages (functions, core, web, etc.)- `infra/` - Infrastructure definitions split by service (storage.ts, api.ts, web.ts)- `sst.config.ts` - Main SST configuration with dynamic imports
## Code Standards
- Use TypeScript with strict mode enabled- Shared code goes in `packages/core/` with proper exports configuration- Functions go in `packages/functions/`- Infrastructure should be split into logical files in `infra/`
## Monorepo Conventions
- Import shared modules using workspace names: `@my-app/core/example`
```

Example 2 (markdown):
```markdown
# SST v3 Monorepo Project
This is an SST v3 monorepo with TypeScript. The project uses bun workspaces for package management.
## Project Structure
- `packages/` - Contains all workspace packages (functions, core, web, etc.)- `infra/` - Infrastructure definitions split by service (storage.ts, api.ts, web.ts)- `sst.config.ts` - Main SST configuration with dynamic imports
## Code Standards
- Use TypeScript with strict mode enabled- Shared code goes in `packages/core/` with proper exports configuration- Functions go in `packages/functions/`- Infrastructure should be split into logical files in `infra/`
## Monorepo Conventions
- Import shared modules using workspace names: `@my-app/core/example`
```

Example 3 (unknown):
```unknown
~/.config/opencode/AGENTS.md
```

Example 4 (unknown):
```unknown
~/.claude/CLAUDE.md
```

---

## Agents | OpenCode

**URL:** https://opencode.ai/docs/agents

**Contents:**
- Agents
- Types
  - Primary agents
  - Subagents
- Built-in
  - Build
  - Plan
  - General
  - Explore
- Usage

Configure and use specialized agents.

Agents are specialized AI assistants that can be configured for specific tasks and workflows. They allow you to create focused tools with custom prompts, models, and tool access.

Use the plan agent to analyze code and review suggestions without making any code changes.

You can switch between agents during a session or invoke them with the @ mention.

There are two types of agents in OpenCode; primary agents and subagents.

Primary agents are the main assistants you interact with directly. You can cycle through them using the Tab key, or your configured switch_agent keybind. These agents handle your main conversation. Tool access is configured via permissions — for example, Build has all tools enabled while Plan is restricted.

You can use the Tab key to switch between primary agents during a session.

OpenCode comes with two built-in primary agents, Build and Plan. We’ll look at these below.

Subagents are specialized assistants that primary agents can invoke for specific tasks. You can also manually invoke them by @ mentioning them in your messages.

OpenCode comes with two built-in subagents, General and Explore. We’ll look at this below.

OpenCode comes with two built-in primary agents and two built-in subagents.

Build is the default primary agent with all tools enabled. This is the standard agent for development work where you need full access to file operations and system commands.

A restricted agent designed for planning and analysis. We use a permission system to give you more control and prevent unintended changes. By default, all of the following are set to ask:

This agent is useful when you want the LLM to analyze code, suggest changes, or create plans without making any actual modifications to your codebase.

A general-purpose agent for researching complex questions and executing multi-step tasks. Has full tool access (except todo), so it can make file changes when needed. Use this to run multiple units of work in parallel.

A fast, read-only agent for exploring codebases. Cannot modify files. Use this when you need to quickly find files by patterns, search code for keywords, or answer questions about the codebase.

For primary agents, use the Tab key to cycle through them during a session. You can also use your configured switch_agent keybind.

Subagents can be invoked:

Automatically by primary agents for specialized tasks based on their descriptions.

Manually by @ mentioning a subagent in your message. For example.

Navigation between sessions: When subagents create their own child sessions, you can navigate between the parent session and all child sessions using:

This allows you to seamlessly switch between the main conversation and specialized subagent work.

You can customize the built-in agents or create your own through configuration. Agents can be configured in two ways:

Configure agents in your opencode.json config file:

You can also define agents using markdown files. Place them in:

The markdown file name becomes the agent name. For example, review.md creates a review agent.

Let’s look at these configuration options in detail.

Use the description option to provide a brief description of what the agent does and when to use it.

This is a required config option.

Control the randomness and creativity of the LLM’s responses with the temperature config.

Lower values make responses more focused and deterministic, while higher values increase creativity and variability.

Temperature values typically range from 0.0 to 1.0:

If no temperature is specified, OpenCode uses model-specific defaults; typically 0 for most models, 0.55 for Qwen models.

Control the maximum number of agentic iterations an agent can perform before being forced to respond with text only. This allows users who wish to control costs to set a limit on agentic actions.

If this is not set, the agent will continue to iterate until the model chooses to stop or the user interrupts the session.

When the limit is reached, the agent receives a special system prompt instructing it to respond with a summarization of its work and recommended remaining tasks.

Set to true to disable the agent.

Specify a custom system prompt file for this agent with the prompt config. The prompt file should contain instructions specific to the agent’s purpose.

This path is relative to where the config file is located. So this works for both the global OpenCode config and the project specific config.

Use the model config to override the model for this agent. Useful for using different models optimized for different tasks. For example, a faster model for planning, a more capable model for implementation.

If you don’t specify a model, primary agents use the model globally configured while subagents will use the model of the primary agent that invoked the subagent.

The model ID in your OpenCode config uses the format provider/model-id. For example, if you’re using OpenCode Zen, you would use opencode/gpt-5.1-codex for GPT 5.1 Codex.

Control which tools are available in this agent with the tools config. You can enable or disable specific tools by setting them to true or false.

The agent-specific config overrides the global config.

You can also use wildcards to control multiple tools at once. For example, to disable all tools from an MCP server:

Learn more about tools.

You can configure permissions to manage what actions an agent can take. Currently, the permissions for the edit, bash, and webfetch tools can be configured to:

You can override these permissions per agent.

You can also set permissions in Markdown agents.

You can set permissions for specific bash commands.

This can take a glob pattern.

And you can also use the * wildcard to manage permissions for all commands. Since the last matching rule takes precedence, put the * wildcard first and specific rules after.

Learn more about permissions.

Control the agent’s mode with the mode config. The mode option is used to determine how the agent can be used.

The mode option can be set to primary, subagent, or all. If no mode is specified, it defaults to all.

Hide a subagent from the @ autocomplete menu with hidden: true. Useful for internal subagents that should only be invoked programmatically by other agents via the Task tool.

This only affects user visibility in the autocomplete menu. Hidden agents can still be invoked by the model via the Task tool if permissions allow.

Only applies to mode: subagent agents.

Control which subagents an agent can invoke via the Task tool with permission.task. Uses glob patterns for flexible matching.

When set to deny, the subagent is removed from the Task tool description entirely, so the model won’t attempt to invoke it.

Rules are evaluated in order, and the last matching rule wins. In the example above, orchestrator-planner matches both * (deny) and orchestrator-* (allow), but since orchestrator-* comes after *, the result is allow.

Users can always invoke any subagent directly via the @ autocomplete menu, even if the agent’s task permissions would deny it.

Any other options you specify in your agent configuration will be passed through directly to the provider as model options. This allows you to use provider-specific features and parameters.

For example, with OpenAI’s reasoning models, you can control the reasoning effort:

These additional options are model and provider-specific. Check your provider’s documentation for available parameters.

Run opencode models to see a list of the available models.

You can create new agents using the following command:

This interactive command will:

Here are some common use cases for different agents.

Here are some example agents you might find useful.

Do you have an agent you’d like to share? Submit a PR.

**Examples:**

Example 1 (unknown):
```unknown
switch_agent
```

Example 2 (unknown):
```unknown
switch_agent
```

Example 3 (python):
```python
@general help me search for this function
```

Example 4 (python):
```python
@general help me search for this function
```

---

## Agents | OpenCode

**URL:** https://opencode.ai/docs/agents/

**Contents:**
- Agents
- Types
  - Primary agents
  - Subagents
- Built-in
  - Build
  - Plan
  - General
  - Explore
- Usage

Configure and use specialized agents.

Agents are specialized AI assistants that can be configured for specific tasks and workflows. They allow you to create focused tools with custom prompts, models, and tool access.

Use the plan agent to analyze code and review suggestions without making any code changes.

You can switch between agents during a session or invoke them with the @ mention.

There are two types of agents in OpenCode; primary agents and subagents.

Primary agents are the main assistants you interact with directly. You can cycle through them using the Tab key, or your configured switch_agent keybind. These agents handle your main conversation. Tool access is configured via permissions — for example, Build has all tools enabled while Plan is restricted.

You can use the Tab key to switch between primary agents during a session.

OpenCode comes with two built-in primary agents, Build and Plan. We’ll look at these below.

Subagents are specialized assistants that primary agents can invoke for specific tasks. You can also manually invoke them by @ mentioning them in your messages.

OpenCode comes with two built-in subagents, General and Explore. We’ll look at this below.

OpenCode comes with two built-in primary agents and two built-in subagents.

Build is the default primary agent with all tools enabled. This is the standard agent for development work where you need full access to file operations and system commands.

A restricted agent designed for planning and analysis. We use a permission system to give you more control and prevent unintended changes. By default, all of the following are set to ask:

This agent is useful when you want the LLM to analyze code, suggest changes, or create plans without making any actual modifications to your codebase.

A general-purpose agent for researching complex questions and executing multi-step tasks. Has full tool access (except todo), so it can make file changes when needed. Use this to run multiple units of work in parallel.

A fast, read-only agent for exploring codebases. Cannot modify files. Use this when you need to quickly find files by patterns, search code for keywords, or answer questions about the codebase.

For primary agents, use the Tab key to cycle through them during a session. You can also use your configured switch_agent keybind.

Subagents can be invoked:

Automatically by primary agents for specialized tasks based on their descriptions.

Manually by @ mentioning a subagent in your message. For example.

Navigation between sessions: When subagents create their own child sessions, you can navigate between the parent session and all child sessions using:

This allows you to seamlessly switch between the main conversation and specialized subagent work.

You can customize the built-in agents or create your own through configuration. Agents can be configured in two ways:

Configure agents in your opencode.json config file:

You can also define agents using markdown files. Place them in:

The markdown file name becomes the agent name. For example, review.md creates a review agent.

Let’s look at these configuration options in detail.

Use the description option to provide a brief description of what the agent does and when to use it.

This is a required config option.

Control the randomness and creativity of the LLM’s responses with the temperature config.

Lower values make responses more focused and deterministic, while higher values increase creativity and variability.

Temperature values typically range from 0.0 to 1.0:

If no temperature is specified, OpenCode uses model-specific defaults; typically 0 for most models, 0.55 for Qwen models.

Control the maximum number of agentic iterations an agent can perform before being forced to respond with text only. This allows users who wish to control costs to set a limit on agentic actions.

If this is not set, the agent will continue to iterate until the model chooses to stop or the user interrupts the session.

When the limit is reached, the agent receives a special system prompt instructing it to respond with a summarization of its work and recommended remaining tasks.

Set to true to disable the agent.

Specify a custom system prompt file for this agent with the prompt config. The prompt file should contain instructions specific to the agent’s purpose.

This path is relative to where the config file is located. So this works for both the global OpenCode config and the project specific config.

Use the model config to override the model for this agent. Useful for using different models optimized for different tasks. For example, a faster model for planning, a more capable model for implementation.

If you don’t specify a model, primary agents use the model globally configured while subagents will use the model of the primary agent that invoked the subagent.

The model ID in your OpenCode config uses the format provider/model-id. For example, if you’re using OpenCode Zen, you would use opencode/gpt-5.1-codex for GPT 5.1 Codex.

Control which tools are available in this agent with the tools config. You can enable or disable specific tools by setting them to true or false.

The agent-specific config overrides the global config.

You can also use wildcards to control multiple tools at once. For example, to disable all tools from an MCP server:

Learn more about tools.

You can configure permissions to manage what actions an agent can take. Currently, the permissions for the edit, bash, and webfetch tools can be configured to:

You can override these permissions per agent.

You can also set permissions in Markdown agents.

You can set permissions for specific bash commands.

This can take a glob pattern.

And you can also use the * wildcard to manage permissions for all commands. Since the last matching rule takes precedence, put the * wildcard first and specific rules after.

Learn more about permissions.

Control the agent’s mode with the mode config. The mode option is used to determine how the agent can be used.

The mode option can be set to primary, subagent, or all. If no mode is specified, it defaults to all.

Hide a subagent from the @ autocomplete menu with hidden: true. Useful for internal subagents that should only be invoked programmatically by other agents via the Task tool.

This only affects user visibility in the autocomplete menu. Hidden agents can still be invoked by the model via the Task tool if permissions allow.

Only applies to mode: subagent agents.

Control which subagents an agent can invoke via the Task tool with permission.task. Uses glob patterns for flexible matching.

When set to deny, the subagent is removed from the Task tool description entirely, so the model won’t attempt to invoke it.

Rules are evaluated in order, and the last matching rule wins. In the example above, orchestrator-planner matches both * (deny) and orchestrator-* (allow), but since orchestrator-* comes after *, the result is allow.

Users can always invoke any subagent directly via the @ autocomplete menu, even if the agent’s task permissions would deny it.

Any other options you specify in your agent configuration will be passed through directly to the provider as model options. This allows you to use provider-specific features and parameters.

For example, with OpenAI’s reasoning models, you can control the reasoning effort:

These additional options are model and provider-specific. Check your provider’s documentation for available parameters.

Run opencode models to see a list of the available models.

You can create new agents using the following command:

This interactive command will:

Here are some common use cases for different agents.

Here are some example agents you might find useful.

Do you have an agent you’d like to share? Submit a PR.

**Examples:**

Example 1 (unknown):
```unknown
switch_agent
```

Example 2 (unknown):
```unknown
switch_agent
```

Example 3 (python):
```python
@general help me search for this function
```

Example 4 (python):
```python
@general help me search for this function
```

---

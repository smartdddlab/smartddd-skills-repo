# Opencode - Configuration

**Pages:** 6

---

## Network | OpenCode

**URL:** https://opencode.ai/docs/network

**Contents:**
- Network
- Proxy
  - Authenticate
- Custom certificates

Configure proxies and custom certificates.

OpenCode supports standard proxy environment variables and custom certificates for enterprise network environments.

OpenCode respects standard proxy environment variables.

The TUI communicates with a local HTTP server. You must bypass the proxy for this connection to prevent routing loops.

You can configure the server’s port and hostname using CLI flags.

If your proxy requires basic authentication, include credentials in the URL.

Avoid hardcoding passwords. Use environment variables or secure credential storage.

For proxies requiring advanced authentication like NTLM or Kerberos, consider using an LLM Gateway that supports your authentication method.

If your enterprise uses custom CAs for HTTPS connections, configure OpenCode to trust them.

This works for both proxy connections and direct API access.

**Examples:**

Example 1 (markdown):
```markdown
# HTTPS proxy (recommended)export HTTPS_PROXY=https://proxy.example.com:8080
# HTTP proxy (if HTTPS not available)export HTTP_PROXY=http://proxy.example.com:8080
# Bypass proxy for local server (required)export NO_PROXY=localhost,127.0.0.1
```

Example 2 (markdown):
```markdown
# HTTPS proxy (recommended)export HTTPS_PROXY=https://proxy.example.com:8080
# HTTP proxy (if HTTPS not available)export HTTP_PROXY=http://proxy.example.com:8080
# Bypass proxy for local server (required)export NO_PROXY=localhost,127.0.0.1
```

Example 3 (python):
```python
export HTTPS_PROXY=http://username:password@proxy.example.com:8080
```

Example 4 (python):
```python
export HTTPS_PROXY=http://username:password@proxy.example.com:8080
```

---

## SDK | OpenCode

**URL:** https://opencode.ai/docs/sdk/

**Contents:**
- SDK
- Install
- Create client
    - Options
- Config
- Client only
    - Options
- Types
- Errors
- APIs

Type-safe JS client for opencode server.

The opencode JS/TS SDK provides a type-safe client for interacting with the server. Use it to build integrations and control opencode programmatically.

Learn more about how the server works. For examples, check out the projects built by the community.

Install the SDK from npm:

Create an instance of opencode:

This starts both a server and a client

You can pass a configuration object to customize behavior. The instance still picks up your opencode.json, but you can override or add configuration inline:

If you already have a running instance of opencode, you can create a client instance to connect to it:

The SDK includes TypeScript definitions for all API types. Import them directly:

All types are generated from the server’s OpenAPI specification and available in the types file.

The SDK can throw errors that you can catch and handle:

The SDK exposes all server APIs through a type-safe client.

find.files supports a few optional query fields:

**Examples:**

Example 1 (python):
```python
npm install @opencode-ai/sdk
```

Example 2 (python):
```python
npm install @opencode-ai/sdk
```

Example 3 (python):
```python
import { createOpencode } from "@opencode-ai/sdk"
const { client } = await createOpencode()
```

Example 4 (python):
```python
import { createOpencode } from "@opencode-ai/sdk"
const { client } = await createOpencode()
```

---

## SDK | OpenCode

**URL:** https://opencode.ai/docs/sdk

**Contents:**
- SDK
- Install
- Create client
    - Options
- Config
- Client only
    - Options
- Types
- Errors
- APIs

Type-safe JS client for opencode server.

The opencode JS/TS SDK provides a type-safe client for interacting with the server. Use it to build integrations and control opencode programmatically.

Learn more about how the server works. For examples, check out the projects built by the community.

Install the SDK from npm:

Create an instance of opencode:

This starts both a server and a client

You can pass a configuration object to customize behavior. The instance still picks up your opencode.json, but you can override or add configuration inline:

If you already have a running instance of opencode, you can create a client instance to connect to it:

The SDK includes TypeScript definitions for all API types. Import them directly:

All types are generated from the server’s OpenAPI specification and available in the types file.

The SDK can throw errors that you can catch and handle:

The SDK exposes all server APIs through a type-safe client.

find.files supports a few optional query fields:

**Examples:**

Example 1 (python):
```python
npm install @opencode-ai/sdk
```

Example 2 (python):
```python
npm install @opencode-ai/sdk
```

Example 3 (python):
```python
import { createOpencode } from "@opencode-ai/sdk"
const { client } = await createOpencode()
```

Example 4 (python):
```python
import { createOpencode } from "@opencode-ai/sdk"
const { client } = await createOpencode()
```

---

## Config | OpenCode

**URL:** https://opencode.ai/docs/config/

**Contents:**
- Config
- Format
- Locations
  - Precedence order
  - Remote
  - Global
  - Per project
  - Custom path
  - Custom directory
- Schema

Using the OpenCode JSON config.

You can configure OpenCode using a JSON config file.

OpenCode supports both JSON and JSONC (JSON with Comments) formats.

You can place your config in a couple of different locations and they have a different order of precedence.

Configuration files are merged together, not replaced.

Configuration files are merged together, not replaced. Settings from the following config locations are combined. Later configs override earlier ones only for conflicting keys. Non-conflicting settings from all configs are preserved.

For example, if your global config sets theme: "opencode" and autoupdate: true, and your project config sets model: "anthropic/claude-sonnet-4-5", the final configuration will include all three settings.

Config sources are loaded in this order (later sources override earlier ones):

This means project configs can override global defaults, and global configs can override remote organizational defaults.

The .opencode and ~/.config/opencode directories use plural names for subdirectories: agents/, commands/, modes/, plugins/, skills/, tools/, and themes/. Singular names (e.g., agent/) are also supported for backwards compatibility.

Organizations can provide default configuration via the .well-known/opencode endpoint. This is fetched automatically when you authenticate with a provider that supports it.

Remote config is loaded first, serving as the base layer. All other config sources (global, project) can override these defaults.

For example, if your organization provides MCP servers that are disabled by default:

You can enable specific servers in your local config:

Place your global OpenCode config in ~/.config/opencode/opencode.json. Use global config for user-wide preferences like themes, providers, or keybinds.

Global config overrides remote organizational defaults.

Add opencode.json in your project root. Project config has the highest precedence among standard config files - it overrides both global and remote configs.

Place project specific config in the root of your project.

When OpenCode starts up, it looks for a config file in the current directory or traverse up to the nearest Git directory.

This is also safe to be checked into Git and uses the same schema as the global one.

Specify a custom config file path using the OPENCODE_CONFIG environment variable.

Custom config is loaded between global and project configs in the precedence order.

Specify a custom config directory using the OPENCODE_CONFIG_DIR environment variable. This directory will be searched for agents, commands, modes, and plugins just like the standard .opencode directory, and should follow the same structure.

The custom directory is loaded after the global config and .opencode directories, so it can override their settings.

The config file has a schema that’s defined in opencode.ai/config.json.

Your editor should be able to validate and autocomplete based on the schema.

You can configure TUI-specific settings through the tui option.

Learn more about using the TUI here.

You can configure server settings for the opencode serve and opencode web commands through the server option.

Learn more about the server here.

You can manage the tools an LLM can use through the tools option.

Learn more about tools here.

You can configure the providers and models you want to use in your OpenCode config through the provider, model and small_model options.

The small_model option configures a separate model for lightweight tasks like title generation. By default, OpenCode tries to use a cheaper model if one is available from your provider, otherwise it falls back to your main model.

Provider options can include timeout and setCacheKey:

You can also configure local models. Learn more.

Some providers support additional configuration options beyond the generic timeout and apiKey settings.

Amazon Bedrock supports AWS-specific configuration:

Bearer tokens (AWS_BEARER_TOKEN_BEDROCK or /connect) take precedence over profile-based authentication. See authentication precedence for details.

Learn more about Amazon Bedrock configuration.

You can configure the theme you want to use in your OpenCode config through the theme option.

You can configure specialized agents for specific tasks through the agent option.

You can also define agents using markdown files in ~/.config/opencode/agents/ or .opencode/agents/. Learn more here.

You can set the default agent using the default_agent option. This determines which agent is used when none is explicitly specified.

The default agent must be a primary agent (not a subagent). This can be a built-in agent like "build" or "plan", or a custom agent you’ve defined. If the specified agent doesn’t exist or is a subagent, OpenCode will fall back to "build" with a warning.

This setting applies across all interfaces: TUI, CLI (opencode run), desktop app, and GitHub Action.

You can configure the share feature through the share option.

By default, sharing is set to manual mode where you need to explicitly share conversations using the /share command.

You can configure custom commands for repetitive tasks through the command option.

You can also define commands using markdown files in ~/.config/opencode/commands/ or .opencode/commands/. Learn more here.

You can customize your keybinds through the keybinds option.

OpenCode will automatically download any new updates when it starts up. You can disable this with the autoupdate option.

If you don’t want updates but want to be notified when a new version is available, set autoupdate to "notify". Notice that this only works if it was not installed using a package manager such as Homebrew.

You can configure code formatters through the formatter option.

Learn more about formatters here.

By default, opencode allows all operations without requiring explicit approval. You can change this using the permission option.

For example, to ensure that the edit and bash tools require user approval:

Learn more about permissions here.

You can control context compaction behavior through the compaction option.

You can configure file watcher ignore patterns through the watcher option.

Patterns follow glob syntax. Use this to exclude noisy directories from file watching.

You can configure MCP servers you want to use through the mcp option.

Plugins extend OpenCode with custom tools, hooks, and integrations.

Place plugin files in .opencode/plugins/ or ~/.config/opencode/plugins/. You can also load plugins from npm through the plugin option.

You can configure the instructions for the model you’re using through the instructions option.

This takes an array of paths and glob patterns to instruction files. Learn more about rules here.

You can disable providers that are loaded automatically through the disabled_providers option. This is useful when you want to prevent certain providers from being loaded even if their credentials are available.

The disabled_providers takes priority over enabled_providers.

The disabled_providers option accepts an array of provider IDs. When a provider is disabled:

You can specify an allowlist of providers through the enabled_providers option. When set, only the specified providers will be enabled and all others will be ignored.

This is useful when you want to restrict OpenCode to only use specific providers rather than disabling them one by one.

The disabled_providers takes priority over enabled_providers.

If a provider appears in both enabled_providers and disabled_providers, the disabled_providers takes priority for backwards compatibility.

The experimental key contains options that are under active development.

Experimental options are not stable. They may change or be removed without notice.

You can use variable substitution in your config files to reference environment variables and file contents.

Use {env:VARIABLE_NAME} to substitute environment variables:

If the environment variable is not set, it will be replaced with an empty string.

Use {file:path/to/file} to substitute the contents of a file:

These are useful for:

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  // Theme configuration  "theme": "opencode",  "model": "anthropic/claude-sonnet-4-5",  "autoupdate": true,}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  // Theme configuration  "theme": "opencode",  "model": "anthropic/claude-sonnet-4-5",  "autoupdate": true,}
```

Example 3 (yaml):
```yaml
theme: "opencode"
```

Example 4 (yaml):
```yaml
autoupdate: true
```

---

## Config | OpenCode

**URL:** https://opencode.ai/docs/config

**Contents:**
- Config
- Format
- Locations
  - Precedence order
  - Remote
  - Global
  - Per project
  - Custom path
  - Custom directory
- Schema

Using the OpenCode JSON config.

You can configure OpenCode using a JSON config file.

OpenCode supports both JSON and JSONC (JSON with Comments) formats.

You can place your config in a couple of different locations and they have a different order of precedence.

Configuration files are merged together, not replaced.

Configuration files are merged together, not replaced. Settings from the following config locations are combined. Later configs override earlier ones only for conflicting keys. Non-conflicting settings from all configs are preserved.

For example, if your global config sets theme: "opencode" and autoupdate: true, and your project config sets model: "anthropic/claude-sonnet-4-5", the final configuration will include all three settings.

Config sources are loaded in this order (later sources override earlier ones):

This means project configs can override global defaults, and global configs can override remote organizational defaults.

The .opencode and ~/.config/opencode directories use plural names for subdirectories: agents/, commands/, modes/, plugins/, skills/, tools/, and themes/. Singular names (e.g., agent/) are also supported for backwards compatibility.

Organizations can provide default configuration via the .well-known/opencode endpoint. This is fetched automatically when you authenticate with a provider that supports it.

Remote config is loaded first, serving as the base layer. All other config sources (global, project) can override these defaults.

For example, if your organization provides MCP servers that are disabled by default:

You can enable specific servers in your local config:

Place your global OpenCode config in ~/.config/opencode/opencode.json. Use global config for user-wide preferences like themes, providers, or keybinds.

Global config overrides remote organizational defaults.

Add opencode.json in your project root. Project config has the highest precedence among standard config files - it overrides both global and remote configs.

Place project specific config in the root of your project.

When OpenCode starts up, it looks for a config file in the current directory or traverse up to the nearest Git directory.

This is also safe to be checked into Git and uses the same schema as the global one.

Specify a custom config file path using the OPENCODE_CONFIG environment variable.

Custom config is loaded between global and project configs in the precedence order.

Specify a custom config directory using the OPENCODE_CONFIG_DIR environment variable. This directory will be searched for agents, commands, modes, and plugins just like the standard .opencode directory, and should follow the same structure.

The custom directory is loaded after the global config and .opencode directories, so it can override their settings.

The config file has a schema that’s defined in opencode.ai/config.json.

Your editor should be able to validate and autocomplete based on the schema.

You can configure TUI-specific settings through the tui option.

Learn more about using the TUI here.

You can configure server settings for the opencode serve and opencode web commands through the server option.

Learn more about the server here.

You can manage the tools an LLM can use through the tools option.

Learn more about tools here.

You can configure the providers and models you want to use in your OpenCode config through the provider, model and small_model options.

The small_model option configures a separate model for lightweight tasks like title generation. By default, OpenCode tries to use a cheaper model if one is available from your provider, otherwise it falls back to your main model.

Provider options can include timeout and setCacheKey:

You can also configure local models. Learn more.

Some providers support additional configuration options beyond the generic timeout and apiKey settings.

Amazon Bedrock supports AWS-specific configuration:

Bearer tokens (AWS_BEARER_TOKEN_BEDROCK or /connect) take precedence over profile-based authentication. See authentication precedence for details.

Learn more about Amazon Bedrock configuration.

You can configure the theme you want to use in your OpenCode config through the theme option.

You can configure specialized agents for specific tasks through the agent option.

You can also define agents using markdown files in ~/.config/opencode/agents/ or .opencode/agents/. Learn more here.

You can set the default agent using the default_agent option. This determines which agent is used when none is explicitly specified.

The default agent must be a primary agent (not a subagent). This can be a built-in agent like "build" or "plan", or a custom agent you’ve defined. If the specified agent doesn’t exist or is a subagent, OpenCode will fall back to "build" with a warning.

This setting applies across all interfaces: TUI, CLI (opencode run), desktop app, and GitHub Action.

You can configure the share feature through the share option.

By default, sharing is set to manual mode where you need to explicitly share conversations using the /share command.

You can configure custom commands for repetitive tasks through the command option.

You can also define commands using markdown files in ~/.config/opencode/commands/ or .opencode/commands/. Learn more here.

You can customize your keybinds through the keybinds option.

OpenCode will automatically download any new updates when it starts up. You can disable this with the autoupdate option.

If you don’t want updates but want to be notified when a new version is available, set autoupdate to "notify". Notice that this only works if it was not installed using a package manager such as Homebrew.

You can configure code formatters through the formatter option.

Learn more about formatters here.

By default, opencode allows all operations without requiring explicit approval. You can change this using the permission option.

For example, to ensure that the edit and bash tools require user approval:

Learn more about permissions here.

You can control context compaction behavior through the compaction option.

You can configure file watcher ignore patterns through the watcher option.

Patterns follow glob syntax. Use this to exclude noisy directories from file watching.

You can configure MCP servers you want to use through the mcp option.

Plugins extend OpenCode with custom tools, hooks, and integrations.

Place plugin files in .opencode/plugins/ or ~/.config/opencode/plugins/. You can also load plugins from npm through the plugin option.

You can configure the instructions for the model you’re using through the instructions option.

This takes an array of paths and glob patterns to instruction files. Learn more about rules here.

You can disable providers that are loaded automatically through the disabled_providers option. This is useful when you want to prevent certain providers from being loaded even if their credentials are available.

The disabled_providers takes priority over enabled_providers.

The disabled_providers option accepts an array of provider IDs. When a provider is disabled:

You can specify an allowlist of providers through the enabled_providers option. When set, only the specified providers will be enabled and all others will be ignored.

This is useful when you want to restrict OpenCode to only use specific providers rather than disabling them one by one.

The disabled_providers takes priority over enabled_providers.

If a provider appears in both enabled_providers and disabled_providers, the disabled_providers takes priority for backwards compatibility.

The experimental key contains options that are under active development.

Experimental options are not stable. They may change or be removed without notice.

You can use variable substitution in your config files to reference environment variables and file contents.

Use {env:VARIABLE_NAME} to substitute environment variables:

If the environment variable is not set, it will be replaced with an empty string.

Use {file:path/to/file} to substitute the contents of a file:

These are useful for:

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  // Theme configuration  "theme": "opencode",  "model": "anthropic/claude-sonnet-4-5",  "autoupdate": true,}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  // Theme configuration  "theme": "opencode",  "model": "anthropic/claude-sonnet-4-5",  "autoupdate": true,}
```

Example 3 (yaml):
```yaml
theme: "opencode"
```

Example 4 (yaml):
```yaml
autoupdate: true
```

---

## Network | OpenCode

**URL:** https://opencode.ai/docs/network/

**Contents:**
- Network
- Proxy
  - Authenticate
- Custom certificates

Configure proxies and custom certificates.

OpenCode supports standard proxy environment variables and custom certificates for enterprise network environments.

OpenCode respects standard proxy environment variables.

The TUI communicates with a local HTTP server. You must bypass the proxy for this connection to prevent routing loops.

You can configure the server’s port and hostname using CLI flags.

If your proxy requires basic authentication, include credentials in the URL.

Avoid hardcoding passwords. Use environment variables or secure credential storage.

For proxies requiring advanced authentication like NTLM or Kerberos, consider using an LLM Gateway that supports your authentication method.

If your enterprise uses custom CAs for HTTPS connections, configure OpenCode to trust them.

This works for both proxy connections and direct API access.

**Examples:**

Example 1 (markdown):
```markdown
# HTTPS proxy (recommended)export HTTPS_PROXY=https://proxy.example.com:8080
# HTTP proxy (if HTTPS not available)export HTTP_PROXY=http://proxy.example.com:8080
# Bypass proxy for local server (required)export NO_PROXY=localhost,127.0.0.1
```

Example 2 (markdown):
```markdown
# HTTPS proxy (recommended)export HTTPS_PROXY=https://proxy.example.com:8080
# HTTP proxy (if HTTPS not available)export HTTP_PROXY=http://proxy.example.com:8080
# Bypass proxy for local server (required)export NO_PROXY=localhost,127.0.0.1
```

Example 3 (python):
```python
export HTTPS_PROXY=http://username:password@proxy.example.com:8080
```

Example 4 (python):
```python
export HTTPS_PROXY=http://username:password@proxy.example.com:8080
```

---

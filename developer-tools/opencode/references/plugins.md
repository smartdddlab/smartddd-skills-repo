# Opencode - Plugins

**Pages:** 2

---

## Plugins | OpenCode

**URL:** https://opencode.ai/docs/plugins/

**Contents:**
- Plugins
- Use a plugin
  - From local files
  - From npm
  - How plugins are installed
  - Load order
- Create a plugin
  - Dependencies
  - Basic structure
  - TypeScript support

Write your own plugins to extend OpenCode.

Plugins allow you to extend OpenCode by hooking into various events and customizing behavior. You can create plugins to add new features, integrate with external services, or modify OpenCode’s default behavior.

For examples, check out the plugins created by the community.

There are two ways to load plugins.

Place JavaScript or TypeScript files in the plugin directory.

Files in these directories are automatically loaded at startup.

Specify npm packages in your config file.

Both regular and scoped npm packages are supported.

Browse available plugins in the ecosystem.

npm plugins are installed automatically using Bun at startup. Packages and their dependencies are cached in ~/.cache/opencode/node_modules/.

Local plugins are loaded directly from the plugin directory. To use external packages, you must create a package.json within your config directory (see Dependencies), or publish the plugin to npm and add it to your config.

Plugins are loaded from all sources and all hooks run in sequence. The load order is:

Duplicate npm packages with the same name and version are loaded once. However, a local plugin and an npm plugin with similar names are both loaded separately.

A plugin is a JavaScript/TypeScript module that exports one or more plugin functions. Each function receives a context object and returns a hooks object.

Local plugins and custom tools can use external npm packages. Add a package.json to your config directory with the dependencies you need.

OpenCode runs bun install at startup to install these. Your plugins and tools can then import them.

The plugin function receives:

For TypeScript plugins, you can import types from the plugin package:

Plugins can subscribe to events as seen below in the Examples section. Here is a list of the different events available.

Here are some examples of plugins you can use to extend opencode.

Send notifications when certain events occur:

We are using osascript to run AppleScript on macOS. Here we are using it to send notifications.

If you’re using the OpenCode desktop app, it can send system notifications automatically when a response is ready or when a session errors.

Prevent opencode from reading .env files:

Plugins can also add custom tools to opencode:

The tool helper creates a custom tool that opencode can call. It takes a Zod schema function and returns a tool definition with:

Your custom tools will be available to opencode alongside built-in tools.

Use client.app.log() instead of console.log for structured logging:

Levels: debug, info, warn, error. See SDK documentation for details.

Customize the context included when a session is compacted:

The experimental.session.compacting hook fires before the LLM generates a continuation summary. Use it to inject domain-specific context that the default compaction prompt would miss.

You can also replace the compaction prompt entirely by setting output.prompt:

When output.prompt is set, it completely replaces the default compaction prompt. The output.context array is ignored in this case.

**Examples:**

Example 1 (unknown):
```unknown
.opencode/plugins/
```

Example 2 (unknown):
```unknown
~/.config/opencode/plugins/
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "plugin": ["opencode-helicone-session", "opencode-wakatime", "@my-org/custom-plugin"]}
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "plugin": ["opencode-helicone-session", "opencode-wakatime", "@my-org/custom-plugin"]}
```

---

## Plugins | OpenCode

**URL:** https://opencode.ai/docs/plugins

**Contents:**
- Plugins
- Use a plugin
  - From local files
  - From npm
  - How plugins are installed
  - Load order
- Create a plugin
  - Dependencies
  - Basic structure
  - TypeScript support

Write your own plugins to extend OpenCode.

Plugins allow you to extend OpenCode by hooking into various events and customizing behavior. You can create plugins to add new features, integrate with external services, or modify OpenCode’s default behavior.

For examples, check out the plugins created by the community.

There are two ways to load plugins.

Place JavaScript or TypeScript files in the plugin directory.

Files in these directories are automatically loaded at startup.

Specify npm packages in your config file.

Both regular and scoped npm packages are supported.

Browse available plugins in the ecosystem.

npm plugins are installed automatically using Bun at startup. Packages and their dependencies are cached in ~/.cache/opencode/node_modules/.

Local plugins are loaded directly from the plugin directory. To use external packages, you must create a package.json within your config directory (see Dependencies), or publish the plugin to npm and add it to your config.

Plugins are loaded from all sources and all hooks run in sequence. The load order is:

Duplicate npm packages with the same name and version are loaded once. However, a local plugin and an npm plugin with similar names are both loaded separately.

A plugin is a JavaScript/TypeScript module that exports one or more plugin functions. Each function receives a context object and returns a hooks object.

Local plugins and custom tools can use external npm packages. Add a package.json to your config directory with the dependencies you need.

OpenCode runs bun install at startup to install these. Your plugins and tools can then import them.

The plugin function receives:

For TypeScript plugins, you can import types from the plugin package:

Plugins can subscribe to events as seen below in the Examples section. Here is a list of the different events available.

Here are some examples of plugins you can use to extend opencode.

Send notifications when certain events occur:

We are using osascript to run AppleScript on macOS. Here we are using it to send notifications.

If you’re using the OpenCode desktop app, it can send system notifications automatically when a response is ready or when a session errors.

Prevent opencode from reading .env files:

Plugins can also add custom tools to opencode:

The tool helper creates a custom tool that opencode can call. It takes a Zod schema function and returns a tool definition with:

Your custom tools will be available to opencode alongside built-in tools.

Use client.app.log() instead of console.log for structured logging:

Levels: debug, info, warn, error. See SDK documentation for details.

Customize the context included when a session is compacted:

The experimental.session.compacting hook fires before the LLM generates a continuation summary. Use it to inject domain-specific context that the default compaction prompt would miss.

You can also replace the compaction prompt entirely by setting output.prompt:

When output.prompt is set, it completely replaces the default compaction prompt. The output.context array is ignored in this case.

**Examples:**

Example 1 (unknown):
```unknown
.opencode/plugins/
```

Example 2 (unknown):
```unknown
~/.config/opencode/plugins/
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "plugin": ["opencode-helicone-session", "opencode-wakatime", "@my-org/custom-plugin"]}
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "plugin": ["opencode-helicone-session", "opencode-wakatime", "@my-org/custom-plugin"]}
```

---

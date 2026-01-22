# Opencode - Modes

**Pages:** 1

---

## Modes | OpenCode

**URL:** https://opencode.ai/docs/modes

**Contents:**
- Modes
- Built-in
  - Build
  - Plan
- Switching
- Configure
  - JSON Configuration
  - Markdown Configuration
  - Model
  - Temperature

Different modes for different use cases.

Modes are now configured through the agent option in the opencode config. The mode option is now deprecated. Learn more.

Modes in opencode allow you to customize the behavior, tools, and prompts for different use cases.

It comes with two built-in modes: build and plan. You can customize these or configure your own through the opencode config.

You can switch between modes during a session or configure them in your config file.

opencode comes with two built-in modes.

Build is the default mode with all tools enabled. This is the standard mode for development work where you need full access to file operations and system commands.

A restricted mode designed for planning and analysis. In plan mode, the following tools are disabled by default:

This mode is useful when you want the AI to analyze code, suggest changes, or create plans without making any actual modifications to your codebase.

You can switch between modes during a session using the Tab key. Or your configured switch_mode keybind.

See also: Formatters for information about code formatting configuration.

You can customize the built-in modes or create your own through configuration. Modes can be configured in two ways:

Configure modes in your opencode.json config file:

You can also define modes using markdown files. Place them in:

The markdown file name becomes the mode name (e.g., review.md creates a review mode).

Let’s look at these configuration options in detail.

Use the model config to override the default model for this mode. Useful for using different models optimized for different tasks. For example, a faster model for planning, a more capable model for implementation.

Control the randomness and creativity of the AI’s responses with the temperature config. Lower values make responses more focused and deterministic, while higher values increase creativity and variability.

Temperature values typically range from 0.0 to 1.0:

If no temperature is specified, opencode uses model-specific defaults (typically 0 for most models, 0.55 for Qwen models).

Specify a custom system prompt file for this mode with the prompt config. The prompt file should contain instructions specific to the mode’s purpose.

This path is relative to where the config file is located. So this works for both the global opencode config and the project specific config.

Control which tools are available in this mode with the tools config. You can enable or disable specific tools by setting them to true or false.

If no tools are specified, all tools are enabled by default.

Here are all the tools can be controlled through the mode config.

You can create your own custom modes by adding them to the configuration. Here are examples using both approaches:

Create mode files in .opencode/modes/ for project-specific modes or ~/.config/opencode/modes/ for global modes:

Here are some common use cases for different modes.

You might also find different models are good for different use cases.

**Examples:**

Example 1 (unknown):
```unknown
.opencode/plans/*.md
```

Example 2 (unknown):
```unknown
switch_mode
```

Example 3 (unknown):
```unknown
opencode.json
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "mode": {    "build": {      "model": "anthropic/claude-sonnet-4-20250514",      "prompt": "{file:./prompts/build.txt}",      "tools": {        "write": true,        "edit": true,        "bash": true      }    },    "plan": {      "model": "anthropic/claude-haiku-4-20250514",      "tools": {        "write": false,        "edit": false,        "bash": false      }    }  }}
```

---

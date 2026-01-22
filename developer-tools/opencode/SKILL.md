---
name: opencode
description: This skill should be used when the user asks to "use opencode", "configure opencode", "opencode commands", "opencode providers", "opencode mcp servers", "opencode agents", or needs guidance on OpenCode installation, configuration, providers, commands, modes, plugins, MCP integration, tools, and all OpenCode features.
version: 1.0.0
author: SmartDDDLab
license: MIT
tags: [opencode, ai-coding-agent, cli, mcp, automation]
---

# OpenCode Skill

Open source AI coding agent - alternative to Claude Code with multi-provider support, custom agents, MCP servers, and extensive plugin ecosystem.

## When to Use This Skill

Trigger this skill when:
- Working with OpenCode AI coding agent
- Configuring providers, models, or authentication
- Using OpenCode commands or CLI interface
- Setting up MCP servers or custom tools
- Creating custom agents or skills
- Implementing GitLab/GitHub integrations
- Troubleshooting OpenCode issues

## Quick Reference

### Core Concepts

- **Multi-Provider Support** - Anthropic, OpenAI, Google, Azure, Groq, OpenRouter, Zen
- **Custom Agents** - Create specialized agents with custom system prompts
- **MCP Integration** - Model Context Protocol server support
- **Custom Skills** - Extensible skill system similar to Claude Code
- **TUI/Web/Desktop** - Multiple interface options

### Essential Commands

```bash
# Start TUI
opencode

# Run non-interactive
opencode run "Explain closures in JavaScript"

# List models
opencode models

# Manage MCP servers
opencode mcp add
opencode mcp list

# Start web interface
opencode web

# Start headless server
opencode serve
```

### Configuration File

```json
{
  "$schema": "https://opencode.ai/config.json",
  "model": "anthropic/claude-3-5-sonnet-20241022",
  "instructions": ["AGENTS.md", "docs/guidelines.md"]
}
```

## Reference Files

Comprehensive documentation in `references/`:

- **getting_started.md** - Installation and quick start
- **providers.md** - Provider configuration and API keys
- **configuration.md** - Complete configuration options
- **commands.md** - All CLI commands reference
- **agents.md** - Custom agent creation
- **mcp.md** - MCP server integration
- **tools.md** - Built-in and custom tools
- **skills.md** - Custom skills system
- **plugins.md** - Plugin ecosystem
- **modes.md** - Plan mode, build mode
- **integrations.md** - GitHub, GitLab, IDE integration
- **interfaces.md** - TUI, Web, Desktop interfaces
- **themes.md** - Customization and appearance
- **keybinds.md** - Keyboard shortcuts
- **formatters.md** - Code formatting
- **advanced.md** - Server, LSP, ecosystem
- **enterprise.md** - Permissions, rules, ACP
- **troubleshooting.md** - FAQ and issue resolution

Refer to these files for detailed information when needed.

## Resources

### Official Documentation
- Website: https://opencode.ai/
- Docs: https://opencode.ai/docs/
- GitHub: https://github.com/anomaly/labs

### Community
- Discord: https://discord.gg/opencode
- Issues: https://github.com/anomaly/labs/issues

## Configuration File

This skill includes `opencode.json` with the scraper configuration used to generate documentation from the official OpenCode website. Use this to refresh the skill with updated documentation.

### Quick Update Using .json File

To update this skill with the latest documentation:

```bash
# From the Skill Seekers directory
cd /Users/mac/code/claude/Skill_Seekers

# Re-run the scraper with existing config
python skill_seeker.py configs/opencode.json

# Copy generated files
cp -r output/opencode/* /path/to/smartddd-skills-repo/developer-tools/opencode/
cp configs/opencode.json /path/to/smartddd-skills-repo/developer-tools/opencode/

# Update SKILL.md version number (if needed)
# Then commit changes
```

## Notes

- Generated from official OpenCode documentation
- Reference files preserve structure and examples from source docs
- Compatible with Claude Code conventions (AGENTS.md, CLAUDE.md)
- Supports custom commands via `/command` syntax
- Multi-agent and sub-agent orchestration built-in

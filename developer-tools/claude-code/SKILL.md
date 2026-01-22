---
name: claude-code
description: This skill should be used when the user asks to "use claude code", "claude code cli", "claude code mcp", "claude code configuration", "claude code skills", "claude code agents", or needs guidance on Claude Code CLI, development environment, tools, workflows, MCP integration, skills, and AI-assisted development.
version: 1.0.0
author: SmartDDDLab
license: MIT
tags: [claude-code, ai-coding-agent, cli, mcp, anthropic]
---

# Claude Code Skill

Claude Code CLI and development environment - official AI-powered coding assistant from Anthropic with MCP integration, custom skills, and intelligent workflows.

## When to Use This Skill

Trigger this skill when:
- Working with Claude Code CLI or development environment
- Configuring Claude Code settings and preferences
- Using MCP (Model Context Protocol) servers
- Creating custom agents or skills
- Implementing AI-assisted development workflows
- Troubleshooting Claude Code issues
- Setting up IDE integrations

## Quick Reference

### Core Concepts

- **Claude Code CLI** - Official command-line interface for Claude AI
- **MCP Integration** - Model Context Protocol for extensibility
- **Custom Skills** - Extend functionality with domain-specific skills
- **Agents System** - Specialized AI agents for different tasks
- **Workflows** - Common development patterns and automation

### Essential Commands

```bash
# Start Claude Code
claude

# Run non-interactive command
claude run "Explain this code"

# Check status
claude status

# List MCP servers
claude mcp list

# Configure settings
claude config set <key> <value>
```

### Configuration File

```json
{
  "model": "claude-3-5-sonnet-20241022",
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/files"]
    }
  }
}
```

## Reference Files

Comprehensive documentation in `references/`:

- **llms.md** - Complete documentation for AI context (recommended)
- **llms-full.md** - Full documentation with all details
- **llms-small.md** - Condensed documentation for quick reference
- **agents.md** - Custom agents and task delegation
- **index.md** - Documentation index

Refer to these files for detailed information when needed.

## Resources

### Official Documentation
- Website: https://code.claude.com/
- Docs: https://code.claude.com/docs/en/
- GitHub: https://github.com/anthropics/claude-code

### MCP Integration
- MCP Spec: https://modelcontextprotocol.io/
- MCP Servers: https://github.com/modelcontextprotocol

## Configuration File

This skill includes `claude-code.json` with the scraper configuration used to generate documentation from the official Claude Code website. Use this to refresh the skill with updated documentation.

### Quick Update Using .json File

To update this skill with the latest documentation:

```bash
# From the Skill Seekers directory
cd /Users/mac/code/claude/Skill_Seekers

# Re-run the scraper with existing config
python skill_seeker.py configs/claude-code.json

# Copy generated files
cp -r output/claude-code/* /path/to/smartddd-skills-repo/developer-tools/claude-code/
cp configs/claude-code.json /path/to/smartddd-skills-repo/developer-tools/claude-code/

# Update SKILL.md version number (if needed)
# Then commit changes
```

## Notes

- Generated from official Claude Code documentation
- Reference files preserve structure and examples from source docs
- MCP protocol enables extensibility and custom tool integration
- Custom skills provide domain-specific assistance
- Supports IDE integration (VS Code, JetBrains)

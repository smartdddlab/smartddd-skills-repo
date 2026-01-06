---
name: superclaude-invoker
description: This skill should be used when the user needs to dynamically invoke SuperClaude commands from external tools like BMAD, spec-kit, or any CLI automation framework to enhance code development, problem analysis, test execution, and git operations.
version: 1.0.0
author: SmartDDDLab
license: MIT
tags: [superclaude, bridge, automation, cli, integration, developer-tools]
requirements: ["SuperClaude framework installed", "Claude Code CLI", "BMAD or spec-kit or similar CLI tool"]
---

# SuperClaude Invoker

This skill acts as a command router within the SuperClaude framework. Instead of executing commands directly, analyze user requests and generate appropriate SuperClaude command strings for the user to execute.

## Core Responsibilities

1. **Command Analysis**: Parse user intent and match against known command patterns
2. **Context Routing**: Consider active persona, mode, and flags when routing
3. **Parameter Extraction**: Identify arguments, flags, and targets from natural language
4. **Quality Validation**: Validate generated commands against schema requirements

## Input Contract

The skill receives:

- **command**: SuperClaude command to execute (without `/sc:` prefix)
- **target**: Command target (file, directory, or module path)
- **flags**: Flags and options passed to command
- **context**: Additional context information (optional)

> See [references/api.md](references/api.md) for detailed schema definitions.

## Output Contract

The skill produces:

- **command**: The SuperClaude command string
- **confidence**: Confidence score (0.0-1.0)
- **reasoning**: Explanation of routing decision
- **metadata**: Additional execution information

## Command Categories

| Category | Commands | Use Case |
|----------|----------|----------|
| Development | `/sc:build`, `/sc:implement` | Code creation and feature implementation |
| Analysis | `/sc:analyze`, `/sc:troubleshoot` | Code investigation and problem solving |
| Quality | `/sc:improve`, `/sc:cleanup` | Refactoring and technical debt reduction |
| Planning | `/sc:design`, `/sc:task`, `/sc:estimate` | Architecture and project planning |
| Testing | `/sc:test` | Test workflow execution |
| Git | `/sc:git` | Git workflow assistance |
| Documentation | `/sc:document`, `/sc:explain` | Documentation and code explanation |
| Meta | `/sc:spawn`, `/sc:load`, `/sc:save`, `/sc:reflect` | Task orchestration and session management |

> See [references/commands.md](references/commands.md) for complete trigger patterns.

## Execution Engine

The execution engine processes requests through four phases:

1. **Detection Phase**: Analyze request complexity and domain
2. **Routing Phase**: Select appropriate command and parameters
3. **Validation Phase**: Validate output against schema
4. **Response Phase**: Return command string with metadata

> See [references/engine.md](references/engine.md) for detailed flow diagrams.

## Quality Gates

Before returning any command, the skill validates:

1. Syntax correctness
2. Type compatibility
3. Security compliance
4. Test coverage requirements

> See [references/quality.md](references/quality.md) for validation rules.

## Usage Examples

### BMAD Integration

```json
{
  "tool": "superclaude-invoker",
  "command": "analyze",
  "target": "./src/auth-module",
  "flags": {
    "focus": "security",
    "think": true
  }
}
```

### spec-kit Integration

```json
{
  "action": "implement",
  "spec": "user-authentication-api",
  "target": "./api/v1/auth",
  "flags": {
    "type": "api",
    "framework": "express",
    "validate": true
  }
}
```

> See [examples/basic-usage.md](examples/basic-usage.md) for more examples.

## Trigger Patterns

| Request Pattern | Command |
|-----------------|---------|
| build/create/implement [X] | `/sc:build [X]` or `/sc:implement [X]` |
| analyze/investigate [X] | `/sc:analyze [X]` |
| improve/refactor/optimize [X] | `/sc:improve [X]` |
| troubleshoot/debug [X] | `/sc:troubleshoot [X]` |
| design/architecture [X] | `/sc:design [X]` |
| run tests | `/sc:test [type]` |
| git commit/PR/branch | `/sc:git [operation]` |
| complex orchestration | `/sc:spawn --think --loop` |

## Related Resources

- [references/api.md](references/api.md) - Detailed API schema
- [references/commands.md](references/commands.md) - Command patterns
- [references/engine.md](references/engine.md) - Execution details
- [references/quality.md](references/quality.md) - Validation rules
- [references/performance.md](references/performance.md) - Optimization strategies
- [references/error-recovery.md](references/error-recovery.md) - Error handling
- [examples/basic-usage.md](examples/basic-usage.md) - Usage examples

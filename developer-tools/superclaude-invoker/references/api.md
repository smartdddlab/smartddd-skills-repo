# API Contract Reference

This document provides detailed input/output schema definitions for the SuperClaude Invoker skill.

## Input Contract

### JSON Schema

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["command"],
  "properties": {
    "command": {
      "type": "string",
      "description": "SuperClaude command to execute (without /sc: prefix)",
      "examples": ["implement", "analyze", "improve", "git"]
    },
    "target": {
      "type": "string",
      "description": "Command target (file, directory, or module path)",
      "examples": ["./src/auth", "api/", "auth-module"]
    },
    "flags": {
      "type": "object",
      "description": "Flags and options passed to command",
      "properties": {
        "type": {
          "type": "string",
          "description": "Operation type",
          "enum": ["component", "api", "service", "feature"]
        },
        "framework": {
          "type": "string",
          "description": "Target framework",
          "examples": ["react", "vue", "nextjs", "express"]
        },
        "focus": {
          "type": "string",
          "description": "Focus area",
          "enum": ["performance", "security", "quality", "architecture", "accessibility", "testing"]
        },
        "think": {
          "type": "boolean",
          "description": "Enable deep analysis mode"
        },
        "safe": {
          "type": "boolean",
          "description": "Safe mode - restrict risky operations"
        },
        "validate": {
          "type": "boolean",
          "description": "Pre/post execution validation"
        },
        "loop": {
          "type": "boolean",
          "description": "Iterative improvement mode"
        }
      }
    },
    "context": {
      "type": "object",
      "description": "Additional context information",
      "properties": {
        "project_root": {
          "type": "string",
          "description": "Project root directory path"
        },
        "environment": {
          "type": "string",
          "description": "Execution environment",
          "enum": ["dev", "staging", "prod"]
        },
        "user_id": {
          "type": "string",
          "description": "User identifier for access control"
        }
      }
    },
    "callback": {
      "type": "object",
      "description": "Callback configuration for async execution",
      "properties": {
        "url": {
          "type": "string",
          "description": "Callback URL"
        },
        "method": {
          "type": "string",
          "enum": ["POST", "PUT"],
          "description": "HTTP method"
        }
      }
    }
  }
}
```

### Input Examples

**Basic Command:**
```json
{
  "command": "analyze",
  "target": "./src/auth"
}
```

**Full Configuration:**
```json
{
  "command": "implement",
  "target": "./api/v1/auth",
  "flags": {
    "type": "api",
    "framework": "express",
    "focus": "security",
    "think": true,
    "validate": true
  },
  "context": {
    "project_root": "/Users/dev/project",
    "environment": "development"
  }
}
```

**With Callback:**
```json
{
  "command": "build",
  "target": "./frontend",
  "flags": {
    "framework": "nextjs"
  },
  "callback": {
    "url": "https://api.example.com/webhooks/superclaude",
    "method": "POST"
  }
}
```

## Output Contract

### JSON Schema

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["success", "command", "metadata"],
  "properties": {
    "success": {
      "type": "boolean",
      "description": "Whether command executed successfully"
    },
    "command": {
      "type": "string",
      "description": "Actual SuperClaude command executed",
      "examples": ["/sc:analyze ./src/auth --focus security --think"]
    },
    "result": {
      "type": "object",
      "description": "Command execution result",
      "properties": {
        "output": {
          "type": "string",
          "description": "Command stdout"
        },
        "duration_ms": {
          "type": "number",
          "description": "Execution time in milliseconds"
        },
        "files_modified": {
          "type": "array",
          "items": { "type": "string" },
          "description": "List of modified files"
        },
        "issues_found": {
          "type": "number",
          "description": "Number of issues discovered"
        },
        "suggestions": {
          "type": "array",
          "items": { "type": "string" },
          "description": "List of improvement suggestions"
        }
      }
    },
    "error": {
      "type": "object",
      "description": "Error information (only present when success is false)",
      "properties": {
        "code": {
          "type": "string",
          "description": "Error code"
        },
        "message": {
          "type": "string",
          "description": "Human-readable error message"
        },
        "details": {
          "type": "object",
          "description": "Error details"
        }
      }
    },
    "metadata": {
      "type": "object",
      "required": ["timestamp", "version", "request_id"],
      "properties": {
        "timestamp": {
          "type": "string",
          "format": "date-time",
          "description": "Execution timestamp (ISO 8601)"
        },
        "version": {
          "type": "string",
          "description": "Skill version"
        },
        "request_id": {
          "type": "string",
          "description": "Unique request identifier"
        }
      }
    }
  }
}
```

### Output Examples

**Success Response:**
```json
{
  "success": true,
  "command": "/sc:analyze ./src/auth --focus security --think",
  "result": {
    "output": "Analysis complete: 3 security issues found",
    "duration_ms": 15420,
    "files_modified": [],
    "issues_found": 3,
    "suggestions": [
      "Add input validation layer",
      "Consider using JWT instead of session tokens"
    ]
  },
  "metadata": {
    "timestamp": "2026-01-06T10:30:00Z",
    "version": "1.0.0",
    "request_id": "req-abc123"
  }
}
```

**Error Response:**
```json
{
  "success": false,
  "command": "/sc:implement ./src/new-feature",
  "error": {
    "code": "INVALID_TARGET",
    "message": "Specified target path does not exist",
    "details": {
      "target": "./src/new-feature",
      "project_root": "/Users/dev/project"
    }
  },
  "metadata": {
    "timestamp": "2026-01-06T10:30:00Z",
    "version": "1.0.0",
    "request_id": "req-def456"
  }
}
```

## Error Codes

| Code | Description | Resolution |
|------|-------------|------------|
| `INVALID_COMMAND` | Unknown command | Use valid SuperClaude command |
| `INVALID_TARGET` | Target not found | Verify file/directory exists |
| `INVALID_FLAG` | Unsupported flag | Remove or replace flag |
| `PERMISSION_DENIED` | Access denied | Check user permissions |
| `EXECUTION_FAILED` | Command error | Review error details |
| `TIMEOUT` | Command timeout | Increase timeout or simplify request |

## Flag Reference

### Analysis Flags

| Flag | Description |
|------|-------------|
| `--think` | Standard structured analysis (~4K tokens) |
| `--think-hard` | Deep architecture analysis (~10K tokens) |
| `--ultrathink` | Maximum depth analysis (~32K tokens) |
| `--brainstorm` | Activate brainstorming mode |

### MCP Server Flags

| Flag | Alias | Description |
|------|-------|-------------|
| `--c7` | `--context7` | Enable Context7 documentation |
| `--seq` | `--sequential` | Enable Sequential analysis |
| `--magic` | - | Enable Magic UI generation |
| `--play` | `--playwright` | Enable Playwright testing |
| `--morph` | `--morphllm` | Enable Morphllm bulk edits |
| `--serena` | - | Enable Serena semantic operations |
| `--all-mcp` | - | Enable all MCP servers |
| `--no-mcp` | - | Disable all MCP servers |

### Execution Control Flags

| Flag | Values | Description |
|------|--------|-------------|
| `--focus` | performance, security, quality, architecture, accessibility, testing | Analysis focus area |
| `--scope` | file, module, project, system | Operation scope |
| `--type` | component, api, service, feature | Operation type |
| `--safe` | - | Safe mode (restrict risky ops) |
| `--validate` | - | Pre/post execution validation |
| `--loop` | - | Iterative improvement mode |
| `--delegate` | - | Enable sub-task delegation |
| `--uc` | `--ultracompressed` | Ultra-compressed output |

### Git-Specific Flags

| Flag | Alias | Description |
|------|-------|-------------|
| `--message` | `-m` | Commit message |
| `--branch` | `-b` | Target branch |
| `--force` | `-f` | Force operation (use with caution) |

### Testing Flags

| Flag | Description |
|------|-------------|
| `--coverage` | Require coverage report |
| `--benchmark` | Performance benchmarking |
| `--e2e` | End-to-end testing |

# SuperClaude Invoker - Usage Examples

This document provides practical examples of using the SuperClaude Invoker skill, including integration with BMAD-METHOD and spec-kit workflows.

## BMAD-METHOD Integration

[BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) is an AI-driven agile development framework with specialized agents and workflows. The superclaude-invoker skill integrates seamlessly with BMAD's 4-phase methodology.

### BMAD 4-Phase Workflow Mapping

| Phase | BMAD Agent | SuperClaude Command | Use Case |
|-------|------------|---------------------|----------|
| **Analysis** | Analyst | `/sc:analyze` | Research and explore solutions |
| **Planning** | PM, Architect | `/sc:design`, `/sc:estimate` | Create PRDs, tech specs |
| **Solutioning** | Architect, UX Designer | `/sc:design` | Design architecture and UX |
| **Implementation** | Developer | `/sc:implement`, `/sc:test` | Story-driven development |

### BMAD Quick Flow Integration

For bug fixes and small features:

```yaml
# BMAD Quick Flow - Bug Fix
tool: superclaude-invoker
command: troubleshoot
target: ./src/api/users
flags:
  think: true
  safe: true

# Response
{
  "success": true,
  "command": "/sc:troubleshoot ./src/api/users --think --safe",
  "result": {
    "root_cause": "Missing null check in user fetch",
    "fix_applied": true,
    "files_modified": ["controllers/userController.js"],
    "test_added": true
  }
}
```

### BMAD Full Method Integration

For products and platforms:

```yaml
# BMAD Method - New Feature
tool: superclaude-invoker
command: spawn
flags:
  think: true
  mode: workflow

# This triggers BMAD-style multi-agent orchestration
# Mapped to: /sc:spawn --think --loop
```

### BMAD Enterprise Integration

For compliance and scale:

```yaml
# BMAD Enterprise - Full Analysis
tool: superclaude-invoker
command: analyze
target: .
flags:
  think-hard: true
  seq: true
  scope: system
  focus: security

# Response includes governance compliance report
{
  "success": true,
  "command": "/sc:analyze . --think-hard --seq --scope system --focus security",
  "result": {
    "compliance_score": 92,
    "issues_found": 3,
    "governance_report": "Available",
    "recommendations": ["Add audit logging", "Update auth middleware"]
  }
}
```

## spec-kit Integration

spec-kit is a specification testing framework that validates implementations against defined specifications.

### spec-kit Workflow Integration

```yaml
# spec-kit Specification Test
tool: superclaude-invoker
action: implement
spec: user-authentication-api
target: ./api/v1/auth
flags:
  type: api
  framework: express
  validate: true

# Response
{
  "success": true,
  "command": "/sc:implement ./api/v1/auth --type api --framework express --validate",
  "result": {
    "spec_validation": "passed",
    "files_created": [
      "controllers/auth.js",
      "models/User.js",
      "routes/auth.js"
    ],
    "tests_generated": true,
    "coverage": "85%"
  }
}
```

### spec-kit Validation Chain

```
Input Spec → /sc:implement → Code Generation → /sc:test → Validation
                                              ↓
                              spec-kit: pass/fail report
```

### spec-kit Error Handling

```yaml
# spec-kit fails - implementation doesn't match spec
{
  "success": false,
  "command": "/sc:implement ./api/v1/auth --type api",
  "error": {
    "code": "SPEC_VALIDATION_FAILED",
    "message": "Response schema mismatch",
    "details": {
      "spec_requires": {
        "user": {
          "id": "string",
          "email": "string",
          "created_at": "ISO8601"
        }
      },
      "implementation_provides": {
        "user": {
          "id": "number",
          "email": "string"
        }
      }
    },
    "recovery": {
      "fix_required": "Add created_at field to User model",
      "suggested_command": "/sc:implement ./models/User.js --type model --fix"
    }
  }
}
```

## Combined BMAD + spec-kit Workflow

### Full Development Lifecycle

```
┌─────────────────────────────────────────────────────────────────┐
│                    BMAD 4-Phase Methodology                      │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  1. ANALYSIS          2. PLANNING          3. SOLUTIONING       │
│  ┌─────────────┐     ┌─────────────┐     ┌─────────────┐       │
│  │ /sc:analyze │ ──▶ │ /sc:design  │ ──▶ │ /sc:design  │       │
│  │ --think     │     │ --estimate  │     │ --think     │       │
│  └─────────────┘     └─────────────┘     └─────────────┘       │
│         │                   │                   │               │
│         ▼                   ▼                   ▼               │
│  ┌─────────────────────────────────────────────────────┐       │
│  │              IMPLEMENTATION (Phase 4)                 │       │
│  │  /sc:implement → /sc:test → spec-kit validation      │       │
│  │  --validate    --e2e       --spec-aware               │       │
│  └─────────────────────────────────────────────────────┘       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Example: Complete Feature Development

```yaml
# Phase 1: Analysis
- tool: superclaude-invoker
  command: analyze
  target: ./src/payment-service
  flags:
    think: true
    focus: architecture

# Phase 2: Planning
- tool: superclaude-invoker
  command: design
  target: payment-gateway
  flags:
    type: api
    scope: module

- tool: superclaude-invoker
  command: estimate
  target: payment-gateway
  flags:
    scope: detail

# Phase 3: Solutioning
- tool: superclaude-invoker
  command: design
  target: payment-gateway
  flags:
    think: true
    output: architecture-diagram

# Phase 4: Implementation with spec-kit
- tool: superclaude-invoker
  command: implement
  spec: payment-api-spec
  target: ./api/v1/payment
  flags:
    type: api
    framework: express
    validate: true

- tool: superclaude-invoker
  command: test
  type: comprehensive
  flags:
    coverage: true
    e2e: true

# spec-kit validation
- tool: spec-kit
  spec: payment-api-spec
  implementation: ./api/v1/payment
```

## Basic Command Invocation

### Example 1: Simple Analysis

**User Request:**
```
analyze the authentication module
```

**Generated Command:**
```json
{
  "command": "analyze",
  "target": "./src/auth",
  "flags": {
    "focus": "security",
    "think": true
  }
}
```

**Output:**
```json
{
  "success": true,
  "command": "/sc:analyze ./src/auth --focus security --think",
  "confidence": 0.92,
  "reasoning": "Matched /sc:analyze pattern for 'authentication module'"
}
```

### Example 2: Feature Implementation

**User Request:**
```
build a login API with JWT authentication
```

**Generated Command:**
```json
{
  "command": "implement",
  "target": "./api/v1/auth",
  "flags": {
    "type": "api",
    "framework": "express",
    "validate": true,
    "safe": true
  }
}
```

**Output:**
```json
{
  "success": true,
  "command": "/sc:implement ./api/v1/auth --type api --framework express --validate --safe",
  "confidence": 0.95,
  "reasoning": "Matched /sc:implement pattern with framework detection"
}
```

### Example 3: Code Improvement

**User Request:**
```
optimize the database queries for better performance
```

**Generated Command:**
```json
{
  "command": "improve",
  "target": "./src/db",
  "flags": {
    "focus": "performance",
    "loop": true,
    "validate": true
  }
}
```

**Output:**
```json
{
  "success": true,
  "command": "/sc:improve ./src/db --focus performance --loop --validate",
  "confidence": 0.88,
  "reasoning": "Detected performance optimization intent"
}
```

## CLI Integration Examples

### BMAD Integration

```yaml
# BMAD workflow configuration
tool: superclaude-invoker
command: analyze
target: ./src/auth-module
flags:
  focus: security
  think: true

# Result
{
  "success": true,
  "command": "/sc:analyze ./src/auth-module --focus security --think",
  "result": {
    "issues_found": 5,
    "severity": {
      "critical": 1,
      "high": 2,
      "medium": 2
    }
  }
}
```

### spec-kit Integration

```yaml
# spec-kit specification testing
action: implement
spec: user-authentication-api
target: ./api/v1/auth
flags:
  type: api
  framework: express
  validate: true

# Result
{
  "success": true,
  "command": "/sc:implement ./api/v1/auth --type api --framework express --validate",
  "result": {
    "files_created": [
      "controllers/auth.js",
      "models/User.js",
      "routes/auth.js"
    ],
    "tests_generated": true
  }
}
```

## Advanced Examples

### Example 4: Comprehensive Testing

**User Request:**
```
run all tests with coverage and performance benchmarks
```

**Generated Command:**
```json
{
  "command": "test",
  "type": "comprehensive",
  "flags": {
    "coverage": true,
    "benchmark": true,
    "e2e": true
  }
}
```

**Output:**
```json
{
  "success": true,
  "command": "/sc:test comprehensive --coverage --benchmark --e2e",
  "result": {
    "test_results": {
      "unit": { "passed": 145, "failed": 0, "coverage": "92%" },
      "integration": { "passed": 32, "failed": 1 },
      "e2e": { "passed": 8, "failed": 0 }
    },
    "performance": {
      "avg_response_time": "45ms",
      "p95": "120ms"
    }
  }
}
```

### Example 5: Git Workflow Enhancement

**User Request:**
```
create a commit with intelligent message
```

**Generated Command:**
```json
{
  "command": "git",
  "operation": "commit",
  "flags": {
    "message": "auto",
    "analyze": true
  }
}
```

**Output:**
```json
{
  "success": true,
  "command": "/sc:git commit --message auto --analyze",
  "result": {
    "commit_message": "feat(auth): Add JWT token refresh mechanism\n\n- Implement token refresh logic before expiration\n- Add refresh token API endpoint\n- Update auth middleware for refresh flow",
    "files_analyzed": 8,
    "change_summary": "Added 3 new files, modified 5 existing files"
  }
}
```

### Example 6: Safe Cleanup Operation

**User Request:**
```
clean up the legacy code with safety checks
```

**Generated Command:**
```json
{
  "command": "cleanup",
  "target": "./src/legacy",
  "flags": {
    "safe": true,
    "validate": true
  }
}
```

**Output:**
```json
{
  "success": true,
  "command": "/sc:cleanup ./src/legacy --safe --validate",
  "result": {
    "files_cleaned": 12,
    "lines_removed": 2456,
    "improvements": [
      "Remove dead code",
      "Simplify complex functions"
    ]
  }
}
```

## Error Handling Examples

### Example 7: Invalid Target Recovery

**User Request:**
```
analyze the nonexistent module
```

**Initial Command:**
```json
{
  "command": "analyze",
  "target": "./src/nonexistent"
}
```

**Error Response:**
```json
{
  "success": false,
  "error": {
    "code": "VALID_INVALID_TARGET",
    "message": "Target path './src/nonexistent' does not exist",
    "recovery": {
      "suggestions": [
        "Verify the target path exists",
        "Use absolute path instead of relative",
        "Check current working directory"
      ],
      "fallback_command": "/sc:analyze .",
      "retry_possible": true
    }
  }
}
```

### Example 8: Security Block with Recovery

**User Request:**
```
force delete the entire src directory
```

**Blocked Response:**
```json
{
  "success": false,
  "error": {
    "code": "SEC_DESTRUCTIVE_OP",
    "message": "Destructive operation requires explicit --force flag",
    "recovery": {
      "suggestions": [
        "Use --force flag if operation is intended",
        "Consider using /cleanup instead for safe removal"
      ],
      "safe_alternative": "/sc:cleanup ./src --safe --validate"
    }
  }
}
```

## Common Patterns

### Pattern 1: Iterative Improvement

```json
{
  "command": "improve",
  "target": "./src/auth",
  "flags": {
    "loop": true,
    "validate": true,
    "focus": "quality"
  }
}
```

**Behavior:**
1. First pass: Initial improvements
2. Validation: Check results
3. Second pass: Refine based on feedback
4. Continue until quality threshold met

### Pattern 2: Safe Refactoring

```json
{
  "command": "improve",
  "target": "./src/core",
  "flags": {
    "safe": true,
    "validate": true,
    "backup": true
  }
}
```

**Behavior:**
1. Create backup before changes
2. Make changes with safety checks
3. Validate changes
4. Allow easy rollback if issues

### Pattern 3: Deep Analysis

```json
{
  "command": "analyze",
  "target": "./src",
  "flags": {
    "think": true,
    "seq": true,
    "scope": "project",
    "focus": "security"
  }
}
```

**Behavior:**
1. Enable Sequential MCP for complex analysis
2. Use deep thinking mode
3. Analyze entire project scope
4. Focus on security aspects
```

## Quick Reference

### Common Commands

| Request | Command | Flags |
|---------|---------|-------|
| Analyze code | `/sc:analyze {target}` | --think, --focus |
| Build feature | `/sc:build {target}` | --type, --framework |
| Implement code | `/sc:implement {target}` | --type, --validate |
| Improve quality | `/sc:improve {target}` | --focus, --loop, --think |
| Run tests | `/sc:test {type}` | --coverage, --e2e |
| Git operations | `/sc:git {operation}` | --message, --branch |
| Design system | `/sc:design {domain}` | --type, --scope |
| Generate docs | `/sc:document {target}` | --type, --format |
| Troubleshoot | `/sc:troubleshoot {issue}` | --think, --seq |
| Cleanup project | `/sc:cleanup {target}` | --safe, --validate |
| Estimate work | `/sc:estimate {target}` | --scope, --detail |
| Complex orchestration | `/sc:spawn` | --think, --loop |

### Framework Integration Quick Links

| Framework | Integration Point | Key Commands |
|-----------|-------------------|--------------|
| **BMAD-METHOD** | 4-phase workflow | `/sc:analyze`, `/sc:design`, `/sc:estimate`, `/sc:implement` |
| **spec-kit** | Specification testing | `/sc:implement --validate`, `/sc:test` |

## Related Resources

- [BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) - AI-Driven Agile Development Framework
- [SuperClaude Invoker SKILL.md](../../SKILL.md) - Main skill documentation
- [references/commands.md](../../references/commands.md) - Complete command reference
- [references/api.md](../../references/api.md) - API contract details

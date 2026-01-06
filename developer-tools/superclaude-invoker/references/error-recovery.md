# Error Recovery Reference

This document provides detailed information about error handling and recovery mechanisms for the SuperClaude Invoker skill.

## Error Classification

### Error Severity Levels

| Level | Symbol | Description | Action |
|-------|--------|-------------|--------|
| Info | ℹ️ | Informational | Log only |
| Warning | ⚠️ | Recoverable issue | Log + notify |
| Error | ❌ | Operation failed | Retry or fallback |
| Critical | 🚨 | System failure | Immediate action |

### Error Categories

| Category | Prefix | Description |
|----------|--------|-------------|
| Validation | `VALID_` | Input validation errors |
| Security | `SEC_` | Security-related errors |
| Resource | `RES_` | Resource exhaustion errors |
| Execution | `EXEC_` | Command execution errors |
| Integration | `INT_` | External service errors |

## Error Codes

### Validation Errors (`VALID_*`)

| Code | Message | Resolution |
|------|---------|------------|
| `VALID_INVALID_COMMAND` | Unknown command | Use valid SuperClaude command |
| `VALID_INVALID_TARGET` | Target not found | Verify file/directory exists |
| `VALID_INVALID_FLAG` | Unsupported flag | Check flag documentation |
| `VALID_INVALID_SYNTAX` | Syntax error | Fix command syntax |
| `VALID_MISSING_REQUIRED` | Required field missing | Add required fields |
| `VALID_TYPE_MISMATCH` | Type mismatch | Correct field type |

### Security Errors (`SEC_*`)

| Code | Message | Resolution |
|------|---------|------------|
| `SEC_PERMISSION_DENIED` | Access denied | Check user permissions |
| `SEC_DESTRUCTIVE_OP` | Destructive operation blocked | Use `--force` flag |
| `SEC_INVALID_CONTEXT` | Invalid execution context | Adjust context settings |
| `SEC_RATE_LIMITED` | Rate limit exceeded | Wait and retry |
| `SEC_SENSITIVE_DATA` | Potential data exposure | Sanitize output |

### Resource Errors (`RES_*`)

| Code | Message | Resolution |
|------|---------|------------|
| `RES_TOKEN_LIMIT` | Token budget exceeded | Simplify request |
| `RES_TIMEOUT` | Operation timeout | Increase timeout |
| `RES_MEMORY` | Memory limit reached | Reduce scope |
| `RES_DISK_SPACE` | Insufficient disk space | Free up space |
| `RES_MCP_UNAVAILABLE` | MCP server unavailable | Use native tools |

### Execution Errors (`EXEC_*`)

| Code | Message | Resolution |
|------|---------|------------|
| `EXEC_FAILED` | Command execution failed | Review error details |
| `EXEC_NOT_FOUND` | Command not found | Verify command exists |
| `EXEC_PERMISSION` | Execution permission denied | Check permissions |
| `EXEC_INTERRUPTED` | Operation interrupted | Retry operation |
| `EXEC_OUTPUT_TOO_LARGE` | Output exceeds limit | Reduce scope |

### Integration Errors (`INT_*`)

| Code | Message | Resolution |
|------|---------|------------|
| `INT_MCP_TIMEOUT` | MCP server timeout | Increase timeout or retry |
| `INT_MCP_ERROR` | MCP server error | Check server status |
| `INT_NETWORK` | Network error | Check connectivity |
| `INT_EXTERNAL_SERVICE` | External service error | Check service status |
| `INT_DATA_FORMAT` | Data format mismatch | Correct format |

## Recovery Strategies

### Automatic Retry

**Retry Configuration:**
```yaml
retry:
  max_attempts: 3
  initial_delay_ms: 100
  max_delay_ms: 5000
  backoff_multiplier: 2
  jitter: true
```

**Retry Logic:**
```
Attempt 1: Immediate
  ↓ Failure
Attempt 2: 100ms delay
  ↓ Failure
Attempt 3: 200ms delay
  ↓ Failure
Final Error: Return with error details
```

### Fallback Mechanisms

**Fallback Chain:**
```
Primary: Full command with all flags
  ↓ Failure
Fallback 1: Reduced flags (remove optional)
  ↓ Failure
Fallback 2: Simplified target (use . instead of specific path)
  ↓ Failure
Fallback 3: Native command only
  ↓ Failure
Final: Return error with recovery suggestions
```

**Example:**
```bash
# Primary
/sc:analyze ./src/auth --focus security --think --seq

# Fallback 1 (remove --seq)
/sc:analyze ./src/auth --focus security --think

# Fallback 2 (simplify target)
/sc:analyze . --focus security

# Fallback 3 (native only)
/sc:analyze
```

### Graceful Degradation

**Degradation Levels:**

| Level | Features | Response Time | Token Usage |
|-------|----------|---------------|-------------|
| Full | All features | Normal | Normal |
| Reduced | Core features | -20% | -30% |
| Minimal | Essential only | -40% | -50% |
| Emergency | Basic routing | -60% | -70% |

**Degradation Triggers:**
```yaml
degradation:
  cpu_threshold: 80%
  memory_threshold: 85%
  token_threshold: 75%
  error_rate_threshold: 10%
```

## Error Response Format

### Standard Error Response

```json
{
  "success": false,
  "command": "/sc:analyze ./src/auth --focus security --think",
  "error": {
    "code": "VALID_INVALID_TARGET",
    "message": "Target path './src/auth' does not exist",
    "severity": "error",
    "category": "validation",
    "timestamp": "2026-01-06T10:30:00Z",
    "request_id": "req-abc123"
  },
  "recovery": {
    "suggestions": [
      "Verify the target path exists",
      "Use absolute path instead of relative",
      "Check current working directory"
    ],
    "fallback_command": "/sc:analyze . --focus security",
    "retry_possible": true,
    "retry_delay_ms": 500
  },
  "metadata": {
    "version": "1.0.0",
    "timestamp": "2026-01-06T10:30:00Z",
    "request_id": "req-abc123"
  }
}
```

### Error Details Structure

```json
{
  "error": {
    "code": "SEC_DESTRUCTIVE_OP",
    "message": "Destructive operation requires explicit --force flag",
    "severity": "error",
    "category": "security",
    "timestamp": "2026-01-06T10:30:00Z",
    "request_id": "req-def456",
    "details": {
      "operation": "delete",
      "target": "./src/legacy",
      "required_flag": "--force",
      "safe_mode": true
    },
    "context": {
      "user_id": "user-123",
      "project_root": "/Users/dev/project",
      "environment": "development"
    }
  }
}
```

## Debugging Aids

### Verbose Error Output

```json
{
  "debug": {
    "stack_trace": [
      {
        "file": "engine.js",
        "line": 45,
        "function": "validateTarget",
        "message": "Path does not exist"
      },
      {
        "file": "router.js",
        "line": 123,
        "function": "routeCommand",
        "message": "Validation failed"
      }
    ],
    "input_received": {
      "command": "analyze",
      "target": "./src/auth",
      "flags": {}
    },
    "validation_history": [
      {
        "step": "syntax",
        "status": "passed"
      },
      {
        "step": "type",
        "status": "passed"
      },
      {
        "step": "target",
        "status": "failed",
        "reason": "Path does not exist"
      }
    ]
  }
}
```

### Error Logging

**Log Format:**
```json
{
  "timestamp": "2026-01-06T10:30:00Z",
  "level": "error",
  "code": "VALID_INVALID_TARGET",
  "message": "Target path './src/auth' does not exist",
  "request_id": "req-abc123",
  "user_id": "user-123",
  "project_root": "/Users/dev/project",
  "context": {
    "command": "analyze",
    "target": "./src/auth"
  },
  "resolution": {
    "attempted": true,
    "successful": false,
    "fallback_used": false
  }
}
```

## Best Practices

### Error Prevention

1. **Validate Early**
   - Check inputs before processing
   - Validate target paths exist
   - Verify flag combinations

2. **Use Safe Defaults**
   - Default to safe mode
   - Require explicit force for destructive operations
   - Limit resource usage

3. **Provide Clear Messages**
   - Include error code
   - Explain what went wrong
   - Suggest resolution

### Error Recovery

1. **Retry Transient Errors**
   - Network timeouts
   - MCP server temporary failures
   - Rate limiting

2. **Fallback Gracefully**
   - Reduce feature set
   - Simplify request
   - Use native tools

3. **Escalate Appropriately**
   - Log all errors
   - Alert on critical errors
   - Provide recovery path

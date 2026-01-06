# Quality Gates Reference

This document describes the quality validation system for the SuperClaude Invoker skill.

## Validation Overview

The quality gate system ensures all generated commands meet defined standards before execution. It operates through an 8-step validation cycle.

## Validation Steps

### Step 1: Syntax Validation

**Purpose:** Ensure command syntax is correct.

**Checks:**
- [ ] Command format matches `/sc:command` pattern
- [ ] Flags use valid syntax (`--flag` or `-f`)
- [ ] Target path format is valid
- [ ] No unclosed quotes or brackets

**Example:**
```bash
# Valid
/sc:analyze ./src/auth --focus security --think

# Invalid (syntax error)
/sc:analyze ./src/auth --focus security --

# Error message
Syntax Error: Incomplete flag at position X
```

### Step 2: Type Validation

**Purpose:** Ensure all parameters have correct types.

**Checks:**
- [ ] Flags have expected types (boolean, string, enum)
- [ ] Target path is a valid string
- [ ] Complex objects match schema

**Example:**
```json
// Valid flags
{
  "type": "api",
  "focus": "security",
  "think": true,
  "safe": true,
  "validate": true
}

// Invalid (type mismatch)
{
  "type": "api",
  "think": "yes",  // Should be boolean
  "focus": "invalid-focus"  // Not in enum
}
```

### Step 3: Security Validation

**Purpose:** Prevent dangerous operations.

**Checks:**
- [ ] No destructive commands without `--force`
- [ ] No commands that could expose sensitive data
- [ ] File paths are within project bounds
- [ ] No commands that bypass safety measures

**Security Rules:**

| Operation | Safe Mode | Unsafe Mode |
|-----------|-----------|-------------|
| `rm` / `delete` | Blocked | Requires `--force` |
| `git push --force` | Blocked | Requires `--force` |
| Database queries | Blocked | Allowed with validation |
| External API calls | Blocked | Allowed with validation |

**Example:**
```bash
# Blocked (would delete files without safe mode)
/sc:cleanup ./src --safe

# Allowed (with explicit force)
/sc:cleanup ./src --force
```

### Step 4: Compliance Validation

**Purpose:** Ensure adherence to project standards.

**Checks:**
- [ ] Command follows project conventions
- [ ] Flags use project-preferred values
- [ ] Output format matches expected schema

**Compliance Rules:**
```yaml
preferred_flags:
  analysis:
    - --think
    - --scope project
  implementation:
    - --validate
    - --safe
  improvement:
    - --loop
    - --validate
```

### Step 5: Test Validation

**Purpose:** Ensure tests pass before and after execution.

**Checks:**
- [ ] Pre-execution tests pass (if applicable)
- [ ] Post-execution tests run
- [ ] Coverage requirements met (if specified)

**Test Execution:**
```bash
# With test validation
/sc:implement ./src/auth --validate

# Output includes test results
{
  "tests": {
    "pre": { "passed": true, "time_ms": 1200 },
    "post": { "passed": true, "time_ms": 3500, "coverage": "85%" }
  }
}
```

### Step 6: Performance Validation

**Purpose:** Ensure performance meets thresholds.

**Checks:**
- [ ] Execution time within budget
- [ ] Token usage within limits
- [ ] No resource leaks

**Performance Budgets:**
```yaml
performance_budgets:
  execution_time:
    simple: < 5000ms
    moderate: < 30000ms
    complex: < 120000ms

  token_usage:
    simple: < 5000 tokens
    moderate: < 20000 tokens
    complex: < 50000 tokens
```

### Step 7: Documentation Validation

**Purpose:** Ensure documentation is updated.

**Checks:**
- [ ] API changes documented (if applicable)
- [ ] README updated (if applicable)
- [ ] Inline comments added (if applicable)

**Documentation Requirements:**
```markdown
When modifying:
- APIs → Update API documentation
- Configuration → Update config docs
- CLI → Update command reference
- Error codes → Update error handling docs
```

### Step 8: Integration Validation

**Purpose:** Ensure integration with other systems.

**Checks:**
- [ ] CI/CD pipeline passes
- [ ] External services accessible
- [ ] Data formats compatible

**Integration Checks:**
```bash
# CI/CD validation
/sc:build --validate --ci

# Output
{
  "integration": {
    "ci_passed": true,
    "services_healthy": true,
    "data_migration": "not_required"
  }
}
```

## Quality Scores

### Scoring Formula

```
Quality Score = (Syntax × 0.15) + (Type × 0.15) +
                (Security × 0.25) + (Compliance × 0.15) +
                (Test × 0.10) + (Performance × 0.10) +
                (Documentation × 0.05) + (Integration × 0.05)
```

### Score Thresholds

| Score | Rating | Action |
|-------|--------|--------|
| 90-100 | Excellent | Execute immediately |
| 75-89 | Good | Execute with optional warnings |
| 60-74 | Acceptable | Execute with required warnings |
| 0-59 | Poor | Block execution, provide feedback |

## Quality Reports

### Report Structure

```json
{
  "quality_report": {
    "overall_score": 85,
    "steps": [
      { "step": "Syntax", "passed": true, "score": 100 },
      { "step": "Type", "passed": true, "score": 100 },
      { "step": "Security", "passed": true, "score": 90 },
      { "step": "Compliance", "passed": true, "score": 85 },
      { "step": "Test", "passed": true, "score": 80 },
      { "step": "Performance", "passed": true, "score": 75 },
      { "step": "Documentation", "passed": true, "score": 100 },
      { "step": "Integration", "passed": true, "score": 100 }
    ],
    "warnings": [
      {
        "type": "performance",
        "message": "Estimated execution time exceeds simple threshold",
        "suggestion": "Consider using --scope file instead of --scope project"
      }
    ],
    "suggestions": [
      "Add --think flag for better analysis",
      "Consider --loop for iterative improvement"
    ]
  }
}
```

## Quality Gate Configuration

### Custom Rules

```yaml
quality_gates:
  syntax:
    enabled: true
    strict_mode: false

  security:
    enabled: true
    allow_destructive: false
    require_force: true

  performance:
    enabled: true
    max_execution_time: 30000
    max_tokens: 20000

  custom:
    - name: "No TODOs"
      pattern: "TODO|FIXME"
      level: "error"
```

# Execution Engine Reference

This document provides detailed information about the SuperClaude Invoker execution engine.

## Execution Phases

### Phase 1: Detection

The detection phase analyzes the user's request to identify intent, complexity, and required resources.

**Analysis Steps:**

1. **Intent Classification**
   - Extract key action verbs (build, analyze, improve, etc.)
   - Match against known command patterns
   - Calculate confidence score

2. **Complexity Assessment**
   - Evaluate request scope (file, module, project, system)
   - Estimate token requirements
   - Determine MCP server needs

3. **Context Gathering**
   - Check active persona
   - Identify mode flags
   - Gather conversation history

**Output:**
```json
{
  "intent": "implement",
  "target": "./src/auth",
  "complexity": 0.65,
  "confidence": 0.92,
  "mcp_requirements": ["context7", "sequential"]
}
```

### Phase 2: Routing

The routing phase selects the appropriate command and parameters based on detection results.

**Routing Logic:**

```
IF intent = "build" OR "create" OR "implement"
  → Route to /sc:implement {target} {flags}

IF intent = "analyze" OR "review" OR "examine"
  → Route to /sc:analyze {target} {flags}

IF intent = "improve" OR "refactor" OR "optimize"
  → Route to /sc:improve {target} {flags}

IF intent = "troubleshoot" OR "debug" OR "fix"
  → Route to /sc:troubleshoot {symptoms} {flags}

IF intent = "design" OR "architecture"
  → Route to /sc:design {domain} {flags}
```

**Parameter Extraction:**

| Parameter | Source | Example |
|-----------|--------|---------|
| `command` | Intent classification | "implement" |
| `target` | Object of action | "./src/auth" |
| `flags` | Context modifiers | { "type": "api", "safe": true } |
| `scope` | Complexity analysis | "module" |
| `focus` | Domain keywords | "security" |

### Phase 3: Validation

The validation phase ensures the generated command meets schema requirements.

**Validation Checklist:**

1. **Command Validation**
   - [ ] Command exists
   - [ ] Command is not deprecated
   - [ ] Command permissions are satisfied

2. **Target Validation**
   - [ ] Target path format is valid
   - [ ] Target exists (if required)
   - [ ] Target is accessible

3. **Flag Validation**
   - [ ] All flags are supported
   - [ ] Flag values are valid
   - [ ] No conflicting flags

4. **Security Validation**
   - [ ] No dangerous operations (unless `--safe` is false)
   - [ ] Output format is safe
   - [ ] Resource limits are respected

**Output:**
```json
{
  "valid": true,
  "command": "/sc:implement ./src/auth --type api --safe --validate",
  "confidence": 0.95,
  "warnings": [],
  "suggestions": ["Consider adding --think for complex logic"]
}
```

### Phase 4: Response

The response phase formats and returns the generated command with metadata.

**Response Structure:**

```json
{
  "command": "/sc:implement ./src/auth --type api --safe --validate",
  "confidence": 0.95,
  "reasoning": "Matched /sc:implement pattern for 'build auth API'",
  "metadata": {
    "intent": "implement",
    "target": "./src/auth",
    "flags_applied": ["type=api", "safe", "validate"],
    "complexity": "moderate",
    "estimated_tokens": 8000
  }
}
```

## Resource Management

### Token Budget Allocation

| Phase | Budget | Notes |
|-------|--------|-------|
| Detection | 1-2K tokens | Pattern matching and analysis |
| Routing | 500-1K tokens | Command selection logic |
| Validation | 1-2K tokens | Schema validation |
| Response | 500-1K tokens | Output formatting |
| **Total** | **3-6K tokens** | Standard request |

### MCP Server Coordination

**Server Selection Matrix:**

| Task | Primary Server | Secondary | Notes |
|------|---------------|-----------|-------|
| Command analysis | Sequential | Context7 | Complex routing decisions |
| Pattern matching | - | - | Native capability |
| Validation | Context7 | - | Schema validation |
| Response generation | - | - | Native capability |

**Resource Monitoring:**

```
Green Zone (0-60%): Full capability
├─ All MCP servers available
├─ No token constraints
└─ Standard processing

Yellow Zone (60-75%): Efficiency mode
├─ Cache frequently used patterns
├─ Reduce verbosity
└─ Defer non-critical operations

Orange Zone (75-85%): Constrained mode
├─ Disable advanced features
├─ Use cached results only
└─ Batch operations

Red Zone (85%+): Emergency mode
├─ Essential operations only
├─ Maximum compression
└─ Queue non-critical requests
```

## Performance Optimization

### Caching Strategy

**Cache Levels:**

1. **Pattern Cache** (session-level)
   - Stores successful command patterns
   - TTL: Session duration
   - Size: 100 entries

2. **Context Cache** (short-term)
   - Stores recent command contexts
   - TTL: 5 minutes
   - Size: 50 entries

3. **Result Cache** (operation-level)
   - Stores validated command outputs
   - TTL: 1 minute
   - Size: 200 entries

### Parallelization

**Operations That Can Run in Parallel:**

```
Parallel: [Detect intent, Gather context, Check cache]
         ↓
Sequential: [Route command, Validate output, Format response]
```

**Parallel Execution Benefits:**

| Scenario | Sequential Time | Parallel Time | Savings |
|----------|----------------|---------------|---------|
| Simple request | 100ms | 50ms | 50% |
| Complex request | 500ms | 200ms | 60% |
| With MCP servers | 1000ms | 400ms | 60% |

## Error Handling

### Error Types

| Error Code | Description | Handling |
|------------|-------------|----------|
| `INVALID_INTENT` | Unknown action verb | Suggest alternatives |
| `AMBIGUOUS_INTENT` | Multiple matching commands | Ask for clarification |
| `INVALID_TARGET` | Target path error | Validate and retry |
| `CONFLICTING_FLAGS` | Flag conflict detected | Auto-resolve or error |
| `SECURITY_BLOCK` | Dangerous operation | Block or require --force |
| `RESOURCE_EXHAUSTED` | Token/timeout limit | Defer or simplify |

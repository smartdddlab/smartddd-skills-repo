# Performance Optimization Reference

This document provides guidance on optimizing performance for the SuperClaude Invoker skill.

## Performance Budgets

### Response Time Targets

| Complexity | Target | Maximum | Warning Threshold |
|------------|--------|---------|-------------------|
| Simple | < 100ms | 500ms | 200ms |
| Moderate | < 300ms | 1000ms | 600ms |
| Complex | < 500ms | 3000ms | 2000ms |

### Token Budgets

| Phase | Simple | Moderate | Complex |
|-------|--------|----------|---------|
| Detection | 1K | 2K | 4K |
| Routing | 500 | 1K | 2K |
| Validation | 1K | 2K | 4K |
| Response | 500 | 1K | 2K |
| **Total** | **3K** | **6K** | **12K** |

## Optimization Strategies

### 1. Caching

**Pattern Cache:**
```
Cache successful command patterns
TTL: Session duration
Size: 100 entries
Hit rate target: > 70%
```

**Context Cache:**
```
Cache recent command contexts
TTL: 5 minutes
Size: 50 entries
Hit rate target: > 40%
```

**Result Cache:**
```
Cache validated command outputs
TTL: 1 minute
Size: 200 entries
Hit rate target: > 30%
```

### 2. Parallel Execution

**Operations That Can Run Parallel:**

```python
# Parallel operations
parallel_tasks = [
    "detect_intent",
    "gather_context",
    "check_pattern_cache",
    "check_context_cache"
]

# Sequential operations (dependencies)
sequential_tasks = [
    "route_command",  # Depends on detection
    "validate_output",  # Depends on routing
    "format_response"  # Depends on validation
]
```

**Performance Impact:**

| Strategy | Sequential | Parallel | Improvement |
|----------|------------|----------|-------------|
| Detection only | 100ms | 50ms | 50% |
| Full pipeline | 500ms | 200ms | 60% |
| With MCP servers | 1000ms | 400ms | 60% |

### 3. Token Optimization

**Compression Strategies:**

1. **Symbol Communication**
   - Use symbols for common terms (→, ⇒, ⚡, 🛡️)
   - Reduce verbosity in responses
   - Target 30-50% token reduction

2. **Abbreviation Usage**
   ```
   cfg → configuration
   impl → implementation
   arch → architecture
   perf → performance
   ops → operations
   env → environment
   ```

3. **Structured Output**
   - Use tables instead of lists
   - Use code blocks for examples
   - Minimize prose

### 4. Resource Management

**Resource Zones:**

```yaml
green_zone:
  threshold: 0-60%
  actions:
    - Full capability available
    - All MCP servers active
    - No restrictions

yellow_zone:
  threshold: 60-75%
  actions:
    - Enable caching
    - Reduce verbosity
    - Defer non-critical operations

orange_zone:
  threshold: 75-85%
  actions:
    - Disable advanced features
    - Use cached results only
    - Batch operations

red_zone:
  threshold: 85%+
  actions:
    - Essential operations only
    - Maximum compression
    - Queue non-critical requests
```

## MCP Server Optimization

### Server Selection Matrix

| Task | Primary Server | Secondary | Notes |
|------|---------------|-----------|-------|
| Documentation lookup | Context7 | - | Cache results |
| Complex analysis | Sequential | - | Batch operations |
| UI components | Magic | - | Parallel generation |
| Testing | Playwright | - | Sequential required |

### Server Coordination

**Optimal Patterns:**

```python
# Pattern 1: Sequential only (simple)
if complexity < 0.5:
    use_sequential = False
    use_context7 = True

# Pattern 2: Sequential + Context7 (moderate)
if 0.5 <= complexity < 0.7:
    use_sequential = True
    use_context7 = True

# Pattern 3: All MCP servers (complex)
if complexity >= 0.7:
    use_sequential = True
    use_context7 = True
    use_magic = True
    use_playwright = True
```

### Server Performance Metrics

| Server | Avg Response | P95 | Cache Effectiveness |
|--------|--------------|-----|---------------------|
| Context7 | 150ms | 300ms | 80% |
| Sequential | 500ms | 1000ms | 60% |
| Magic | 200ms | 400ms | 70% |
| Playwright | 1000ms | 2000ms | 50% |

## Performance Monitoring

### Metrics Collection

```json
{
  "metrics": {
    "response_time_ms": 245,
    "tokens_used": 4500,
    "cache_hits": 2,
    "cache_misses": 1,
    "mcp_servers_used": ["context7"],
    "parallel_execution": true,
    "quality_score": 88
  }
}
```

### Performance Thresholds

```yaml
performance_thresholds:
  response_time:
    warning: 500ms
    critical: 1000ms
    emergency: 3000ms

  tokens:
    warning: 10000
    critical: 20000
    emergency: 50000

  cache_hit_rate:
    warning: 50%
    critical: 30%
```

### Performance Reports

**Weekly Report Structure:**
```markdown
## Performance Summary

| Metric | This Week | Last Week | Change |
|--------|-----------|-----------|--------|
| Avg Response | 280ms | 310ms | -9.7% |
| P95 Response | 850ms | 920ms | -7.6% |
| Cache Hit Rate | 65% | 58% | +12% |
| Token Efficiency | 72% | 68% | +5.9% |

## Top Bottlenecks

1. Complex analysis (Sequential MCP) - 35% of requests
2. Validation (Context7) - 25% of requests
3. Response formatting - 15% of requests

## Recommendations

1. Increase cache TTL for pattern cache
2. Batch similar requests
3. Optimize validation schema
```

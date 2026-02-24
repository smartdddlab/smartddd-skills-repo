# UniApp Best Practices

A structured repository of UniApp development best practices optimized for agents and LLMs.

## Structure

- `rules/` - Individual rule files (one per rule)
  - `_template.md` - Template for creating new rules
  - `area-description.md` - Individual rule files
- `SKILL.md` - Main skill definition with quick reference
- `metadata.json` - Document metadata (version, organization, abstract)
- `AGENTS.md` - Compiled output with all rules expanded

## Rule Categories

| Category | Prefix | Impact | Rules |
|----------|--------|--------|-------|
| Cross-Platform | `platform-` | CRITICAL | 4 |
| Performance | `perf-` | HIGH | 5 |
| Components | `component-` | MEDIUM-HIGH | 3 |
| State Management | `state-` | MEDIUM | 2 |
| Routing & Lifecycle | `route-`, `lifecycle-` | MEDIUM | 4 |
| Styling & TypeScript | `style-`, `ts-`, `async-` | LOW-MEDIUM | 4 |

## File Naming Convention

- Files starting with `_` are special (excluded from main list)
- Rule files: `area-description.md` (e.g., `platform-conditional-compile.md`)
- Section is inferred from filename prefix
- Impact levels: CRITICAL > HIGH > MEDIUM-HIGH > MEDIUM > LOW-MEDIUM > LOW

## Creating a New Rule

1. Copy `rules/_template.md` to `rules/area-description.md`
2. Choose the appropriate area prefix:
   - `platform-` for Cross-Platform (CRITICAL)
   - `perf-` for Performance (HIGH)
   - `component-` for Components (MEDIUM-HIGH)
   - `state-` for State Management (MEDIUM)
   - `route-` / `lifecycle-` for Routing (MEDIUM)
   - `style-` / `ts-` / `async-` for Styling/TS (LOW-MEDIUM)
3. Fill in the frontmatter and content
4. Ensure clear bad/good examples with explanations
5. Update SKILL.md quick reference

## Rule File Structure

```markdown
---
title: Rule Title Here
impact: MEDIUM
impactDescription: Optional description of impact
tags: tag1, tag2
---

## Rule Title Here

**Impact: MEDIUM (optional impact description)**

Brief explanation of the rule.

**Incorrect (description):**

```vue
<!-- Bad code example -->
```

**Correct (description):**

```vue
<!-- Good code example -->
```

Reference: [Link](https://example.com)
```

## Impact Levels

- `CRITICAL` - Cross-platform compatibility, app may break
- `HIGH` - Significant performance or user experience impact
- `MEDIUM-HIGH` - Important best practices
- `MEDIUM` - Standard best practices
- `LOW-MEDIUM` - Incremental improvements
- `LOW` - Nice to have

## References

- [UniApp Official Documentation](https://uniapp.dcloud.net.cn/)
- [Vue 3 Documentation](https://vuejs.org/)
- [Pinia Documentation](https://pinia.vuejs.org/)
- [WeChat Mini Program Guide](https://developers.weixin.qq.com/miniprogram/dev/framework/)

---
name: uniapp-best-practices
description: This skill should be used when the user asks about "UniApp best practices", "UniApp 开发规范", "cross-platform development guidelines", "UniApp 性能优化", "UniApp TypeScript", or needs guidance on building high-quality UniApp applications. Provides comprehensive best practices covering API usage, component development, state management, routing, performance optimization, styling, lifecycle management, and TypeScript integration.
version: 2.0.0
author: SmartDDDLab
license: MIT
tags: [uniapp, vue3, cross-platform, best-practices, mobile, miniprogram]
---

# UniApp Best Practices

Comprehensive best practices guide for UniApp cross-platform development. Contains 22 rules across 6 categories, prioritized by impact to guide development and code review.

## When to Apply

Reference these guidelines when:
- Writing new UniApp pages or components
- Handling platform differences (H5, Mini Programs, App)
- Optimizing performance (subpackages, images, lists)
- Implementing state management or routing
- Reviewing code for cross-platform compatibility

## Rule Categories by Priority

| Priority | Category | Impact | Prefix |
|----------|----------|--------|--------|
| 1 | Cross-Platform Compatibility | CRITICAL | `platform-` |
| 2 | Performance Optimization | HIGH | `perf-` |
| 3 | Component Standards | MEDIUM-HIGH | `component-` |
| 4 | State Management | MEDIUM | `state-` |
| 5 | Routing & Lifecycle | MEDIUM | `route-`, `lifecycle-` |
| 6 | Styling & TypeScript | LOW-MEDIUM | `style-`, `ts-`, `async-` |

## Quick Reference

### 1. Cross-Platform Compatibility (CRITICAL)

- `platform-conditional-compile` - Use `#ifdef` for platform-specific code
- `platform-api-wrapper` - Use `uni.*` APIs, not platform-specific APIs
- `platform-nvue-vshow` - Use `v-if` instead of `v-show` in nvue
- `platform-safe-area` - Handle notch and home indicator safe areas

### 2. Performance Optimization (HIGH)

- `perf-subpackages` - Split code into subpackages to reduce main bundle
- `perf-avoid-dom` - Use UniApp APIs, not DOM manipulation
- `perf-image-lazy` - Enable lazy loading for list images
- `perf-image-webp` - Use WebP format and CDN optimization
- `perf-list-paging` - Implement pagination with scroll loading

### 3. Component Standards (MEDIUM-HIGH)

- `component-built-in` - Use built-in components, not HTML tags
- `component-text-required` - Wrap text in `<text>` component
- `component-event-emit` - Use typed `defineEmits` for events

### 4. State Management (MEDIUM)

- `state-pinia-setup` - Use Pinia for global state
- `state-pinia-persist` - Persist state with pinia-plugin-persistedstate

### 5. Routing & Lifecycle (MEDIUM)

- `route-navigate` - Use correct navigation method
- `route-params` - Pass data via URL params or globalData
- `lifecycle-page-hooks` - Use UniApp lifecycle hooks from `@dcloudio/uni-app`
- `lifecycle-pull-refresh` - Handle pull-to-refresh and infinite scroll

### 6. Styling & TypeScript (LOW-MEDIUM)

- `style-rpx` - Use rpx for responsive layout
- `style-conditional-css` - Use conditional compilation for platform styles
- `ts-props-type` - Type props with TypeScript interfaces
- `ts-api-types` - Type API responses with generics
- `async-promise` - Use Promise API with async/await

## How to Use

Read individual rule files for detailed explanations and code examples:

```
rules/platform-conditional-compile.md
rules/perf-subpackages.md
```

Each rule file contains:
- Impact level and description
- Incorrect code example with explanation
- Correct code example with explanation
- Reference to official documentation

## Full Compiled Document

For the complete guide with all rules expanded: `AGENTS.md`

---
title: Avoid DOM Manipulation - Use UniApp APIs
impact: HIGH
impactDescription: DOM APIs don't work on Mini Programs and App
tags: platform, dom, api, compatibility
---

## Avoid DOM Manipulation - Use UniApp APIs

DOM APIs like `document.querySelector` only work on H5. Use UniApp's selector query API for cross-platform compatibility.

**Incorrect (DOM API, H5-only):**

```javascript
// ❌ document API - breaks on Mini Programs and App
const element = document.querySelector('.box')
const rect = element.getBoundingClientRect()
element.style.color = 'red'
```

**Correct (UniApp API):**

```javascript
// ✅ UniApp selector query - works everywhere
const query = uni.createSelectorQuery()
query.select('.box').boundingClientRect((rect) => {
  console.log(rect.width, rect.height)
}).exec()

// ✅ For styling, use reactive data
const boxColor = ref('black')

// In template:
// <view :style="{ color: boxColor }">
```

**Available Query Methods:**

| Method | Description |
|--------|-------------|
| `select(selector)` | Select single element |
| `selectAll(selector)` | Select multiple elements |
| `boundingClientRect(callback)` | Get element bounds |
| `scrollOffset(callback)` | Get scroll position |
| `fields(fields, callback)` | Get custom fields |

Reference: [UniApp Selector Query](https://uniapp.dcloud.net.cn/api/ui/nodes-info.html)

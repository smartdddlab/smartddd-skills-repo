---
title: Use v-if Instead of v-show in nvue Pages
impact: HIGH
impactDescription: Prevents rendering issues in native-rendered pages
tags: platform, nvue, v-if, v-show, native
---

## Use v-if Instead of v-show in nvue Pages

nvue pages use native rendering (Weex) which does not support `v-show`. Using `v-if` ensures compatibility.

**Incorrect (v-show not supported in nvue):**

```vue
<template>
  <!-- ❌ v-show does not work in nvue -->
  <view v-show="isVisible">
    <text>Content</text>
  </view>
</template>
```

**Correct (v-if works in nvue):**

```vue
<template>
  <!-- ✅ v-if works correctly in nvue -->
  <view v-if="isVisible">
    <text>Content</text>
  </view>
</template>
```

**Key nvue Differences:**

| Feature | vue page | nvue page |
|---------|----------|-----------|
| `v-show` | ✅ Supported | ❌ Not supported |
| `v-if` | ✅ Supported | ✅ Supported |
| Layout | CSS flex/grid/block | flex only |
| Text | Anywhere | Must use `<text>` |
| Selectors | All CSS selectors | Limited (class, type, id only) |

Reference: [UniApp nvue Differences](https://uniapp.dcloud.net.cn/tutorial/nvue-outline.html)

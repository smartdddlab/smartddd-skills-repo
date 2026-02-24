---
title: Wrap Text Content in text Component
impact: HIGH
impactDescription: Required for Mini Programs and nvue, prevents rendering issues
tags: component, text, nvue, miniprogram
---

## Wrap Text Content in text Component

In Mini Programs and nvue pages, text must be wrapped in `<text>` component. Direct text in `<view>` is not supported.

**Incorrect (text directly in view, breaks on Mini Programs/nvue):**

```vue
<template>
  <!-- ❌ Text not wrapped - breaks on Mini Programs and nvue -->
  <view class="container">
    Hello World
  </view>

  <!-- ❌ Mixed content without text wrapper -->
  <view>
    Price: ¥{{ price }}
  </view>
</template>
```

**Correct (text wrapped in text component):**

```vue
<template>
  <!-- ✅ Text wrapped in text component -->
  <view class="container">
    <text>Hello World</text>
  </view>

  <!-- ✅ All text content wrapped -->
  <view>
    <text>Price: ¥{{ price }}</text>
  </view>

  <!-- ✅ For rich text, use rich-text component -->
  <rich-text :nodes="htmlContent"></rich-text>
</template>
```

**Component Mapping:**

| HTML | UniApp | Required for text? |
|------|--------|-------------------|
| `<div>` | `<view>` | No, use `<text>` inside |
| `<span>` | `<text>` | Yes, this IS the text component |
| `<p>` | `<text>` | Yes |
| `<img>` | `<image>` | N/A |

Reference: [UniApp Components](https://uniapp.dcloud.net.cn/component/view.html)

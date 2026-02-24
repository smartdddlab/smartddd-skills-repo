---
title: Use Built-in Components Instead of HTML Tags
impact: HIGH
impactDescription: Ensures cross-platform compatibility
tags: component, view, image, navigator, built-in
---

## Use Built-in Components Instead of HTML Tags

UniApp provides cross-platform built-in components. HTML tags like `<div>`, `<img>`, `<a>` only work on H5 and break on Mini Programs/App.

**Incorrect (HTML tags, H5-only):**

```vue
<template>
  <!-- ❌ HTML tags only work on H5 -->
  <div class="container">
    <img src="/static/logo.png" />
    <a href="/pages/detail/detail">Link</a>
    <span>Text</span>
  </div>
</template>
```

**Correct (UniApp built-in components):**

```vue
<template>
  <!-- ✅ Built-in components work everywhere -->
  <view class="container">
    <image src="/static/logo.png" mode="aspectFit" />
    <navigator url="/pages/detail/detail">
      <text>Link</text>
    </navigator>
    <text>Text</text>
  </view>
</template>
```

**Component Mapping Table:**

| HTML Tag | UniApp Component | Notes |
|----------|------------------|-------|
| `<div>` | `<view>` | Container |
| `<span>`, `<p>` | `<text>` | Required for text |
| `<img>` | `<image>` | Use `mode` attribute |
| `<a>` | `<navigator>` | Use `url` attribute |
| `<input>` | `<input>` | Similar API |
| `<video>` | `<video>` | Similar API |
| `<iframe>` | `<web-view>` | Web content |
| `<select>` | `<picker>` | Selection |

Reference: [UniApp Components](https://uniapp.dcloud.net.cn/component/view.html)

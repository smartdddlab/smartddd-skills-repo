---
title: Use Conditional Compilation for Platform-Specific Styles
impact: MEDIUM
impactDescription: Proper styling across platforms
tags: style, conditional, platform, css
---

## Use Conditional Compilation for Platform-Specific Styles

Different platforms may need different styles. Use CSS conditional compilation for platform-specific styling.

**Incorrect (runtime style switching, less efficient):**

```vue
<script setup>
const isH5 = process.env.UNI_PLATFORM === 'h5'
</script>

<template>
  <!-- ❌ Runtime check, less efficient -->
  <view :class="{ 'h5-header': isH5, 'mp-header': !isH5 }">
  </view>
</template>
```

**Correct (compile-time conditional styles):**

```css
/* ✅ Compile-time conditional compilation */
.header {
  height: 88rpx;
  background: #fff;
}

/* #ifdef H5 */
.header {
  position: fixed;
  top: 0;
  z-index: 100;
}
/* #endif */

/* #ifdef MP-WEIXIN */
.header {
  /* WeChat Mini Program navigation button space */
  padding-right: 87px;
}
/* #endif */

/* #ifdef APP-PLUS */
.header {
  padding-top: var(--status-bar-height);
}
/* #endif */
```

Reference: [UniApp Conditional CSS](https://uniapp.dcloud.net.cn/tutorial/platform-difference.html#%E6%9D%A1%E4%BB%B6%E7%BC%96%E8%AF%91)

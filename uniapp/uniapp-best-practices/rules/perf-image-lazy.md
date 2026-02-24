---
title: Enable Lazy Loading for Images in Lists
impact: MEDIUM-HIGH
impactDescription: Reduces initial load time and memory usage
tags: performance, image, lazy-load, list
---

## Enable Lazy Loading for Images in Lists

Images in long lists should use `lazy-load` to defer loading until needed, improving initial render performance.

**Incorrect (all images load immediately):**

```vue
<template>
  <scroll-view scroll-y>
    <view v-for="item in list" :key="item.id">
      <!-- ❌ All images load at once, slow initial render -->
      <image :src="item.image" mode="aspectFill" />
    </view>
  </scroll-view>
</template>
```

**Correct (lazy loading enabled):**

```vue
<template>
  <scroll-view scroll-y>
    <view v-for="item in list" :key="item.id">
      <!-- ✅ Images load when near viewport -->
      <image :src="item.image" mode="aspectFill" lazy-load />
    </view>
  </scroll-view>
</template>
```

**Image Optimization Tips:**

```vue
<template>
  <!-- ✅ Combine lazy-load with optimized mode -->
  <image
    :src="optimizedImageUrl"
    mode="aspectFill"
    lazy-load
    @error="handleImageError"
  />
</template>

<script setup>
// Use CDN image processing for optimal size
function getOptimizedImageUrl(url, width = 375) {
  // Example: Aliyun OSS
  return `${url}?x-oss-process=image/resize,w_${width}`
}
</script>
```

Reference: [UniApp Image Component](https://uniapp.dcloud.net.cn/component/image.html)

---
title: Use WebP Format and CDN Optimization for Images
impact: MEDIUM
impactDescription: Smaller image sizes, faster loading
tags: performance, image, webp, cdn
---

## Use WebP Format and CDN Optimization for Images

Use WebP format and CDN transformation parameters to reduce image size.

**Incorrect (unoptimized images):**

```vue
<template>
  <!-- ❌ Large unoptimized image -->
  <image src="https://example.com/large-image.jpg" />
</template>
```

**Correct (optimized with WebP and CDN):**

```vue
<template>
  <!-- ✅ WebP with fallback -->
  <image
    :src="getOptimizedImage(imageUrl, 375)"
    mode="aspectFill"
    lazy-load
  />
</template>

<script setup>
function getOptimizedImage(url: string, width: number): string {
  // Aliyun OSS
  if (url.includes('aliyuncs.com')) {
    return `${url}?x-oss-process=image/resize,w_${width}/format,webp/quality,q_80`
  }

  // Tencent COS
  if (url.includes('myqcloud.com')) {
    return `${url}?imageMogr2/thumbnail/${width}x/format/webp/quality/80`
  }

  // Qiniu
  if (url.includes('qiniucdn.com')) {
    return `${url}?imageView2/2/w/${width}/format/webp/q/80`
  }

  return url
}
</script>
```

Reference: [UniApp Image](https://uniapp.dcloud.net.cn/component/image.html)

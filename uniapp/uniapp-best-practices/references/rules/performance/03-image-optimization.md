# 图片优化规范

## 规则 ID

`performance-03-image-optimization`

## 规则说明

图片是移动应用中占用资源最多的部分，正确优化可以显著提升加载速度和用户体验。

## 图片格式选择

| 格式 | 适用场景 | 透明度 | 压缩率 |
|------|----------|--------|--------|
| WebP | 首选格式 | 支持 | 高 |
| PNG | 图标、透明图 | 支持 | 低 |
| JPEG | 照片 | 不支持 | 中 |
| SVG | 矢量图标 | 支持 | - |

## 图片使用规范

### 1. 使用 image 组件

```vue
<template>
  <!-- ✅ 正确：使用 image 组件 -->
  <image src="/static/logo.png" mode="aspectFit" />

  <!-- ❌ 错误：使用 img 标签 -->
  <img src="/static/logo.png" />
</template>
```

### 2. mode 属性

```vue
<template>
  <!-- scaleToFill: 不保持比例，拉伸填满 -->
  <image src="..." mode="scaleToFill" />

  <!-- aspectFit: 保持比例，完整显示 -->
  <image src="..." mode="aspectFit" />

  <!-- aspectFill: 保持比例，填满裁剪 -->
  <image src="..." mode="aspectFill" />

  <!-- widthFix: 宽度不变，高度自动 -->
  <image src="..." mode="widthFix" />

  <!-- heightFix: 高度不变，宽度自动 -->
  <image src="..." mode="heightFix" />
</template>
```

### 3. 懒加载

```vue
<template>
  <!-- 开启懒加载 -->
  <image
    :src="item.image"
    mode="aspectFill"
    lazy-load
  />
</template>
```

### 4. 图片路径

```vue
<template>
  <!-- ✅ 正确：使用绝对路径 -->
  <image src="/static/logo.png" />

  <!-- ✅ 正确：网络图片 -->
  <image src="https://example.com/image.jpg" />

  <!-- ✅ 正确：base64（小图标） -->
  <image :src="base64Icon" />

  <!-- ❌ 错误：相对路径可能出错 -->
  <image src="../../static/logo.png" />
</template>

<script setup>
// 动态路径需要 require 或 import
const base64Icon = 'data:image/png;base64,iVBORw0KGgo...'
</script>
```

## 图片压缩

### 1. 构建时压缩

```javascript
// vue.config.js
module.exports = {
  chainWebpack: (config) => {
    config.module
      .rule('images')
      .use('image-webpack-loader')
      .loader('image-webpack-loader')
      .options({
        mozjpeg: { quality: 80 },
        pngquant: { quality: [0.65, 0.9] },
        webp: { quality: 80 }
      })
  }
}
```

### 2. 使用 WebP 格式

```vue
<template>
  <!-- #ifdef H5 -->
  <picture>
    <source srcset="/static/image.webp" type="image/webp">
    <source srcset="/static/image.jpg" type="image/jpeg">
    <img src="/static/image.jpg" alt="">
  </picture>
  <!-- #endif -->

  <!-- #ifndef H5 -->
  <image src="/static/image.jpg" mode="aspectFill" />
  <!-- #endif -->
</template>
```

### 3. CDN 图片处理

```typescript
// 使用 CDN 图片处理参数
function getImageUrl(url: string, width: number, quality = 80) {
  // 阿里云 OSS
  if (url.includes('aliyuncs.com')) {
    return `${url}?x-oss-process=image/resize,w_${width}/quality,q_${quality}`
  }

  // 腾讯云 COS
  if (url.includes('myqcloud.com')) {
    return `${url}?imageMogr2/thumbnail/${width}x/quality/${quality}`
  }

  // 七牛云
  if (url.includes('qiniucdn.com')) {
    return `${url}?imageView2/2/w/${width}/q/${quality}`
  }

  return url
}

// 使用
const optimizedUrl = getImageUrl(imageUrl, 375, 80)
```

## 图片预加载

```typescript
// 预加载图片
function preloadImages(urls: string[]) {
  return Promise.all(
    urls.map(url => {
      return new Promise((resolve, reject) => {
        uni.getImageInfo({
          src: url,
          success: resolve,
          fail: reject
        })
      })
    })
  )
}

// 使用
await preloadImages(['/static/bg1.jpg', '/static/bg2.jpg'])
```

## 图片缓存

```vue
<template>
  <image
    :src="cachedImageUrl"
    mode="aspectFill"
    @error="handleImageError"
  />
</template>

<script setup>
import { computed, ref } from 'vue'

const props = defineProps({
  imageUrl: String
})

const imageCache = new Map()

const cachedImageUrl = computed(() => {
  const url = props.imageUrl
  if (imageCache.has(url)) {
    return imageCache.get(url)
  }
  return url
})

function handleImageError() {
  // 加载失败时使用默认图片
  imageCache.set(props.imageUrl, '/static/default.png')
}
</script>
```

## 图片尺寸规范

### 1. 适配不同屏幕

```typescript
// 根据屏幕宽度选择图片尺寸
function getResponsiveImageUrl(url: string) {
  const screenWidth = uni.getSystemInfoSync().screenWidth

  let width = 375
  if (screenWidth >= 750) {
    width = 750
  } else if (screenWidth >= 375) {
    width = 375
  }

  return getImageUrl(url, width)
}
```

### 2. 使用 rpx 单位

```vue
<style>
.avatar {
  width: 100rpx;
  height: 100rpx;
  border-radius: 50%;
}

.banner {
  width: 750rpx;
  height: 400rpx;
}
</style>
```

## 大图优化

### 1. 长图分块加载

```vue
<template>
  <scroll-view scroll-y class="scroll-container">
    <view v-for="(block, index) in imageBlocks" :key="index">
      <image
        :src="block.url"
        mode="widthFix"
        lazy-load
      />
    </view>
  </scroll-view>
</template>

<script setup>
import { ref } from 'vue'

const imageBlocks = ref([
  { url: '/static/long-image/part1.jpg' },
  { url: '/static/long-image/part2.jpg' },
  { url: '/static/long-image/part3.jpg' }
])
</script>
```

### 2. 图片预览

```typescript
// 使用 uni.previewImage 预览大图
function previewImage(current: string, urls: string[]) {
  uni.previewImage({
    current,
    urls
  })
}

// 使用
<image
  :src="thumbnailUrl"
  @click="previewImage(imageUrl, imageList)"
/>
```

## 最佳实践总结

1. **格式选择**：优先 WebP，其次 JPEG/PNG
2. **懒加载**：列表图片开启 lazy-load
3. **CDN 优化**：使用 CDN 图片处理参数
4. **响应式**：根据屏幕尺寸加载合适大小
5. **缓存**：利用本地缓存减少重复加载
6. **占位图**：加载中显示占位图

## 相关规则

- [performance-01-subpackages](./01-subpackages.md)
- [performance-02-long-list](./02-long-list.md)

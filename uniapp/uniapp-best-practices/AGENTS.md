# UniApp Best Practices

**Version 2.0.0**
SmartDDDLab
February 2026

> **Note:**
> This document is optimized for AI agents and LLMs. It provides
> comprehensive best practices for UniApp cross-platform development,
> designed for automated code review and generation.

---

## Abstract

Comprehensive best practices guide for UniApp cross-platform development (iOS, Android, Web, Mini Programs). Contains 22 rules across 6 categories, prioritized by impact. Each rule includes Incorrect/correct code examples to guide development.

---

## Table of Contents

1. [Cross-Platform Compatibility](#1-cross-platform-compatibility) — **CRITICAL**
   - 1.1 [Use Conditional Compilation](#11-use-conditional-compilation)
   - 1.2 [Use uni.* API Wrapper](#12-use-uni-api-wrapper)
   - 1.3 [Handle Safe Areas](#13-handle-safe-areas)
   - 1.4 [Use v-if in nvue](#14-use-v-if-in-nvue)
2. [Performance Optimization](#2-performance-optimization) — **HIGH**
   - 2.1 [Use Subpackages](#21-use-subpackages)
   - 3.2 [Enable Image Lazy Loading](#22-enable-image-lazy-loading)
   - 3.3 [Use WebP and CDN](#23-use-webp-and-cdn)
   - 3.4 [Use Pagination for Lists](#24-use-pagination-for-lists)
   - 3.5 [Avoid DOM Manipulation](#25-avoid-dom-manipulation)
3. [Component Standards](#3-component-standards) — **MEDIUM-HIGH**
   - 4.1 [Use Built-in Components](#31-use-built-in-components)
   - 4.2 [Wrap Text in text Component](#32-wrap-text-in-text-component)
   - 4.3 [Use defineEmits for Events](#33-use-defineemits)
4. [State Management](#4-state-management) — **MEDIUM**
   - 5.1 [Use Pinia for State](#41-use-pinia-for-state)
   - 5.2 [Persist State with Plugin](#42-persist-state)
5. [Routing & Lifecycle](#5-routing--lifecycle) — **MEDIUM**
   - 6.1 [Choose Correct Navigation Method](#51-choose-correct-navigation)
   - 6.2 [Pass Data Between Pages](#52-pass-data-between-pages)
   - 6.3 [Use Page Lifecycle Hooks](#53-use-page-lifecycle-hooks)
   - 6.4 [Handle Pull-Refresh and Scroll](#54-handle-pull-refresh)
6. [Styling & TypeScript](#6-styling--typescript) — **LOW-MEDIUM**
   - 7.1 [Use rpx for Responsive Layout](#61-use-rpx-for-responsive-layout)
   - 7.2 [Use Conditional CSS](#62-use-conditional-css)
   - 7.3 [Type Props with TypeScript](#63-type-props)
   - 7.4 [Type API Responses](#64-type-api-responses)
   - 7.5 [Use Promise API](#65-use-promise-api)

---

## 1. Cross-Platform Compatibility

**Impact: CRITICAL**

Cross-platform compatibility is the core value of UniApp. These rules ensure code works across H5, Mini Programs, and native App.

### 1.1 Use Conditional Compilation

**Impact: CRITICAL**

Use `#ifdef` / `#endif` for compile-time platform-specific code instead of runtime checks.

**Incorrect (runtime check, all code in bundle):**

```javascript
// ❌ Runtime check - both branches are bundled
if (process.env.UNI_PLATFORM === 'mp-weixin') {
  wx.login()
} else if (process.env.UNI_PLATFORM === 'mp-alipay') {
  my.getAuthCode()
}
```

**Correct (compile-time, only matching platform):**

```javascript
// ✅ Conditional compilation
// #ifdef MP-WEIXIN
wx.login()
// #endif

// #ifdef MP-ALIPAY
my.getAuthCode()
// #endif
```

### 1.2 Use uni.* API Wrapper

**Impact: CRITICAL**

Always use `uni.*` APIs instead of platform-specific APIs for cross-platform compatibility.

**Incorrect (platform-specific):**

```javascript
// ❌ WeChat only
wx.request({ url: '/api/data' })

// ❌ Alipay only
my.request({ url: '/api/data' })
```

**Correct (cross-platform):**

```javascript
// ✅ Works everywhere
uni.request({ url: '/api/data' })

// ✅ With async/await
const [err, res] = await uni.request({ url: '/api/data' })
```

### 1.3 Handle Safe Areas

**Impact: HIGH**

iOS devices have notches that can hide UI content. Use safe area insets.

**Incorrect (content hidden):**

```css
.header {
  position: fixed;
  top: 0;
}

.footer {
  position: fixed;
  bottom: 0;
}
```

**Correct (safe area aware):**

```css
.header {
  padding-top: env(safe-area-inset-top);
}

.footer {
  padding-bottom: env(safe-area-inset-bottom);
}
```

### 1.4 Use v-if in nvue

**Impact: HIGH**

nvue pages don't support `v-show`. Use `v-if` instead.

**Incorrect:**

```vue
<view v-show="isVisible">Content</view>
```

**Correct:**

```vue
<view v-if="isVisible">Content</view>
```

---

## 2. Performance Optimization
**Impact: HIGH**

### 2.1 Use Subpackages

**Impact: HIGH**

Split code into subpackages to reduce main bundle size.

**Incorrect (all in main):**

```json
{
  "pages": [
    "pages/index/index",
    "pages/user/profile",
    "pages/order/list"
    "pages/order/detail"
  ]
}
```

**Correct (subpackages):**

```json
{
  "pages": ["pages/index/index"],
  "subPackages": [
    {
      "root": "pages-user",
      "pages": ["profile/profile"]
    },
    {
      "root": "pages-order",
      "pages": ["list/list", "detail/detail"]
    }
  ]
}
```

### 2.2 Enable Image Lazy Loading

**Impact: MEDIUM-HIGH**

Use `lazy-load` for images in lists.

```vue
<image :src="item.image" lazy-load mode="aspectFill" />
```

### 2.3 Use WebP and CDN

**Impact: MEDIUM**

Use WebP format and CDN transformation for smaller images.

```javascript
// Aliyun OSS
const url = `${baseUrl}?x-oss-process=image/resize,w_375/format,webp/quality,q_80`
```

### 2.4 Use Pagination for Lists

**Impact: MEDIUM**

Implement pagination with `scrolltolower` event.

```vue
<scroll-view scroll-y @scrolltolower="loadMore">
  <view v-for="item in list" :key="item.id">
    <text>{{ item.name }}</text>
  </view>
</scroll-view>
```

### 2.5 Avoid DOM Manipulation

**Impact: HIGH**

DOM APIs don't work on Mini Programs. Use UniApp's selector query.

**Incorrect:**

```javascript
const element = document.querySelector('.box')
```

**Correct:**

```javascript
const query = uni.createSelectorQuery()
query.select('.box').boundingClientRect((rect) => {
  console.log(rect)
}).exec()
```

---

## 3. Component Standards
**Impact: MEDIUM-HIGH**

### 3.1 Use Built-in Components

**Impact: HIGH**

Use UniApp built-in components instead of HTML tags.

| HTML | UniApp |
|------|--------|
| `<div>` | `<view>` |
| `<span>` | `<text>` |
| `<img>` | `<image>` |
| `<a>` | `<navigator>` |

### 3.2 Wrap Text in text Component

**Impact: HIGH**

Text must be wrapped in `<text>` for Mini Programs and nvue.

```vue
<view>
  <text>Hello World</text>
</view>
```

### 3.3 Use defineEmits for Events

**Impact: MEDIUM**

```vue
<script setup lang="ts">
const emit = defineEmits<{
  update: [user: User]
  delete: [id: number]
}>()
</script>
```

---

## 4. State Management
**Impact: MEDIUM**

### 4.1 Use Pinia for State

```typescript
import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({ token: '', userInfo: null }),
  actions: {
    async login(credentials) { /* ... */ }
  }
})
```

### 4.2 Persist State with Plugin

Use `pinia-plugin-persistedstate` for automatic persistence.

---

## 5. Routing & Lifecycle
**Impact: MEDIUM**

### 5.1 Choose Correct Navigation Method

| Method | Use Case |
|--------|----------|
| `navigateTo` | Normal navigation |
| `redirectTo` | Login success |
| `switchTab` | TabBar pages |
| `navigateBack` | Go back |

### 5.2 Pass Data Between Pages

- Simple data: URL params
- Complex data: globalData or events

### 5.3 Use Page Lifecycle Hooks

```vue
<script setup>
import { onLoad, onShow } from '@dcloudio/uni-app'

onLoad((options) => {
  console.log('Page params:', options)
})
</script>
```

### 5.4 Handle Pull-Refresh and Scroll

```vue
<script setup>
import { onPullDownRefresh } from '@dcloudio/uni-app'

onPullDownRefresh(async () => {
  list.value = await fetchList()
  uni.stopPullDownRefresh()
})
</script>
```

---

## 6. Styling & TypeScript
**Impact: LOW-MEDIUM**

### 6.1 Use rpx for Responsive Layout

Screen width = 750rpx. Use rpx for automatic adaptation.

```css
.container {
  width: 750rpx;  /* Full width */
  padding: 30rpx;
}
```

### 6.2 Use Conditional CSS

```css
/* #ifdef H5 */
.header { position: fixed; }
/* #endif */
```

### 6.3 Type Props with TypeScript

```vue
<script setup lang="ts">
interface Props {
  title: string
  count?: number
}

const props = defineProps<Props>()
</script>
```

### 6.4 Type API Responses

```typescript
async function request<T>(options: RequestOptions): Promise<T> {
  // Typed wrapper
}
```

### 6.5 Use Promise API

```javascript
// ✅ Clean async/await
const [err, res] = await uni.request({ url: '/api/data' })
```

---

## References

- [UniApp Official Documentation](https://uniapp.dcloud.net.cn/)
- [Vue 3 Documentation](https://vuejs.org/)
- [Pinia Documentation](https://pinia.vuejs.org/)
- [WeChat Mini Program Guide](https://developers.weixin.qq.com/miniprogram/dev/framework/)

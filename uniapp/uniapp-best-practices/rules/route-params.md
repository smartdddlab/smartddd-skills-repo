---
title: Pass Data Between Pages via URL Params or GlobalData
impact: MEDIUM
impactDescription: Proper data flow between pages
tags: route, params, globalData, communication
---

## Pass Data Between Pages via URL Params or GlobalData

Choose the right method based on data size and complexity.

**Incorrect (passing large objects via URL):**

```javascript
// ❌ URL too long, may fail
const data = { id: 1, name: 'test', items: [...] }
uni.navigateTo({
  url: `/pages/detail/detail?data=${JSON.stringify(data)}`
})
```

**Correct (choose method based on data size):**

```javascript
// ✅ Simple data: URL params
uni.navigateTo({
  url: `/pages/detail/detail?id=${id}&name=${encodeURIComponent(name)}`
})

// ✅ Complex data: globalData
getApp().globalData.tempData = complexObject
uni.navigateTo({ url: '/pages/detail/detail' })

// ✅ Events for callback
uni.$emit('itemSelected', selectedItem)
uni.navigateTo({ url: '/pages/detail/detail' })
```

**Data Passing Methods:**

| Method | Capacity | Use Case |
|--------|----------|----------|
| URL params | Limited | Simple IDs, flags |
| globalData | Unlimited | Complex objects |
| Events | Unlimited | Callback data |
| Pinia store | Unlimited | Shared state |
| Storage | 10MB+ | Persistent data |

**Receiving page:**

```vue
<script setup>
import { onLoad, onUnload } from '@dcloudio/uni-app'

// From URL
onLoad((options) => {
  const id = options.id
  const name = decodeURIComponent(options.name)
})

// From globalData
const data = getApp().globalData.tempData
getApp().globalData.tempData = null // Clean up

// From event
onLoad(() => {
  uni.$on('itemSelected', (item) => {
    console.log('Selected:', item)
  })
})

onUnload(() => {
  uni.$off('itemSelected') // Clean up listener
})
</script>
```

Reference: [UniApp Page Communication](https://uniapp.dcloud.net.cn/tutorial/page.html#页面通讯)

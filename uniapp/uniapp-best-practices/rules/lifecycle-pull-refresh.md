---
title: Handle Pull-to-Refresh and Infinite Scroll
impact: MEDIUM
impactDescription: Standard mobile UX patterns
tags: lifecycle, pull-refresh, scroll, loading
---

## Handle Pull-to-Refresh and Infinite Scroll

Use UniApp's built-in lifecycle hooks for standard mobile UX patterns.

**Correct implementation:**

```vue
<template>
  <!-- Enable pull-to-refresh in pages.json first -->
  <scroll-view
    scroll-y
    @scrolltolower="loadMore"
  >
    <view v-for="item in list" :key="item.id">
      <text>{{ item.name }}</text>
    </view>
  </scroll-view>
</template>

<script setup>
import { ref } from 'vue'
import { onPullDownRefresh, onReachBottom } from '@dcloudio/uni-app'

const list = ref([])
const page = ref(1)
const loading = ref(false)
const noMore = ref(false)

// ✅ Pull-to-refresh
onPullDownRefresh(async () => {
  page.value = 1
  noMore.value = false
  try {
    list.value = await fetchList(1)
  } finally {
    uni.stopPullDownRefresh() // Must call this!
  }
})

// ✅ Infinite scroll
onReachBottom(async () => {
  if (loading.value || noMore.value) return

  loading.value = true
  try {
    const newData = await fetchList(page.value + 1)
    if (newData.length === 0) {
      noMore.value = true
    } else {
      list.value.push(...newData)
      page.value++
    }
  } finally {
    loading.value = false
  }
})
</script>
```

**pages.json configuration:**

```json
{
  "path": "pages/list/list",
  "style": {
    "navigationBarTitleText": "List",
    "enablePullDownRefresh": true,
    "onReachBottomDistance": 50
  }
}
```

Reference: [UniApp Page Events](https://uniapp.dcloud.net.cn/tutorial/page.html#页面事件)

---
title: Implement Pagination for Long Lists
impact: MEDIUM-HIGH
impactDescription: Prevents memory issues and improves scroll performance
tags: performance, list, pagination, scroll
---

## Implement Pagination for Long Lists

Long lists should use pagination to avoid memory issues. Use `@scrolltolower` to trigger loading more data.

**Incorrect (load all data at once):**

```vue
<script setup>
// ❌ Loads all 1000+ items at once
const list = ref([])

onMounted(async () => {
  list.value = await fetchAllItems() // Memory issue
})
</script>
```

**Correct (pagination with scroll loading):**

```vue
<template>
  <scroll-view
    scroll-y
    class="scroll-list"
    @scrolltolower="loadMore"
  >
    <view v-for="item in list" :key="item.id">
      <text>{{ item.name }}</text>
    </view>

    <view v-if="loading" class="loading">
      <text>Loading...</text>
    </view>

    <view v-if="noMore" class="no-more">
      <text>No more data</text>
    </view>
  </scroll-view>
</template>

<script setup>
const list = ref([])
const page = ref(1)
const loading = ref(false)
const noMore = ref(false)
const pageSize = 20

async function loadMore() {
  if (loading.value || noMore.value) return

  loading.value = true
  try {
    const newData = await fetchItems(page.value, pageSize)
    if (newData.length < pageSize) {
      noMore.value = true
    }
    list.value.push(...newData)
    page.value++
  } finally {
    loading.value = false
  }
}

onMounted(() => loadMore())
</script>
```

Reference: [UniApp Scroll View](https://uniapp.dcloud.net.cn/component/scroll-view.html)

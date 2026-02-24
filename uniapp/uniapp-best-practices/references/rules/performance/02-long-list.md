# 长列表优化规范

## 规则 ID

`performance-02-long-list`

## 规则说明

长列表是移动端常见的性能瓶颈，正确优化可以显著提升用户体验。

## 性能问题

- 大量 DOM 节点占用内存
- 频繁渲染导致卡顿
- 滚动不流畅

## 优化方案

### 1. 分页加载

```vue
<template>
  <scroll-view
    scroll-y
    class="scroll-list"
    @scrolltolower="loadMore"
  >
    <view v-for="item in list" :key="item.id" class="item">
      <text>{{ item.name }}</text>
    </view>

    <!-- 加载状态 -->
    <view class="loading" v-if="loading">
      <text>加载中...</text>
    </view>

    <!-- 没有更多 -->
    <view class="no-more" v-if="noMore">
      <text>没有更多了</text>
    </view>
  </scroll-view>
</template>

<script setup>
import { ref } from 'vue'

const list = ref([])
const page = ref(1)
const loading = ref(false)
const noMore = ref(false)
const pageSize = 20

async function loadMore() {
  if (loading.value || noMore.value) return

  loading.value = true

  try {
    const newData = await fetchData(page.value, pageSize)

    if (newData.length < pageSize) {
      noMore.value = true
    }

    list.value.push(...newData)
    page.value++
  } finally {
    loading.value = false
  }
}

// 初始化加载
loadMore()
</script>
```

### 2. 虚拟列表

```vue
<template>
  <!-- 使用 scroll-view 实现简单虚拟列表 -->
  <scroll-view
    scroll-y
    :style="{ height: listHeight + 'px' }"
    @scroll="handleScroll"
  >
    <!-- 撑开高度的占位 -->
    <view :style="{ height: totalHeight + 'px', position: 'relative' }">
      <!-- 可见区域的列表项 -->
      <view
        v-for="item in visibleItems"
        :key="item.id"
        :style="{
          position: 'absolute',
          top: item.offset + 'px',
          width: '100%'
        }"
      >
        <view class="item">
          <text>{{ item.data.name }}</text>
        </view>
      </view>
    </view>
  </scroll-view>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

const props = defineProps({
  items: { type: Array, default: () => [] },
  itemHeight: { type: Number, default: 100 }
})

const listHeight = ref(600)
const scrollTop = ref(0)
const bufferSize = 5

// 总高度
const totalHeight = computed(() => {
  return props.items.length * props.itemHeight
})

// 可见项数量
const visibleCount = computed(() => {
  return Math.ceil(listHeight.value / props.itemHeight) + bufferSize * 2
})

// 可见项
const visibleItems = computed(() => {
  const startIndex = Math.max(0, Math.floor(scrollTop.value / props.itemHeight) - bufferSize)
  const endIndex = Math.min(props.items.length, startIndex + visibleCount.value)

  return props.items.slice(startIndex, endIndex).map((item, index) => ({
    id: item.id,
    data: item,
    offset: (startIndex + index) * props.itemHeight
  }))
})

function handleScroll(e) {
  scrollTop.value = e.detail.scrollTop
}
</script>
```

### 3. 使用 list 组件（nvue）

```vue
<template>
  <!-- nvue 使用 list 组件，原生渲染，性能更好 -->
  <list class="list" @loadmore="loadMore">
    <cell v-for="item in list" :key="item.id">
      <view class="item">
        <text>{{ item.name }}</text>
      </view>
    </cell>

    <!-- 加载更多组件 -->
    <cell>
      <view class="loading">
        <text>加载中...</text>
      </view>
    </cell>
  </list>
</template>

<script setup>
import { ref } from 'vue'

const list = ref([])

function loadMore() {
  // 加载更多数据
}
</script>
```

### 4. 避免复杂计算

```vue
<template>
  <view v-for="item in list" :key="item.id">
    <!-- ❌ 错误：每次渲染都计算 -->
    <text>{{ formatPrice(item.price * item.count) }}</text>

    <!-- ✅ 正确：使用预处理数据 -->
    <text>{{ item.displayPrice }}</text>
  </view>
</template>

<script setup>
import { computed } from 'vue'

const list = ref([])

// 预处理数据
const processedList = computed(() => {
  return list.value.map(item => ({
    ...item,
    displayPrice: formatPrice(item.price * item.count)
  }))
})

function formatPrice(price) {
  return '¥' + price.toFixed(2)
}
</script>
```

### 5. 减少响应式数据

```vue
<script setup>
import { ref, shallowRef } from 'vue'

// ❌ 大列表使用 ref（深度响应式）
const list = ref([])

// ✅ 大列表使用 shallowRef（浅层响应式）
const list = shallowRef([])

// 更新时整体替换
async function loadData() {
  const data = await fetchData()
  list.value = data  // 只追踪整体变化
}
</script>
```

### 6. Object.freeze 冻结数据

```typescript
// 冻结列表数据，避免 Vue 追踪每个对象
async function loadData() {
  const data = await fetchData()
  list.value = Object.freeze(data)
}
```

## 下拉刷新

```vue
<template>
  <scroll-view
    scroll-y
    refresher-enabled
    :refresher-triggered="isRefreshing"
    @refresherrefresh="onRefresh"
    @scrolltolower="loadMore"
  >
    <view v-for="item in list" :key="item.id">
      <text>{{ item.name }}</text>
    </view>
  </scroll-view>
</template>

<script setup>
import { ref } from 'vue'

const list = ref([])
const isRefreshing = ref(false)

async function onRefresh() {
  isRefreshing.value = true
  try {
    list.value = await fetchData(1, 20)
  } finally {
    isRefreshing.value = false
  }
}
</script>
```

## 最佳实践总结

| 优化方式 | 适用场景 | 复杂度 |
|----------|----------|--------|
| 分页加载 | 一般列表 | 低 |
| 虚拟列表 | 超长列表（1000+） | 高 |
| nvue list | App 原生渲染 | 低 |
| shallowRef | 大数据量 | 低 |
| Object.freeze | 只读列表 | 低 |

## 相关规则

- [performance-01-subpackages](./01-subpackages.md)
- [performance-03-image-optimization](./03-image-optimization.md)

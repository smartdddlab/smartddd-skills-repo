# 页面生命周期规范

## 规则 ID

`lifecycle-01-page-lifecycle`

## 规则说明

UniApp 页面生命周期基于小程序规范，正确使用生命周期对于数据加载和资源管理至关重要。

## 生命周期概览

```
┌─────────────────────────────────────────────────────┐
│                                                     │
│  onLoad ──► onShow ──► onReady ──► onHide          │
│                           │                         │
│                           ▼                         │
│                     onPullDownRefresh               │
│                           │                         │
│                     onReachBottom                   │
│                           │                         │
│  onShow ◄── onHide ◄────┘                         │
│     │                                               │
│     ▼                                               │
│  onUnload                                          │
│                                                     │
└─────────────────────────────────────────────────────┘
```

## 主要生命周期

### onLoad

页面加载时触发，可获取页面参数。

```vue
<script setup>
import { ref } from 'vue'
import { onLoad } from '@dcloudio/uni-app'

const id = ref('')
const detail = ref(null)

onLoad(async (options) => {
  // 获取 URL 参数
  id.value = options.id || ''

  // 加载数据
  detail.value = await fetchDetail(id.value)

  console.log('页面加载，参数：', options)
})
</script>
```

### onShow

页面显示/切入前台时触发。

```vue
<script setup>
import { onShow } from '@dcloudio/uni-app'

onShow(() => {
  // 每次显示都执行
  console.log('页面显示')

  // 刷新数据
  refreshData()
})
</script>
```

### onReady

页面初次渲染完成时触发。

```vue
<script setup>
import { onReady } from '@dcloudio/uni-app'

onReady(() => {
  // 页面渲染完成，可以获取节点信息
  console.log('页面渲染完成')

  // 获取元素尺寸
  const query = uni.createSelectorQuery()
  query.select('.box').boundingClientRect((rect) => {
    console.log('元素尺寸：', rect)
  }).exec()
})
</script>
```

### onHide

页面隐藏/切入后台时触发。

```vue
<script setup>
import { onHide } from '@dcloudio/uni-app'

onHide(() => {
  console.log('页面隐藏')

  // 暂停操作（如视频、音频）
  pauseMedia()

  // 保存草稿
  saveDraft()
})
</script>
```

### onUnload

页面卸载时触发。

```vue
<script setup>
import { onUnload } from '@dcloudio/uni-app'

onUnload(() => {
  console.log('页面卸载')

  // 清理资源
  cleanup()

  // 移除事件监听
  uni.$off('eventName')
})
</script>
```

## 交互生命周期

### 下拉刷新

```vue
<script setup>
import { ref } from 'vue'
import { onPullDownRefresh } from '@dcloudio/uni-app'

const list = ref([])

onPullDownRefresh(async () => {
  try {
    list.value = await fetchList()
  } finally {
    // 停止刷新动画
    uni.stopPullDownRefresh()
  }
})
</script>
```

### 上拉触底

```vue
<script setup>
import { ref } from 'vue'
import { onReachBottom } from '@dcloudio/uni-app'

const list = ref([])
const page = ref(1)
const loading = ref(false)

onReachBottom(async () => {
  if (loading.value) return

  loading.value = true
  try {
    const newData = await fetchList(page.value + 1)
    list.value.push(...newData)
    page.value++
  } finally {
    loading.value = false
  }
})
</script>
```

### 页面滚动

```vue
<script setup>
import { ref } from 'vue'
import { onPageScroll } from '@dcloudio/uni-app'

const scrollTop = ref(0)

onPageScroll((e) => {
  scrollTop.value = e.scrollTop

  // 吸顶效果
  if (e.scrollTop > 100) {
    // 显示吸顶元素
  } else {
    // 隐藏吸顶元素
  }
})
</script>
```

### 页面尺寸变化

```vue
<script setup>
import { onResize } from '@dcloudio/uni-app'

onResize((size) => {
  console.log('页面尺寸变化：', size)
  // size: { windowWidth, windowHeight }
})
</script>
```

### 分享

```vue
<script setup>
import { onShareAppMessage, onShareTimeline } from '@dcloudio/uni-app'

// 分享给朋友
onShareAppMessage(() => {
  return {
    title: '分享标题',
    path: '/pages/index/index?id=123',
    imageUrl: '/static/share.png'
  }
})

// 分享到朋友圈
onShareTimeline(() => {
  return {
    title: '分享标题',
    query: 'id=123',
    imageUrl: '/static/share.png'
  }
})
</script>
```

### Tab 切换

```vue
<script setup>
import { onTabItemTap } from '@dcloudio/uni-app'

onTabItemTap((item) => {
  console.log('Tab 点击：', item)
  // item: { index, pagePath, text }
})
</script>
```

## 完整示例

```vue
<template>
  <view class="page">
    <view v-for="item in list" :key="item.id">
      <text>{{ item.name }}</text>
    </view>
  </view>
</template>

<script setup>
import { ref } from 'vue'
import {
  onLoad,
  onShow,
  onReady,
  onHide,
  onUnload,
  onPullDownRefresh,
  onReachBottom,
  onPageScroll
} from '@dcloudio/uni-app'

const id = ref('')
const list = ref([])
const page = ref(1)
const loading = ref(false)

// 页面加载
onLoad(async (options) => {
  id.value = options.id || ''
  await loadData()
})

// 页面显示
onShow(() => {
  console.log('页面显示')
})

// 页面渲染完成
onReady(() => {
  console.log('页面渲染完成')
})

// 页面隐藏
onHide(() => {
  console.log('页面隐藏')
})

// 页面卸载
onUnload(() => {
  console.log('页面卸载')
  uni.$off('eventName')
})

// 下拉刷新
onPullDownRefresh(async () => {
  page.value = 1
  await loadData()
  uni.stopPullDownRefresh()
})

// 上拉加载
onReachBottom(async () => {
  if (loading.value) return
  page.value++
  await loadData()
})

// 页面滚动
onPageScroll((e) => {
  console.log('滚动位置：', e.scrollTop)
})

async function loadData() {
  loading.value = true
  try {
    const data = await fetchList(page.value)
    if (page.value === 1) {
      list.value = data
    } else {
      list.value.push(...data)
    }
  } finally {
    loading.value = false
  }
}
</script>
```

## 相关规则

- [lifecycle-02-component-lifecycle](./02-component-lifecycle.md)

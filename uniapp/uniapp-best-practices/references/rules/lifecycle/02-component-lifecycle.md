# 组件生命周期规范

## 规则 ID

`lifecycle-02-component-lifecycle`

## 规则说明

UniApp 组件使用 Vue 3 生命周期，结合页面生命周期处理组件逻辑。

## Vue 3 生命周期

### 生命周期钩子

```vue
<script setup>
import {
  onBeforeMount,
  onMounted,
  onBeforeUpdate,
  onUpdated,
  onBeforeUnmount,
  onUnmounted
} from 'vue'

// 挂载前
onBeforeMount(() => {
  console.log('组件挂载前')
})

// 挂载后
onMounted(() => {
  console.log('组件挂载完成')
  // 可以访问 DOM（H5）
})

// 更新前
onBeforeUpdate(() => {
  console.log('组件更新前')
})

// 更新后
onUpdated(() => {
  console.log('组件更新完成')
})

// 卸载前
onBeforeUnmount(() => {
  console.log('组件卸载前')
})

// 卸载后
onUnmounted(() => {
  console.log('组件卸载完成')
  // 清理定时器、事件监听等
})
</script>
```

### 生命周期图

```
┌─────────────────────────────────────────────┐
│                                             │
│  setup()                                    │
│     │                                       │
│     ▼                                       │
│  onBeforeMount ──► onMounted               │
│                          │                  │
│                          ▼                  │
│                  onBeforeUpdate             │
│                          │                  │
│                          ▼                  │
│                    onUpdated                │
│                          │                  │
│                          ▼                  │
│                onBeforeUnmount              │
│                          │                  │
│                          ▼                  │
│                  onUnmounted                │
│                                             │
└─────────────────────────────────────────────┘
```

## 常用场景

### 1. 数据初始化

```vue
<script setup>
import { ref, onMounted } from 'vue'

const data = ref(null)
const loading = ref(true)

onMounted(async () => {
  try {
    data.value = await fetchData()
  } finally {
    loading.value = false
  }
})
</script>
```

### 2. 定时器管理

```vue
<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const count = ref(0)
let timer = null

onMounted(() => {
  timer = setInterval(() => {
    count.value++
  }, 1000)
})

onUnmounted(() => {
  // 清理定时器
  if (timer) {
    clearInterval(timer)
    timer = null
  }
})
</script>
```

### 3. 事件监听

```vue
<script setup>
import { onMounted, onUnmounted } from 'vue'

function handleResize() {
  console.log('窗口大小变化')
}

onMounted(() => {
  // #ifdef H5
  window.addEventListener('resize', handleResize)
  // #endif

  // UniApp 事件
  uni.$on('dataUpdate', handleDataUpdate)
})

onUnmounted(() => {
  // #ifdef H5
  window.removeEventListener('resize', handleResize)
  // #endif

  // 移除 UniApp 事件
  uni.$off('dataUpdate', handleDataUpdate)
})

function handleDataUpdate(data) {
  console.log('数据更新', data)
}
</script>
```

### 4. 网络请求取消

```vue
<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const data = ref(null)
let abortController = null

onMounted(async () => {
  abortController = new AbortController()

  try {
    const response = await fetch('/api/data', {
      signal: abortController.signal
    })
    data.value = await response.json()
  } catch (error) {
    if (error.name !== 'AbortError') {
      console.error('请求失败', error)
    }
  }
})

onUnmounted(() => {
  // 取消未完成的请求
  if (abortController) {
    abortController.abort()
  }
})
</script>
```

## 页面生命周期 vs 组件生命周期

### 执行顺序

```
页面 onLoad
    ↓
组件 setup
    ↓
组件 onBeforeMount
    ↓
组件 onMounted
    ↓
页面 onShow
    ↓
页面 onReady
    ↓
...
页面 onHide
    ↓
组件 onBeforeUnmount
    ↓
组件 onUnmounted
    ↓
页面 onUnload
```

### 组合使用

```vue
<template>
  <view>
    <ChildComponent />
  </view>
</template>

<script setup>
// 页面：使用 @dcloudio/uni-app 的生命周期
import { onLoad, onShow, onUnload } from '@dcloudio/uni-app'
import { ref } from 'vue'

const pageData = ref(null)

onLoad(async (options) => {
  pageData.value = await fetchPageData(options.id)
})

onShow(() => {
  // 页面显示时刷新
  refreshData()
})

onUnload(() => {
  // 页面卸载时清理
  cleanup()
})
</script>
```

```vue
<!-- ChildComponent.vue -->
<template>
  <view>
    <text>{{ data }}</text>
  </view>
</template>

<script setup>
// 组件：使用 Vue 生命周期
import { ref, onMounted, onUnmounted } from 'vue'

const data = ref(null)
let timer = null

onMounted(() => {
  // 组件挂载后初始化
  loadData()

  // 启动定时器
  timer = setInterval(refreshData, 5000)
})

onUnmounted(() => {
  // 组件卸载时清理
  if (timer) {
    clearInterval(timer)
  }
})

async function loadData() {
  data.value = await fetchData()
}

function refreshData() {
  // 刷新数据
}
</script>
```

## keep-alive 生命周期

```vue
<template>
  <keep-alive>
    <component :is="currentComponent" />
  </keep-alive>
</template>

<script setup>
import { onActivated, onDeactivated } from 'vue'

// keep-alive 激活时
onActivated(() => {
  console.log('组件激活')
  // 刷新数据
})

// keep-alive 停用时
onDeactivated(() => {
  console.log('组件停用')
  // 暂停操作
})
</script>
```

## 错误处理

```vue
<script setup>
import { onErrorCaptured, ref } from 'vue'

const error = ref(null)

// 捕获子组件错误
onErrorCaptured((err, instance, info) => {
  console.error('组件错误：', err)
  console.error('组件实例：', instance)
  console.error('错误信息：', info)

  error.value = err.message

  // 返回 false 阻止错误继续传播
  return false
})
</script>
```

## 最佳实践

1. **在 onMounted 中初始化**：需要访问 DOM 或发起请求
2. **在 onUnmounted 中清理**：定时器、事件监听、网络请求
3. **页面生命周期处理页面级逻辑**：路由参数、页面刷新
4. **组件生命周期处理组件内部逻辑**：数据初始化、状态管理

## 相关规则

- [lifecycle-01-page-lifecycle](./01-page-lifecycle.md)

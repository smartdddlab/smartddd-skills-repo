# 页面参数传递规范

## 规则 ID

`routing-02-page-params`

## 规则说明

UniApp 页面间有多种参数传递方式，选择合适的方式对于数据安全和代码可维护性至关重要。

## 传递方式对比

| 方式 | 容量 | 类型限制 | 适用场景 |
|------|------|----------|----------|
| URL 参数 | 有限 | 字符串 | 简单参数 |
| globalData | 无限 | 任意 | 临时大数据 |
| Storage | 10MB+ | 可序列化 | 持久数据 |
| 事件通信 | 无限 | 任意 | 实时通信 |
| Pinia | 内存 | 任意 | 全局状态 |

## URL 参数

### 基本用法

```typescript
// 发送页面
uni.navigateTo({
  url: '/pages/detail/detail?id=123&name=test'
})

// 接收页面
<script setup>
import { ref } from 'vue'
import { onLoad } from '@dcloudio/uni-app'

const id = ref('')
const name = ref('')

onLoad((options) => {
  id.value = options.id || ''
  name.value = options.name || ''
})
</script>
```

### 参数编码

```typescript
// 发送中文或特殊字符
function goToDetail(item) {
  const params = new URLSearchParams({
    id: item.id,
    name: item.name,
    desc: item.description
  })

  uni.navigateTo({
    url: `/pages/detail/detail?${params.toString()}`
  })
}

// 接收
onLoad((options) => {
  const params = new URLSearchParams(options)
  const id = params.get('id')
  const name = params.get('name')
})
```

### 对象参数

```typescript
// 发送对象
function goToDetail(item) {
  const dataStr = JSON.stringify(item)
  uni.navigateTo({
    url: `/pages/detail/detail?data=${encodeURIComponent(dataStr)}`
  })
}

// 接收对象
onLoad((options) => {
  if (options.data) {
    const item = JSON.parse(decodeURIComponent(options.data))
    console.log('接收对象', item)
  }
})
```

## globalData

### 定义全局数据

```typescript
// App.vue
<script>
export default {
  onLaunch() {
    // 初始化全局数据
    this.globalData = {
      userInfo: null,
      tempOrderData: null
    }
  },
  globalData: {
    userInfo: null,
    tempOrderData: null
  }
}
</script>
```

### 使用全局数据

```typescript
// 发送页面
function goToOrder() {
  const app = getApp()
  app.globalData.tempOrderData = {
    products: [...selectedProducts],
    totalAmount: totalPrice
  }
  uni.navigateTo({ url: '/pages/order/confirm' })
}

// 接收页面
<script setup>
import { ref, onMounted } from 'vue'

const orderData = ref(null)

onMounted(() => {
  const app = getApp()
  orderData.value = app.globalData.tempOrderData

  // 使用后清除
  app.globalData.tempOrderData = null
})
</script>
```

## 事件通信

### uni.$emit / uni.$on

```typescript
// 选择商品页面
<script setup>
function selectProduct(product) {
  uni.$emit('productSelected', product)
  uni.navigateBack()
}
</script>

// 订单页面
<script setup>
import { ref } from 'vue'
import { onLoad, onUnload } from '@dcloudio/uni-app'

const selectedProduct = ref(null)

onLoad(() => {
  uni.$on('productSelected', (product) => {
    selectedProduct.value = product
  })
})

onUnload(() => {
  // 重要：页面卸载时移除监听
  uni.$off('productSelected')
})
</script>
```

### 一次性事件

```typescript
// 使用 $once 监听一次
uni.$once('eventName', (data) => {
  console.log('只触发一次', data)
})
```

### 移除监听

```typescript
// 移除特定监听器
function handleProduct(data) {
  console.log('商品选择', data)
}

uni.$on('productSelected', handleProduct)
uni.$off('productSelected', handleProduct)

// 移除所有监听器
uni.$off('productSelected')
```

## 返回数据传递

### 使用事件返回数据

```typescript
// 详情页
<script setup>
function saveAndBack() {
  // 保存数据
  saveData()

  // 通知上一页刷新
  uni.$emit('dataUpdated', { id: 123 })

  uni.navigateBack()
}
</script>

// 列表页
<script setup>
import { ref } from 'vue'
import { onShow } from '@dcloudio/uni-app'

const list = ref([])

onLoad(() => {
  uni.$on('dataUpdated', () => {
    refreshList()
  })
})

onUnload(() => {
  uni.$off('dataUpdated')
})

async function refreshList() {
  list.value = await fetchList()
}
</script>
```

### 使用页面栈操作

```typescript
// 详情页保存后返回
async function saveAndBack() {
  await saveData()

  const pages = getCurrentPages()
  const prevPage = pages[pages.length - 2] as any

  if (prevPage) {
    // 调用上一页的刷新方法
    if (prevPage.$vm?.refreshList) {
      prevPage.$vm.refreshList()
    }
  }

  uni.navigateBack()
}
```

## Pinia 状态传递

```typescript
// stores/temp.ts
import { defineStore } from 'pinia'

export const useTempStore = defineStore('temp', {
  state: () => ({
    orderData: null as OrderData | null
  }),

  actions: {
    setOrderData(data: OrderData) {
      this.orderData = data
    },

    clearOrderData() {
      this.orderData = null
    }
  }
})

// 发送页面
const tempStore = useTempStore()
tempStore.setOrderData(orderData)
uni.navigateTo({ url: '/pages/order/confirm' })

// 接收页面
const tempStore = useTempStore()
const orderData = tempStore.orderData
tempStore.clearOrderData() // 使用后清除
```

## 最佳实践

### 1. 选择合适的传递方式

```typescript
// ✅ 简单 ID 用 URL 参数
uni.navigateTo({ url: `/pages/detail/detail?id=123` })

// ✅ 复杂对象用 globalData 或 Pinia
getApp().globalData.tempData = complexObject
uni.navigateTo({ url: '/pages/detail/detail' })

// ✅ 实时通信用事件
uni.$emit('dataChanged', newData)
```

### 2. 及时清理临时数据

```typescript
// 使用 globalData 后清理
const data = getApp().globalData.tempData
getApp().globalData.tempData = null

// 使用 Pinia 后清理
const tempStore = useTempStore()
tempStore.clearTempData()
```

### 3. URL 参数长度限制

```typescript
// ❌ 避免：过长的 URL 参数
const longData = JSON.stringify(largeObject)
uni.navigateTo({ url: `/pages/detail?data=${longData}` }) // 可能失败

// ✅ 推荐：使用其他方式传递大数据
getApp().globalData.largeData = largeObject
uni.navigateTo({ url: '/pages/detail/detail' })
```

## 相关规则

- [routing-01-page-navigation](./01-page-navigation.md)
- [state-01-pinia-integration](../state/01-pinia-integration.md)

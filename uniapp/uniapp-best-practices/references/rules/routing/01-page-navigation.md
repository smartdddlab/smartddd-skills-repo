# 路由导航规范

## 规则 ID

`routing-01-page-navigation`

## 规则说明

UniApp 提供统一的路由 API，正确使用路由对于页面导航和用户体验至关重要。

## 路由 API

### 页面跳转方式对比

| 方法 | 作用 | 页面栈 |
|------|------|--------|
| uni.navigateTo | 保留当前页，跳转 | 增加 |
| uni.redirectTo | 关闭当前页，跳转 | 不变 |
| uni.reLaunch | 关闭所有页，跳转 | 重置为 1 |
| uni.switchTab | 跳转 tabBar 页 | 重置为 1 |
| uni.navigateBack | 返回上一页 | 减少 |

### navigateTo - 保留当前页

```typescript
// 基础跳转
uni.navigateTo({
  url: '/pages/detail/detail'
})

// 携带参数
uni.navigateTo({
  url: '/pages/detail/detail?id=123&name=test'
})

// 带回调
uni.navigateTo({
  url: '/pages/detail/detail',
  success: () => {
    console.log('跳转成功')
  },
  fail: (err) => {
    console.error('跳转失败', err)
  }
})
```

### redirectTo - 关闭当前页

```typescript
// 登录成功后跳转首页
uni.redirectTo({
  url: '/pages/index/index'
})

// 支付成功后跳转
uni.redirectTo({
  url: '/pages/pay/success?orderId=123'
})
```

### reLaunch - 重启应用

```typescript
// 退出登录，重新进入
uni.reLaunch({
  url: '/pages/login/login'
})

// 发生严重错误，重启
uni.reLaunch({
  url: '/pages/index/index'
})
```

### switchTab - 切换 Tab

```typescript
// 切换到 tabBar 页面
uni.switchTab({
  url: '/pages/index/index'
})

uni.switchTab({
  url: '/pages/user/user'
})
```

### navigateBack - 返回

```typescript
// 返回上一页
uni.navigateBack()

// 返回上两页
uni.navigateBack({
  delta: 2
})
```

## 页面参数传递

### URL 参数传递

```typescript
// 发送页面
function goToDetail(item) {
  uni.navigateTo({
    url: `/pages/detail/detail?id=${item.id}&name=${encodeURIComponent(item.name)}`
  })
}

// 接收页面
<script setup>
import { onLoad } from '@dcloudio/uni-app'

onLoad((options) => {
  const id = options.id
  const name = decodeURIComponent(options.name)
  console.log('接收参数', { id, name })
})
</script>
```

### 全局变量传递

```typescript
// app.vue 或 main.ts
const globalData = {
  tempData: null
}

// 发送页面
getApp().globalData.tempData = { id: 123, name: 'test' }
uni.navigateTo({ url: '/pages/detail/detail' })

// 接收页面
const data = getApp().globalData.tempData
console.log('接收数据', data)
```

### 事件通信

```typescript
// 发送页面
function goToDetail() {
  uni.$emit('selectItem', { id: 123, name: 'test' })
  uni.navigateTo({ url: '/pages/detail/detail' })
}

// 接收页面
<script setup>
import { onLoad, onUnload } from '@dcloudio/uni-app'

onLoad(() => {
  uni.$on('selectItem', (data) => {
    console.log('接收事件数据', data)
  })
})

onUnload(() => {
  uni.$off('selectItem') // 移除监听
})
</script>
```

## 页面栈管理

### 获取页面栈

```typescript
// 获取当前页面栈
const pages = getCurrentPages()

// 当前页面
const currentPage = pages[pages.length - 1]
console.log('当前页面路由', currentPage.route)

// 上一页
const prevPage = pages[pages.length - 2]

// 页面栈数量
console.log('页面栈深度', pages.length)
```

### 操作上一页数据

```typescript
// 详情页修改上一页数据
function updatePrevPage() {
  const pages = getCurrentPages()
  const prevPage = pages[pages.length - 2] as any

  if (prevPage) {
    // 调用上一页方法
    prevPage.$vm.refreshData()
  }
}
```

### 页面栈限制

```typescript
// 小程序页面栈最多 10 层
function safeNavigate(url: string) {
  const pages = getCurrentPages()

  if (pages.length >= 10) {
    // 使用 redirectTo 避免超出限制
    uni.redirectTo({ url })
  } else {
    uni.navigateTo({ url })
  }
}
```

## 路由守卫

### 简单路由守卫

```typescript
// utils/router.ts
const authPages = ['/pages/user/user', '/pages/order/list']

export function navigateTo(options: UniApp.NavigateToOptions) {
  // 检查是否需要登录
  if (authPages.some(page => options.url.includes(page))) {
    const token = uni.getStorageSync('token')
    if (!token) {
      uni.navigateTo({ url: '/pages/login/login' })
      return
    }
  }

  return uni.navigateTo(options)
}

// 使用
import { navigateTo } from '@/utils/router'
navigateTo({ url: '/pages/user/user' })
```

## 声明式导航

### navigator 组件

```vue
<template>
  <!-- 保留当前页 -->
  <navigator url="/pages/detail/detail">
    <text>查看详情</text>
  </navigator>

  <!-- 关闭当前页 -->
  <navigator url="/pages/login/login" open-type="redirect">
    <text>去登录</text>
  </navigator>

  <!-- 返回上一页 -->
  <navigator open-type="navigateBack" delta="1">
    <text>返回</text>
  </navigator>

  <!-- 切换 Tab -->
  <navigator url="/pages/index/index" open-type="switchTab">
    <text>首页</text>
  </navigator>
</template>
```

## pages.json 配置

```json
{
  "pages": [
    {
      "path": "pages/index/index",
      "style": {
        "navigationBarTitleText": "首页"
      }
    },
    {
      "path": "pages/detail/detail",
      "style": {
        "navigationBarTitleText": "详情",
        "navigationBarBackgroundColor": "#007AFF"
      }
    }
  ],
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "我的应用",
    "navigationBarBackgroundColor": "#FFFFFF"
  },
  "tabBar": {
    "list": [
      {
        "pagePath": "pages/index/index",
        "text": "首页",
        "iconPath": "static/home.png",
        "selectedIconPath": "static/home-active.png"
      },
      {
        "pagePath": "pages/user/user",
        "text": "我的",
        "iconPath": "static/user.png",
        "selectedIconPath": "static/user-active.png"
      }
    ]
  }
}
```

## 相关规则

- [routing-02-page-params](./02-page-params.md)

---
name: uniapp-best-practices
description: This skill should be used when the user asks about "UniApp best practices", "UniApp 开发规范", "cross-platform development guidelines", "UniApp 性能优化", "UniApp TypeScript", or needs guidance on building high-quality UniApp applications. Provides comprehensive best practices covering API usage, component development, state management, routing, performance optimization, styling, lifecycle management, and TypeScript integration.
version: 1.0.0
author: SmartDDDLab
license: MIT
tags: [uniapp, vue3, cross-platform, best-practices, mobile, miniprogram]
---

# UniApp 最佳实践技能

## 触发场景

当用户提到以下关键词时触发此技能：
- "UniApp 开发" / "uni-app 最佳实践"
- "小程序开发" / "跨平台 App"
- "uni-app 条件编译" / "分包加载"
- "微信小程序" / "支付宝小程序" / "抖音小程序"
- "rpx 单位" / "uni API"

## 核心规则

### 1. API 规范

#### 1.1 平台特定 API
- 使用 `uni.getSystemInfoSync()` 获取平台信息
- 通过 `uni.getSystemInfoSync().platform` 判断运行环境
- 示例：
  ```javascript
  const systemInfo = uni.getSystemInfoSync()
  const isIOS = systemInfo.platform === 'ios'
  const isAndroid = systemInfo.platform === 'android'
  ```

#### 1.2 异步 API 调用
- 优先使用 Promise 形式
- 使用 async/await 处理异步
- 示例：
  ```javascript
  // ✅ 推荐
  async function getLocation() {
    try {
      const res = await uni.getLocation({ type: 'gcj02' })
      return res
    } catch (error) {
      console.error('获取位置失败', error)
    }
  }
  ```

#### 1.3 条件编译 API
- 使用 `// #ifdef` / `// #endif` 处理平台差异
- 示例：
  ```javascript
  // #ifdef MP-WEIXIN
  wx.login()
  // #endif
  // #ifdef MP-ALIPAY
  my.getAuthCode()
  // #endif
  ```

### 2. 组件规范

#### 2.1 使用内置组件
- 优先使用 `<view>` 而非 `<div>`
- 使用 `<text>` 包裹文本内容
- 使用 `<image>` 而非 `<img>`，且使用绝对路径
- 使用 `<navigator>` 进行页面跳转

#### 2.2 事件处理
- 使用 `@click` 而非 `@tap`（Vue 3 风格）
- 阻止事件冒泡：`@click.stop`
- 示例：
  ```vue
  <template>
    <view @click="handleClick">
      <button @click.stop="handleButtonClick">点击</button>
    </view>
  </template>
  ```

#### 2.3 组件通信
- Props down, Events up
- 使用 `defineProps` 和 `defineEmits`
- 示例：
  ```vue
  <script setup>
  const props = defineProps({
    title: { type: String, required: true }
  })
  const emit = defineEmits(['update'])
  </script>
  ```

### 3. 状态管理

#### 3.1 Pinia 集成
- 推荐使用 Pinia 进行状态管理
- 持久化使用 `pinia-plugin-persistedstate`
- 示例：
  ```javascript
  // stores/user.js
  import { defineStore } from 'pinia'
  
  export const useUserStore = defineStore('user', {
    state: () => ({
      token: '',
      userInfo: null
    }),
    persist: true
  })
  ```

#### 3.2 页面间通信
- 使用 uni.$emit / uni.$on
- 或使用全局事件总线
- 示例：
  ```javascript
  // 发送事件
  uni.$emit('user-updated', userData)
  
  // 接收事件
  uni.$on('user-updated', (data) => {
    console.log('用户信息更新', data)
  })
  ```

### 4. 路由规范

#### 4.1 页面跳转
- 使用 `uni.navigateTo` 保留当前页面
- 使用 `uni.redirectTo` 关闭当前页面
- 使用 `uni.switchTab` 跳转 tabBar 页面
- 示例：
  ```javascript
  // 保留当前页面
  uni.navigateTo({ url: '/pages/detail/detail?id=123' })
  
  // 关闭当前页面
  uni.redirectTo({ url: '/pages/login/login' })
  
  // 返回上一页
  uni.navigateBack({ delta: 1 })
  ```

#### 4.2 页面栈管理
- 获取页面栈：`getCurrentPages()`
- 页面栈最多 10 层（小程序限制）
- 示例：
  ```javascript
  const pages = getCurrentPages()
  const currentPage = pages[pages.length - 1]
  ```

### 5. 样式规范

#### 5.1 单位使用
- 使用 `rpx` 作为主要单位
- `rpx` 根据屏幕宽度自适应
- 设计稿 750px 宽度，1px = 1rpx
- 示例：
  ```css
  .container {
    width: 750rpx;
    padding: 20rpx;
  }
  ```

#### 5.2 条件编译样式
- 使用 `/* #ifdef */` 处理平台差异
- 示例：
  ```css
  .header {
    height: 88rpx;
    /* #ifdef MP-WEIXIN */
    padding-top: 40rpx;
    /* #endif */
  }
  ```

#### 5.3 全局样式
- 在 `App.vue` 中定义全局样式
- 使用 `uni.scss` 定义全局变量
- 示例：
  ```scss
  // uni.scss
  $primary-color: #007AFF;
  $border-radius: 8rpx;
  ```

### 6. 性能优化

#### 6.1 分包加载
- 主包控制在 2MB 以内
- 使用 subPackages 配置
- 示例（pages.json）：
  ```json
  {
    "pages": ["pages/index/index"],
    "subPackages": [
      {
        "root": "pages/user",
        "pages": ["profile/profile", "settings/settings"]
      }
    ]
  }
  ```

#### 6.2 长列表优化
- 使用 `<scroll-view>` 虚拟列表
- 避免在 `v-for` 中使用复杂计算
- 示例：
  ```vue
  <scroll-view scroll-y @scrolltolower="loadMore">
    <view v-for="item in list" :key="item.id">
      {{ item.name }}
    </view>
  </scroll-view>
  ```

#### 6.3 图片优化
- 使用 WebP 格式
- 懒加载：`<image lazy-load>`
- 压缩图片质量
- 示例：
  ```vue
  <image :src="imageUrl" mode="aspectFill" lazy-load />
  ```

### 7. 生命周期

#### 7.1 页面生命周期
- `onLoad`: 页面加载
- `onShow`: 页面显示
- `onReady`: 页面渲染完成
- `onHide`: 页面隐藏
- `onUnload`: 页面卸载
- 示例：
  ```vue
  <script setup>
  import { onLoad, onShow } from '@dcloudio/uni-app'
  
  onLoad((options) => {
    console.log('页面参数', options)
  })
  
  onShow(() => {
    console.log('页面显示')
  })
  </script>
  ```

#### 7.2 组件生命周期
- 使用 Vue 3 Composition API
- `onMounted`: 组件挂载
- `onUnmounted`: 组件卸载
- 示例：
  ```vue
  <script setup>
  import { onMounted, onUnmounted } from 'vue'
  
  onMounted(() => {
    console.log('组件已挂载')
  })
  </script>
  ```

### 8. TypeScript 支持

#### 8.1 类型定义
- 使用 `uni.*` API 类型
- 定义 Props 类型
- 示例：
  ```vue
  <script setup lang="ts">
  interface Props {
    title: string
    count?: number
  }
  
  const props = withDefaults(defineProps<Props>(), {
    count: 0
  })
  </script>
  ```

#### 8.2 API 类型
- 使用 UniApp 官方类型
- 示例：
  ```typescript
  import type { UniApp } from '@dcloudio/uni-app'
  
  const res: UniApp.GetSystemInfoRes = uni.getSystemInfoSync()
  ```

### 9. 网络请求

#### 9.1 uni.request 封装
- 统一错误处理
- 添加请求/响应拦截
- 示例：
  ```typescript
  // utils/request.ts
  export const request = <T>(options: UniApp.RequestOptions): Promise<T> => {
    return new Promise((resolve, reject) => {
      uni.request({
        ...options,
        success: (res) => {
          if (res.statusCode === 200) {
            resolve(res.data as T)
          } else {
            reject(res)
          }
        },
        fail: reject
      })
    })
  }
  ```

#### 9.2 请求优化
- 合并重复请求
- 缓存 GET 请求
- 添加超时处理

### 10. 调试技巧

#### 10.1 开发工具
- HBuilderX 内置调试
- Chrome DevTools 调试 H5
- 微信开发者工具调试小程序

#### 10.2 日志输出
- 使用 `console.log` 输出日志
- 条件编译控制日志
- 示例：
  ```javascript
  // #ifdef H5
  console.log('H5 调试信息', data)
  // #endif
  ```

## 平台差异速查

| 功能 | 微信小程序 | 支付宝小程序 | H5 | App |
|------|-----------|-------------|-----|-----|
| 登录 | wx.login | my.getAuthCode | 自定义 | uni.login |
| 支付 | wx.requestPayment | my.tradePay | 自定义 | uni.requestPayment |
| 地图 | 腾讯地图 | 高德地图 | 多种 | 高德/百度 |
| 分享 | onShareAppMessage | onShareAppMessage | 自定义 | plus.share |

## 常见问题

### Q1: 图片不显示？
- 检查路径是否正确（使用绝对路径）
- 网络图片检查域名白名单
- 使用 `mode` 属性调整显示方式

### Q2: 样式不生效？
- 检查是否使用了 HTML 标签（应使用 view/text）
- 检查 rpx 单位
- 检查样式隔离（options.styleIsolation）

### Q3: 页面白屏？
- 检查 JS 错误
- 检查网络请求
- 检查生命周期是否正确

## 参考资料

- [UniApp 官方文档](https://uniapp.dcloud.net.cn/)
- [Vue 3 文档](https://vuejs.org/)
- [Pinia 文档](https://pinia.vuejs.org/)
- [小程序开发指南](https://developers.weixin.qq.com/miniprogram/dev/framework/)

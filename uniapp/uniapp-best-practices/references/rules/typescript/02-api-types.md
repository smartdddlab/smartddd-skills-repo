# UniApp API 类型规范

## 规则 ID

`typescript-02-api-types`

## 规则说明

UniApp 提供了完整的 TypeScript 类型定义，正确使用这些类型可以提高代码安全性。

## 安装类型定义

```bash
npm install @dcloudio/types
```

## 常用 API 类型

### 系统信息

```typescript
import type { UniApp } from '@dcloudio/uni-app'

// 获取系统信息
const systemInfo: UniApp.GetSystemInfoRes = uni.getSystemInfoSync()

console.log('平台:', systemInfo.platform)
console.log('系统版本:', systemInfo.system)
console.log('屏幕宽度:', systemInfo.screenWidth)
console.log('屏幕高度:', systemInfo.screenHeight)
console.log('状态栏高度:', systemInfo.statusBarHeight)
```

### 网络请求

```typescript
// 请求选项
interface RequestOptions {
  url: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE' | 'OPTIONS' | 'HEAD'
  data?: any
  header?: Record<string, string>
  timeout?: number
  dataType?: 'json' | 'text' | 'arraybuffer'
}

// 响应类型
interface Response<T = any> {
  statusCode: number
  header: Record<string, string>
  data: T
  cookies: string[]
}

// 封装请求
async function request<T>(options: RequestOptions): Promise<Response<T>> {
  return new Promise((resolve, reject) => {
    uni.request({
      ...options,
      success: (res) => resolve(res as Response<T>),
      fail: (err) => reject(err)
    })
  })
}

// 使用
interface User {
  id: number
  name: string
}

const response = await request<User[]>({
  url: '/api/users',
  method: 'GET'
})

console.log('用户列表:', response.data)
```

### 导航

```typescript
// 页面跳转
uni.navigateTo({
  url: '/pages/detail/detail?id=123',
  success: () => {
    console.log('跳转成功')
  }
})

// 重定向
uni.redirectTo({
  url: '/pages/login/login'
})

// 返回
uni.navigateBack({
  delta: 1
})

// Tab 切换
uni.switchTab({
  url: '/pages/index/index'
})
```

### 存储

```typescript
// 同步存储
uni.setStorageSync('key', 'value')
const value: string = uni.getStorageSync('key')
uni.removeStorageSync('key')

// 异步存储
await uni.setStorage({
  key: 'userInfo',
  data: { name: '张三', age: 25 }
})

const { data } = await uni.getStorage({ key: 'userInfo' })

// 获取存储信息
const info: UniApp.GetStorageInfoRes = uni.getStorageInfoSync()
console.log('已使用空间:', info.currentSize)
console.log('所有 key:', info.keys)
```

### 位置服务

```typescript
// 获取位置
const location = await uni.getLocation({
  type: 'gcj02',
  altitude: true
})

console.log('纬度:', location.latitude)
console.log('经度:', location.longitude)
console.log('精度:', location.accuracy)

// 打开地图
uni.openLocation({
  latitude: 39.90923,
  longitude: 116.397428,
  name: '天安门',
  address: '北京市东城区东长安街'
})
```

### 图片

```typescript
// 选择图片
const res = await uni.chooseImage({
  count: 9,
  sizeType: ['compressed'],
  sourceType: ['album', 'camera']
})

console.log('临时路径:', res.tempFilePaths)
console.log('文件信息:', res.tempFiles)

// 预览图片
uni.previewImage({
  urls: res.tempFilePaths,
  current: res.tempFilePaths[0]
})

// 保存图片
await uni.saveImageToPhotosAlbum({
  filePath: res.tempFilePaths[0]
})
```

### 文件上传下载

```typescript
// 上传文件
const uploadRes = await uni.uploadFile({
  url: '/api/upload',
  filePath: tempFilePath,
  name: 'file',
  header: {
    'Authorization': `Bearer ${token}`
  },
  formData: {
    type: 'avatar'
  }
})

console.log('上传结果:', JSON.parse(uploadRes.data))

// 下载文件
const downloadRes = await uni.downloadFile({
  url: 'https://example.com/file.pdf'
})

console.log('下载路径:', downloadRes.tempFilePath)

// 保存文件
await uni.saveFile({
  tempFilePath: downloadRes.tempFilePath
})
```

## 事件类型

```typescript
// 自定义事件类型
interface EventMap {
  userLogin: { userId: number; token: string }
  userLogout: undefined
  dataRefresh: { type: string; timestamp: number }
}

// 类型安全的事件封装
class TypedEventEmitter<T extends Record<string, any>> {
  on<K extends keyof T>(event: K, callback: (data: T[K]) => void) {
    uni.$on(event as string, callback)
  }

  once<K extends keyof T>(event: K, callback: (data: T[K]) => void) {
    uni.$once(event as string, callback)
  }

  emit<K extends keyof T>(event: K, data: T[K]) {
    uni.$emit(event as string, data)
  }

  off<K extends keyof T>(event: K, callback?: (data: T[K]) => void) {
    uni.$off(event as string, callback)
  }
}

// 使用
const eventBus = new TypedEventEmitter<EventMap>()

// 监听
eventBus.on('userLogin', (data) => {
  console.log('用户登录:', data.userId, data.token)
})

// 触发
eventBus.emit('userLogin', { userId: 123, token: 'xxx' })
```

## 路由类型

```typescript
// 路由配置类型
interface RouteConfig {
  path: string
  name?: string
  meta?: Record<string, any>
}

// 页面参数类型
interface PageParams {
  '/pages/detail/detail': { id: string }
  '/pages/user/profile': { userId: number }
  '/pages/order/detail': { orderId: string; type?: 'normal' | 'refund' }
}

// 类型安全的导航
function navigateTo<K extends keyof PageParams>(
  url: K,
  params: PageParams[K]
) {
  const queryString = Object.entries(params || {})
    .map(([key, value]) => `${key}=${encodeURIComponent(String(value))}`)
    .join('&')

  uni.navigateTo({
    url: queryString ? `${url}?${queryString}` : url
  })
}

// 使用
navigateTo('/pages/detail/detail', { id: '123' })
navigateTo('/pages/order/detail', { orderId: '456', type: 'refund' })
```

## 组件实例类型

```typescript
// 获取组件实例
import { getCurrentInstance } from 'vue'

const instance = getCurrentInstance()

// 获取页面实例
const pages = getCurrentPages()
const currentPage = pages[pages.length - 1] as UniApp.Page & {
  $vm: {
    refreshData: () => void
  }
}

// 调用页面方法
if (currentPage.$vm?.refreshData) {
  currentPage.$vm.refreshData()
}
```

## 错误处理

```typescript
// API 错误类型
interface ApiError {
  errMsg: string
  errno?: number
}

// 统一错误处理
function handleApiError(error: ApiError) {
  console.error('API 错误:', error.errMsg)

  // 根据错误类型处理
  if (error.errMsg.includes('timeout')) {
    uni.showToast({ title: '请求超时', icon: 'none' })
  } else if (error.errMsg.includes('fail')) {
    uni.showToast({ title: '网络错误', icon: 'none' })
  }
}

// 使用
try {
  await uni.request({ url: '/api/data' })
} catch (error) {
  handleApiError(error as ApiError)
}
```

## 最佳实践

1. **使用类型导入**：`import type { ... }` 仅导入类型
2. **定义接口**：为 API 响应定义清晰的接口
3. **泛型封装**：封装通用函数使用泛型
4. **严格模式**：启用 TypeScript 严格模式

## 相关规则

- [typescript-01-type-definitions](./01-type-definitions.md)

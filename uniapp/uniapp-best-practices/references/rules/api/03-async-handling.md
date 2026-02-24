# 异步处理规范

## 规则 ID

`api-03-async-handling`

## 规则说明

UniApp API 支持回调、Promise 两种方式。推荐使用 async/await 配合 Promise 处理异步操作。

## UniApp 异步 API 格式

### 1. 回调格式

```javascript
uni.request({
  url: '/api/data',
  success: (res) => {
    console.log('成功', res)
  },
  fail: (err) => {
    console.error('失败', err)
  },
  complete: () => {
    console.log('完成')
  }
})
```

### 2. Promise 格式

```javascript
uni.request({
  url: '/api/data'
}).then(res => {
  console.log('成功', res)
}).catch(err => {
  console.error('失败', err)
})
```

### 3. async/await 格式（推荐）

```javascript
async function fetchData() {
  try {
    const res = await uni.request({ url: '/api/data' })
    console.log('成功', res)
  } catch (err) {
    console.error('失败', err)
  }
}
```

## 正确示例

### Promise 封装

```typescript
// utils/request.ts
interface RequestOptions {
  url: string
  method?: 'GET' | 'POST' | 'PUT' | 'DELETE'
  data?: any
  header?: Record<string, string>
  timeout?: number
}

interface ApiResponse<T> {
  code: number
  data: T
  message: string
}

export async function request<T>(options: RequestOptions): Promise<T> {
  return new Promise((resolve, reject) => {
    uni.request({
      url: options.url,
      method: options.method || 'GET',
      data: options.data,
      header: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${getToken()}`,
        ...options.header
      },
      timeout: options.timeout || 30000,
      success: (res) => {
        if (res.statusCode === 200) {
          const data = res.data as ApiResponse<T>
          if (data.code === 0) {
            resolve(data.data)
          } else {
            reject(new Error(data.message || '请求失败'))
          }
        } else if (res.statusCode === 401) {
          // Token 过期，跳转登录
          uni.navigateTo({ url: '/pages/login/login' })
          reject(new Error('请先登录'))
        } else {
          reject(new Error(`请求错误: ${res.statusCode}`))
        }
      },
      fail: (err) => {
        reject(new Error(err.errMsg || '网络请求失败'))
      }
    })
  })
}
```

### 并发请求

```typescript
// ✅ 正确：使用 Promise.all 处理并发
async function loadPageData() {
  try {
    const [userInfo, orders, products] = await Promise.all([
      request({ url: '/api/user/info' }),
      request({ url: '/api/orders' }),
      request({ url: '/api/products' })
    ])

    return { userInfo, orders, products }
  } catch (error) {
    console.error('加载数据失败', error)
    throw error
  }
}
```

### 顺序请求

```typescript
// ✅ 正确：顺序执行
async function loginAndGetUserInfo(code: string) {
  // 第一步：登录
  const token = await request({
    url: '/api/login',
    method: 'POST',
    data: { code }
  })

  // 第二步：获取用户信息（依赖第一步的 token）
  const userInfo = await request({
    url: '/api/user/info'
  })

  return { token, userInfo }
}
```

### 错误重试

```typescript
// ✅ 正确：带重试的请求
async function requestWithRetry<T>(
  options: RequestOptions,
  retries = 3
): Promise<T> {
  for (let i = 0; i < retries; i++) {
    try {
      return await request<T>(options)
    } catch (error) {
      if (i === retries - 1) throw error
      console.log(`请求失败，第 ${i + 1} 次重试...`)
      await new Promise(resolve => setTimeout(resolve, 1000 * (i + 1)))
    }
  }
  throw new Error('请求失败')
}
```

## 错误示例

```typescript
// ❌ 错误：回调地狱
function loadData(callback) {
  uni.request({
    url: '/api/user',
    success: (res1) => {
      uni.request({
        url: '/api/orders',
        data: { userId: res1.data.id },
        success: (res2) => {
          uni.request({
            url: '/api/products',
            success: (res3) => {
              callback({ user: res1, orders: res2, products: res3 })
            }
          })
        }
      })
    }
  })
}

// ❌ 错误：未处理错误
async function fetchUser() {
  const res = await uni.request({ url: '/api/user' })
  return res.data // 可能抛出未捕获的异常
}

// ❌ 错误：忘记 await
async function saveData() {
  const promise = request({ url: '/api/save', method: 'POST', data: formData })
  uni.showToast({ title: '保存成功' }) // 可能在请求完成前显示
  return promise
}
```

## 存储异步处理

```typescript
// 本地存储也支持异步
async function saveUserData(user: UserInfo) {
  try {
    await uni.setStorage({
      key: 'userInfo',
      data: user
    })
    console.log('保存成功')
  } catch (error) {
    console.error('保存失败', error)
  }
}

// 同步版本（可能阻塞）
function saveUserDataSync(user: UserInfo) {
  try {
    uni.setStorageSync('userInfo', user)
  } catch (error) {
    console.error('保存失败', error)
  }
}
```

## 相关规则

- [api-01-conditional-compilation](./01-conditional-compilation.md)
- [api-02-platform-api](./02-platform-api.md)

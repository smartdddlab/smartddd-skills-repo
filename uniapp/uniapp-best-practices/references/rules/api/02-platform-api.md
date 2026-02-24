# 平台 API 规范

## 规则 ID

`api-02-platform-api`

## 规则说明

UniApp 封装了各平台的 API，使用 `uni.*` 前缀。优先使用 UniApp 封装的 API，而非平台原生 API。

## 核心原则

1. **优先使用 uni.* API**：跨平台兼容
2. **条件编译使用原生 API**：当 uni.* 不支持时
3. **统一错误处理**：所有 API 调用都应有错误处理

## API 对照表

| 功能 | UniApp | 微信小程序 | 支付宝小程序 |
|------|--------|-----------|-------------|
| 登录 | uni.login | wx.login | my.getAuthCode |
| 请求 | uni.request | wx.request | my.request |
| 跳转 | uni.navigateTo | wx.navigateTo | my.navigateTo |
| 存储 | uni.setStorage | wx.setStorage | my.setStorage |
| 位置 | uni.getLocation | wx.getLocation | my.getLocation |
| 图片 | uni.chooseImage | wx.chooseImage | my.chooseImage |

## 正确示例

### 基础 API 使用

```typescript
// ✅ 正确：使用 uni.* API
async function getSystemInfo() {
  try {
    const info = uni.getSystemInfoSync()
    return {
      platform: info.platform,
      version: info.version,
      screenWidth: info.screenWidth,
      screenHeight: info.screenHeight
    }
  } catch (error) {
    console.error('获取系统信息失败', error)
    throw error
  }
}

// ✅ 正确：异步 API 使用 Promise
async function getUserInfo() {
  const [err, res] = await uni.getUserInfo()
  if (err) {
    console.error('获取用户信息失败', err)
    return null
  }
  return res.userInfo
}
```

### 条件编译使用原生 API

```typescript
// ✅ 正确：平台特定功能使用条件编译
async function login() {
  // #ifdef MP-WEIXIN
  const { code } = await uni.login({ provider: 'weixin' })
  // 发送 code 到后端换取 openid
  return await sendCodeToBackend(code)
  // #endif

  // #ifdef MP-ALIPAY
  const { authCode } = await uni.login({ provider: 'alipay' })
  return await sendAuthCodeToBackend(authCode)
  // #endif

  // #ifdef H5
  // H5 使用自定义登录逻辑
  return await h5Login()
  // #endif
}
```

### API 封装

```typescript
// utils/api.ts
export const api = {
  async get<T>(url: string, data?: object): Promise<T> {
    const [err, res] = await uni.request({
      url: `${BASE_URL}${url}`,
      method: 'GET',
      data
    })
    if (err) throw err
    return res.data as T
  },

  async post<T>(url: string, data?: object): Promise<T> {
    const [err, res] = await uni.request({
      url: `${BASE_URL}${url}`,
      method: 'POST',
      data,
      header: {
        'Content-Type': 'application/json'
      }
    })
    if (err) throw err
    return res.data as T
  }
}
```

## 错误示例

```typescript
// ❌ 错误：直接使用平台 API
wx.login() // 只能在微信小程序运行

// ❌ 错误：忽略错误处理
const res = uni.getSystemInfoSync() // 可能抛出异常

// ❌ 错误：使用回调地狱
uni.request({
  url: '/api/user',
  success: (res) => {
    uni.request({
      url: '/api/orders',
      success: (res2) => {
        uni.request({
          url: '/api/products',
          success: (res3) => {
            // 回调地狱
          }
        })
      }
    })
  }
})
```

## API 可用性检查

```typescript
// 检查 API 是否可用
if (uni.canIUse('getLocation')) {
  uni.getLocation()
}

// 检查 API 参数是否支持
if (uni.canIUse('getLocation.type.gcj02')) {
  uni.getLocation({ type: 'gcj02' })
}
```

## 相关规则

- [api-01-conditional-compilation](./01-conditional-compilation.md)
- [api-03-async-handling](./03-async-handling.md)

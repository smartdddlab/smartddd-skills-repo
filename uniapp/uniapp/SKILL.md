---
name: uniapp
description: This skill should be used when developing cross-platform apps with uni-app framework. Covers iOS, Android, Web, mini programs, and HarmonyOS development using Vue.js syntax.
version: 1.0.0
author: SmartDDDLab
license: MIT
tags: [uniapp, vue, cross-platform, mobile, mini-program, harmonyos]
requirements:
  - Basic understanding of Vue.js
  - Familiarity with JavaScript/TypeScript
  - HBuilderX IDE installed (recommended)
---

# uniapp

使用 Vue.js 开发跨平台应用的官方指南。

## 使用场景

使用此技能的场景包括：

- 开发跨平台移动应用（iOS、Android）
- 构建微信/支付宝等小程序
- 创建响应式 Web 应用
- 开发鸿蒙元服务
- 使用 Vue.js 语法进行多端开发
- 实现一套代码多端运行的需求

## 核心概念

### 跨平台支持

支持编译到以下平台：

- **移动应用**: iOS、Android
- **Web**: 响应式网页
- **小程序**: 微信、支付宝、百度、抖音、飞书、QQ、快手、钉钉、淘宝、京东、小红书
- **快应用**: 华为快应用、360 小程序
- **鸿蒙**: 鸿蒙元服务

### 开发环境

**推荐工具：** HBuilderX
**语言支持：** Vue.js、JavaScript、TypeScript
**构建系统：** uni-app CLI、Vite（Vue3）

### 技术栈

- **前端框架**: Vue.js（Vue2/Vue3）
- **组件系统**: uni-ui 组件库
- **状态管理**: Vuex / Pinia
- **路由系统**: uni-app 内置路由
- **网络请求**: uni.request API

## 快速开始

### 创建项目

**方式 1：使用 HBuilderX**
1. 文件 → 新建 → 项目
2. 选择 uni-app 模板
3. 选择 Vue 版本（Vue2/Vue3）

**方式 2：使用 CLI**
```bash
# Vue3 版本
npx degit dcloudio/uni-preset-vue#vite my-vue3-project

# Vue2 版本
npx degit dcloudio/uni-preset-vue#vue2 my-vue2-project

cd my-project
npm install
```

### 运行项目

```bash
# H5 平台
npm run dev:h5

# 微信小程序
npm run dev:mp-weixin

# Android
npm run dev:app-android

# iOS
npm run dev:app-ios
```

### 项目结构

```
my-project/
├── pages/              # 页面文件
│   ├── index/
│   │   └── index.vue
│   └── detail/
│       └── detail.vue
├── static/             # 静态资源
├── uni_modules/        # uni-app 插件
├── App.vue             # 应用配置
├── main.js             # 入口文件
├── manifest.json       # 配置文件
└── pages.json          # 页面路由配置
```

## 常用 API

### 页面导航

```javascript
// 跳转到新页面（保留当前页面）
uni.navigateTo({
  url: '/pages/detail/detail?id=123'
})

// 关闭当前页面，跳转到新页面
uni.redirectTo({
  url: '/pages/index/index'
})

// 返回上一页
uni.navigateBack({
  delta: 1
})

// 切换 Tab 页面
uni.switchTab({
  url: '/pages/index/index'
})
```

### 数据存储

```javascript
// 同步存储数据
uni.setStorageSync('token', 'abc123')

// 异步存储数据
uni.setStorage({
  key: 'token',
  data: 'abc123',
  success: function() {
    console.log('存储成功')
  }
})

// 同步获取数据
const token = uni.getStorageSync('token')

// 异步获取数据
uni.getStorage({
  key: 'token',
  success: function(res) {
    console.log(res.data)
  }
})

// 删除数据
uni.removeStorageSync('token')

// 清空所有数据
uni.clearStorageSync()
```

### 网络请求

```javascript
// GET 请求
uni.request({
  url: 'https://api.example.com/data',
  method: 'GET',
  success: function(res) {
    console.log(res.data)
  },
  fail: function(err) {
    console.error(err)
  }
})

// POST 请求
uni.request({
  url: 'https://api.example.com/login',
  method: 'POST',
  data: {
    username: 'user',
    password: 'pass'
  },
  header: {
    'content-type': 'application/json'
  },
  success: function(res) {
    console.log(res.data)
  }
})
```

### 设备信息

```javascript
// 获取系统信息
uni.getSystemInfo({
  success: function(res) {
    console.log('平台:', res.platform)
    console.log('系统版本:', res.system)
    console.log('屏幕宽度:', res.screenWidth)
    console.log('屏幕高度:', res.screenHeight)
  }
})

// 获取网络状态
uni.getNetworkType({
  success: function(res) {
    console.log('网络类型:', res.networkType)
  }
})
```

### 交互反馈

```javascript
// 显示提示框
uni.showToast({
  title: '操作成功',
  icon: 'success',
  duration: 2000
})

// 显示加载框
uni.showLoading({
  title: '加载中...'
})

// 隐藏加载框
uni.hideLoading()

// 显示模态框
uni.showModal({
  title: '提示',
  content: '确定要删除吗？',
  success: function(res) {
    if (res.confirm) {
      console.log('用户点击确定')
    } else if (res.cancel) {
      console.log('用户点击取消')
    }
  }
})
```

## E2E 自动化测试

### 快速开始

uni-automator 是官方提供的 E2E 测试框架，支持 H5、微信小程序、Android、iOS 等多平台。

#### 安装依赖

```bash
npm install @dcloudio/uni-automator --save-dev
```

#### 运行测试

```bash
# H5 平台
npm run test:e2e:h5

# 微信小程序
npm run test:e2e:mp-weixin

# Android
npm run test:e2e:app-android
```

### 核心 API

#### program 对象

```javascript
// 获取当前页面
const page = await program.currentPage()

// 调用 uni API
await program.callUniMethod('setStorage', {
  key: 'token',
  data: 'abc123'
})

// 重启应用
await program.reLaunch('/pages/index/index')

// 截图
await program.screenshot({ path: 'screenshot.png' })
```

#### page 对象

```javascript
// 导航
await page.navigateTo('/pages/index/index')

// 查找元素
const element = await page.$('.selector')

// 查找多个元素
const elements = await page.$$('.item')

// 等待元素
const element = await page.waitFor('.selector', {
  timeout: 5000
})

// 获取页面路径
const path = await page.path()

// 获取页面数据
const data = await page.data()
```

#### element 对象

```javascript
// 点击
await element.tap()

// 输入文本
await element.input('Hello World')

// 获取文本内容
const text = await element.text()

// 获取属性
const value = await element.attribute('value')

// 检查是否可见
const visible = await element.isDisplayed()
```

### 页面对象模型（POM）

```javascript
// page-objects/login.page.js
class LoginPage {
  constructor(page) {
    this.page = page
    this.selectors = {
      mobileInput: '[data-testid="mobile-input"]',
      passwordInput: '[data-testid="password-input"]',
      loginButton: '[data-testid="login-button"]'
    }
  }

  async navigate() {
    await this.page.navigateTo('/pages/login/login')
  }

  async login(mobile, password) {
    await this.page.$(this.selectors.mobileInput).input(mobile)
    await this.page.$(this.selectors.passwordInput).input(password)
    await this.page.$(this.selectors.loginButton).tap()
  }
}

module.exports = LoginPage
```

### 测试用例示例

```javascript
const LoginPage = require('../page-objects/login.page')

describe('用户登录', () => {
  let page
  let loginPage

  beforeEach(async () => {
    page = await program.currentPage()
    loginPage = new LoginPage(page)
    await loginPage.navigate()
  })

  it('应该成功登录', async () => {
    await loginPage.login('13800138000', 'password123')

    await page.waitFor(1500)

    const currentPath = await page.path()
    expect(currentPath).toContain('index')
  })

  it('手机号格式错误时应显示提示', async () => {
    await loginPage.login('123', 'password123')

    await page.waitFor(500)

    const toast = await page.$('.uni-toast')
    const text = await toast.text()
    expect(text).toContain('手机号格式错误')
  })
})
```

### 测试最佳实践

1. **使用 data-testid** - 在 Vue 组件中添加测试标识
   ```vue
   <input data-testid="mobile-input" v-model="mobile" />
   <button data-testid="login-button" @click="login">登录</button>
   ```

2. **隔离测试数据** - 每个测试使用独立数据
   ```javascript
   beforeEach(async () => {
     await program.callUniMethod('clearStorageSync')
   })
   ```

3. **智能等待** - 使用 waitFor 而不是固定等待
   ```javascript
   // ✅ 好的做法
   await page.waitFor('.loaded-element', { timeout: 5000 })

   // ❌ 避免
   await page.waitFor(3000)
   ```

4. **错误截图** - 失败时自动截图
   ```javascript
   afterEach(async function() {
     if (this.currentTest.state === 'failed') {
       await program.screenshot({
         path: `screenshots/${this.currentTest.title}.png`
       })
     }
   })
   ```

5. **POM 模式** - 提高代码可维护性
   ```javascript
   // 将页面操作封装到 Page Object 中
   const loginPage = new LoginPage(page)
   await loginPage.login(mobile, password)
   ```

📋 **详细文档：**
参见 [E2E 测试指南](references/e2e-testing.md)

## 条件编译

使用条件编译处理平台差异：

```javascript
// #ifdef H5
console.log('这段代码只在 H5 平台执行')
// #endif

// #ifdef MP-WEIXIN
console.log('这段代码只在微信小程序执行')
// #endif

// #ifdef APP-PLUS
console.log('这段代码只在 App 平台执行')
// #endif

// #ifndef H5
console.log('这段代码在除 H5 之外的平台执行')
// #endif
```

### 条件编译标签

| 平台 | 标签 |
|------|------|
| H5 | `H5` |
| 微信小程序 | `MP-WEIXIN` |
| 支付宝小程序 | `MP-ALIPAY` |
| App | `APP-PLUS` |
| iOS | `APP-PLUS-NVUE` 或 `IOS` |
| Android | `APP-PLUS-NVUE` 或 `ANDROID` |

## 参考资源

### 核心文档

- [介绍](references/introduction.md) - uni-app 基础概念和特性
- [教程](references/tutorial.md) - 快速上手指南
- [API 文档](references/api.md) - 完整 API 参考
- [组件文档](references/component.md) - 内置组件和 uni-ui 组件

### 开发指南

- [开发指南](references/dev.md) - 开发流程和最佳实践
- [配置说明](references/collocation.md) - 项目配置详解
- [插件开发](references/plugin.md) - 插件系统指南
- [UTS 插件](references/uts.md) - 原生插件开发

### 高级主题

- [E2E 测试](references/e2e-testing.md) - 自动化测试完整指南
- [AI 集成](references/ai.md) - AI 功能集成
- [混合开发](references/hybrid.md) - 原生和 Web 混合开发
- [uni-ad](references/uni_ad.md) - 广告变现方案

## 开发环境设置

### 安装 HBuilderX

1. 下载 HBuilderX: https://www.dcloud.io/hbuilderx.html
2. 选择标准版或 App 开发版
3. 安装 uni-app 插件（标准版需要）
4. 配置开发环境

### 配置微信小程序

1. 下载微信开发者工具
2. 在 HBuilderX 中配置微信开发者工具路径
3. 在 manifest.json 中配置微信小程序 appid

### 配置 Android 开发

1. 安装 Java JDK
2. 安装 Android Studio
3. 配置 Android SDK
4. 在 HBuilderX 中配置 Android SDK 路径

## 常见问题

### 跨平台兼容性

**问题：** 不同平台 API 行为不一致
**解决方案：** 使用条件编译处理平台差异

```javascript
// #ifdef H5
// H5 特定代码
// #endif

// #ifdef MP-WEIXIN
// 微信小程序特定代码
// #endif
```

### 性能优化

**小程序性能优化：**
- 减少 setData 调用频率
- 使用虚拟列表处理长列表
- 避免频繁的页面跳转
- 合理使用缓存

**App 性能优化：**
- 使用 nvue 页面提升性能
- 合理使用原生组件
- 优化图片资源
- 使用分包加载

### 调试技巧

**H5 调试：**
- 使用浏览器开发者工具
- Vue DevTools 扩展

**小程序调试：**
- 使用微信开发者工具
- vconsole 调试工具

**App 调试：**
- HBuilderX 真机运行
- Chrome DevTools 远程调试

## 注意事项

- **平台差异**: 不同平台可能有 API 差异，注意兼容性
- **条件编译**: 使用条件编译处理平台特定代码
- **设计规范**: 遵循各平台的设计规范
- **性能优化**: 注意性能优化，特别是小程序平台
- **版本兼容**: 注意 uni-app 和 Vue 版本兼容性

## 相关技能

- `unicloud` - uniCloud 云开发指南
- `hbuilderx` - HBuilderX IDE 使用指南
- `unicloud-plugins-index` - DCloud 插件市场索引

## 示例项目

查看 `examples/` 目录获取完整示例：
- 基础示例 - 常见用例和 API 使用
- 进阶示例 - 复杂场景和最佳实践

## 更新日志

查看官方更新日志了解最新功能：
https://uniapp.dcloud.net.cn/

---

**官方资源：**
- 文档: https://uniapp.dcloud.net.cn/
- 插件市场: https://ext.dcloud.net.cn/
- 社区: https://ask.dcloud.net.cn/
- GitHub: https://github.com/dcloudio/uni-app

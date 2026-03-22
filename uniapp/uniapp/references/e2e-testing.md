# uni-app E2E自动化测试完整指南

> 基于官方 uni-automator 的端到端自动化测试最佳实践

## 目录

- [快速开始](#快速开始)
- [测试基础设施](#测试基础设施)
- [页面对象模型](#页面对象模型)
- [测试用例编写](#测试用例编写)
- [API参考](#api参考)
- [最佳实践](#最佳实践)
- [常见问题](#常见问题)

## 快速开始

### 安装依赖

```bash
npm install @dcloudio/uni-automator --save-dev
```

### 运行测试

```bash
# H5平台
npm run test:e2e:h5

# 微信小程序
npm run test:e2e:mp-weixin

# Android App
npm run test:e2e:android

# iOS App
npm run test:e2e:ios
```

## 测试基础设施

### 目录结构

```
tests/e2e/
├── config/                    # 测试配置
│   └── automator.config.js    # uni-automator配置
├── page-objects/              # 页面对象模型（POM）
│   ├── base.page.js           # 基础页面类
│   ├── login.page.js          # 登录页面
│   └── register.page.js       # 注册页面
├── specs/                     # 测试用例
│   └── auth/
│       ├── login.spec.js      # 登录流程测试
│       └── register.spec.js   # 注册流程测试
└── utils/                     # 测试工具
    └── helpers.js             # 辅助函数
```

### automator.config.js配置

```javascript
module.exports = {
  platforms: {
    h5: {
      type: 'h5',
      browser: 'chrome',
      headless: true,
      viewport: { width: 375, height: 667 }
    },
    'mp-weixin': {
      type: 'mp-weixin',
      projectPath: 'dist/dev/mp-weixin',
      headless: false
    }
  },
  global: {
    timeout: 30000,
    navigationTimeout: 10000,
    waitForTimeout: 5000,
    retries: 2
  },
  hooks: {
    beforeEach: async (context) => {
      await context.program.callUniMethod('clearStorageSync')
    },
    afterEach: async (context) => {
      if (context.testState.status === 'failed') {
        await context.program.screenshot({
          path: `test-results/e2e/screenshots/failure-${Date.now()}.png`
        })
      }
    }
  }
}
```

## 页面对象模型

### 基础页面类

```javascript
class BasePage {
  constructor(page) {
    this.page = page
  }

  async navigate(url) {
    await this.page.navigateTo(url)
    await this.page.waitFor(500)
  }

  async $(selector) {
    return await this.page.$(selector)
  }

  async $$(selector) {
    return await this.page.$$(selector)
  }

  async waitFor(selector, timeout = 5000) {
    return await this.page.waitFor(selector, { timeout })
  }

  async tap(selector) {
    const element = await this.$(selector)
    await element.tap()
  }

  async input(selector, value) {
    const element = await this.$(selector)
    await element.input(value)
  }

  async getText(selector) {
    const element = await this.$(selector)
    return await element.text()
  }
}

module.exports = BasePage
```

### 登录页面对象

```javascript
const BasePage = require('./base.page')

class LoginPage extends BasePage {
  constructor(page) {
    super(page)
    this.selectors = {
      mobileInput: '[data-testid="mobile-input"]',
      passwordInput: '[data-testid="password-input"]',
      loginButton: '[data-testid="login-button"]'
    }
  }

  async navigate() {
    await this.navigate('/pages/login/login')
  }

  async inputMobile(mobile) {
    await this.input(this.selectors.mobileInput, mobile)
  }

  async inputPassword(password) {
    await this.input(this.selectors.passwordInput, password)
  }

  async clickLoginButton() {
    await this.tap(this.selectors.loginButton)
  }

  async loginWithPassword(mobile, password) {
    await this.inputMobile(mobile)
    await this.inputPassword(password)
    await this.clickLoginButton()
    await this.wait(1000)
  }
}

module.exports = LoginPage
```

## 测试用例编写

### 基本测试结构

```javascript
describe('用户登录', () => {
  let page
  let loginPage

  beforeEach(async () => {
    page = await program.currentPage()
    loginPage = new LoginPage(page)
    await loginPage.navigate()
  })

  afterEach(async () => {
    await program.callUniMethod('clearStorageSync')
  })

  it('应该成功登录', async () => {
    await loginPage.loginWithPassword('13800138000', 'password123')

    const currentPath = await page.path()
    expect(currentPath).toContain('index')
  })
})
```

### 完整登录流程测试

```javascript
describe('登录功能', () => {
  let page
  let loginPage

  beforeEach(async () => {
    page = await program.currentPage()
    loginPage = new LoginPage(page)
    await loginPage.navigate()
  })

  it('账号密码登录 - 成功', async () => {
    await loginPage.loginWithPassword('13800138000', 'password123')

    await page.waitFor(1500)

    const currentPath = await page.path()
    expect(currentPath).toContain('index')

    const token = await program.callUniMethod('getStorageSync', { key: 'token' })
    expect(token).toBeTruthy()
  })

  it('账号密码登录 - 手机号格式错误', async () => {
    await loginPage.loginWithPassword('12345678901', 'password123')

    await page.waitFor(500)

    const toast = await page.$('.uni-toast')
    const message = await toast.text()
    expect(message).toContain('手机号格式不正确')
  })

  it('账号密码登录 - 密码错误', async () => {
    await loginPage.loginWithPassword('13800138000', 'wrongpassword')

    await page.waitFor(500)

    const toast = await page.$('.uni-toast')
    const message = await toast.text()
    expect(message).toContain('密码错误')
  })
})
```

## API参考

### program对象

#### program.currentPage()
获取当前页面对象

```javascript
const page = await program.currentPage()
```

#### program.callUniMethod(methodName, ...args)
调用uni API方法

```javascript
// 设置存储
await program.callUniMethod('setStorage', {
  key: 'token',
  data: 'abc123'
})

// 获取存储
const token = await program.callUniMethod('getStorage', {
  key: 'token'
})

// 清空存储
await program.callUniMethod('clearStorageSync')
```

#### program.reLaunch(url)
重启应用

```javascript
await program.reLaunch('/pages/index/index')
```

#### program.screenshot(options)
截图

```javascript
await program.screenshot({
  path: 'screenshot.png',
  fullPage: true
})
```

### page对象

#### page.$(selector)
获取单个元素

```javascript
const button = await page.$('.login-button')
```

#### page.$$(selector)
获取多个元素

```javascript
const items = await page.$$('.list-item')
```

#### page.navigateTo(url)
导航到指定页面

```javascript
await page.navigateTo('/pages/index/index')
```

#### page.path()
获取当前页面路径

```javascript
const path = await page.path()
console.log(path) // "pages/index/index"
```

#### page.waitFor(timeout)
等待指定时间

```javascript
await page.waitFor(1000) // 等待1秒
```

#### page.waitFor(selector, options)
等待元素出现

```javascript
const element = await page.waitFor('.target-element', {
  timeout: 5000
})
```

### element对象

#### element.tap()
点击元素

```javascript
const button = await page.$('.login-button')
await button.tap()
```

#### element.input(value)
输入文本

```javascript
const input = await page.$('input')
await input.input('Hello World')
```

#### element.text()
获取元素文本内容

```javascript
const text = await element.text()
```

#### element.attribute(name)
获取元素属性

```javascript
const value = await element.attribute('value')
const disabled = await element.attribute('disabled')
```

#### element.isVisible()
验证元素是否可见

```javascript
const visible = await element.isVisible()
```

## 最佳实践

### 1. 使用data-testid

在Vue组件中添加测试标识：

```vue
<template>
  <view>
    <input
      data-testid="mobile-input"
      type="tel"
      v-model="mobile"
    />
    <button
      data-testid="login-button"
      @click="handleLogin"
    >
      登录
    </button>
  </view>
</template>
```

### 2. 隔离测试数据

每个测试使用独立的测试账号：

```javascript
// utils/helpers.js
function generateTestMobile() {
  return `138${Date.now().toString().slice(-8)}`
}

module.exports = { generateTestMobile }
```

### 3. 智能等待策略

```javascript
// ❌ 不推荐
await page.waitFor(3000)

// ✅ 推荐
const button = await page.waitFor('.success-button', { timeout: 5000 })
```

### 4. 错误处理和验证

```javascript
it('应该显示错误提示', async () => {
  await loginPage.login('', '')

  // 等待Toast显示
  await page.waitFor(500)

  // 验证错误消息
  const toast = await page.$('.uni-toast')
  const message = await toast.text()
  expect(message).toContain('请输入手机号')
})
```

### 5. 截图记录关键步骤

```javascript
it('完整登录流程', async () => {
  await loginPage.navigate()
  await program.screenshot({
    path: 'screenshots/01-login-page.png'
  })

  await loginPage.fillMobile('13800138000')
  await program.screenshot({
    path: 'screenshots/02-fill-mobile.png'
  })

  await loginPage.login('13800138000', 'password123')
  await program.screenshot({
    path: 'screenshots/03-login-success.png'
  })
})
```

### 6. 页面对象模式（POM）

提高测试代码可维护性：

```javascript
// 使用前
await page.$('[data-testid="mobile-input"]').input('13800138000')
await page.$('[data-testid="password-input"]').input('password123')
await page.$('[data-testid="login-button"]').tap()

// 使用后（POM模式）
await loginPage.loginWithPassword('13800138000', 'password123')
```

## 常见问题

### 1. 元素查找失败

**问题**：`Error: element not found`

**解决方案**：
- 增加等待时间
- 检查选择器是否正确
- 确保元素已渲染

```javascript
// 方法1：增加等待时间
await page.waitFor(1000)

// 方法2：使用waitFor
const element = await page.waitFor('.target-element', { timeout: 5000 })
```

### 2. 测试超时

**问题**：`Error: Timeout of 5000ms exceeded`

**解决方案**：
- 增加超时时间
- 优化等待策略

```javascript
it('长时间操作', async () => {
  // ...
}, 10000) // 设置10秒超时
```

### 3. Toast消息获取失败

**问题**：Toast显示时间太短，无法获取

**解决方案**：
```javascript
// 等待Toast显示
await page.waitFor(500)
const toast = await page.$('.uni-toast')
if (toast) {
  const message = await toast.text()
  expect(message).toContain('预期消息')
}
```

### 4. 跨平台测试差异

**问题**：H5和小程序表现不一致

**解决方案**：
```javascript
const platform = process.env.UNI_PLATFORM

if (platform === 'h5') {
  // H5特定测试
} else if (platform === 'mp-weixin') {
  // 微信小程序特定测试
}
```

### 5. 测试数据污染

**问题**：测试间相互影响

**解决方案**：
```javascript
afterEach(async () => {
  // 清理存储
  await program.callUniMethod('clearStorageSync')

  // 重置应用状态
  await program.reLaunch('/pages/index/index')
})
```

## 测试辅助函数

### helpers.js

```javascript
/**
 * 生成测试手机号
 */
function generateTestMobile() {
  return `138${Date.now().toString().slice(-8)}`
}

/**
 * 生成测试密码
 */
function generateTestPassword(length = 12) {
  const chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678'
  let password = ''
  for (let i = 0; i < length; i++) {
    password += chars.charAt(Math.floor(Math.random() * chars.length))
  }
  return password
}

/**
 * 等待元素出现
 */
async function waitForElement(page, selector, timeout = 5000) {
  const startTime = Date.now()
  while (Date.now() - startTime < timeout) {
    try {
      const element = await page.$(selector)
      if (element) {
        return element
      }
    } catch (error) {
      // 忽略错误，继续等待
    }
    await sleep(200)
  }
  throw new Error(`Element ${selector} not found within ${timeout}ms`)
}

/**
 * 等待指定时间
 */
function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms))
}

/**
 * 重试异步操作
 */
async function retryAsync(fn, options = {}) {
  const { maxRetries = 3, delay = 1000 } = options

  for (let i = 0; i < maxRetries; i++) {
    try {
      return await fn()
    } catch (error) {
      if (i === maxRetries - 1) {
        throw error
      }
      await sleep(delay * (i + 1))
    }
  }
}

module.exports = {
  generateTestMobile,
  generateTestPassword,
  waitForElement,
  sleep,
  retryAsync
}
```

## package.json配置

```json
{
  "scripts": {
    "test:e2e:h5": "cross-env UNI_PLATFORM=h5 uniapp-test --platform h5 --spec tests/e2e/**/*.spec.js",
    "test:e2e:mp-weixin": "cross-env UNI_PLATFORM=mp-weixin uniapp-test --platform mp-weixin --spec tests/e2e/**/*.spec.js",
    "test:e2e:android": "cross-env UNI_PLATFORM=app-android uniapp-test --platform app-android --spec tests/e2e/**/*.spec.js",
    "test:e2e:ios": "cross-env UNI_PLATFORM=app-ios uniapp-test --platform app-ios --spec tests/e2e/**/*.spec.js"
  },
  "devDependencies": {
    "@dcloudio/uni-automator": "^3.0.0",
    "cross-env": "^7.0.3"
  }
}
```

## 官方资源

- [uni-app自动化测试快速开始](https://uniapp.dcloud.net.cn/worktile/auto/quick-start.html)
- [uni-automator API文档](https://uniapp.dcloud.net.cn/worktile/auto/api.html)
- [CLI命令行工具](https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-cli-uniapp-test.html)
- [Vitest Environment UniApp](https://github.com/uni-helper/vitest-environment-uniapp)

## 总结

E2E测试核心原则：

1. **覆盖关键流程** - 确保核心用户流程正常
2. **使用POM模式** - 提高测试代码可维护性
3. **隔离测试数据** - 避免测试间相互影响
4. **智能等待** - 提高测试稳定性
5. **跨平台测试** - 确保各平台表现一致

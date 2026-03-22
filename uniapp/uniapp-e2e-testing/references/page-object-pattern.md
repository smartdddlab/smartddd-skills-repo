# 页面对象模式（POM）详解

## 什么是页面对象模式？

页面对象模式（Page Object Model，POM）是一种设计模式，用于将Web页面的元素定位器和操作封装成独立的类，提高测试代码的可维护性和可读性。

## 核心优势

### 1. 提高可维护性

当UI发生变化时，只需要修改页面对象类，而不需要修改测试用例。

**不使用POM（❌）：**
```javascript
// 测试用例
it('登录测试', async () => {
  await page.$('.mobile-input').input('13800138000')
  await page.$('.password-input').input('password123')
  await page.$('.login-button').tap()
})
```

**使用POM（✅）：**
```javascript
// 页面对象
class LoginPage {
  async login(mobile, password) {
    await this.page.$('.mobile-input').input(mobile)
    await this.page.$('.password-input').input(password)
    await this.page.$('.login-button').tap()
  }
}

// 测试用例
it('登录测试', async () => {
  await loginPage.login('13800138000', 'password123')
})
```

### 2. 提高代码复用性

多个测试用例可以复用同一个页面对象的方法。

### 3. 提高可读性

测试用例更加清晰，关注业务逻辑而非实现细节。

## 三层架构

### Layer 1: BasePage（基础页面类）

封装所有页面的通用操作。

```javascript
class BasePage {
  constructor(page) {
    this.page = page
  }

  // 导航
  async navigate(url) {
    await this.page.navigateTo(url)
    await this.page.waitFor(500)
  }

  // 元素查找
  async $(selector) {
    return await this.page.$(selector)
  }

  async $$(selector) {
    return await this.page.$$(selector)
  }

  // 等待
  async waitFor(selector, timeout = 5000) {
    return await this.page.waitFor(selector, { timeout })
  }

  // 点击
  async tap(selector) {
    const element = await this.$(selector)
    await element.tap()
  }

  // 输入
  async input(selector, value) {
    const element = await this.$(selector)
    await element.input(value)
  }

  // 获取文本
  async getText(selector) {
    const element = await this.$(selector)
    return await element.text()
  }

  // 验证
  async expectToBeOnPage(expectedPath) {
    const currentPath = await this.page.path()
    if (!currentPath.includes(expectedPath)) {
      throw new Error(`Expected to be on page "${expectedPath}", but currently on "${currentPath}"`)
    }
  }
}

module.exports = BasePage
```

### Layer 2: FeaturePage（功能页面类）

继承BasePage，封装特定页面的操作。

```javascript
const BasePage = require('./base.page')

class LoginPage extends BasePage {
  constructor(page) {
    super(page)

    // 元素选择器
    this.selectors = {
      mobileInput: '[data-testid="mobile-input"]',
      passwordInput: '[data-testid="password-input"]',
      loginButton: '[data-testid="login-button"]',
      getCodeButton: '[data-testid="get-code-button"]'
    }
  }

  // 页面导航
  async navigate() {
    await this.navigate('/pages/login/login')
  }

  // 输入手机号
  async inputMobile(mobile) {
    await this.input(this.selectors.mobileInput, mobile)
  }

  // 输入密码
  async inputPassword(password) {
    await this.input(this.selectors.passwordInput, password)
  }

  // 点击登录
  async clickLoginButton() {
    await this.tap(this.selectors.loginButton)
  }

  // 完整登录流程
  async loginWithPassword(mobile, password) {
    await this.inputMobile(mobile)
    await this.inputPassword(password)
    await this.clickLoginButton()
    await this.wait(1000)
  }

  // 验证码登录流程
  async loginWithCode(mobile, code) {
    await this.inputMobile(mobile)
    await this.tap(this.selectors.getCodeButton)
    await this.wait(1000)
    await this.input('[data-testid="code-input"]', code)
    await this.clickLoginButton()
    await this.wait(1000)
  }

  // 获取错误消息
  async getErrorMessage() {
    try {
      return await this.getText('[data-testid="error-message"]')
    } catch (error) {
      // 尝试获取Toast消息
      const toast = await this.$('.uni-toast')
      if (toast) {
        return await toast.text()
      }
      return null
    }
  }

  // 验证登录按钮状态
  async expectLoginButtonToBeDisabled() {
    const button = await this.$(this.selectors.loginButton)
    const disabled = await button.attribute('disabled')
    if (disabled !== 'true' && disabled !== true) {
      throw new Error('Expected login button to be disabled')
    }
  }
}

module.exports = LoginPage
```

### Layer 3: Test Specs（测试用例）

使用页面对象编写测试用例。

```javascript
const LoginPage = require('../../page-objects/login.page')

describe('用户登录', () => {
  let page
  let loginPage

  beforeEach(async () => {
    page = await program.currentPage()
    loginPage = new LoginPage(page)
    await loginPage.navigate()
  })

  it('应该成功登录', async () => {
    // 使用页面对象的方法
    await loginPage.loginWithPassword('13800138000', 'password123')

    // 验证结果
    await loginPage.expectToBeOnPage('index')
  })

  it('应该在密码错误时显示错误提示', async () => {
    await loginPage.loginWithPassword('13800138000', 'wrongpassword')

    const errorMessage = await loginPage.getErrorMessage()
    expect(errorMessage).toContain('密码错误')
  })

  it('应该在参数为空时禁用登录按钮', async () => {
    await loginPage.expectLoginButtonToBeDisabled()
  })
})
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

### 2. 选择器集中管理

在页面对象中集中定义选择器：

```javascript
class LoginPage extends BasePage {
  constructor(page) {
    super(page)
    this.selectors = {
      mobileInput: '[data-testid="mobile-input"]',
      passwordInput: '[data-testid="password-input"]',
      loginButton: '[data-testid="login-button"]'
    }
  }
}
```

### 3. 方法命名清晰

方法名应该描述操作意图：

```javascript
// ✅ 好的命名
async loginWithPassword(mobile, password) { }
async expectLoginButtonToBeDisabled() { }
async waitForToastMessage() { }

// ❌ 不好的命名
async doIt(mobile, password) { }
async check() { }
async wait() { }
```

### 4. 封装复杂操作

将多步操作封装成一个方法：

```javascript
// ❌ 不推荐：在测试用例中写多步操作
await loginPage.inputMobile(mobile)
await loginPage.inputPassword(password)
await loginPage.clickLoginButton()
await page.waitFor(1000)

// ✅ 推荐：封装成一个方法
await loginPage.loginWithPassword(mobile, password)
```

### 5. 提供验证方法

在页面对象中提供验证方法：

```javascript
class LoginPage extends BasePage {
  async expectToBeOnLoginPage() {
    await this.expectToBeOnPage('login')
  }

  async expectErrorMessageToBeVisible(expectedMessage) {
    const message = await this.getErrorMessage()
    if (!message.includes(expectedMessage)) {
      throw new Error(`Expected error message "${expectedMessage}", but got "${message}"`)
    }
  }
}
```

## 目录结构

```
tests/e2e/
├── page-objects/
│   ├── base.page.js          # 基础页面类
│   ├── login.page.js         # 登录页面
│   ├── register.page.js      # 注册页面
│   └── index.page.js         # 首页
├── specs/
│   ├── auth/
│   │   ├── login.spec.js     # 登录测试
│   │   └── register.spec.js  # 注册测试
│   └── features/
│       └── reminder.spec.js  # 提醒功能测试
└── utils/
    └── helpers.js            # 测试辅助函数
```

## 常见问题

### Q1: 什么时候创建页面对象？

**A:** 当一个页面有多个测试用例，或者页面操作较复杂时，应该创建页面对象。

### Q2: 页面对象应该包含哪些内容？

**A:**
- 元素选择器
- 页面导航方法
- 页面操作方法
- 验证方法
- 辅助方法

### Q3: 如何处理跨页面的操作？

**A:** 在测试用例中组合多个页面对象：

```javascript
it('注册并登录', async () => {
  // 使用注册页面对象
  await registerPage.register(mobile, password)

  // 使用登录页面对象
  await loginPage.loginWithPassword(mobile, password)
})
```

### Q4: 页面对象可以包含业务逻辑吗？

**A:** 页面对象应该只包含页面相关的操作，不应该包含业务逻辑。业务逻辑应该在测试用例中。

## 总结

页面对象模式的核心价值：

1. **提高可维护性** - UI变化时只需修改页面对象
2. **提高复用性** - 多个测试复用同一页面对象
3. **提高可读性** - 测试用例关注业务逻辑
4. **降低耦合** - 测试与实现细节分离

遵循POM模式，可以让你的E2E测试代码更加健壮和易于维护！

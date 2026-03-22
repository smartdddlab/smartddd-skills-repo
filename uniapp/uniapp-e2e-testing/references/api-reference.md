# uni-automator API完整参考

## program对象

program是uni-automator的全局对象，用于控制整个应用。

### program.currentPage()

获取当前活动的页面对象。

**返回值：** `Promise<Page>`

**示例：**
```javascript
const page = await program.currentPage()
```

---

### program.callUniMethod(methodName, ...args)

调用uni API方法。

**参数：**
- `methodName` (string) - uni API方法名
- `args` (any) - 方法参数

**返回值：** `Promise<any>`

**示例：**
```javascript
// 设置存储
await program.callUniMethod('setStorage', {
  key: 'token',
  data: 'abc123'
})

// 获取存储
const token = await program.callUniMethod('getStorageSync', {
  key: 'token'
})

// 清空存储
await program.callUniMethod('clearStorageSync')

// 显示Toast
await program.callUniMethod('showToast', {
  title: '操作成功',
  icon: 'success'
})
```

---

### program.reLaunch(url)

重启应用到指定页面。

**参数：**
- `url` (string) - 页面路径

**返回值：** `Promise<void>`

**示例：**
```javascript
await program.reLaunch('/pages/index/index')
```

---

### program.screenshot(options)

截取应用屏幕截图。

**参数：**
- `options` (object) - 截图选项
  - `path` (string) - 保存路径
  - `fullPage` (boolean) - 是否全屏截图

**返回值：** `Promise<void>`

**示例：**
```javascript
await program.screenshot({
  path: 'screenshots/homepage.png',
  fullPage: true
})
```

---

## page对象

page对象代表一个页面，提供页面级别的操作。

### page.$(selector)

获取单个元素。

**参数：**
- `selector` (string) - CSS选择器

**返回值：** `Promise<Element>`

**示例：**
```javascript
const button = await page.$('.login-button')
```

---

### page.$$(selector)

获取多个元素。

**参数：**
- `selector` (string) - CSS选择器

**返回值：** `Promise<Element[]>`

**示例：**
```javascript
const items = await page.$$('.list-item')
```

---

### page.navigateTo(url)

导航到指定页面。

**参数：**
- `url` (string) - 页面路径

**返回值：** `Promise<void>`

**示例：**
```javascript
await page.navigateTo('/pages/login/login')
```

---

### page.navigateBack(delta)

返回上一页。

**参数：**
- `delta` (number) - 返回的页面数，默认为1

**返回值：** `Promise<void>`

**示例：**
```javascript
await page.navigateBack(1)
```

---

### page.reLaunch(url)

重启应用到指定页面。

**参数：**
- `url` (string) - 页面路径

**返回值：** `Promise<void>`

**示例：**
```javascript
await page.reLaunch('/pages/index/index')
```

---

### page.path()

获取当前页面路径。

**返回值：** `Promise<string>`

**示例：**
```javascript
const path = await page.path()
console.log(path) // "pages/index/index"
```

---

### page.waitFor(timeout)

等待指定时间。

**参数：**
- `timeout` (number) - 等待时间（毫秒）

**返回值：** `Promise<void>`

**示例：**
```javascript
await page.waitFor(1000) // 等待1秒
```

---

### page.waitFor(selector, options)

等待元素出现。

**参数：**
- `selector` (string) - CSS选择器
- `options` (object) - 选项
  - `timeout` (number) - 超时时间（毫秒）

**返回值：** `Promise<Element>`

**示例：**
```javascript
const element = await page.waitFor('.success-button', {
  timeout: 5000
})
```

---

### page.callUniMethod(methodName, ...args)

在页面上下文中调用uni API方法。

**参数：**
- `methodName` (string) - uni API方法名
- `args` (any) - 方法参数

**返回值：** `Promise<any>`

**示例：**
```javascript
const systemInfo = await page.callUniMethod('getSystemInfoSync')
```

---

### page.setData(data)

设置页面数据。

**参数：**
- `data` (object) - 页面数据

**返回值：** `Promise<void>`

**示例：**
```javascript
await page.setData({
  username: 'test'
})
```

---

### page.data(path)

获取页面数据。

**参数：**
- `path` (string) - 数据路径

**返回值：** `Promise<any>`

**示例：**
```javascript
const username = await page.data('username')
```

---

## element对象

element对象代表页面中的一个元素。

### element.tap()

点击元素。

**返回值：** `Promise<void>`

**示例：**
```javascript
const button = await page.$('.login-button')
await button.tap()
```

---

### element.input(value)

在输入框中输入文本。

**参数：**
- `value` (string) - 输入的文本

**返回值：** `Promise<void>`

**示例：**
```javascript
const input = await page.$('input')
await input.input('Hello World')
```

---

### element.text()

获取元素文本内容。

**返回值：** `Promise<string>`

**示例：**
```javascript
const text = await element.text()
console.log(text) // "登录"
```

---

### element.attribute(name)

获取元素属性值。

**参数：**
- `name` (string) - 属性名

**返回值：** `Promise<string>`

**示例：**
```javascript
const value = await element.attribute('value')
const disabled = await element.attribute('disabled')
```

---

### element.value()

获取表单元素的值。

**返回值：** `Promise<string>`

**示例：**
```javascript
const value = await inputElement.value()
```

---

### element.style(name)

获取元素样式。

**参数：**
- `name` (string) - 样式名

**返回值：** `Promise<string>`

**示例：**
```javascript
const color = await element.style('color')
```

---

### element.hasClass(className)

检查元素是否有指定class。

**参数：**
- `className` (string) - class名

**返回值：** `Promise<boolean>`

**示例：**
```javascript
const hasActive = await element.hasClass('active')
```

---

### element.isVisible()

检查元素是否可见。

**返回值：** `Promise<boolean>`

**示例：**
```javascript
const visible = await element.isVisible()
if (visible) {
  console.log('元素可见')
}
```

---

### element.$(selector)

在元素内查找子元素。

**参数：**
- `selector` (string) - CSS选择器

**返回值：** `Promise<Element>`

**示例：**
```javascript
const parent = await page.$('.container')
const child = await parent.$('.child-item')
```

---

### element.$$(selector)

在元素内查找多个子元素。

**参数：**
- `selector` (string) - CSS选择器

**返回值：** `Promise<Element[]>`

**示例：**
```javascript
const list = await page.$('.list')
const items = await list.$$('.item')
```

---

## 断言方法

### expect(value).toBe(expected)

验证值是否相等。

**示例：**
```javascript
expect(1 + 1).toBe(2)
```

---

### expect(value).toBeTruthy()

验证值是否为真。

**示例：**
```javascript
const token = await program.callUniMethod('getStorageSync', { key: 'token' })
expect(token).toBeTruthy()
```

---

### expect(value).toBeFalsy()

验证值是否为假。

**示例：**
```javascript
const error = await page.$('.error-message')
expect(error).toBeFalsy()
```

---

### expect(string).toContain(substring)

验证字符串是否包含子串。

**示例：**
```javascript
const message = await toast.text()
expect(message).toContain('成功')
```

---

### expect(value).toBeGreaterThan(number)

验证值是否大于指定数字。

**示例：**
```javascript
const items = await page.$$('.list-item')
expect(items.length).toBeGreaterThan(0)
```

---

## 辅助函数

### waitForElement(page, selector, timeout)

等待元素出现。

**参数：**
- `page` (Page) - 页面对象
- `selector` (string) - CSS选择器
- `timeout` (number) - 超时时间

**返回值：** `Promise<Element>`

**示例：**
```javascript
const element = await waitForElement(page, '.target', 5000)
```

---

### waitForElementToDisappear(page, selector, timeout)

等待元素消失。

**参数：**
- `page` (Page) - 页面对象
- `selector` (string) - CSS选择器
- `timeout` (number) - 超时时间

**返回值：** `Promise<boolean>`

**示例：**
```javascript
await waitForElementToDisappear(page, '.loading', 5000)
```

---

### sleep(ms)

等待指定时间。

**参数：**
- `ms` (number) - 等待时间（毫秒）

**返回值：** `Promise<void>`

**示例：**
```javascript
await sleep(1000)
```

---

### retryAsync(fn, options)

重试异步操作。

**参数：**
- `fn` (Function) - 要执行的函数
- `options` (object) - 选项
  - `maxRetries` (number) - 最大重试次数
  - `delay` (number) - 重试延迟

**返回值：** `Promise<any>`

**示例：**
```javascript
const result = await retryAsync(
  async () => {
    const data = await fetchData()
    if (!data) throw new Error('No data')
    return data
  },
  { maxRetries: 3, delay: 1000 }
)
```

---

## 完整示例

### 登录流程测试

```javascript
describe('登录流程', () => {
  let page
  let loginPage

  beforeEach(async () => {
    page = await program.currentPage()
    loginPage = new LoginPage(page)
    await loginPage.navigate()
  })

  it('应该成功登录', async () => {
    // 输入手机号
    const mobileInput = await page.$('[data-testid="mobile-input"]')
    await mobileInput.input('13800138000')

    // 输入密码
    const passwordInput = await page.$('[data-testid="password-input"]')
    await passwordInput.input('password123')

    // 点击登录
    const loginButton = await page.$('[data-testid="login-button"]')
    await loginButton.tap()

    // 等待跳转
    await page.waitFor(1500)

    // 验证页面路径
    const currentPath = await page.path()
    expect(currentPath).toContain('index')

    // 验证Token已保存
    const token = await program.callUniMethod('getStorageSync', { key: 'token' })
    expect(token).toBeTruthy()
  })
})
```

---

## 参考资源

- [uni-automator官方文档](https://uniapp.dcloud.net.cn/worktile/auto/api.html)
- [Jest断言API](https://jestjs.io/docs/expect)

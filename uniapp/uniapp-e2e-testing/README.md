# uni-app E2E自动化测试 Skill

> 快速搭建uni-app官方uni-automator E2E测试基础设施

## 简介

这是一个专门为uni-app项目设计的Claude Code Skill，帮助开发者快速搭建基于官方**uni-automator**的E2E自动化测试基础设施。

### 核心特性

✅ **开箱即用** - 完整的测试框架，5分钟即可开始测试
✅ **官方标准** - 基于uni-automator官方最佳实践
✅ **页面对象模型** - 提供POM框架，提高代码可维护性
✅ **跨平台支持** - H5、微信小程序、Android、iOS
✅ **丰富示例** - 登录/注册流程完整测试代码
✅ **工具函数库** - 可复用的测试辅助函数

## 功能特性

### 1. 完整的测试基础设施

自动生成以下目录结构：

```
tests/e2e/
├── config/
│   └── automator.config.js      # 测试配置
├── page-objects/                # 页面对象模型
│   ├── base.page.js
│   ├── login.page.js
│   └── register.page.js
├── specs/                       # 测试用例
│   └── auth/
│       ├── login.spec.js
│       └── register.spec.js
└── utils/                       # 测试工具
    └── helpers.js
```

### 2. 页面对象模型（POM）

提供三层架构的页面对象模式：

- **BasePage** - 基础页面类，封装通用操作
- **FeaturePage** - 功能页面类，封装特定操作
- **Test Specs** - 测试用例，使用POM编写

### 3. 跨平台测试

支持以下平台的E2E测试：

- ✅ H5（Chrome浏览器）
- ✅ 微信小程序
- ✅ Android App
- ✅ iOS App

### 4. 丰富的测试工具

- 测试数据生成器（手机号、密码等）
- 智能等待策略
- 错误处理和重试机制
- 截图和日志记录
- 自定义断言

## 快速开始

### 安装

```bash
# 1. 安装依赖
npm install @dcloudio/uni-automator --save-dev

# 2. 使用Skill生成测试基础设施
# （在Claude Code中调用此Skill）
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

## 使用示例

### 示例1：快速搭建测试基础设施

```javascript
// 用户请求
"为我的uni-app项目添加E2E测试"

// Skill输出
✅ E2E测试基础设施已创建！
📁 生成的文件：
  - tests/e2e/config/automator.config.js
  - tests/e2e/page-objects/base.page.js
  - tests/e2e/specs/auth/login.spec.js
  - ...

🚀 运行测试：
  npm run test:e2e:h5
```

### 示例2：为特定页面创建测试

```javascript
// 用户请求
"为登录页面创建E2E测试"

// Skill输出
✅ 登录页面E2E测试已创建！
📄 测试场景：
  ✅ 账号密码登录 - 成功
  ✅ 账号密码登录 - 手机号格式错误
  ✅ 账号密码登录 - 密码错误
  ✅ 验证码登录 - 成功
```

## 最佳实践

本Skill遵循以下测试最佳实践：

1. **使用data-testid** - 在Vue组件中添加测试标识
2. **页面对象模式** - 提高代码可维护性
3. **测试数据隔离** - 每个测试使用独立数据
4. **智能等待** - 使用waitFor而不是固定等待
5. **错误场景覆盖** - 测试成功和失败场景
6. **跨平台测试** - 确保各平台表现一致

## 核心API

### program对象

```javascript
// 获取当前页面
const page = await program.currentPage()

// 调用uni API
await program.callUniMethod('setStorage', { key: 'token', data: 'abc123' })

// 重启应用
await program.reLaunch('/pages/index/index')

// 截图
await program.screenshot({ path: 'screenshot.png' })
```

### page对象

```javascript
// 导航
await page.navigateTo('/pages/index/index')

// 查找元素
const element = await page.$('.selector')

// 等待元素
const element = await page.waitFor('.selector', { timeout: 5000 })

// 获取页面路径
const path = await page.path()
```

### element对象

```javascript
// 点击
await element.tap()

// 输入
await element.input('Hello World')

// 获取文本
const text = await element.text()
```

## 文档

- **[SKILL.md](SKILL.md)** - 完整的Skill文档
- **[references/e2e-testing-guide.md](references/e2e-testing-guide.md)** - E2E测试完整指南
- **[references/page-object-pattern.md](references/page-object-pattern.md)** - 页面对象模式详解
- **[references/api-reference.md](references/api-reference.md)** - 完整API参考

## 常见问题

### Q: 测试超时怎么办？

A: 增加超时时间或优化等待策略：

```javascript
it('长时间操作', async () => {
  // ...
}, 10000) // 设置10秒超时
```

### Q: 元素找不到怎么办？

A: 使用智能等待：

```javascript
const element = await page.waitFor('.target-element', { timeout: 5000 })
```

### Q: 如何测试微信小程序？

A: 确保安装了微信开发者工具并开启服务端口，然后运行：

```bash
npm run test:e2e:mp-weixin
```

## 相关资源

### 官方文档

- [uni-automator快速开始](https://uniapp.dcloud.net.cn/worktile/auto/quick-start.html)
- [uni-automator API文档](https://uniapp.dcloud.net.cn/worktile/auto/api.html)
- [CLI命令行工具](https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-cli-uniapp-test.html)

### 社区资源

- [Vitest Environment UniApp](https://github.com/uni-helper/vitest-environment-uniapp)
- [uni-app自动化测试终极指南](https://blog.csdn.net/gitblog_07704/article/details/148601140)

## 版本历史

- **v1.0.0** (2025-03-21)
  - 初始版本
  - 支持H5和微信小程序测试
  - 提供完整的POM框架
  - 包含登录/注册测试示例

## 贡献

欢迎贡献代码和建议！

1. Fork本Skill仓库
2. 创建特性分支
3. 提交改进
4. 创建Pull Request

## 许可证

本Skill采用 CC BY-NC-SA 4.0 许可证。详见 [LICENSE.txt](LICENSE.txt)。

---

**Happy E2E Testing! 🚀**

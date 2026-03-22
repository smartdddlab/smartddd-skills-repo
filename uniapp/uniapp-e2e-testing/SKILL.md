---
name: uniapp-e2e-testing
description: 快速搭建uni-app官方uni-automator E2E测试基础设施，提供完整测试框架、页面对象模型和最佳实践
license: LICENSE-CC-BY-NC-SA 4.0 in LICENSE.txt
author: Based on official uni-automator best practices
---

# uni-app E2E自动化测试 Skill

帮助开发者快速搭建基于官方 **uni-automator** 的E2E测试基础设施，提供完整的测试框架、页面对象模型（POM）和最佳实践指导。

## 使用场景

使用此Skill的场景：

- ✅ 需要为uni-app项目添加E2E自动化测试
- ✅ 需要快速搭建测试基础设施
- ✅ 需要了解uni-automator API使用方法
- ✅ 需要页面对象模型（POM）最佳实践
- ✅ 需要跨平台测试（H5、小程序、App）
- ✅ 需要测试工具函数和辅助方法

## 前置条件

使用此Skill前需要：

1. **已创建uni-app项目**（Vue 3 + Vite推荐）
2. **Node.js环境**（v16+）
3. **安装依赖**：
   ```bash
   npm install @dcloudio/uni-automator --save-dev
   ```
4. **（可选）微信开发者工具** - 如需测试微信小程序
5. **（可选）Android/iOS环境** - 如需测试App

## 工作流

### 完整测试基础设施搭建流程

#### 阶段1：项目分析

1. **识别测试需求**
   - 分析项目结构
   - 确定核心用户流程
   - 识别关键测试场景

2. **确定测试平台**
   - H5（默认）
   - 微信小程序
   - Android App
   - iOS App
   - 选择需要支持的平台

#### 阶段2：基础设施搭建

3. **创建测试目录结构**
   ```
   tests/e2e/
   ├── config/
   │   └── automator.config.js
   ├── page-objects/
   │   ├── base.page.js
   │   └── [feature].page.js
   ├── specs/
   │   └── [feature]/
   │       └── [test].spec.js
   └── utils/
       └── helpers.js
   ```

4. **生成配置文件**
   - automator.config.js - 测试平台配置
   - package.json scripts - 测试命令

5. **创建页面对象基类**
   - BasePage类 - 封装通用操作
   - 元素定位器管理
   - 断言方法封装

#### 阶段3：测试用例开发

6. **创建页面对象**
   - 为每个页面创建Page Object
   - 定义元素选择器
   - 封装页面操作

7. **编写测试用例**
   - 使用AAA模式（Arrange-Act-Assert）
   - 覆盖成功和失败场景
   - 添加错误处理和验证

8. **运行和调试**
   - 执行测试
   - 分析失败原因
   - 优化测试稳定性

#### 阶段4：持续优化

9. **提高测试覆盖率**
   - 添加更多测试场景
   - 覆盖边界条件
   - 测试跨平台兼容性

10. **集成CI/CD**
    - 配置自动化测试流程
    - 生成测试报告
    - 设置质量门禁

## 输入参数

Skill接受以下输入：

### 必需参数

- **项目路径** - uni-app项目的根目录路径

### 可选参数

- **测试平台** - 需要支持的测试平台（默认：h5）
  - `h5` - H5平台
  - `mp-weixin` - 微信小程序
  - `app-android` - Android App
  - `app-ios` - iOS App

- **测试场景** - 需要测试的功能场景（默认：auth）
  - `auth` - 认证相关（登录/注册）
  - `features` - 核心功能
  - `all` - 所有场景

- **项目类型** - 项目类型（默认：vue3）
  - `vue3` - Vue 3 + Vite
  - `vue2` - Vue 2

## 输出格式

Skill将生成以下输出：

### 文件结构

```
tests/e2e/
├── README.md                    # E2E测试使用指南
├── QUICKSTART.md                # 5分钟快速入门
├── config/
│   └── automator.config.js      # uni-automator配置
├── page-objects/                # 页面对象模型
│   ├── base.page.js             # 基础页面类
│   ├── login.page.js            # 登录页面
│   └── register.page.js         # 注册页面
├── specs/                       # 测试用例
│   └── auth/
│       ├── login.spec.js        # 登录流程测试
│       └── register.spec.js     # 注册流程测试
└── utils/                       # 测试工具
    └── helpers.js               # 辅助函数
```

### package.json更新

```json
{
  "scripts": {
    "test:e2e:h5": "cross-env UNI_PLATFORM=h5 uniapp-test --platform h5 --spec tests/e2e/**/*.spec.js",
    "test:e2e:mp-weixin": "cross-env UNI_PLATFORM=mp-weixin uniapp-test --platform mp-weixin --spec tests/e2e/**/*.spec.js"
  },
  "devDependencies": {
    "@dcloudio/uni-automator": "^3.0.0",
    "cross-env": "^7.0.3"
  }
}
```

### 文档输出

1. **README.md** - 完整的E2E测试使用指南
2. **QUICKSTART.md** - 5分钟快速入门指南
3. **控制台输出** - 实时进度和状态信息

## 使用示例

### 示例1：为现有项目添加E2E测试

```javascript
// 用户请求
"为我的uni-app项目添加E2E测试基础设施"

// Skill执行流程
1. 分析项目结构
2. 识别核心功能（登录、注册等）
3. 生成测试目录和文件
4. 创建示例测试用例
5. 更新package.json

// 输出
✅ E2E测试基础设施已创建！
📁 生成的文件：
  - tests/e2e/config/automator.config.js
  - tests/e2e/page-objects/base.page.js
  - tests/e2e/page-objects/login.page.js
  - tests/e2e/specs/auth/login.spec.js
  - ...

🚀 运行测试：
  npm run test:e2e:h5
```

### 示例2：创建特定页面的测试

```javascript
// 用户请求
"为登录页面创建E2E测试"

// Skill执行流程
1. 读取登录页面代码
2. 识别关键元素（data-testid）
3. 生成LoginPage页面对象
4. 创建登录流程测试用例
5. 提供运行指导

// 输出
✅ 登录页面E2E测试已创建！
📄 生成的文件：
  - tests/e2e/page-objects/login.page.js
  - tests/e2e/specs/auth/login.spec.js

📝 测试场景：
  ✅ 账号密码登录 - 成功
  ✅ 账号密码登录 - 手机号格式错误
  ✅ 账号密码登录 - 密码错误
  ✅ 验证码登录 - 成功
  ✅ 验证码登录 - 验证码错误
```

### 示例3：添加data-testid到组件

```javascript
// 用户请求
"帮我在登录组件中添加data-testid"

// Skill执行流程
1. 读取组件代码
2. 识别需要测试的元素
3. 添加data-testid属性
4. 更新页面对象的选择器

// 输出
✅ 已添加data-testid！

📝 更新的组件：
<template>
  <view>
    <input
      data-testid="mobile-input"  <!-- 新增 -->
      type="tel"
      v-model="mobile"
    />
    <button
      data-testid="login-button"  <!-- 新增 -->
      @click="handleLogin"
    >
      登录
    </button>
  </view>
</template>

💡 提示：页面对象已更新选择器
```

## 核心功能

### 1. 完整的页面对象模型（POM）

提供三层架构：

- **BasePage** - 基础页面类，封装通用操作
- **FeaturePage** - 功能页面类，封装特定页面操作
- **Test Specs** - 测试用例，使用POM编写

### 2. 跨平台测试支持

支持以下平台的E2E测试：

- ✅ H5（Chrome浏览器）
- ✅ 微信小程序
- ✅ Android App
- ✅ iOS App

### 3. 丰富的测试工具

提供以下辅助功能：

- 测试数据生成器（手机号、密码等）
- 智能等待策略
- 错误处理和重试机制
- 截图和日志记录
- 自定义断言

### 4. 最佳实践指导

遵循以下最佳实践：

- ✅ 使用data-testid进行元素定位
- ✅ 页面对象模式（POM）
- ✅ 测试数据隔离
- ✅ AAA模式（Arrange-Act-Assert）
- ✅ 智能等待而非固定等待
- ✅ 错误场景覆盖

## 注意事项

### 重要提示

1. **uni-automator版本**
   - 确保使用与项目uni-app版本匹配的uni-automator
   - 推荐使用最新稳定版

2. **微信小程序测试**
   - 需要安装微信开发者工具
   - 需要开启服务端口（设置 -> 安全 -> 服务端口）

3. **App测试**
   - 需要配置真机或模拟器
   - 需要安装相应的驱动程序

4. **测试稳定性**
   - 使用智能等待而非固定等待
   - 避免依赖网络状态的测试
   - 使用独立的测试账号

### 常见陷阱

❌ **不要**：
- 在生产环境运行测试
- 使用硬编码的测试数据
- 忽略跨平台差异
- 跳过错误场景测试

✅ **应该**：
- 使用独立的测试环境
- 动态生成测试数据
- 考虑平台特定逻辑
- 覆盖所有关键路径

## 错误处理

### 常见错误及解决方案

#### 1. 元素查找失败

```
Error: element not found
```

**解决方案**：
- 增加等待时间
- 检查选择器是否正确
- 使用`page.waitFor()`而不是固定等待

#### 2. 测试超时

```
Error: Timeout of 5000ms exceeded
```

**解决方案**：
- 增加超时时间：`it('test', async () => {}, 10000)`
- 优化等待策略
- 检查网络连接

#### 3. 跨平台测试失败

```
H5测试通过，小程序测试失败
```

**解决方案**：
- 使用条件编译处理平台差异
- 针对不同平台编写不同的测试
- 检查平台特定API的可用性

#### 4. Toast消息获取失败

```
Cannot read property 'text' of null
```

**解决方案**：
- 增加等待时间让Toast显示
- 使用try-catch处理
- 验证Toast是否存在

## 扩展功能

### 自定义页面对象

可以创建自定义页面对象类：

```javascript
class CustomPage extends BasePage {
  constructor(page) {
    super(page)
    this.selectors = {
      // 自定义选择器
    }
  }

  // 自定义方法
  async customAction() {
    // ...
  }
}
```

### 自定义断言

添加自定义断言方法：

```javascript
async expectCustomValidation(value) {
  // 自定义验证逻辑
}
```

### 自定义辅助函数

在`utils/helpers.js`中添加：

```javascript
function customHelper() {
  // 自定义辅助函数
}

module.exports = { customHelper }
```

## 性能优化

### 提高测试速度

1. **并行执行**
   - 配置测试并行运行
   - 减少测试间依赖

2. **智能等待**
   - 使用`waitFor()`而不是`sleep()`
   - 设置合理的超时时间

3. **选择性测试**
   - 只运行修改相关的测试
   - 使用测试标记过滤

### 提高测试稳定性

1. **重试机制**
   - 配置失败重试
   - 使用`retryAsync()`辅助函数

2. **错误处理**
   - 捕获并记录所有错误
   - 提供清晰的错误消息

3. **测试隔离**
   - 每个测试使用独立数据
   - 清理测试环境

## 相关资源

### 官方文档

- [uni-automator快速开始](https://uniapp.dcloud.net.cn/worktile/auto/quick-start.html)
- [uni-automator API文档](https://uniapp.dcloud.net.cn/worktile/auto/api.html)
- [CLI命令行工具](https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-cli-uniapp-test.html)

### 社区资源

- [Vitest Environment UniApp](https://github.com/uni-helper/vitest-environment-uniapp)
- [uni-app自动化测试终极指南](https://blog.csdn.net/gitblog_07704/article/details/148601140)

### 本Skill的参考文件

详细文档请参阅 `references/` 目录：

- `e2e-testing-guide.md` - 完整的E2E测试指南
- `page-object-pattern.md` - 页面对象模式详解
- `api-reference.md` - 完整API参考

## 版本历史

- **v1.0.0** (2025-03-21)
  - 初始版本
  - 支持H5和微信小程序测试
  - 提供完整的POM框架
  - 包含登录/注册测试示例

## 贡献指南

欢迎贡献代码和建议！

1. Fork本Skill仓库
2. 创建特性分支
3. 提交改进
4. 创建Pull Request

## 许可证

本Skill采用 CC BY-NC-SA 4.0 许可证。详见 LICENSE.txt。

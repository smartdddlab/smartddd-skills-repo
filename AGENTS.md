# AGENTS.md - 技能使用场景分析

本文档分析仓库中每个技能的使用场景和触发条件。

## 🔧 开发者工具 (developer-tools)

### claude-code

**什么时候用：**
- 用户询问 "use claude code"、"claude code cli"、"claude code mcp"
- 配置 Claude Code 设置或偏好
- 使用 MCP (Model Context Protocol) 服务器
- 创建自定义代理或技能
- 实现 AI 辅助开发工作流
- 排查 Claude Code 问题
- 设置 IDE 集成

**核心触发词：**
`claude code cli`, `claude code configuration`, `claude code skills`, `claude code agents`, `claude code mcp`, `claude code ide`

**典型使用场景：**
1. 安装和配置 Claude Code CLI
2. 设置 MCP 服务器（filesystem、brave-search 等）
3. 创建自定义技能扩展功能
4. 配置 IDE 集成（VS Code、JetBrains）
5. 排查 Claude Code 使用问题

---

### superclaude-invoker

**什么时候用：**
- 用户询问 "invoke SuperClaude command"、"dynamically invoke SuperClaude"
- 在外部工具（BMAD、spec-kit）中调用 SuperClaude 命令
- 需要 SuperClaude 命令路由功能
- CLI 自动化和集成

**核心触发词：**
`superclaude invoker`, `invoke superclaude`, `route superclaude commands`, `integrate with bmad`, `call superclaude from cli`

**典型使用场景：**
1. 从 BMAD 工具调用 SuperClaude 分析命令
2. 在 spec-kit 中使用 SuperClaude 工作流
3. 外部 CLI 工具集成 SuperClaude 功能
4. 自动化命令路由和参数提取

**支持命令类别：**
- 开发：`/sc:build`, `/sc:implement`
- 分析：`/sc:analyze`, `/sc:troubleshoot`
- 质量：`/sc:improve`, `/sc:cleanup`
- 规划：`/sc:design`, `/sc:task`, `/sc:estimate`
- 测试：`/sc:test`
- Git：`/sc:git`
- 文档：`/sc:document`, `/sc:explain`
- 元操作：`/sc:spawn`, `/sc:load`, `/sc:save`, `/sc:reflect`

---

### bmad-method

**什么时候用：**
- 用户询问 "use BMAD-METHOD"、"understand bmad method"
- 使用 BMAD 框架或工作流
- 询问 BMAD 功能、API 或最佳实践
- 实现 BMAD 解决方案
- 学习规模自适应 AI 开发模式

**核心触发词：**
`bmad method`, `breakthrough method`, `agile ai driven development`, `bmad workflows`, `bmad api`

**典型使用场景：**
1. 使用 BMAD 快速流（Quick Flow）开发
2. 实现派对模式（Party Mode）多代理协作
3. 规模自适应系统开发
4. BMAD 模块集成（BMM、BMB、BMGD）

---

### opencode

**什么时候用：**
- 用户询问 "use opencode"、"configure opencode"
- 使用 OpenCode AI 编码代理
- 配置提供商（Anthropic、OpenAI、Google 等）
- 使用 OpenCode 命令或 CLI
- 设置 MCP 服务器或自定义工具
- 创建自定义代理或技能
- 实现 GitLab/GitHub 集成

**核心触发词：**
`opencode`, `opencode commands`, `opencode providers`, `opencode mcp servers`, `opencode agents`, `opencode skills`

**典型使用场景：**
1. 安装和配置 OpenCode
2. 设置多个 AI 提供商
3. 创建自定义代理
4. 集成 MCP 服务器
5. 配置 GitLab/GitHub 集成
6. 使用 TUI/Web/Desktop 界面

---

### skill-development

**什么时候用：**
- 用户询问 "create a skill"、"add a skill to plugin"
- 创建新技能或优化现有技能
- 组织技能内容
- 学习技能开发最佳实践
- 理解渐进式披露原则

**核心触发词：**
`create a skill`, `write a new skill`, `improve skill description`, `organize skill content`, `skill structure`, `progressive disclosure`

**典型使用场景：**
1. 为 Claude Code 插件创建新技能
2. 优化技能的 trigger 描述
3. 组织技能的 SKILL.md、references/、examples/
4. 应用渐进式披露原则
5. 验证技能质量

---

## 📱 uniapp 相关技能

### uniapp

**什么时候用：**
- 用户询问 "develop with uni-app"、"build cross-platform app"
- 使用 Vue.js 开发跨平台应用
- 创建 uni-app 项目
- 使用 uni-app 组件或 API
- 开发微信小程序或其他小程序
- 编译到 iOS/Android/HarmonyOS

**核心触发词：**
`uniapp`, `uni-app`, `cross-platform app`, `vue.js mobile`, `weChat mini program`, `compile to iOS Android`

**典型使用场景：**
1. 创建 uni-app 项目
2. 使用 uni-ui 组件库
3. 实现 uni-app API（uni.request、uni.navigateTo 等）
4. 配置多平台编译
5. 开发小程序功能

---

### unicloud

**什么时候用：**
- 用户询问 "develop with uniCloud"、"use uniCloud cloud functions"
- 使用 DCloud Serverless 云开发平台
- 开发云函数、云数据库、云存储
- 使用 clientDB
- 实现 uni-id 用户认证
- 配置 uni-pay 支付

**核心触发词：**
`unicloud`, `uniCloud cloud functions`, `uniCloud database`, `uniCloud storage`, `clientdb`, `uni-id`, `uni-pay`

**典型使用场景：**
1. 创建云函数
2. 配置云数据库（schema2code）
3. 使用云存储上传文件
4. 实现 clientDB 前端操作数据库
5. 集成 uni-id 用户系统
6. 配置 uni-pay 支付功能

---

### hbuilderx

**什么时候用：**
- 用户询问 "use HBuilderX"、"develop with HBuilderX"
- 使用 HBuilderX IDE
- 开发 HBuilderX 插件
- 使用 HBuilderX API
- 配置多端开发环境
- 编写 Markdown

**核心触发词：**
`hbuilderx`, `HBuilderX ide`, `HBuilderX plugin development`, `HBuilderX API`, `vue ide`

**典型使用场景：**
1. 安装和配置 HBuilderX
2. 开发 HBuilderX 插件（package.json、extension.js）
3. 使用 HBuilderX API（hx.commands、hx.window 等）
4. 运行项目到手机或模拟器
5. 配置多端编译（App、H5、小程序）

---

### uniapp-best-practices

**什么时候用：**
- 用户询问 "UniApp best practices"、"UniApp 开发规范"
- 需要了解跨平台开发最佳实践
- 优化 UniApp 应用性能
- 处理平台差异（H5、小程序、App）
- 使用 TypeScript 开发 UniApp
- 配置分包加载
- 实现状态管理（Pinia）
- 处理页面生命周期
- 优化长列表和图片

**核心触发词：**
`uniapp best practices`, `uni-app 开发规范`, `cross-platform guidelines`, `uniapp 性能优化`, `uniapp typescript`, `条件编译`, `分包加载`, `pinia uniapp`

**典型使用场景：**
1. 新建 UniApp 项目时参考规范
2. 处理 H5/小程序/App 平台差异
3. 优化应用性能（分包、长列表、图片）
4. 使用 TypeScript 类型定义
5. 配置 Pinia 状态管理
6. 正确使用页面/组件生命周期
7. 编写可维护的样式代码

---

## 技能选择决策树

```
用户需求
├── AI 编码代理相关？
│   ├── Claude Code 官方？ → claude-code
│   ├── 开源替代方案？ → opencode
│   ├── SuperClaude 集成？ → superclaude-invoker
│   └── BMAD 方法论？ → bmad-method
├── 跨平台开发？
│   ├── Vue.js 框架？
│   │   ├── 项目创建/API → uniapp
│   │   └── 最佳实践/规范 → uniapp-best-practices
│   ├── 云开发？ → unicloud
│   └── IDE 工具？ → hbuilderx
└── 技能开发？
    └── 创建/优化技能 → skill-development
```

---

## 技能组合使用场景

### 场景 1：完整的 uni-app 开发环境
**组合技能：** `hbuilderx` + `uniapp` + `unicloud`

**使用场景：** 从零开始开发一个完整的跨平台应用，包括前端和云服务

### 场景 2：AI 编码代理选型
**组合技能：** `claude-code` + `opencode` + `superclaude-invoker`

**使用场景：** 评估和选择合适的 AI 编码代理，并集成到开发工作流中

### 场景 3：技能开发流程
**组合技能：** `skill-development` + `claude-code`/`opencode`

**使用场景：** 为 AI 编码代理创建自定义技能，扩展其功能

---

## 附录：技能触发短语速查表

| 技能 | 主要触发短语 |
|------|-------------|
| claude-code | claude code cli, mcp, skills, agents, ide |
| superclaude-invoker | invoke superclaude, route commands, bmad integration |
| bmad-method | bmad method, agile ai driven, scale adaptive |
| opencode | opencode, providers, mcp servers, custom agents |
| skill-development | create skill, skill structure, progressive disclosure |
| uniapp | uniapp, cross-platform, vue mobile, mini program |
| uniapp-best-practices | uniapp best practices, 开发规范, 性能优化, 条件编译 |
| unicloud | unicloud, cloud functions, cloud database, uni-id |
| hbuilderx | hbuilderx, plugin development, vue ide |

---

**文档版本：** v1.0.0
**最后更新：** 2026-01-23

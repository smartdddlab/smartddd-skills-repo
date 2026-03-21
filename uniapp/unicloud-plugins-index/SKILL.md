---
name: unicloud-plugins-index
description: This skill should be used when the user asks to "find a uniCloud plugin", "search for DCloud plugins", or "recommend a uni-app plugin". Provides an indexed catalog of 16 core plugins from the DCloud marketplace, helping developers discover and select the right plugins for uni-app/uniCloud development.
version: 1.1.0
author: SmartDDDLab
license: MIT
tags: [uniapp, unicloud, dcloud, plugins, marketplace, discovery]
requirements:
  - Basic understanding of uniCloud development
  - Familiarity with uni-app framework
  - HBuilderX IDE installed (optional, for plugin installation)
---

# unicloud-plugins-index

DCloud 插件市场核心插件索引，帮助开发者快速发现和选择适合项目需求的 uniCloud 和 uni-app 插件。

## 使用场景

使用此技能的场景包括：

- 查找特定功能的 uniCloud 插件
- 搜索适合项目的 UI 组件库
- 了解 uni-id 身份认证系统组件
- 发现后台管理、支付、推送等核心功能插件
- 对比不同插件的特性和下载量

## 核心插件索引

本索引包含 **16 个核心插件**，分为两大类：

### uniCloud 核心插件 (10个)

提供云端能力的核心模块：
- **身份认证** (uni-id 系列): uni-id-common、uni-id-co、uni-id-pages、uni-config-center、uni-captcha
- **后台管理**: uni-admin
- **核心服务**: uni-pay (支付)、uni-sms (短信)、uni-email (邮件)、uni-push (推送)

### UI 组件库 (6个)

流行的 uni-app UI 组件库：
- **uView UI** / **uView Plus** (支持 Vue2/Vue3)
- **ThorUI** / **FirstUI** (轻量级/高性能)
- **图鸟 UI** / **ultraUI** (现代化设计)

📋 **详细插件列表和特性对比：**
参见 [插件分类说明](references/plugin-categories.md)

📊 **完整插件数据：**
参见 [plugins-index.json](assets/plugins-index.json)

---

## 快速开始

## 快速开始

### 搜索插件

```
用户: 我需要一个支付插件
助手: 推荐 uni-pay，它是 uniCloud 官方提供的统一支付解决方案...
```

### 获取插件详情

```
用户: uni-admin 有什么功能？
助手: uni-admin 是基于 uni-app 和 uniCloud 的后台管理框架，主要功能包括：
      - 开箱即用的后台管理模板
      - 用户、角色、权限管理
      - 注册用户统计报表
      - 丰富的插件扩展生态
```

### 对比插件

```
用户: uView UI 和 uView Plus 有什么区别？
助手: uView UI 支持 Vue2，而 uView Plus 是升级版，支持 Vue3、鸿蒙 Next 和 uni-app x...
```

## 插件数据来源

本索引的插件数据来自：

1. **DCloud 官方文档** - https://doc.dcloud.net.cn/
2. **DCloud 插件市场** - https://ext.dcloud.net.cn/
3. **插件官网** - 各 UI 组件库的官方网站
4. **Web 搜索** - 补充插件的最新信息

## 数据格式

插件索引以 JSON 格式存储在 `assets/plugins-index.json`，包含：

```json
{
  "id": "plugin-id",
  "displayName": "插件显示名称",
  "description": "插件描述",
  "features": ["功能列表"],
  "platforms": ["支持平台"],
  "downloads": 下载量,
  "stars": 评分,
  "documentation": "文档链接",
  "marketplace": "插件市场链接",
  "quickStart": "快速开始代码"
}
```

## 使用方法

### 查找插件

1. 明确需求（如：支付、UI组件、后台管理）
2. 查看对应分类的插件列表
3. 对比插件的 features、downloads、stars
4. 阅读官方文档和快速开始指南
5. 从 HBuilderX 插件市场导入或使用 npm 安装

### 推荐流程

1. 分析用户的具体需求
2. 从索引中筛选符合条件的插件
3. 提供 2-3 个选项并说明优缺点
4. 推荐最适合的插件
5. 提供快速开始指导

## 参考资源

- [插件分类说明](references/plugin-categories.md)
- [使用指南](references/usage-guide.md)
- [数据抓取方法论](references/scraping-methodology.md)

## 示例

- [搜索插件示例](examples/search-plugin.md)
- [安装插件示例](examples/install-plugin.md)

## 数据更新

插件索引会定期更新以保持数据的准确性和时效性。更新方法：

```bash
# 运行抓取脚本
cd scripts
bash scrape-plugins.sh

# 或手动更新 JSON 文件
# 编辑 assets/plugins-index.json
```

## 限制说明

- 本索引仅包含 **16 个核心插件**，不代表 DCloud 插件市场的全部 18,948+ 个插件
- 下载量和评分数据可能不是最新的
- 插件版本信息以插件市场和官方文档为准

## 扩展计划

未来计划添加：

- 数据可视化组件（qiun-data-charts、lime-echart、mp-html）
- UTS 插件（Lux-Sqlite、dh-choose-file 等）
- 通用组件（电子签名、水印相机等）
- 项目模板（uni-starter、uni-cms 等）

## 反馈与贡献

如果发现插件信息有误或有新的插件推荐，请：

1. 在项目中提交 Issue
2. 或直接更新 `assets/plugins-index.json` 文件
3. 提供准确的数据来源链接

---

**相关技能:**
- `uniapp` - uni-app 开发指南
- `unicloud` - uniCloud 云开发指南
- `hbuilderx` - HBuilderX IDE 使用指南

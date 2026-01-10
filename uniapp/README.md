# uniapp 技能目录

本目录包含 uni-app 相关的 AI 编码代理技能。

## 📦 包含技能

| 技能 | 版本 | 描述 |
|------|------|------|
| [uniapp](./uniapp/) | v1.0.0 | 使用 Vue.js 开发所有前端应用的框架，支持 iOS、Android、鸿蒙Next、Web 及各种小程序 |
| [unicloud](./unicloud/) | v1.0.0 | DCloud 联合阿里云、腾讯云、支付宝云提供的 Serverless 云开发平台 |

## 🚀 快速开始

### 安装技能

```bash
# 安装所有 uniapp 相关技能
openskills install smartdddlab/smartddd-skills-repo/uniapp
```

## 🔄 快速更新技能

本仓库的技能通过 **Skill_Seekers** 工具自动生成和更新。配置文件 `*.json` 存储在本目录中，用于控制抓取行为。

### 安装 Skill_Seekers

**前置条件：** 从官网安装 Skill_Seekers

```bash
# 使用官网安装方式（参考 Skill_Seekers 官方文档）
# 安装后确保 skill_seekers 命令可用
skill_seekers --version
```

### 使用配置文件更新技能

**基于本目录的配置文件生成技能：**

```bash
# 设置工作目录
REPO_ROOT=/path/to/smartddd-skills-repo  # 替换为实际路径

# 更新 uniapp 技能（使用本目录的 uniapp.json）
skill_seekers scrape $REPO_ROOT/uniapp/uniapp.json

# 解压到目标目录
unzip -q -o uniapp.zip -d $REPO_ROOT/uniapp/uniapp/

# 更新 uniCloud 技能（使用本目录的 unicloud.json）
skill_seekers scrape $REPO_ROOT/uniapp/unicloud.json

# 解压到目标目录
unzip -q -o unicloud.zip -d $REPO_ROOT/uniapp/unicloud/
```

### 配置文件说明

本目录包含以下配置文件：

| 文件 | 用途 |
|------|------|
| `uniapp.json` | uniapp 技能抓取配置 |
| `unicloud.json` | uniCloud 技能抓取配置 |

配置文件关键字段：

| 字段 | 说明 |
|------|------|
| `name` | 技能名称 |
| `description` | 技能描述 |
| `base_url` | 官方文档基础 URL |
| `start_urls` | 抓取起始 URL 列表 |
| `max_pages` | 最大抓取页面数 |
| `categories` | 内容分类映射 |

### 批量更新脚本

```bash
#!/bin/bash
# update-uniapp-skills.sh - 批量更新 uniapp 相关技能

REPO_ROOT="/path/to/smartddd-skills-repo"  # 替换为实际路径
cd "$REPO_ROOT/uniapp"

# 批量抓取
for config in *.json; do
  echo "正在使用配置: $config"
  skill_seekers scrape "$config"
done

# 批量解压
for zipfile in ../*.zip; do
  name=$(basename "$zipfile" .zip)
  echo "解压: $zipfile -> $name/"
  unzip -q -o "$zipfile" -d "$name/"
  rm "$zipfile"  # 清理 zip 文件
done

echo "更新完成！"
```

## 📚 技能详细说明

### uniapp

- **官方文档**: https://uniapp.dcloud.net.cn/
- **适用场景**: 跨平台应用开发（iOS、Android、Web、小程序）
- **主要内容**:
  - 教程 (tutorial.md)
  - 组件 (component.md)
  - API (api.md)
  - 配置 (collocation.md)
  - 插件 (plugin.md)
  - AI 专题 (ai.md)
  - 工程化 (worktile.md)
  - UTS (uts.md)

### uniCloud

- **官方文档**: https://doc.dcloud.net.cn/uniCloud/
- **适用场景**: Serverless 云开发、云函数、云数据库
- **主要内容**:
  - 快速入门 (getting_started.md)
  - 云函数 (cloud_functions.md)
  - 数据库 (database.md)
  - 云存储 (storage.md)
  - 用户认证 (authentication.md)
  - 支付 (payment.md)
  - 管理端 (admin.md)
  - 内容管理 (cms.md)
  - 安全 (security.md)

## 🛠️ 开发指南

### 手动更新流程

1. **编辑配置文件**（如需修改抓取范围）
2. **运行抓取工具**
3. **解压到目标目录**
4. **更新主 README.md**

### 验证技能

```bash
# 验证技能结构
skills-ref validate ./uniapp/uniapp
skills-ref validate ./uniapp/unicloud
```

## 📝 版本历史

| 日期 | 版本 | 变更内容 |
|------|------|----------|
| 2026-01-11 | 1.0.0 | 初始版本，添加 uniapp 和 uniCloud 技能 |

---

**uniapp 技能目录** - 为 uni-app 跨平台开发提供专业的 AI 编码支持 🚀

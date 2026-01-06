# CLAUDE.md

本文件为 Claude Code (claude.ai/code) 在此代码库中工作时提供指导。

communication language: Chinese
document_output language: Chinese

## 项目概述

这是一个 **OpenSkills 技能仓库** - 不是传统的软件项目。它包含使用 OpenSkills 生态系统的 AI 编码代理（Claude Code、Cursor、Windsurf、Aider）的技能定义。该仓库提供各种 AI 代理框架与 SuperClaude 命令之间的桥接功能。

## 本仓库规范

### 技能目录结构

```
smartddd-skills-repo/
├── {category}/           # 技能类别（例如："general"、"uniapp"、"dev-tools"）
│   └── {skill-name}/     # 技能目录（kebab-case：skill-name）
│       ├── SKILL.md      # 主技能定义文件（必须大写）
│       ├── references/   # 可选参考文档目录
│       ├── examples/     # 可选示例文件目录
│       └── scripts/      # 可选脚本目录
```

### SKILL.md 文件结构

每个技能必须包含 `SKILL.md` 文件，由两部分组成：

**1. YAML Frontmatter（元数据）**

| 字段 | 必填 | 约束 |
|------|------|------|
| `name` | 是 | 1-64字符，小写字母、数字、连字符，匹配目录名 |
| `description` | 是 | 1-1024字符，使用第三人称："This skill should be used when..." |
| `version` | 是 | 语义化版本号（MAJOR.MINOR.PATCH） |
| `author` | 否 | 作者名称 |
| `license` | 否 | 许可证名称 |
| `tags` | 否 | 标签数组 |
| `requirements` | 否 | 先决条件说明 |

**示例：**
```yaml
---
name: my-skill
description: This skill should be used when the user asks to "create X", "configure Y", or mentions specific triggers. Provides comprehensive guidance for the domain.
version: 1.0.0
author: SmartDDDLab
license: MIT
tags: [development, superclaude, bridge]
---
```

**2. Markdown Body（技能说明）**

- 使用 **祈使句/不定式形式**（动词开头），而非第二人称
- 核心概念、必备流程、常见用例放在主体中
- 详细内容移至 `references/` 目录
- 保持 1500-2000 字，理想不超过 3000 字

### 可选目录说明

- **references/** - 参考文档（详细模式、API 文档、迁移指南等）
- **examples/** - 可运行的示例文件
- **scripts/** - 可执行脚本（用于验证、测试等）

### 渐进式披露原则

技能使用三级加载系统管理上下文：

1. **元数据**（~100 tokens）：启动时加载（name + description）
2. **SKILL.md 主体**：技能触发时加载（<5000 tokens 推荐）
3. **Bundled Resources**：按需加载（references、examples、scripts）

### 命名规范

- 目录名：kebab-case（小写字母、数字、连字符）
- 文件名：SKILL.md（必须大写）
- 与目录名一致：`skills/my-skill/SKILL.md`

---

## 技能创建流程

### 使用 skill-development Skill

创建新技能时，使用 `skill-development` skill 指导整个过程：

```bash
# 激活 skill-development skill
/sc:spawn skill-development
```

### 技能创建六步法

**Step 1: 理解用例**
- 确定技能的触发短语和使用场景
- 收集具体示例，验证用户需求

**Step 2: 规划内容**
- 分析每个用例，识别可复用资源
- 确定需要 `scripts/`、`references/`、`assets/` 的内容

**Step 3: 创建结构**
```bash
mkdir -p skills/{category}/{skill-name}/{references,examples,scripts}
touch skills/{category}/{skill-name}/SKILL.md
```

**Step 4: 编辑 SKILL.md**
- 使用第三人称描述：`This skill should be used when...`
- 包含具体触发短语
- 使用祈使句写作

**Step 5: 验证和审核**

使用 skill-reviewer agent 进行质量检查：
```
Ask: "Review my skill and check if it follows best practices"
```

**验证清单：**
- [ ] SKILL.md 存在且有有效 YAML frontmatter
- [ ] Frontmatter 包含 `name`、`description`、`version`
- [ ] Description 使用第三人称，包含具体触发短语
- [ ] 主体使用祈使句形式
- [ ] SKILL.md 精简（1500-2000 字），详细内容移至 references/
- [ ] 引用的文件实际存在
- [ ] 示例完整可运行

**Step 6: 迭代优化**
- 在实际任务中测试技能
- 根据反馈改进 SKILL.md 或资源文件

---

## 技能审核流程

### skill-reviewer Agent

创建或修改技能后，使用 skill-reviewer agent 进行质量审核：

```bash
# 激活 skill-reviewer
/sc:spawn skill-reviewer
```

### 审核维度

| 维度 | 检查项 |
|------|--------|
| **结构** | 目录结构、文件命名、YAML frontmatter |
| **描述质量** | 第三人称、具体触发短语、场景描述 |
| **内容质量** | 祈使句、精简度、渐进式披露 |
| **资源完整性** | references/examples/scripts 存在且完整 |
| **最佳实践** | 遵循 OpenSkills 规范 |

### 验证命令

```bash
# 本地验证技能结构
skills-ref validate ./skills/{category}/{skill-name}
```

---

## 重要约束

### 1. 技能独立性原则

**每个 Skill 是独立的：**
- 不依赖其他技能的内部实现
- 引用其他技能时只通过公开接口
- 自包含的元数据和说明
- 可独立安装、使用和分发

### 2. 技能是路由器，不是执行器

superclaude-bridge 返回路由后的命令字符串，不执行它们。

### 3. 无传统测试

技能通过文档和使用模式验证，而非单元测试。

### 4. 文档优先

清晰、结构化的文档比代码复杂度更重要。

### 5. 向后兼容性

技能更新应保持与现有集成的兼容性。

---

## Git 注意事项

- `SuperClaude/` 目录当前未跟踪（git status 显示为未跟踪）
- `.gitignore` 排除：临时文件、编辑器文件、OpenSkills 缓存、本地文档
- 提交消息应引用技能名称和版本
- **每次技能变更后需同步更新 README.md**

---

## README.md 同步规则

**每次添加或删除技能后，必须更新 README.md：**

1. **添加新技能时：**
   - 在技能表格中添加对应行
   - 更新版本变更记录
   - 保持版本号与最新变更一致

2. **删除技能时：**
   - 从技能表格中移除对应行
   - 在变更记录中注明删除
   - 更新版本号（根据变更类型：MAJOR/MINOR/PATCH）

3. **更新现有技能时：**
   - 更新版本号
   - 在变更记录中添加新条目

**版本管理规范：**
- **MAJOR**：不兼容的接口变更
- **MINOR**：向后兼容的功能增加
- **PATCH**：向后兼容的错误修复

---

## 快速参考

### 创建新技能

```bash
# 1. 使用 skill-development 指导创建
/sc:spawn skill-development

# 2. 创建目录结构
mkdir -p skills/general/my-new-skill/{references,examples}

# 3. 创建 SKILL.md
touch skills/general/my-new-skill/SKILL.md

# 4. 编辑 SKILL.md（遵循规范）
# 使用 skill-development 的指导编写

# 5. 验证
skills-ref validate ./skills/general/my-new-skill

# 6. 审核
/sc:spawn skill-reviewer

# 7. 更新 README.md
# 添加技能到表格，更新变更记录
```

### 技能审核清单

- [ ] 结构符合 `skills/{category}/{skill-name}/SKILL.md`
- [ ] YAML frontmatter 包含 name、description、version
- [ ] Description 使用第三人称，包含触发短语
- [ ] 主体使用祈使句，不超过 3000 字
- [ ] 详细内容移至 references/
- [ ] 引用文件存在
- [ ] 渐进式披露正确应用
- [ ] README.md 已同步更新

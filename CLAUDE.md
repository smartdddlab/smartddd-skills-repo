# CLAUDE.md

本文件为 Claude Code (claude.ai/code) 在此代码库中工作时提供指导。

communication language: Chinese
document_output language: Chinese

## 项目概述

这是一个 **OpenSkills 技能仓库** - 不是传统的软件项目。它包含使用 OpenSkills 生态系统的 AI 编码代理（Claude Code、Cursor、Windsurf、Aider）的技能定义。该仓库提供各种 AI 代理框架与 SuperClaude 命令之间的桥接功能。

## 核心架构

### 技能结构
技能遵循严格的 YAML + XML 格式：
1. **YAML frontmatter**：包含元数据（名称、版本、作者、许可证、描述、标签、要求）
2. **XML 结构化内容**：在 `<skill>` 标签内包含使命、限制、路由表、输入/输出契约、标志支持和使用示例

### 目录组织
```
skills/
├── {category}/           # 技能类别（例如："general"、"uniapp"）
│   └── {skill-name}/     # 技能目录（kebab-case：skill-name）
│       ├── SKILL.md      # 主技能定义文件（必须大写）
│       ├── references/   # 可选参考文档目录
│       └── examples/     # 可选示例文件目录
```

### 关键技能

#### superclaude-bridge (v1.1)
- **目的**：极简命令路由器，将任意命令映射到 `/sc:*` SuperClaude 命令
- **核心功能**：零配置路由、直接命令映射、通用兼容性
- **支持的命令**：analyze、troubleshoot、research、explain、improve、design、build、document、test、git（10个核心命令）
- **扩展命令**：/sc:spawn、/sc:workflow、/sc:cleanup、/sc:estimate

#### SuperClaude (v1.0，未跟踪)
- **目的**：SuperClaude 框架的官方文档和最佳实践
- **包含内容**：`references/` 目录中的完整参考文档

## 开发工作流

### 创建新技能
1. 创建目录：`skills/{category}/{skill-name}/`
2. 创建带有 YAML frontmatter 的 `SKILL.md` 文件
3. 在 `<skill>` 标签内添加 XML 结构化内容
4. 包括：使命声明、限制、路由表、输入/输出契约、标志支持、使用示例
5. 更新 README.md 技能目录

### 技能质量标准
- **内容**：清晰的描述、完整的输入/输出契约、详细的错误处理、实用的示例
- **技术**：YAML+XML 格式合规性、SemVer 版本控制、有效的元数据
- **用户体验**：易于使用的接口、清晰的错误消息、完整的集成示例

### 版本管理
- 遵循 SemVer：MAJOR.MINOR（MAJOR 用于不兼容的变更，MINOR 用于兼容的添加）
- 在技能 frontmatter 和 README.md 中更新版本
- 在 README.md 中维护变更日志

## 集成模式

### superclaude-bridge 输入格式
```json
// 纯命令模式（推荐）
{
  "command": "analyze",
  "target": "./src",
  "options": "--pre --think"
}

// 自然语言模式
"「使用 superclaude-bridge 分析 ./src --pre」"

// 最短模式（默认 analyze）
"./src"
```

### 标志支持
桥接器将标志传递给 SuperClaude 命令：
- **分析标志**：`--think`、`--think-hard`、`--ultrathink`、`--brainstorm`
- **MCP 服务器标志**：`--c7` (Context7)、`--seq` (Sequential)、`--magic`、`--play` (Playwright)、`--morph` (Morphllm)、`--serena`
- **执行控制**：`--focus`、`--scope`、`--type`、`--perf`、`--safe`、`--validate`、`--loop`、`--delegate`

### 常用命令模式
- 质量改进：`improve ./src --type quality --safe`
- 性能优化：`improve ./src --type performance --focus perf`
- 安全扫描：`analyze ./src --focus security --seq`
- 深度分析：`analyze ./src --think-hard --all-mcp`

## 项目特定说明

### 无传统构建系统
此仓库没有：
- `package.json` 或 npm 脚本
- 传统测试套件（技能基于文档）
- 构建或编译步骤
- 代码编译的 CI/CD 流水线

### OpenSkills 依赖
技能通过以下方式安装：
```bash
npm i -g openskills
openskills install smartdddlab/smartddd-skills-repo
```

### 文档驱动开发
- 技能主要是 Markdown/XML 文档
- `docs/` 目录中的参考文档提供架构分析
- 侧重于清晰、结构化的文档而非可执行代码

## 使用此仓库的指导

### 添加/修改技能时
1. 严格遵循 YAML+XML 结构
2. 保持现有技能的向后兼容性
3. 更新 README.md 技能目录和版本信息
4. 包含实用的使用示例
5. 清晰地记录输入/输出契约

### 分析技能时
1. 读取技能的 YAML frontmatter 获取元数据
2. 检查 XML 结构了解功能
3. 检查输入/输出契约了解集成点
4. 查看使用示例了解实际实现

### Git 注意事项
- `SuperClaude/` 目录当前未跟踪（git status 显示为未跟踪）
- `.gitignore` 排除：临时文件、编辑器文件、OpenSkills 缓存、本地文档
- 提交消息应引用技能名称和版本

## 重要约束

1. **技能是路由器，不是执行器**：superclaude-bridge 返回路由后的命令字符串，不执行它们
2. **无传统测试**：技能通过文档和使用模式验证
3. **文档优先**：清晰、结构化的文档比代码复杂度更重要
4. **向后兼容性**：技能更新应保持与现有集成的兼容性


# SmartDDD Skills 仓库


## 快速使用
```
npm i -g openskills
openskills install  smartdddlab/smartddd-skills-repo
```

- **[openskills](https://github.com/numman-ali/openskills)**: OpenSkills brings Anthropic's skills system to all AI coding agents (Claude Code, Cursor, Windsurf, Aider).

## Skills 分类

### 通用 (工具类)

| Skill | 版本 | 状态 | 职责 |
|-------|------|------|------|
| [superclaude-enhancer](./superclaude-enhancer/) | 1.0 | active | SuperClaude 增强器 (Hook 机制) |
| [superclaude-bridge](./superclaude-bridge/) | 1.0 | active | SuperClaude 命令桥接器 (极简路由) |

### uniapp
| Skill | 版本 | 状态 | 职责 |
|-------|------|------|------|
|  |  |  |  |

## 开发规范

### 创建新 Skill

1. 在 `{类别}` 下创建目录`{SKILL-name}`
2. 创建 `SKILL.md` 文件 (大写)
3. 添加完整的 YAML frontmatter
4. 定义 XML 结构化的 Skill 内容
5. 更新本索引文件

### Skill 文件命名

- 目录名: `{skill}-{name}`
- 文件名: `SKILL.md` (大写) 


## 来源记录
| Skill | 来源 | 协议 |修改状态|
|-------|------|------|------|
| [superclaude-enhancer](./superclaude-enhancer/) | [AI_ad_spend02](https://github.com/wade56754/AI_ad_spend02.git) | - | 修订 |

### 版本管理

- 遵循 SemVer: MAJOR.MINOR
- MAJOR: 不兼容的接口变更
- MINOR: 向后兼容的功能增加

## 变更记录

| 日期 | 版本 | 变更内容 |
|------|------|----------|
| 2025-12-31 | 1.1.0 | 新增 superclaude-bridge (极简命令桥接器) |
| 2025-12-30 | 1.0.0 | 初始版本 |


# SmartDDD Skills 仓库


## 快速使用
```
npm i -g openskills
openskills install  smartdddlab/smartddd-skills-repo
```

- **[openskills](https://github.com/numman-ali/openskills)**: OpenSkills 将Anthropic 的技能系统引入所有 AI 编码代理（

## Skills 分类

### 通用 (工具类)

| Skill | 版本 | 状态 | 职责 |
|-------|------|------|------|
| [superclaude-enhancer](./superclaude-enhancer/) | 1.0 | active | SuperClaude 增强器 |

### uniapp 
| Skill | 版本 | 状态 | 职责 |
|-------|------|------|------|
| [superclaude-enhancer](./superclaude-enhancer/) | 1.0 | active | SuperClaude 增强器 |

## 开发规范

### 创建新 Skill

1. 在 `.claude/skills/` 下创建目录
2. 创建 `SKILL.md` 文件 (大写)
3. 添加完整的 YAML frontmatter
4. 定义 XML 结构化的 Skill 内容
5. 更新本索引文件

### Skill 文件命名

- 目录名: `ai-ad-{domain}-{function}`
- 文件名: `SKILL.md` (大写) 

### 版本管理

- 遵循 SemVer: MAJOR.MINOR
- MAJOR: 不兼容的接口变更
- MINOR: 向后兼容的功能增加

## 变更记录

| 日期 | 版本 | 变更内容 |
|------|------|----------|
| 2025-12-07 | 1.1 | 新增 ai-ad-flow-orchestrator，完善 /dev-flow 命令映射 |
| 2025-12-07 | 1.0 | 初始版本，完成从 Python Agent 到纯 Skill 架构迁移 |

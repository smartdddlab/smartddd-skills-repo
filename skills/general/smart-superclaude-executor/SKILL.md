---
name: smart-superclaude-executor
author: "SmartDDD Team"
license: "MIT"
last_reviewed: "2025-01-06"
description: "智能 SuperClaude 命令执行器，支持在 BMAD、spec-kit 等工具中动态调用并执行 SuperClaude 命令，增强代码开发、问题分析、测试执行和 Git 操作能力"
tags:
  - executor
  - superclaude
  - command
  - dynamic
  - bmad
  - spec-kit
  - development
  - analysis
  - testing
  - git
requirements:
  - "SuperClaude Framework (v4.x+)"
  - "BMAD Agent 或 spec-kit 环境（可选）"
  - "支持 Claude Code CLI 环境"
version: 1.0.0
---

<skill>
═══════════════════════════════════════════════════════════════════════════
  Smart SuperClaude Executor - 智能命令执行器
═══════════════════════════════════════════════════════════════════════════

  <name>smart-superclaude-executor</name>
  <version>1.0.0</version>
  <domain>Command Execution / SuperClaude Integration</domain>
  <profile>Dynamic-Execution / Context-Aware / Multi-Purpose</profile>


  <!-- ======================================================
       1. 核心使命 (Mission)
  ====================================================== -->
  <mission>
    作为 BMAD、spec-kit 和其他 AI 编程工具的 SuperClaude 命令执行引擎，
    提供完整的命令路由、参数解析、结果处理能力，让外部工具能够：
    1. 动态调用任意 SuperClaude 命令
    2. 传递复杂参数和标志
    3. 获取结构化的执行结果
    4. 实现代码开发、问题分析、测试执行、Git 提交等场景的深度集成

    核心原则：
    - 智能路由：自动解析命令意图，选择最优 SuperClaude 命令
    - 完整执行：不仅路由，还负责命令的执行和结果处理
    - 上下文感知：支持项目上下文、环境变量、用户偏好
    - 结果导向：返回结构化结果，便于外部工具集成
  </mission>


  <!-- ======================================================
       2. 约束与限制 (Limitations)
  ====================================================== -->
  <limitations>
    **当前版本支持的能力域**（共 5 个核心场景）:

    | 场景 | 支持的命令 | 说明 |
    |------|-----------|------|
    | 代码开发 | implement, build, improve | 功能实现、项目构建、代码改进 |
    | 问题分析 | analyze, troubleshoot, explain | 代码分析、问题诊断、概念解释 |
    | 测试执行 | test | 单元测试、集成测试、E2E 测试 |
    | Git 操作 | git, save, load | 提交、暂存、会话管理 |
    | 设计规划 | design, workflow, estimate | 架构设计、工作流生成、估算 |

    **说明**:
    - 这是 SuperClaude 命令的 **执行器**，不是简单路由器
    - 需要 SuperClaude 环境支持（Claude Code CLI）
    - 交互式命令（如 spawn 会话）可能需要特殊处理
    - 部分命令需要 MCP 服务器支持
  </limitations>


  <!-- ======================================================
       3. 能力场景矩阵 (Capability Matrix)
  ====================================================== -->
  <capability_matrix>
    ## 3.1 代码开发场景

    | 能力 | 对应命令 | 典型用例 |
    |------|---------|---------|
    | 功能实现 | /sc:implement | 添加新功能、创建组件、实现 API |
    | 项目构建 | /sc:build | 编译、打包、构建项目 |
    | 代码改进 | /sc:improve | 重构、优化、修复代码 |
    | 代码清理 | /sc:cleanup | 删除死代码、清理项目 |

    ## 3.2 问题分析场景

    | 能力 | 对应命令 | 典型用例 |
    |------|---------|---------|
    | 代码分析 | /sc:analyze | 质量分析、安全扫描、性能评估 |
    | 问题诊断 | /sc:troubleshoot | 调试、修复错误、定位根因 |
    | 概念解释 | /sc:explain | 解释代码逻辑、学习新技术 |

    ## 3.3 测试执行场景

    | 能力 | 对应命令 | 典型用例 |
    |------|---------|---------|
    | 测试运行 | /sc:test | 运行单元测试、生成测试报告 |
    | 测试策略 | /sc:test --type strategy | 设计测试策略 |
    | 覆盖率分析 | /sc:test --coverage | 分析测试覆盖率 |

    ## 3.4 Git 操作场景

    | 能力 | 对应命令 | 典型用例 |
    |------|---------|---------|
    | Git 辅助 | /sc:git | 智能提交、合并解决、分支管理 |
    | 会话保存 | /sc:save | 保存工作进度、会话状态 |
    | 上下文加载 | /sc:load | 加载项目上下文、历史会话 |

    ## 3.5 设计规划场景

    | 能力 | 对应命令 | 典型用例 |
    |------|---------|---------|
    | 架构设计 | /sc:design | 系统设计、API 设计、组件设计 |
    | 工作流生成 | /sc:workflow | 从 PRD 生成实现工作流 |
    | 开发估算 | /sc:estimate | 任务估算、工时估算 |
  </capability_matrix>


  <!-- ======================================================
       4. 命令路由表 (Command Routing)
  ====================================================== -->
  <routing_table>
    **智能路由映射**：

    | 输入指令 | 执行的命令 | 场景 | 优先级 |
    |----------|-----------|------|--------|
    | implement | /sc:implement | 开发 | P0 |
    | build | /sc:build | 开发 | P0 |
    | improve | /sc:improve | 开发 | P0 |
    | cleanup | /sc:cleanup | 开发 | P1 |
    | analyze | /sc:analyze | 分析 | P0 |
    | troubleshoot | /sc:troubleshoot | 分析 | P0 |
    | explain | /sc:explain | 分析 | P1 |
    | test | /sc:test | 测试 | P0 |
    | git commit | /sc:git commit | Git | P0 |
    | git status | /sc:git status | Git | P0 |
    | git push | /sc:git push | Git | P1 |
    | save | /sc:save | 会话 | P1 |
    | load | /sc:load | 会话 | P1 |
    | design | /sc:design | 设计 | P0 |
    | workflow | /sc:workflow | 规划 | P1 |
    | estimate | /sc:estimate | 规划 | P1 |

    **智能推断规则**:
    - "写代码" → implement
    - "编译" → build
    - "优化性能" → improve --perf
    - "分析代码" → analyze
    - "找 bug" → troubleshoot
    - "运行测试" → test
    - "提交代码" → git commit
    - "保存" → save
    - "设计架构" → design
  </routing_table>


  <!-- ======================================================
       5. 输入契约 (Input Contract)
  ====================================================== -->
  <input_contract>
    支持多种输入格式，适配不同集成场景：

    ## 5.1 结构化输入（推荐）

    ```json
    {
      "action": "analyze",
      "target": "./src",
      "options": {
        "scope": "project",
        "focus": "quality",
        "flags": ["--think", "--validate"]
      },
      "context": {
        "project_root": "/path/to/project",
        "env": "development"
      }
    }
    ```

    ## 5.2 简化输入

    ```json
    {
      "command": "analyze ./src --think"
    }
    ```

    ## 5.3 自然语言输入

    「分析 ./src 目录的代码质量，使用深度思考模式」

    ## 5.4 BMAD menu 格式

    ```
    使用 smart-superclaude-executor，action=analyze，target={{selection}}
    ```

    ## 5.5 spec-kit 格式

    ```markdown
    # 分析代码
    使用 smart-superclaude-executor
    action=analyze
    target=./src
    options=--think --scope project
    ```

    ## 5.6 字段说明

    | 字段 | 类型 | 必填 | 说明 |
    |------|------|------|------|
    | action | string | 是 | 命令类型（见路由表） |
    | target | string | 否 | 目标文件/目录/主题 |
    | options | object/string | 否 | 参数选项 |
    | context | object | 否 | 执行上下文 |
    | command | string | 否 | 直接命令字符串 |
  </input_contract>


  <!-- ======================================================
       6. 输出契约 (Output Contract)
  ====================================================== -->
  <output_contract>
    **标准成功响应**:
    ```json
    {
      "success": true,
      "executed_command": "/sc:analyze ./src --think --scope project",
      "action": "analyze",
      "result": {
        "summary": "分析完成，发现 3 个问题",
        "findings": [...],
        "recommendations": [...]
      },
      "metadata": {
        "duration": "2m 30s",
        "files_analyzed": 45,
        "issues_found": 3,
        "severity_breakdown": {"critical": 0, "high": 1, "medium": 2}
      },
      "error": null,
      "timestamp": "2025-01-06T10:00:00Z"
    }
    ```

    **标准失败响应**:
    ```json
    {
      "success": false,
      "executed_command": null,
      "action": "unknown",
      "result": null,
      "metadata": null,
      "error": "Unknown action: deploy",
      "error_code": "INVALID_ACTION",
      "suggestion": "支持的 action 包括: analyze, implement, build, improve, test, git, design",
      "timestamp": "2025-01-06T10:00:00Z"
    }
    ```

    **按场景的 result 结构**:

    | 场景 | result 包含 |
    |------|------------|
    | analyze | summary, findings[], recommendations[] |
    | implement | summary, files_created[], files_modified[] |
    | build | summary, artifacts[], build_time, status |
    | improve | summary, changes[], issues_fixed[] |
    | test | summary, passed, failed, coverage |
    | git | summary, changes[], commit_hash |
    | design | summary, architecture[], diagrams[] |

    **元数据说明**:
    | 字段 | 说明 |
    |------|------|
    | duration | 执行耗时 |
    | files_affected | 影响的文件数 |
    | issues_found | 发现的问题数 |
    | severity_breakdown | 按严重程度分类的问题数 |
  </output_contract>


  <!-- ======================================================
       7. 标志与参数系统 (Flags & Parameters)
  ====================================================== -->
  <flags>
    Executor 支持完整的 SuperClaude 标志系统：

    ## 7.1 分析深度标志

    | 标志 | 使用场景 | 令牌预算 |
    |------|---------|---------|
    | `--think` | 5+ 文件或复杂分析 | ~4K |
    | `--think-hard` | 架构分析、系统设计 | ~10K |
    | `--ultrathink` | 关键系统、复杂问题 | ~32K |
    | `--brainstorm` | 模糊需求、探索模式 | 自适应 |

    ## 7.2 MCP 服务器标志

    | 标志 | 服务器 | 用途 |
    |------|-------|------|
    | `--c7` / `--context7` | Context7 | 官方文档查询 |
    | `--seq` | Sequential | 复杂推理 |
    | `--magic` | Magic | UI 组件生成 |
    | `--play` | Playwright | 浏览器测试 |
    | `--morph` | Morphllm | 批量编辑 |
    | `--serena` | Serena | 符号操作 |
    | `--all-mcp` | 全部 | 全部启用 |
    | `--no-mcp` | 无 | 全部禁用 |

    ## 7.3 执行控制标志

    | 标志 | 目的 | 示例 |
    |------|------|------|
    | `--focus` | 专注领域 | `--focus security` |
    | `--scope` | 分析范围 | `--scope project` |
    | `--type` | 操作类型 | `--type quality` |
    | `--safe` | 安全模式 | `--safe` |
    | `--validate` | 执行验证 | `--validate` |
    | `--loop` | 迭代模式 | `--loop` |
    | `--delegate` | 委托模式 | `--delegate` |
    | `--uc` | 令牌压缩 | `--uc` |

    ## 7.4 场景专用标志

    | 场景 | 常用标志组合 |
    |------|-------------|
    | 完整代码审查 | `--think-hard --focus quality --validate` |
    | 安全扫描 | `--seq --focus security --all-mcp` |
    | 性能优化 | `--think --focus performance --perf` |
    | 快速构建 | `--scope file --no-mcp` |
    | 迭代改进 | `--loop --safe --validate` |
    | Git 智能提交 | `--smart-commit --validate` |

    ## 7.5 标志传递规则

    1. 标志附加到目标之后
    2. 多个标志可以用空格分隔
    3. 复杂选项建议使用对象格式
  </flags>


  <!-- ======================================================
       8. 使用场景示例 (Usage Examples)
  ====================================================== -->
  <usage>
    ## 8.1 基础使用

    **命令格式**:
    ```
    使用 smart-superclaude-executor，action=analyze，target=./src
    ```

    **自然语言**:
    「分析 ./src 目录的代码质量」

    **JSON 格式**:
    ```json
    {
      "action": "analyze",
      "target": "./src",
      "options": {"scope": "project", "focus": "quality"}
    }
    ```

    ## 8.2 代码开发场景

    ```markdown
    # 实现新功能
    使用 smart-superclaude-executor
    action=implement
    target=./src/auth
    options=--type feature --framework react

    # 构建项目
    使用 smart-superclaude-executor
    action=build
    target=.
    options=--production

    # 改进代码质量
    使用 smart-superclaude-executor
    action=improve
    target=./src/utils.ts
    options=--type quality --safe
    ```

    ## 8.3 问题分析场景

    ```markdown
    # 代码质量分析
    使用 smart-superclaude-executor
    action=analyze
    target=./src
    options=--think-hard --scope project

    # 安全漏洞扫描
    使用 smart-superclaude-executor
    action=analyze
    target=./src
    options=--focus security --seq --all-mcp

    # 调试问题
    使用 smart-superclaude-executor
    action=troubleshoot
    target=./error.log
    options=--think
    ```

    ## 8.4 测试执行场景

    ```markdown
    # 运行测试
    使用 smart-superclaude-executor
    action=test
    target=./src
    options=--type unit

    # 生成测试报告
    使用 smart-superclaude-executor
    action=test
    target=./tests
    options=--coverage --report

    # E2E 测试
    使用 smart-superclaude-executor
    action=test
    target=./e2e
    options=--type e2e --play
    ```

    ## 8.5 Git 操作场景

    ```markdown
    # 智能提交
    使用 smart-superclaude-executor
    action=git
    target=commit
    options=--smart-commit --validate

    # 查看状态
    使用 smart-superclaude-executor
    action=git
    target=status

    # 保存会话
    使用 smart-superclaude-executor
    action=save
    target=current_session
    ```

    ## 8.6 设计规划场景

    ```markdown
    # 架构设计
    使用 smart-superclaude-executor
    action=design
    target=./src
    options=--type architecture

    # 生成工作流
    使用 smart-superclaude-executor
    action=workflow
    target=./prd.md

    # 开发估算
    使用 smart-superclaude-executor
    action=estimate
    target=./feature.md
    ```
  </usage>


  <!-- ======================================================
       9. BMAD 集成配置
  ====================================================== -->
  <bmad_integration>
    ## 9.1 完整 Menu 配置

    ```yaml
    menu:
      # === 代码开发 ===
      - trigger: "实现功能" | "implement"
        exec: "使用 smart-superclaude-executor，action=implement，target={{selection}}"
        description: "实现选中的功能需求"

      - trigger: "构建项目" | "build"
        exec: "使用 smart-superclaude-executor，action=build，target=."
        description: "构建当前项目"

      - trigger: "改进代码" | "improve"
        exec: "使用 smart-superclaude-executor，action=improve，target={{selection}}"
        description: "改进代码质量和性能"

      - trigger: "清理代码" | "cleanup"
        exec: "使用 smart-superclaude-executor，action=cleanup，target={{selection}}"
        description: "删除死代码、优化项目"

      # === 问题分析 ===
      - trigger: "分析代码" | "analyze"
        exec: "使用 smart-superclaude-executor，action=analyze，target={{selection}}"
        description: "深度分析代码质量"

      - trigger: "诊断问题" | "troubleshoot" | "fix"
        exec: "使用 smart-superclaude-executor，action=troubleshoot，target={{error_file}}"
        description: "诊断并修复问题"

      - trigger: "解释代码" | "explain"
        exec: "使用 smart-superclaude-executor，action=explain，target={{selection}}"
        description: "解释代码逻辑"

      # === 测试执行 ===
      - trigger: "运行测试" | "test"
        exec: "使用 smart-superclaude-executor，action=test，target={{selection|.}}"
        description: "执行测试用例"

      - trigger: "测试覆盖率" | "coverage"
        exec: "使用 smart-superclaude-executor，action=test，target={{selection}} --coverage"
        description: "分析测试覆盖率"

      # === Git 操作 ===
      - trigger: "智能提交" | "smart-commit"
        exec: "使用 smart-superclaude-executor，action=git commit --smart-commit"
        description: "AI 辅助 Git 提交"

      - trigger: "查看状态" | "git-status"
        exec: "使用 smart-superclaude-executor，action=git status"
        description: "查看 Git 状态"

      - trigger: "保存进度" | "save"
        exec: "使用 smart-superclaude-executor，action=save"
        description: "保存当前工作进度"

      # === 设计规划 ===
      - trigger: "架构设计" | "design"
        exec: "使用 smart-superclaude-executor，action=design，target={{selection}}"
        description: "获取架构设计建议"

      - trigger: "生成工作流" | "workflow"
        exec: "使用 smart-superclaude-executor，action=workflow，target={{selection}}"
        description: "从 PRD 生成工作流"

      - trigger: "开发估算" | "estimate"
        exec: "使用 smart-superclaude-executor，action=estimate，target={{selection}}"
        description: "任务开发估算"
    ```

    ## 9.2 Workflow 配置示例

    ```yaml
    workflows:
      # 完整代码审查流程
      code_review:
        description: "端到端的代码审查流程"
        steps:
          - name: "分析代码质量"
            exec: "使用 smart-superclaude-executor，action=analyze，target={{selection}} --think-hard"
          - name: "生成改进建议"
            exec: "使用 smart-superclaude-executor，action=improve，target={{selection}} --quality"
          - name: "执行改进"
            exec: "使用 smart-superclaude-executor，action=improve，target={{selection}} --apply"

      # 问题诊断流程
      issue_diagnosis:
        description: "问题诊断与修复"
        steps:
          - name: "诊断根因"
            exec: "使用 smart-superclaude-executor，action=troubleshoot，target={{error_file}}"
          - name: "生成修复"
            exec: "使用 smart-superclaude-executor，action=improve，target={{error_file}}"

      # 新功能开发流程
      feature_development:
        description: "从需求到实现"
        steps:
          - name: "设计架构"
            exec: "使用 smart-superclaude-executor，action=design，target={{feature_file}}"
          - name: "实现功能"
            exec: "使用 smart-superclaude-executor，action=implement，target={{feature_file}}"
          - name: "运行测试"
            exec: "使用 smart-superclaude-executor，action=test，target=."

      # 智能提交流程
      smart_commit:
        description: "AI 辅助的 Git 提交"
        steps:
          - name: "查看变更"
            exec: "使用 smart-superclaude-executor，action=git status"
          - name: "智能提交"
            exec: "使用 smart-superclaude-executor，action=git commit --smart-commit"
    ```

    ## 9.3 变量占位符

    | 占位符 | 说明 | 示例 |
    |--------|------|------|
    | `{{selection}}` | 选中的代码 | 函数定义 |
    | `{{file_selection}}` | 当前文件 | `./src/App.tsx` |
    | `{{error_file}}` | 错误日志 | `./error.log` |
    | `{{feature_file}}` | 需求文件 | `./features/new.md` |
    | `.` | 当前目录 | 项目根目录 |
  </bmad_integration>


  <!-- ======================================================
       10. spec-kit 集成配置
  ====================================================== -->
  <spec_kit_integration>
    ## 10.1 commands 目录配置

    在 spec-kit 的 commands 目录添加：

    ```markdown
    # 智能 SuperClaude 执行器

    ## 代码开发
    ### 实现功能
    使用 smart-superclaude-executor
    action=implement
    target=./src
    options=--type feature

    ### 构建项目
    使用 smart-superclaude-executor
    action=build
    target=.
    options=--production

    ### 改进代码
    使用 smart-superclaude-executor
    action=improve
    target=./src
    options=--type quality

    ## 问题分析
    ### 代码分析
    使用 smart-superclaude-executor
    action=analyze
    target=./src
    options=--think-hard

    ### 问题诊断
    使用 smart-superclaude-executor
    action=troubleshoot
    target=./error.log

    ## 测试执行
    ### 运行测试
    使用 smart-superclaude-executor
    action=test
    target=./tests

    ## Git 操作
    ### 智能提交
    使用 smart-superclaude-executor
    action=git
    target=commit
    options=--smart-commit
    ```

    ## 10.2 AGENTS.md 集成

    ```markdown
    ## Smart SuperClaude Executor

    这是一个智能命令执行器，能够调用 SuperClaude 的完整命令集。

    ### 支持的能力

    | 能力 | 命令 | 说明 |
    |------|------|------|
    | 代码开发 | action=implement | 功能实现 |
    | 代码开发 | action=build | 项目构建 |
    | 代码开发 | action=improve | 代码改进 |
    | 问题分析 | action=analyze | 深度分析 |
    | 问题分析 | action=troubleshoot | 问题诊断 |
    | 测试执行 | action=test | 测试运行 |
    | Git 操作 | action=git | Git 工作流 |
    | 设计规划 | action=design | 架构设计 |

    ### 使用方式

    在 spec-kit 中直接调用：
    ```
    使用 smart-superclaude-executor，action=analyze，target=./src
    ```
    ```
    使用 smart-superclaude-executor
    action=implement
    target=./src/auth
    options=--type feature
    ```
    ```
    使用 smart-superclaude-executor
    action=git
    target=commit
    options=--smart-commit
    ```
    ```
  </spec_kit_integration>


  <!-- ======================================================
       11. 高级配置
  ====================================================== -->
  <advanced_config>
    ## 11.1 默认行为配置

    ```yaml
    executor:
      # 默认分析深度
      default_depth: "think"

      # 默认是否启用 MCP
      default_mcp: "auto"  # auto, all, none

      # 超时时间（秒）
      timeout: 300

      # 重试次数
      retries: 1

      # 令牌预算
      token_budget: "auto"  # auto, or specific number
    ```

    ## 11.2 场景预设

    ```yaml
    presets:
      # 快速分析
      quick:
        depth: "think"
        mcp: "none"
        flags: ["--scope file"]

      # 完整分析
      comprehensive:
        depth: "ultrathink"
        mcp: "all"
        flags: ["--scope project", "--validate"]

      # 安全优先
      security:
        focus: "security"
        mcp: "seq"
        flags: ["--think-hard"]

      # 性能优先
      performance:
        focus: "performance"
        flags: ["--perf", "--scope module"]
    ```

    ## 11.3 错误处理策略

    ```yaml
    error_handling:
      # 超时策略
      timeout: "retry_once"

      # 失败策略
      on_failure: "return_detailed_error"

      # 回退命令
      fallback:
        - action: "analyze"
          target: "{{original_target}}"
          options: {"scope": "file"}
    ```
  </advanced_config>


  <!-- ======================================================
       12. 错误处理 (Error Handling)
  ====================================================== -->
  <error_handling>
    | 场景 | 处理方式 | 返回内容 |
    |------|----------|----------|
    | 无效 action | 返回错误建议 | error_code: "INVALID_ACTION", suggestion: "支持列表..." |
    | target 不存在 | 警告并尝试执行 | message: "Target not found" |
    | 命令执行超时 | 返回超时信息 | error_code: "TIMEOUT", duration: "xxx" |
    | SuperClaude 不可用 | 返回环境错误 | error_code: "ENV_NOT_AVAILABLE" |
    | 权限不足 | 返回权限错误 | error_code: "PERMISSION_DENIED" |
    | 执行成功 | 返回结果 | success: true, result: {...} |

    **错误代码参考**:
    | 代码 | 说明 | 处理建议 |
    |------|------|----------|
    | INVALID_ACTION | 无效的操作类型 | 检查 action 是否在支持列表中 |
    | TARGET_NOT_FOUND | 目标不存在 | 检查 target 路径是否正确 |
    | TIMEOUT | 执行超时 | 尝试减小范围或使用简单模式 |
    | ENV_NOT_AVAILABLE | SuperClaude 不可用 | 确保 Claude Code 已安装 |
    | PERMISSION_DENIED | 权限不足 | 检查文件/目录权限 |
    | MCP_UNAVAILABLE | MCP 服务器不可用 | 使用 --no-mcp 跳过 |
    | INTERNAL_ERROR | 内部错误 | 查看详细错误信息 |
  </error_handling>


  <!-- ======================================================
       13. 性能与优化
  ====================================================== -->
  <performance>
    **性能指标**:
    - 路由解析: < 50ms
    - 命令执行: 取决于 SuperClaude 命令
    - 结果处理: < 100ms

    **优化建议**:
    1. 使用简化输入格式减少解析时间
    2. 合理使用 `--scope` 限制分析范围
    3. 不需要 MCP 时使用 `--no-mcp`
    4. 大项目使用 `--delegate` 进行并行处理

    **资源使用**:
    - 内存: ~50MB（基础运行）
    - 令牌: 取决于命令复杂度和 `--think` 标志
  </performance>


  <!-- ======================================================
       14. 兼容性说明
  ====================================================== -->
  <compatibility>
    | 环境 | 状态 | 说明 |
    |------|------|------|
    | SuperClaude v4.x | ✅ 兼容 | 完整支持所有命令 |
    | BMAD Agent | ✅ 兼容 | menu trigger 集成 |
    | spec-kit | ✅ 兼容 | commands 调用 |
    | Claude Code CLI | ✅ 兼容 | 基础运行环境 |
    | OpenSkills | ✅ 兼容 | 标准 Skill 格式 |

    **依赖关系**:
    - 需要 SuperClaude 命令可用
    - 部分功能需要对应 MCP 服务器
    - Git 命令需要 git CLI 支持
  </compatibility>


  <!-- ======================================================
       15. 测试用例
  ====================================================== -->
  <testing>
    **功能测试**:

    | 测试项 | 输入 | 期望输出 |
    |------|------|----------|
    | 路由解析 | action=analyze | /sc:analyze |
    | 带参数路由 | action=improve --type quality | /sc:improve --type quality |
    | 自然语言 | "分析代码" | action=analyze |
    | 错误处理 | action=unknown | 错误响应 |

    **集成测试**:

    ```bash
    # 测试 BMAD 集成
    echo '使用 smart-superclaude-executor，action=analyze，target=./src' | <executor>

    # 预期输出
    # {"success":true,"executed_command":"/sc:analyze ./src",...}
    ```
  </testing>

</skill>

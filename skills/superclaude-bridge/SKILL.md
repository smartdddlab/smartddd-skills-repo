---
name: superclaude-bridge
author: "SmartDDD Team"
license: "MIT"
last_reviewed: "2025-12-31"
description: "极简的 SuperClaude 命令桥接器，通过参数路由让任何项目直接调用 /sc:* 命令"
tags:
  - bridge
  - routing
  - superclaude
  - command
  - bmad
  - spec-kit
requirements:
  - "SuperClaude Framework (任意版本)"
  - "BMAD Agent 或 spec-kit 环境（可选）"
version: 0.1.0
---

<skill>
═══════════════════════════════════════════════════════════════════
  SuperClaude Bridge - 极简命令桥接器
═══════════════════════════════════════════════════════════════════

  <name>superclaude-bridge</name>
  <version>1.1</version>
  <domain>Bridge / Command Routing</domain>
  <profile>Zero-Config / Direct-Routing / Universal</profile>


  <!-- ======================================================
       1. 核心使命 (Mission)
  ====================================================== -->
  <mission>
    作为 BMAD、spec-kit 和其他项目的超级简单入口，
    通过极简的参数路由，让任何项目都能直接调用 SuperClaude 命令。

    核心原则：
    - 零配置：接收参数 → 执行命令 → 返回结果
    - 直接路由：命令参数 → /sc:* 命令
    - 通用兼容：BMAD、spec-kit、通用项目都能用
  </mission>


  <!-- ======================================================
       2. 约束与限制 (Limitations)
  ====================================================== -->
  <limitations>
    **当前版本支持的核心命令**（共 10 个）:
    - analyze, troubleshoot, research, explain, improve
    - design, build, document, test, git

    **说明**:
    - 这是 SuperClaude 命令的 **路由器**，不是执行器
    - 返回路由后的命令字符串，由调用方负责执行
    - 完整命令列表请参考 `/sc:help`
  </limitations>


  <!-- ======================================================
       3. 错误处理 (Error Handling)
  ====================================================== -->
  <error_handling>
    | 场景 | 处理方式 | 返回字段 |
    |------|----------|----------|
    | 无效命令 | 返回错误信息 | error: "Unknown command: xxx" |
    | target 不存在 | warning 但返回路由结果 | message: "Target not found, command still routed" |
    | 参数解析失败 | 返回解析错误详情 | error: "Parse error: xxx" |
    | 成功路由 | 返回路由命令 | success: true, routed_command: "..." |

    **错误响应示例**:
    ```json
    {
      "success": false,
      "routed_command": null,
      "message": null,
      "error": "Unknown command: deploy",
      "timestamp": "2025-12-31T10:00:00Z"
    }
    ```
  </error_handling>


  <!-- ======================================================
       4. 命令路由表 (Command Routing) - 完整版
  ====================================================== -->
  <routing_table>
    | 输入命令 | 执行的 SuperClaude 命令 | 说明 |
    |----------|------------------------|------|
    | analyze | /sc:analyze | 代码质量分析 |
    | troubleshoot | /sc:troubleshoot | 问题诊断 |
    | research | /sc:research | 技术研究 |
    | explain | /sc:explain | 概念解释 |
    | improve | /sc:improve | 代码改进 |
    | design | /sc:design | 设计建议 |
    | build | /sc:build | 项目构建 |
    | document | /sc:document | 文档生成 |
    | test | /sc:test | 测试执行 |
    | git | /sc:git | Git 操作 |

    **扩展命令映射**（在 commands 中可直接使用完整 /sc:* 命令）:
    | 命令格式 | 说明 |
    |----------|------|
    | /sc:spawn [args] | 任务编排 |
    | /sc:workflow [args] | 工作流生成 |
    | /sc:cleanup [args] | 项目清理 |
    | /sc:estimate [args] | 开发估算 |
  </routing_table>


  <!-- ======================================================
       5. 输入契约 (Input Contract)
  ====================================================== -->
  <input_contract>
    极简输入格式（任选其一）:

    方式 1: 纯命令模式
    {
      command: "analyze",           // 必填：命令类型
      target: "./src",              // 可选：目标文件/目录
      options: "--pre"              // 可选：额外参数
    }

    方式 2: 自然语言模式
    「使用 superclaude-bridge 分析 ./src --pre」

    方式 3: 最短模式（默认 analyze）
    "./src"  // 默认执行 analyze
  </input_contract>


  <!-- ======================================================
       6. 输出契约 (Output Contract)
  ====================================================== -->
  <output_contract>
    **成功响应**:
    ```json
    {
      "success": true,
      "routed_command": "/sc:analyze ./src --pre",
      "message": "Successfully routed to /sc:analyze",
      "error": null,
      "timestamp": "2025-12-31T10:00:00Z"
    }
    ```

    **失败响应**:
    ```json
    {
      "success": false,
      "routed_command": null,
      "message": null,
      "error": "Unknown command: deploy",
      "timestamp": "2025-12-31T10:00:00Z"
    }
    ```

    **字段说明**:
    | 字段 | 类型 | 说明 |
    |------|------|------|
    | success | boolean | 路由是否成功 |
    | routed_command | string | 路由后的命令字符串 |
    | message | string | 执行信息或警告 |
    | error | string | null 表示无错误 |
    | timestamp | string | ISO 8601 时间戳 |

    **注意**: 这个 Skill 不直接执行命令，仅返回路由后的 /sc:* 命令字符串。
         实际执行由调用方负责。
    </output_contract>


  <!-- ======================================================
       7. 使用方式 (Usage)
  ====================================================== -->
  <usage>
    **方式 1: BMAD Agent 集成**
    在 agent.yaml 的 menu 中添加：
    ```yaml
    menu:
      - trigger: "分析"
        exec: "使用 superclaude-bridge，command=analyze，target={{cursor}}"
        description: "代码分析"

    **方式 2: spec-kit 命令调用**
    在 commands 中添加：
    ```markdown
    # 分析代码
    使用 superclaude-bridge，
    command=analyze，
    target=./src
    ```

    **方式 3: 自然语言调用**
    「使用 superclaude-bridge 分析 ./src 目录」
    → 路由到: /sc:analyze ./src

    **方式 4: 快捷调用**
    「Bridge analyze ./src --pre」
    → 路由到: /sc:analyze ./src --pre
  </usage>


  <!-- ======================================================
       8. BMAD 集成示例
  ====================================================== -->
  <bmad_integration>
    ## 8.1 完整 Menu 配置

    在 BMAD agent.yaml 的 menu 中添加：

    ```yaml
    menu:
      # === 分析诊断类 ===
      - trigger: "分析代码" | "analyze"
        exec: "使用 superclaude-bridge，command=analyze，target={{file_selection}}"
        description: "调用 SuperClaude 分析代码质量"

      - trigger: "诊断问题" | "troubleshoot" | "fix"
        exec: "使用 superclaude-bridge，command=troubleshoot，target={{error_file|selection}}"
        description: "诊断并修复代码问题"

      - trigger: "解释概念" | "explain"
        exec: "使用 superclaude-bridge，command=explain，target={{selection}}"
        description: "解释代码概念和逻辑"

      # === 改进优化类 ===
      - trigger: "改进代码" | "improve"
        exec: "使用 superclaude-bridge，command=improve，target={{file_selection}} --{{focus|quality}}"
        description: "改进代码质量和性能"

      - trigger: "优化性能" | "optimize"
        exec: "使用 superclaude-bridge，command=improve，target={{file_selection}} --perf"
        description: "性能优化分析"

      # === 设计与文档类 ===
      - trigger: "设计架构" | "design"
        exec: "使用 superclaude-bridge，command=design，target={{selection}}"
        description: "获取架构设计建议"

      - trigger: "生成文档" | "document"
        exec: "使用 superclaude-bridge，command=document，target={{file_selection}}"
        description: "生成代码文档"

      # === 研究与测试类 ===
      - trigger: "技术调研" | "research"
        exec: "使用 superclaude-bridge，command=research，target={{topic}}"
        description: "调研技术方案和最佳实践"

      - trigger: "运行测试" | "test"
        exec: "使用 superclaude-bridge，command=test，target={{file_selection|.}}"
        description: "执行测试用例"

      # === 版本控制类 ===
      - trigger: "Git 操作" | "git"
        exec: "使用 superclaude-bridge，command=git，target={{selection}} --{{operation|status}}"
        description: "Git 工作流辅助"
    ```

    ## 8.2 完整 Workflow 示例

    ```yaml
    workflows:
      # 代码质量检查流程
      code_review:
        description: "完整的代码审查工作流"
        steps:
          - name: "分析代码"
            exec: "使用 superclaude-bridge，command=analyze，target={{selection}}"
          - name: "改进问题"
            exec: "使用 superclaude-bridge，command=improve，target={{selection}} --quality"

      # 问题诊断流程
      issue_diagnosis:
        description: "问题诊断与修复工作流"
        steps:
          - name: "诊断根因"
            exec: "使用 superclaude-bridge，command=troubleshoot，target={{error_file}}"
          - name: "生成修复"
            exec: "使用 superclaude-bridge，command=improve，target={{error_file}}"
    ```

    ## 8.3 变量占位符说明

    | 占位符 | 说明 | 示例值 |
    |--------|------|--------|
    | `{{file_selection}}` | 当前选中的文件 | `./src/utils.ts` |
    | `{{selection}}` | 选中的文本/代码块 | 函数代码片段 |
    | `{{error_file}}` | 错误日志文件 | `./error.log` |
    | `{{topic}}` | 调研主题 | "React Server Components" |
    | `{{cursor}}` | 光标所在位置的文件 | `./src/App.tsx` |
    | `{{.}}` | 当前项目根目录 | `.` |

    ## 8.4 最佳实践

    **推荐配置原则**:

    1. **触发词简洁**: 使用中文+英文双触发，便于不同习惯的用户
    2. **描述清晰**: 说明调用后的具体行为
    3. **合理分组**: 按功能分类（分析/改进/文档/研究）
    4. **参数可选**: 使用 `--flag` 形式的可选参数增强灵活性

    **常见组合示例**:

    ```yaml
    # 快速质量检查
    - trigger: "质量检查" | "quality"
      exec: "使用 superclaude-bridge，command=improve，target={{selection}} --quality"
      description: "代码质量分析与改进"

    # 安全扫描
    - trigger: "安全扫描" | "security"
      exec: "使用 superclaude-bridge，command=analyze，target={{selection}} --focus security"
      description: "安全漏洞扫描"

    # 完整重构
    - trigger: "重构代码" | "refactor"
      exec: "使用 superclaude-bridge，command=improve，target={{selection}} --scope project"
      description: "项目级代码重构"
    ```

    **执行流程**:
    ```
    用户触发 menu → BMAD 解析 trigger → 调用 Bridge Skill → 返回 /sc:* 命令 → BMAD 执行命令
    ```
  </bmad_integration>


  <!-- ======================================================
       9. spec-kit 集成示例
  ====================================================== -->
  <spec_kit_integration>
    在 spec-kit commands 中添加：

    ```markdown
    # 分析规范实现
    使用 superclaude-bridge，
    command=analyze，
    target=./src

    # 改进代码质量
    使用 superclaude-bridge，
    command=improve，
    target=./src --quality
    ```

    或者在 AGENTS.md 中定义命令映射：
    ```markdown
    ## SuperClaude Bridge 命令映射

    | 命令 | 描述 | 调用方式 |
    |------|------|----------|
    | analyze | 代码质量分析 | 使用 superclaude-bridge，command=analyze |
    | improve | 代码改进 | 使用 superclaude-bridge，command=improve |
    | troubleshoot | 问题诊断 | 使用 superclaude-bridge，command=troubleshoot |
    | research | 技术调研 | 使用 superclaude-bridge，command=research |
    ```
  </spec_kit_integration>


  <!-- ======================================================
       10. 为什么这个方案简单
  ====================================================== -->
  <why_simple>
    | 方面 | 复杂方案 (Hook) | 简单方案 (Bridge) |
    |------|----------------|------------------|
    | 配置复杂度 | 高 (XML/YAML 多层) | 极低 (单一 Skill) |
    | 学习成本 | 高 | 低 |
    | 集成方式 | 需要修改项目配置 | 直接调用 Skill |
    | 维护成本 | 高 | 低 |
    | 灵活性 | 高 | 中（够用） |
    | 依赖 | 需要 SuperClaude Enhancer | 只需要 Bridge |

    **核心优势**:
    1. 不需要理解 Hook 机制
    2. 不需要修改项目配置文件
    3. 只需要知道 "使用 superclaude-bridge"
    4. 自动路由到正确的 /sc:* 命令
  </why_simple>


  <!-- ======================================================
       11. 测试指南 (Testing)
  ====================================================== -->
  <testing>
    **路由正确性测试**:

    | 输入 | 期望输出 | 状态 |
    |------|----------|------|
    | `{ "command": "analyze", "target": "./src" }` | `/sc:analyze ./src` | ✅ |
    | `{ "command": "troubleshoot", "target": "error.log" }` | `/sc:troubleshoot error.log` | ✅ |
    | `{ "command": "unknown", "target": "./test" }` | 错误响应 | ✅ |

    **集成测试**:

    ```bash
    # 测试 BMAD 集成
    echo '使用 superclaude-bridge，command=analyze，target=./src' | <bridge-executor>

    # 预期输出
    # {"success":true,"routed_command":"/sc:analyze ./src",...}
    ```
  </testing>


  <!-- ======================================================
       12. 兼容性说明 (Compatibility)
  ====================================================== -->
  <compatibility>
    | 环境 | 状态 | 说明 |
    |------|------|------|
    | SuperClaude v3.x | ✅ 兼容 | 完整支持所有命令 |
    | SuperClaude v2.x | ✅ 兼容 | 完整支持所有命令 |
    | BMAD Agent | ✅ 兼容 | 通过 menu trigger 集成 |
    | spec-kit | ✅ 兼容 | 通过 commands 调用 |
    | CLI 环境 | ✅ 兼容 | 支持命令行参数 |

    **已知限制**:
    - 不支持交互式命令（如需要用户输入的 `/sc:spawn`）
    - 不直接执行命令，仅返回路由字符串
  </compatibility>

</skill>

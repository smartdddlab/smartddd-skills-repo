---
name: smart-superclaude
author: "SmartDDD Lab"
license: "MIT"
last_reviewed: "2026-01-06"
description: "Smart SuperClaude 智能增强层 - 智能解析需求、动态调用 SuperClaude 命令，为 BMAD/spec-kit 提供智能增强能力"
tags:
  - superclaude
  - intelligent-routing
  - bmad
  - spec-kit
  - command-router
requirements:
  - "SuperClaude 框架"
  - "OpenSkills 技能系统"
version: "1.0.0"
---
<skill>
  <name>smart-superclaude</name>
  <version>1.0.0</version>
  <domain>AI Command Router</domain>

  <mission>
    Smart SuperClaude 是一个智能命令路由器，旨在为 BMAD、spec-kit 等 AI 工具提供动态调用 SuperClaude 命令的能力。通过智能意图识别、自然语言解析和动态命令路由，实现"说什么做什么"的无缝集成体验。
  </mission>

  <limitations>
    - 仅提供路由和解析功能，不直接执行 SuperClaude 命令
    - 需要 BMAD/spec-kit 等上层工具调用生成的路由命令
    - 依赖 SuperClaude 框架的可用性
  </limitations>

  <input_contract>
    <description>Smart SuperClaude 接收多种输入格式，包括自然语言、结构化 JSON 和快捷指令</description>
    <formats>
      <format name="自然语言模式">
        <description>用户使用自然语言描述需求，系统智能解析意图</description>
        <example>
          「帮我分析一下这个项目的代码质量问题」
          「这个 API 响应太慢了，帮我优化一下性能」
          「解释一下什么是依赖注入」
        </example>
      </format>
      <format name="结构化模式">
        <description>使用 JSON 结构化输入，包含 command、target、options 等字段</description>
        <example>
          {
            "command": "analyze",
            "target": "./src",
            "options": "--think --focus quality",
            "context": "项目代码质量分析"
          }
        </example>
      </format>
      <format name="快捷指令模式">
        <description>使用简化的快捷指令格式</description>
        <example>
          # 简化语法
          analyze ./src --quality
          troubleshoot "性能问题"
          design "用户认证模块"
        </example>
      </format>
      <format name="混合模式">
        <description>结合 BMAD/spec-kit 的上下文信息</description>
        <example>
          在 agent.yaml 的 menu 中使用：
          exec: "使用 smart-superclaude，需求={{user_input}}，上下文={{agent_context}}"
        </example>
      </format>
    </formats>

    <parameters>
      <parameter name="需求描述" type="string" required="true" description="用户的需求描述，支持自然语言"/>
      <parameter name="目标路径" type="string" required="false" description="分析或操作的目标文件/目录"/>
      <parameter name="执行选项" type="string" required="false" description="额外的执行选项和标志"/>
      <parameter name="上下文信息" type="object" required="false" description="来自 BMAD/spec-kit 的上下文信息"/>
      <parameter name="智能标志" type="string" required="false" description="智能推荐的标志组合"/>
    </parameters>
  </input_contract>

  <output_contract>
    <description>Smart SuperClaude 返回结构化的路由结果和执行建议</description>
    <success_response>
      <description>成功解析并路由后的响应</description>
      <structure>
        <field name="success" type="boolean">是否成功</field>
        <field name="intent" type="string">识别的用户意图</field>
        <field name="command" type="string">路由到的 SuperClaude 命令</field>
        <field name="routed_command" type="string">完整的路由后命令</field>
        <field name="flags" type="array">推荐的执行标志</field>
        <field name="explanation" type="string">路由决策的解释</field>
        <field name="alternatives" type="array">备选方案</field>
        <field name="suggestions" type="array">后续建议</field>
        <field name="error" type="string/null">错误信息（失败时）</field>
      </structure>
      <example>
        {
          "success": true,
          "intent": "代码质量分析",
          "command": "analyze",
          "routed_command": "/sc:analyze ./src --think --focus quality",
          "flags": ["--think", "--focus quality"],
          "explanation": "检测到质量分析意图，使用 analyze 命令配合 --think 深度分析标志",
          "alternatives": ["/sc:improve --type quality"],
          "suggestions": ["建议运行 /sc:cleanup 清理技术债务", "可使用 /sc:improve 自动修复问题"]
        }
      </example>
    </success_response>
    <failure_response>
      <description">无法解析或路由时的响应</description>
      <structure>
        <field name="success" type="boolean">false</field>
        <field name="intent" type="string/null">识别到的意图（可能为 null）</field>
        <field name="command" type="string/null">路由命令（可能为 null）</field>
        <field name="error" type="string">错误描述</field>
        <field name="suggestions" type="array">修正建议</field>
      </structure>
      <example>
        {
          "success": false,
          "intent": null,
          "command": null,
          "error": "无法识别的意图：'部署应用到生产环境'",
          "suggestions": ["请尝试使用 /sc:build 构建项目", "或使用 /sc:git 进行版本控制操作"]
        }
      </example>
    </failure_response>
  </output_contract>

  <flags_support>
    <description>Smart SuperClaude 智能推荐和传递 SuperClaude 标准标志</description>
    <categories>
      <category name="分析深度标志">
        <flag name="--think" description="标准结构化分析（4K 令牌）" auto_trigger="5+ 文件或复杂分析"/>
        <flag name="--think-hard" description="深度分析（10K 令牌）" auto_trigger="架构分析、系统级依赖"/>
        <flag name="--ultrathink" description="最大深度分析（32K 令牌）" auto_trigger="关键系统重设计"/>
        <flag name="--brainstorm" description="协作发现模式" auto_trigger="模糊需求、探索性任务"/>
      </category>
      <category name="MCP 服务器标志">
        <flag name="--c7 / --context7" description="启用 Context7 文档查询"/>
        <flag name="--seq / --sequential" description="启用 Sequential 多步推理"/>
        <flag name="--magic" description="启用 Magic UI 组件生成"/>
        <flag name="--play / --playwright" description="启用 Playwright 浏览器测试"/>
        <flag name="--serena" description="启用 Serena 符号操作"/>
        <flag name="--all-mcp" description="启用所有 MCP 服务器"/>
      </category>
      <category name="执行控制标志">
        <flag name="--focus <domain>" description="指定分析领域（quality/security/performance/architecture）"/>
        <flag name="--scope <level>" description="分析范围（file/module/project/system）"/>
        <flag name="--type <category>" description="操作类型（quality/performance/security）"/>
        <flag name="--loop" description="启用迭代模式" auto_trigger="improve、polish、enhance 关键词"/>
        <flag name="--validate" description="执行验证检查"/>
        <flag name="--safe" description="安全模式（仅读操作）"/>
        <flag name="--delegate" description="启用委派模式"/>
      </category>
    </categories>
  </flags_support>

  <routing_table>
    <description>智能路由表 - 将用户意图映射到 SuperClaude 命令</description>
    <routes>
      <route intent_patterns="分析、检查、审查、评估、审视、看看、怎么样" command="analyze" examples="["分析代码质量", "检查安全问题", "审查架构设计"]">
        <flags_recommendation>
          <flag when="代码质量相关" value="--focus quality"/>
          <flag when="安全相关" value="--focus security"/>
          <flag when="性能相关" value="--focus performance"/>
          <flag when="架构相关" value="--focus architecture"/>
          <flag when="多文件或复杂" value="--think"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="改进、优化、改善、提升、完善、增强" command="improve" examples="["优化性能", "改进代码", "提升质量"]">
        <flags_recommendation>
          <flag when="质量改进" value="--type quality"/>
          <flag when="性能优化" value="--type performance --focus perf"/>
          <flag when="安全加固" value="--type security --focus security"/>
          <flag when="要求迭代改进" value="--loop"/>
          <flag when="需要验证" value="--validate"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="诊断、排查、解决、修复、问题、错误、bug、崩溃" command="troubleshoot" examples="["诊断性能问题", "排查错误", "解决崩溃"]">
        <flags_recommendation>
          <flag when="复杂问题" value="--think --seq"/>
          <flag when="需要浏览器测试" value="--play"/>
          <flag when="全面分析" value="--think-hard --all-mcp"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="设计、架构、方案、结构、规划、建模" command="design" examples="["设计认证模块", "架构微服务", "方案评审"]">
        <flags_recommendation>
          <flag when="前端设计" value="--magic"/>
          <flag when="后端设计" value="--seq --c7"/>
          <flag when="系统架构" value="--think-hard"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="解释、说明、讲解、是什么、什么意思、怎么用" command="explain" examples="["解释依赖注入", "说明 SOLID 原则", "讲解架构模式"]">
        <flags_recommendation>
          <flag when="详细解释" value="--think"/>
          <flag when="需要文档参考" value="--c7"/>
          <flag when="需要示例" value="--examples"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="构建、编译、打包、构建、运行、启动" command="build" examples="["构建项目", "编译代码", "打包发布"]">
        <flags_recommendation>
          <flag when="前端项目" value="--magic"/>
          <flag when="后端项目" value="--seq --c7"/>
          <flag when="需要优化构建" value="--optimize"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="测试、验证、检查、单元、集成、e2e" command="test" examples="["运行测试", "验证功能", "检查覆盖"]">
        <flags_recommendation>
          <flag when="E2E 测试" value="--play"/>
          <flag when="需要覆盖率" value="--coverage"/>
          <flag when="性能测试" value="--perf"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="文档、文档化、生成文档、注释、readme" command="document" examples="["生成文档", "编写 README", "添加注释"]">
        <flags_recommendation>
          <flag when="API 文档" value="--api"/>
          <flag when="代码注释" value="--comments"/>
          <flag when="需要多语言" value="--locale zh-CN"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="清理、清理、整理、删除无用、重构代码" command="cleanup" examples="["清理代码", "删除死代码", "整理结构"]">
        <flags_recommendation>
          <flag when="深度清理" value="--think"/>
          <flag when="安全模式" value="--safe"/>
          <flag when="需要验证" value="--validate"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="任务、计划、里程碑、todo、待办" command="task" examples="["创建任务", "规划里程碑", "管理待办"]">
        <flags_recommendation>
          <flag when="复杂任务" value="--think"/>
          <flag when="需要委派" value="--delegate"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="估算、评估、预计、工作量、复杂度" command="estimate" examples="["估算工作量", "评估复杂度", "预计时间"]">
        <flags_recommendation>
          <flag when="详细估算" value="--think --seq"/>
          <flag when="快速估算" value="--quick"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="商业、业务、战略、市场、竞争、分析" command="business-panel" examples="["商业分析", "战略规划", "市场竞争"]">
        <flags_recommendation>
          <flag when="辩论模式" value="--mode debate"/>
          <flag when="苏格拉底模式" value="--mode socratic"/>
          <flag when="仅综合" value="--synthesis-only"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="规范、规格、spec、评审、审查" command="spec-panel" examples="["规范评审", "规格检查", "需求审查"]">
        <flags_recommendation>
          <flag when="详细评审" value="--detailed"/>
          <flag when="快速评审" value="--quick"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="帮助、命令、列表、有什么、怎么用" command="help" examples="["显示帮助", "列出命令", "怎么使用"]">
        <flags_recommendation>
          <flag when="详细帮助" value="--verbose"/>
          <flag when="指定命令" value="--command <name>"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="git、版本、提交、分支、合并、commit" command="git" examples="["智能提交", "创建分支", "合并代码"]">
        <flags_recommendation>
          <flag when="智能提交" value="--smart-commit"/>
          <flag when="创建功能分支" value="--feature-branch"/>
          <flag when="分析提交历史" value="--analyze"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="头脑风暴、创意、想法、讨论、探索、构思" command="brainstorm" examples="["头脑风暴", "创意讨论", "需求探索"]">
        <flags_recommendation>
          <flag when="结构化讨论" value="--structured"/>
          <flag when="发散思维" value="--creative"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="工作流、流程、自动化、pipeline" command="workflow" examples="["生成工作流", "创建流程", "自动化任务"]">
        <flags_recommendation>
          <flag when="CI/CD" value="--cicd"/>
          <flag when="开发流程" value="--dev"/>
          <flag when="部署流程" value="--deploy"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="实现、开发、写代码、编码、创建" command="implement" examples="["实现功能", "开发模块", "编写代码"]">
        <flags_recommendation>
          <flag when="需要设计" value="--design-first"/>
          <flag when="需要测试" value="--with-tests"/>
          <flag when="安全实现" value="--secure"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="反思、回顾、总结、评估结果" command="reflect" examples="["任务反思", "回顾总结", "评估结果"]">
        <flags_recommendation>
          <flag when="详细反思" value="--detailed"/>
          <flag when="快速回顾" value="--quick"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="加载、load、恢复、resume" command="load" examples="["加载上下文", "恢复会话", "导入项目"]">
        <flags_recommendation>
          <flag when="完整加载" value="--full"/>
          <flag when="部分加载" value="--partial"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="保存、save、持久化、checkpoint" command="save" examples="["保存会话", "创建检查点", "持久化"]">
        <flags_recommendation>
          <flag when="完整保存" value="--full"/>
          <flag when="仅保存状态" value="--state-only"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="编排、spawn、协调、调度、多任务" command="spawn" examples="["编排任务", "协调工作", "调度操作"]">
        <flags_recommendation>
          <flag when="并行执行" value="--parallel"/>
          <flag when="串行执行" value="--sequential"/>
          <flag when="混合模式" value="--mixed"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="工具、选择、最佳、推荐、mcp" command="select-tool" examples="["选择工具", "推荐 mcp", "最佳实践"]">
        <flags_recommendation>
          <flag when="复杂场景" value="--complexity-analysis"/>
          <flag when="简单场景" value="--quick-select"/>
        </flags_recommendation>
      </route>
      <route intent_patterns="索引、索引、搜索、查找、knowledge" command="index" examples="["生成索引", "搜索知识库", "查找文档"]">
        <flags_recommendation>
          <flag when="完整索引" value="--full"/>
          <flag when="增量索引" value="--incremental"/>
        </flags_recommendation>
      </route>
    </routes>
  </routing_table>

  <examples>
    <example name="自然语言解析示例">
      <description>用户使用自然语言描述需求，系统智能路由</description>
      <input>
        「这个 API 响应太慢了，帮我看看哪里有问题」
      </input>
      <processing>
        1. 识别关键词：「API 响应太慢」→ 性能问题
        2. 检测意图：「哪里有问题」→ troubleshoot 或 analyze
        3. 选择命令：troubleshoot（问题诊断）
        4. 推荐标志：--think --seq --focus performance
      </processing>
      <output>
        {
          "success": true,
          "intent": "API 性能问题诊断",
          "command": "troubleshoot",
          "routed_command": "/sc:troubleshoot ./api --think --seq --focus performance",
          "explanation": "检测到性能问题，使用 troubleshoot 命令配合性能分析标志",
          "suggestions": ["可使用 /sc:improve --type performance 进行优化", "建议运行 /sc:analyze --focus performance 获取详细报告"]
        }
      </output>
    </example>

    <example name="BMAD Agent 集成示例">
      <description>在 BMAD agent.yaml 中集成 smart-superclaude</description>
      <input>
        menu:
          - trigger: "智能分析" | "analyze smart"
            exec: "使用 smart-superclaude，需求={{user_selection}}"
            description: "智能分析代码质量、性能和安全"
      </input>
      <processing>
        1. BMAD 捕获用户选择
        2. 调用 smart-superclaude 解析意图
        3. 返回路由后的命令
        4. BMAD 执行生成的 /sc:* 命令
      </processing>
      <output>
        {
          "success": true,
          "command": "analyze",
          "routed_command": "/sc:analyze ./src --think --focus quality security performance",
          "explanation": "多维度分析请求，使用 analyze 命令组合多个 focus 标志"
        }
      </output>
    </example>

    <example name="spec-kit 命令调用示例">
      <description>在 spec-kit 规范文档中调用 smart-superclaude</description>
      <input>
        ## 用户认证模块分析

        使用 smart-superclaude，
        需求=分析用户认证模块的代码质量、安全性和架构设计，
        目标路径=./src/auth
      </input>
      <processing>
        1. spec-kit 解析文档中的 smart-superclaude 调用
        2. 提取需求描述和目标路径
        3. 调用 smart-superclaude 智能解析
        4. 返回路由命令供执行
      </processing>
      <output>
        {
          "success": true,
          "command": "analyze",
          "routed_command": "/sc:analyze ./src/auth --think-hard --focus quality security architecture",
          "explanation": "模块分析请求，使用深度分析配合质量、安全、架构多维度"
        }
      </output>
    </example>

    <example name="结构化 API 调用示例">
      <description>使用 JSON 结构化调用 smart-superclaude</description>
      <input>
        {
          "command": "smart-superclaude",
          "params": {
            "需求": "设计一个高可用的微服务架构",
            "目标路径": "./microservices",
            "执行选项": "--magic",
            "上下文信息": {
              "项目类型": "分布式系统",
              "团队规模": "10人",
              "当前阶段": "架构设计"
            }
          }
        }
      </input>
      <output>
        {
          "success": true,
          "intent": "微服务架构设计",
          "command": "design",
          "routed_command": "/sc:design ./microservices --think-hard --architecture --magic",
          "explanation": "架构设计请求，使用 design 命令配合深度分析和架构标志",
          "suggestions": ["建议后续使用 /sc:implement 实现核心模块", "可使用 /sc:estimate 估算开发工作量"]
        }
      </output>
    </example>

    <example name="迭代改进示例">
      <description>使用 --loop 标志进行迭代优化</description>
      <input>
        「帮我持续优化这个函数的性能，直到达到最佳状态」
      </input>
      <processing>
        1. 识别关键词：「持续优化」→ 迭代模式
        2. 检测意图：performance improve
        3. 选择命令：improve
        4. 推荐标志：--type performance --loop --validate
      </processing>
      <output>
        {
          "success": true,
          "intent": "性能迭代优化",
          "command": "improve",
          "routed_command": "/sc:improve ./src/utils.js --type performance --loop --validate",
          "explanation": "迭代优化请求，使用 improve 命令配合循环和验证标志",
          "suggestions": ["每次迭代后建议运行 /sc:analyze --focus performance 评估效果"]
        }
      </output>
    </example>
  </examples>

  <best_practices>
    <practice name="智能标志使用">
      smart-superclaude 会根据上下文自动推荐最合适的标志组合。
      建议信任系统的自动推荐，同时也可以手动指定特定标志覆盖自动选择。
    </practice>
    <practice name="备选方案">
      当主要命令不适用时，smart-superclaude 会提供备选方案。
      建议在主方案失败时考虑使用备选方案。
    </practice>
    <practice name="上下文集成">
      在 BMAD/spec-kit 中使用时，尽量提供完整的上下文信息。
      上下文越丰富，意图识别和路由决策越准确。
    </practice>
    <practice name="链式调用">
      可以将多个 smart-superclaude 调用串联使用，实现复杂的自动化工作流。
      例如：analyze → improve → test → document。
    </practice>
  </best_practices>

  <error_handling>
    <errors>
      <error code="E001" name="无法识别的意图" description="用户输入无法匹配任何已知意图模式">
        <resolution>
          1. 尝试使用更具体的需求描述
          2. 参考支持的功能列表重新组织语言
          3. 使用帮助命令查看所有可用命令
        </resolution>
      </error>
      <error code="E002" name="目标路径无效" description="指定的目标文件或目录不存在或无法访问">
        <resolution>
          1. 检查目标路径是否正确
          2. 确认文件/目录是否有访问权限
          3. 使用相对路径或绝对路径
        </resolution>
      </error>
      <error code="E003" name="标志冲突" description="指定的标志组合存在冲突">
        <resolution>
          1. 检查标志是否互斥
          2. 参考标志支持文档
          3. 使用系统自动推荐的标志组合
        </resolution>
      </error>
      <error code="E004" name="上下文错误" description="BMAD/spec-kit 提供的上下文信息格式错误">
        <resolution>
          1. 检查上下文信息格式
          2. 确保 JSON 结构正确
          3. 参考输入契约规范
        </resolution>
      </error>
    </errors>
  </error_handling>

  <integration_guide>
    <bmad_integration>
      <description>在 BMAD Agent 中集成 smart-superclaude</description>
      <steps>
        <step>在 agent.yaml 的 menu 中添加触发器</step>
        <step>配置 exec 命令调用 smart-superclaude</step>
        <step>解析返回的路由命令</step>
        <step>执行生成的 /sc:* 命令</step>
      </steps>
      <example>
        menu:
          - trigger: "智能增强" | "smart enhance"
            exec: "使用 smart-superclaude，需求={{user_input}}"
            description: "调用 SuperClaude 智能增强功能"
      </example>
    </bmad_integration>

    <spec_kit_integration>
      <description>在 spec-kit 规范文档中集成 smart-superclaude</description>
      <steps>
        <step>在规范文档中添加 smart-superclaude 调用块</step>
        <step>使用逗号分隔参数</step>
        <step>解析器提取并调用 smart-superclaude</step>
        <step>执行路由后的命令</step>
      </steps>
      <example>
        ## 性能优化任务

        使用 smart-superclaude，
        需求=优化核心计算函数的性能，
        目标路径=./src/core/calculator.js
      </example>
    </spec_kit_integration>

    <custom_integration>
      <description>在其他工具中自定义集成 smart-superclaude</description>
      <steps>
        <step>调用 smart-superclaude 的输入接口</step>
        <step>传递需求描述和上下文信息</step>
        <step>接收结构化的路由结果</step>
        <step>执行生成的 SuperClaude 命令</step>
      </steps>
      <considerations>
        - 保持输入格式与规范一致
        - 处理可能的错误响应
        - 考虑执行超时和错误恢复
      </considerations>
    </custom_integration>
  </integration_guide>

</skill>

# Uniapp - Ai

**Pages:** 3

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/ai/auto-test.html

**Contents:**
- # 使用AI CLI 编写uni-app自动化测试用例并运行
- # 测试环境准备
    - # 安装npm包
    - # 安装HBuilderX自动化测试插件
- # 测试支持的平台以及设备
- # 关于npm包hbuilderx-cli
    - # 运行测试到weixin
    - # 运行测试到Web
    - # 运行测试到iOS模拟器
    - # 运行测试到Harmony

随着uni-app (x)项目功能的日益复杂，如何保证跨端体验的一致性和高质量，成了一个巨大的挑战。自动化测试是解决这一问题的金钥匙，但编写和维护测试用例本身就是一项耗时耗力的工作。

现在，我们可以借助强大的 AI 编程助手（如 Google Gemini CLI 、Github Copilot CLI 、claude-code 、qoder cli ），将这一过程变得前所未有的简单和高效。本文将一步步教你如何利用 AI，为你的 uni-app 项目自动编写测试用例并运行测试。

在AI CLI中，运行自动化测试，需要在项目目录下，安装 @dcloudio/hbuilderx-cli 依赖包，它让您可以通过 npm scripts 轻松使用 HBuilderX 的各种功能。

示例源码如下，请查看 pre > code 标签中的内容

浏览器访问DCloud插件市场，下载插件HBuilderX uni-app自动化测试 。

点击【导入插件】，会自动拉起本地安装的HBuilderX，完成插件安装。

uniapp自动化测试环境，需要安装jest、adbkit、puppeteer、playwright等库，安装相关依赖之后，才可以正常使用此插件。

受网络环境、电脑环境、安装包体积大小等，可能安装很慢。

npm包 @dcloudio/hbuilderx-cli ，是一个便捷的 HBuilderX 命令行工具包装器，让您可以通过 npm scripts 轻松使用 HBuilderX 的各种功能，也方便AI调取运行日志自动修复问题。

npm包，封装了HBuilderX cli uni-app (x)项目启动、日志查看、自动化测试相关功能。HBuilderX cli文档 、HBuilderX自动化测试插件cli文档

下面将介绍@dcloudio/hbuilderx-cli，使用npm命令运行自动化测试。

特别注意事项：运行测试前，请先确保HBuilderX uni-app自动化测试插件 可以在HBuilderX内正常使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

运行到Android，npm run test:app-android 输出结果示例:

示例源码如下，请查看 pre > code 标签中的内容

uni-app 提供了一批API，这些API可以操控uni-app应用，包括运行、跳转页面、触发点击等，并可以获取页面元素状态、进行截图。 uni-app 自动化测试API详情

所以我们要做的，就是让AI分析项目分析页面、根据页面编写测试用例、运行测试用例、执行测试、输出测试报告。

因此我们需要将相关规则（页面分析规则、测试用例编写规范、运行命令等等）整理成一份md文件，然后将md文件放置在项目根目录，以便AI读取。

Copilot cli 安装：Github Copilot CLI

示例源码如下，请查看 pre > code 标签中的内容

Copilot cli 安装：Google Gemini CLI

打开终端，进入项目目录，输入命令 gemini。

在gemini中提问，比如按照@AGENT-Test-Prompt.md 生成测试用例并运行测试到android

将以下内容保存为 AGENT-Test-Prompt.md，放置在项目根目录。在使用 AI CLI 时，让 AI 读取此文件作为指令。

示例源码如下，请查看 pre > code 标签中的内容

现象: 报错 Port 9520 is in use 或类似端口占用提示。

**Examples:**

Example 1 (bash):
```bash
# 如果项目下不存在package.json文件，请先运行npm init -y命令，生成package.json文件。
npm init -y
# 安装
npm install @dcloudio/hbuilderx-cli --save-dev
```

Example 2 (bash):
```bash
# 如果项目下不存在package.json文件，请先运行npm init -y命令，生成package.json文件。
npm init -y
# 安装
npm install @dcloudio/hbuilderx-cli --save-dev
```

Example 3 (bash):
```bash
# 如果项目下不存在package.json文件，请先运行npm init -y命令，生成package.json文件。
npm init -y
# 安装
npm install @dcloudio/hbuilderx-cli --save-dev
```

Example 4 (markdown):
```markdown
# 如果项目下不存在package.json文件，请先运行npm init -y命令，生成package.json文件。
npm init -y
# 安装
npm install @dcloudio/hbuilderx-cli --save-dev
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/dev/faq/email.html

**Contents:**
- # 1. 检查垃圾邮件文件夹
- # 2. 添加发件人邮箱到白名单
  - # 163邮箱
  - # QQ邮箱
  - # Gmail
  - # Outlook
  - # 其他邮箱服务
- # 3. 联系我们
      - 本页导读

当您在注册账号或绑定邮箱时，遇到邮箱无法接收验证码的情况，可能是由于邮件被误判为垃圾邮件或被邮箱服务商拦截。为了确保您能够顺利收到验证码邮件，您可以按照以下步骤将我们的邮件地址添加到您的邮箱白名单中。

首先，请检查您的邮箱的垃圾邮件文件夹。有时候，验证码邮件可能会被误判为垃圾邮件，并被自动转移到该文件夹中。

如果验证码邮件仍然没有出现在您的收件箱或垃圾邮件文件夹中，您可以通过以下方法将我们的发件人地址（mail.dcloud.net.cn、mail.dcloud.io）添加到您的邮箱白名单中。不同邮箱服务商的操作步骤可能会有所不同，以下是常见邮箱的操作方法：

对于其他邮箱服务，您可以查看其帮助文档或联系其客服，了解如何将发件人邮箱地址添加到白名单中。大多数邮箱都有类似的垃圾邮件过滤和白名单设置选项。

如果您已按照上述步骤操作，但仍然无法收到验证码邮件，欢迎通过我们的客服邮箱（service@dcloud.io）与我们联系，我们将尽力为您解决问题。

**Examples:**

Example 1 (unknown):
```unknown
mail.dcloud.net.cn
```

Example 2 (unknown):
```unknown
mail.dcloud.io
```

Example 3 (python):
```python
service@dcloud.io
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/ai/

**Contents:**
- # Vibe Coding 最佳实践：基于 uni-app 的 AI 开发指南
- # 一、技术栈选型
  - # 第1个坑：客户端技术栈
    - # 解决方案
  - # 第2个坑：服务端部署与运维
    - # 解决方案：uniCloud
- # 二、全流程 AI 自动化开发
  - # 自动分析日志与错误修复
  - # 截图对比与自动化测试
- # 总结：Vibe Coding 时代的技术栈最优解

随着AI的能力越来越强，基于AI的Vibe Coding逐渐走进现实。

而uni-app + uniCloud，致力于成为Vibe Coding的最佳伴侣。

首先明确，Vibe Coding不是AI补全。

AI补全，开发的主体是人，AI在后台猜程序员要写什么，补全部分代码。 如需要在HBuilderX中的AI代码补全功能，请使用copilot-for-hbuilder插件 。

而Vibe Coding，开发的主体是AI 人给AI提供需求，AI完成代码开发，人工核准AI的代码。

Vibe Coding的成功关键是AI模型本身，目前具备Vibe Coding能力的模型主要有Claude Code、Gemini3。使用能力不足的AI并不能达到Vibe Coding的效果。

然后Vibe Coding的人机交互主界面不是IDE，而是终端。在终端中使用 Claude Code、Gemini CLI。 HBuilderX，则作为运行、发行工具，给AI提供运行日志、自动化测试框架，帮助AI写正确uni-app的代码。

Vibe Coding很美好，但目前的阶段有很多坑要注意。

Vibe Coding开头很爽，AI嗖嗖完成 90% 的代码开发。但剩余 10% 的问题会卡应用的商用或验收。

AI能做好90%已经足够好了，剩下的还是需要人工介入。但是，当你发现AI用你了不熟悉的、或学习成本很高的技术栈，导致难以人工介入，那就麻烦了。

AI 存在“北美技术偏好”（训练数据主要源于英语互联网），默认倾向生成：

锁定技术栈：uni-app (Vue 语法)

项目初始化阶段，建议向 AI 发送以下提示词锁定技术栈：

示例源码如下，请查看 pre > code 标签中的内容

如果你使用uni-app x，还需要补充更多提示词。另见 uni-app x / uts 的 AI skill

AI让产品经理可以写应用了，也让前端工程师可以写后端了，但是，服务器代码写完了，怎么部署？

怎么保障服务器安全？怎么防止DDoS攻击？怎么根据用户高峰扩容？怎么...

AI 可以给你生成 Java、Go、PHP 等传统后端代码但它解决不了这些专业问题。此时，你需要serverless。

uniCloud是基于serverless的云开发平台，它使得开发者仅需专注自己的代码逻辑，所有服务器的部署、攻击、弹性扩容都无需自己操心。

就像你插上插座用电就好了，不需要因为有用电高峰就自己再购买维护1台新发电机。而且费用更加低廉，仅需要按自己实际使用的电量付费，不需要为闲置云资源付钱。

示例源码如下，请查看 pre > code 标签中的内容

在传统开发模式中，大量开发者陷入低效循环：频繁在 IDE、浏览器控制台与 AI 工具间切换，重复执行「修改代码 → 查看日志 → 粘贴至 AI 调试」的机械操作，既耗时又枯燥。

AI 完成代码生成后，AI能不能自动运行？自己发现问题自己修？

是的，uni-app提供了一系列支持CLI命令和MCP工具，让全流程AI自动化都已经实现。

AI写好代码后，可以实现自动运行到各个平台（Android、iOS、鸿蒙、web、各家小程序）、自动提取运行日志（包括编译日志、运行日志）、自动根据日志中的错误修复代码。

这让AI具备了自迭代。你只需要搭好架子，找个聪明的AI，然后喝着咖啡看着它在终端里不停忙乎迭代，交付给你更好的成品。

甚至，AI还可以自动编写并执行自动化测试脚本。

由于 UTS 是强类型约束，若类型代码难以直接通过编译，而借助全流程自动化，AI 可实现传统 JS/TS 代码向 UTS 代码的自动转换。

示例源码如下，请查看 pre > code 标签中的内容

上述 CLI 命令需使用 HBuilderX 4.87 及以上版本，相关用法可参考官方教程：https://hx.dcloud.net.cn/cli/logcat-web 。实际开发中，可将各类运行命令整理至 package.json 的 scripts 字段中，提升操作效率。

在 UTS 开发场景中，可将「UTS 与 TS 的差异文档」（https://doc.dcloud.net.cn/uni-app-x/uts/uts_diff_ts.html ）提供给 AI，引导其自动提取 Android 平台运行日志、识别编译错误，并完成代码修复，最终实现 JS/TS 代码向 UTS 代码的自动化转换。

仅通过日志无法定位界面渲染、交互类问题，可借助uni-app 自动化测试插件实现截图对比与全量测试，具体步骤如下：

示例源码如下，请查看 pre > code 标签中的内容

通过上述方式，可彻底摆脱手动编写测试用例与反复调试的低效模式，借助 AI 实现开发测试全自动！

AI 是高效的代码生成工具，但跳过跨平台框架，让AI直接写各个平台原生代码，是会掉坑里的。

如果你想把ts编译成js，AI可以做，但还是用专业的 ts 编译器更靠谱。

专业的跨平台开发工具仍是保障开发质量的核心支撑。

只有将 AI 的能力与专业跨平台工具相结合，才能最大化开发者的投入产出比。

uni-app 与 uniCloud 形成的技术闭环，凭借单一语言覆盖全端、轻量化部署运维、全流程自动化等核心优势，会成为你 Vibe Coding 时代的最佳开发伙伴。

**Examples:**

Example 1 (unknown):
```unknown
uni-app (Vue 语法)
```

Example 2 (unknown):
```unknown
你作为一位精通 Vue 3 组合式 API 的资深 uni-app 跨平台应用开发专家，
在开发过程中需兼顾 H5、小程序、App 多端兼容性，通过 #ifdef 和 #endif 条件编译处理平台差异，
严格遵循 uni-app 最佳实践与性能优化建议，重视移动端适配和交互体验，并保证代码具备清晰、规范的注释。
```

Example 3 (unknown):
```unknown
你作为一位精通 Vue 3 组合式 API 的资深 uni-app 跨平台应用开发专家，
在开发过程中需兼顾 H5、小程序、App 多端兼容性，通过 #ifdef 和 #endif 条件编译处理平台差异，
严格遵循 uni-app 最佳实践与性能优化建议，重视移动端适配和交互体验，并保证代码具备清晰、规范的注释。
```

Example 4 (unknown):
```unknown
你作为一位精通 Vue 3 组合式 API 的资深 uni-app 跨平台应用开发专家，
在开发过程中需兼顾 H5、小程序、App 多端兼容性，通过 #ifdef 和 #endif 条件编译处理平台差异，
严格遵循 uni-app 最佳实践与性能优化建议，重视移动端适配和交互体验，并保证代码具备清晰、规范的注释。
```

---

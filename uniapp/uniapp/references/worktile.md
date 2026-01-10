# Uniapp - Worktile

**Pages:** 10

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-cli-uniapp-test.html

**Contents:**
- # uniapp.test CLI 命令行工具文档
- # 插件安装
- # cli使用方法
  - # 支持的平台
  - # 参数说明
- # uni-app 自动化测试依赖说明
- # 示例
- # 通过npm scripts使用CLI
    - # 添加 npm 脚本支持
    - # 使用npm命令查看日志

插件市场 HBuilderX uni-app自动化测试 插件 4.1.0版本起，支持被HBuilderX CLI调用了。

支持在命令行运行 uni-app (x) 自动化测试到 Web、微信小程序、Android、iOS 和 Harmony。

关于HBuilderX cli命令基本介绍，请参考：https://hx.dcloud.net.cn/cli/README

特别注意事项：运行HBuilderX cli uniapp.test前，请先确保HBuilderX uni-app自动化测试 插件可以在HBuilderX内正常使用。

插件安装地址 在插件市场，点击【导入插件】，会自动拉起本地安装的HBuilderX。

示例源码如下，请查看 pre > code 标签中的内容

如果您没有安装自动化测试依赖，调用HBuilderX CLI测试时，会出现如下提示，请根据提示语进行操作。

注意：playwright，依赖包体积很大（约1G左右），安装受限于网络、操作系统等环境，可能安装较慢。

如果playwright安装遇到问题，请参考: https://playwright.dev/docs/intro

注意事项：请先在终端切换到HBuilderX安装目录，再运行以下命令。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们需要在项目中安装 @dcloudio/hbuilderx-cli ,它是一个桥梁，让我们可以通过命令行来调用 HBuilderX 的强大功能（如启动测试流程）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
cli uniapp.test
```

Example 2 (typescript):
```typescript
// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>
```

Example 3 (typescript):
```typescript
// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>
```

Example 4 (typescript):
```typescript
// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/quickstart-cli

**Contents:**
- # 创建uni-app
    - # 自定义模板
    - # 国内特殊情况
    - # 更新依赖到指定版本
- # 运行、发布uni-app
- # 运行并发布快应用
    - # 运行并发布快应用(webview)
    - # 运行并发布快应用(webview)-华为
- # cli创建项目和HBuilderX可视化界面创建项目的区别
  - # cli创建的项目，也可以拖入HBuilderX编辑

除了HBuilderX可视化界面，也可以使用 cli 脚手架，可以通过 vue-cli 创建 uni-app 项目。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要全局安装 vue-cli npm install -g @vue/cli

使用正式版（对应HBuilderX最新正式版）

示例源码如下，请查看 pre > code 标签中的内容

使用alpha版（对应HBuilderX最新alpha版）

示例源码如下，请查看 pre > code 标签中的内容

此时，会提示选择项目模板（使用Vue3/Vite版不会提示，目前只支持创建默认模板），初次体验建议选择 hello uni-app 项目模板，如下所示：

选择自定义模板时，需要填写 uni-app 模板地址，这个地址其实就是托管在云端的仓库地址。以 GitHub 为例，地址格式为 userName/repositoryName，如 dcloudio/uni-template-picture 就是下载图片模板。

更多支持的下载方式，请参考这个插件的说明：download-git-repo

模板项目存放于 Github，由于国内网络环境问题，可能下载失败。针对此问题可以尝试如下措施：

可以使用 @dcloudio/uvm 管理编译器的版本，此工具仅自动增加或更新 uni-app 编译器主要依赖，对于新增的编译命令（scripts）暂时不会自动处理，需手动参考新工程进行配置。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以自定义更多条件编译平台，比如钉钉小程序，参考package.json文档 。

快应用有两种开发方式，uni-app均支持：

HBuilderX 2.7.12+ 版支持

HBuilderX 2.7.10+ 版支持

华为快应用文档-小程序转快应用 https://developer.huawei.com/consumer/cn/doc/development/quickApp-References/quickapp-filestructure

有些习惯了cli的开发者，使用HBuilderX可视化模式时不适应。讲解下它们的差别以及为什么HBuilderX提供了多种方式。

首先HBuilderX作为通用编辑器，兼容传统的cli方式开发。不止uni-app的cli，其他框架的cli也可以拖入HBuilderX。

也就是HBuilderX里可以使用可视化界面创建项目，也可以使用cli命令行创建项目，都可以达到和uni-app更好协作的目的。比如pages.json跳转和提示、manifest可视化界面、条件编译、rpx等css单位...众多 for uni-app 的优化都可以使用。

这些是HBuilderX的特点，和项目结构无关。

很好理解。因为其他ide没有内置uni-app的编译器，所以其他ide开发uni-app，只能把编译器安装在项目下，也就是cli创建的项目格式。

cli项目可以使用多种ide开发，但ide之间有区别：

HBuilderX可视化创建、运行、发布项目，底层调用的也是npm的run、build等命令。只是编译器不在项目下，而是在HBuilderX的目录下。

很多开发者对node不熟悉、对命令行有心理抵触。不要想当然认为所有开发者都会node，HBuilder有几百万开发者，其中掌握node的开发者连一半都占不到。

使用cli创建项目时，cli需要从npm安装，预置的项目模板选择从github下载，这些经常因为网络问题卡壳。可视化创建项目不存在这个问题。

一个HBuilderX的开发者有非常多个uni-app项目，如果每个项目下放一套编译器，会有很多不合理： - 创建项目会非常慢 - 非常占用磁盘空间（uni-app的编译器有数万个文件） - 升级麻烦，兼容性问题多。cli项目下的编译器不会跟随HBuilderX升级而升级，只能开发者手敲npm命令升级。当HBuilderX升级后，有的uni-app项目的编译器未升级，有的升级了，报错时开发者很容易懵圈，给DCloud报bug时DCloud也懵圈。让ide版本、编译器版本、uni-app运行时这3者的版本保持一致，会减少非常多的问题。

把编译器内置到HBuilderX中，开发者创建项目时只需关心自己的业务代码，工程结构干净清爽。

各家小程序也都是这么做的，编译器在小程序开发工具里，创建项目时不会在项目下带一套编译器（小程序也是要把wxml等编译为js的）。

HBuilderX提供的免node开发，除了易用，还更高效。

这比启动终端，移动焦点到终端窗口，敲命令快多了。

在uni-app中，终端命令比传统web开发要多、要长，还要敲运行平台参数的，选择你要运行到web还是app或某家小程序。

如果你习惯node，也能接受和管理好每个项目下一套编译器的方式，清楚上述利弊，那你可以选择cli创建项目。

至于ide，肯定还是HBuilderX搭配uni-app开发更高效。

如果你习惯其他ide，开发uni-app低效也无所谓，那也可以用其他ide。但注意至少运行调试app和uniCloud时，还得把HBuilderX开着，就像开着微信小程序工具调试那样。

在DCloud内部，uni-app和HBuilderX是不同的团队。

**Examples:**

Example 1 (shell):
```shell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

Example 2 (shell):
```shell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

Example 3 (shell):
```shell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

Example 4 (powershell):
```powershell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/git-svn.html

**Contents:**
      - 本页导读

HBuilderX 提供了完备的版本控制功能，参考：版本控制

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/

**Contents:**
  - # 工程化
      - 本页导读

uni-app 支持较为完整的工程化支持，主要包括：

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/quickstart-cli.html

**Contents:**
- # 创建uni-app
    - # 自定义模板
    - # 国内特殊情况
    - # 更新依赖到指定版本
- # 运行、发布uni-app
- # 运行并发布快应用
    - # 运行并发布快应用(webview)
    - # 运行并发布快应用(webview)-华为
- # cli创建项目和HBuilderX可视化界面创建项目的区别
  - # cli创建的项目，也可以拖入HBuilderX编辑

除了HBuilderX可视化界面，也可以使用 cli 脚手架，可以通过 vue-cli 创建 uni-app 项目。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要全局安装 vue-cli npm install -g @vue/cli

使用正式版（对应HBuilderX最新正式版）

示例源码如下，请查看 pre > code 标签中的内容

使用alpha版（对应HBuilderX最新alpha版）

示例源码如下，请查看 pre > code 标签中的内容

此时，会提示选择项目模板（使用Vue3/Vite版不会提示，目前只支持创建默认模板），初次体验建议选择 hello uni-app 项目模板，如下所示：

选择自定义模板时，需要填写 uni-app 模板地址，这个地址其实就是托管在云端的仓库地址。以 GitHub 为例，地址格式为 userName/repositoryName，如 dcloudio/uni-template-picture 就是下载图片模板。

更多支持的下载方式，请参考这个插件的说明：download-git-repo

模板项目存放于 Github，由于国内网络环境问题，可能下载失败。针对此问题可以尝试如下措施：

可以使用 @dcloudio/uvm 管理编译器的版本，此工具仅自动增加或更新 uni-app 编译器主要依赖，对于新增的编译命令（scripts）暂时不会自动处理，需手动参考新工程进行配置。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以自定义更多条件编译平台，比如钉钉小程序，参考package.json文档 。

快应用有两种开发方式，uni-app均支持：

HBuilderX 2.7.12+ 版支持

HBuilderX 2.7.10+ 版支持

华为快应用文档-小程序转快应用 https://developer.huawei.com/consumer/cn/doc/development/quickApp-References/quickapp-filestructure

有些习惯了cli的开发者，使用HBuilderX可视化模式时不适应。讲解下它们的差别以及为什么HBuilderX提供了多种方式。

首先HBuilderX作为通用编辑器，兼容传统的cli方式开发。不止uni-app的cli，其他框架的cli也可以拖入HBuilderX。

也就是HBuilderX里可以使用可视化界面创建项目，也可以使用cli命令行创建项目，都可以达到和uni-app更好协作的目的。比如pages.json跳转和提示、manifest可视化界面、条件编译、rpx等css单位...众多 for uni-app 的优化都可以使用。

这些是HBuilderX的特点，和项目结构无关。

很好理解。因为其他ide没有内置uni-app的编译器，所以其他ide开发uni-app，只能把编译器安装在项目下，也就是cli创建的项目格式。

cli项目可以使用多种ide开发，但ide之间有区别：

HBuilderX可视化创建、运行、发布项目，底层调用的也是npm的run、build等命令。只是编译器不在项目下，而是在HBuilderX的目录下。

很多开发者对node不熟悉、对命令行有心理抵触。不要想当然认为所有开发者都会node，HBuilder有几百万开发者，其中掌握node的开发者连一半都占不到。

使用cli创建项目时，cli需要从npm安装，预置的项目模板选择从github下载，这些经常因为网络问题卡壳。可视化创建项目不存在这个问题。

一个HBuilderX的开发者有非常多个uni-app项目，如果每个项目下放一套编译器，会有很多不合理： - 创建项目会非常慢 - 非常占用磁盘空间（uni-app的编译器有数万个文件） - 升级麻烦，兼容性问题多。cli项目下的编译器不会跟随HBuilderX升级而升级，只能开发者手敲npm命令升级。当HBuilderX升级后，有的uni-app项目的编译器未升级，有的升级了，报错时开发者很容易懵圈，给DCloud报bug时DCloud也懵圈。让ide版本、编译器版本、uni-app运行时这3者的版本保持一致，会减少非常多的问题。

把编译器内置到HBuilderX中，开发者创建项目时只需关心自己的业务代码，工程结构干净清爽。

各家小程序也都是这么做的，编译器在小程序开发工具里，创建项目时不会在项目下带一套编译器（小程序也是要把wxml等编译为js的）。

HBuilderX提供的免node开发，除了易用，还更高效。

这比启动终端，移动焦点到终端窗口，敲命令快多了。

在uni-app中，终端命令比传统web开发要多、要长，还要敲运行平台参数的，选择你要运行到web还是app或某家小程序。

如果你习惯node，也能接受和管理好每个项目下一套编译器的方式，清楚上述利弊，那你可以选择cli创建项目。

至于ide，肯定还是HBuilderX搭配uni-app开发更高效。

如果你习惯其他ide，开发uni-app低效也无所谓，那也可以用其他ide。但注意至少运行调试app和uniCloud时，还得把HBuilderX开着，就像开着微信小程序工具调试那样。

在DCloud内部，uni-app和HBuilderX是不同的团队。

**Examples:**

Example 1 (shell):
```shell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

Example 2 (shell):
```shell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

Example 3 (shell):
```shell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

Example 4 (powershell):
```powershell
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-cli-uniapp-test

**Contents:**
- # uniapp.test CLI 命令行工具文档
- # 插件安装
- # cli使用方法
  - # 支持的平台
  - # 参数说明
- # uni-app 自动化测试依赖说明
- # 示例
- # 通过npm scripts使用CLI
    - # 添加 npm 脚本支持
    - # 使用npm命令查看日志

插件市场 HBuilderX uni-app自动化测试 插件 4.1.0版本起，支持被HBuilderX CLI调用了。

支持在命令行运行 uni-app (x) 自动化测试到 Web、微信小程序、Android、iOS 和 Harmony。

关于HBuilderX cli命令基本介绍，请参考：https://hx.dcloud.net.cn/cli/README

特别注意事项：运行HBuilderX cli uniapp.test前，请先确保HBuilderX uni-app自动化测试 插件可以在HBuilderX内正常使用。

插件安装地址 在插件市场，点击【导入插件】，会自动拉起本地安装的HBuilderX。

示例源码如下，请查看 pre > code 标签中的内容

如果您没有安装自动化测试依赖，调用HBuilderX CLI测试时，会出现如下提示，请根据提示语进行操作。

注意：playwright，依赖包体积很大（约1G左右），安装受限于网络、操作系统等环境，可能安装较慢。

如果playwright安装遇到问题，请参考: https://playwright.dev/docs/intro

注意事项：请先在终端切换到HBuilderX安装目录，再运行以下命令。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们需要在项目中安装 @dcloudio/hbuilderx-cli ,它是一个桥梁，让我们可以通过命令行来调用 HBuilderX 的强大功能（如启动测试流程）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
cli uniapp.test
```

Example 2 (typescript):
```typescript
// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>
```

Example 3 (typescript):
```typescript
// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>
```

Example 4 (typescript):
```typescript
// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/CLI.html

**Contents:**
- # uni cli
  - # 环境安装
  - # 编译运行
    - # App 平台
    - # H5
    - # 微信小程序
    - # 支付宝小程序
    - # 百度小程序
    - # 抖音小程序
    - # 飞书小程序

uni-app项目支持 uni cli和 HBuilderX cli两种脚手架工具：

提供有完整的cli 脚手架，可以通过 vue-cli 创建、运行、发行 uni-app 项目。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以自定义更多条件编译平台，比如钉钉小程序，参考package.json 文档 。

开发者可以通过 cli 命令行指示 HBuilderX 进行启动、打包、登录等操作，详情参考：https://hx.dcloud.net.cn/cli/README

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX cli
```

Example 2 (unknown):
```unknown
HBuilderX cli
```

Example 3 (unknown):
```unknown
HBuilderX cli
```

Example 4 (unknown):
```unknown
HBuilderX cli
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/running-env

**Contents:**
- # 开发环境和生产环境
  - # 注意
- # 判断平台
- # 其他环境变量
      - 本页导读

uni-app 可通过 process.env.NODE_ENV 判断当前环境是开发环境还是生产环境。一般用于连接测试服务器或生产服务器的动态切换。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 中敲入代码块 uEnvDev、uEnvProd 可以快速生成对应 development、production 的运行环境判定代码。

示例源码如下，请查看 pre > code 标签中的内容

平台判断有 2 种场景，一种是在编译期判断，一种是在运行期判断。

示例源码如下，请查看 pre > code 标签中的内容

如上代码只会编译到 H5 的发行包里，其他平台的包不会包含如上代码。

示例源码如下，请查看 pre > code 标签中的内容

如有必要，也可以在条件编译里自己定义一个变量，赋不同值。在后续运行代码中动态判断环境。

**Examples:**

Example 1 (unknown):
```unknown
process.env.NODE_ENV
```

Example 2 (javascript):
```javascript
if (process.env.NODE_ENV === 'development') {
	console.log('开发环境');// 发布到生产环境时，此处代码会被摇树移除掉。
} else {
	console.log('生产环境');
}
```

Example 3 (javascript):
```javascript
if (process.env.NODE_ENV === 'development') {
	console.log('开发环境');// 发布到生产环境时，此处代码会被摇树移除掉。
} else {
	console.log('生产环境');
}
```

Example 4 (javascript):
```javascript
if (process.env.NODE_ENV === 'development') {
	console.log('开发环境');// 发布到生产环境时，此处代码会被摇树移除掉。
} else {
	console.log('生产环境');
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/running-env.html

**Contents:**
- # 开发环境和生产环境
  - # 注意
- # 判断平台
- # 其他环境变量
      - 本页导读

uni-app 可通过 process.env.NODE_ENV 判断当前环境是开发环境还是生产环境。一般用于连接测试服务器或生产服务器的动态切换。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 中敲入代码块 uEnvDev、uEnvProd 可以快速生成对应 development、production 的运行环境判定代码。

示例源码如下，请查看 pre > code 标签中的内容

平台判断有 2 种场景，一种是在编译期判断，一种是在运行期判断。

示例源码如下，请查看 pre > code 标签中的内容

如上代码只会编译到 H5 的发行包里，其他平台的包不会包含如上代码。

示例源码如下，请查看 pre > code 标签中的内容

如有必要，也可以在条件编译里自己定义一个变量，赋不同值。在后续运行代码中动态判断环境。

**Examples:**

Example 1 (unknown):
```unknown
process.env.NODE_ENV
```

Example 2 (javascript):
```javascript
if (process.env.NODE_ENV === 'development') {
	console.log('开发环境');// 发布到生产环境时，此处代码会被摇树移除掉。
} else {
	console.log('生产环境');
}
```

Example 3 (javascript):
```javascript
if (process.env.NODE_ENV === 'development') {
	console.log('开发环境');// 发布到生产环境时，此处代码会被摇树移除掉。
} else {
	console.log('生产环境');
}
```

Example 4 (javascript):
```javascript
if (process.env.NODE_ENV === 'development') {
	console.log('开发环境');// 发布到生产环境时，此处代码会被摇树移除掉。
} else {
	console.log('生产环境');
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/CI.html

**Contents:**
- # 持续集成
      - 本页导读

很多公司的开发人员提交代码后，需要自动打包或持续集成。

此时需要在服务器安装uni-app的cli版本来发布。

HBuilderX版与cli版互转指南参考：https://ask.dcloud.net.cn/article/35750

如果是发布App，还需要使用离线打包 ，配置原生环境，来实现持续集成。

---

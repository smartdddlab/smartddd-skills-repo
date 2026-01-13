# API


共 29 个页面:

## 1. Readme
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/README

HBuilderX API根对象可以通过require('hbuilderx')引入。 ```javascript const hx = require('hbuilderx') ``` 以下列出目前可用的API列表 |插件API											|详情																																| |--													|--																																	| |commands											|commands二级模块对象，用于处理和`命令`相关的逻辑[详情](/ExtensionDocs/Api/commands)												| |hx.languages.createDiagnosticCollection()			|创建一个问题列表，可用于文档校验时在文档出错区域显示波浪线标识问题[详情](/ExtensionDocs/Api/languages/createDiagnosticCollection)	| |hx.languages.registerInlineCompletionItemP

## 2. Cliconsole
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/cli/cliconsole

## cliconsole 将插件内的日志输出到终端 将插件内的日志输出到终端 ```js await hx.cliconsole.log({ clientId: client_id, msg: `欢迎使用HBuilderX CLI`, status: 'Info' }); ``` ### 参数说明 |参数名称		|参数类型	|描述												| |--			|--		|--													| |clientId	|String	|必填, 具体用法参考下面的示例代码						| |msg		|String	|													|...

## 3. Commands
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/commands

# commands commands二级模块对象，用于处理和`命令`相关的逻辑。`命令`包含2部分：唯一ID和自定义的function，可以通过registerCommand或registerTextEditorCommand注册。 `命令`可以通过以下方式触发： ## 声明command #### 菜单：将命令通过`menus`扩展点关联到某个菜单。 1. 通过commands扩展点声明一个command，然后关联到`menus`上 ```json { "contributes":{ "commands":[...

## 4. Clipboard
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/env/Clipboard

# Clipboard > 从HBuilderX 2.7.6及以上版本开始支持 剪切板对象，可用于读取剪切板内容和写入内容到剪切板，目前仅支持文本格式 ## readText > 读取剪切板内容 ##### 参数说明 无 ##### 返回值 |返回类型				|描述			| |--						|--				|...

## 5. Authorize
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/env/authorize

# authorize > HBuilderX 3.0.0+起支持 ## authorize介绍 authorize二级模块对象，用于处理插件授权登录，获取HBuilderX当前登录用户的信息授权。 它是[DCloud用户开放平台](https://open.dcloud.net.cn/)在HBuilderX插件API中的具体体现。 使用场景： 三方的开发者服务商，比如Git服务商，可以制作HBuilderX插件，并且将账户打通。比如插件注册项目的右键菜单，在HBuilderX中对项目点右键，一键上传到某Git服务商，且无需再重复注册三方Git服务账户。 当然不止是Git服务商，所有其他开发者服务商，如测试、加固、多渠道发布、招聘...，均可通过[DCloud用户开放平台](https://open.dcloud.net.cn/)共享DCloud的开发者资源。 使用步骤： 1. 三方开发商需要在[DCloud用户开放平台](https://open.dcloud.net.cn/)注册插件应用...

## 6. Openexternal
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/env/openExternal

# openExternal 打开一个外部链接，比如`https://www.dcloud.io`、`mailto:ide@dcloud.io` #### 参数说明 |参数名称	|参数类型	|描述			| |--			|--			|--				| |uri		|String		|外部链接地址	| #### 返回值 |返回类型				|描述				| |--						|--					| |Promise&lt;Boolean&gt;	|返回是否打开成功	|...

## 7. Readme
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/env/readme

# env > 从HBuilderX 2.7.6及以上版本开始支持 env二级模块对象，包含运行环境信息和系统交互相关的方法 **属性列表** |属性名		|属性类型				|描述																	| |--			|--						|--																		| |appName	|String					|应用程序名称：HBuilder X												| |appVersion	|String					|应用程序主版本号，可在菜单【帮助】-【关于】中查看						| |appRoot	|String					|应用程序安装路径														| |appData	|String					|应用程序数据存放路径													|...

## 8. Creatediagnosticcollection
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/languages/createDiagnosticCollection

# createDiagnosticCollection 创建一个问题列表，可用于文档校验时在文档出错区域显示波浪线标识问题。 ## 参数和返回值 ##### 参数说明 |参数名称	|参数类型	|描述			| |--			|--			|--				| |name		|String		|问题列表名称，当鼠标移至波浪线上时会显示在tooltips中| ##### 返回值 |返回类型										|描述			| |--												|--				|...

## 9. Readme
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/languages/readme

# languages languages二级模块对象，用于处理和编程语言相关的逻辑，目前仅支持校验文档时创建问题列表。

## 10. Registerinlinecompletionitemprovider
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/languages/registerInlineCompletionItemProvider

# registerInlineCompletionItemProvider > `从HBuilderX 3.8.5及以上版本开始支持` 注册行内代码提示程序。一种语言可以注册多个程序。在这种情况下，并行询问提供者，并合并结果。失败的提供程序（拒绝的承诺或异常）不会导致整个操作失败。 ##### 参数说明 |参数名称	|参数类型														|描述									| |--			|--																|--										| |selector	|[DocumentSelector](/ExtensionDocs/Api/other/DocumentSelector)	|一个选择器，用于定义此程序适用的文档。	| |provider	|[InlineCompletionItemProvider](#InlineCompletionItemProvider)	|行内代码提示内容的提供者。				| ##### 返回值 |返回类型											|描述																										|...

## 11. Cancellationtoken
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/CancellationToken

## CancellationToken CancellationToken: 取消令牌被传递给异步或长时间运行的操作以请求取消，就像由于用户继续键入而取消对完成项的请求一样。 **属性列表** |属性名					|属性类型	|描述								| |--						|--			|--									| |isCancellationRequested|Boolean	|当令牌被取消时为true，否则为false。| |onCancellationRequested|Event<any>	|取消时触发的事件					|

## 12. Command
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/Command

## Command Command: 对命令的引用 **属性列表** |属性名		|属性类型	|描述			| |--			|--			|--				| |arguments?	|any[]		|使用的参数		| |command	|String		|command标识符	| |title		|String		|命令的标题		| |tooltip?	|String		|在鼠标悬浮显示	|

## 13. Disposable
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/Disposable

# Disposable 资源释放接口，HBuilderX开放的部分API返回了该对象，将该对象添加到插件激活时的参数`context.subscriptions`数组内，插件卸载时将自动释放对应的资源。 #### dispose #### 参数说明 无 #### 返回值 无

## 14. Documentselector
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/DocumentSelector

## DocumentSelector DocumentSelector: 文档选择器 语言选择器是一个或多个语言标识符和语言过滤器的组合。 请注意，文档选择器只是一个语言标识符，它会选择所有文档，甚至是那些没有保存在磁盘上的文档。仅当功能在没有进一步上下文的情况下工作时才使用此类选择器。 - example * ```ts let sel:DocumentSelector = { scheme: 'file', language: 'typescript' };``` * ```ts let sel:DocumentSelector = { language: 'json', pattern: '**/package.json' };```

## 15. Position
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/Position

## Position Position: 线条和字符的位置 **属性列表** |属性名		|属性类型	|描述					| |--			|--			|--						| |line		|Number		|行，从零开始的字符值	| |character	|Number		|字符，从零开始的字符值	|

## 16. Range
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/Range

## Range Range: 文本区域 **属性列表** |属性名	|属性类型	|描述		| |--		|--			|--			| |start	|Number		|起始位置	| |end	|Number		|结束位置	|

## 17. Textdocument
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/TextDocument

## TextDocument TextDocument: 文档文件 **属性列表** |属性名			|属性类型													|描述																							| |--				|--															|--																								| |fileName		|String														|文件名称																						| |isDirty		|Boolean													|是否是修改状态																					| |isUntitled		|Boolean													| 是否是无标题文件																				| |lineCount		|Number														|文档总行数																						| |uri			|[Uri](/ExtensionDocs/Api/other/Uri)						|文档的uri，如果是本地文件，可通过uri.fsPath获取本地文件路径									|.

## 18. Uri
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/Uri

# Uri 统一资源访问符 **属性列表** |属性名		|属性类型	|描述				| |--			|--			|--					| |fsPath		|String		|本地文件地址		| |authority	|String		|Uri中的authority	| |fragment	|String		|Uri中的fragment	| |path		|String		|Uri中的path		| |query		|String		|Uri中的query		|...

## 19. Workspacefolder
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/WorkspaceFolder

# WorkspaceFolder 工作空间下的项目目录,在左侧项目管理器内的每一个项目表示一个WorkspaceFolder **属性列表** |属性名	|属性类型			|描述			| |--		|--					|--				| |uri	|String或[Uri](/ExtensionDocs/Api/other/Uri)|项目目录地址	| |name	|String				|项目目录名称	| |nature	|String				|项目类型		| |id		|String				|项目唯一id		|

## 20. Languageid
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/other/languageId

# languageId 以下是目前支持的编程语言Id列表： - txt - actionscript - ada - asm - asp - autoit - baanc - bash...

## 21. Json
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/util/json

# 读取和写入JSON ## 读取JSON: readJSONValue ```js let filePath = ""; let result = hx.util.readJSONValue(filePath, 'name'); result.then((data) => { console.log("----读取的值为:", data) }); ``` ## 写入JSON: writeJSONValue...

## 22. Message
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/Message

# 窗口右下角通知框 ## showErrorMessage 在窗口右下角显示错误通知框 #### 参数说明 |参数名称	|参数类型			|描述					| |--			|--					|--						| |message	|String				|消息内容,支持html标签	| |buttons	|Array&lt;String&gt;|通知框中的按钮组		| #### 返回值 |返回类型				|描述									|...

## 23. Statusbar
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/StatusBar

# 状态栏消息 ## setStatusBarMessage 设置HBuilderX底部状态栏消息 ##### 参数说明 |参数名称			|参数类型	|描述															| |--					|--			|--																| |text				|String		|消息内容														| |hideAfterTimeout	|Number		|[可选] 多长时间后自动隐藏,单位ms，默认值是0：不自动隐藏		| |level				|String		|[可选] 消息级别,取值有['warn'，'info'，'error'],默认值：'info'	| ##### 返回值...

## 24. Textdocument
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/TextDocument

# TextDocument 编辑器打开的文档文件 ## 属性列表 |属性名			|属性类型							|描述														| |--				|--									|--															| |fileName		|String								|文件名称													| |isDirty		|Boolean							|是否是修改状态												| |isUntitled		|Boolean							| 是否是无标题文件											| |lineCount		|Number								|文档总行数													| |uri			|[Uri](/ExtensionDocs/Api/other/Uri)						|文档的uri，如果是本地文件，可通过uri.fsPath获取本地文件路径|...

## 25. Texteditor
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/TextEditor

# TextEditor - 文本编辑器对象 @TextEditor ------ TextEditor：文本编辑器对象，为API [hx.window.getActiveTextEditor()](/ExtensionDocs/Api/windows/getActiveTextEditor) 返回值的详细说明文档。 ## TextEditor ### TextEditor属性列表 |属性名		|属性类型										|描述						| |--			|--												|--							| |document	|[TextDocument](#TextDocument)					|该编辑器关联的文档			| |selection	|[TextSelection](#TextSelection)				|当前光标选中的位置			| |selections	|Array&lt;[TextSelection](#TextSelection)&gt;	|当前多光标选中的位置集合	|...

## 26. Createoutputchannel
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/createOutputChannel

# createOutputChannel 创建一个输出控制台通道，可用于在控制台输出文本内容。 ## 介绍 **参数说明** |参数名称	|参数类型	|描述																								| |--			|--			|--																									| |channel	|String		|控制台通道名称，在添加内容到控制台时，会将该名称作为前缀输出，eg:[${channel}] 这是要输出的内容。	| **返回值** |返回类型						|描述		| |--								|--			|...

## 27. Createstatusbaritem
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/createStatusBarItem

# createStatusBarItem > `从HBuilderX 3.8.5及以上版本开始支持` 创建一个状态栏元素 #### 参数说明 |参数名称	|参数类型									|描述												| |--			|--											|--													| |alignment	|[StatusBarAlignment](#StatusBarAlignment)	|状态栏元素对其方式									| |priority	|Number										|状态栏元素优先级。值越高，表示元素应显示得越靠左。	| #### 返回值 |返回类型						|描述				|...

## 28. Createtreeview
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/createTreeView

# createTreeView > `从HBuilderX 2.7.12及以上版本开始支持` ## 介绍 创建指定viewId的视图，在窗体左侧区域创建一个和`项目管理器`同级的tab项。tab的内容区为一个树控件，可自行装载节点。 viewId需要在package.json文件内的配置扩展点[views](/ExtensionDocs/ContributionPoints/README.md#views)中声明，完整的扩展视图流程参考[如何注册一个新的视图？](/ExtensionTutorial/views?id=treeview) 参数说明: |参数名称	|参数类型							|描述										| |--			|--									|--											| |viewId		|String								|视图Id，需要首先在配置扩展点`views`中声明。| |options	|[TreeViewOptions](#TreeViewOptions)|创建TreeView时需要的设置项。				|...

## 29. Createwebview
URL: https://hx.dcloud.net.cn/ExtensionDocs/Api/windows/createWebView

# createWebView > 从HBuilderX 2.8.1及以上版本开始支持 创建指定viewId的WebView控件视图，在窗体左侧或右侧区域创建一个tab项。tab内容为webview，webview里可装载html页面，可以较灵活的渲染自定义的内容。 viewId需要在package.json文件内的配置扩展点[views](/ExtensionDocs/ContributionPoints/README.md#views)中声明。 完整的扩展视图流程参考 <a href="/ExtensionTutorial/views?id=webview" target="_blank">如何注册一个新的视图？</a> ## 简介 **参数说明** |参数名称	|参数类型					|描述											| |--		|--							|--												| |viewId	|String	|视图Id，需要首先在配置扩展点`views`中声明。									|...

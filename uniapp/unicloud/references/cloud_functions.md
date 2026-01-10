# Unicloud - Cloud Functions

**Pages:** 30

---

## uni-ai开发文档 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-ai.html

**Contents:**
- # uni-ai开发文档
- # API
  - # 获取LLM实例
  - # 对话
    - # 简单示例
    - # 流式响应
  - # AI多媒体能力
    - # 创建AI多媒体实例
    - # 创建图片生成任务
    - # 获取图片生成结果

新增于HBuilderX正式版 3.7.10+， Alpha版 3.7.13+。

HBuilderX 3.8.5+支持在本地调试云函数时使用uni-ai计费网关

使用低版本HBuilder，只能上传到uniCloud云端联调。因为低版本的uniCloud本地运行插件不支持uni-ai。云端和本地扩展库差异参考：云端和本地扩展库差异

ai作为一种云能力，相关调用被整合到uniCloud中。

如您的服务器业务不在uniCloud上，可以把云函数URL化，把uni-ai当做http接口调用。

在实际应用中，大多数场景是直接使用uni-ai-chat和uni-cms的ai功能，这些开源项目已经把完整逻辑都实现，无需自己研究API。

ai能力由uni-cloud-ai扩展库提供，在云函数或云对象中，对右键配置uni-cloud-ai扩展库。如何使用扩展库请参考：使用扩展库

如果HBuilderX版本过低，在云函数的扩展库界面里找不到uni-ai。

注意uni-ai是云函数扩展库，其api是uniCloud.ai，不是需要下载的三方插件，它是一个底层能力。 而uni-ai-chat和uni-cms等开源项目，是需要在插件市场下载的。

LLM，全称为Large Language Models，指大语言模型。

LLM的主要特点为输入一段前文，可以推导预测下文。

LLM不等于ai的全部，除了LLM，还有ai生成图片等其他模型。

用法：uniCloud.ai.getLLMManager(Object GetLLMManagerOptions);

注意需在相关云函数或云对象中加载uni-cloud-ai使用扩展库，否则会报找不到ai对象。

在2023年06月15日前，您不填写相关apiKey时可以免费使用uni-ai的LLM能力。但6月15日起需配置自己的apiKey或使用uni-ai计费网关，否则无法使用。详见uni-ai计费老用户升级指南 2023年07月25日非uni-ai计费网关调用百度接口由内测接口调整为文心千帆大模型接口 ，HBuilderX本地调试自HBuilderX 3.8.12起支持。新接口支持流式响应。

参数说明GetLLMManagerOptions

大语言模型的推理需要消耗很高的GPU算力，调用大模型需要在模型厂商处注册账户和付费。

您可以自行去大模型厂商处注册并填写相应的apiKey的参数。也可以通过DCloud来购买，即使用uni-ai计费网关。

uni-ai计费网关使用门槛低，并且可以一处充值，多模型体验。您无需在多个大模型厂商处申请，只需向DCloud购买token套餐，即可体验各种大模型的效果。

uni-ai计费网关的token计费单价与大模型厂商的定价相同，支持开具发票。

uni-ai作为一个国际化业务，支持国内外各种开发者面向国内外各种用户开发应用。 但开发者务必需注意您的应用是否符合当地政府监管要求、是否满足大模型厂商的限制政策。比如中国的大模型目前只能在大陆地区面向中国国籍用户使用，而国外的模型也有类似的区域限制。在uniCloud web控制台开通uni-ai计费网关时，您需要同意相关许可协议。

uni-ai计费网关目前支持付费使用七牛云提供的大模型服务和大模型厂商minimax，以及微软与openai合作提供的基于azure的ChatGPT3.5（与openai的ChatGPT3.5一致）。

在云函数或云对象中编写如下代码调用LLM服务：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在您使用uni-ai计费网关后，且在云函数代码中做好配置后。您可以：

使用uni-ai计费网关时，在云函数url化、定时触发、云函数单实例多并发，这3个场景需要传递客户端appId，即您应用的manifest.json里的appid。

如果是在HBuilder内直接运行云函数（非客户端联调调用）也无法获取appId，此时可参考此文档进行参数模拟：模拟客户端类型

云函数无法直接连通openai的服务器，您需要自行配置代理。如果使用的代理需要用户名和密码，请在代理地址中加入用户名和密码，例如：username:password@host:port。

uni-ai在请求openai时会自动将openai的域名替换为配置的代理域名或ip，一般的反向代理服务器均可满足此需求。

示例源码如下，请查看 pre > code 标签中的内容

对话接口响应一般比较慢，建议将云函数超时时间配置的长一些，比如30秒（客户端访问云函数最大超时时间：腾讯云为30秒，阿里云为60秒）。如何配置云函数超时时间请参考：云函数超时时间

本地运行云函数超时时间默认为10秒，超时将停止执行云函数，建议在本地调试时也将超时时间调大一些，避免调试时频繁超时。云函数本地超时时间设置

用法：llmManager.chatCompletion(Object ChatCompletionOptions)

参数说明ChatCompletionOptions

需注意messages末尾有个s，它是数组，而不是简单的字符串。其中每项由消息内容content和角色role组成。

示例源码如下，请查看 pre > code 标签中的内容

当开发者需要为用户的场景设置背景时，则需在云端代码写死system，而用户输入的问题则被放入user中，然后一起提交给LLM。

开发者可以在system里限制对话背景，防止ai乱答问题。然后给用户提供输入框，假使用户咨询了：“谣言传播多少人可以定罪？”，那么拼接的message就是：

示例源码如下，请查看 pre > code 标签中的内容

对于不支持system的情况，如baidu，只能把system对应的内容写到第一条user信息内，也可以达到一定范围内的控制效果。

注意：对于法律、医学等专业领域需要准确回答的，建议使用gpt-4模型。其他模型更适合闲聊、文章内容生成。

assistant这个角色的内容，是ai返回的。当需要持续聊天、记忆前文时，需使用此角色。

因为LLM没有记忆能力，messages参数内需要包含前文，LLM才能记得之前聊天的内容。

以下的messages示例，是第二轮ai对话时发送的messages的示例。在这个示例中，第一个user和assistant的内容，是第一轮ai对话的聊天记录。 最后一个user是第二轮对话时用户提的问题。

因为用户提问的内容“从上述方法名中筛选首字母为元音字母的方法名”，其中有代词“上述”，为了让ai知道“上述”是什么，需要把第一轮的对话内容也提交。

示例源码如下，请查看 pre > code 标签中的内容

在持续对话中需注意，messages内容越多则消耗的token越多，而LLM都是以token计费的。

token是LLM的术语，ai认知的语言是经过转换的，对于英语，1个token平均是4个字符，大约0.75个单词；对于中文，1个汉字大约是2个token。

如何在节省token和保持持续对话的记忆之间平衡，是一个挺复杂的事情。开发者需在适合时机要求ai对上文进行总结压缩，下次对话传递总结及总结之后的对话内容以实现更长的对话。

DCloud在uni-ai-chat 和uni-cms 中， 已经写好了这些复杂逻辑。开发者直接使用DCloud封装好的开源项目模板即可。

在上述例子中，还可以看到一种有趣的用法，即要求ai以数组方式回答问题。这将有利于开发者格式化数据，并进行后置增强处理。

每个AI Provider可以有多个model，比如对于openai，ChatGPT的模型是gpt-3.5-turbo，而gpt-4的模型就是gpt-4。不同模型的功能、性能、价格都不一样。

也有一些AI Provider只有一个模型，此时model参数可不填。

如果您需要非常精准的问答，且不在乎成本，推荐使用gpt-4。如果是普通的文章内容生成、续写，大多数模型均可胜任。

openai gpt-3.5-turbo: 4097

azure gpt-3.5-turbo: 8192

abab4-chat、abab5-chat: 4096

deepseek-chat、deepseek-reasoner: 8192

baidu文心千帆最后一个message的content长度（即此轮对话的问题）不能超过2000个字符；如果messages中content总长度大于2000字符，系统会依次遗忘最早的历史会话，直到content的总长度不超过2000个字符

tokensToGenerate指生成的token数量限制，即返回的文本对应的token数量不能超过此值。注意这个值不是总token。

注意此值和传入messages对应的token数量，两者相加不可大于模型最大上下文token数。如果messages对应的token数为1024，当传递的tokensToGenerate参数大于（模型最大上下文token数-1024）时接口会抛出错误。

使用minimax时默认最多生成512个token的结果，也就是返回结果不会很长。如有需求请自行调整此值。

自行设置apikey调用azure接口时需要传deploymentId，使用uni-ai计费网关访问azure服务时需要传递model而不是deploymentId。目前通过uni-ai计费网关调用azure接口仅支持gpt-3.5-turbo这一个模型。

deepseek-reasoner模型是deepseek的推理模型，在正式回答之前会生成思考过程，用于推理、解释、问答等场景。

deepseek-reasoner的输出 token 数包含了思维链和最终答案的所有 token。

在你的云函数中加载uni-cloud-ai扩展库，写下如下代码，ctrl+r运行，即可调用ai返回结果。

示例源码如下，请查看 pre > code 标签中的内容

如果你之前未使用过uniCloud，后续有专门的新手指南章节。

新增于HBuilderX正式版 3.7.10+， alpha版 HBuilderX 3.8.0+。

uni-ai chatCompletion接口支持传sseChannel参数的用法云端支持新增于2023年6月15日，HBuilderX 3.8.5+支持在本地调试云函数时使用此用法。使用uni-ai计费网关流式响应时，sseChannel参数必填

访问AI聊天接口时，如生成内容过大，响应时间会很久，前端用户需要等待很长时间才会收到结果。

实际上AI是逐渐生成下一个token的，所以可使用流式响应，类似不停打字的打字机那样，让前端用户陆续看到AI生成的内容。

以往云函数只有return的时候，才能给客户端返回消息。在流式响应中，需要云函数支持sse，在return前给客户端一直发送通知。

uniCloud的云函数，基于uni-push2提供了sse通道，即云函数请求中的中间状态通知通道。

在调用chatCompletion接口时传递参数stream: true即可开启流式响应。使用uni-ai计费网关时还需要传递sseChannel才可以使用流式响应。

关于使用uni-ai计费网关时使用流式响应的说明

流式响应需要云端持续从服务商接收数据并发送给客户端，这需要云函数一直保持运行（云函数无法一直保持运行，详情参考：超时时间）。如果使用uni-ai计费网关则无需云函数保持运行，在请求发送给DCloud服务器后DCloud服务器会使用推送通道将结果通知给客户端，而云函数可以再继续处理下一个请求或者直接休眠，从而节省大量云函数资源（GBs）。

注意，以上事件属于stream对象，不要和sseChannel的事件搞混了，云端调用sseChannel.write客户端就需要使用sseChannel.on('message')进行接受，例如sseChannel并没有optimizedMessage事件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

DCloud提供了开源的uni-ai-chat，对流式响应进行了前后端一体的封装，使用更简单，参考：uni-ai-chat

用法：uniCloud.ai.getMediaManager(Object GetMediaManagerOptions);

注意需在相关云函数或云对象中加载uni-cloud-ai使用扩展库，否则会报找不到ai对象。

参数说明GetMediaManagerOptions

示例源码如下，请查看 pre > code 标签中的内容

用法：mediaManager.imageGeneration(Object ImageGenerationOptions)

参数说明ImageGenerationOptions

百度v1接口（AI作画-基础版）支持的风格：探索无限、古风、二次元、写实风格、浮世绘、low poly 、未来主义、像素风格、概念艺术、赛博朋克、洛丽塔风格、巴洛克风格、超现实主义、水彩画、蒸汽波艺术、油画、卡通画

百度v2接口（AI作画-高级版）不支持传风格，如需指定风格可尝试在提示词内指定

百度v1接口支持以下分辨率：10241024、10241536、1536*1024

百度v2接口支持以下分辨率：512512、640360、360640、10241024、7201280、1280720

示例源码如下，请查看 pre > code 标签中的内容

用法：mediaManager.getGeneratedImage(Object GetGeneratedImageOptions)

参数说明GetGeneratedImageOptions

百度v1接口支持的状态为：'RUNNING'（任务执行中）、'SUCCESS'（任务成功）;

百度v2接口支持的状态为：'INIT'（任务创建中）、'WAIT'（任务等待中）、'RUNNING'（任务执行中）、'FAILED'（任务失败）、'SUCCESS'（任务成功）;

参数securityCheckResult说明

审核状态有以下几种： 'block'（违规）、'review'（需要人工核查）、'pass'（通过审核）

示例源码如下，请查看 pre > code 标签中的内容

新增于HBuilderX 4.71，计费网关（七牛云）新增于HBuilderX 4.75

为了保证在前端调用大模型时不暴露服务商的apiKey信息，uni-ai提供了获取临时鉴权 token 接口。 前端调用此接口获取临时 token 后，使用临时 token 调用服务商的api。

通过使用临时鉴权 token，可以避免在流式返回过程中云函数持续运行带来的资源消耗，将请求直接转发到服务商，大大降低云函数的运行成本。

此接口目前仅支持阿里云百炼、计费网关（七牛云）

用法：llmManager.getTempToken()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在调用uni-cloud-ai提供的api时，如果出现错误，接口会将错误对象抛出。如需处理此类错误需对错误进行捕获

示例源码如下，请查看 pre > code 标签中的内容

错误码：60000，错误信息："A network error occurred while requesting xxx"

请求服务商接口时遇到网络错误，如果是请求openai接口请注意需要使用代理，如果使用了代理仍遇到此错误，请检查代理连通性是否有问题

错误信息："certificate has expired"

请参考文档：云函数通过https访问其他服务器时出现“certificate has expired”

如之前未使用过uni-app，那请重头学起。uni-app官网

如了解uni-app，但未使用过uniCloud。请参考本章节继续。

首先注册开通uniCloud，登录https://unicloud.dcloud.net.cn/ ，创建一个服务空间。

在uni-app项目点右键创建uniCloud环境，关联之前创建的服务空间。

在项目下uniCloud目录右键，新建云函数

填写云函数名称，比如ai-demo。此云函数需要调用uni-cloud-ai扩展库，所以需点击添加公共模块或扩展库依赖按钮。

找到uni-cloud-ai勾选，点击确认，创建云函数

示例源码如下，请查看 pre > code 标签中的内容

如果不从客户端获取参数，直接在云函数里写messages，可以在云函数中直接按Ctrl+R（或工具栏的运行按钮），在本地运行云函数。

还可以断点调试云函数，详见uniCloud运行调试教程

注意uni-app客户端连接uniCloud不是通过uni.request。如果调用云函数是uniCloud.callFunction。（如调用云对象是uniCloud.importObject）

示例源码如下，请查看 pre > code 标签中的内容

运行客户端项目，比如运行到web浏览器，即可联调客户端和云端。

上述代码只是最简示例，真正的多轮聊天需要的代码较多较复杂，推荐使用现成的uni-ai-chat或uni-cms。

官方的uni-ai-chat、uni-cms等项目一般不使用云函数，而是使用云对象。想看懂这些项目源码，需要了解云对象

如需在非uniCloud的传统服务器调用uni-ai，需要先在uniCloud上创建一个云函数或云对象，加载uni-cloud-ai扩展库，编写上述uni-ai的调用代码。

然后将云函数或云对象进行URL化，转成http接口，详见

注意如果使用URL化后，将无法使用stream流式输出。

如果在您的传统服务器和uniCloud云函数之间需要建立安全通信机制，可使用s2s公共模块，详见

大语言模型的推理需要消耗很高的GPU算力，调用大模型需要在模型厂商处注册账户和付费。

您可以自行去大模型厂商处注册并填写相应的apiKey的参数。也可以通过DCloud来购买，即使用uni-ai计费网关。

在2023-06-15前，您不填写相关apiKey时可以免费使用uni-ai的LLM能力。但6月15日起需配置自己的apiKey或使用uni-ai计费网关，否则无法使用。

uni-ai计费网关使用门槛低，并且可以一处充值，多模型体验。您无需在多个大模型厂商处申请，只需向DCloud购买token套餐，即可体验各种大模型的效果。

uni-ai计费网关的token计费单价与大模型厂商的定价相同，支持开具发票。

uni-ai计费网关支持调用七牛云大模型服务（支持模型列表）、minimax、微软azure openai ChatGPT3.5的对话接口，调用getLLMManager时如果不传provider会默认使用minimax作为服务商。

购买uni-ai付费服务，购买流程参考：uni-ai开通流程。

调整完毕后上传依赖uni-ai的云函数/云对象即可，注意即使没有修改也需要重新上传。

在免费版停用后，如果连接云端云函数时未使用uni-ai计费网关且未自行传递key信息，且未在2023年6月15日0点后更新云函数，则会遇到token is unusable错误。如果使用在2023年6月15日0点后更新了云函数，则会提示尚未购买uni-ai套餐。

此外使用HBuilderX 3.8.4及之前的版本本地运行时无法使用uni-ai计费网关，因此也会遇到token is unusable错误。请使用云端云函数进行调试。

在您使用uni-ai计费网关后，且在云函数代码中做好配置后。您可以：

使用uni-ai计费网关时，如需本地运行需要使用HBuilderX 3.8.5及以上版本。

仅支持使用openai sdk的大模型或者AI服务商

判断要接入的大模型是否支持openai sdk调用，可以在大模型官方文档查看。

在获取getLLMManager实例时provider参数指定为openai，即可接入兼容openai响应规范的大模型。

示例源码如下，请查看 pre > code 标签中的内容

proxy参数与baseURL参数的区别：

model参数（必填）为大模型型号或者时AI服务商提供的大模型型号

示例源码如下，请查看 pre > code 标签中的内容

更多问题欢迎加入uni-ai的uni-im交流群 点此加入

**Examples:**

Example 1 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

Example 2 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

Example 3 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

Example 4 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

---

## WebSocket | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/websocket.html

**Contents:**
- # WebSocket
- # WebSocket 事件
  - # connection
  - # message
  - # disConnection
  - # error
- # 云函数 uniCloud API
  - # WebSocketServer.send
  - # WebSocketServer.close
  - # WebSocketServer.signedURL

很多情况下需要实时进行网络互动，例如游戏、通信、金融交易和其他高吞吐量活动。

WebSocket 是一种协议，可通过单个 TCP 连接在网络客户端与网络服务器之间提供全双工通信通道。WebSocket 协议使用 HTTP 协议在客户端与服务器之间建立连。

云函数WebSocket运行原理为客户端请求WebSocket网关，由WebSocket网关处理连接后转发给指定的云函数，调用云函数内不同的WebSocket事件完成事件触发与执行。

WebSocket 支持在云函数与云对象中使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用法：const ws = uniCloud.webSocketServer()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在云函数/云对象中生成WebSocket连接地址

在客户端没有使用 uniCloud SDK 时，可以通过 URL 化在云端生成 WebSocket 连接地址。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app-x 连接 WebSocket 说明

uni-app-x Android 需要 HBuilderX 版本 >= 4.28

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

基于开源白板工具excalidraw 实现

使用支付宝云WebSocket实现多人协作功能

**Examples:**

Example 1 (javascript):
```javascript
exports.onWebsocketConnection = function (event, context) {
    console.log("onWebsocketConnection", event, context)
}
```

Example 2 (javascript):
```javascript
exports.onWebsocketConnection = function (event, context) {
    console.log("onWebsocketConnection", event, context)
}
```

Example 3 (javascript):
```javascript
exports.onWebsocketConnection = function (event, context) {
    console.log("onWebsocketConnection", event, context)
}
```

Example 4 (javascript):
```javascript
exports.onWebsocketConnection = function (event, context) {
    console.log("onWebsocketConnection", event, context)
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/concepts/cloudfunction.html

从 HBuilderX 3.4起，新增了云函数的扩展版，云对象。

开发者无需购买、搭建服务器，只需编写代码并部署到云端即可在客户端（App/Web/小程序等）调用，同时云函数之间也可互相调用。

一个云函数的写法与一个在本地定义的 JavaScript 方法无异，代码运行在云端 Node.js 中。当云函数被客户端调用时，定义的代码会被放在 Node.js 运行环境中执行。

开发者可以如在 Node.js 环境中使用 JavaScript 一样在云函数中进行网络请求等操作，也可以使用 node_modules。

但 DCloud提供了 uniCloud对象 内置在云函数/云对象中，开发者使用更多的是 uniCloud 的 api，不了解 node 不影响开发。

HBuilderX 3.0起版本，在uniCloud/cloudfunctions目录右键创建云函数，如下：

在HBuilderX 3.4起，上述界面更新为 新建云函数/云对象。

云对象本质是对云函数的一种封装，可以对象化的方式使用云服务。

HBuilderX 3.0之前版本，项目下没有uniCloud目录，直接在cloudfunctions目录上右键、新建云函数

云函数修改后，可以本地运行。只有上传到云端，方可在云端生效。

---

## uni云开发软件版 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/software/index.html

**Contents:**
- # uni云开发软件版
- # 背景
- # 产品特征
- # 案例

uniCloud官网 自2020年推出，主打全栈+serverless云。

虽然serverless有很多优势，如弹性扩容、免运维。但很多开发者因为自身IT政策、历史资产、serverless的灵活性限制而无法使用uniCloud。

DCloud于2024年对外发布了uni云开发软件，它的产品形态变成了一个服务器软件，不再绑定serverless云，所以产品名称也去掉了cloud。开发者可以把这套软件安装在自己的服务器使用。

uni云开发软件版本质上是一个内置了uniCloud API和相关功能的定制Node Runtime。

安装好uni云开发软件版后，就可以运行uniCloud的云函数、云对象。uni-app也可以访问uni云开发软件版的服务器，实现云端一体的高效开发。

实际上DCloud的系统，很多都是运行在uni云开发软件版上的，比如 uniCloud.dcloud.net.cn 、dev.dcloud.net.cn 。

从开发工具、API、生态各维度，uni云开发软件版和serverless模式没有差别。开发者基于serverless版编写的uniCloud项目源码，可以平滑部署到软件版，前端uni-app代码、后端云函数、云对象等代码，均无需修改。

相比serverless模式，软件版多了运维的工作：

而如上工作，serverless版均无需进行，serverless版通过服务空间的概念，将云函数、云存储、云数据库、前端网页托管统一封装，开发者可一键开通所有业务。所有的运维、安全工作都由serverless云厂商处理。

相比serverless版，软件版的优势也不少：

存储方面，uni云开发软件版目前支持如下存储方案：

数据库方面，uni云开发软件版仅支持MongoDB，支持本地服务器上安装的MongoDB，也支持在云厂商购买单独的MongoDB实例。

未来serverless版升级后，软件版也会升级

综上，可见uni云开发软件版的适用的开发者是：

所以，uni云开发软件版仅面向企业开发者销售。售价详见

---

## 云对象 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cloud-obj

**Contents:**
- # 云对象
- # 背景和优势
- # 快速上手
  - # 创建云对象
  - # 客户端调用
- # 云对象的API
  - # 获取客户端信息
  - # 获取云端信息
  - # 获取客户端token
  - # 获取当前调用的方法名

20年前，restful接口开发开始流行，服务器编写接口，客户端调用接口，传输json。

云对象，服务器编写API，客户端调用API，不再开发传输json的接口。思路更清晰、代码更精简。

比如服务端编写一个云对象todo，该对象有add、get、remove、update等方法。客户端的js则可以直接import这个todo云对象，直接调用add等方法。

HBuilderX中在uniCloud/cloudfunctions目录新建云函数，选择类型为云对象，起名为todo。打开云对象入口index.obj.js，添加一个add方法。

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个todo对象，调用它的add方法

示例源码如下，请查看 pre > code 标签中的内容

可以看到云对象的代码非常清晰，代码行数也只有33行。

而同样的逻辑，使用传统的接口方式则需要更多代码，见下：

示例源码如下，请查看 pre > code 标签中的内容

以上传统开发需要68行代码，对比云对象的33行代码，不但工作量大，而且逻辑也不如云对象清晰。

_注：以上例子仅用于方便初学者理解。实际开发中对于简单的数据库操作，使用clientDB在前端直接操作数据库是更简单、代码更少的方案，都不需要写云端代码。

云对象，其实是对云函数的封装。和创建云函数一样，在uniCloud/cloudfunctions目录右键新建云函数，选择云对象类型，输入云对象名称创建云对象，此处以云对象todo为例，创建的云对象包含一个index.obj.js。

示例源码如下，请查看 pre > code 标签中的内容

默认云对象模板是不包含任何方法的，我们为此对象添加一个add方法作为示例。

示例源码如下，请查看 pre > code 标签中的内容

至此云对象todo已经有了一个可以访问的方法了。接下来看如何使用客户端调用此云对象内的方法

客户端通过uniCloud.importObject方法获取云对象的实例，并可以通过此实例调用云对象内的方法。用法如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

实际业务中需要考虑错误捕获，调用方式有两种：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

云对象作为云函数的一种，可以调用所有node的API和uniCloud的API。

uniCloud有众多API，另见：uniCloud的API清单

除上述API之外，云对象的this对象还有一批专用方法来获取当前请求的上下文信息。

与云函数入参时的context不同，云对象没有context。它通过this对象挂载的几个内置方法来获取上下文信息。请注意开发者避免在this上挂载同名方法。

HBuilderX 3.4.9起此接口可获取所有客户端getSystemInfo返回的客户端信息，完整字段列表参考：getSystemInfo

示例源码如下，请查看 pre > code 标签中的内容

getClientInfo返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

getClientInfo().source，返回云函数调用来源，它的值域为：

示例源码如下，请查看 pre > code 标签中的内容

云对象自动管理uni-id的token。开发者无需手动管理。如果不了解uni-id，请参考

示例源码如下，请查看 pre > code 标签中的内容

获取的token是一个加密的字符串，如需解开token，拿到用户的uid、role、permission，则需要导入 uni-id-common 公共模块调用 checkToken 方法。详见

本方法主要用于在_before等拦截器方法里，判断客户端上传的信息进行处理，比如发现客户端调用的是a方法时，执行一段特殊逻辑。详见下文的预处理。

示例源码如下，请查看 pre > code 标签中的内容

在云对象的普通方法里，参数可以直接获取。本方法主要用于在__before等拦截器方法里，判断客户端上传的信息进行处理。详见下文的预处理。

示例源码如下，请查看 pre > code 标签中的内容

this.getUniCloudRequestId()

示例源码如下，请查看 pre > code 标签中的内容

仅可在云对象url化时使用，如何使用云对象的url化请参考：云对象url化

示例源码如下，请查看 pre > code 标签中的内容

httpInfo为集成请求格式的对象，结构如下

示例源码如下，请查看 pre > code 标签中的内容

使用GET请求https://${云对象Url化域名}/${触发路径}/${云对象方法名}?a=1&b=2，云对象接收到的event为

示例源码如下，请查看 pre > code 标签中的内容

使用POST请求https://${云对象Url化域名}/${触发路径}/${云对象方法名}，云对象接收到的event.body为请求发送的数据，uni.request默认content-type为application/json

示例源码如下，请查看 pre > code 标签中的内容

注意：所有_开头的方法都是私有方法，客户端不可访问。也就是客户端调用云对象时不能调用_开头的方法。

目前有3个内置特殊方法：_before、_after、_timing

云对象内可以创建一个特殊的方法_before，用来在调用常规方法之前进行预处理，一般用于拦截器、统一的身份验证、参数校验等。

以下示例的逻辑是，当客户端调用todo云对象的add方法时，会先执行_before方法中的逻辑，判断为add方法时校验了客户端token，校验失败则直接报错返回客户端，校验通过继续执行add方法。

示例源码如下，请查看 pre > code 标签中的内容

与预处理_before对应的是后处理_after。云对象内可以创建一个特殊的方法_after用来再加工处理本次调用方法的返回结果或者抛出的错误

示例源码如下，请查看 pre > code 标签中的内容

在 uniCloud web控制台可以配置定时任务。给一个云对象配置后，将定时执行该云对象的内置方法 _timing

云对象返回给客户端的数据，包括正常数据和错误对象。

理论上，开发者可以使用任意方式返回正确状态下的数据格式，返回字符串、json对象都可以。

但在错误处理时，推荐使用uniCloud响应体规范，以方便客户端统一拦截错误。

在云对象内部报错时，比如方法名错误等非开发者代码返回的错误，会自动使用uniCloud响应体规范抛出错误对象。

开发者代码在主动报错时，比如参数校验错误，由于不能直接写入错误对象（e），则需要按照uniCloud响应体规范在返回的json对象中加入errCode和errMsg。

uni-app框架在拿到云对象的响应结果后，会识别其中是否包含errCode和errMsg，然后自动创建报错对象（e），策略如下：

也就是说，开发者的前端代码调用云对象时，需要try catch或者then catch。不报错时，在try里或then()的res里直接返回结果，报错时在catch (e) {}里拿到错误对象e。

不管是系统错误（如网络问题、云函数超时问题），还是开发者业务上的反馈错误，都如此，都是在 catch 中捕获错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

客户端通过uniCloud.importObject方法获取云对象的实例。用法如下

示例源码如下，请查看 pre > code 标签中的内容

云函数或云对象内也可以调用同一服务空间内的云对象，用法和客户端调用云对象一致

示例源码如下，请查看 pre > code 标签中的内容

当需要外部系统访问云对象时，可以把云对象封装成一个HTTP的URL。详细用法参考：云对象使用url化

云端或者客户端均有uniCloud.init方法可以获取其他服务空间的uniCloud实例，使用此实例的importObject可以调用其他服务空间的云对象，参考

客户端无论腾讯、阿里或支付宝均支持。云端uniCloud.init方法仅腾讯、支付宝云支持，且仅能获取同账号下的腾讯、支付宝云服务空间的uniCloud实例。

示例源码如下，请查看 pre > code 标签中的内容

一个云对象导出的不同方法之间不能互相调用。比如下面示例中 tryAddTodo 方法内部无法调用 addTodo 方法。

只能将多个方法共享的逻辑放到云对象导出的对象外部来供云对象的方法调用。例如下面抽离公共函数 pureAddTodo ：

示例源码如下，请查看 pre > code 标签中的内容

由于传输层还有上下文环境信息，所以开发者给云对象发送参数时需注意控制参数体积

新增于 HBuilderX 3.4.6，本次调整属于非兼容更新。

背景：每次写客户端联网的代码时，开发者都免不了重复写一堆代码：先调用loading等待框，联网结束后再关闭loading，如果服务器异常则弹出提示。

从HBuilderX 3.4.6起，调用云对象的方法时，默认会自动显示交互/提示界面。

如果默认显示的UI不符合你的需求，你可以通过配置自定义一些交互内容，也可以直接关闭自动显示的交互界面。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX中所有js方法都支持jsdoc+的语法提示系统。

在方法的开头通过/**输入特定格式的注释，在调用这个云对象的方法时就可以看到参数提示。

示例源码如下，请查看 pre > code 标签中的内容

DCloud官方开发了 uni-id-co，这是一个较为复杂的云对象，用于搭配 uni-id-pages 实现云端一体的用户注册登录等功能。该代码开源，可以参考。

uniCloud的服务器和客户端交互，有云函数、云对象、clientDB三种方式。

从云对象发布后，不再推荐使用传统云函数了。

如果是以数据库操作为主，则推荐使用clientDB，开发效率是最高的。

如果服务器端不操作数据库外，或者还有复杂的、不宜公开在前端的逻辑，此时推荐使用云对象。

**Examples:**

Example 1 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

Example 2 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

Example 3 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

Example 4 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

---

## uni云开发软件版 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/software

**Contents:**
- # uni云开发软件版
- # 背景
- # 产品特征
- # 案例

uniCloud官网 自2020年推出，主打全栈+serverless云。

虽然serverless有很多优势，如弹性扩容、免运维。但很多开发者因为自身IT政策、历史资产、serverless的灵活性限制而无法使用uniCloud。

DCloud于2024年对外发布了uni云开发软件，它的产品形态变成了一个服务器软件，不再绑定serverless云，所以产品名称也去掉了cloud。开发者可以把这套软件安装在自己的服务器使用。

uni云开发软件版本质上是一个内置了uniCloud API和相关功能的定制Node Runtime。

安装好uni云开发软件版后，就可以运行uniCloud的云函数、云对象。uni-app也可以访问uni云开发软件版的服务器，实现云端一体的高效开发。

实际上DCloud的系统，很多都是运行在uni云开发软件版上的，比如 uniCloud.dcloud.net.cn 、dev.dcloud.net.cn 。

从开发工具、API、生态各维度，uni云开发软件版和serverless模式没有差别。开发者基于serverless版编写的uniCloud项目源码，可以平滑部署到软件版，前端uni-app代码、后端云函数、云对象等代码，均无需修改。

相比serverless模式，软件版多了运维的工作：

而如上工作，serverless版均无需进行，serverless版通过服务空间的概念，将云函数、云存储、云数据库、前端网页托管统一封装，开发者可一键开通所有业务。所有的运维、安全工作都由serverless云厂商处理。

相比serverless版，软件版的优势也不少：

存储方面，uni云开发软件版目前支持如下存储方案：

数据库方面，uni云开发软件版仅支持MongoDB，支持本地服务器上安装的MongoDB，也支持在云厂商购买单独的MongoDB实例。

未来serverless版升级后，软件版也会升级

综上，可见uni云开发软件版的适用的开发者是：

所以，uni云开发软件版仅面向企业开发者销售。售价详见

---

## 开发指南 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-rpia/mobile-verify/dev.html

**Contents:**
- # 开发指南
- # 添加 uni-cloud-verify 扩展库依赖
- # API
  - # 获取uni认证管理对象
  - # 响应公共字段
  - # 获取手机号二要素认证结果
  - # 获取手机号三要素（简版）认证结果
  - # 获取手机号三要素认证（详版）结果
- # 外部系统通过http方式调用接口

在需要调用此API的云函数或云对象右键，添加依赖

勾选 uni-cloud-verify 扩展库依赖

云端在操作前，需要先获取 uniVerifyManager 对象实例，然后再通过 uniVerifyManager.xxx 调用对应的API

示例源码如下，请查看 pre > code 标签中的内容

你可以在调用 uniVerifyManager.mobile2EleVerify 前执行一些自己的业务逻辑，判断用户是否有权限执行此API等等

示例源码如下，请查看 pre > code 标签中的内容

响应字段如下，响应通用字段已省略，详细见响应公共字段

示例源码如下，请查看 pre > code 标签中的内容

你可以在调用 uniVerifyManager.mobile3EleVerify 前执行一些自己的业务逻辑，判断用户是否有权限执行此API等等

示例源码如下，请查看 pre > code 标签中的内容

响应字段如下，响应通用字段已省略，详细见响应公共字段

示例源码如下，请查看 pre > code 标签中的内容

接口名：mobile3EleVerifyPro

你可以在调用 uniVerifyManager.mobile3EleVerifyPro 前执行一些自己的业务逻辑，判断用户是否有权限执行此API等等

手机号三要素认证（详版）比手机号三要素认证（简版）在响应参数 reasonType 上有区别，以下是详版专属返回的类型

因此详版优势为：在认证不一致时，会有更多的提示信息，方便用户排查问题。

示例源码如下，请查看 pre > code 标签中的内容

响应字段如下，响应通用字段已省略，详细见响应公共字段

示例源码如下，请查看 pre > code 标签中的内容

在弹窗的窗口中选择云对象，输入名称 uni-cloud-verify-co

示例源码如下，请查看 pre > code 标签中的内容

注意：请修改变量apiKey的值为你的通讯密钥

如果你自己有更好的安全验证逻辑，可自行修改 _before 内的逻辑

示例源码如下，请查看 pre > code 标签中的内容

假设复制的路径是：https://xxxxxxxxxx.next.bspapp.com/http/uni-cloud-verify-co

请求手机号三要素认证（简版）的完整http请求地址为：

示例源码如下，请查看 pre > code 标签中的内容

请求手机号三要素认证（详版）的完整http请求地址为：

示例源码如下，请查看 pre > code 标签中的内容

请求手机号二要素认证的完整http请求地址为：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
const uniVerifyManager = uniCloud.getUniVerifyManager({
	provider: "univerify"
});
```

Example 2 (css):
```css
const uniVerifyManager = uniCloud.getUniVerifyManager({
	provider: "univerify"
});
```

Example 3 (css):
```css
const uniVerifyManager = uniCloud.getUniVerifyManager({
	provider: "univerify"
});
```

Example 4 (css):
```css
const uniVerifyManager = uniCloud.getUniVerifyManager({
	provider: "univerify"
});
```

---

## 使用场景 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/http.html

**Contents:**
- # 使用场景
- # 操作步骤
  - # 设置云函数 HTTP 访问地址
  - # 绑定自定义域名
    - # 阿里云自定义域名备用抗DDoS CNAME
- # 普通云函数
  - # 通过 HTTP URL 方式访问云函数
  - # 云函数的入参
  - # 云函数url化返回值
- # 云对象使用url化

云函数/云对象URL化 是 uniCloud 为开发者提供的 HTTP 访问服务，让开发者可以通过 HTTP URL 方式访问到云函数或云对象。

云函数自上线就支持URL化。云对象的URL化需HBuilderX 3.5.2+。下文除非特别提到云对象，否则云函数通指普通云函数和云对象。

本文档主要指导您如何在uniCloud web控制台管理和使用云函数URL化。

如果配置某云函数路径为/test，实际访问/test、/test/a、/test/b都会执行此云函数，在云函数内可以使用event.path区分访问来源

2021年5月25日起腾讯云绑定域名CNAME记录值由默认域名调整为腾讯云给定的CNAME域名，已经绑定正常使用的域名无需调整

其中CNAME的值腾讯云需要绑定成功后才能获取到，获取到之后将绑定域名的CNAME解析配置为该记录值。阿里云及支付宝云绑定前便可以获取到CNAME，需先配置解析然后操作绑定。

如需要更高的QPS支持，请发邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。若您还没有SSL证书，点此快速获取

申请证书时通常会有下载选项，下载到证书之后找到对应Nginx的证书（包含一个crt文件和一个key文件或者一个pem文件和一个key文件），以文本形式打开crt/pem文件即可看到证书内容，同样的key文件对应着私钥。其他情况请查阅证书颁发者文档。

在腾讯云申请的ssl证书包含一个crt文件和一个key文件，crt的文本内容为证书内容，key文件的内容为私钥

在阿里云申请的ssl证书包含一个pem文件和一个key文件，pem的文本内容为证书内容，key文件的内容为私钥

阿里云callFunction及url化默认域名的网关均具备抗DDoS攻击功能。但阿里云绑定自定义域名后分配的fc-${SpaceID}-custom.next.bspapp.com含有动态服务空间ID的CNAME不具备抗DDoS攻击功能。

因此阿里云提供了备用的CNAME，地址为：ddos-http-custom.next.bspapp.com。该CNAME适用于所有阿里云服务空间，如果域名解析到该地址，则ur化地址具备抗DDoS攻击功能，但该CNAME仅支持5080（http协议）、50443（https协议）两个端口。

举例说明，假如服务空间云函数绑定了test.xxx.com域名，并将该域名的CNAME解析配置到ddos-http-custom.next.bspapp.com，则访问该自定义域名url化接口地址时需指定端口。比如空间某个函数的url化触发path设置为request-test，访问时需携带端口，如：http://test.xxx.com:5080/request-test或https://test.xxx.com:50443/request-test，上述两个地址分别对应http及https访问的路径。

通过https://${云函数Url化域名}/${path}直接访问函数，其中${path}是配置的函数触发路径或其子路径。

使用 HTTP 访问云函数时，HTTP 请求会被转化为特殊的结构体，称之为集成请求，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用GET请求https://${云函数Url化域名}/${functionPath}?a=1&b=2，云函数接收到的event为

示例源码如下，请查看 pre > code 标签中的内容

使用POST请求https://${云函数Url化域名}/${functionPath}，云函数接收到的event.body为请求发送的数据，uni.request默认content-type为application/json

示例源码如下，请查看 pre > code 标签中的内容

云对象使用url化配置仍需按照上文的操作步骤来，参考：url化操作步骤

调用url化的云对象时，以url化路径/云对象方法名形式的链接访问云对象的方法。例如：云对象配置的触发路径是/todo，调用/todo/addTodo即会触发云对象的addTodo方法。方法区分大小写且不可含/。

2022年11月11日之前，访问路径只能以方法名结尾，在此时间之后调整为，允许使用多段路径访问云对象方法。仍以上述配置为例，/todo/addTodo/self和/todo/addTodo/group都会调用云对象的addTodo方法。

url内query部分会被转换成云对象方法的入参。以下面的todo云对象为例

示例源码如下，请查看 pre > code 标签中的内容

如果通过https://xxx.com/todo/addTodo?title=todo-title&content=todo-content调用云对象，todo方法内的console.log会输出以下内容{title: 'todo-title', content: 'todo-content'}

需要注意的是自url内解析出的参数均为字符串类型。

云函数、云对象可以返回string、object、number等类型的数据，或者返回 集成响应，uniCloud会将返回值转化为正常的 HTTP 响应。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回的Object会被转换为 JSON，同时 HTTP 响应的content-type会被设置为 application/json：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

云函数可以返回如下这样特殊结构的集成响应，来自由地控制响应体：

示例源码如下，请查看 pre > code 标签中的内容

headers内可以返回传统服务器的所有响应头，包括Set-Cookie、Content-Type等

将content-type设置为text/html，即可在body中返回 HTML，会被浏览器自动解析：

阿里云默认域名无法返回html并在浏览器中展示，只可以触发下载（无法修改Content-Disposition）。绑定自定义域名无此限制

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将content-type设置为application/javascript，即可在body中返回 JavaScript 文件：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果返回体是诸如图片、音视频这样的二进制文件，那么可以将isBase64Encoded设置为true，并且将二进制文件内容转为 Base64 编码的字符串，例如：

示例源码如下，请查看 pre > code 标签中的内容

最终 HTTP 响应为一张 PNG 图片：

示例源码如下，请查看 pre > code 标签中的内容

如需重定向或返回4xx，5xx等自定义状态码等，可以使用如下方式

注意：阿里云默认域名不支持在返回的header里面使用location，绑定自定义域名能正常使用

示例源码如下，请查看 pre > code 标签中的内容

在某些场景下，cookie依然占有重要地位，例如在云函数URL化的情况下，获取客户端的状态

在云函数中使用cookie需要依赖cookie库npm页面地址 ，可以通过npm install cookie 安装

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

Example 2 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

Example 3 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

Example 4 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

---

## 云函数公用模块 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-common.html

**Contents:**
    - # 云函数公用模块

云函数支持公共模块。多个云函数的共享部分，可以抽离为公共模块，然后被多个云函数引用。

示例源码如下，请查看 pre > code 标签中的内容

仍以上面的目录为例，在公用模块内exports，在云函数内require即可。示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果仅需要导出一个function还可以使用以下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

Example 2 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

Example 3 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

Example 4 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

---

## 云函数API | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/sms/dev.html

**Contents:**
  - # 云函数API
    - # 云函数使用短信扩展库
    - # 参数templateId说明
    - # 返回值
    - # 错误码说明
    - # 调用示例
  - # 发送失败注意
- # 群发短信
- # 常见问题
- # 关于短信签名实名资质信息完善提醒

自HBuilderX 3.3.0起，本接口支持传入phoneList参数批量发送短信，其他参数均于发送单条短信相同

自HBuilderX 3.4.0起云函数需启用扩展库uni-cloud-sms之后才可以调用sendSms接口，详细说明见：云函数使用短信扩展库

自HBuilderX 2.8.1起，uniCloud内置了短信发送API。给开发者提供更方便、更便宜的短信发送能力。

该服务类似小程序的模板消息，在一个固定模板格式的文字里自定义某些字段，而不是所有文字都可以随便写。

使用本功能需要在uniCloud控制台 开通并充值，教程参考短信服务开通指南

因涉及费用，为保障安全，本能力应该在云函数中调用，而不是在前端调用。

云函数API名称：uniCloud.sendSms

自HBuilderX 3.4.0起，短信相关功能移至扩展库uni-cloud-sms内。在一段时间内无论开发者是否使用扩展库云函数都可以正常使用uniCloud.sendSms。HBuilderX 3.4.0及之后的版本上传云函数时如果没有指定使用uni-cloud-sms扩展库的云函数将无法调用uniCloud.sendSms接口。

在云函数的package.json内添加uni-cloud-sms的引用即可为云函数启用此扩展，无需做其他调整，完整的package.json示例如下：

示例源码如下，请查看 pre > code 标签中的内容

按照国家法律和运营商要求，每个要发送短信的应用，需要备案其短信模板，并且经过运营商的审核。通过审核的模板，会得到一个templateId。

短信签名： 即短信内容开头的【xxx】，可选内容为App或小程序名称、网站名称、企业名称（可使用简称，但需具备辨识度）、商标名称。如【DCloud】，即是DCloud官方发送短信的签名。签名的作用是明确告知用户该短信由什么样的主体发送。签名内容只允许包含中文、英文、数字，签名的长度限制为2-8位。

模板内容： 短信模板必然以短信签名作为开头，其内容中允许有一定的变量，以满足灵活性需求。变量用${}包裹。

例如：【hello uni-app】验证码：${code}，${expMinute}分钟内有效，请勿泄露并尽快验证。

在实际发送短信时，在短信API中传入该模板ID，然后传入合适的变量，最终发送的短信将变为： 【hello uni-app】验证码：123465，用于注册，15分钟内有效，请勿泄露并尽快验证。

运营商目前审核比较严格，处于开发阶段的应用可能无法通过运营商的审核。为方便开发者测试短信功能，DCloud 提供了一个测试模板，该模板的templateId为：uni_sms_test，内容为：【统一应用软件】尊敬的用户，您的验证码是：${code}。5分钟内有效，请尽快验证。请勿泄漏您的验证码。

接口调用失败时会直接抛出错误，调用成功时才会有返回值。

注意接口调用成功不代表短信发送成功，比如目标手机关机会导致短信发送失败。真实的短信发送成功与否请在uniCloud控制台-短信服务-发送记录 查看发送记录。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如有客户关怀、会员服务、电商活动、新品上线等场景需要给用户发送短信时，通过uni-admin群发短信功能，无需开发，及时送达用户。 群发短信配置

支持给用户打标签分组，按照分组群发短信，可以同时给多个分组群发 短信模板变量支持从数据库表字段中读取 发送前预览短信内容；防止内容错误，提高发送成功率

发送短信方法(uniCloud.sendSms) 遇到的常见的错误

更多问题：欢迎加入DCloud短信技术交流群咨询。

根据工信部及各级运营商最新要求，短信内容提供者需报备相关资质信息。若短信签名与企业资质主体无关联，新申请的签名将被运营商驳回，存量签名也可能面临审核并被强制下线。

平台正在进行存量签名合规性核查，如您的短信签名不符合上述规范，请尽快补充相关资质信息。

**Examples:**

Example 1 (json):
```json
{
	"name": "uni-sms",
	"extensions": {
		"uni-cloud-sms": {} // 启用短信扩展，值为空对象即可
	}
}
```

Example 2 (json):
```json
{
	"name": "uni-sms",
	"extensions": {
		"uni-cloud-sms": {} // 启用短信扩展，值为空对象即可
	}
}
```

Example 3 (json):
```json
{
	"name": "uni-sms",
	"extensions": {
		"uni-cloud-sms": {} // 启用短信扩展，值为空对象即可
	}
}
```

Example 4 (json):
```json
{
	"name": "uni-sms",
	"extensions": {
		"uni-cloud-sms": {} // 启用短信扩展，值为空对象即可
	}
}
```

---

## 开发指南 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-mongodb/dev.html

**Contents:**
- # 开发指南
- # 在项目中启用扩展数据库
  - # 查看手动升级HBuilderX教程
  - # 设置云函数Nodejs版本教程
  - # 云函数/云对象操作步骤
  - # 验证扩展数据库是否已生效
- # API
  - # 切换数据库实例
  - # 切换数据库
  - # 切换数据库实例和库

扩展数据库作为uniCloud的一个扩展库，使用时需要在云函数或者云对象中启用。

手动升级 HBuilderX 可享受最新开发版功能，具体操作如下：

云函数设置的Node.js版本需要 ≥ Nodejs16，推荐使用Nodejs18

打开云函数根目录的 package.json 文件，添加以下配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在云函数或云对象中使用扩展数据库，需要进行如下操作：

注意：所有需要使用扩展数据库的云函数/云对象都要重复上面的 1-3 步骤

右键 database 目录，初始化云数据库，如果有如下弹窗出现，且扩展数据库的id和库名正确，代表已生效

扩展数据库已包含内置数据库 拥有的所有API，并且还拥有以下特殊API

注意：需要先在扩展数据库控制台授权空间后，此空间才能使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uniCloud.databaseForNative(options: Options): Promise<Db>

Db 实例是 MongoDB 的数据库对象，提供了对数据库的操作方法。 详细的 API 参考 MongoDB Db Class

示例源码如下，请查看 pre > code 标签中的内容

在首次向不存在的集合中插入数据时，MongoDB 会隐式创建集合。如果要显式创建集合，可以使用 createCollection 方法。

db.createCollection(name: string, options?: CreateCollectionOptions): Promise<Collection>

CreateCollectionOptions

示例源码如下，请查看 pre > code 标签中的内容

db.listCollections(filter?: Document, options?: ListCollectionsOptions): ListCollectionsCursor

ListCollectionsOptions

ListCollectionsCursor

ListCollectionsCursor 是一个游标对象，用于遍历集合列表。它提供了多种方法来处理查询结果，例如 toArray()、forEach() 等。

其他方法和属性可以参考 ListCollectionsCursor

示例源码如下，请查看 pre > code 标签中的内容

collection.createIndex(indexSpec: IndexSpecification, options?: CreateIndexesOptions): Promise<string>

IndexSpecification 是一个对象，定义了索引的字段和排序方式。它的键是要索引的字段名，值是排序方式（1 表示升序，-1 表示降序，2dsphere 表示地理空间索引，2d 表示二维索引等）。

示例源码如下，请查看 pre > code 标签中的内容

collection.listIndexes(options?: ListIndexesOptions): ListIndexesCursor

示例源码如下，请查看 pre > code 标签中的内容

API collection.dropIndex(indexName: string, options?: CommandOperationOptions): Promise<Document>

CommandOperationOptions

示例源码如下，请查看 pre > code 标签中的内容

collection.dropIndexes(options?: CommandOperationOptions): Promise<boolean>

CommandOperationOptions

示例源码如下，请查看 pre > code 标签中的内容

进入uniCloud控制台 ，进入扩展数据库首页

选择对应的数据库，进入详情后，再点击左侧菜单-空间授权管理

进入扩展数据库详情页，点击左侧菜单-性能监控

进入扩展数据库详情页，点击左侧菜单-慢日志查询

注意：扩展数据库没有慢日志限流，此处显示慢日志是为了方便你优化数据库代码，提升系统响应速度

进入扩展数据库详情页，点击左侧菜单-参数设置

进入扩展数据库详情页，点击左侧菜单-IP白名单设置

进入扩展数据库详情页，点击左侧菜单-成员管理，如下图所示

目前各家云中，只有阿里云的数据库API会多返回一个 affectedDocs 字段，比如执行下面的语句

示例源码如下，请查看 pre > code 标签中的内容

该语句执行完后，result 的值在阿里云空间分别为

示例源码如下，请查看 pre > code 标签中的内容

而在其他云空间 result 值为（包括扩展数据库）

示例源码如下，请查看 pre > code 标签中的内容

故建议不要在阿里云空间使用 affectedDocs 字段，这样代码才具备通用性，如果你在项目中使用了 affectedDocs 字段，则需要等价替换为 deleted、updated、data.length

不需要修改，只需要关联扩展数据库的扩展库，并重新上传云函数和JQL的JS扩展即可，详情见在项目中启用扩展数据库

特别注意： 只有阿里云、腾讯云空间的内置数据库可按下方步骤导出导入数据，如果是支付宝云空间，请进入扩展数据库技术交流群 协助迁移数据

进入内置数据库控制台，选择表，点导出，然后使用扩展数据库的数据库可视化管理工具，将导出的json文件导入即可，具体操作如下：

打开 MongoDB Compass 数据库可视化管理工具，选择对应的库，再选择对应的表，没有表就新建表，关于 MongoDB Compass 的操作帮助请点击查看

选择对应的表后，再按下图所示导入第1步导出的JSON文件即可。

**Examples:**

Example 1 (json):
```json
"cloudfunction-config": {
  ...你的其他配置
  "runtime": "Nodejs18",
}
```

Example 2 (json):
```json
"cloudfunction-config": {
  ...你的其他配置
  "runtime": "Nodejs18",
}
```

Example 3 (json):
```json
"cloudfunction-config": {
  ...你的其他配置
  "runtime": "Nodejs18",
}
```

Example 4 (json):
```json
"cloudfunction-config": {
  ...你的其他配置
  "runtime": "Nodejs18",
}
```

---

## 云函数内使用JQL | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql-cloud

**Contents:**
- # 云函数内使用JQL
- # 为云函数添加jql扩展库
- # 云函数中使用
- # 云对象中使用
- # setUser指定用户身份
- # 与clientDB的差异
- # 注意事项

对于不适合在前端暴露的数据库操作，过去只能在云函数中使用传统MongoDB语法。此次更新让云函数也可以使用 JQL 来操作数据库。

相比于传统 MongoDB语法，JQL 为云函数带来如下价值：

本文主要讲解云函数中如何使用 JQL 。详细的 JQL 语法另见文档：JQL数据库操作

JQL 操作的引擎代码体积不小，考虑到有的云函数并不操作数据库或不使用JQL，所以相关功能被剥离在uni-cloud-jql扩展库中。

HBuilderX 3.4起，新建云函数/云对象，默认加载uni-cloud-jql扩展库。对于老云函数，也可以对云函数点右键 -> 管理公共模块或扩展库依赖 -> 选择uni-cloud-jql

HBuilderX 3.4以前的开发者，需要在云函数的package.json内手动添加扩展库。（如果云函数目录下没有package.json，可以通过在云函数目录下执行npm init -y来生成）

下面是一个开启了jql扩展库的云函数的package.json示例，注意不可有注释，以下文件内容中的注释仅为说明，如果拷贝此文件，切记去除注释

示例源码如下，请查看 pre > code 标签中的内容

对于确定在云函数/云对象中不需要使用 JQL 扩展库的，请对云函数右键，取消uni-cloud-jql扩展库。这样可以减少云函数体积，提高性能。

uniCloud.databaseForJQL方法，传入客户端信息，就可以得到一个JQL数据库操作对象。

示例源码如下，请查看 pre > code 标签中的内容

云对象中无法获取event和context，为方便在云对象中使用jql扩展，自HBuilderX 3.4.10起，uniCloud.databaseForJQL方法接收云对象clientInfo作为参数

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，jql扩展使用的是客户端的身份，准确的说是客户端的uniIdToken对应的用户作为执行数据库操作的用户。

如需在云函数/云对象中指定执行其他用户身份，需使用setUser方法

setUser方法的参数是一个对象，可传入uni-id的uid、role、permission，组合生效。

示例源码如下，请查看 pre > code 标签中的内容

虽然都使用 JQL，但云端和客户端还是有一点区别

**Examples:**

Example 1 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

Example 2 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

Example 3 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

Example 4 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

---

## 使用场景 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/http

**Contents:**
- # 使用场景
- # 操作步骤
  - # 设置云函数 HTTP 访问地址
  - # 绑定自定义域名
    - # 阿里云自定义域名备用抗DDoS CNAME
- # 普通云函数
  - # 通过 HTTP URL 方式访问云函数
  - # 云函数的入参
  - # 云函数url化返回值
- # 云对象使用url化

云函数/云对象URL化 是 uniCloud 为开发者提供的 HTTP 访问服务，让开发者可以通过 HTTP URL 方式访问到云函数或云对象。

云函数自上线就支持URL化。云对象的URL化需HBuilderX 3.5.2+。下文除非特别提到云对象，否则云函数通指普通云函数和云对象。

本文档主要指导您如何在uniCloud web控制台管理和使用云函数URL化。

如果配置某云函数路径为/test，实际访问/test、/test/a、/test/b都会执行此云函数，在云函数内可以使用event.path区分访问来源

2021年5月25日起腾讯云绑定域名CNAME记录值由默认域名调整为腾讯云给定的CNAME域名，已经绑定正常使用的域名无需调整

其中CNAME的值腾讯云需要绑定成功后才能获取到，获取到之后将绑定域名的CNAME解析配置为该记录值。阿里云及支付宝云绑定前便可以获取到CNAME，需先配置解析然后操作绑定。

如需要更高的QPS支持，请发邮件到service@dcloud.io申请，邮件模板参考：申请解除限制邮件模板。若您还没有SSL证书，点此快速获取

申请证书时通常会有下载选项，下载到证书之后找到对应Nginx的证书（包含一个crt文件和一个key文件或者一个pem文件和一个key文件），以文本形式打开crt/pem文件即可看到证书内容，同样的key文件对应着私钥。其他情况请查阅证书颁发者文档。

在腾讯云申请的ssl证书包含一个crt文件和一个key文件，crt的文本内容为证书内容，key文件的内容为私钥

在阿里云申请的ssl证书包含一个pem文件和一个key文件，pem的文本内容为证书内容，key文件的内容为私钥

阿里云callFunction及url化默认域名的网关均具备抗DDoS攻击功能。但阿里云绑定自定义域名后分配的fc-${SpaceID}-custom.next.bspapp.com含有动态服务空间ID的CNAME不具备抗DDoS攻击功能。

因此阿里云提供了备用的CNAME，地址为：ddos-http-custom.next.bspapp.com。该CNAME适用于所有阿里云服务空间，如果域名解析到该地址，则ur化地址具备抗DDoS攻击功能，但该CNAME仅支持5080（http协议）、50443（https协议）两个端口。

举例说明，假如服务空间云函数绑定了test.xxx.com域名，并将该域名的CNAME解析配置到ddos-http-custom.next.bspapp.com，则访问该自定义域名url化接口地址时需指定端口。比如空间某个函数的url化触发path设置为request-test，访问时需携带端口，如：http://test.xxx.com:5080/request-test或https://test.xxx.com:50443/request-test，上述两个地址分别对应http及https访问的路径。

通过https://${云函数Url化域名}/${path}直接访问函数，其中${path}是配置的函数触发路径或其子路径。

使用 HTTP 访问云函数时，HTTP 请求会被转化为特殊的结构体，称之为集成请求，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用GET请求https://${云函数Url化域名}/${functionPath}?a=1&b=2，云函数接收到的event为

示例源码如下，请查看 pre > code 标签中的内容

使用POST请求https://${云函数Url化域名}/${functionPath}，云函数接收到的event.body为请求发送的数据，uni.request默认content-type为application/json

示例源码如下，请查看 pre > code 标签中的内容

云对象使用url化配置仍需按照上文的操作步骤来，参考：url化操作步骤

调用url化的云对象时，以url化路径/云对象方法名形式的链接访问云对象的方法。例如：云对象配置的触发路径是/todo，调用/todo/addTodo即会触发云对象的addTodo方法。方法区分大小写且不可含/。

2022年11月11日之前，访问路径只能以方法名结尾，在此时间之后调整为，允许使用多段路径访问云对象方法。仍以上述配置为例，/todo/addTodo/self和/todo/addTodo/group都会调用云对象的addTodo方法。

url内query部分会被转换成云对象方法的入参。以下面的todo云对象为例

示例源码如下，请查看 pre > code 标签中的内容

如果通过https://xxx.com/todo/addTodo?title=todo-title&content=todo-content调用云对象，todo方法内的console.log会输出以下内容{title: 'todo-title', content: 'todo-content'}

需要注意的是自url内解析出的参数均为字符串类型。

云函数、云对象可以返回string、object、number等类型的数据，或者返回 集成响应，uniCloud会将返回值转化为正常的 HTTP 响应。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回的Object会被转换为 JSON，同时 HTTP 响应的content-type会被设置为 application/json：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

云函数可以返回如下这样特殊结构的集成响应，来自由地控制响应体：

示例源码如下，请查看 pre > code 标签中的内容

headers内可以返回传统服务器的所有响应头，包括Set-Cookie、Content-Type等

将content-type设置为text/html，即可在body中返回 HTML，会被浏览器自动解析：

阿里云默认域名无法返回html并在浏览器中展示，只可以触发下载（无法修改Content-Disposition）。绑定自定义域名无此限制

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将content-type设置为application/javascript，即可在body中返回 JavaScript 文件：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果返回体是诸如图片、音视频这样的二进制文件，那么可以将isBase64Encoded设置为true，并且将二进制文件内容转为 Base64 编码的字符串，例如：

示例源码如下，请查看 pre > code 标签中的内容

最终 HTTP 响应为一张 PNG 图片：

示例源码如下，请查看 pre > code 标签中的内容

如需重定向或返回4xx，5xx等自定义状态码等，可以使用如下方式

注意：阿里云默认域名不支持在返回的header里面使用location，绑定自定义域名能正常使用

示例源码如下，请查看 pre > code 标签中的内容

在某些场景下，cookie依然占有重要地位，例如在云函数URL化的情况下，获取客户端的状态

在云函数中使用cookie需要依赖cookie库npm页面地址 ，可以通过npm install cookie 安装

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

Example 2 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

Example 3 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

Example 4 (json):
```json
{
    path: 'HTTP请求路径，如 /hello',
    httpMethod: 'HTTP请求方法，如 GET',
    headers: {HTTP请求头},
    queryStringParameters: {HTTP请求的Query，键值对形式},
    body: 'HTTP请求体',
    isBase64Encoded: 'true or false，表示body是否为Base64编码'
}
```

---

## 计费模式 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/sms/price.html

**Contents:**
- # 计费模式
- # 资源包
- # 按量计费
- # 配套uniCloud成本

注意：资源包自购买之日起1年内有效，过期销毁资源，不支持延期和退款，建议根据业务情况，选择合适的资源包。

另外，如您有大宗采购需求，欢迎点此 沟通特价折扣。

但在实际使用中需要依赖uniCloud云服务。如使用uniCloud阿里云商业版，每条大约需要多花0.0000139元，几乎可以忽略不计。您也可以粗略认为每条短信的费用为0.0360139元/条。费用计算规则如下：

短信业务涉及费用的部分主要是云函数/云对象的使用量、调用次数、和出网流量(如：使用uni-id-co或自定义的云函数/云对象来发送短信)。 接下来，我们对不同资源，分别进行费用评估。

我们按照uniCloud官网列出的按量计费 规则，可以简单得出如下公式：

云函数/云对象费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，其短信业务云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

结论：如果你的短信业务平均每天发送条数为10000条，使用阿里云正式版云服务空间后，对应云函数每天大概消耗0.139元，对比之前的短信费用，平均每次调用多花0.0000139元，几乎可忽略不计。

特别注意：短信成功回执最长延迟为72小时。

**Examples:**

Example 1 (unknown):
```unknown
云函数费用（天） = 资源使用量 * 0.000110592  + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024)
			  = 0.110592 + 0.0133 + 0.0152587890625
			  = 0.1391507890625（元）
			  ≈ 0.139（元）
```

Example 2 (unknown):
```unknown
云函数费用（天） = 资源使用量 * 0.000110592  + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024)
			  = 0.110592 + 0.0133 + 0.0152587890625
			  = 0.1391507890625（元）
			  ≈ 0.139（元）
```

Example 3 (unknown):
```unknown
云函数费用（天） = 资源使用量 * 0.000110592  + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024)
			  = 0.110592 + 0.0133 + 0.0152587890625
			  = 0.1391507890625（元）
			  ≈ 0.139（元）
```

Example 4 (unknown):
```unknown
云函数费用（天） = 资源使用量 * 0.000110592  + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8
			  = 0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024)
			  = 0.110592 + 0.0133 + 0.0152587890625
			  = 0.1391507890625（元）
			  ≈ 0.139（元）
```

---

## 云对象（uni-id-co） | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/cloud-object.html

**Contents:**
- # 云对象（uni-id-co）
  - # 目录说明
  - # 公共响应参数
  - # 适配URL化
  - # API列表
  - # 注册登录和登出
    - # 注册超级管理员
    - # 用户名密码注册用户
    - # 邮箱验证码注册用户
    - # 密码登录

uni-id-co是uni-id-pages的核心云对象，包含了诸多用户相关的接口。作为uni-id体系的一部分，uni-id-co也使用uni-id的配置文件（cloudfunctions/common/uni-config-center/uni-id/config.json）。目前此云对象依赖了一些客户端信息，不支持被其他云函数/云对象调用。已支持url化调用，参考：uni-id-co url化

前端调用云对象uni-id-co内的方法前应先获取云对象的引用，代码如下

示例源码如下，请查看 pre > code 标签中的内容

如调用uni-id-co方法时出现找不到lodash.merge模块的错误，请手动在uni-id-co云对象目录执行npm install。如果是运行客户端的话uniCloud插件会自动给uni-id-co安装缺失的依赖。

示例源码如下，请查看 pre > code 标签中的内容

uni-id-co所有api返回值均满足uniCloud响应体规范

示例源码如下，请查看 pre > code 标签中的内容

自uni-id-pages@1.0.29版本起支持URL化 什么是URL化

示例源码如下，请查看 pre > code 标签中的内容

如果是在 uni-app 之外的应用中调用 URL 化接口，请确保clientInfo中存在以下字段:

假设已在uniCloud 控制台已设置URL化域名PATH，以PATH为/http/uni-id-co为例，演示登录示例：

示例源码如下，请查看 pre > code 标签中的内容

请不要添加 Query 参数，URL化后将忽略 Query 参数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口名：registerUserByEmail

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

两小时内登录失败3次的用户必填图形验证码，如果客户端没有使用uni-id-pages，可以参考uni-id-pages验证码登录页面的相关逻辑。

接口名：loginByWeixinMobile

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-id-pages 1.0.7及之前的版本会将微信的openid存为如下格式

示例源码如下，请查看 pre > code 标签中的内容

可以看到如果存在多个微信小程序应用连接一个uniCloud后台且关联同一个账号，此时只能存储一个小程序的openid。

在uni-id-pages 1.0.8版本对此进行了调整修正，多个DCloud Appid可以对应不同的微信openid。以Appid__UNI_123456为例，openid会在数据库内存储为以下形式：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-id-pages 1.0.7及之前的版本会将QQ的openid以以下形式存储

示例源码如下，请查看 pre > code 标签中的内容

可以看到如果存在多个QQ小程序关联同一个账号，这时候只能存储一个小程序的openid，在uni-id-pages 1.0.8版本对此进行了调整以Appid__UNI_123456为例，openid会在数据库内存储为以下形式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此登录同时允许华为账号登录及华为授权手机号登录

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

调用此接口后用户status将会设置为注销状态，需要注意的是目前token不会自动失效，后续会引入redis解决此问题。如果不需要此功能建议手动修改代码。

示例源码如下，请查看 pre > code 标签中的内容

接口名：getSupportedLoginType

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口名：bindMobileByUniverify

示例源码如下，请查看 pre > code 标签中的内容

微信小程序对获取手机号的接口进行了安全升级，自 uni-id-co@1.0.25 以上版本开始，支持getPhoneNumber事件回调的动态口令code，同时为了向下兼容保留encryptedData 与 iv参数，建议开发者升级，以增强小程序安全性。

微信小程序的规则是客户端应先使用checkSession接口检测上次获取的sessionKey是否仍有效。

如果有效则直接使用上次存储的sessionKey即可，如果无效应重新调用login接口再次刷新sessionKey。

微信小程序登录、绑定小程序微信账号时会自动更新用户的sessionKey。

接口名：bindMobileByMpWeixin

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如账号只有一个第三方登录方式时，需绑定手机号后在解绑。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口名：unbindAlipay 接口形式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口名：unbindHuawei 接口形式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在uni-id-pages中默认启用敏感数据加解密，如果开发者没有使用uni-id提供的敏感信息加密功能，请将decryptData参数改为false，返回原始信息

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如未使用uni-push 2.0无需关注此接口。此接口用于更新uni-id-device表的unipush_clientid字段，用于按客户端、用户等维度推送消息

示例源码如下，请查看 pre > code 标签中的内容

此接口用于微信小程序端安全网络的握手，安全网络相关文档请参考：安全网络

一般无需通过uniCloud.importObject方式调用，在客户端调用uniCloud.initSecureNetworkByWeixin()时会通过此接口获取会话相关信息。

此接口会将会话信息存储在opendb-open-data表内，如果在initSecureNetworkByWeixin方法内传递了callLoginByWeixin: true会在存储会话信息的同时执行一次uni-id-co的loginByWeixin方法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口名：authorizeAppLogin

示例源码如下，请查看 pre > code 标签中的内容

接口名：removeAuthorizedApp

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

适合自己有用户系统，同时需要使用依赖UniId的业务，将自身系统的用户账号导入uniId，为其创建一个对应uniId的账号，使得该账号可以使用依赖uniId的系统及功能。 由于此方案的接口不需要密码验证，开发者务必要保证接口只能在服务端调用，同时要求在请求时计算签名来保证安全。

联登相关接口只支持HTTP方式调用，调用时需要携带鉴权签名值，查看URL化请求鉴权签名计算

外部用户注册，注册成功后，uni-id 返回 uid 与 用户 token ，请务必在自身系统中维护好 uid 与 token。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

外部用户修改账号信息，如用户在自身系统内修改了用户信息后，通过此接口同步修改uni-id中用户信息。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

实人认证相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

基于实人认证服务实现，实现用户刷脸核验真实身份，完成实名认证。 uni-id-pages已内置实人认证前端页面与云端云对象，了解如在uni-id-pages中使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-id-co将validator实例挂载在云对象的this上，在uni-id-co/index.obj.js获取validator实例后可以使用validator实例的mixin方法覆盖或者新增校验规则。

接口形式：validator.mixin(String type, Function handler)。其中type为规则类型（字符串），handler为校验函数

示例源码如下，请查看 pre > code 标签中的内容

服务端uni-id的密钥信息统一在uni-config-center中配置，路径：uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json 以下简称：uni-id配置文件，完整的配置信息详情查看

一键登录是运营商提供的、比短信验证码更方便、更安全、更便宜的方案。详见 。

uni-id-pages已全面支持：app、小程序、web（uni-id-pages 版本号1.0.8起），三端的微信登录。

这里的网站应用和公众帐号都是给web应用，接入微信登录功能。但有如下区别：

如果你的应用有多端，实现同一个用户在公众号、小程序、APP、官方网站等不同场景里的身份统一识别、信息同步和行为跟踪 （详情参考：“UnionID关联”功能介绍及运营建议 ） 就需要将小程序、公众帐号绑定到同一个微信开放平台账号下。

示例代码已经在uni-id-pages插件中提供。

手机微信扫码登录 微信开放平台 -> 管理中心 -> 网站应用 -> 选择对应的应用名称，点击查看 -> 开发信息，点击修改 -> 填写授权回调域

基于微信公众号auth登录 登录微信公众号 -> 设置与开发 -> 公众号设置 -> 设置网页授权域名

回调域名，必须接入外网已经备案的URL地址，不然本地没法进行调试，你可以做内网穿透，映射生成一个外网URL地址来进行回调测试。但是那样比较麻烦，这里我们介绍一种基于HBuilderX本地启动一个Web Server进行调试的方法。

注意：mac系统中，非root用户是无法使用小于1024的常用端口的。解决方案打开终端，cd 到 HBuilderX安装目录(默认是Applications目录，执行cd /Applications)，然后执行 sudo ./HBuilderX.app/Contents/MacOS/HBuilderX 输入开机密码，再按回车，此时会以root用户权限重新打开HBuilderX；

如果没有启动80端口而是81等，说明你的端口被占用了。你有两个办法1.关闭可疑程序，或直接重启电脑 2.命令行关闭占用的端口详情查看

为了方便开发调试，uni-id-pages未配置短信登录时，自动启动测试模式；直接使用：123456作为短信验证码即可。

在HBuilderX 3.5之前，DCloud提供了一个公共模块uni-id （注意别和uni-id-common混淆）和一个示例性云函数uni-id-cf（集成在uni-starter和uni-admin中）。

老的公共模块uni-id 是一个大而全的账户管理公共模块，体积太大，不适合被其他云函数引用。比如某个业务云函数需要校验用户token，引用的uni-id公共模块还包含了忘记密码的代码，很浪费资源。

从HBuilder 3.5起，uni-id 和uni-id-cf都将被淘汰，不再更新。老的公共模块uni-id 被拆开，变成了uni-id-common公共模块和uni-id-co云对象。

uni-id-common很精简，只包括token和权限，适合被所有云函数引用。

uni-id-co则是一个更加比uni-id-cf更完善和规范的用户管理的云对象。

然后DCloud推出了uni-id-pages。

目前uni-starter和uni-admin仍然使用老版uni-id 和uni-id-cf，官方正在升级中，将其中的用户管理升级为uni-id-pages。

此次升级做了大幅改动，多数接口自公共模块中移除，改为由uni-id-co实现。仅创建token、刷新token、校验token接口保留在uni-id公共模块内。除接口调整外，uni-id体系（包含uni-id公共模块、uni-id-co）还有以下调整：

uni-id升级为uni-id-co + uni-id-common需要对个别字段进行重命名，直接运行下面的云函数即可重命名改动的字段。另外还需要修改一下索引，删除旧字段的索引，增加新字段的索引。建议在凌晨或其他低峰段操作，避免数据库操作耗时过久影响线上用户，如果有停服逻辑也可对系统短暂停服再操作。（在实际数据测试中，50000条用户记录重命名字段耗时约5秒钟）

示例源码如下，请查看 pre > code 标签中的内容

uni-id-co@1.1.10及以上版本支持使用uni-cloud-s2s进行请求签名验证，uni-cloud-s2s使用方式详见

uni-id-co请求鉴权签名与uni-cloud-s2s不能同时存在，如果存在uni-cloud-s2s，则会优先使用uni-cloud-s2s进行请求签名验证

uni-id-co 在URL化请求时，会对以下 API 进行调用鉴权验证， 在调用 API 时，开发者需要使用请求鉴权密钥（详见配置文件）requestAuthSecret按照 uni-id 的约定方式对请求中的关键数据进行签名值计算， 并将签名值添加到Header请求头的 uni-id-signature 参数中传给 uni-id 进行签名验证，uni-id 会对接收到数据进行签名值计算， 并与接收到的请求签名值进行比对，如果签名值不一致，则视为无效签名，将拒绝本次请求。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const uniIdCo = uniCloud.importObject('uni-id-co')
```

Example 2 (javascript):
```javascript
const uniIdCo = uniCloud.importObject('uni-id-co')
```

Example 3 (javascript):
```javascript
const uniIdCo = uniCloud.importObject('uni-id-co')
```

Example 4 (javascript):
```javascript
const uniIdCo = uniCloud.importObject('uni-id-co')
```

---

## 云对象 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cloud-obj.html

**Contents:**
- # 云对象
- # 背景和优势
- # 快速上手
  - # 创建云对象
  - # 客户端调用
- # 云对象的API
  - # 获取客户端信息
  - # 获取云端信息
  - # 获取客户端token
  - # 获取当前调用的方法名

20年前，restful接口开发开始流行，服务器编写接口，客户端调用接口，传输json。

云对象，服务器编写API，客户端调用API，不再开发传输json的接口。思路更清晰、代码更精简。

比如服务端编写一个云对象todo，该对象有add、get、remove、update等方法。客户端的js则可以直接import这个todo云对象，直接调用add等方法。

HBuilderX中在uniCloud/cloudfunctions目录新建云函数，选择类型为云对象，起名为todo。打开云对象入口index.obj.js，添加一个add方法。

示例源码如下，请查看 pre > code 标签中的内容

然后在客户端的js中，import这个todo对象，调用它的add方法

示例源码如下，请查看 pre > code 标签中的内容

可以看到云对象的代码非常清晰，代码行数也只有33行。

而同样的逻辑，使用传统的接口方式则需要更多代码，见下：

示例源码如下，请查看 pre > code 标签中的内容

以上传统开发需要68行代码，对比云对象的33行代码，不但工作量大，而且逻辑也不如云对象清晰。

_注：以上例子仅用于方便初学者理解。实际开发中对于简单的数据库操作，使用clientDB在前端直接操作数据库是更简单、代码更少的方案，都不需要写云端代码。

云对象，其实是对云函数的封装。和创建云函数一样，在uniCloud/cloudfunctions目录右键新建云函数，选择云对象类型，输入云对象名称创建云对象，此处以云对象todo为例，创建的云对象包含一个index.obj.js。

示例源码如下，请查看 pre > code 标签中的内容

默认云对象模板是不包含任何方法的，我们为此对象添加一个add方法作为示例。

示例源码如下，请查看 pre > code 标签中的内容

至此云对象todo已经有了一个可以访问的方法了。接下来看如何使用客户端调用此云对象内的方法

客户端通过uniCloud.importObject方法获取云对象的实例，并可以通过此实例调用云对象内的方法。用法如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

实际业务中需要考虑错误捕获，调用方式有两种：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

云对象作为云函数的一种，可以调用所有node的API和uniCloud的API。

uniCloud有众多API，另见：uniCloud的API清单

除上述API之外，云对象的this对象还有一批专用方法来获取当前请求的上下文信息。

与云函数入参时的context不同，云对象没有context。它通过this对象挂载的几个内置方法来获取上下文信息。请注意开发者避免在this上挂载同名方法。

HBuilderX 3.4.9起此接口可获取所有客户端getSystemInfo返回的客户端信息，完整字段列表参考：getSystemInfo

示例源码如下，请查看 pre > code 标签中的内容

getClientInfo返回的信息，是在客户端的uni.getSystemInfo 的基础之上，增加了一些额外的信息。

除了getSystemInfo返回字段外，还包含以下信息

getClientInfo().source，返回云函数调用来源，它的值域为：

示例源码如下，请查看 pre > code 标签中的内容

云对象自动管理uni-id的token。开发者无需手动管理。如果不了解uni-id，请参考

示例源码如下，请查看 pre > code 标签中的内容

获取的token是一个加密的字符串，如需解开token，拿到用户的uid、role、permission，则需要导入 uni-id-common 公共模块调用 checkToken 方法。详见

本方法主要用于在_before等拦截器方法里，判断客户端上传的信息进行处理，比如发现客户端调用的是a方法时，执行一段特殊逻辑。详见下文的预处理。

示例源码如下，请查看 pre > code 标签中的内容

在云对象的普通方法里，参数可以直接获取。本方法主要用于在__before等拦截器方法里，判断客户端上传的信息进行处理。详见下文的预处理。

示例源码如下，请查看 pre > code 标签中的内容

this.getUniCloudRequestId()

示例源码如下，请查看 pre > code 标签中的内容

仅可在云对象url化时使用，如何使用云对象的url化请参考：云对象url化

示例源码如下，请查看 pre > code 标签中的内容

httpInfo为集成请求格式的对象，结构如下

示例源码如下，请查看 pre > code 标签中的内容

使用GET请求https://${云对象Url化域名}/${触发路径}/${云对象方法名}?a=1&b=2，云对象接收到的event为

示例源码如下，请查看 pre > code 标签中的内容

使用POST请求https://${云对象Url化域名}/${触发路径}/${云对象方法名}，云对象接收到的event.body为请求发送的数据，uni.request默认content-type为application/json

示例源码如下，请查看 pre > code 标签中的内容

注意：所有_开头的方法都是私有方法，客户端不可访问。也就是客户端调用云对象时不能调用_开头的方法。

目前有3个内置特殊方法：_before、_after、_timing

云对象内可以创建一个特殊的方法_before，用来在调用常规方法之前进行预处理，一般用于拦截器、统一的身份验证、参数校验等。

以下示例的逻辑是，当客户端调用todo云对象的add方法时，会先执行_before方法中的逻辑，判断为add方法时校验了客户端token，校验失败则直接报错返回客户端，校验通过继续执行add方法。

示例源码如下，请查看 pre > code 标签中的内容

与预处理_before对应的是后处理_after。云对象内可以创建一个特殊的方法_after用来再加工处理本次调用方法的返回结果或者抛出的错误

示例源码如下，请查看 pre > code 标签中的内容

在 uniCloud web控制台可以配置定时任务。给一个云对象配置后，将定时执行该云对象的内置方法 _timing

云对象返回给客户端的数据，包括正常数据和错误对象。

理论上，开发者可以使用任意方式返回正确状态下的数据格式，返回字符串、json对象都可以。

但在错误处理时，推荐使用uniCloud响应体规范，以方便客户端统一拦截错误。

在云对象内部报错时，比如方法名错误等非开发者代码返回的错误，会自动使用uniCloud响应体规范抛出错误对象。

开发者代码在主动报错时，比如参数校验错误，由于不能直接写入错误对象（e），则需要按照uniCloud响应体规范在返回的json对象中加入errCode和errMsg。

uni-app框架在拿到云对象的响应结果后，会识别其中是否包含errCode和errMsg，然后自动创建报错对象（e），策略如下：

也就是说，开发者的前端代码调用云对象时，需要try catch或者then catch。不报错时，在try里或then()的res里直接返回结果，报错时在catch (e) {}里拿到错误对象e。

不管是系统错误（如网络问题、云函数超时问题），还是开发者业务上的反馈错误，都如此，都是在 catch 中捕获错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

客户端通过uniCloud.importObject方法获取云对象的实例。用法如下

示例源码如下，请查看 pre > code 标签中的内容

云函数或云对象内也可以调用同一服务空间内的云对象，用法和客户端调用云对象一致

示例源码如下，请查看 pre > code 标签中的内容

当需要外部系统访问云对象时，可以把云对象封装成一个HTTP的URL。详细用法参考：云对象使用url化

云端或者客户端均有uniCloud.init方法可以获取其他服务空间的uniCloud实例，使用此实例的importObject可以调用其他服务空间的云对象，参考

客户端无论腾讯、阿里或支付宝均支持。云端uniCloud.init方法仅腾讯、支付宝云支持，且仅能获取同账号下的腾讯、支付宝云服务空间的uniCloud实例。

示例源码如下，请查看 pre > code 标签中的内容

一个云对象导出的不同方法之间不能互相调用。比如下面示例中 tryAddTodo 方法内部无法调用 addTodo 方法。

只能将多个方法共享的逻辑放到云对象导出的对象外部来供云对象的方法调用。例如下面抽离公共函数 pureAddTodo ：

示例源码如下，请查看 pre > code 标签中的内容

由于传输层还有上下文环境信息，所以开发者给云对象发送参数时需注意控制参数体积

新增于 HBuilderX 3.4.6，本次调整属于非兼容更新。

背景：每次写客户端联网的代码时，开发者都免不了重复写一堆代码：先调用loading等待框，联网结束后再关闭loading，如果服务器异常则弹出提示。

从HBuilderX 3.4.6起，调用云对象的方法时，默认会自动显示交互/提示界面。

如果默认显示的UI不符合你的需求，你可以通过配置自定义一些交互内容，也可以直接关闭自动显示的交互界面。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX中所有js方法都支持jsdoc+的语法提示系统。

在方法的开头通过/**输入特定格式的注释，在调用这个云对象的方法时就可以看到参数提示。

示例源码如下，请查看 pre > code 标签中的内容

DCloud官方开发了 uni-id-co，这是一个较为复杂的云对象，用于搭配 uni-id-pages 实现云端一体的用户注册登录等功能。该代码开源，可以参考。

uniCloud的服务器和客户端交互，有云函数、云对象、clientDB三种方式。

从云对象发布后，不再推荐使用传统云函数了。

如果是以数据库操作为主，则推荐使用clientDB，开发效率是最高的。

如果服务器端不操作数据库外，或者还有复杂的、不宜公开在前端的逻辑，此时推荐使用云对象。

**Examples:**

Example 1 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

Example 2 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

Example 3 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

Example 4 (css):
```css
// 云对象名：todo
module.exports = {
 add(title, content) {
  title = title.trim()
  content = content.trim()
  if(!title || !content) {
   return {
    errCode: 'INVALID_TODO',
    errMsg: 'TODO标题或内容不可为空'
   }
  }
  // ...其他逻辑
  return {
   errCode: 0,
   errMsg: '创建成功'
  }
 }
}
```

---

## 云函数/云对象运行方式介绍 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/rundebug.html

**Contents:**
- # 云函数/云对象运行方式介绍
- # 本地运行云函数
- # 上传并运行云函数
- # 客户端联调云函数
- # HBuilderX本地uniCloud运行环境介绍
  - # 本地环境只有node运行环境
  - # node版本差异
  - # 本地环境的云函数没有超时限制
  - # 扩展库功能差异
  - # return 策略差异

云函数或云对象，在开发期间，可以在HBuilderX提供的本地环境运行，也可以连接现网uniCloud云端运行。

注意：本地运行环境只包括云函数和 DB Schema，数据内容必须在云端。因为本地运行环境没有MongoDB。

云函数/云对象可以自己直接在本地或云端的云函数环境里运行，也可以由uni-app客户端连接云函数，触发本地或云端的运行环境进行联调运行。

云对象属于云函数的一种，所以很多界面菜单或文档没有单独强调时，“云函数”将包含“云对象”。

如果没有安装本地运行插件，按照提示安装即可。本地运行云函数需HBuilderX 2.8.1+

运行后将打开云函数控制台，在控制台看到运行结果和日志输出。

在HBuilderX的uniCloud本地运行插件的node环境中直接运行云函数或云对象。

在云函数编辑器里，按Ctrl+r运行快捷键（或点工具栏的运行），可看到运行云函数的若干菜单。Ctrl+r然后回车或选0执行本地运行，即可立即在控制台看到运行结果和日志输出。如下图所示：

运行云函数时，如需要给云函数传参，又不想启动客户端，那么可以通过配置json文件来传测试参数。

在云函数对应的目录右键可以配置运行测试参数，如下图，选择之后会生成一个形如${函数名}.param.json的文件，此文件内容会在云函数上传并运行以及本地运行云函数时作为参数传入云函数内。详细用法可参考：配置运行测试参数

在项目管理器里右键点击云函数的目录，在弹出菜单中可选择“上传并运行云函数”。此外也可以打开此目录下的文件然后使用快捷键Ctrl+r，在弹出菜单中选择“上传并运行云函数”。

对于云函数，上传并运行时会自动带上配置的运行测试参数。请参考：配置运行测试参数

运行含有uniCloud的uni-app项目，除了启动客户端控制台外，还会启动uniCloud控制台。

可以在客户端控制台的右上角切换是连接本地云函数还是云端云函数，如下图所示

此时客户端的日志和云函数的日志都可以看到，联调非常方便。

注：小程序开发需要注意，开发期间应关闭域名校验来建立和本地调试服务的连接，切勿使用HBuilderX的运行菜单发布体验版以及线上版。体验版和最终上线的版本应该以发行模式进行编译。

切换连接云端云函数还是本地云函数之后会在项目下的.hbuilderx目录创建一个launch.json文件。

一个典型的launch.json是如下形式的（无需手动创建此文件）

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 2.8.1+ 支持uniCloud本地运行插件。

不管是云函数直接本地运行，还是客户端连接本地云函数，都使用的是 uniCloud本地运行插件。

本地运行环境与uniCloud现网的差别：

也就是云函数、DB Schema可以使用本地，但本地没有MongoDB、没有redis、没有云存储，数据内容仍然存放在uniCloud现网服务空间。数据库索引也在云端才生效。

本地运行的nodejs版本为node12。

服务空间的nodejs版本可以选择8或12，如果你使用了nodejs的api，在本地测试之后部署到云端建议测试一下兼容性。如果只使用uniCloud的api，无需顾虑兼容性。

云函数超时时间、运行内存配置，在本地调试时不会生效。

HBuilderX自带的uniCloud环境内扩展库的能力仅支持到此HBuilderX发布时，需要更新HBuilderX才可以使用扩展库后续增加的能力

uniCloud云端的云函数使用的时区是utc+0，本地运行时使用的是本机时间，中国一般是+8。在使用“时间戳”时两者没有差异，但如果要获取年、月、日、小时要注意时区的差异。

以下方式可以获取指定时区的年、月、日、小时，可以参考一下

示例源码如下，请查看 pre > code 标签中的内容

推荐使用<uni-dateformat>组件格式化显示日期，详情

HBuilderX 3.4.0之前的版本“本地运行云函数”时云函数内callFunction会调用云端已部署的云函数，HBuilderX 3.4.0及之后的版本会调用本地云函数

“客户端连接本地云函数时”云函数内callFunction会调用本地云函数

请务必注意云函数在本地运行时依然是连接的云端数据库与存储

云函数上传文件到云存储只有腾讯云支持。当然也可以在前端直接上传文件，此时阿里云腾讯云均支持。

插件市场销售的加密云函数或公共模块，在未购买获得源码前，无法在本地运行。本地运行时会自动请求云端已部署的云函数。请留意控制台输出。

发送clientDB请求时，如果使用了加密的action（在插件市场销售），当前请求会使用云端已部署资源而不是本地资源（包括schema、validateFunction、action），请留意控制台输出。

云函数在云端运行于一个只读文件系统内（仅/tmp目录可以写入文件），本地运行时没有这些限制。如需在云端运行时写入文件请在/tmp目录下操作

在云函数的上传运行菜单或右键菜单中，有配置运行测试参数的功能。

可以打开一个json，配置运行参数。配置该json后，运行云函数时会将该json作为云函数调用的上行参数处理，可以在云函数中接收到参数。

在云函数目录右键运行云函数，也可以在云函数编辑器里，按Ctrl+r运行快捷键，或点工具栏的运行

如果需要模拟客户端类型可以在运行参数内添加clientInfo字段，完整字段列表见下方说明

示例源码如下，请查看 pre > code 标签中的内容

客户端调用云函数时自动在data内加入了uniIdToken，使用配置参数运行时也一样在参数内传入即可

示例源码如下，请查看 pre > code 标签中的内容

右键点击云对象时选择运行-本地云对象或调试运行-本地云对象时，会自动创建运行参数文件${objName}.param.js，可在此文件内以以下格式配置参数，配置完毕后再次运行即可。

其中const clientInfo = {xxx}为模拟客户端信息。完整clientInfo列表请参考：getClientInfo

login('xxx', 'xxx')用于指定调用的方法名和参数。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.2.10起，本地运行云函数及客户端连接本地云函数支持断点调试

开启断点调试方式如下图所示，在uniCloud本地运行环境启动后，在uniCloud控制台右上角选择开启断点调试。

开启调试后会出现调试界面，如下图所示。和浏览器的调试功能类似，详情可以参考：JavaScript调试器

在调试文件的编辑器界面的行号处双击可以插入断点，也可以右键选择更多操作（添加/删除/禁用断点）

如需从调试界面切换回项目视图，可以在项目管理器底部点击按钮进行切换

uni-app前端也支持debug调试，注意不要混淆。

在调试面板上方有断点step按钮，鼠标悬浮上去可看到快捷键。可以单步调试。调试面板的使用教程同客户端调试，详见

发布后的云函数，在 uniCloud web控制台 -> 云函数 下也有日志。

通过console api打印的日志会在云端记录。

腾讯云日志服务为套餐外单独计费项 。如果你购买了包月套餐，在使用日志服务时会产生额外费用（日志服务为按量计费，从余额扣除）。为避免因日志服务欠费引发其他按量计费资源不可使用，目前新建腾讯云服务空间默认关闭了日志服务，可在 uniCloud web控制台 -> 云函数 -> 日志中开启。

腾讯云套餐能力变更，自2025年8月31日起将调整为按照套餐提供日志保存时长，不再支持自定义保存时长，详见相关公告

2025年8月31日前仍可以设置日志保存时长。

**Examples:**

Example 1 (json):
```json
{
    "version": "0.0.1",
    "configurations": [
      {
        "app-plus": {
          "launchtype" : "local" // app平台连接本地云函数
        },
        "default": {
          "launchtype" : "remote" // 未配置的平台连接云端云函数
        },
        "h5": {
          "launchtype" : "remote" // h5平台连接云端云函数
        },
        "provider": "aliyun", // 如果项目仅关联一个服务空间无需此参数，支持的值：aliyun，tcb
        "type": "uniCloud", // 标识此项配置为uniCloud配置，必填
        "systemLog": false // 设置为false之后关闭云函数控制台的系统日志（主要是云函数入参、返回值，错误信息不会关闭）
      }
    ]
}
```

Example 2 (json):
```json
{
    "version": "0.0.1",
    "configurations": [
      {
        "app-plus": {
          "launchtype" : "local" // app平台连接本地云函数
        },
        "default": {
          "launchtype" : "remote" // 未配置的平台连接云端云函数
        },
        "h5": {
          "launchtype" : "remote" // h5平台连接云端云函数
        },
        "provider": "aliyun", // 如果项目仅关联一个服务空间无需此参数，支持的值：aliyun，tcb
        "type": "uniCloud", // 标识此项配置为uniCloud配置，必填
        "systemLog": false // 设置为false之后关闭云函数控制台的系统日志（主要是云函数入参、返回值，错误信息不会关闭）
      }
    ]
}
```

Example 3 (json):
```json
{
    "version": "0.0.1",
    "configurations": [
      {
        "app-plus": {
          "launchtype" : "local" // app平台连接本地云函数
        },
        "default": {
          "launchtype" : "remote" // 未配置的平台连接云端云函数
        },
        "h5": {
          "launchtype" : "remote" // h5平台连接云端云函数
        },
        "provider": "aliyun", // 如果项目仅关联一个服务空间无需此参数，支持的值：aliyun，tcb
        "type": "uniCloud", // 标识此项配置为uniCloud配置，必填
        "systemLog": false // 设置为false之后关闭云函数控制台的系统日志（主要是云函数入参、返回值，错误信息不会关闭）
      }
    ]
}
```

Example 4 (json):
```json
{
    "version": "0.0.1",
    "configurations": [
      {
        "app-plus": {
          "launchtype" : "local" // app平台连接本地云函数
        },
        "default": {
          "launchtype" : "remote" // 未配置的平台连接云端云函数
        },
        "h5": {
          "launchtype" : "remote" // h5平台连接云端云函数
        },
        "provider": "aliyun", // 如果项目仅关联一个服务空间无需此参数，支持的值：aliyun，tcb
        "type": "uniCloud", // 标识此项配置为uniCloud配置，必填
        "systemLog": false // 设置为false之后关闭云函数控制台的系统日志（主要是云函数入参、返回值，错误信息不会关闭）
      }
    ]
}
```

---

## uni云端一体安全网络 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/secure-network.html

**Contents:**
- # uni云端一体安全网络
- # 简介
- # 如何开通
  - # App平台开通安全网络
  - # 微信小程序开通安全网络
    - # 不使用uni-id-pages时如何使用微信小程序安全网络
- # 客户端强制验证
  - # 自定义客户端校验规则
- # 数据加密传输
  - # 客户端请求云函数

HBuilderX 3.6.8+ 支持，HarmonOS Next暂不支持安全网络

当攻击者了解了你的服务器接收什么样的数据时，就可以冒名客户端，提交假数据来攻击你的服务器。

尤其当你的业务中涉及促销、返佣、激励视频等场景，非常容易被刷。薅羊毛已经是一个非常成熟的灰产，哪里有漏洞，哪里就有他们赚钱的机会。

DCloud面向开发者同时提供了端引擎uni-app 和 云引擎uniCloud，如今进一步升级，提供云端一体的安全网络的能力。

uni-app 连接 uniCloud 时，可以选择是否启动安全网络。它通过高安全的保护机制，解决了客户端受信和网络受信的问题，防止客户端伪造和通信内容抓包。

uni云端一体安全网络，提供了如下2个实用功能：

注意：安全网络只支持微信小程序和App。并且App的安全级别更高。安全网络仅在uni-app客户端连unicloud云函数/云对象生效，云函数url化场景下会直接跳过安全校验。

不管使用安全网络的哪个功能，首先要开通安全网络。App和微信小程序略有区别，但大体都要经过如下流程：

本质上安全网络绑定的是应用的appid、包名、证书等信息。只不过这些信息统一配置在dev中，在uniCloud的web控制台来选择。所以务必注意dev配置的正式版、测试版的包名、签名是否正确。

注意： 打包后生效。测试时需打包自定义基座 。

安全网络在微信小程序上的实现，依赖了微信提供的一些用户级的凭据。所以需要下载 uni-id-pages 和 uni-open-bridge，并在app.vue里初始化。

无论是处理加密请求还是需要进行验证客户端的云函数在处理微信小程序发起的请求时都必须依赖uni-id-common和uni-open-bridge-common

uni-id-pages这个插件是云端一体的登录插件，其实安全网络只需要其中的uni-id-co云对象。插件中前端登录页面是否使用由开发者自己根据业务决定。

安全网络在微信小程序上依赖了微信的 access_token、session_key、encrypt_key等凭据。这些凭据需要uni-open-bridge统一接管。

登陆微信公众平台https://mp.weixin.qq.com/ ，获取微信小程序的固定凭据 appid 和 secret，配置到 uni-id-config

示例源码如下，请查看 pre > code 标签中的内容

配置 uni-open-bridge 定时任务，定时从微信服务器获取 access_token 并保存到Redis或数据库

示例源码如下，请查看 pre > code 标签中的内容

注意：拷贝此文件内容时需要移除 注释。标准json不支持注释。在HBuilderX中可用多选//来批量移除注释。

如果项目之前已经使用过uni-id-pages和uni-open-bridge，则上述步骤可省略。

对于使用uni-id-pages的项目App.vue页面需要补充如下代码，不使用uni-id-pages的开发者需要按照此文档进行操作：不使用uni-id-pages时如何使用微信小程序安全网络

示例源码如下，请查看 pre > code 标签中的内容

注意：此方法内部会调用一次微信小程序的login，然后使用返回的code调用uni-id-co的secureNetworkHandshakeByWeixin方法（新增于uni-id-pages 1.0.27）

对于部分已有用户体系，不希望引入uni-id-pages的开发者，可使用如下方案来使用微信小程序安全网络。

客户端需调整为在调用安全网络请求前使用uniCloud.initSecureNetworkByWeixin方法传入用户openid

示例源码如下，请查看 pre > code 标签中的内容

云函数内需要调用uni-open-bridge-common将微信应用级access_token及登录用户的session_key同步到uniCloud数据库，以便安全网络云端能从微信获取解密用参数。

uni-open-bridge-common使用注意事项

uni-open-bridge-common仍依赖uni-id的配置获取微信小程序appid，如何配置请参考：uni-id config

如果从自有服务器同步access_token和session_key到uniCloud数据库内可以使用uni-open-bridge提供的url化调用方式，请参考：uni-open-bridge url化调用

如果从云函数内同步access_token和session_key给安全网络按如下文档进行

云函数存储微信小程序应用级access_token

开发者应在自己云函数获取access_token，传递给uni-open-bridge-common进行存储，以供安全网络使用。或使用uni-open-bridge云函数的定时任务自动获取access_token，参考：应用级access_token

微信access_token有一些特性，处理不好容易出现bug，请务必详读微信公众平台关于access_token的说明（微信小程序、公众号逻辑一样）：微信公众平台access_token

示例源码如下，请查看 pre > code 标签中的内容

开发者应在用户调用微信登录使将openid、session_key传递给uni-open-bridge-common进行存储，以供安全网络使用

示例源码如下，请查看 pre > code 标签中的内容

客户端验证用于确保发起请求的客户端的真实性，只有指定的客户端才能访问云函数。

客户端验证功能全流程由uniCloud进行控制，开启此功能后将直接拒绝无权访问的客户端调用云函数。

开发者首先在uniCloud控制台 的安全网络页面选择哪些客户端应用可以与uniCloud建立安全网络，然后在页面上单独开启客户端强制校验。

开启客户端验证功能后，默认对所有云函数启用安全验证，仅在安全网络应用列表内配置的应用允许访问云函数。但有时，会有排除某个云函数的需求。比如指定的云函数校验或不校验客户端身份，这个云函数可能要url供外部访问。

所以uni安全网络提供了自定义客户端校验规则。

在 uniCloud web控制台 的 安全网络页面，可打开自定义规则开关。开启自定义规则后，将不再执行全体云函数统一的客户端校验。改为，未被规则匹配到的云函数不进行客户端验证。

示例源码如下，请查看 pre > code 标签中的内容

上述规则意味着，这个名为verify-client的云函数，只有应用的appid为__UNI_xxxx、platform即客户端平台为android、且为正式版，才能访问这个云函数；其他客户端无法访问这个云函数；且除了verify-client外，其他云函数可以被任何客户端随意访问。

如果想增加更多规则，在json中添加更多数组，每个数组是一条规则。比如想配置ios平台，就追加一个数组。

注意：自定义规则是一个标准的json，不支持编写注释，如需拷贝示例代码请务必去除注释。

云函数名为json的key，但可以写多个云函数。包括以下几种写法：

当匹配一个云函数的自定义规则配置时，优先使用单个云函数名的配置，其次是多个云函数名的配置，最后是通配符的配置。如果都未匹配到则不对此云函数执行验证客户端的逻辑。

除了校验客户端身份外，uni安全网络还提供了网络上下行传输数据的加密。

此时需要在客户端和服务器都要编写代码，倒不需要写具体的加密解密算法，而是需要在客户端指定哪些请求、哪些数据要加密，而在云端要校验客户端是否指定了正确的条件。

加密解密使用的是国际通行的高位AES算法。

客户端通过callFunction调用云函数时，加入secretType参数。

示例源码如下，请查看 pre > code 标签中的内容

也就是每个callFunction请求，都可以指定是否加密，以及是对上行数据还是下行数据加密。

客户端通过importObject调用云对象时，通过secretMethods参数来配置每个方法调用时是否加密。

示例源码如下，请查看 pre > code 标签中的内容

也就是云对象导入时配置某个方法的请求是否要加密，以及是对上行数据还是下行数据加密。那么在客户端调用云对象的相应方法时会自动按这个配置执行。

clientDB暂不支持网络数据加密传输。但仍可以使用客户端身份校验。

secretMethods 是云对象中指定需要加密的方法名。

方法级配置优先级最高，例如 secretMethods: {'*':'response', 'login':'both'}，login 的 both 覆盖了 '*':'response'

uni云端一体安全网络，已经在底层封装好了复杂的安全相关的算法。开发者只需关心对哪些请求、哪些数据进行加密。

不管是客户端接收云端数据、还是云端接受客户端数据，开发者的代码拿到的数据永远都是解密后的数据。

但云端有一个注意事项：为了避免客户端伪造secretType获取服务器敏感数据，应以服务器端为准，如果客户端携带的 secretType 不符合要求应拒绝响应数据。

在云函数的context中有secretType。如果这个云函数的返回数据必须加密，那么应该使用如下方式校验客户端的请求是否合法。

示例源码如下，请查看 pre > code 标签中的内容

在云对象的this中有secretType。如果这个云对象的reward方法的返回数据必须加密，那么应该使用如下方式校验客户端的请求是否合法。

示例源码如下，请查看 pre > code 标签中的内容

自HBuilderX 3.6.9起安全网络使用以下错误规范，此前错误码未统一不建议使用。安全网络使用的错误规范参考：错误规范

微信小程序加解密时还会使用uni-id-common的checkToken方法，相关错误码参考：uni-id错误码

如出现预期外的70008错误请按照以下步骤排查

**Examples:**

Example 1 (json):
```json
// uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json
{
  "dcloudAppid": "__UNI__xxxxxx", // 在项目的 manifest.json 中
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "oauth": {
      "weixin": {
        "appid": "", // 微信公众平台申请的小程序 appid
        "appsecret": "" // 微信公众平台申请的小程序 secret
      }
    }
  }
}
```

Example 2 (json):
```json
// uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json
{
  "dcloudAppid": "__UNI__xxxxxx", // 在项目的 manifest.json 中
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "oauth": {
      "weixin": {
        "appid": "", // 微信公众平台申请的小程序 appid
        "appsecret": "" // 微信公众平台申请的小程序 secret
      }
    }
  }
}
```

Example 3 (json):
```json
// uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json
{
  "dcloudAppid": "__UNI__xxxxxx", // 在项目的 manifest.json 中
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "oauth": {
      "weixin": {
        "appid": "", // 微信公众平台申请的小程序 appid
        "appsecret": "" // 微信公众平台申请的小程序 secret
      }
    }
  }
}
```

Example 4 (json):
```json
// uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json
{
  "dcloudAppid": "__UNI__xxxxxx", // 在项目的 manifest.json 中
  "mp-weixin": {
    "tokenExpiresIn": 259200,
    "oauth": {
      "weixin": {
        "appid": "", // 微信公众平台申请的小程序 appid
        "appsecret": "" // 微信公众平台申请的小程序 secret
      }
    }
  }
}
```

---

## 云函数请求中的中间状态通知通道 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/sse-channel.html

**Contents:**
- # 云函数请求中的中间状态通知通道
- # 客户端API
  - # 创建通道
  - # 开启通道
  - # 关闭通道
  - # 通道开启事件
  - # 通道消息事件
  - # 通道消息结束事件
  - # 通道错误事件
  - # 通道关闭事件

云函数在执行长时间任务时客户端无法获取云端任务执行状态，用户无法确定云函数是否还在正常执行，有些用户可能直接放弃等待刷新页面重新执行，从而导致浪费了更多的云函数资源。因此在此场景下需要一个云函数通知客户端发送执行状态或中间结果的通道。

在常规web开发时通过云端向响应流多次写入数据的方式来实现，但是云函数不支持这种用法，因此我们基于uni-push实现了这个替代方案。

使用此功能前需要先开通uni-push 2.0，参考文档：uni-push 2.0

云函数向客户端发送消息时会使用push发送如下格式数据，如果项目中有监听push消息请勿错误的处理此类消息。相关文档请参考：客户端监听推送消息

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用法：const channel = uniCloud.SSEChannel()

示例源码如下，请查看 pre > code 标签中的内容

用法：await channel.open()

此方法在HBuilderX 3.7.10版本及3.8.0版本使用时vue3版本发行时会报错uni[e] is not a function，如遇到此问题请升级HBuilderX版本

用于关闭消息通道，关闭后将不会收到message和end事件

用法：channel.on('open', () => { console.log('消息通道开启了') })

用法：channel.on('message', (message) => { console.log('收到消息：', message) })

用法：channel.on('end', (message) => { console.log('收到end事件，携带消息：', message) })

用法：channel.on('error', (err) => { console.error('收到错误：', err) })

用法：channel.on('close', () => { console.error('消息通道关闭') })

在收到消息结束事件、错误事件及开发者主动调用close方法后会触发close事件

事件监听可以通过on或addListener方法，事件移除需要使用off或removeListener方法。另外还有removeAllListener方法用于移除指定事件的所有监听器。

示例源码如下，请查看 pre > code 标签中的内容

监听事件和移除事件传入的方法必须是同一个才可以移除指定的监听器，以下为一个正确示例和一个错误示例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用法：const channel = uniCloud.deserializeSSEChannel(event.channel)

参数中的event.channel是客户端在callFunction时传递的消息通道对象

用法：await channel.write(message)

用法：await channel.end(message)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述云函数/云对象示例客户端会依次收到message事件和end事件，客户端打印日志如下

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
{
  channel: 'UNI_CLOUD_SSE',
  action: 'message' | 'end',
  seqId: number,
  messageId: number,
  message: any
}
```

Example 2 (css):
```css
{
  channel: 'UNI_CLOUD_SSE',
  action: 'message' | 'end',
  seqId: number,
  messageId: number,
  message: any
}
```

Example 3 (css):
```css
{
  channel: 'UNI_CLOUD_SSE',
  action: 'message' | 'end',
  seqId: number,
  messageId: number,
  message: any
}
```

Example 4 (css):
```css
{
  channel: 'UNI_CLOUD_SSE',
  action: 'message' | 'end',
  seqId: number,
  messageId: number,
  message: any
}
```

---

## uni-subscribemsg 公共模块 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-subscribemsg.html

**Contents:**
- # uni-subscribemsg 公共模块
- # 配置
- # API
  - # 发送微信公众号模板消息
  - # 微信小程序转发公众号模板消息
  - # 发送微信小程序订阅消息
  - # 检测用户是否关注了公众号
- # 常见问题
  - # 如何申请微信公众号模板消息
  - # 如何申请微信小程序订阅消息

开发业务时时常遇到需要向用户发送一些通知，如欠费通知、会员到期通知等等。

uni-subscribemsg公共模块可以方便开发者快速接入小程序订阅消息和微信公众号模板消息。

目前uni-subscribemsg支持：

uni-subscribemsg公共模块仅能在云函数/云对象内使用。如果您不了解公共模块，请参阅 本插件依赖uni-open-bridge-common，且版本需≥1.1.2

插件市场地址：https://ext.dcloud.net.cn/plugin?name=uni-subscribemsg

uni-subscribemsg 自身没有配置文件，Ta依赖 uni-open-bridge 的配置，点击查看uni-open-bridge配置

示例源码如下，请查看 pre > code 标签中的内容

注意：此接口已被微信官方废弃，无法使用，即无法用微信小程序的openid来发送微信公众号的模板消息了

uni-subscribemsg 版本需 ≥ 1.0.2

示例源码如下，请查看 pre > code 标签中的内容

注意：公众号和小程序无需绑定在同一个开放平台下，但需要同时满足下面的3个要求。

订阅消息顾名思义，需要先订阅，才可以发送消息，因此前端需要先让用户订阅。

调用 uni.requestSubscribeMessage API即可让用户订阅。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-subscribemsg 版本需 ≥ 1.0.1

示例源码如下，请查看 pre > code 标签中的内容

进入微信公众号后台 - 点击【模板消息】- 点击【从历史模板库中添加】

进入微信小程序后台 - 点击【订阅消息】- 点击【公共模板库】- 点击【选用】

**Examples:**

Example 1 (javascript):
```javascript
// 引入uni-subscribemsg公共模块
const UniSubscribemsg = require('uni-subscribemsg');
// 初始化实例
let uniSubscribemsg = new UniSubscribemsg({
	dcloudAppid: "你项目的dcloudAppid",
	provider: "weixin-h5", // 注意，这里是weixin-h5
});
// 发送模板消息
let res = await uniSubscribemsg.sendTemplateMessage({
	touser: "用户openid",
	template_id: "消息模板id",
	url: "https://uniapp.dcloud.net.cn", // 用户点击消息后跳转的链接地址
	data: {
		first: {
			value: "您购买的套餐已到期!",
			color: "#666666"
		},
		keyword1: {
			value: "test@qq.com",
			color: "#666666"
		},
		keyword2: {
			value: "阿里云空间",
			color: "#666666"
		},
		keyword3: {
			value: "2023-12-21 15:30:20",
			color: "#666666"
		},
		remark: {
			value: "请及时续费",
			color: "#666666"
		}
	}
});
```

Example 2 (javascript):
```javascript
// 引入uni-subscribemsg公共模块
const UniSubscribemsg = require('uni-subscribemsg');
// 初始化实例
let uniSubscribemsg = new UniSubscribemsg({
	dcloudAppid: "你项目的dcloudAppid",
	provider: "weixin-h5", // 注意，这里是weixin-h5
});
// 发送模板消息
let res = await uniSubscribemsg.sendTemplateMessage({
	touser: "用户openid",
	template_id: "消息模板id",
	url: "https://uniapp.dcloud.net.cn", // 用户点击消息后跳转的链接地址
	data: {
		first: {
			value: "您购买的套餐已到期!",
			color: "#666666"
		},
		keyword1: {
			value: "test@qq.com",
			color: "#666666"
		},
		keyword2: {
			value: "阿里云空间",
			color: "#666666"
		},
		keyword3: {
			value: "2023-12-21 15:30:20",
			color: "#666666"
		},
		remark: {
			value: "请及时续费",
			color: "#666666"
		}
	}
});
```

Example 3 (javascript):
```javascript
// 引入uni-subscribemsg公共模块
const UniSubscribemsg = require('uni-subscribemsg');
// 初始化实例
let uniSubscribemsg = new UniSubscribemsg({
	dcloudAppid: "你项目的dcloudAppid",
	provider: "weixin-h5", // 注意，这里是weixin-h5
});
// 发送模板消息
let res = await uniSubscribemsg.sendTemplateMessage({
	touser: "用户openid",
	template_id: "消息模板id",
	url: "https://uniapp.dcloud.net.cn", // 用户点击消息后跳转的链接地址
	data: {
		first: {
			value: "您购买的套餐已到期!",
			color: "#666666"
		},
		keyword1: {
			value: "test@qq.com",
			color: "#666666"
		},
		keyword2: {
			value: "阿里云空间",
			color: "#666666"
		},
		keyword3: {
			value: "2023-12-21 15:30:20",
			color: "#666666"
		},
		remark: {
			value: "请及时续费",
			color: "#666666"
		}
	}
});
```

Example 4 (javascript):
```javascript
// 引入uni-subscribemsg公共模块
const UniSubscribemsg = require('uni-subscribemsg');
// 初始化实例
let uniSubscribemsg = new UniSubscribemsg({
	dcloudAppid: "你项目的dcloudAppid",
	provider: "weixin-h5", // 注意，这里是weixin-h5
});
// 发送模板消息
let res = await uniSubscribemsg.sendTemplateMessage({
	touser: "用户openid",
	template_id: "消息模板id",
	url: "https://uniapp.dcloud.net.cn", // 用户点击消息后跳转的链接地址
	data: {
		first: {
			value: "您购买的套餐已到期!",
			color: "#666666"
		},
		keyword1: {
			value: "test@qq.com",
			color: "#666666"
		},
		keyword2: {
			value: "阿里云空间",
			color: "#666666"
		},
		keyword3: {
			value: "2023-12-21 15:30:20",
			color: "#666666"
		},
		remark: {
			value: "请及时续费",
			color: "#666666"
		}
	}
});
```

---

## uni云开发软件版 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/software/

**Contents:**
- # uni云开发软件版
- # 背景
- # 产品特征
- # 案例

uniCloud官网 自2020年推出，主打全栈+serverless云。

虽然serverless有很多优势，如弹性扩容、免运维。但很多开发者因为自身IT政策、历史资产、serverless的灵活性限制而无法使用uniCloud。

DCloud于2024年对外发布了uni云开发软件，它的产品形态变成了一个服务器软件，不再绑定serverless云，所以产品名称也去掉了cloud。开发者可以把这套软件安装在自己的服务器使用。

uni云开发软件版本质上是一个内置了uniCloud API和相关功能的定制Node Runtime。

安装好uni云开发软件版后，就可以运行uniCloud的云函数、云对象。uni-app也可以访问uni云开发软件版的服务器，实现云端一体的高效开发。

实际上DCloud的系统，很多都是运行在uni云开发软件版上的，比如 uniCloud.dcloud.net.cn 、dev.dcloud.net.cn 。

从开发工具、API、生态各维度，uni云开发软件版和serverless模式没有差别。开发者基于serverless版编写的uniCloud项目源码，可以平滑部署到软件版，前端uni-app代码、后端云函数、云对象等代码，均无需修改。

相比serverless模式，软件版多了运维的工作：

而如上工作，serverless版均无需进行，serverless版通过服务空间的概念，将云函数、云存储、云数据库、前端网页托管统一封装，开发者可一键开通所有业务。所有的运维、安全工作都由serverless云厂商处理。

相比serverless版，软件版的优势也不少：

存储方面，uni云开发软件版目前支持如下存储方案：

数据库方面，uni云开发软件版仅支持MongoDB，支持本地服务器上安装的MongoDB，也支持在云厂商购买单独的MongoDB实例。

未来serverless版升级后，软件版也会升级

综上，可见uni云开发软件版的适用的开发者是：

所以，uni云开发软件版仅面向企业开发者销售。售价详见

---

## 云函数公用模块 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-common

**Contents:**
    - # 云函数公用模块

云函数支持公共模块。多个云函数的共享部分，可以抽离为公共模块，然后被多个云函数引用。

示例源码如下，请查看 pre > code 标签中的内容

仍以上面的目录为例，在公用模块内exports，在云函数内require即可。示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果仅需要导出一个function还可以使用以下写法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

Example 2 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

Example 3 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

Example 4 (unknown):
```unknown
cloudfunctions
  ├─common // 云函数公用模块目录
  |  └─hello-common // 云函数公用模块
  |     ├─package.json
  |     └─index.js // 公用模块代码，可以不使用index.js，修改 package.json 内的 main 字段可以指定此文件名
  └─use-common // 使用公用模块的云函数
     ├─package.json // 在 use-common 目录执行 npm init -y 生成
     └─index.js // 云函数入口文件
```

---

## 云函数相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/cf.html

**Contents:**
- # 云函数相关问题
  - # 云函数 和 传统 Node.js 开发有何区别？
  - # 可否通过http url方式访问云函数或云数据库？
  - # 云函数访问时快时慢怎么回事？
  - # 如何控制云函数数量？云函数是否可以按多级目录整理
  - # 云函数通过https访问其他服务器时出现“certificate has expired”
  - # 调用云函数时出现Unauthenticated access is denied
  - # 使用阿里云访问云函数时出现unknow system error
  - # 云函数云端运行默认时区是什么
  - # 定时任务执行失败时是否会重试？重试逻辑是什么？

云函数相当于 Node.js + Serverless + DCloud改进。

总结一下，前端同学即便可熟练编写Node.js代码，但对于DB优化、弹性扩容、攻击防护、灾备处理等方面还是有经验欠缺的，但uniCloud将这些都封装好了，真正做到仅专注业务实现，其它都委托云厂商服务。

另外，在 Node.js 代码实现上，云函数每次执行的宿主环境（可简单理解为虚拟机或服务器硬件）可能相同，也可能不同，因此传统Node.js开发中将部分信息存储本地硬盘或内存的方案就不再适合，建议通过云数据库或云存储的方案替代。

当然还有最重要的一点，在uniCloud中，推荐大量业务使用clientDB，一个应用中写不了太多云函数。

uniCloud提供了云函数URL化，来满足上述需求。详见

云函数对应的资源，如果长时间不使用，会被阿里云或腾讯云平台从内存中释放。一旦被释放，启动云函数时会有一个冷启动的过程。

表现为：隔了很久不用，第一次用就会比较慢，然后立即访问第二次，则很快，毫秒级响应。

冷启动的速度一般不会超过1.5秒，如超过1.5秒应该是云函数写的有问题或网络有问题。

资源回收策略方面，阿里云是15分钟内没有第二次访问的云函数，就会被回收。腾讯云是半小时。

两家云厂商仍然在优化这个问题。目前如果开发者在意这个问题，给开发者的建议是：

因为实际开发中会使用框架而不是真的一个一个开发云函数。

以免费空间的48个云函数举例，一般情况下：

上述几个是官方推荐的几个常用框架所带的云函数，然后开发者自己的代码里，大多数业务使用clientDB开发，不写云函数，或者写了配套的action云函数也不占用云函数数量；如果还需要自己写一些云函数，再加上uni-cloud-router，用这个单路由云函数搞定剩余需求；另外如果有跑批数据的需求可以再来一个云函数。所以无论如何48个云函数都占不满。

uniCloud的每个云函数是一个独立进程，不存在云函数级别的多级目录概念。

每个云函数下可以有子目录，但它们都属于这个云函数的一部分，而不是另一个云函数。

单路由云函数框架不止是官方提供的uni-cloud-router，插件市场有很多类似框架：详见

本章节仅对let's encrypt证书调整进行说明，其他情况请检查对应网站证书是否过期

let's encrypt于2021年9月30日根证书过期并切换到新版根证书。详情参考：DST Root CA X3 Expiration (September 2021) 。此次过期行为引起nodejs8请求使用了let's encrypt证书的网站时出现certificate has expired错误。

将云函数升级到nodejs12，删除旧云函数，配置node版本之后重新上传。详情参考：云函数package.json

（不推荐）使用uniCloud.httpclient.request时使用rejectUnauthorized: false。示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

如使用腾讯云作为服务商，出现此问题时请检查前端是否有执行clearStorage操作。clearStorage会清理掉腾讯云设置的token，导致请求云函数报错。

检查云函数运行时间是否超出配置的超时时间，优化代码逻辑或配置更长的超时时间

点击uniCloud控制台“紧急报障”，提供spaceId、操作开启固定IP的云函数名称，由DCloud客服提交工单由腾讯云处理。

QPS限流，不区分云函数、云数据库、云存储读写等请求。可能原因及解决方法：

并发限流，包含云函数和云数据库两类请求。可能原因及解决方法：

套餐内某项资源超额限流。可升级套餐或者转为后付费，5分钟内自动恢复。

绑定域名需要在阿里云完成ICP备案，如果域名在其他云厂商，需要在阿里云接入备案才能绑定

云函数请求时，会在header中增加x-client-timestamp:1724819065430参数，时间为客户端本地时间，如果本地时间与北京时间有差异，且较大时，会报这类错误。根本原因：时间戳参与签名，函数签名校验失败。

**Examples:**

Example 1 (javascript):
```javascript
const https = require('https')
const httpsAgent = new https.Agent({
  rejectUnauthorized: false
})
await uniCloud.httpclient.request('https://xxx.com/get', {
	httpsAgent
})
```

Example 2 (javascript):
```javascript
const https = require('https')
const httpsAgent = new https.Agent({
  rejectUnauthorized: false
})
await uniCloud.httpclient.request('https://xxx.com/get', {
	httpsAgent
})
```

Example 3 (javascript):
```javascript
const https = require('https')
const httpsAgent = new https.Agent({
  rejectUnauthorized: false
})
await uniCloud.httpclient.request('https://xxx.com/get', {
	httpsAgent
})
```

Example 4 (javascript):
```javascript
const https = require('https')
const httpsAgent = new https.Agent({
  rejectUnauthorized: false
})
await uniCloud.httpclient.request('https://xxx.com/get', {
	httpsAgent
})
```

---

## 开发指南 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-storage/dev.html

**Contents:**
- # 开发指南
- # 启用uni-cloud-ext-storage扩展库
- # API
  - # 获取扩展存储管理对象
  - # 获取前端上传参数
  - # 云端上传文件
  - # 获取临时下载链接
  - # 下载文件
  - # 删除文件
  - # 修改文件状态

扩展存储是单独的扩展库，开发者需手动将uni-cloud-ext-storage扩展库添加到云函数或云对象的依赖中。

云端在操作扩展存储前，需要先获取 extStorageManager 对象实例，然后再通过 extStorageManager.xxx 调用对应的API

示例源码如下，请查看 pre > code 标签中的内容

接口名：getUploadFileOptions

调用此接口可在云端获取前端上传所需参数，将上传参数返回给前端，前端使用 uni.uploadFile 即可上传文件

你可以在调用 extStorageManager.getUploadFileOptions 前执行一些自己的业务逻辑，判断用户是否有上传权限。

注意：如果是云函数，写法会略有不同，包括前端调用的代码，故建议使用云对象，跟文档更契合。

示例源码如下，请查看 pre > code 标签中的内容

响应参数 uploadFileOptions 详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将base64转为Buffer上传到扩展存储

示例源码如下，请查看 pre > code 标签中的内容

调用此接口可批量获取私有文件的临时下载链接

你可以在调用 extStorageManager.getTempFileURL 前执行一些自己的业务逻辑，判断用户是否有获取临时下载链接权限。

示例源码如下，请查看 pre > code 标签中的内容

你可以在调用 extStorageManager.downloadFile 前执行一些自己的业务逻辑，判断用户是否有下载该文件权限

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

默认上传的文件都是公共权限，如果需要将文件设置为私有权限，则可调用此接口

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口名：updateDomainReferer

注意：此为覆盖替换，因此建议先通过 getDomainInfo 接口获取域名信息，获取当前已设置的防盗链规则，然后在此基础上修改。

示例源码如下，请查看 pre > code 标签中的内容

接口名：updateDomainIpacl

注意：此为覆盖替换，因此建议先通过 getDomainInfo 接口获取域名信息，获取当前已设置的ip黑白名单规则，然后在此基础上修改。

示例源码如下，请查看 pre > code 标签中的内容

以下API暂不支持本地运行，只能云端运行才能调用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

新建云函数，命名：ext-storage-transcode-notice

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

补全 ext-storage-transcode-notice 函数内自定义逻辑后，最后上传云函数即可

小程序需要添加域名白名单，否则无法正常使用

将下方域名添加到小程序的uploadFile合法域名列表中

示例源码如下，请查看 pre > code 标签中的内容

下载域名就是你开通扩展存储时绑定的自定义域名，将你的自定义域名添加到download合法域名列表中

扩展存储已支持托管Web静态站点，且根目录下的站点支持history模式，可以解决支付宝云内置前端托管不支持history的问题

需要 HBuilderX 5.0+ 的版本才能进行此操作，如低于此版本，请在uniCloud控制台上传

注意：非首次上传时，需要刷新缓存才能生效，如下图所示

如果您使用的 HBuilderX 版本低于 5.0，需要按下面的操作进行

注意：非首次上传时，需要刷新缓存才能生效，如下图所示

扩展存储仅根目录的站点可以实现history模式，且需要在根目录多上传一个名为 errno-404 的文件，文件内容和 index.html 内容完全一致。

提示：当你在uniCloud控制台上传时会自动生成 errno-404 的文件，无需特殊处理。

图片瘦身服务（imageslim）在尽可能不影响画质的情况下，将JPEG、PNG格式的图片实时压缩，瘦身后画质基本没有变化，分辨率不变，格式不变，大幅缩小文件体积：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

裁剪正中部分，等比缩小生成200x200缩略图：

示例源码如下，请查看 pre > code 标签中的内容

宽度固定为200px，高度等比缩小，生成200x133缩略图：

示例源码如下，请查看 pre > code 标签中的内容

高度固定为200px，宽度等比缩小，生成300x200缩略图：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

限定长边，生成不超过 200x200 的缩略图

示例源码如下，请查看 pre > code 标签中的内容

限定短边，生成不小于 200x200 的缩略图

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

原图大于指定长宽矩形，按长边自动缩小为 200x200 缩略图

示例源码如下，请查看 pre > code 标签中的内容

原图小于指定长宽矩形，按长边自动拉伸为 700x600 放大图

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在图片高级处理现有的功能中只影响其后的裁剪操作参数表，即裁剪操作以 gravity 为原点开始偏移后，进行裁剪操作。

示例源码如下，请查看 pre > code 标签中的内容

部分参数以 ! 开头，表示参数将被转义。为便于阅读，我们采用特殊转义方法，如下所示：

示例源码如下，请查看 pre > code 标签中的内容

即!50x50r 实际代表 50x50^ 这样一个字符串。而!50x50实际代表 50x50 这样一个字符串（该字符串并不需要转义）。 中的 OffsetGeometry 部分可以省略，默认为 +0+0。即 /crop/50x50 等价于 /crop/!50x50a0a0，执行 -crop 50x50+0+0 语义。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

生成 300x300 裁剪图，偏移距离 30x100

示例源码如下，请查看 pre > code 标签中的内容

生成 300x200 裁剪图，偏移距离 30x0

示例源码如下，请查看 pre > code 标签中的内容

生成 270x300 裁剪图，偏移距离 0x100

示例源码如下，请查看 pre > code 标签中的内容

生成 270x200 裁剪图，偏移距离 0x0

示例源码如下，请查看 pre > code 标签中的内容

锚点在左上角 (NorthWest)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在正上方 (North)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在右上角 (NorthEast)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在正左方 (West)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在正中 (Center)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在正右方 (East)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在左下角 (SouthWest)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在正下方 (South)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

锚点在右下角 (SouthEast)，生成 300x300 裁剪图

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

部分参数以 ! 开头，表示参数将被转义。为便于阅读，我们采用特殊转义方法，如下所示：

示例源码如下，请查看 pre > code 标签中的内容

即 !50x50r 实际代表 50x50 这样一个字符串。而 !50x50实际代表 50x50 这样一个字符串（该字符串并不需要转义）。 <ImageSizeAndOffsetGeometry> 中的 OffsetGeometry 部分可以省略，默认为 +0+0。即 /extent/50x50 等价于 /extent/!50x50a0a0。

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

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

图片基本信息包括图片格式、图片大小、色彩模型。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

EXIF(EXchangeable Image File Format) 是专门为数码相机的照片设定的可交换图像文件格式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将图片生成圆角图片，并且可以指定图片的圆角大小。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

肉眼可见的水印方式，一般用于标志图片的出处或者用于声明版权，会破坏原图，且影响美观。扩展存储提供盲水印功能，隐蔽性强，在不破坏原始作品的情况下，实现版权的防护与追踪。当图片被盗用后，您可对图片进行盲水印解码，验证版权归属。

盲水印主要为CPU密集型任务，处理时间会随着图片文件的增大而增大

建议使用 version/3，相较于之前的版本有以下优化：

隐形美观：盲水印是一种肉眼不可见的水印方式，可以保持图片美观的同时，保护您的资源版权。

版权保护：对图片资源使用图片盲水印或者文字水印，借此避免数字媒体未经授权的复制和拷贝，可通过对原图进行解码操作，得到水印图来证明版权归属。

防泄漏：对于内部分享的图片资源，您可使用盲水印功能，加上不同标识，如果资料被复制、传播可根据解码出的唯一标识得出泄露方信息。

示例源码如下，请查看 pre > code 标签中的内容

version 为1或2时，请求参数说明如下：

version 为3时，请求参数说明如下：

version 为1或2时，请求参数说明如下：

version 为3时，请求参数说明如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

version 为1或2时，请求参数说明如下：

version 为3时，请求参数说明如下：

version 为1或2时，请求参数说明如下：

version 为3时，请求参数说明如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

动图合成接口（animate）用于将多张图片合成 GIF 动图。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

图片处理部分API会涉及到 经过URL安全的Base64编码，具体算法如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在调用 getTempFileURL 的时候，fileList 内带上图片处理参数即可

示例源码如下，请查看 pre > code 标签中的内容

视频单帧缩略图接口(vframe)用于从视频流中截取指定时刻的单帧画面并按指定大小缩放成图片。

示例源码如下，请查看 pre > code 标签中的内容

注意：建议视频文件不能太大，举例用户设置该接口的超时时间为10s，那么同步处理的视频文件最好不超过450MB ，否则可能会超时导致处理失败。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

取视频第2秒的图，宽度为480px，高度为360px：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

音视频元信息接口(avinfo)用于获取指定音频、视频资源的元信息

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

资源下载二维码生成功能(qrcode)，用于为存放在七牛云存储上的资源的下载URL或资源内容生成二维码图片，方便用户在各种客户端之间传播资源。

示例源码如下，请查看 pre > code 标签中的内容

其中 <DownloadURL> 代表资源的原始下载 URL

注意：L是最低级别的冗余度，H最高。提高冗余度，较大可能会使生成图片总像素变多。

示例源码如下，请查看 pre > code 标签中的内容

生成文件对应的二维码，扫码二维码即可直接观看视频

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

扩展存储支持机器智能审核，会在用户上传图片和视频的时候异步进行审核，审核结果通过异步回调通知到您。

开通方式：开通此功能需要进 扩展存储技术交流群 申请发送文字：我想申请开通扩展存储“机器智能审核”功能。

新建云函数 ext-storage-examine-notice，操作如下图所示。

编写 ext-storage-examine-notice/package.json 文件，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

再编写 ext-storage-examine-notice/index.js 文件，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

保存文件后，还需要上传 ext-storage-examine-notice 云函数才能生效。

此时进入 uniCloud控制台 找到对应空间下的云函数列表中的 ext-storage-examine-notice 云函数，点击查看详情，得到url接口地址，将这个地址发给扩展存储管理员即可开通【机器智能审核】

申请方式：在 扩展存储技术交流群 里发送内容，我想申请七牛云CDN额外防御：同一个IP在1分钟内，同一个域名下，CDN单节点下载文件次数超过200次，封禁该IP 1小时，1小时后自动解封

提示：通过 getDomains 和 getCdnTop 这两个API，结合云函数定时任务可以自己实现CDN流量监控告警功能，该告警功能的定时任务代码模板如下所示

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上传成功后，每15分钟定时任务会启动一次，可前往云函数 ext-storage-cron 查看运行日志

通常是因为空间没有开通扩展存储导致的，前往开通教程，如果确定已经开通，则可尝试重启项目并重新上传相关云函数。

可以通过云函数或云对象开启URL化的方式来获取前端上传参数，拿到上传参数后即可通过uni.uploadFile（或其他三方请求库）上传文件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请求地址为：刚复制URL化地址 + /getUploadFileOptions

如 https://fc-mp-xxxx.next.bspapp.com/http/ext-storage-co/getUploadFileOptions

下方的代码用了 axios 作为请求库，这里需要替换成你自己用的请求库

示例源码如下，请查看 pre > code 标签中的内容

由于扩展存储不支持前端直传，而是需要先通过云函数或云对象来获取上传凭证，具有较高的安全性，但也因此导致上传代码与内置存储不同，老项目想使用扩展存储就要改动原有上传代码，那么有没有方案可以做到在不改原有上传代码的基础上，老项目也能很方便的使用扩展存储呢?

在你的项目根目录的 /js_sdk/ext-storage/ 目录新建文件 uploadFileForExtStorage.js（没有 /js_sdk/ext-storage/ 目录就新建目录）

uploadFileForExtStorage.js 文件复制下方的代码

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如依然有问题，可进群反馈 扩展存储技术支持群

根据不同的存储服务商，下面列出了不同的迁移方案

我的存储空间是在七牛云的官方账号上，我现在想迁移到uniCloud扩展存储，应该如何迁移?

因为扩展存储的服务商就是七牛云，因此可以直接使用七牛云自带的迁移工具 qshell 进行迁移

我用的是阿里云OSS（腾讯云COS或其他存储都可以），我想将Ta迁移到扩展存储，应该如何迁移?

将需要迁移的存储内的文件全部下载到你的电脑上，然后通过 本地电脑文件快速批量上传到扩展存储 的方式上传到扩展存储

可以将扩展存储的回源地址修改为你原先存储的源站地址，这样当用户访问文件时，扩展存储如果未找到文件会尝试从你原先的源站进行下载并保存到扩展存储，以此实现动态迁移，此方案需要一段时间内保留原先存储内的文件，直到扩展存储几乎全部回源后（即原先的存储几乎已无回源流量产生时）就可以释放原先存储（注意：如果某些文件一直没访问，那么扩展存储里不会有这些文件）

只将uni-cdn的回源地址修改为你原先存储的源站地址，这样只使用了uni-cdn，扩展存储内是不会存储文件的，文件还是全在你原先的存储中

申请方式：在 扩展存储技术交流群 里发送内容，我想申请uni-cdn回源到阿里云OSS，我选择迁移方案三-uni-cdn回源自有存储，我每月消耗的CDN是 xxx TB

特别注意：方案三只有CDN消耗大户才能申请

由于内置存储使用的是云厂商的默认域名，故即使迁移成功后，数据库里的图片存储的url地址还是你之前内置存储的默认域名，因此还需要进行如下操作。

用本地调试的运行方式（设置本地运行超时时间一个很大的数字），循环数据库所有表的记录，进行url修改

如果你使用的是第三方组件库的image组件，那么可以考虑直接修改image组件内的源码，将图片的src进行本地动态替换

如果你认为内置存储里存储的文件不重要，也可以考虑放弃内置存储里的文件，不迁移，直接使用扩展存储

七牛云提供了 qshell 工具用来快速将本地电脑文件快速批量上传到扩展存储

**Examples:**

Example 1 (css):
```css
const extStorageManager = uniCloud.getExtStorageManager({
	provider: "qiniu", // 扩展存储供应商
	domain: "example.com", // 域名地址
});
```

Example 2 (css):
```css
const extStorageManager = uniCloud.getExtStorageManager({
	provider: "qiniu", // 扩展存储供应商
	domain: "example.com", // 域名地址
});
```

Example 3 (css):
```css
const extStorageManager = uniCloud.getExtStorageManager({
	provider: "qiniu", // 扩展存储供应商
	domain: "example.com", // 域名地址
});
```

Example 4 (css):
```css
const extStorageManager = uniCloud.getExtStorageManager({
	provider: "qiniu", // 扩展存储供应商
	domain: "example.com", // 域名地址
});
```

---

## 开发指南 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/frv/dev.html

**Contents:**
- # 开发指南
  - # App端接入
    - # 接入流程
    - # 客户端接口
      - # 获取实人认证设备信息
      - # 调起实人认证界面
      - # iOS平台自定义UI
  - # 网页端接入
    - # 接入流程
    - # 认证触发页面

uni实人认证相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

uni实人认证服务，分前端api和云端api，云端为uniCloud API。

如开发者的业务不在uniCloud上，需参考云函数url化文档编写云函数提供http接口供外部访问，由uniCloud获取到认证结果后转交给开发者的非uniCloud服务器上。

首先在uniCloud服务空间新建一个云函数/云对象，用于处理实人认证业务。新建时在云函数的扩展库中配置uni-cloud-verify扩展库。

在客户端和uniCloud云函数中调用如下api，实现下图流程：

如下描述为uni-app的客户端API，uni-app x的客户端API文档另见

调用刷脸前通过客户端先获取设备信息，调用uni.getFacialRecognitionMetaInfo

const metaInfo = uni.getFacialRecognitionMetaInfo();

通过云函数获取certifyId后，在客户端调用uni.startFacialRecognitionVerify 打开认证界面，通过刷脸操作获取认证结果。

uni.startFacialRecognitionVerify(OBJECT)

注: 颜色字符串格式为“#RRGGBB”，RRGGBB为十六进制字符串，如红色("#FF0000")

示例源码如下，请查看 pre > code 标签中的内容

iOS平台不支持通过参数的方式修改刷脸页的提示文案，但可以通过自定义bundle文件的方式修改提示内容以及国际化信息

APBToygerFacade.bundle文件下载

首先需要下载APBToygerFacade.bundle文件，可通过修改APBToygerFacade.bundle中的内容自定义多语言文案，如 zh-Hans.strings 代表中文文案，en.strings 代表英文文案，内容格式为 "APBToygerFacade:xxxA"="xxxB"，xxxA 为目标修改文案，xxxB 为修改后的文案，示例内容如下：

示例源码如下，请查看 pre > code 标签中的内容

此处文案修改后需要完整测试回归 UI 以及文案变化影响，以免影响用户体验。修改后的bundle文件配到项目根目录的 nativeResources -> ios -> Resources 路径下后打包即可，详情参照iOS原生应用配置文件和资源

本地运行需要HBuilderX版本 >= 4.81.2025091909-alpha

网页端需要构建认证触发页面和结果显示页面：

在网页端和uniCloud云函数中调用如下api，实现下图流程：

1.先获取设备信息，调用uni.getFacialRecognitionMetaInfo

const metaInfo = uni.getFacialRecognitionMetaInfo();

2、调用云函数/云对象获取certifyUrl，并在浏览器中加载该链接进行实人认证

示例源码如下，请查看 pre > code 标签中的内容

认证结束后，页面会跳转至调用getCertifyUrl接口时传入的returnUrl（结果显示页面）并携带认证结果数据。

示例源码如下，请查看 pre > code 标签中的内容

实人认证相关接口由uni-cloud-verify扩展库提供，调用uniCloud.getFacialRecognitionVerifyManager()需云函数/云对象中加载对应的扩展库。参考

示例源码如下，请查看 pre > code 标签中的内容

Object GetFacialRecognitionVerifyManagerOptions

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Object GetCertifyIdOptions

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Object GetCertifyIdOptions

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Object GetAuthResultOptions

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以通过try catch捕获接口抛出的错误，接口抛出的错误为标准的uni错误对象

示例源码如下，请查看 pre > code 标签中的内容

由于实人认证涉及费用，为避免其他人盗刷您的余额，您应当谨慎编码，防止漏洞。一般可以通过一个用户每天限制实名次数来实现防刷，未登录用户禁止调用认证接口。如果有更高的安全需求可以使用uni安全网络，可以有效防止伪造客户端请求，详见

非uniCloud的传统服务器，可通过本插件方便调用uni实人认证

如果您的业务没有部署在 uniCloud 上，可以通过 uni-frv-external 来实现实人认证功能。 uni-frv-external 集成了实名认证前端组件和云端云对象，适用于没有使用uniCloud或没有使用uni-id账号体系的项目。

如果您的业务使用uniCloud开发，不推荐使用此插件，可以通过实人认证云函数接口调用或者使用uni-id-pages 插件，uni-id-pages 内同样集成了实名认证前端组件和云端云对象。

插件下载地址：https://ext.dcloud.net.cn/plugin?name=uni-frv-external

示例源码如下，请查看 pre > code 标签中的内容

但此业务数据量较大，为了维持服务的稳定性，只能查看30天内的某1天的全部调用记录，默认选择当天。

系统可查看实人认证每日调用汇总数据，包括每日请求次数、每日请求成功次数、每日计费金额等汇总数据。

实人认证配置文件路径：uniCloud/cloudfunctions/common/uni-config-center/uni-frv-external-co/config.json

示例源码如下，请查看 pre > code 标签中的内容

将uni-frv-external插件导入至项目中，由于uni-frv-external提供的实名认证入口是组件形式，需要自行准备实名认证页面，将uni-frv-external-realname引入至页面中。

示例源码如下，请查看 pre > code 标签中的内容

以下是start事件的返回值，用于开发者向业务服务器获取certifyId时使用。获取后调起人脸识别界面。

以下是finish事件的返回值，用于开发者向业务服务器查询认证结果。

startFacialRecognitionVerify(certifyId: string)方法说明

在 start 事件中获取到 certifyId 之后，通过 startFacialRecognitionVerify 方法调起人脸识别界面。 详细使用方式，参考下方示例。

示例源码如下，请查看 pre > code 标签中的内容

uni-frv-external-co 只支持URL化方式访问，在调用之前需要在uniCloud控制台-云函数中设置 uni-frv-external-co 的URL路径。 为了保证URL化后的网络传输安全，内置了uni-cloud-s2s 公共模块的鉴权校验功能，对请求进行安全校验。

uni-frv-external-co提供的接口，默认开启了鉴权验证。 请求鉴权能力由 uni-cloud-s2s 公共模块提供，了解 uni-cloud-s2s 详见

支持以下两种认证方式，根据业务需求选择不同的认证方式

如在您的业务也在uniCloud并且需要签名请求认证，可以使用uni-cloud-s2s提供的getSecureHeaders方法生成签名请求头 详见

如果在uniCloud之外的场景中使用签名认证方式请求，参考非云函数场景签名方法

示例源码如下，请查看 pre > code 标签中的内容

以下示例的请求地址均为示例，在实际使用中将更换为云函数URL化地址。

示例源码如下，请查看 pre > code 标签中的内容

获取认证结果（getAuthResult）

示例源码如下，请查看 pre > code 标签中的内容

以下示例的请求地址均为示例，在实际使用中将更换为云函数URL化地址。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.startFacialRecognitionVerify({
    certifyId:"",
    progressBarColor: "#CC0000", //刷脸圈的颜色
    screenOrientation: "port", //认证界面UI朝向
    success:(e)=>{
        console.log(JSON.stringify(e))
    },
    fail:(e)=>{
        console.log(JSON.stringify(e))
    },
    complete:(e)=>{
        console.log(JSON.stringify(e))
    }
})
```

Example 2 (javascript):
```javascript
uni.startFacialRecognitionVerify({
    certifyId:"",
    progressBarColor: "#CC0000", //刷脸圈的颜色
    screenOrientation: "port", //认证界面UI朝向
    success:(e)=>{
        console.log(JSON.stringify(e))
    },
    fail:(e)=>{
        console.log(JSON.stringify(e))
    },
    complete:(e)=>{
        console.log(JSON.stringify(e))
    }
})
```

Example 3 (javascript):
```javascript
uni.startFacialRecognitionVerify({
    certifyId:"",
    progressBarColor: "#CC0000", //刷脸圈的颜色
    screenOrientation: "port", //认证界面UI朝向
    success:(e)=>{
        console.log(JSON.stringify(e))
    },
    fail:(e)=>{
        console.log(JSON.stringify(e))
    },
    complete:(e)=>{
        console.log(JSON.stringify(e))
    }
})
```

Example 4 (javascript):
```javascript
uni.startFacialRecognitionVerify({
    certifyId:"",
    progressBarColor: "#CC0000", //刷脸圈的颜色
    screenOrientation: "port", //认证界面UI朝向
    success:(e)=>{
        console.log(JSON.stringify(e))
    },
    fail:(e)=>{
        console.log(JSON.stringify(e))
    },
    complete:(e)=>{
        console.log(JSON.stringify(e))
    }
})
```

---

## uni-ai开发文档 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-ai

**Contents:**
- # uni-ai开发文档
- # API
  - # 获取LLM实例
  - # 对话
    - # 简单示例
    - # 流式响应
  - # AI多媒体能力
    - # 创建AI多媒体实例
    - # 创建图片生成任务
    - # 获取图片生成结果

新增于HBuilderX正式版 3.7.10+， Alpha版 3.7.13+。

HBuilderX 3.8.5+支持在本地调试云函数时使用uni-ai计费网关

使用低版本HBuilder，只能上传到uniCloud云端联调。因为低版本的uniCloud本地运行插件不支持uni-ai。云端和本地扩展库差异参考：云端和本地扩展库差异

ai作为一种云能力，相关调用被整合到uniCloud中。

如您的服务器业务不在uniCloud上，可以把云函数URL化，把uni-ai当做http接口调用。

在实际应用中，大多数场景是直接使用uni-ai-chat和uni-cms的ai功能，这些开源项目已经把完整逻辑都实现，无需自己研究API。

ai能力由uni-cloud-ai扩展库提供，在云函数或云对象中，对右键配置uni-cloud-ai扩展库。如何使用扩展库请参考：使用扩展库

如果HBuilderX版本过低，在云函数的扩展库界面里找不到uni-ai。

注意uni-ai是云函数扩展库，其api是uniCloud.ai，不是需要下载的三方插件，它是一个底层能力。 而uni-ai-chat和uni-cms等开源项目，是需要在插件市场下载的。

LLM，全称为Large Language Models，指大语言模型。

LLM的主要特点为输入一段前文，可以推导预测下文。

LLM不等于ai的全部，除了LLM，还有ai生成图片等其他模型。

用法：uniCloud.ai.getLLMManager(Object GetLLMManagerOptions);

注意需在相关云函数或云对象中加载uni-cloud-ai使用扩展库，否则会报找不到ai对象。

在2023年06月15日前，您不填写相关apiKey时可以免费使用uni-ai的LLM能力。但6月15日起需配置自己的apiKey或使用uni-ai计费网关，否则无法使用。详见uni-ai计费老用户升级指南 2023年07月25日非uni-ai计费网关调用百度接口由内测接口调整为文心千帆大模型接口 ，HBuilderX本地调试自HBuilderX 3.8.12起支持。新接口支持流式响应。

参数说明GetLLMManagerOptions

大语言模型的推理需要消耗很高的GPU算力，调用大模型需要在模型厂商处注册账户和付费。

您可以自行去大模型厂商处注册并填写相应的apiKey的参数。也可以通过DCloud来购买，即使用uni-ai计费网关。

uni-ai计费网关使用门槛低，并且可以一处充值，多模型体验。您无需在多个大模型厂商处申请，只需向DCloud购买token套餐，即可体验各种大模型的效果。

uni-ai计费网关的token计费单价与大模型厂商的定价相同，支持开具发票。

uni-ai作为一个国际化业务，支持国内外各种开发者面向国内外各种用户开发应用。 但开发者务必需注意您的应用是否符合当地政府监管要求、是否满足大模型厂商的限制政策。比如中国的大模型目前只能在大陆地区面向中国国籍用户使用，而国外的模型也有类似的区域限制。在uniCloud web控制台开通uni-ai计费网关时，您需要同意相关许可协议。

uni-ai计费网关目前支持付费使用七牛云提供的大模型服务和大模型厂商minimax，以及微软与openai合作提供的基于azure的ChatGPT3.5（与openai的ChatGPT3.5一致）。

在云函数或云对象中编写如下代码调用LLM服务：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在您使用uni-ai计费网关后，且在云函数代码中做好配置后。您可以：

使用uni-ai计费网关时，在云函数url化、定时触发、云函数单实例多并发，这3个场景需要传递客户端appId，即您应用的manifest.json里的appid。

如果是在HBuilder内直接运行云函数（非客户端联调调用）也无法获取appId，此时可参考此文档进行参数模拟：模拟客户端类型

云函数无法直接连通openai的服务器，您需要自行配置代理。如果使用的代理需要用户名和密码，请在代理地址中加入用户名和密码，例如：username:password@host:port。

uni-ai在请求openai时会自动将openai的域名替换为配置的代理域名或ip，一般的反向代理服务器均可满足此需求。

示例源码如下，请查看 pre > code 标签中的内容

对话接口响应一般比较慢，建议将云函数超时时间配置的长一些，比如30秒（客户端访问云函数最大超时时间：腾讯云为30秒，阿里云为60秒）。如何配置云函数超时时间请参考：云函数超时时间

本地运行云函数超时时间默认为10秒，超时将停止执行云函数，建议在本地调试时也将超时时间调大一些，避免调试时频繁超时。云函数本地超时时间设置

用法：llmManager.chatCompletion(Object ChatCompletionOptions)

参数说明ChatCompletionOptions

需注意messages末尾有个s，它是数组，而不是简单的字符串。其中每项由消息内容content和角色role组成。

示例源码如下，请查看 pre > code 标签中的内容

当开发者需要为用户的场景设置背景时，则需在云端代码写死system，而用户输入的问题则被放入user中，然后一起提交给LLM。

开发者可以在system里限制对话背景，防止ai乱答问题。然后给用户提供输入框，假使用户咨询了：“谣言传播多少人可以定罪？”，那么拼接的message就是：

示例源码如下，请查看 pre > code 标签中的内容

对于不支持system的情况，如baidu，只能把system对应的内容写到第一条user信息内，也可以达到一定范围内的控制效果。

注意：对于法律、医学等专业领域需要准确回答的，建议使用gpt-4模型。其他模型更适合闲聊、文章内容生成。

assistant这个角色的内容，是ai返回的。当需要持续聊天、记忆前文时，需使用此角色。

因为LLM没有记忆能力，messages参数内需要包含前文，LLM才能记得之前聊天的内容。

以下的messages示例，是第二轮ai对话时发送的messages的示例。在这个示例中，第一个user和assistant的内容，是第一轮ai对话的聊天记录。 最后一个user是第二轮对话时用户提的问题。

因为用户提问的内容“从上述方法名中筛选首字母为元音字母的方法名”，其中有代词“上述”，为了让ai知道“上述”是什么，需要把第一轮的对话内容也提交。

示例源码如下，请查看 pre > code 标签中的内容

在持续对话中需注意，messages内容越多则消耗的token越多，而LLM都是以token计费的。

token是LLM的术语，ai认知的语言是经过转换的，对于英语，1个token平均是4个字符，大约0.75个单词；对于中文，1个汉字大约是2个token。

如何在节省token和保持持续对话的记忆之间平衡，是一个挺复杂的事情。开发者需在适合时机要求ai对上文进行总结压缩，下次对话传递总结及总结之后的对话内容以实现更长的对话。

DCloud在uni-ai-chat 和uni-cms 中， 已经写好了这些复杂逻辑。开发者直接使用DCloud封装好的开源项目模板即可。

在上述例子中，还可以看到一种有趣的用法，即要求ai以数组方式回答问题。这将有利于开发者格式化数据，并进行后置增强处理。

每个AI Provider可以有多个model，比如对于openai，ChatGPT的模型是gpt-3.5-turbo，而gpt-4的模型就是gpt-4。不同模型的功能、性能、价格都不一样。

也有一些AI Provider只有一个模型，此时model参数可不填。

如果您需要非常精准的问答，且不在乎成本，推荐使用gpt-4。如果是普通的文章内容生成、续写，大多数模型均可胜任。

openai gpt-3.5-turbo: 4097

azure gpt-3.5-turbo: 8192

abab4-chat、abab5-chat: 4096

deepseek-chat、deepseek-reasoner: 8192

baidu文心千帆最后一个message的content长度（即此轮对话的问题）不能超过2000个字符；如果messages中content总长度大于2000字符，系统会依次遗忘最早的历史会话，直到content的总长度不超过2000个字符

tokensToGenerate指生成的token数量限制，即返回的文本对应的token数量不能超过此值。注意这个值不是总token。

注意此值和传入messages对应的token数量，两者相加不可大于模型最大上下文token数。如果messages对应的token数为1024，当传递的tokensToGenerate参数大于（模型最大上下文token数-1024）时接口会抛出错误。

使用minimax时默认最多生成512个token的结果，也就是返回结果不会很长。如有需求请自行调整此值。

自行设置apikey调用azure接口时需要传deploymentId，使用uni-ai计费网关访问azure服务时需要传递model而不是deploymentId。目前通过uni-ai计费网关调用azure接口仅支持gpt-3.5-turbo这一个模型。

deepseek-reasoner模型是deepseek的推理模型，在正式回答之前会生成思考过程，用于推理、解释、问答等场景。

deepseek-reasoner的输出 token 数包含了思维链和最终答案的所有 token。

在你的云函数中加载uni-cloud-ai扩展库，写下如下代码，ctrl+r运行，即可调用ai返回结果。

示例源码如下，请查看 pre > code 标签中的内容

如果你之前未使用过uniCloud，后续有专门的新手指南章节。

新增于HBuilderX正式版 3.7.10+， alpha版 HBuilderX 3.8.0+。

uni-ai chatCompletion接口支持传sseChannel参数的用法云端支持新增于2023年6月15日，HBuilderX 3.8.5+支持在本地调试云函数时使用此用法。使用uni-ai计费网关流式响应时，sseChannel参数必填

访问AI聊天接口时，如生成内容过大，响应时间会很久，前端用户需要等待很长时间才会收到结果。

实际上AI是逐渐生成下一个token的，所以可使用流式响应，类似不停打字的打字机那样，让前端用户陆续看到AI生成的内容。

以往云函数只有return的时候，才能给客户端返回消息。在流式响应中，需要云函数支持sse，在return前给客户端一直发送通知。

uniCloud的云函数，基于uni-push2提供了sse通道，即云函数请求中的中间状态通知通道。

在调用chatCompletion接口时传递参数stream: true即可开启流式响应。使用uni-ai计费网关时还需要传递sseChannel才可以使用流式响应。

关于使用uni-ai计费网关时使用流式响应的说明

流式响应需要云端持续从服务商接收数据并发送给客户端，这需要云函数一直保持运行（云函数无法一直保持运行，详情参考：超时时间）。如果使用uni-ai计费网关则无需云函数保持运行，在请求发送给DCloud服务器后DCloud服务器会使用推送通道将结果通知给客户端，而云函数可以再继续处理下一个请求或者直接休眠，从而节省大量云函数资源（GBs）。

注意，以上事件属于stream对象，不要和sseChannel的事件搞混了，云端调用sseChannel.write客户端就需要使用sseChannel.on('message')进行接受，例如sseChannel并没有optimizedMessage事件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

DCloud提供了开源的uni-ai-chat，对流式响应进行了前后端一体的封装，使用更简单，参考：uni-ai-chat

用法：uniCloud.ai.getMediaManager(Object GetMediaManagerOptions);

注意需在相关云函数或云对象中加载uni-cloud-ai使用扩展库，否则会报找不到ai对象。

参数说明GetMediaManagerOptions

示例源码如下，请查看 pre > code 标签中的内容

用法：mediaManager.imageGeneration(Object ImageGenerationOptions)

参数说明ImageGenerationOptions

百度v1接口（AI作画-基础版）支持的风格：探索无限、古风、二次元、写实风格、浮世绘、low poly 、未来主义、像素风格、概念艺术、赛博朋克、洛丽塔风格、巴洛克风格、超现实主义、水彩画、蒸汽波艺术、油画、卡通画

百度v2接口（AI作画-高级版）不支持传风格，如需指定风格可尝试在提示词内指定

百度v1接口支持以下分辨率：10241024、10241536、1536*1024

百度v2接口支持以下分辨率：512512、640360、360640、10241024、7201280、1280720

示例源码如下，请查看 pre > code 标签中的内容

用法：mediaManager.getGeneratedImage(Object GetGeneratedImageOptions)

参数说明GetGeneratedImageOptions

百度v1接口支持的状态为：'RUNNING'（任务执行中）、'SUCCESS'（任务成功）;

百度v2接口支持的状态为：'INIT'（任务创建中）、'WAIT'（任务等待中）、'RUNNING'（任务执行中）、'FAILED'（任务失败）、'SUCCESS'（任务成功）;

参数securityCheckResult说明

审核状态有以下几种： 'block'（违规）、'review'（需要人工核查）、'pass'（通过审核）

示例源码如下，请查看 pre > code 标签中的内容

新增于HBuilderX 4.71，计费网关（七牛云）新增于HBuilderX 4.75

为了保证在前端调用大模型时不暴露服务商的apiKey信息，uni-ai提供了获取临时鉴权 token 接口。 前端调用此接口获取临时 token 后，使用临时 token 调用服务商的api。

通过使用临时鉴权 token，可以避免在流式返回过程中云函数持续运行带来的资源消耗，将请求直接转发到服务商，大大降低云函数的运行成本。

此接口目前仅支持阿里云百炼、计费网关（七牛云）

用法：llmManager.getTempToken()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在调用uni-cloud-ai提供的api时，如果出现错误，接口会将错误对象抛出。如需处理此类错误需对错误进行捕获

示例源码如下，请查看 pre > code 标签中的内容

错误码：60000，错误信息："A network error occurred while requesting xxx"

请求服务商接口时遇到网络错误，如果是请求openai接口请注意需要使用代理，如果使用了代理仍遇到此错误，请检查代理连通性是否有问题

错误信息："certificate has expired"

请参考文档：云函数通过https访问其他服务器时出现“certificate has expired”

如之前未使用过uni-app，那请重头学起。uni-app官网

如了解uni-app，但未使用过uniCloud。请参考本章节继续。

首先注册开通uniCloud，登录https://unicloud.dcloud.net.cn/ ，创建一个服务空间。

在uni-app项目点右键创建uniCloud环境，关联之前创建的服务空间。

在项目下uniCloud目录右键，新建云函数

填写云函数名称，比如ai-demo。此云函数需要调用uni-cloud-ai扩展库，所以需点击添加公共模块或扩展库依赖按钮。

找到uni-cloud-ai勾选，点击确认，创建云函数

示例源码如下，请查看 pre > code 标签中的内容

如果不从客户端获取参数，直接在云函数里写messages，可以在云函数中直接按Ctrl+R（或工具栏的运行按钮），在本地运行云函数。

还可以断点调试云函数，详见uniCloud运行调试教程

注意uni-app客户端连接uniCloud不是通过uni.request。如果调用云函数是uniCloud.callFunction。（如调用云对象是uniCloud.importObject）

示例源码如下，请查看 pre > code 标签中的内容

运行客户端项目，比如运行到web浏览器，即可联调客户端和云端。

上述代码只是最简示例，真正的多轮聊天需要的代码较多较复杂，推荐使用现成的uni-ai-chat或uni-cms。

官方的uni-ai-chat、uni-cms等项目一般不使用云函数，而是使用云对象。想看懂这些项目源码，需要了解云对象

如需在非uniCloud的传统服务器调用uni-ai，需要先在uniCloud上创建一个云函数或云对象，加载uni-cloud-ai扩展库，编写上述uni-ai的调用代码。

然后将云函数或云对象进行URL化，转成http接口，详见

注意如果使用URL化后，将无法使用stream流式输出。

如果在您的传统服务器和uniCloud云函数之间需要建立安全通信机制，可使用s2s公共模块，详见

大语言模型的推理需要消耗很高的GPU算力，调用大模型需要在模型厂商处注册账户和付费。

您可以自行去大模型厂商处注册并填写相应的apiKey的参数。也可以通过DCloud来购买，即使用uni-ai计费网关。

在2023-06-15前，您不填写相关apiKey时可以免费使用uni-ai的LLM能力。但6月15日起需配置自己的apiKey或使用uni-ai计费网关，否则无法使用。

uni-ai计费网关使用门槛低，并且可以一处充值，多模型体验。您无需在多个大模型厂商处申请，只需向DCloud购买token套餐，即可体验各种大模型的效果。

uni-ai计费网关的token计费单价与大模型厂商的定价相同，支持开具发票。

uni-ai计费网关支持调用七牛云大模型服务（支持模型列表）、minimax、微软azure openai ChatGPT3.5的对话接口，调用getLLMManager时如果不传provider会默认使用minimax作为服务商。

购买uni-ai付费服务，购买流程参考：uni-ai开通流程。

调整完毕后上传依赖uni-ai的云函数/云对象即可，注意即使没有修改也需要重新上传。

在免费版停用后，如果连接云端云函数时未使用uni-ai计费网关且未自行传递key信息，且未在2023年6月15日0点后更新云函数，则会遇到token is unusable错误。如果使用在2023年6月15日0点后更新了云函数，则会提示尚未购买uni-ai套餐。

此外使用HBuilderX 3.8.4及之前的版本本地运行时无法使用uni-ai计费网关，因此也会遇到token is unusable错误。请使用云端云函数进行调试。

在您使用uni-ai计费网关后，且在云函数代码中做好配置后。您可以：

使用uni-ai计费网关时，如需本地运行需要使用HBuilderX 3.8.5及以上版本。

仅支持使用openai sdk的大模型或者AI服务商

判断要接入的大模型是否支持openai sdk调用，可以在大模型官方文档查看。

在获取getLLMManager实例时provider参数指定为openai，即可接入兼容openai响应规范的大模型。

示例源码如下，请查看 pre > code 标签中的内容

proxy参数与baseURL参数的区别：

model参数（必填）为大模型型号或者时AI服务商提供的大模型型号

示例源码如下，请查看 pre > code 标签中的内容

更多问题欢迎加入uni-ai的uni-im交流群 点此加入

**Examples:**

Example 1 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

Example 2 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

Example 3 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

Example 4 (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

---

## uni-sec-check 公共模块 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-sec-check.html

**Contents:**
- # uni-sec-check 公共模块
- # 使用前必看
- # 配置
- # API
  - # 创建实例
  - # 检测文本
  - # 检测图片
  - # 检测音频
- # 微信检测结果异步通知示例
- # 1.x升级2.x指南

uni-sec-check是一个开源公共模块，用于帮助开发者进行内容安全检测，包括图片鉴黄和文字违规检测。在各种需要用户上传图片或录入文字到数据库的场景中，内容安全检测是非常必要的。通过使用该模块，您可以有效降低内容违规风险。”

本模块设计了provider概念，计划集成多家提供内容安全服务的供应商。

即目前只有微信内容安全检测一个provider

uni-sec-check公共模块仅能在云函数/云对象内使用。如果您不了解公共模块，请参阅 本插件依赖uni-open-bridge-common，且版本需≥1.1.2

插件市场地址：https://ext.dcloud.net.cn/plugin?name=uni-sec-check

uni-sec-check 自身没有配置文件，Ta依赖 uni-open-bridge 的配置 点击查看uni-open-bridge配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在微信公众平台「开发」-「开发设置」-「消息推送」中，启用消息服务，提前保存好EncodingAESKey与token等信息。（此处不涉及微信验证服务器，请自行参考微信文档）

新建云函数（需开启云函数URL化）用于接收微信服务器通知消息，示例代码如下（代码仅供参考，未处理异常）：

示例源码如下，请查看 pre > code 标签中的内容

由于依赖了uni-open-bridge，2.0版本不会向下兼容，请按照以下步骤升级：

步骤一：在uni-config-center中创建配置文件

为了升级到uni-sec-check的V2版本，您需要在uni-config-center中创建uni-id目录，并创建config.json配置文件。如果该文件已经存在，请忽略此步骤。

配置文件的路径为uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json。

创建内容安全检测模块实例UniSecCheck增加必传参数requestId，示例如下

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
const uniSecCheck = new UniSecCheck({
	provider: 'mp-weixin',
	requestId: this.getUniCloudRequestId(), // 云函数内则写 context.requestId 云对象内则写 this.getUniCloudRequestId()
  // appId: '__UNI__XXX'
});
```

Example 2 (css):
```css
const uniSecCheck = new UniSecCheck({
	provider: 'mp-weixin',
	requestId: this.getUniCloudRequestId(), // 云函数内则写 context.requestId 云对象内则写 this.getUniCloudRequestId()
  // appId: '__UNI__XXX'
});
```

Example 3 (css):
```css
const uniSecCheck = new UniSecCheck({
	provider: 'mp-weixin',
	requestId: this.getUniCloudRequestId(), // 云函数内则写 context.requestId 云对象内则写 this.getUniCloudRequestId()
  // appId: '__UNI__XXX'
});
```

Example 4 (css):
```css
const uniSecCheck = new UniSecCheck({
	provider: 'mp-weixin',
	requestId: this.getUniCloudRequestId(), // 云函数内则写 context.requestId 云对象内则写 this.getUniCloudRequestId()
  // appId: '__UNI__XXX'
});
```

---

## uni-pay 2 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-app.html

**Contents:**
- # uni-pay 2
- # 简介
- # uni-pay组成
  - # uni-pay的uni_modules
  - # uni-pay的uni-config-center配置
  - # uni-pay的opendb数据表
- # 示例项目运行教程
- # uni-pay的config-center配置
  - # 完整支付配置示例
  - # 支付回调配置

本文档适用于客户端为 uni-app 且 uni-pay 2.0.0 及以上版本，需 HBuilderX 3.6.5 及以上版本。旧版本文档请访问：uni-pay 1.x 文档

若客户端为 uni-app-x 则请访问：uni-pay-x 文档

支付，重要的变现手段，但开发复杂。在不同端，对接微信支付、支付宝等渠道，前端后端都要写不少代码。

涉及金额可不是小事，生成业务订单、获取收银台、发起支付、支付状态查询、支付异步回调、失败处理、发起退款、退款状态查询、支付统计...众多环节，代码量多，出错率高。

为什么不能有一个开源的、高质量的项目？即可以避免大家重复开发，又可以安心使用，不担心自己从头写产生Bug。

之前uni-pay 1.x版本，仅是一个公共模块，它让开发者无需研究支付宝、微信等支付平台的后端开发、无需为它们编写不同代码，拿来即用，屏蔽差异。

但开发者还是需要自己编写前端页面和云函数，还是有一定的开发难度和工作量的，特别对于新手来说，门槛高、易出错。

uni-pay 2.0 起，补充了前端页面和云对象，让开发者开箱即用。

注意：uni-pay 2 仍内置了uni-pay公共模块，向下兼容uni-pay 1.x，即从uni-pay 1.x可以一键升级到uni-pay 2.x，且不会对你的老项目造成影响。

开发者在项目中引入 uni-pay 后，微信支付、支付宝支付等功能无需自己再开发。由于源码的开放性和层次结构清晰，有二次开发需求也很方便调整。

插件市场地址：https://ext.dcloud.net.cn/plugin?name=uni-pay

代码仓库地址：https://gitcode.com/dcloud/uni-pay.git

注意：线上体验地址用的是阿里云免费版，免费版请求次数有限，如请求失败为正常现象，可直接导入示例项目绑定自己的空间体验。

支付统计（内置于uni-admin的支付统计中）

uni-pay云端一体模板，包含前端页面、云对象、云端公共模块、uni-config-center配置、opendb数据表等内容。以及内置于uni-admin的支付统计报表。

uni-pay的uni_modules 中包含了前端页面、云对象和公共模块，目录结构如下：

示例源码如下，请查看 pre > code 标签中的内容

支付配置不在插件目录中，统一存放在 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js 查看支付配置介绍

支付插件需要创建以下表后才能正常运行，可以右键 database 目录，初始化数据库功能来创建表。

在对接自己的项目之前，建议先跑通示例项目，能跑通示例项目，代表你的配置和证书一定是正确的，然后再将uni-pay集成到你自己的项目中。

开发者在微信和支付宝的支付后台，需要申请开通支付服务，成功后会得到各种凭据，这些凭据要配置在uni-pay的配置中。

这里是微信、支付宝全平台支付配置样例。如果只使用部分支付方式，后续有专门的分渠道章节。

配置文件在 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js

示例源码如下，请查看 pre > code 标签中的内容

如果你对支付配置中各参数如何获取有疑问，请点击获取支付配置帮助

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当然你也可以全部配置了，这样可以方便自由切换V2和V3

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

格式为 "服务空间ID": "URL化地址"

点击此处进入服务空间列表 ，找到你项目用的服务空间，复制其服务空间ID

点击此处进入服务空间列表 ，找到你项目用的服务空间，点击服务空间名称进入空间详情页，点击左侧菜单【云函数/云对象】- 点击【uni-pay-co】云对象右侧的【详情】按钮

进入详情后，点下面的【复制路径】，复制的内容就是【URL化地址】

上面的配置样例是微信和支付宝全端配置样例。如果只使用一种支付场景，比如微信公众号里的微信支付，可以看下面章节的分渠道支付配置样例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 wxpay.jsapi

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 wxpay.mweb

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 wxpay.native

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 alipay.app

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 alipay.native（和PC扫码配置节点一样）

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 alipay.native

示例源码如下，请查看 pre > code 标签中的内容

对应支付配置的节点是 appleiap.app

示例源码如下，请查看 pre > code 标签中的内容

配置文件在 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js

对应支付配置的节点是 wxpay-virtual.mp

示例源码如下，请查看 pre > code 标签中的内容

配置文件在 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js

示例源码如下，请查看 pre > code 标签中的内容

配置文件在 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js

对应支付配置的节点是 huawei.app

示例源码如下，请查看 pre > code 标签中的内容

在对接自己的项目之前，建议先跑通示例项目，能跑通示例项目，代表你的配置和证书一定是正确的，然后再将uni-pay集成到你自己的项目中。

示例源码如下，请查看 pre > code 标签中的内容

打开你需要进行支付的页面，一般是业务订单提交之后的页面来展现收银台。

注意：vue3下ref不可以等于组件名，因此这里 ref="pay" 而不能是 ref="uniPay"

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当用户支付成功后，我们要给用户增加余额或者给业务订单标记支付成功，这些通过异步回调通知来实现的。

提示：异步回调通知写在 uni-pay-co/notify 目录下，在此目录新建2个js文件，分别为 recharge.js、goods.js 文件，同时复制以下代码要你新建的2个js文件里。

示例源码如下，请查看 pre > code 标签中的内容

因为金额 total_fee 是前端传的，因此有被用户篡改的风险，因此需要 判断下total_fee的值是否和你业务订单中的金额一致，如果不一致，直接返回 return false

为什么要你自己创建.js文件，而不是插件默认给你创建好，这是因为后面当插件更新时，你写的代码会被插件更新的代码覆盖（一键合并功能），因此只要插件这里没有文件（而是你自己新建的文件），那么插件更新时，不会覆盖你自己新建的文件内的代码。

最终调用哪个回调逻辑是根据你创建支付订单时，type 参数填的什么，type 如果填 recharge 则支付成功后就会执行 recharge.js 内的代码逻辑。

示例源码如下，请查看 pre > code 标签中的内容

注意：每次修改都需要重新上传云对象uni-pay-co

如果你的业务在uniCloud上，那么可以使用方式一或方式二进行编写自定义回调逻辑。

示例源码如下，请查看 pre > code 标签中的内容

适用场景：业务较为复杂，需写在其他云函数或云对象里的场景。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果你的业务不在uniCloud上，如java或php写的后端服务，uni-pay也可以满足你的支付需求，你只需要使用回调方式三的http接口形式调用你自己系统的回调接口即可。

方式三：使用 await uniCloud.httpclient.request 调用外部http接口

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过 let res = await this.$refs.pay.xxx(); 方式调用，详情调用方式参考下方的【前端完整示例代码】

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-pay-co 所有api返回值均满足uniCloud响应体规范

示例源码如下，请查看 pre > code 标签中的内容

uni-pay前端组件和uni-pay-co云对象的方法是一样的。通常情况下，前端直接调用uni-pay组件内的方法即可（组件内会自动调用云对象内的API，无需再手动调用云对象内的API）

支付组件方法形式（收银台弹窗模式）（推荐）

open和createOrder参数是一致的，唯一区别是open会打开收银台，而createOrder不带收银台，直接调用支付。

open如果只有一种支付方式，比如微信小程序内只能用微信支付，则不会弹收银台，而是直接调用支付。

示例源码如下，请查看 pre > code 标签中的内容

与弹窗模式的区别是：跳页面模式是通过 uni.navigateTo 直接跳到收银台页面，而弹窗模式是在原页面弹出收银台。

示例源码如下，请查看 pre > code 标签中的内容

收银台页面源码在 /uni_modules/uni-pay/pages/pay-desk/pay-desk 中

如果你想要自定义收银台样式，建议复制该页面到你的项目pages目录，如/pages/pay-desk/pay-desk，然后在复制的页面上进行修改样式，同时跳转到自定义收银台的代码如下：

示例源码如下，请查看 pre > code 标签中的内容

不带收银台时，provider参数为必传项，代表支付供应商

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在调用此api前，你应该先创建自己的业务系统订单，并获得订单号 order_no，再把 order_no 当参数传给此api。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

await_notify = true 适合什么场景？

当你下一个页面展示的数据需要依赖支付异步回调内的逻辑执行完成后才可以展示时，需要设置为true。

await_notify = false 适合什么场景？

当你下一个页面展示的数据不需要依赖支付异步回调内的逻辑执行完成后才可以展示时，可以设置为false，设置为false可以加快响应速度。

发起退款默认需要admin权限（基于uni-id用户体系登录），否则会报权限不足或缺少token。查看uni-id介绍

当然，你也可以修改uni-pay-co/config/permission.js这个文件内的权限规则。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一般情况下，无需调用此方法去主动关闭订单（订单若未支付，则会在一段时间后自动关闭），但你有需要主动关闭订单的场景时，可以使用此api来主动关闭订单。（只有未支付的订单才可以主动关闭）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一般情况下，无需调用此api，uni-pay 组件内部已自动调用此api。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一般用于微信公众号根据网页授权回调返回的code获取用户openid

小程序不需要调用此方法，组件内部已自动静默获取openid

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

IAP 全称：In-App Purchase，是指苹果 App Store 的应用内购买，是苹果为 App 内购买虚拟商品或服务提供的一套交易系统。

适用范围：在 App 内需要付费使用的产品功能或虚拟商品/服务，如游戏道具、电子书、音乐、视频、订阅会员、App的高级功能等需要使用 IAP，而在 App 内购买实体商品（如淘宝购买手机）或者不在 App 内使用的虚拟商品（如充话费）或服务（如滴滴叫车）则不适用于 IAP。

简而言之，苹果规定：适用范围内的虚拟商品或服务，必须使用 IAP 进行购买支付，不允许使用支付宝、微信支付等其它第三方支付方式（包括Apple Pay），也不允许以任何方式（包括跳出App、提示文案等）引导用户通过应用外部渠道购买。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

微信规定上架短剧类目的小程序必须使用微信小程序虚拟支付，不可以使用原先的微信支付

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

微信虚拟支付除了支付API以外，还涉及到查询用户代币余额、扣减用户代币、赠送用户代币等API

但这些API并不适合在前端直接调用，否则会有很大的安全隐患，因此API不在 uni-pay 组件和 uni-pay-co 这个云对象中，而是在 uni-pay 公共模块中，以此方便在任何云函数或云对象内调用

uni-pay基于uni统计2.0新增了支付统计。为您赋能数字化运营。

uni-admin 2.2.0即以上版本已内置支付统计，菜单位置为uni统计 / 支付统计

如果你当前使用的是旧版uni-admin，则需要先更新到新版uni-admin（右键admin项目根目录package.json，从插件市场更新，注意合并时的文件对比，如果不对比直接合并会覆盖你之前写的代码）

同时新建一个空的json文件，复制下面的内容到新建的json文件中，最后去uniCloud控制台的opendb-admin-menus表手动导入json文件

示例源码如下，请查看 pre > code 标签中的内容

在概况栏目中可以直观的看到今日、昨日、前日、本周、本月、本季度、本年度、累计数据。

在今日数据栏目中可以看到更多今日统计数据。

在趋势图栏目中以天维度、月维度、季维度、年维度进行趋势统计。可以直观的看到收入的增长趋势。

可以为您分析指定时间段的支付转化率，同时展示支付转化率趋势图。

可以为您快速筛选高价值用户，高复购率用户。

h5的路由模式必须配置为 history，因为微信公众号登录的回调地址不支持 hash 模式。

同时微信公众号开发调试比较麻烦，麻烦在于网页授权需要添加域名白名单，用localhost或用ip访问本地是无法获取到微信的code的，这样也就无法获取openid，导致无法支付。

当用自定义域名时，还需要在项目根目录添加 vue.config.js 文件，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

微信小程序支付除了配置uni-pay的支付配置外，还需要配置 manifest.json 内的 微信小程序appid，如下图所示。

APP支付除了配置uni-pay的支付配置外，还需要打包时添加支付模块，如下图所示。

同时，还需要打自定义基座（包名需要和开放平台下填写的一致），且你在开放平台下的这个应用必须通过审核才可以。（比如微信开放平台下的APP应用显示通过审核才可以）

示例源码如下，请查看 pre > code 标签中的内容

uni-pay 2 仍内置了uni-pay公共模块，向下兼容uni-pay 1.x，即从uni-pay 1.x可以一键升级到uni-pay 2.x，且不会对你的老项目造成影响。

支付插件需要创建支付相关的表后才能正常运行。查看相关的数据库表

本插件对接的支付渠道是微信和支付宝官方渠道

申请地址 https://pay.weixin.qq.com/index.php/apply/applyment_home/guide_normal

申请指引 https://pay.weixin.qq.com/static/applyment_guide/applyment_index.shtml

申请地址 https://open.alipay.com

申请指引 https://opendocs.alipay.com/common/02asmu

支付账号申请需要企业资质（个体工商户也可以，但不可以是个人资质，需要有营业执照，银行对公账户）。

这是由于云开发的域名没有添加到微信小程序域名白名单导致的，需要去微信小程序后台，添加以下域名到微信小程序域名白名单

示例源码如下，请查看 pre > code 标签中的内容

添加完域名后，一定要重启微信开发者工具，然后去手机微信里删除最近使用的小程序（这一步很关键），最后重新扫二维码进入小程序。

方案二：将云函数的node版本切换成node16（支付宝云默认是node18，而node18不再支持微信支付v2证书pfx的加密算法导致的）

打开微信小程序后台 ，依次点击左侧菜单【流量主】-【支付订单详情页广告】- 关闭广告即可。

**Examples:**

Example 1 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        ├─common                            云端公共模块目录
│        │            └─uni-pay                       uni-pay公共模块
│        │        └─uni-pay-co                        集成调用uni-pay方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─dao                           数据库操作相关API
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能（不建议修改此目录下文件）
│        │            │  ├─alipay.js                  支付宝平台相关API
│        │            │  ├─common.js                  一些通用API
│        │            │  ├─crypto.js                  跨云函数通信加解密API
│        │            │  ├─qrcode.js                  云端生成二维码的插件（来自于npm i qrcode的压缩版）
│        │            │  ├─wxpay.js                   微信支付平台相关API
│        │            ├─middleware                    中间件
│        │            ├─notify                        异步通知逻辑（你自己的异步通知逻辑写在这里）
│        │            ├─service                       云对象方法的服务实现
│        │            └─index.obj.js                  云对象入口文件
│        ├─components                                 组件目录
│        │    └─uni-pay                               uni-pay收银台弹窗组件
│        │        └─uni-pay.vue
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 2 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        ├─common                            云端公共模块目录
│        │            └─uni-pay                       uni-pay公共模块
│        │        └─uni-pay-co                        集成调用uni-pay方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─dao                           数据库操作相关API
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能（不建议修改此目录下文件）
│        │            │  ├─alipay.js                  支付宝平台相关API
│        │            │  ├─common.js                  一些通用API
│        │            │  ├─crypto.js                  跨云函数通信加解密API
│        │            │  ├─qrcode.js                  云端生成二维码的插件（来自于npm i qrcode的压缩版）
│        │            │  ├─wxpay.js                   微信支付平台相关API
│        │            ├─middleware                    中间件
│        │            ├─notify                        异步通知逻辑（你自己的异步通知逻辑写在这里）
│        │            ├─service                       云对象方法的服务实现
│        │            └─index.obj.js                  云对象入口文件
│        ├─components                                 组件目录
│        │    └─uni-pay                               uni-pay收银台弹窗组件
│        │        └─uni-pay.vue
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 3 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        ├─common                            云端公共模块目录
│        │            └─uni-pay                       uni-pay公共模块
│        │        └─uni-pay-co                        集成调用uni-pay方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─dao                           数据库操作相关API
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能（不建议修改此目录下文件）
│        │            │  ├─alipay.js                  支付宝平台相关API
│        │            │  ├─common.js                  一些通用API
│        │            │  ├─crypto.js                  跨云函数通信加解密API
│        │            │  ├─qrcode.js                  云端生成二维码的插件（来自于npm i qrcode的压缩版）
│        │            │  ├─wxpay.js                   微信支付平台相关API
│        │            ├─middleware                    中间件
│        │            ├─notify                        异步通知逻辑（你自己的异步通知逻辑写在这里）
│        │            ├─service                       云对象方法的服务实现
│        │            └─index.obj.js                  云对象入口文件
│        ├─components                                 组件目录
│        │    └─uni-pay                               uni-pay收银台弹窗组件
│        │        └─uni-pay.vue
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 4 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        ├─common                            云端公共模块目录
│        │            └─uni-pay                       uni-pay公共模块
│        │        └─uni-pay-co                        集成调用uni-pay方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─dao                           数据库操作相关API
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能（不建议修改此目录下文件）
│        │            │  ├─alipay.js                  支付宝平台相关API
│        │            │  ├─common.js                  一些通用API
│        │            │  ├─crypto.js                  跨云函数通信加解密API
│        │            │  ├─qrcode.js                  云端生成二维码的插件（来自于npm i qrcode的压缩版）
│        │            │  ├─wxpay.js                   微信支付平台相关API
│        │            ├─middleware                    中间件
│        │            ├─notify                        异步通知逻辑（你自己的异步通知逻辑写在这里）
│        │            ├─service                       云对象方法的服务实现
│        │            └─index.obj.js                  云对象入口文件
│        ├─components                                 组件目录
│        │    └─uni-pay                               uni-pay收银台弹窗组件
│        │        └─uni-pay.vue
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

---

## uni-map-common 公共模块 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-map-common.html

**Contents:**
- # uni-map-common 公共模块
- # 公共返回参数
- # 地图key
  - # 申请腾讯地图key
  - # 申请高德地图key
  - # 客户端
- # 初始化实例
- # API
  - # 逆地址解析（坐标转地址）
  - # 地址解析（地址转坐标）

不管高德还是腾讯地图，都有众多服务端API，比如逆地址解析。uni-map-common对这些API进行了统一封装，抹平了差异。

开发者只需使用uni-map-common，就可以更简单的使用地图的云接口。并且方便在不同地图厂商之间切换。

同时本公共模块也是 uniCloud-map 云端一体地图 的基础支撑模块。

uni-map-common公共模块仅能在云函数/云对象内使用。如果您不了解公共模块，请参阅

插件市场地址：https://ext.dcloud.net.cn/plugin?name=uni-map-common

调用地图API需要先在对应的地图开放平台申请key

key的配置文件：/uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-map/config.js

申请步骤：点击我的应用，创建新应用，添加key，key的类型选WebServiceAPI，白名单留空

key的配置文件：manifest.json

key的配置文件：/uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-map/config.js

申请步骤：点击我的应用，创建新应用，添加key，key的类型选Web服务，白名单留空

key的配置文件：manifest.json

示例源码如下，请查看 pre > code 标签中的内容

主要用于将经纬度坐标识别为详细地址，如：39.908815,116.397507 识别为 北京市东城区西长安街1号

同时还能获取到经纬度所在省、市、区、乡镇、门牌号、行政区划代码，及周边参考位置信息，如道路及交叉口、河流、湖泊、桥等

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于将文字地址转换成对应的经纬度坐标，同时识别文字地址中的行政区域

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

实现从其它地图供应商坐标系或标准GPS坐标系，批量转换到指定地图供应商的坐标系。

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

通过终端设备IP地址获取其当前所在地理位置，常用于显示当前所在城市。

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于获取输入关键字的补完与提示，帮助用户快速输入。需配合前端程序实现Autocomplete（自动完成）的效果。

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于搜索周边地点，如，搜索颐和园附近半径500米内的酒店（一个圆形范围）

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于查询四级行政区划列表：省、市、区、街道

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于计算从起点到终点驾车的路线以及结合实时路况、少收费、不走高速等多种偏好，精准预估到达时间。

示例源码如下，请查看 pre > code 标签中的内容

0：速度优先（只返回一条路线），此路线不一定距离最短

1：费用优先（只返回一条路线），不走收费路段，且耗时最少的路线

2：距离优先（只返回一条路线），仅走距离最短的路线，但是可能存在穿越小路/小区的情况

3：速度优先（只返回一条路线），不走快速路，例如京通快速路

101：该策略会通过终点坐标查找所在地点（如小区/大厦等），并使用地点出入口做为目的地，使路径更为合理

注意：高德地图支持除101外的所有策略，腾讯地图只支持 0、34、35、36、37、101

9：腾讯地图：不支持 高德地图：停车场内部

仅列出result内的参数，其他参数见 公共返回参数

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于计算从起点到终点基于自行车的骑行路线规划

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

用于计算从起点到终点基于电动自行车的骑行路线规划

示例源码如下，请查看 pre > code 标签中的内容

仅列出result内的参数，其他参数见 公共返回参数

基于公共汽车、地铁、火车等公共交通工具，计算起到终点的路线换乘方案，同时提供少换乘、少步行等偏好设置，支持一次返回多条方案以供用户选择。

示例源码如下，请查看 pre > code 标签中的内容

6：地铁图模式，起终点都是地铁站（地铁图模式下originpoi及destinationpoi为必填项）

注意：高德地图支持所有策略，腾讯地图只支持 0、2、3、5、6、7

仅列出result内的参数，其他参数见 公共返回参数

响应结果 - 交通方式 - 公共交通（transit） 本段为公共交通方式的对象结构，对应steps[]数组下的子对象（“mode”:“transit”）

通过此接口可以调用未集成在 uni-map-common 模块内的 API

示例源码如下，请查看 pre > code 标签中的内容

答：使用地图服务需要商业授权，可联系DCloud申请折扣优惠。详情参考 商业授权相关说明

**Examples:**

Example 1 (javascript):
```javascript
// 引入uni-map-common公共模块
const UniMap = require('uni-map-common');
// 初始化实例
let uniMap = new UniMap({
	provider: "qqmap", // 指定使用哪家地图供应商
	key: "xxxxxx",
	needOriginalResult: false, // 是否需要返回原始信息
});
```

Example 2 (javascript):
```javascript
// 引入uni-map-common公共模块
const UniMap = require('uni-map-common');
// 初始化实例
let uniMap = new UniMap({
	provider: "qqmap", // 指定使用哪家地图供应商
	key: "xxxxxx",
	needOriginalResult: false, // 是否需要返回原始信息
});
```

Example 3 (javascript):
```javascript
// 引入uni-map-common公共模块
const UniMap = require('uni-map-common');
// 初始化实例
let uniMap = new UniMap({
	provider: "qqmap", // 指定使用哪家地图供应商
	key: "xxxxxx",
	needOriginalResult: false, // 是否需要返回原始信息
});
```

Example 4 (javascript):
```javascript
// 引入uni-map-common公共模块
const UniMap = require('uni-map-common');
// 初始化实例
let uniMap = new UniMap({
	provider: "qqmap", // 指定使用哪家地图供应商
	key: "xxxxxx",
	needOriginalResult: false, // 是否需要返回原始信息
});
```

---

## 云函数内使用JQL | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/jql-cloud.html

**Contents:**
- # 云函数内使用JQL
- # 为云函数添加jql扩展库
- # 云函数中使用
- # 云对象中使用
- # setUser指定用户身份
- # 与clientDB的差异
- # 注意事项

对于不适合在前端暴露的数据库操作，过去只能在云函数中使用传统MongoDB语法。此次更新让云函数也可以使用 JQL 来操作数据库。

相比于传统 MongoDB语法，JQL 为云函数带来如下价值：

本文主要讲解云函数中如何使用 JQL 。详细的 JQL 语法另见文档：JQL数据库操作

JQL 操作的引擎代码体积不小，考虑到有的云函数并不操作数据库或不使用JQL，所以相关功能被剥离在uni-cloud-jql扩展库中。

HBuilderX 3.4起，新建云函数/云对象，默认加载uni-cloud-jql扩展库。对于老云函数，也可以对云函数点右键 -> 管理公共模块或扩展库依赖 -> 选择uni-cloud-jql

HBuilderX 3.4以前的开发者，需要在云函数的package.json内手动添加扩展库。（如果云函数目录下没有package.json，可以通过在云函数目录下执行npm init -y来生成）

下面是一个开启了jql扩展库的云函数的package.json示例，注意不可有注释，以下文件内容中的注释仅为说明，如果拷贝此文件，切记去除注释

示例源码如下，请查看 pre > code 标签中的内容

对于确定在云函数/云对象中不需要使用 JQL 扩展库的，请对云函数右键，取消uni-cloud-jql扩展库。这样可以减少云函数体积，提高性能。

uniCloud.databaseForJQL方法，传入客户端信息，就可以得到一个JQL数据库操作对象。

示例源码如下，请查看 pre > code 标签中的内容

云对象中无法获取event和context，为方便在云对象中使用jql扩展，自HBuilderX 3.4.10起，uniCloud.databaseForJQL方法接收云对象clientInfo作为参数

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，jql扩展使用的是客户端的身份，准确的说是客户端的uniIdToken对应的用户作为执行数据库操作的用户。

如需在云函数/云对象中指定执行其他用户身份，需使用setUser方法

setUser方法的参数是一个对象，可传入uni-id的uid、role、permission，组合生效。

示例源码如下，请查看 pre > code 标签中的内容

虽然都使用 JQL，但云端和客户端还是有一点区别

**Examples:**

Example 1 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

Example 2 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

Example 3 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

Example 4 (json):
```json
{
	"name": "jql-test",
	"version": "1.0.0",
	"description": "",
	"main": "index.js",
	"extensions": {
		"uni-cloud-jql": {} // 配置为此云函数开启jql扩展库，值为空对象留作后续追加参数，暂无内容
	},
	"author": ""
}
```

---

# Unicloud - Other

**Pages:** 39

---

## uni直播 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-live/intro.html

**Contents:**
- # uni直播
- # 应用场景
  - # 事件直播
  - # 教育直播
  - # 游戏直播
- # 产品优势

uni直播是DCloud与七牛云合作推出的直播服务，DCloud 官方内置，使用简单；且价格便宜，更具性价比！

多元化、多功能、适应多平台的推流 SDK，支持各种视频采集端，提供即时直播、即时播放等便利；

覆盖广泛的实时流网络 (LiveNet)智能调度系统，可支持海外事件的直播接入，在国内即时播放，且智能调度让用户从最佳节点观看视频，完美应对大事件的高并发观看，降低事件直播的卡顿率；

支持对热点事件直播内容进行录制转存，并可根据需求转存为不同的格式，满足不同用户对事件内容回放和点播的需求；

提供安全且有保证的直播鉴权，保证事件直播内容的合法推流和分发

适用场景：K12教育，外语学习，企事业单位及公司技能培训等

提供完善的直播云管理系统及实时流网络 (LiveNet)智能调度系统，为教学提供稳定且实时的直播服务，提高教育服务质量；

基于AK/SK的认证及限制时间的直播鉴权，保证教学课程的直实性和安全性，防止教学视频被盗链或非法篡改，提升教学质量；

完善的数据统计信息和分析信息，帮助教学平台快速掌握感兴趣用户的信息和行为特征，用来调整课程时长或内容；

支持对教学中的重要内容进行录制保存，帮助教学平台和学生对重要的教学素材进行反复学习

强大且覆盖广泛的实时流网络 (LiveNet)加速分发节点，可快速的将游戏直播内容进行分发，同时强大的实时转码和码流自适应，强力解决游戏直播高并发、低延迟的场景；

提供丰富的播放器接入 SDK，方便游戏爱好者通过任何设备和终端观看游戏直播，同时对直播进行详细的数据统计和分析，帮助游戏平台快速掌握玩家和爱好者的行为特征；

可对游戏直播中热点内容进行录制保存，帮助游戏平台打造完善回放服务，为游戏爱好者提供热点内容的反复播放

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/send-sms.html

---

## uni-cloud-router | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-router

**Contents:**
- # uni-cloud-router
- # 云函数端
  - # 安装
- # 介绍
  - # 目录结构
  - # 快速开始
- # 深入学习
  - # 控制器（Controller）
    - # 如何编写 Controller
    - # 获取请求参数

基于 koa 风格的 uniCloud 云函数路由库，同时支持 uniCloud 客户端及 URL 化访问

源码仓库：https://gitee.com/dcloud/uni-cloud-router

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了快速上手，提供了一个简单的 demo 示例，以创建是一个 hello-uni-cloud-router 云函数为例，演示如何通过 uni-cloud-router 组织代码：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

3.在 controller 文件夹下创建一个 hello.js

示例源码如下，请查看 pre > code 标签中的内容

4.在 service 文件夹下创建一个 hello.js

示例源码如下，请查看 pre > code 标签中的内容

到这里，已创建好了是一个 hello-uni-cloud-router 云函数（注意：需上传云函数后，前端才能访问)。

在页面中通过callFunction访问 hello（controller）下 sayHello：

示例源码如下，请查看 pre > code 标签中的内容

以上代码仅作为示例，建议点击右侧【使用 HBuilderX 导入示例项目】尝试。

负责解析用户的输入，处理后返回相应的结果。

推荐 Controller 层主要对用户的请求参数进行处理（校验、转换），然后调用对应的 service 方法处理业务，得到业务结果后封装并返回：

所有的 Controller 文件都必须放在 controller 目录下，可以支持多级目录，访问的时候可以通过目录名级联访问。

示例源码如下，请查看 pre > code 标签中的内容

定义的 Controller 类，会在每一个请求访问时实例化一个全新的对象，会有下面几个属性挂在 this 上。

通过在 Controller 上绑定的 Context 实例的 data 属性，获取请求发送过来的参数

示例源码如下，请查看 pre > code 标签中的内容

通过 Service 层进行业务逻辑的封装，不仅能提高代码的复用性，同时可以让业务逻辑更好测试。

Controller 中可以调用任何一个 Service 上的任何方法，同时 Service 是懒加载的，只有当访问到它的时候才会去实例化它。

示例源码如下，请查看 pre > code 标签中的内容

Service 的具体写法，请查看 Service 章节。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在某些场景下，cookie依然占有重要地位，例如在云函数URL化的情况下，获取客户端的状态

在云函数中使用cookie需要依赖cookie库npm页面地址 ，可以通过npm install cookie 安装

示例源码如下，请查看 pre > code 标签中的内容

业务逻辑封装的一个抽象层，有以下几个好处：

所有的 Service 文件都必须放在 service 目录下，可以支持多级目录，访问的时候可以通过目录名级联访问。

示例源码如下，请查看 pre > code 标签中的内容

定义的 Service 类是懒加载的，只有当访问到它的时候才会去实例化它，会有下面几个属性挂在 this 上。

在 Controller 中调用 Service

在路由请求前，后添加处理逻辑，实现一些特定功能，如：用户登录，权限校验等

与 koa 保持一致，参考：koa 中间件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

match 设置只有符合某些规则的请求才会经过这个中间件。

ignore 设置符合某些规则的请求不经过这个中间件。

Context 是一个请求级别的对象，在每一次收到用户请求时，会实例化一个 Context 对象，这个对象封装了这次用户请求的信息，并提供了许多便捷的方法来获取请求参数或者设置响应信息。框架会将所有的 Service 挂载到 Context 实例上

最常见的 Context 实例获取方式是在 Middleware, Controller 以及 Service 中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (bash):
```bash
npm install --save uni-cloud-router
```

Example 2 (bash):
```bash
npm install --save uni-cloud-router
```

Example 3 (unknown):
```unknown
npm install --save uni-cloud-router
```

Example 4 (bash):
```bash
npm install --save uni-cloud-router
```

---

## 业务开通 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/sms/service.html

**Contents:**
- # 业务开通
  - # 开通流程
  - # 充值
  - # 签名配置
    - # 创建签名
    - # 签名服务商管理
  - # 模板配置
    - # 创建模板
    - # 模板服务商管理
  - # 安全配置

使用开发者账号登录uniCloud控制台 ，选择短信服务栏目。在使用此功能前需要完成实名认证，可前往开发者中心 完成实名认证。

完成实名认证后，阅读短信服务协议并点击协议下方的“同意协议并开通”按钮，便可开通短信服务。

短信服务为预付费业务，在发送短信之前，需要先进行充值。点击页面上的“充值”按钮，可以选择预设金额进行充值，也可以选择自定义金额进行充值，充值金额最小为1元。

短信签名是短信内容前的标识符，用于标识短信发送方。例：【dcloud】验证码：${code}，5分钟内有效，请勿泄露并尽快验证。其中"dcloud"即为签名。

系统支持多服务商签名管理，为了提高短信发送的稳定性和灵活性，同一个签名可以同时在多个服务商创建。目前支持的服务商包括：个推（默认）和网易。

创建签名后，可以通过"服务商管理"功能查看和管理该签名下的所有服务商：

在服务商管理页面，可以查看该签名下所有服务商的状态：

列表中带"✓"标记的为当前正在使用的服务商，切换当前服务商后，该签名下的所有模板会同步切换发送渠道。

如果签名只在一个服务商创建，可以点击"新增服务商"按钮，为该签名添加另一个服务商：

注意：如果签名有多个服务商，编辑时签名内容不可修改，需要修改请先删除其他服务商

点击"设为当前"可以切换当前使用的服务商：

个推服务商审核通过后，可以点击"补充信息"添加更多证明材料，以提高签名的稳定性和通过率

短信模板是短信的具体内容格式，支持使用变量参数实现动态内容。目前短信签名创建后可立即前往创建短信模板，无需等待签名审核通过，且添加短信模板可提高签名审核通过机率。

模板支持多服务商管理，模板的服务商由所选签名决定。当创建模板时，系统会根据签名已开通的服务商自动在对应的服务商下创建模板版本。

选择已创建的签名，签名列表会显示该签名支持的服务商：

签名显示格式为：签名名称（服务商1、服务商2）

如果模板中使用了变量（如${code}），需要设置每个变量的数据类型。

系统会自动识别模板中的变量，并要求设置参数类型，发送短信时会检验参数是否符合设置的参数类型。

填写模板的使用场景说明，便于审核人员了解模板用途，提高审核通过率。

创建模板后，可以通过"服务商管理"功能查看和管理该模板下的所有服务商版本：

在服务商管理页面，可以查看该模板下所有服务商的状态：

列表中带"✓"标记的为当前正在使用的服务商。模板当前使用的服务商由签名的当前服务商决定，如需切换请前往对应签名的服务商管理页面操作。

当服务商状态为"驳回"时，可以编辑该服务商的模板内容并重新提交审核：

模板审核通过后，即可在代码中使用，具体调用方式请参考开发文档 。

系统提供了 uniCloud 服务空间白名单安全配置，可以提高接口调用安全性，防止被他人盗用。可点击“添加”按钮，选择相应的服务空间完成添加服务空间白名单，服务空间添加成功后，只有列表中的服务空间才可以调用当前账号下的短信接口。此列表为空时，不校验调用方的服务空间。

系统可查看短信发送记录，但此业务数据量较大，为了维持服务的稳定性，只能查看30天内的某1天的全部调用记录，默认选择当天。

系统可查看每日发送汇总数据，包括每日请求次数、每日请求成功次数、成功回执数、计费条数、计费金额等汇总数据。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/send-sms

---

## 开发指南 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-live/dev.html

**Contents:**
- # 开发指南
- # 客户端
  - # uni-app
    - # 推流
    - # 拉流
  - # uni-app x
    - # 推流
    - # 拉流
- # 云函数
  - # 启用uni-cloud-live扩展库

uni直播可在uni-app或者uni-app x中快速集成，同时也支持使用第三方推流工具和拉流工具使用，详见

以下介绍在uni-app中如何实现推流和拉流，详细的示例代码请参考

uni-app 使用 live-pusher 组件进行推流。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序端使用live-player 组件进行直播拉流；web/app端，使用video 组件进行直播拉流。

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app x 中推拉流， 需要 HBuilderX 4.81 及以上版本。

在 uni-app x 推流前，需要申请授权应用包名与推流地址域名，如需申请请加入uni直播技术交流群 联系管理员，申请会在一个工作日内处理完。

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 使用 live-pusher 组件进行推流。

示例源码如下，请查看 pre > code 标签中的内容

app端和小程序都使用live-player 组件进行直播拉流，web端使用video 组件进行直播拉流。

示例源码如下，请查看 pre > code 标签中的内容

uni直播除了通过uniCloud控制台操作外，还可以在云函数中通过API创建推拉流。

uni直播是单独的扩展库，开发者需手动将uni-cloud-live扩展库添加到云函数或云对象的依赖中。

uni-cloud-live 扩展库主要的功能就是生成推流地址和拉流地址，生成的地址可以直接在客户端使用。

生成推拉流地址时无需提前创建直播流，生成地址时会自动创建。

示例源码如下，请查看 pre > code 标签中的内容

API: uniCloud.getLiveManager()

API：liveManager.stream.create(name)

示例源码如下，请查看 pre > code 标签中的内容

API: liveManager.stream.list(params: Params)

API: liveManager.stream.detail(name: string)

API: liveManager.stream.delete(name: string)

API: liveManager.stream.forbidden(name: string)

API: liveManager.stream.release(name: string)

API: liveManager.stream.stop(name: string)

API: liveManager.stream.generatePushUrl(name: string | string[], domain: string)

如域名开启了时间戳鉴权，生成的连接会带上鉴权信息。

示例源码如下，请查看 pre > code 标签中的内容

API: liveManager.stream.generatePullUrl(name: string | string[], domain: string)

如域名开启了时间戳鉴权，生成的连接会带上鉴权信息。

示例源码如下，请查看 pre > code 标签中的内容

API: liveManager.domain.getPushDomainDetail(domain: string)

API: liveManager.domain.getPullDomainDetail(domain: string)

API: liveManager.domain.uploadCertificate(params: Params)

API: liveManager.domain.listCertificates(params: Params)

API: liveManager.domain.deleteCertificate(params: Params)

API: liveManager.domain.updateCertificate(params: Params)

API: liveManager.domain.updatePushDomainCertificate(params: Params)

API: liveManager.domain.updatePullDomainCertificate(params: Params)

HBuilderX 5.0 及以上版本支持该接口

API: liveManager.recording.generate(name: string, startTime: number, endTime: number, options?: Options)

**Examples:**

Example 1 (vue):
```vue
<template>
	<live-pusher
		id='livePusher'
		ref="livePusher"
		class="livePusher"
		:url="url"
		mode="SD"
		:muted="true"
		:enable-camera="true"
		:auto-focus="true"
		:beauty="1"
		whiteness="2"
		aspect="9:16"
		@statechange="statechange"
		@netstatus="netstatus"
		@error = "error"
	></live-pusher>
</template>

<script>
	export default {
		data() {
			return {
				url: ""
			}
		},
		onReady() {
			// 注意：需要在onReady中 或 onLoad 延时
			this.context = uni.createLivePusherContext("livePusher", this);
		},
		methods: {
			statechange(e) {
				console.log("statechange:" + JSON.stringify(e));
			},
			netstatus(e) {
				console.log("netstatus:" + JSON.stringify(e));
			},
			error(e) {
				console.log("error:" + JSON.stringify(e));
			},
			start: function () {
				this.context.start({
					success: (a) => {
						console.log("livePusher.start:" + JSON.stringify(a));
					}
				});
			},
			close: function() {
				this.context.close({
					success: (a) => {
						console.log("livePusher.close:" + JSON.stringify(a));
					}
				});
			}
		}
	}
</script>
```

Example 2 (vue):
```vue
<template>
	<live-pusher
		id='livePusher'
		ref="livePusher"
		class="livePusher"
		:url="url"
		mode="SD"
		:muted="true"
		:enable-camera="true"
		:auto-focus="true"
		:beauty="1"
		whiteness="2"
		aspect="9:16"
		@statechange="statechange"
		@netstatus="netstatus"
		@error = "error"
	></live-pusher>
</template>

<script>
	export default {
		data() {
			return {
				url: ""
			}
		},
		onReady() {
			// 注意：需要在onReady中 或 onLoad 延时
			this.context = uni.createLivePusherContext("livePusher", this);
		},
		methods: {
			statechange(e) {
				console.log("statechange:" + JSON.stringify(e));
			},
			netstatus(e) {
				console.log("netstatus:" + JSON.stringify(e));
			},
			error(e) {
				console.log("error:" + JSON.stringify(e));
			},
			start: function () {
				this.context.start({
					success: (a) => {
						console.log("livePusher.start:" + JSON.stringify(a));
					}
				});
			},
			close: function() {
				this.context.close({
					success: (a) => {
						console.log("livePusher.close:" + JSON.stringify(a));
					}
				});
			}
		}
	}
</script>
```

Example 3 (vue):
```vue
<template>
	<live-pusher
		id='livePusher'
		ref="livePusher"
		class="livePusher"
		:url="url"
		mode="SD"
		:muted="true"
		:enable-camera="true"
		:auto-focus="true"
		:beauty="1"
		whiteness="2"
		aspect="9:16"
		@statechange="statechange"
		@netstatus="netstatus"
		@error = "error"
	></live-pusher>
</template>

<script>
	export default {
		data() {
			return {
				url: ""
			}
		},
		onReady() {
			// 注意：需要在onReady中 或 onLoad 延时
			this.context = uni.createLivePusherContext("livePusher", this);
		},
		methods: {
			statechange(e) {
				console.log("statechange:" + JSON.stringify(e));
			},
			netstatus(e) {
				console.log("netstatus:" + JSON.stringify(e));
			},
			error(e) {
				console.log("error:" + JSON.stringify(e));
			},
			start: function () {
				this.context.start({
					success: (a) => {
						console.log("livePusher.start:" + JSON.stringify(a));
					}
				});
			},
			close: function() {
				this.context.close({
					success: (a) => {
						console.log("livePusher.close:" + JSON.stringify(a));
					}
				});
			}
		}
	}
</script>
```

Example 4 (vue):
```vue
<template>
	<live-pusher
		id='livePusher'
		ref="livePusher"
		class="livePusher"
		:url="url"
		mode="SD"
		:muted="true"
		:enable-camera="true"
		:auto-focus="true"
		:beauty="1"
		whiteness="2"
		aspect="9:16"
		@statechange="statechange"
		@netstatus="netstatus"
		@error = "error"
	></live-pusher>
</template>

<script>
	export default {
		data() {
			return {
				url: ""
			}
		},
		onReady() {
			// 注意：需要在onReady中 或 onLoad 延时
			this.context = uni.createLivePusherContext("livePusher", this);
		},
		methods: {
			statechange(e) {
				console.log("statechange:" + JSON.stringify(e));
			},
			netstatus(e) {
				console.log("netstatus:" + JSON.stringify(e));
			},
			error(e) {
				console.log("error:" + JSON.stringify(e));
			},
			start: function () {
				this.context.start({
					success: (a) => {
						console.log("livePusher.start:" + JSON.stringify(a));
					}
				});
			},
			close: function() {
				this.context.close({
					success: (a) => {
						console.log("livePusher.close:" + JSON.stringify(a));
					}
				});
			}
		}
	}
</script>
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-push/introduction.html

文档已经迁移https://uniapp.dcloud.io/unipush-v2.html

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/learning.html

**Contents:**
    - # 框架示例项目
    - # DCloud出品的视频教程：
    - # 三方提供的视频教程

掌握uniCloud，不需要学习nodejs。

只需熟悉js即可，然后阅读uniCloud的文档，就像学习一个js框架。

uni-app结合云函数开发小程序博客教程：

---

## 云厂商故障 = 业务停摆？uniCloud跨云灾备方案来了！ | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/disaster-recovery.html

**Contents:**
- # 云厂商故障 = 业务停摆？uniCloud跨云灾备方案来了！
- # 什么是跨云灾备？
- # 详解uni 扩展数据库和扩展存储
- # 跨云灾备怎么实现客户端 “无感切换”？
- # 跨云灾备实现方案：三步部署策略
- # 官方路线图与未来展望（划重点！）

开发者的烦恼，都是DCloud的努力方向。

在uniCloud推出扩展数据库后，经过自用系统验证成功，现在给出了一套极具性价比的跨云灾备方案：它破除了对单一云厂商的依赖，将数据安全与业务连续性从高昂的“架构特权”，转化为易于部署的“平台能力”。

如需获取跨云容灾的详细技术支持，请点击进入 uniCloud 跨云灾备交流群

跨云灾备，之前是大型政企招标采购中高昂、复杂的代名词，直观解释：业务方同时接入多家不同云厂商，搭建 “主备空间架构” 的灾备方案：日常用主空间跑业务，一旦主云厂商故障不可访问时，能快速切换到备空间，确保业务不中断、数据不丢失。

uniCloud让这件事变得简单、低成本。

在uniCloud中，同时开通多个不同云厂商的服务空间、开通扩展数据库、开通扩展存储。这些都很便宜。

将存储和计算分离，数据库存在统一的扩展数据库中，不使用服务空间自带的数据库，不依赖不同的serverless计算供应商。

风险最高的是计算服务，即 faas层。因为对外暴露了访问方式，云函数非常容易遭受攻击。过去uniCloud的云厂商们也出现过数次被攻击造成的服务暂停。

我们把这一高危计算层分散给不同的云厂商，支付宝云、阿里云、腾讯云。选一个作为主计算层，其他为备份。

不管哪个计算层，他们都是serverless的，他们只负责计算，数据库访问都链接到独立的扩展数据库中。扩展数据库不对外暴露地址，不会遭受攻击。

这样不管哪个云厂商的服务空间出现故障或遭受攻击，都可以动态切换计算层，改用其他云厂商的服务空间来运行云函数。

数据库自身具备高可用。而云函数的变更同步，只需要在修改云函数代码后上传到多个服务空间即可。

当一个云厂商的服务空间被攻击后，我们可以立即切换到其他云厂商，然后停用被攻击的这个服务空间，避免投入大量成本抵御攻击。（DDoS成本本身是由uniCloud云厂商承担的，不需要开发者付费，这里指的是成本更高的上层攻击）

uniCloud本身就便宜，再加上备用服务空间支持按量计费，不用不花钱。这套方案比传统的跨云灾备的成本低的多的多。

跨云灾备的核心挑战在于如何保证主备服务空间能够访问并操作同一份数据和同一份文件存储资源。如果数据和文件存储分散在不同的云厂商，切换时必须进行复杂、耗时且容易出错的跨云同步。

主流云厂商的内置数据库和内置存储普遍存在厂商绑定壁垒：

内置数据库：仅限同厂商、同一服务空间的连接，形成数据隔离，无法被异构云厂商的空间共享访问。

内置文件存储：虽然部分云厂商的内置存储支持跨云访问（只读），但无法支持跨云写入和删除等关键操作。

这种限制导致跨云容灾无法实现数据层的天然一致性，极大地增加了数据同步的复杂性和数据丢失的风险。

uniCloud 通过uni 扩展数据库和uni 扩展存储，彻底将计算资源（云函数）与数据资源（数据库/存储）解耦，为跨云灾备奠定了坚实的资源基础。

独立部署与共享：uni 扩展数据库是独立于单云厂商的原生 MongoDB 实例。它支持将不同云厂商的服务空间关联至同一个数据库实例，实现了“一份数据、多云计算资源共享访问”的架构。

数据一致性保障：主备空间读写同一数据源，消除了跨云数据同步的必要性，天然保障了切换时的数据一致性（RPO 趋近于零）。

高可用保障：厂商内置数据库普遍存在集合数量限制、索引数量限制、慢查询导致限流、查询超时等系统瓶颈，这些问题在uni 扩展数据库中全都不存在。

良好的兼容性：有些云厂商的内置数据库不是标准MongoDB，有一定兼容性，这些问题在扩展数据库中也不存在。

可使用专业数据库管理工具管理：服务空间内置数据库，不对开发者暴露地址，导致无法使用专业数据库管理工具来管理，web界面功能和便利性有限。扩展数据库对每个开发者暴露了独有地址，开发者保护好数据库地址，可以通过专业数据库管理工具来管理，更方便运维和备份。

DCloud 官方的uni-im 使用的就是uni 扩展数据库，扩展数据库更多介绍可参考：扩展数据库介绍

跨云读写能力：配合扩展存储，主备空间可以跨云访问同一个存储实例，并获得完整的读写/删除权限。这样可以避免某个云厂商挂掉后，服务空间内置的存储和cdn也无法访问。

文件高可用：存储在独立的高可用存储服务上，避免了文件层面的单点故障，且自身具备 CDN 加速能力。

性价比更高：uni 扩展存储相比内置存储，价格更便宜，功能更强大，特别是权限控制更灵活。

通过使用 uni 扩展服务，跨云灾备的“数据层”和“存储层”获得了以下关键优势：

零数据同步开销：避免了复杂的定时同步和增量同步机制，确保主备空间始终使用同一份文件存储和数据资源。

企业级高可用资源：扩展数据库采用 MongoDB 三副本集群架构，具备故障自动切换能力。

无数据断层切换：业务在主备空间切换后，客户端访问的是完全一致的数据库和文件存储资源，确保用户体验无“数据缺失”或“资源加载失败”等断层现象。

为了确保业务在云厂商故障时能迅速恢复，我们必须实现客户端在不发新版的情况下，快速切换。实现这一目标的关键在于将服务路由决策与应用代码彻底解耦。

uniCloud 方案通过引入一个独立的高可用配置层来解决：

路由信息外置：将当前健康服务空间（主/备）的配置信息抽象化，并存储在一个独立于业务代码的远程配置中心。

配置中心选型：选择 uni 扩展存储（uni-cdn）作为配置中心。它天然具备 CDN 加速能力，保证了配置文件的高可用、实时更新和多端兼容，成为实现快速切换的理想载体。并且它不存在被攻击打挂掉的可能。

App 启动决策：客户端（App/小程序）在启动时，自动拉取这个最新的 JSON 配置文件。根据文件内指示的当前健康可用服务空间信息，动态地完成 uniCloud 全局对象的初始化。

这种设计使得服务空间切换成为一个纯粹的配置变更动作：

数据平面与控制平面分离：业务逻辑（云函数代码）和数据、存储保持不变，而路由控制权被提到了一个高可用的外部层。

极速响应：一旦主空间故障，运维人员只需更新 CDN 上的 JSON 配置（控制平面），业务终端用户在下次启动时即可自动连接到备用服务空间，最大限度地减少业务中断时间。

这种将配置抽象化和高可用的设计，确保了在极端情况下，您的应用可以不依赖厂商，不依赖发版，快速地完成服务切换，极大地增强了应用的韧性。

本方案将云函数代码与服务路由配置解耦，开发者只需遵循以下三步部署策略，即可快速落地跨云灾备换架构：

此步骤的核心是搭建跨云共享的数据与存储资源层。

服务空间配置：选用 2 个不同云厂商的服务空间，作为灾备架构的主空间（Active）和备空间（Standby）。

数据层统一：确保这两个服务空间都关联到同一台 uni 扩展数据库实例，保障数据的一致性。

存储层统一：在主空间开通 uni 扩展存储，并通过配置，让备空间也指定访问此扩展存储，实现文件存储资源的跨云共享读写。

成本优化建议：推荐将主空间设置为常用计费模式（如包年/套餐），备空间设置为按量计费模式，以实现低成本的冗余配置（不使用不产生费用）。

此步骤将服务路由控制权外置到高可用的 CDN 边缘。

文件创建与存储：创建名为 cloud.json的路由配置文件，并将其上传至步骤 1 中统一配置的 uni 扩展存储。

配置结构：文件内包含主备服务空间的详细连接信息，以及一个关键的 use字段用于指示当前应被使用的健康空间

示例源码如下，请查看 pre > code 标签中的内容

use：路由指针，指示客户端应连接的主/备空间。

main：保持空对象，表示使用应用默认绑定的服务空间。

backup：包含备用空间所需的 uniCloud.init参数，用于动态初始化。

获取 CDN 地址：获取该配置文件的 CDN 访问地址（例如：https://cdn.domain.com/cloud.json），作为客户端动态路由的入口。

此步骤通过应用启动的生命周期，将路由配置注入到 uniCloud 运行时。

配置加载时机：在 App 的 onLaunch生命周期中，请求步骤 2 中生成的 cloud.json文件。

切换逻辑判断：客户端比对当前配置与远程配置，如果发现 use字段发生变化（即服务空间已切换），则更新本地缓存配置。

动态初始化：使用远程 JSON 中的配置数据 (initData)，通过以下代码实现 uniCloud 全局对象的运行时重新初始化：

示例源码如下，请查看 pre > code 标签中的内容

架构对比:uniCloud 扩展服务容灾vs传统自建服务器容灾

传统的云服务器容灾方案（基于 ECS、负载均衡、RDS 等）需要进行复杂的底层架构设计和资源依赖管理。相比之下，uniCloud 基于 Serverless 的跨云灾备方案，在成本、运维和安全三大维度上展现出结构性优势。

成本维度：从高昂的固定开支到精细化的按需订阅

抗 DDoS 能力：内置防御与外部采购的差异

传统方案：安全防御能力依赖于外部采购和配置，费用高昂且需专人维护高防策略。

uniCloud 方案：依托云厂商函数计算的分布式架构和内置安全防护，这种能力在uniCloud跨云部署时得到了进一步增强（攻击难以同时击穿多个厂商）。

结论：uniCloud 跨云灾备方案将容灾能力从传统的“高门槛、高成本的架构工程”，升级为“低成本、高效率的配置和服务订阅”，为成长型和中大型业务提供了更优的容灾选择。

现阶段开发者手动配置即可落地，官方正在开发 “云端一键切换” 功能，敬请期待。

云函数需要自己上传到备空间，需要自行确保备空间与主空间云函数、公共模块、schema等云端代码版本一致、配置一致；

json配置文件需要自己上传到主空间的扩展存储下，每次切换需要重新上传，并手动刷新CDN缓存

App.vue 文件需要增加一些代码逻辑，用来请求json配置文件和init uniCloud 全局对象

定时任务需要确保只在一个空间上运行，另外一个空间需要删除定时任务

uniCloud的跨云灾备方案，不但解决了uniCloud单一云厂商故障造成的业务停顿。更一举把跨云灾备拉到平民级性价比。

对于在意业务可靠性的开发者，建议都从传统云迁移到uniCloud且上线多云灾备。运维方便，成本更低，尤其还免除了昂贵的高防成本。

在AI时代，vibe code流行。很多不熟悉后端的新手，uniCloud尤其适合，开发简单、AI生成准确，更重要的是免运维。啥都不操心。

如需获取跨云容灾的详细技术支持，请点击进入 uniCloud 跨云灾备交流群

**Examples:**

Example 1 (json):
```json
{
    "use": "main",
    "main": {},
    "backup": {
        "provider": "aliyun",
        "spaceId": "mp-xxxxxxx",
        "clientSecret": "xxxxxxi04209bObxjqQ=="
    }
}
```

Example 2 (json):
```json
{
    "use": "main",
    "main": {},
    "backup": {
        "provider": "aliyun",
        "spaceId": "mp-xxxxxxx",
        "clientSecret": "xxxxxxi04209bObxjqQ=="
    }
}
```

Example 3 (json):
```json
{
    "use": "main",
    "main": {},
    "backup": {
        "provider": "aliyun",
        "spaceId": "mp-xxxxxxx",
        "clientSecret": "xxxxxxi04209bObxjqQ=="
    }
}
```

Example 4 (json):
```json
{
    "use": "main",
    "main": {},
    "backup": {
        "provider": "aliyun",
        "spaceId": "mp-xxxxxxx",
        "clientSecret": "xxxxxxi04209bObxjqQ=="
    }
}
```

---

## uniCloud 案例 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/resource.html

**Contents:**
  - # uniCloud 案例

uniCloud案例众多，目前活跃服务空间数量数万个。云函数日调用次数过亿。

如下是使用 uniCloud 的插件市场项目或开源案例。欢迎大家提交插件或开源项目，可以以pr方式直接编辑本文档。

贝壳阅读 集成签到、抽奖、金币积分多种好玩的激励玩法，免费读书，广告变现。本书城系统可独立部署，也可作为插件集成至任何流量主APP。

Hello uniCloud ：在HBuilderX 2.6+版本，新建uni-app项目的项目模板中有 hello unicloud模板，展示了uniCloud的云函数基本用法、cdn使用方式。它对应的H5演示地址是：https://hellounicloud.m3w.cn/

uni抗疫开源项目汇总 ：这是一个项目集合汇总，里面有大量与抗疫项目的开源项目，均基于uniCloud。包括外来人员登记系统、学生健康报备系统、员工疫情筛查工具、消毒检查登记系统、物资管理系统等。这些项目具备一定通用性，可以稍加改造用于其他行业应用。

国云商城 ：优秀的电商系统，购买本系统，快速上线属于你自己的电商应用。

云上商城 ：完整的线上生活超市，根据当前定位，就近匹配仓库。

纸塘壁纸：精美壁纸小程序。微信小程序搜索“纸塘壁纸PRO”

纸塘日记：简约而优雅的日记本。iOS App 、Android App

开步运动：安徽本地体育赛事App。iOS App 、Android App

月嫂了不起：母婴护理师、育婴师的接单和学习平台。微信小程序搜索“月嫂了不起”

OYAN听书：外文书籍音频FM小程序。微信小程序搜索“OYAN听书”

优悦学课堂：高效学习考证。支持iOS、Android App及小程序多端连接uniCloud，详见

柠檬趣味测：心理性格测试。微信小程序搜索“柠檬趣味测”、QQ小程序搜索“柠檬测试”

小森林集：壁纸、皮肤小程序。微信小程序搜索“小森林集”

MOODA心情日记：随时随地记录心情。微信小程序搜索“MOODA心情日记”

柳州市人民医院流行病学调查表：调查登记小程序。微信小程序搜索“柳州市人民医院流行病学调查表 ”

安心记待办：极简风手机应用。日程管理App，每日心情记录，安心习惯养成。iOS App

用云电商 ：用云电商 usemall 电商数字化解决方案。支持二开、定制，帮助快速搭建自己的多渠道、多场景B2C电商平台。

vk商城 ：vkmall（vk商城）电商云端一体项目，完整电商项目，拥有完善的框架开发文档，易二开。

优惠券网赚平台 ：包含试玩游戏、应用赚钱，购物领券，外卖领券，短视频，激励视频等广告结合的一款变现app。

星潮壁纸 ：星潮壁纸小程序团队版、双UI、支持抖音、快手、微信多端多开

智能垃圾分类 ：智能垃圾分类，包含图片识别垃圾，垃圾分类，做题，考试排行

行云客CRM ：行云客CRM客户管理系统，助力企业销售全流程精细化、数字化管理

头像挂件小程序 ：头像挂件小程序 支持微信、抖音、QQ三端部署

活动报名小程序 ：完整的活动、报名项目模板

更多uniClouid项目和插件，见插件市场：https://ext.dcloud.net.cn/?cat1=7

---

## uni实人认证 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/frv/intro.html

**Contents:**
- # uni实人认证
- # 使用要求
- # 产品优势
- # 典型场景
  - # 政务行业
  - # 互联网行业
  - # 数字藏品业务
  - # 保险行业
  - # 银行行业
  - # 交通出行

uni实人认证依赖 HBuilderX 3.7.6+，目前仅支持App平台。

uni实人认证相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

uni实人认证，即核验终端操作者的真实身份，搭载真人检测和人脸比对等生物识别技术，可快速校验自然人的真实身份。

uni实人认证是金融级实人认证，供应商为阿里云，背后依托公安部数据库，具备国家认可的权威资质。该产品中应用的活体防攻算法获得了 iBeta 国际安全组织最高等级的 Level2 认证，是目前中国国内少数获得此认证的产品之一，是首批获得国家面向金融行业和移动电子政务行业相关认证资质的产品。

与手机号验证不同，实人认证输入姓名+身份证号，进行人脸识别和活体检测，然后返回比对结果：即摄像头前活动的人脸，与姓名和身份证号是否匹配。

针对使用对象和认证对象，uni实人认证服务的使用要求如下：

在使用前，请确保您已注册DCloud账号，并已完成实名认证。更多信息，请参见uni实人认证开通指南

目前，uni实人认证服务仅支持对拥有以下证件的居民进行认证：

uni实人认证具备便宜、安全、准确、稳定、实时、可靠等优势，提供多样化的产品方案和接入类型，满足您核验用户身份信息真实性的需求。

当开发者提供促销或发放福利时，很容易被黑产褥羊毛。实人认证，搭配uniCloud安全网络，可以做到万无一失。

典型场景：综合数字政务、疫情防疫、公积金提取、工商企业注册等。

响应国家号召，各地政府不断推出线上办理服务，用户可以通过政务 App 客户端，调用人脸认证服务进行身份认证，预约或者直接在线办理各项业务。

典型场景：内容发布、权益兑换风控、在线签约等。

典型场景：实名认证、数字藏品抢购、银行卡绑定。

数字藏品业务涉及到在线买卖交易和数字藏品的归属，因此必须要身份核验后才能进行数字藏品收藏购买业务操作。

新冠疫情发生以来，传统的面签购买保险模式已发生变化，投保人需通过互联网进行投保和续保，从合规方面需要对投保人进行身份核验，为防止身份伪冒造成的虚假保单，该保险公司需要高安全级别的保单身份核验能力。

典型场景：转账、视频柜员交易、证件变更、电子合同签约、客户开卡、征信授权、联网核查等。

大部分一定规模的银行都已经私有化部署一套实人认证平台，维护成本高，且通过率低。银行接入云端的人脸认证服务后，整体人脸认证通过率提升明显，且风险可控。

典型场景：司机注册入驻、接单、乘客发布行程、机场安检登机、铁路安检购票、长途客运购票、边检口岸通关。

典型场景：用户首次直播前实名、绑定支付、提现。

直播行业因国家强监管需要，需要留存用户身份真实信息。传统做法是要求用户提交手持证件、身份证正反面复印件，通过人工审核证明用户是身份证持有者本人，费时费力。通过调用人脸认证服务，可以大幅提升主播入驻、直播、资金交易等流程效率和体验。

典型场景：提升信用分、岗位发布、简历投递、面试官身份验证。

招聘平台 App，涉及到候选人简历信息的真实性、猎头和面试官的真实性，需要用户身份核验。传统手持身份证校验流程复杂，成功率低。通过接入人脸认证服务，帮助平台更精准的识别用户身份。

---

## uni实人认证 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/frv/intro

**Contents:**
- # uni实人认证
- # 使用要求
- # 产品优势
- # 典型场景
  - # 政务行业
  - # 互联网行业
  - # 数字藏品业务
  - # 保险行业
  - # 银行行业
  - # 交通出行

uni实人认证依赖 HBuilderX 3.7.6+，目前仅支持App平台。

uni实人认证相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

uni实人认证，即核验终端操作者的真实身份，搭载真人检测和人脸比对等生物识别技术，可快速校验自然人的真实身份。

uni实人认证是金融级实人认证，供应商为阿里云，背后依托公安部数据库，具备国家认可的权威资质。该产品中应用的活体防攻算法获得了 iBeta 国际安全组织最高等级的 Level2 认证，是目前中国国内少数获得此认证的产品之一，是首批获得国家面向金融行业和移动电子政务行业相关认证资质的产品。

与手机号验证不同，实人认证输入姓名+身份证号，进行人脸识别和活体检测，然后返回比对结果：即摄像头前活动的人脸，与姓名和身份证号是否匹配。

针对使用对象和认证对象，uni实人认证服务的使用要求如下：

在使用前，请确保您已注册DCloud账号，并已完成实名认证。更多信息，请参见uni实人认证开通指南

目前，uni实人认证服务仅支持对拥有以下证件的居民进行认证：

uni实人认证具备便宜、安全、准确、稳定、实时、可靠等优势，提供多样化的产品方案和接入类型，满足您核验用户身份信息真实性的需求。

当开发者提供促销或发放福利时，很容易被黑产褥羊毛。实人认证，搭配uniCloud安全网络，可以做到万无一失。

典型场景：综合数字政务、疫情防疫、公积金提取、工商企业注册等。

响应国家号召，各地政府不断推出线上办理服务，用户可以通过政务 App 客户端，调用人脸认证服务进行身份认证，预约或者直接在线办理各项业务。

典型场景：内容发布、权益兑换风控、在线签约等。

典型场景：实名认证、数字藏品抢购、银行卡绑定。

数字藏品业务涉及到在线买卖交易和数字藏品的归属，因此必须要身份核验后才能进行数字藏品收藏购买业务操作。

新冠疫情发生以来，传统的面签购买保险模式已发生变化，投保人需通过互联网进行投保和续保，从合规方面需要对投保人进行身份核验，为防止身份伪冒造成的虚假保单，该保险公司需要高安全级别的保单身份核验能力。

典型场景：转账、视频柜员交易、证件变更、电子合同签约、客户开卡、征信授权、联网核查等。

大部分一定规模的银行都已经私有化部署一套实人认证平台，维护成本高，且通过率低。银行接入云端的人脸认证服务后，整体人脸认证通过率提升明显，且风险可控。

典型场景：司机注册入驻、接单、乘客发布行程、机场安检登机、铁路安检购票、长途客运购票、边检口岸通关。

典型场景：用户首次直播前实名、绑定支付、提现。

直播行业因国家强监管需要，需要留存用户身份真实信息。传统做法是要求用户提交手持证件、身份证正反面复印件，通过人工审核证明用户是身份证持有者本人，费时费力。通过调用人脸认证服务，可以大幅提升主播入驻、直播、资金交易等流程效率和体验。

典型场景：提升信用分、岗位发布、简历投递、面试官身份验证。

招聘平台 App，涉及到候选人简历信息的真实性、猎头和面试官的真实性，需要用户身份核验。传统手持身份证校验流程复杂，成功率低。通过接入人脸认证服务，帮助平台更精准的识别用户身份。

---

## uni-config-center 云配置中心 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-config-center.html

**Contents:**
- # uni-config-center 云配置中心
- # 需求背景
- # 用法
- # 导入和创建配置
- # 云函数中读取配置
- # 获取配置实例
- # 获取配置内容
- # 获取配置目录下的文件的绝对路径
- # 引用配置目录下的js、json文件
- # 判断配置目录下是否存在指定文件

uni-config-center插件的下载地址：https://ext.dcloud.net.cn/plugin?id=4425

实际开发中很多插件/云函数/公共模块需要配置文件才可以正常运行，比如各种appkey、secret。存放在数据库里的话，拖累云函数性能，并且增加数据库请求。如果每个都单独进行配置的话就会产生下面这样的目录结构。

示例源码如下，请查看 pre > code 标签中的内容

uni-config-center解决了上述问题。通过独立了公共模块，统一管理配置文件，做到配置和代码分离，更新代码不会覆盖配置，并且可以在多个云函数之间共享配置。

使用uni-config-center后的目录结构如下

示例源码如下，请查看 pre > code 标签中的内容

如果你只是使用别人提供的插件要在uni-config-center内放配置文件，则无需关注下面的内容。只要按照插件作者约定的插件配置目录存放你的配置文件即可

例如，在云函数cf2内使用uni-config-center，步骤如下：

至此多云函数/公共模块共享的配置就创建完成了，目录结构如下

示例源码如下，请查看 pre > code 标签中的内容

以上述目录结构为例，在云函数cf2内获取share-config配置目录下的配置内容，示例代码如下

示例源码如下，请查看 pre > code 标签中的内容

通过createConfig接口即可获取配置实例，此实例上有一些方法如：获取配置内容、拼接目录路径等

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取配置内容接口有以下几种形式，如果在createConfig时传入了defaultConfig，会和配置目录下的config.json合并作为完整的配置文件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
cloudfunctions
  ├─cf1 // cf1云函数
  │  │─index.js
  │  └─config.json // cf1使用的配置文件
  └─cf2 // cf2云函数
     │─index.js
     └─config.json // cf2使用的配置文件
```

Example 2 (unknown):
```unknown
cloudfunctions
  ├─cf1 // cf1云函数
  │  │─index.js
  │  └─config.json // cf1使用的配置文件
  └─cf2 // cf2云函数
     │─index.js
     └─config.json // cf2使用的配置文件
```

Example 3 (unknown):
```unknown
cloudfunctions
  ├─cf1 // cf1云函数
  │  │─index.js
  │  └─config.json // cf1使用的配置文件
  └─cf2 // cf2云函数
     │─index.js
     └─config.json // cf2使用的配置文件
```

Example 4 (unknown):
```unknown
cloudfunctions
  ├─cf1 // cf1云函数
  │  │─index.js
  │  └─config.json // cf1使用的配置文件
  └─cf2 // cf2云函数
     │─index.js
     └─config.json // cf2使用的配置文件
```

---

## 费用说明 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-rpia/mobile-verify/price.html

**Contents:**
- # 费用说明
  - # 手机号二要素认证
  - # 手机号三要素认证（简版）
  - # 手机号三要素认证（详版）

手机号实名核验API的付费方式仅支持资源包形式

详版对比简版优势：在认证不一致时，返回详细的不匹配原因，方便用户排查问题。详情

---

## 费用说明 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-live/price.html

**Contents:**
- # 费用说明
  - # 直播流量费用
  - # 直播回放费用
  - # 直播流量计算
    - # 上行流量（推流）
    - # 下行流量（拉流）
    - # 费用计算示例

直播流量费用，按直播上行流量+直播下行流量的总和（单位GB）阶梯计费，当月按账户维度进行阶梯累进（以自然月为一个累计周期）。

如果你的直播月消耗量大于200TB，欢迎通过uni-im 联系我们，我们可以给您提供更高优的技术支持，以及定制更优惠的大客户价格。

直播流量包含上行推流的流量和下行拉流的流量，都要计费，价格相同。

uni直播的性价比很高，相比主流云厂商直播业务的按量计费，uni直播平均便宜40%以上，如下是具体报价对比：

直播流量 = 上行流量（推流）+ 下行流量（拉流）

上行流量是主播推送直播流到服务器产生的流量。

示例源码如下，请查看 pre > code 标签中的内容

假设主播以 2000Kbps（约2Mbps）的码率推流 1 小时：

示例源码如下，请查看 pre > code 标签中的内容

下行流量是观众观看直播时从服务器拉取直播流产生的流量。

示例源码如下，请查看 pre > code 标签中的内容

假设 100 位观众以 2000Kbps 的码率观看直播 1 小时：

示例源码如下，请查看 pre > code 标签中的内容

说明：实际码率会根据网络状况和编码器设置有所波动，上述计算仅供参考。

**Examples:**

Example 1 (unknown):
```unknown
上行流量（GB）= 码率（Kbps）÷ 8 × 推流时长（秒）÷ 1024 ÷ 1024
```

Example 2 (unknown):
```unknown
上行流量（GB）= 码率（Kbps）÷ 8 × 推流时长（秒）÷ 1024 ÷ 1024
```

Example 3 (unknown):
```unknown
上行流量（GB）= 码率（Kbps）÷ 8 × 推流时长（秒）÷ 1024 ÷ 1024
```

Example 4 (unknown):
```unknown
上行流量（GB）= 码率（Kbps）÷ 8 × 推流时长（秒）÷ 1024 ÷ 1024
```

---

## 服务空间相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/space.html

**Contents:**
- # 服务空间相关问题
  - # 阿里云单个账号最多可创建20个正式版服务空间，如何提升限制？

阿里云目前单个账号可创建20个正式版服务空间，如有更多需求需发邮件到service@dcloud.io申请。此外集合数量限制也可申请提升。邮件模板见文档：申请解除限制邮件模板

---

## uni-cloud-router | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-router.html

**Contents:**
- # uni-cloud-router
- # 云函数端
  - # 安装
- # 介绍
  - # 目录结构
  - # 快速开始
- # 深入学习
  - # 控制器（Controller）
    - # 如何编写 Controller
    - # 获取请求参数

基于 koa 风格的 uniCloud 云函数路由库，同时支持 uniCloud 客户端及 URL 化访问

源码仓库：https://gitee.com/dcloud/uni-cloud-router

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了快速上手，提供了一个简单的 demo 示例，以创建是一个 hello-uni-cloud-router 云函数为例，演示如何通过 uni-cloud-router 组织代码：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

3.在 controller 文件夹下创建一个 hello.js

示例源码如下，请查看 pre > code 标签中的内容

4.在 service 文件夹下创建一个 hello.js

示例源码如下，请查看 pre > code 标签中的内容

到这里，已创建好了是一个 hello-uni-cloud-router 云函数（注意：需上传云函数后，前端才能访问)。

在页面中通过callFunction访问 hello（controller）下 sayHello：

示例源码如下，请查看 pre > code 标签中的内容

以上代码仅作为示例，建议点击右侧【使用 HBuilderX 导入示例项目】尝试。

负责解析用户的输入，处理后返回相应的结果。

推荐 Controller 层主要对用户的请求参数进行处理（校验、转换），然后调用对应的 service 方法处理业务，得到业务结果后封装并返回：

所有的 Controller 文件都必须放在 controller 目录下，可以支持多级目录，访问的时候可以通过目录名级联访问。

示例源码如下，请查看 pre > code 标签中的内容

定义的 Controller 类，会在每一个请求访问时实例化一个全新的对象，会有下面几个属性挂在 this 上。

通过在 Controller 上绑定的 Context 实例的 data 属性，获取请求发送过来的参数

示例源码如下，请查看 pre > code 标签中的内容

通过 Service 层进行业务逻辑的封装，不仅能提高代码的复用性，同时可以让业务逻辑更好测试。

Controller 中可以调用任何一个 Service 上的任何方法，同时 Service 是懒加载的，只有当访问到它的时候才会去实例化它。

示例源码如下，请查看 pre > code 标签中的内容

Service 的具体写法，请查看 Service 章节。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在某些场景下，cookie依然占有重要地位，例如在云函数URL化的情况下，获取客户端的状态

在云函数中使用cookie需要依赖cookie库npm页面地址 ，可以通过npm install cookie 安装

示例源码如下，请查看 pre > code 标签中的内容

业务逻辑封装的一个抽象层，有以下几个好处：

所有的 Service 文件都必须放在 service 目录下，可以支持多级目录，访问的时候可以通过目录名级联访问。

示例源码如下，请查看 pre > code 标签中的内容

定义的 Service 类是懒加载的，只有当访问到它的时候才会去实例化它，会有下面几个属性挂在 this 上。

在 Controller 中调用 Service

在路由请求前，后添加处理逻辑，实现一些特定功能，如：用户登录，权限校验等

与 koa 保持一致，参考：koa 中间件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

match 设置只有符合某些规则的请求才会经过这个中间件。

ignore 设置符合某些规则的请求不经过这个中间件。

Context 是一个请求级别的对象，在每一次收到用户请求时，会实例化一个 Context 对象，这个对象封装了这次用户请求的信息，并提供了许多便捷的方法来获取请求参数或者设置响应信息。框架会将所有的 Service 挂载到 Context 实例上

最常见的 Context 实例获取方式是在 Middleware, Controller 以及 Service 中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (bash):
```bash
npm install --save uni-cloud-router
```

Example 2 (bash):
```bash
npm install --save uni-cloud-router
```

Example 3 (unknown):
```unknown
npm install --save uni-cloud-router
```

Example 4 (bash):
```bash
npm install --save uni-cloud-router
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/options.html

实现部分厂商特定功能，包括仅部分厂商支持、不常用或厂商临时新增的功能（不依赖 uni-push，厂商文档支持的参数可直接使用）。

示例源码如下，请查看 pre > code 标签中的内容

options参数对照个推push完整请求体 的关系如下：

注意：关于离线推送，需确认云端推送时填写的channel_id与客户端设置 的一致。

**Examples:**

Example 1 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

Example 2 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

Example 3 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

Example 4 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

---

## 2025-09-19 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/release.html

**Contents:**
    - # 2025-09-19
    - # 2025-07-31
    - # 2025-07-04
    - # 2025-06-18
    - # 2025-06-12
    - # 2025-04-03
    - # 2025-02-24
    - # 2025-02-08
    - # 2025-01-21
    - # 2024-12-18

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/options

实现部分厂商特定功能，包括仅部分厂商支持、不常用或厂商临时新增的功能（不依赖 uni-push，厂商文档支持的参数可直接使用）。

示例源码如下，请查看 pre > code 标签中的内容

options参数对照个推push完整请求体 的关系如下：

注意：关于离线推送，需确认云端推送时填写的channel_id与客户端设置 的一致。

**Examples:**

Example 1 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

Example 2 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

Example 3 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

Example 4 (json):
```json
const pushManager = uniCloud.getPushManager({"appId":"__UNI__DEMO123"})
return await pushManager.sendMessage({
  title:"消息标题",
  content:"消息内容",
  // ...其他参数略，可参考：https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html#%E5%85%A5%E5%8F%82%E8%AF%B4%E6%98%8E
  options: {
    android:{
      "XM": {
        // 实现铃声
        "/extra.sound_uri": "小米后台申请的自定义 sound_url 地址",
        "/extra.channel_id": "小米后台申请的通知类别id",
        // 对app版本号进行筛选
        "/extra.app_version": "v3.3.0"
      },
      "HW":{
        //实现铃声
        "/message/android/notification/default_sound": false,
        "/message/android/notification/channel_id": "RingRing4",
        "/message/android/notification/sound": "/raw/ring001",
        // 设置富文本内容
        "/message/android/notification/image": "公网可以访问的https图标链接",
        "/message/android/notification/style": 1,
        "/message/android/notification/big_title": "big_title",
        "/message/android/notification/big_body": "big_body"
      }
    },
    harmony:{
      "HW":{
        "/pushOptions/testMessage": true
      }
    },
    ios: {
      laId:"灵动岛id",
      // 略，详情 https://docs.getui.com/getui/server/rest_v2/common_args/#ios-
    }
  }
})
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unipay?id=verifyreceipt

---

## 阿里云系统错误@aliyun | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/system-error.html

**Contents:**
- # 阿里云系统错误

---

## 2021-12-31 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/release-archive.html

**Contents:**
    - # 2021-12-31
    - # 2021-12-14
    - # 2021-11-30
    - # 2021-11-18
    - # 2021-11-10
    - # 2021-10-21
    - # 2021-09-19
    - # 2021-09-16
    - # 2021-09-01
    - # 2021-08-27

---

## 计费模式 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/frv/price.html

**Contents:**
- # 计费模式
- # 流量包
- # 按量计费
  - # 计费规则
  - # 优惠福利
  - # 结算方式
  - # 费用计算示例
- # 配套uniCloud成本

uni实人认证服务提供多种规格的流量包套餐。流量包规格越大，单价越低。

注意：资源包购买成功后立即生效，过期销毁资源，不支持延期和退款，建议根据业务情况，选择合适的资源包。

另外，如果您的App调用uni实人认证，承诺半年内消耗10万次，欢迎点此 沟通特价折扣。

uni实人认证的按量计费，采用 阶梯累进 的方式进行计费，即按照调用次数划分费率区间，根据不同区间费率分别计算价格，相加之和为最终收费总额。具体计费规则详见下。

调用次数说明：协议期限内成功调用实人认证服务的总次数。协议期限指从开通实人认证服务之日起延后一年，每年重新执行阶梯计费。例如：用户在 2023年01月29日 开通的实人认证，那么在 2023年01月29日 到 2024年01月28日 期间产生的调用次数会持续累加，2024年01月29日 后将会重新计算，以此类推。

对比其它主流厂商的同类产品，uni实人认证的按量计费，同样有明显的价格优势：

开发者完成充值后进行调用，实人认证的充值余额与uniCloud其他产品的余额不互通。

因认证结果反馈有时差，会先冻结余额再解冻清算。即：

在协议期限内，开发者将用户的身份信息发给实人认证服务，无论发送多少次，收费都按实际成功调用次数（不是成功匹配）扣取。

实人认证需要依赖uniCloud云服务。如果开发者的业务不在uniCloud上，需中转到开发者自己的业务服务器上，会产生额外的uniCloud云函数费用。但这个成本可以忽略不计，因为每次云函数的调用非常便宜。

举例，使用uniCloud阿里云版，每次实人认证需要调用2次云函数，大约需要消耗uniCloud费用0.0000278元，可以忽略不计。

如果您使用的实人认证档位是0.85元/次，那么加上云函数的费用，就是0.8500278元/次。

如果您需要了解详细的云函数费用计算过程，如下：

实人认证业务涉及费用的部分主要是云函数/云对象的使用量、调用次数、和出网流量。 接下来，我们对不同资源，分别进行费用评估。

我们按照uniCloud官网列出的按量计费 规则，可以简单得出如下公式：

云函数/云对象费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，其实人认证业务云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

结论：如果你的实人认证业务平均每天进行认证次数为10000次，使用阿里云正式版云服务空间后，对应云函数每天大概消耗0.278元，对比之前的实人认证单次费用，平均每次调用多花0.0000278元，可忽略不计。

**Examples:**

Example 1 (unknown):
```unknown
云函数费用（天） = (资源使用量 * 0.000110592  + 云函数调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024) ) * 2
			  = (0.110592 + 0.0133 + 0.0152587890625) * 2
			  = 0.1391507890625 * 2（元）
			  ≈ 0.278（元）
```

Example 2 (unknown):
```unknown
云函数费用（天） = (资源使用量 * 0.000110592  + 云函数调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024) ) * 2
			  = (0.110592 + 0.0133 + 0.0152587890625) * 2
			  = 0.1391507890625 * 2（元）
			  ≈ 0.278（元）
```

Example 3 (unknown):
```unknown
云函数费用（天） = (资源使用量 * 0.000110592  + 云函数调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024) ) * 2
			  = (0.110592 + 0.0133 + 0.0152587890625) * 2
			  = 0.1391507890625 * 2（元）
			  ≈ 0.278（元）
```

Example 4 (unknown):
```unknown
云函数费用（天） = (资源使用量 * 0.000110592  + 云函数调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (云函数内存（单位为G） * 云函数平均单次执行时长（单位为秒） * 调用次数 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8) * 2
			  = (0.5G * 0.2S * 10000 * 0.000110592 + 10000 * 0.0133/10000 + 10000 * 2 * 0.8 / (1024 * 1024) ) * 2
			  = (0.110592 + 0.0133 + 0.0152587890625) * 2
			  = 0.1391507890625 * 2（元）
			  ≈ 0.278（元）
```

---

## 业务开通 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/sms/service

**Contents:**
- # 业务开通
  - # 开通流程
  - # 充值
  - # 签名配置
    - # 创建签名
    - # 签名服务商管理
  - # 模板配置
    - # 创建模板
    - # 模板服务商管理
  - # 安全配置

使用开发者账号登录uniCloud控制台 ，选择短信服务栏目。在使用此功能前需要完成实名认证，可前往开发者中心 完成实名认证。

完成实名认证后，阅读短信服务协议并点击协议下方的“同意协议并开通”按钮，便可开通短信服务。

短信服务为预付费业务，在发送短信之前，需要先进行充值。点击页面上的“充值”按钮，可以选择预设金额进行充值，也可以选择自定义金额进行充值，充值金额最小为1元。

短信签名是短信内容前的标识符，用于标识短信发送方。例：【dcloud】验证码：${code}，5分钟内有效，请勿泄露并尽快验证。其中"dcloud"即为签名。

系统支持多服务商签名管理，为了提高短信发送的稳定性和灵活性，同一个签名可以同时在多个服务商创建。目前支持的服务商包括：个推（默认）和网易。

创建签名后，可以通过"服务商管理"功能查看和管理该签名下的所有服务商：

在服务商管理页面，可以查看该签名下所有服务商的状态：

列表中带"✓"标记的为当前正在使用的服务商，切换当前服务商后，该签名下的所有模板会同步切换发送渠道。

如果签名只在一个服务商创建，可以点击"新增服务商"按钮，为该签名添加另一个服务商：

注意：如果签名有多个服务商，编辑时签名内容不可修改，需要修改请先删除其他服务商

点击"设为当前"可以切换当前使用的服务商：

个推服务商审核通过后，可以点击"补充信息"添加更多证明材料，以提高签名的稳定性和通过率

短信模板是短信的具体内容格式，支持使用变量参数实现动态内容。目前短信签名创建后可立即前往创建短信模板，无需等待签名审核通过，且添加短信模板可提高签名审核通过机率。

模板支持多服务商管理，模板的服务商由所选签名决定。当创建模板时，系统会根据签名已开通的服务商自动在对应的服务商下创建模板版本。

选择已创建的签名，签名列表会显示该签名支持的服务商：

签名显示格式为：签名名称（服务商1、服务商2）

如果模板中使用了变量（如${code}），需要设置每个变量的数据类型。

系统会自动识别模板中的变量，并要求设置参数类型，发送短信时会检验参数是否符合设置的参数类型。

填写模板的使用场景说明，便于审核人员了解模板用途，提高审核通过率。

创建模板后，可以通过"服务商管理"功能查看和管理该模板下的所有服务商版本：

在服务商管理页面，可以查看该模板下所有服务商的状态：

列表中带"✓"标记的为当前正在使用的服务商。模板当前使用的服务商由签名的当前服务商决定，如需切换请前往对应签名的服务商管理页面操作。

当服务商状态为"驳回"时，可以编辑该服务商的模板内容并重新提交审核：

模板审核通过后，即可在代码中使用，具体调用方式请参考开发文档 。

系统提供了 uniCloud 服务空间白名单安全配置，可以提高接口调用安全性，防止被他人盗用。可点击“添加”按钮，选择相应的服务空间完成添加服务空间白名单，服务空间添加成功后，只有列表中的服务空间才可以调用当前账号下的短信接口。此列表为空时，不校验调用方的服务空间。

系统可查看短信发送记录，但此业务数据量较大，为了维持服务的稳定性，只能查看30天内的某1天的全部调用记录，默认选择当天。

系统可查看每日发送汇总数据，包括每日请求次数、每日请求成功次数、成功回执数、计费条数、计费金额等汇总数据。

---

## uni手机号实名核验 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-rpia/mobile-verify/intro.html

**Contents:**
- # uni手机号实名核验
- # 应用场景
- # 核验范围
- # 相关文档

不支持的手机号，请求接口时，返回值status为2或3

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/send-sms?id=extension

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unicloud-response-format

文档已迁移至：/uniCloud/cf-functions?id=resformat

---

## 其他直播方式 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-live/other-live-streaming-methods.html

**Contents:**
- # 其他直播方式
- # 推流
  - # OBS
- # 拉流
  - # VLC 播放器

以下是使用OBS Studio + RTMP推流的示例：

VLC播放器支持多种协议的直播拉流播放，包括RTMP、HLS等。您可以在VLC播放器中打开网络流，输入您的拉流地址进行播放。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unipay

---

## 初始化uniCloud实例@init-unicloud | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/init.html

**Contents:**
- # 初始化uniCloud实例
- # 获取其他服务空间的database

---

## 商业授权 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/software/price.html

**Contents:**
- # 商业授权
- # 规格和价格

uni云开发软件版可以免费试用一段时间（15天），但它不是免费软件。企业开发者需付费采购uni云开发软件版的商业授权。

如需详细了解uni云开发软件版功能及价格，点击进入 专属IM客户群咨询

uni云开发软件版分为云代理版、标准版、企业版3个规格，具体如下：

而企业版在由DCloud商务人员核准开发者资质后，签署不使用盗版的承诺条款协议，可纯内网使用，不再连接DCloud服务器。

集群是从业务范畴划分的不同系统，比如：外卖系统集群、OA系统集群、论坛系统集群等，是一个虚拟的业务组织概念。它有点类似于serverless版的服务空间。

同一个集群下可以有1台或多台服务器，多个服务器部署的业务是一样的，共同承载同一个业务。它有点类似于serverless版的一个个容器。

同一个集群下可以被1个或多个客户端应用访问，比如外卖系统，有面向消费者的客户端应用、面向外卖员的客户端应用、面向管理员的客户端应用，都属于一个外卖系统。

相同的业务，为不同角色设计的客户端应用，属于同一个集群。

不同的业务，无论终端用户是否相同，都不属于同一个集群。比如一个企业有外卖系统，也有内部OA系统，这2个系统不属于一个集群。

服务器即实体服务器或虚拟机。uni云开发软件版安装在每台具体的服务器上。每台服务器均需购买商业授权。但并不限制服务器的CPU数量。

应用即DCloud产品体系下App概念，每个应用都有AppID，格式如：__UNI__XXX。 比如论坛系统：

超过赠送的应用授权后，每新增一个应用也需要购买商业授权。

uni云开发软件版的商业授权，分为服务器授权和应用授权，安装uni云开发软件版的每台服务器均需购买商业授权，每个上线的应用也需要购买应用授权。

uni云开发软件版从获取商业授权起，提供1年的保修服务。

1年后，您仍然可以正常使用。但无法使用商业授权对应的服务。包括：

过保后，开发者可以支付维保费来获取上述权益。uni云开发软件版每年的付费保修价格为上年度授权总价格的15%。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-captcha.html

**Contents:**
- # 用途说明
- # 组成部分
- # 目录结构
- # 原理时序
- # 云端一体组件介绍
  - # 验证码配置（可选）：
  - # 普通验证码组件
    - # Props:
  - # 弹出式验证码组件
    - # 使用示例：

下载地址：https://ext.dcloud.net.cn/plugin?id=4048

Gitee 仓库：https://gitee.com/dcloud/uni-captcha

主要起到人机校验或其他限制调用的作用，如：

以上即完整的流程。 如果在前端表单页面中，使用本插件封装好的云端一体组件，并配置组件的属性场景值scene，即等价于如上步骤1-3；

本插件已集成使用示例，使用HBuilderX导入示例项目体验；另外你也可以参考插件在uni-starter 中的应用。

内置调用uni-captcha-co云对象集成创建/刷新验证码，组件支持双向数据绑定。

配置路径：unicloud配置中心 ，uni-config-center->uni-captcha->config.json 示例：

示例源码如下，请查看 pre > code 标签中的内容

注意：uni-config-center不支持注释，如果直接复制配置示例代码，要将注释删除

替换字体： 路径：/uni_modules/uni-captcha/uniCloud/cloudfunctions/common/uni-captcha/fonts/font.ttf。 请保证字体格式为 .ttf 且包含 ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+- 字符

已过期的配置（版本号：0.6.0+ 已不再支持此方式 ）：

在云对象uni-captcha-co中配置，路径：/uni_modules/uni-captcha/uniCloud/cloudfunctions/uni-captcha-co/config.js->image-captcha 云对象uni-captcha-co中的配置，优先级大于在unicloud配置中心的配置

示例源码如下，请查看 pre > code 标签中的内容

组件名：uni-popup-captcha

验证码实现人机校验等作用的同时，降低了用户体验。为了提升用户体验：绝大部分情况下，验证码应当是非常态的，当接口被高频调用的情况下才需要。 另外验证码会使得我们的前端界面设计变得复杂。所以弹出式验证码组件，应需而生。

示例源码如下，请查看 pre > code 标签中的内容

用于新的验证码记录（使用云端一体组件的用户可以忽略）

示例源码如下，请查看 pre > code 标签中的内容

作废相同设备id和场景值的验证码记录，并创建新的验证码记录（使用云端一体组件的用户可以忽略）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

已过期，uni-captcha 0.3.0起，返回值均已符合uniCloud响应体规范

**Examples:**

Example 1 (markdown):
```markdown
├─uni_modules                              			存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│	└─uni-captcha
│		├─uniCloud
│		│	├─cloudfunctions						云函数目录
│		│	│	├─common							公共模块目录
│		│	│	│	└─uni-captcha					uni-captcha公共模块
│		│	│	└─uni-captcha-co					集成调用uni-captcha方法的云对象
│		│	└─database
│		│	 	├─opendb-verify-codes.schema.json	验证码数据表
│		│		└─db_init.json						初始化数据库文件
│		└─components								组件目录
│			├─uni-captcha
│			│	└─uni-captcha.vue					普通验证码组件
│			└─uni-popup-captcha
│				└─uni-popup-captcha.vue				弹出式验证码组件
```

Example 2 (markdown):
```markdown
├─uni_modules                              			存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│	└─uni-captcha
│		├─uniCloud
│		│	├─cloudfunctions						云函数目录
│		│	│	├─common							公共模块目录
│		│	│	│	└─uni-captcha					uni-captcha公共模块
│		│	│	└─uni-captcha-co					集成调用uni-captcha方法的云对象
│		│	└─database
│		│	 	├─opendb-verify-codes.schema.json	验证码数据表
│		│		└─db_init.json						初始化数据库文件
│		└─components								组件目录
│			├─uni-captcha
│			│	└─uni-captcha.vue					普通验证码组件
│			└─uni-popup-captcha
│				└─uni-popup-captcha.vue				弹出式验证码组件
```

Example 3 (json):
```json
{
		"width":150,
		"height":40,
		"background":"#FFFAE8",
		"size":4,
		"noise":4,
		"color":false,
		"fontSize":40,
		"ignoreChars":"",
		"mathExpr":false,
		"mathMin":1,
		"mathMax":9,
		"mathOperator":"",
		"expiresDate":180,
		"scene":{
			"login":{
				"mathExpr":true	 	//该配置会覆盖根节点的值，表示 scene 的值为 login 时，验证码使用数学表达式
			},
			"register":{
				"expiresDate":60,	 //该配置会覆盖根节点的值，表示scene的值为 register 时，验证码过期时间为 60 秒
			}
		}
	}
```

Example 4 (json):
```json
{
		"width":150,
		"height":40,
		"background":"#FFFAE8",
		"size":4,
		"noise":4,
		"color":false,
		"fontSize":40,
		"ignoreChars":"",
		"mathExpr":false,
		"mathMin":1,
		"mathMax":9,
		"mathOperator":"",
		"expiresDate":180,
		"scene":{
			"login":{
				"mathExpr":true	 	//该配置会覆盖根节点的值，表示 scene 的值为 login 时，验证码使用数学表达式
			},
			"register":{
				"expiresDate":60,	 //该配置会覆盖根节点的值，表示scene的值为 register 时，验证码过期时间为 60 秒
			}
		}
	}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/unipay.html

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-callfunction.html

**Contents:**
- # callFunction方法
- # 云函数的入参
  - # event对象
  - # context对象
    - # 获取云函数调用来源
- # 云函数的返回格式
- # 在云函数中使用cookie

callFunction方式云函数，也称之为普通云函数。

uni-app的前端代码，不再执行uni.request联网，而是通过uniCloud.callFunction调用云函数。

callFunction方式避免了服务器提供域名，不暴露固定ip，减少被攻击的风险。

uniCloud.callFunction可以在uni-app前端执行，也可以在uniCloud云函数中执行。也就是前端和云端都可以调用另一个云函数。

callFunction方法的参数和返回值如下：

uniCloud.callFunction需要一个json对象作为参数，其中包含2个字段

假使云服务空间有一个云函数名为“hellocf”，那么前端可以通过如下方式调用这个云函数

示例源码如下，请查看 pre > code 标签中的内容

客户端callFunction调用云函数时，云函数通过入参接收客户端数据，通过头信息上下文获取客户端信息，经过业务逻辑处理后给客户端返回结果。

假使客户端代码调用云函数hellocf，并传递了{a:1,b:2}的数据，

示例源码如下，请查看 pre > code 标签中的内容

那么云函数侧的代码如下，将传入的两个参数求和并返回客户端：

示例源码如下，请查看 pre > code 标签中的内容

云函数的传入参数有两个，一个是event对象，一个是context对象。

event对象，可以理解为客户端上行参数中的json对象。在使用uni-id且登录成功后，会自动多添加了一个uniIdToken属性。

可以通过 event.uniIdToken 获取 uni-id 的 token，如下：

示例源码如下，请查看 pre > code 标签中的内容

所以开发者需注意，自己上行的参数对象不要包含uniIdToken属性，避免同名冲突。

除了上述属性，如果是uni-app客户端通过callfunction访问云函数，那么context还会追加一批客户端信息。

为了保持向下兼容，新版并没有去掉老版那些大写属性的客户端信息，但文档标注为以废弃。对于新版HBuilderX用户而言，请使用 uni.getSystemInfo 返回的驼峰属性。

HBuilderX 3.4.9起，context 的属性还可以打印出channel和scene，即App的渠道包标记和小程序场景值。但这个功能属于未完成功能，开发者暂不使用这2个属性，后续会升级完善。目前如开发者需要这2个属性，请自行在客户端使用uni.getLaunchOptionsSync 上传。

示例源码如下，请查看 pre > code 标签中的内容

context.SOURCE，返回云函数调用来源，它的值域为：

示例源码如下，请查看 pre > code 标签中的内容

除了CLIENTIP外，其他客户端信息只有使用uni-app客户端以callFunction方式调用才能获取。如果云函数url化后被uni-app通过request调用，也没有客户端信息。

在云函数URL化的场景无法获取客户端平台信息，可以在调用依赖客户端平台的接口接口之前（推荐在云函数入口）通过修改context.PLATFORM手动传入客户端平台信息供其他插件（如：uni-id）使用

示例源码如下，请查看 pre > code 标签中的内容

普通云函数返回给客户端的是json格式数据。返回结果包裹在result下。

前端发起callFunction到云端接收参数并响应，然后反馈前端，前端接收，完整流程代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

其中result是开发者云函数代码返回的数据，其余是云平台返回的。

注意：HBuilderX本地运行云函数时，如果没有系统错误，则只返回result，其他需要在云端运行云函数才会返回。

为了方便统一拦截错误，推荐开发者使用 uniCloud响应体规范

业务报错时，在 result 里返回 errCode 和 errMsg。如下：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

Example 2 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

Example 3 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

Example 4 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

---

## 短信相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/sms.html

**Contents:**
- # 短信相关问题
  - # 短信发送成功，但是回执失败 || 回执失败率较高
  - # 短信发送成功，回执也显示成功，但是用户反馈没有收到短信

---

## uni-publish 统一发布页 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-publish.html

**Contents:**
- # uni-publish 统一发布页
  - # 为什么需要uni-publish 统一发布页？
  - # 概述
  - # 使用
    - # uni-publish 统一发布页 - 管理端
    - # uni-publish 统一发布页 - 用户端

App/小程序/网站做好后，如何告知你的用户？

你需要开发App的下载页、小程序二维码的展示页面，这些内容最好汇总在统一入口，也就是发行平台。

自己从头开发这么一个发行平台，需要考虑的事情太多了：

别急，有了uni-publish 统一发布页，一切迎刃而解，10分钟内搞定所有。

uni-publish 统一发布页分为管理端和用户端两个插件：

uni-publish 统一发布页具有如下特征：

统一发布门户分为两个部分：uni-publish 统一发布页 - 管理端 和 uni-publish 统一发布页 - 用户端

前台展示页面需要使用前端托管或部署到服务器

云储存安装包 CDN 加速，使安装包下载的更快、更稳定

应用发布，填写 App 发布信息，可选发布与暂存

应用发布管理，包括对 更新标题，版本内容，App 下载信息，小程序上架信息，H5 等灵活修改，实时线上更新

在插件市场安装，根据 readme 部署即可。插件地址

负责对所填写应用发布信息的展示与正确引导下载方式。

基于 uni-publish 统一发布页 - 管理端 填写数据，实时请求展示 App 上线详情信息

实时生成当前页面、应用下载二维码，方便手机扫码访问、下载

注：https://m3w.cn/uniapp 将会在三个月之后关闭。

在插件市场安装，根据 readme 部署即可。插件地址

---

## 开通业务 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/frv/service.html

**Contents:**
  - # 开通业务
  - # 余额充值及购买资源包
  - # 安全配置
  - # 调用记录
  - # 调用统计

使用开发者账号登录uniCloud控制台 ，选择实人认证栏目。在使用此功能前需要完成实名认证，可前往开发者中心 完成实名认证。

完成实名认证后，阅读uni实名认证服务协议并点击协议下方的“同意协议并开通”按钮，便可开通实人认证服务。

不管是资源包模式还是按量计费，uni实人认证都具备极高的性价比，相比主流云厂商的官网报价要便宜30%以上，详见费用说明

系统提供了 uniCloud 服务空间白名单安全配置，可以提高接口调用安全性，防止被他人盗用。可点击“添加服务空间”按钮，选择相应的服务空间完成添加服务空间白名单，服务空间添加成功后，只有列表中的服务空间才可以调用当前账号下的实人认证接口。此列表为空时，不校验调用方的服务空间。

系统可查看实人认证实时的调用记录列表，但此业务数据量较大，为了维持服务的稳定性，只能查看30天内的某1天的全部调用记录，默认选择当天。

系统可查看实人认证每日调用汇总数据，包括每日请求次数、每日请求成功次数、每日计费金额等汇总数据。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/cf-callfunction

**Contents:**
- # callFunction方法
- # 云函数的入参
  - # event对象
  - # context对象
    - # 获取云函数调用来源
- # 云函数的返回格式
- # 在云函数中使用cookie

callFunction方式云函数，也称之为普通云函数。

uni-app的前端代码，不再执行uni.request联网，而是通过uniCloud.callFunction调用云函数。

callFunction方式避免了服务器提供域名，不暴露固定ip，减少被攻击的风险。

uniCloud.callFunction可以在uni-app前端执行，也可以在uniCloud云函数中执行。也就是前端和云端都可以调用另一个云函数。

callFunction方法的参数和返回值如下：

uniCloud.callFunction需要一个json对象作为参数，其中包含2个字段

假使云服务空间有一个云函数名为“hellocf”，那么前端可以通过如下方式调用这个云函数

示例源码如下，请查看 pre > code 标签中的内容

客户端callFunction调用云函数时，云函数通过入参接收客户端数据，通过头信息上下文获取客户端信息，经过业务逻辑处理后给客户端返回结果。

假使客户端代码调用云函数hellocf，并传递了{a:1,b:2}的数据，

示例源码如下，请查看 pre > code 标签中的内容

那么云函数侧的代码如下，将传入的两个参数求和并返回客户端：

示例源码如下，请查看 pre > code 标签中的内容

云函数的传入参数有两个，一个是event对象，一个是context对象。

event对象，可以理解为客户端上行参数中的json对象。在使用uni-id且登录成功后，会自动多添加了一个uniIdToken属性。

可以通过 event.uniIdToken 获取 uni-id 的 token，如下：

示例源码如下，请查看 pre > code 标签中的内容

所以开发者需注意，自己上行的参数对象不要包含uniIdToken属性，避免同名冲突。

除了上述属性，如果是uni-app客户端通过callfunction访问云函数，那么context还会追加一批客户端信息。

为了保持向下兼容，新版并没有去掉老版那些大写属性的客户端信息，但文档标注为以废弃。对于新版HBuilderX用户而言，请使用 uni.getSystemInfo 返回的驼峰属性。

HBuilderX 3.4.9起，context 的属性还可以打印出channel和scene，即App的渠道包标记和小程序场景值。但这个功能属于未完成功能，开发者暂不使用这2个属性，后续会升级完善。目前如开发者需要这2个属性，请自行在客户端使用uni.getLaunchOptionsSync 上传。

示例源码如下，请查看 pre > code 标签中的内容

context.SOURCE，返回云函数调用来源，它的值域为：

示例源码如下，请查看 pre > code 标签中的内容

除了CLIENTIP外，其他客户端信息只有使用uni-app客户端以callFunction方式调用才能获取。如果云函数url化后被uni-app通过request调用，也没有客户端信息。

在云函数URL化的场景无法获取客户端平台信息，可以在调用依赖客户端平台的接口接口之前（推荐在云函数入口）通过修改context.PLATFORM手动传入客户端平台信息供其他插件（如：uni-id）使用

示例源码如下，请查看 pre > code 标签中的内容

普通云函数返回给客户端的是json格式数据。返回结果包裹在result下。

前端发起callFunction到云端接收参数并响应，然后反馈前端，前端接收，完整流程代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

其中result是开发者云函数代码返回的数据，其余是云平台返回的。

注意：HBuilderX本地运行云函数时，如果没有系统错误，则只返回result，其他需要在云端运行云函数才会返回。

为了方便统一拦截错误，推荐开发者使用 uniCloud响应体规范

业务报错时，在 result 里返回 errCode 和 errMsg。如下：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

Example 2 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

Example 3 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

Example 4 (javascript):
```javascript
// promise方式
uniCloud.callFunction({
    name: 'hellocf',
    data: { a: 1 }
  })
  .then(res => {});

// callback方式
uniCloud.callFunction({
 name: 'hellocf',
 data: { a: 1 },
 success(){},
 fail(){},
 complete(){}
});
```

---

# Uniapp - Collocation

**Pages:** 65

---

## uni.authorize(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/authorize.html

**Contents:**
- # uni.authorize(OBJECT)
    - # scope 列表
      - 本页导读

提前向用户发起授权请求。调用后会立刻弹窗询问用户是否同意授权小程序使用某项功能或获取用户的某些数据，但不会实际调用对应接口。如果用户之前已经同意授权，则不会出现弹窗，直接返回成功。如果用户之前拒绝了授权，此接口会直接进入失败回调，一般搭配uni.getSetting和uni.openSetting使用。

注意：App平台的授权判断方式，另见：https://ext.dcloud.net.cn/plugin?id=594

注意：scope.userLocation 权限需要在 manifest.json 配置 permission， 详见：https://uniapp.dcloud.io/collocation/manifest

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.getSetting
```

Example 2 (unknown):
```unknown
uni.openSetting
```

Example 3 (javascript):
```javascript
uni.authorize({
    scope: 'scope.userLocation',
    success() {
        uni.getLocation()
    }
})
```

Example 4 (javascript):
```javascript
uni.authorize({
    scope: 'scope.userLocation',
    success() {
        uni.getLocation()
    }
})
```

---

## uni.requestPayment(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/payment.html

**Contents:**
- # uni.requestPayment(OBJECT)
  - # requestPayment 兼容性
  - # 注意事项
  - # orderInfo 注意事项
- # H5 平台
- # App平台支付流程
  - # manifest.json里配置相关参数
- # App支付
  - # 示例
- # 支付宝App支付

uni.requestPayment是一个统一各平台的客户端支付API，不管是在某家小程序还是在App中，客户端均使用本API调用支付。

本API运行在各端时，会自动转换为各端的原生支付调用API。

注意支付不仅仅需要客户端的开发，还需要服务端开发。虽然客户端API统一了，但各平台的支付申请开通、配置回填仍然需要看各个平台本身的支付文档。

比如微信有App支付、小程序支付、H5支付等不同的申请入口和使用流程，对应到uni-app，在App端要申请微信的App支付，而小程序端则申请微信的小程序支付。

如果服务端使用uniCloud ，那么官方提供了uniPay 云端统一支付服务，把App、微信小程序、支付宝小程序里的服务端支付开发进行了统一的封装。

前端统一的uni.requestPayment和云端统一的uniPay搭配，可以极大提升支付业务的开发效率，强烈推荐给开发者使用。uniPay的文档另见：https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-app.html

流程：支付平台功能申请 -> manifest.json 里配置支付参数 -> uni-app 里调用 API 进行支付

示例源码如下，请查看 pre > code 标签中的内容

如果手机端未安装支付宝，调用时会启动支付宝的wap页面登录，如果已安装相应客户端，会启动其客户端登录。

注意微信的App支付、小程序支付、H5支付是不同的体系。微信小程序支付在 微信商户平台 申请支付时，选择公众号支付；普通浏览器里也可以调起微信进行支付，这个在微信叫做H5支付，此功能未开放给普通开发者，需向微信单独申请，详见

示例源码如下，请查看 pre > code 标签中的内容

获取支付通道 (uni.getProvider)

通过支付通道获取产品列表 (iapChannel.requestProduct)

检查是否存在未关闭的订单 (iapChannel.restoreCompletedTransactions, 可选在合适的时机检查)

请求支付，传递产品信息 (uni.requestPayment)

客户端接收苹果返回的支付票据发送到服务器，在服务器请求苹果服务器验证支付是否有效

服务器验证票据有效后在客户端关闭订单 (iapChannel.finishTransaction)

HBuilder 3.5.1 之前因自动关闭订单导致某些情况下丢单的问题

HBuilder 3.5.1 + 增加了手动关闭订单参数 manualFinishTransaction, 在合适的时机调用 iapChannel.finishTransaction 关闭订单

HBuilder 3.5.1+ 开始支持通过 uni.getProvider 获取IAP支付通道的方法

示例源码如下，请查看 pre > code 标签中的内容

iapChannel.requestProduct(<Function> success, <Function> fail)

success 回调值类型 Array<Product>

iapChannel.restoreCompletedTransactions(<Function> success, <Function> fail)

success 回调值类型 Array<Transaction>

iapChannel.finishTransaction(Transaction, <Function> success, <Function> fail)

所有 fail 回调格式为 { errCode: xxx, errMsg: '' }

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

鸿蒙应用、鸿蒙元服务使用华为支付可参考 华为支付接入方式

示例源码如下，请查看 pre > code 标签中的内容

Q：如何使用ping++等聚合支付 A：uni-app的js API 已经完成跨端统一，客户端无需使用三方聚合支付。如果服务器选择uniCloud，也无需三方聚合支付。如果服务端使用php、java等传统服务器开发，可以在服务端使用三方聚合支付。

Q：App端如何使用其他支付，比如银联、PayPal。 A：App 3.4+ 已支持 PayPal，App 3.4 以前的版本使用下面的方案

Q：Appstore审核报PGPay SDK不允许上架的问题 A：数字类产品（比如购买会员等不需要配送实物的商品），Apple规定必须使用苹果IAP应用内支付，给Apple分成30%。打包的时候不要勾选微信或支付宝等其他支付方式。如果你提交的包里包含了微信支付宝等支付的sdk，即使没使用，Appstore也会认为你有隐藏方式，以后会绕过IAP，不给Apple分成，因此拒绝你的App上线。云打包时，manifest里选上支付模块，但sdk配置里去掉微信支付和支付宝支付。很多开发者的Android版是包含微信和支付宝支付的，此时注意分开判断。详见https://ask.dcloud.net.cn/article/36447

**Examples:**

Example 1 (unknown):
```unknown
uni.requestPayment
```

Example 2 (unknown):
```unknown
JSON.stringify(orderInfo)
```

Example 3 (css):
```css
{productid: 'productid'}
```

Example 4 (unknown):
```unknown
manifest.json
```

---

## App.vue/App.uvue | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/App

**Contents:**
- # App.vue/App.uvue
- # 应用生命周期
- # globalData
- # 全局样式
      - 本页导读

App.vue/uvue是uni-app的主组件。uni-app js引擎版是app.vue。uni-app x是app.uvue。以下出现的app.vue一般泛指包含了app.uvue

所有页面都是在App.vue下进行切换的，是应用入口文件。但App.vue本身不是页面，这里不能编写视图元素，也就是没有<template>。

这个文件的作用包括：监听应用生命周期、配置全局样式、配置全局的存储globalData

应用生命周期仅可在App.vue中监听，在页面监听无效。

uni-app 支持如下应用生命周期函数：

示例源码如下，请查看 pre > code 标签中的内容

小程序有globalData，这是一种简单的全局变量机制。这套机制在uni-app里也可以使用，并且全端通用。

当然vue框架的全局变量，另有其他方式定义。

以下是 App.vue 中定义globalData的相关配置：

示例源码如下，请查看 pre > code 标签中的内容

js中操作globalData的方式如下： getApp().globalData.text = 'test'

在应用onLaunch时，getApp对象还未获取，暂时可以使用this.globalData获取globalData。

如果需要把globalData的数据绑定到页面上，可在页面的onShow页面生命周期里进行变量重赋值。

nvue的weex编译模式中使用globalData的话，由于weex生命周期不支持onShow，但熟悉5+的话，可利用监听webview的addEventListener show事件实现onShow效果，或者直接使用weex生命周期中的beforeCreate。但建议开发者使用uni-app编译模式，而不是weex编译模式。

globalData是简单的全局变量，如果使用状态管理，请使用vuex（main.js中定义）

在App.vue中，可以定义一些全局通用样式，例如需要加一个通用的背景色，首屏页面渲染的动画等都可以写在App.vue中。

注意如果工程下同时有vue和nvue文件，全局样式的所有css会应用于所有文件，而nvue支持的css有限，编译器会在控制台报警，提示某些css无法在nvue中支持。此时需要把nvue不支持的css写在单独的条件编译里。如：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
App.vue/uvue
```

Example 2 (html):
```html
<script>
	// 只能在App.vue里监听应用的生命周期
	export default {
		onLaunch: function(options) {
			console.log('App Launch')
			console.log('应用启动路径：', options.path)
		},
		onShow: function(options) {
			console.log('App Show')
			console.log('应用启动路径：', options.path)
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>
```

Example 3 (html):
```html
<script>
	// 只能在App.vue里监听应用的生命周期
	export default {
		onLaunch: function(options) {
			console.log('App Launch')
			console.log('应用启动路径：', options.path)
		},
		onShow: function(options) {
			console.log('App Show')
			console.log('应用启动路径：', options.path)
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>
```

Example 4 (html):
```html
<script>
	// 只能在App.vue里监听应用的生命周期
	export default {
		onLaunch: function(options) {
			console.log('App Launch')
			console.log('应用启动路径：', options.path)
		},
		onShow: function(options) {
			console.log('App Show')
			console.log('应用启动路径：', options.path)
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>
```

---

## uni.getBackgroundAudioManager() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/background-audio-manager

**Contents:**
- # uni.getBackgroundAudioManager()
  - # getBackgroundAudioManager 兼容性
      - 本页导读

获取全局唯一的背景音频管理器 backgroundAudioManager。

背景音频，不是游戏的背景音乐，而是类似QQ音乐那样，App在后台时，仍然在播放音乐。如果你不需要在App切后台时继续播放，那么不应该使用本API，而应该使用普通音频APIuni.createInnerAudioContext 。

backgroundAudioManager 对象的属性列表

backgroundAudioManager 对象的方法列表

示例源码如下，请查看 pre > code 标签中的内容

注意 因为背景音频播放耗费手机电量，所以平台都有管控，需在manifest中填写申请。

**Examples:**

Example 1 (unknown):
```unknown
backgroundAudioManager
```

Example 2 (javascript):
```javascript
const bgAudioManager = uni.getBackgroundAudioManager();
bgAudioManager.title = '致爱丽丝';
bgAudioManager.singer = '暂无';
bgAudioManager.coverImgUrl = 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/music-a.png';
bgAudioManager.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
```

Example 3 (javascript):
```javascript
const bgAudioManager = uni.getBackgroundAudioManager();
bgAudioManager.title = '致爱丽丝';
bgAudioManager.singer = '暂无';
bgAudioManager.coverImgUrl = 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/music-a.png';
bgAudioManager.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
```

Example 4 (javascript):
```javascript
const bgAudioManager = uni.getBackgroundAudioManager();
bgAudioManager.title = '致爱丽丝';
bgAudioManager.singer = '暂无';
bgAudioManager.coverImgUrl = 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/music-a.png';
bgAudioManager.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/frame/lifecycle

**Contents:**
- # 快速体验
- # 看视频，10分钟了解uni-app
- # 为什么要选择uni-app？
      - 开发者/案例数量更多
      - 平台能力不受限
      - 性能体验优秀
      - 周边生态丰富
      - 学习成本低
      - 开发成本低
- # 功能框架图

uni-app 是一个使用 Vue.js 开发所有前端应用的框架，开发者编写一套代码，可发布到iOS、Android、鸿蒙Next、Web（响应式）、以及各种小程序（微信/支付宝/百度/抖音/飞书/QQ/快手/钉钉/淘宝/京东/小红书）、快应用、鸿蒙元服务等多个平台。

DCloud公司拥有900万开发者、数百万应用、12亿手机端月活用户、数千款uni-app插件、70+微信/qq群，开发者可以放心选择。

uni-app在手，做啥都不愁。即使不跨端，uni-app也是更好的小程序开发框架（详见 ）、更好的App跨平台框架、更方便的H5开发框架。不管领导安排什么样的项目，你都可以快速交付，不需要转换开发思维、不需要更改开发习惯。

一套代码编到十几个平台，这不是梦想。眼见为实，扫描以下二维码，亲自体验最全面的跨平台效果！

注： - 某些平台不能提交简单demo，故补充了一些其他功能；hello uni-app示例代码可从 github 获取 - 快应用仅支持 vivo 、oppo、华为 - 360小程序仅 windows平台支持，需要在360浏览器中打开 - uni-app 已支持纯血鸿蒙开发，详见 鸿蒙开发专题。

我们精心准备了一个简单的十分钟介绍视频，方便你快速了解uni-app的主要特征：

uni-app在开发者数量、案例、跨端抹平度、扩展灵活性、性能体验、周边生态、学习成本、开发成本等8大关键指标上拥有更强的优势。

数百万应用、uni统计月活12亿、70+微信/qq群、更高的百度指数

在跨端的同时，通过条件编译+平台特有API调用，可以优雅的为某平台写个性化代码，调用专有能力而不影响其他平台。

加载新页面速度更快、自动diff更新数据。

App端支持原生渲染，可支撑更流畅的用户体验。

微信生态的各种sdk可直接用于跨平台App。

基于通用的前端技术栈，采用vue语法+微信小程序api，无额外学习成本。

不止开发成本，招聘、管理、测试各方面成本都大幅下降。

HBuilderX是高效开发神器，熟练掌握后研发效率至少翻倍（即便只开发一个平台）。

从下面uni-app功能框架图可看出，uni-app在跨平台的过程中，不牺牲平台特色，可优雅的调用平台专有能力，真正做到海纳百川、各取所长。

uni-app实现了一套代码，同时运行到多个平台；如下图所示，一套代码，同时运行到iOS模拟器、Android模拟器、web、微信开发者工具、支付宝小程序Studio、百度开发者工具、抖音开发者工具、QQ开发者工具（底部每个终端选项卡，代表1个终端模拟器）：

---

## getCurrentPages() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/window/window.html

**Contents:**
- # getCurrentPages()
  - # getCurrentPages 兼容性
- # $getAppWebview()
- # $vm
      - 本页导读

getCurrentPages() 函数用于获取当前页面栈的实例，以数组形式按栈的顺序给出，第一个元素为首页，最后一个元素为当前页面。

注意： getCurrentPages()仅用于展示页面栈的情况，请勿修改页面栈，以免造成页面状态错误。

uni-app 在 getCurrentPages()获得的页面里内置了一个方法 $getAppWebview() 可以得到当前webview的对象实例，从而实现对 webview 更强大的控制。在 html5Plus 中，plus.webview具有强大的控制能力，可参考：WebviewObject 。

但uni-app框架有自己的窗口管理机制，请不要自己创建和销毁webview，如有需求覆盖子窗体上去，请使用原生子窗体subNvue。

示例源码如下，请查看 pre > code 标签中的内容

getCurrentPages()可以得到所有页面对象，然后根据数组，可以取指定的页面webview对象

示例源码如下，请查看 pre > code 标签中的内容

uni-app自带的web-view组件，是页面中新插入的一个子webview。获取该对象的方法见：https://ask.dcloud.net.cn/article/35036

通过页面的 Vue 实例可以获取页面的数据、调用页面上的方法以及监听页面的生命周期等

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
getCurrentPages()
```

Example 2 (unknown):
```unknown
getCurrentPages()
```

Example 3 (unknown):
```unknown
getCurrentPages()
```

Example 4 (bash):
```bash
$getAppWebview()
```

---

## main.js/main.uts | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/main.html

**Contents:**
- # main.js/main.uts
- # 代码时序
- # 插件
      - 本页导读

main.js/uts是 uni-app 的入口文件。uni-app js引擎版是main.js，而uni-app x则是main.uts。以下一般用main.js泛指全部。

main.js主要作用是初始化vue实例、定义全局组件、使用需要的插件如 i18n、vuex。

首先引入了Vue库和App.vue，创建了一个vue实例，并且挂载vue实例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一般情况下，使用easycom比全局组件更常用，easycom按需应用更节省资源。

开发者写的代码，在应用启动时，按如下时序加载：

开发者需谨慎在main.js/uts、页面/组件script中export default {}外、和onLaunch中编写代码：

使用Vue.use引用插件，使用Vue.prototype添加全局变量，使用Vue.component注册全局组件。

可以引用vuex，因涉及多个文件，此处没有提供示例，详见hello uni-app示例工程。

无法使用vue-router，路由须在pages.json中进行配置。如果开发者坚持使用vue-router，可以在插件市场 找到转换插件。

**Examples:**

Example 1 (unknown):
```unknown
main.js/uts
```

Example 2 (sql):
```sql
import Vue from 'vue'
import App from './App'
import PageHead from './components/page-head.vue' //全局引用 page-head 组件

Vue.config.productionTip = false
Vue.component('page-head', PageHead) //全局注册 page-head 组件，每个页面将可以直接使用该组件
App.mpType = 'app'

const app = new Vue({
...App
})
app.$mount() //挂载 Vue 实例
```

Example 3 (sql):
```sql
import Vue from 'vue'
import App from './App'
import PageHead from './components/page-head.vue' //全局引用 page-head 组件

Vue.config.productionTip = false
Vue.component('page-head', PageHead) //全局注册 page-head 组件，每个页面将可以直接使用该组件
App.mpType = 'app'

const app = new Vue({
...App
})
app.$mount() //挂载 Vue 实例
```

Example 4 (sql):
```sql
import Vue from 'vue'
import App from './App'
import PageHead from './components/page-head.vue' //全局引用 page-head 组件

Vue.config.productionTip = false
Vue.component('page-head', PageHead) //全局注册 page-head 组件，每个页面将可以直接使用该组件
App.mpType = 'app'

const app = new Vue({
...App
})
app.$mount() //挂载 Vue 实例
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/vue-config

**Contents:**
      - 本页导读

vue.config.js 是一个可选的配置文件，如果项目的根目录中存在这个文件，那么它会被自动加载，一般用于配置 webpack 等编译选项，具体规范参考：vue.config.js

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

发布时动态修改 manifest.json

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

Example 2 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

Example 3 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

Example 4 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

---

## navigator | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/navigator

**Contents:**
- # navigator
      - 本页导读

该组件类似HTML中的<a>组件，但只能跳转本地页面。目标页面必须在pages.json中注册。

除了组件方式，API方式也可以实现页面跳转，另见：https://uniapp.dcloud.io/api/router?id=navigateto

示例源码如下，请查看 pre > code 标签中的内容

url有长度限制，太长的字符串会传递失败，可使用窗体通信 、全局变量 ，或encodeURIComponent等多种方式解决，如下为encodeURIComponent示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
<navigator>
```

Example 2 (typescript):
```typescript
<navigator>
```

Example 3 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="btn-area">
				<navigator url="navigate/navigate?title=navigate" hover-class="navigator-hover">
					<button type="default">跳转到新页面</button>
				</navigator>
				<navigator url="redirect/redirect?title=redirect" open-type="redirect" hover-class="other-navigator-hover">
					<button type="default">在当前页打开</button>
				</navigator>
				<navigator url="/pages/tabBar/extUI/extUI" open-type="switchTab" hover-class="other-navigator-hover">
					<button type="default">跳转tab页面</button>
				</navigator>
			</view>
		</view>
	</view>
</template>
<script>
// navigate.vue页面接受参数
export default {
	onLoad: function (option) { //option为object类型，会序列化上个页面传递的参数
		console.log(option.id); //打印出上个页面传递的参数。
		console.log(option.name); //打印出上个页面传递的参数。
	}
}
</script>
```

Example 4 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="btn-area">
				<navigator url="navigate/navigate?title=navigate" hover-class="navigator-hover">
					<button type="default">跳转到新页面</button>
				</navigator>
				<navigator url="redirect/redirect?title=redirect" open-type="redirect" hover-class="other-navigator-hover">
					<button type="default">在当前页打开</button>
				</navigator>
				<navigator url="/pages/tabBar/extUI/extUI" open-type="switchTab" hover-class="other-navigator-hover">
					<button type="default">跳转tab页面</button>
				</navigator>
			</view>
		</view>
	</view>
</template>
<script>
// navigate.vue页面接受参数
export default {
	onLoad: function (option) { //option为object类型，会序列化上个页面传递的参数
		console.log(option.id); //打印出上个页面传递的参数。
		console.log(option.name); //打印出上个页面传递的参数。
	}
}
</script>
```

---

## input | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/input

**Contents:**
- # input
  - # 属性说明
    - # type 有效值
    - # text-content-type 有效值
    - # confirm-type 有效值
    - # inputmode 有效值
  - # App平台iOS端软键盘上方横条去除方案
  - # 关于软键盘弹出的逻辑说明
  - # 关于软键盘收起的逻辑说明
  - # App平台原生输入框的说明

html规范中input不仅是输入框，还有radio、checkbox、时间、日期、文件选择功能。在uni-app规范中，input仅仅是输入框。其他功能uni-app有单独的组件或API：radio组件 、checkbox组件 、时间选择 、日期选择 、图片选择 、视频选择 、多媒体文件选择(含图片视频) 、通用文件选择 。

新增于 uni-app 3.6.16+ inputmode是html规范后期更新的内容。各家小程序还未支持此属性。

在符合条件的高版本webview里，uni-app的web和app-vue平台中可使用本属性。

app-vue在iOS上，webview中的软键盘弹出时，默认在软键盘上方有一个横条，显示着：上一项、下一项和完成等按钮。 如不想显示这个横条，可以配置softinputNavBar: 'none'

配置方式，在 pages.json 中某个页面或全局配置 style

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是nvue页面，iOS默认就没有键盘上方的横条，无需任何设置。

App平台软键盘弹出有 adjustResize|adjustPan 两种模式，默认为 adjustPan 模式，小程序平台只支持 adjustPan 模式，H5平台因不同浏览器而异

配置方式，在 pages.json 中配置 style

示例源码如下，请查看 pre > code 标签中的内容

以上为默认逻辑，uni-app同时提供了隐藏软键盘的api：uni.hideKeyboard()

在app平台，有titleNView配置的searchinput原生输入框和plus.nativeObj.view的drawinput。这两种方式的输入框都是原生的，不是webview里的。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
compositionstart、compositionend、compositionupdate
```

Example 2 (unknown):
```unknown
cursor-color
```

Example 3 (unknown):
```unknown
app-plus vue
```

Example 4 (unknown):
```unknown
Chrome >= 66
```

---

## uni.getBackgroundAudioManager() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/background-audio-manager.html

**Contents:**
- # uni.getBackgroundAudioManager()
  - # getBackgroundAudioManager 兼容性
      - 本页导读

获取全局唯一的背景音频管理器 backgroundAudioManager。

背景音频，不是游戏的背景音乐，而是类似QQ音乐那样，App在后台时，仍然在播放音乐。如果你不需要在App切后台时继续播放，那么不应该使用本API，而应该使用普通音频APIuni.createInnerAudioContext 。

backgroundAudioManager 对象的属性列表

backgroundAudioManager 对象的方法列表

示例源码如下，请查看 pre > code 标签中的内容

注意 因为背景音频播放耗费手机电量，所以平台都有管控，需在manifest中填写申请。

**Examples:**

Example 1 (unknown):
```unknown
backgroundAudioManager
```

Example 2 (javascript):
```javascript
const bgAudioManager = uni.getBackgroundAudioManager();
bgAudioManager.title = '致爱丽丝';
bgAudioManager.singer = '暂无';
bgAudioManager.coverImgUrl = 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/music-a.png';
bgAudioManager.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
```

Example 3 (javascript):
```javascript
const bgAudioManager = uni.getBackgroundAudioManager();
bgAudioManager.title = '致爱丽丝';
bgAudioManager.singer = '暂无';
bgAudioManager.coverImgUrl = 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/music-a.png';
bgAudioManager.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
```

Example 4 (javascript):
```javascript
const bgAudioManager = uni.getBackgroundAudioManager();
bgAudioManager.title = '致爱丽丝';
bgAudioManager.singer = '暂无';
bgAudioManager.coverImgUrl = 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/music-a.png';
bgAudioManager.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-push/open.html

**Contents:**
- # uni-push配置页面
  - # 通过开发者中心进入
  - # 通过 HBuilderX 进入
  - # 首次开通 uni-push
  - # 填写应用信息
  - # 修改应用信息
  - # 关闭uni-push
  - # 其它配置
- # 云端打包
- # 使用推送

uni-push 需要在 开发者中心 申请开通后，方可使用。uni-push 1.0和uni-push 2.0开通方式基本一致，本文以uni-push 2.0为例进行说明。

Tips: 目前只有应用所有者可以操作uni-push。应用协作者暂不支持。

开发者可以通过以下方式进入uni-push配置页面：

uni-app项目支持以上两种方式，uni-app x项目目前只支持方式1进入配置页面。

使用 DCloud 账号登录 开发者中心 ，登录后会进入“我的应用”列表，在列表中可以看到各应用的uni-push开通状态。

在左侧菜单点击“uni-push”，然后选择 1.0或2.0，进入uni-push信息页，左上角显示为当前要操作的应用，点击可以切换应用。如下图所示：

注意： 1.0和2.0的配置页面信息略有不同，2.0开通时需要绑定服务空间，1.0不需要。

打开 HBuilderX，双击项目中的 “manifest.json” 文件，选择“安卓/iOS模块配置”，在配置页面中向下找到“Push(消息推送)”，勾选后，点击相应版本的配置链接，即可进入 uni-push 配置页面。如下图所示：

按照国家法律要求，所有提供云服务的公司在用户使用云服务时都需要验证手机号。查看如何验证手机号

用户初次开通 uni-push 时，需要向个推同步手机号信息（DCloud开发者无需再注册个推账户），请参考页面提示信息完成业务开通。

应用开通uni-push功能时，需要提交应用相关信息，如下图所示：

关联服务空间说明：uni-push 2.0需要开发者开通uniCloud。不管您的业务服务器是否使用uniCloud，但专业推送服务器在uniCloud上。

在uniCloud的云函数中，加载扩展库 uni-cloud-push，直接调用相关API，无需额外的服务端配置。而传统服务器开发者需要把这个云函数URL化 后变成http接口，再由原来的php或java代码调用这个http接口。

开通App的完整流程较多，但开通web和小程序的流程比较简单，即开即用。可以快速将uni-app项目运行到浏览器或小程序体验。

uni-push开通完成后，后续仍可以在配置页面修改应用相关信息。

当应用不再使用uni-push时，可在配置页面关闭该功能。

应用开通uni-push功能以后，只需要在 HBuilderX 中打开manifest.json，选择“安卓/iOS模块配置”，在配置页面向下找到推送功能配置，勾选“Push(消息推送)”，然后再选择相应的uni-push版本即可。

注意： uni-app x项目通过编译摇树来控制是否开启uni-push，开发者无需手动开启。

**Examples:**

Example 1 (unknown):
```unknown
uni-push 1.0
```

Example 2 (unknown):
```unknown
uni-push 2.0
```

Example 3 (unknown):
```unknown
uni-push 2.0
```

Example 4 (unknown):
```unknown
uni-push 2.0
```

---

## manifest.json 应用配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/manifest.html

**Contents:**
- # manifest.json 应用配置
- # 配置项列表
  - # networkTimeout
  - # uniStatistics
  - # app-plus
    - # App Splashscreen
    - # App Modules
    - # App Distribute
    - # App SdkConfigs
    - # optimization

manifest.json 文件是应用的配置文件，用于指定应用的名称、图标、权限等。HBuilderX 创建的工程此文件在根目录，CLI 创建的工程此文件在 src 目录。

自HBuilderX 2.5.10起，上述默认超时时间由6秒改为60秒，对齐微信小程序平台。

PS：上表只列出了核心部分，App平台的配置其实非常多，完整内容请参考 完整的 manifest.json。

splash（启动封面）是App必然存在的、不可取消的。

alwaysShowBeforeRender和autoclose属性组合设置，可配置以下三种关闭启动界面（splash）策略，详见

模块选择是为了控制App的包体积，不需要的模块可以在打包时剔除。

三方原生SDK配置。三方SDK的使用需要向这些SDK提供商申请，并配置参数到此处。可在HBuilderX可视化界面（App SDK配置）输入配置，此配置仅云打包后生效，本地打包需自行在原生工程中配置。

可以减轻启动时加载的js数量，提升启动速度。

从uni-app 2.7.12+ 开始，App-vue平台也兼容了小程序的分包配置，但默认并不开启。

在manifest配置以下节点，可以在App端启动分包。

示例源码如下，请查看 pre > code 标签中的内容

在manifest中启动分包后，需要在pages.json中配置具体的分包规则，与小程序的配置相同，详见：https://uniapp.dcloud.io/collocation/pages?id=subpackages

也就是一旦在pages.json里配置分包，小程序一定生效，而app是否生效，取决于manifest里是否开启。

当App代码使用了低版本webview不支持的语法时（比如使用了vue3），可以在manifest配置本属性，来指定最低运行的webview版本。

当系统webview版本不符合需求时，uni-app引擎会自动弹框。同时开发者可以指定使用 x5引擎webview 来替代系统webview，以保障浏览器兼容性。详见x5文档

当你的应用强依赖x5时，比如需要vue页面的字体和tabbar等原生界面保持一致时，也可以在manifest配置本属性。

示例源码如下，请查看 pre > code 标签中的内容

提示：vue3 vue页面 要求 Android 系统 webview 最低版本为 64.0.3282.116

鸿蒙应用项目设置，支持 distribute 属性，其值为一个 Object 对象：

此配置对象用于配置鸿蒙打包时使用的数字签名证书信息，可分别配置调试证书和发布证书两组信息。

可以通过可视化方式进行设置，支持自动获取调试证书。

调试证书的键名为 "default"，发布证书的键名为 "release"，其值为一个 Object：

目前 Vue2 支持， Vue3 暂不支持

需要使用自定义模板的场景，通常有以下几种情况：

使用自定义模板时，1. 工程根目录下新建一个html文件；2. 复制下面的基本模板内容，到这个html文件，在此基础上修改meta和引入js；3. 在 manifest.json->h5->template 节点中关联这个html文件的路径。

示例源码如下，请查看 pre > code 标签中的内容

在hello uni-app示例中有一个template.h5.html文件，即是此用途。

H5平台是SPA单页应用，普通的SEO信息即加meta字段只能在，自定义的模板html里配置首页。

但SEO的时代在变，现在更有效的方式，使用uni-app同时发布一版百度小程序，这个搜索权重更高。DCloud的ask社区的H5版也是uni-app做的，同时发布了百度小程序，权重更高，每天来自百度的搜索量非常多。是一个可现身说法的好案例。

Tips：uni-app 中 manifest.json->h5->devServer，vue2 实际上对应 webpack 的 devServer ，vue3 实际上对应 vite 的 server ，鉴于 manifest 为 json 文件，故 webpack.config.js->devServer 及 vite.config.js->server 配置项下的简单类型属性均可在manifest.json->h5->devServer节点下配置，funciton 等复杂类型暂不支持。

配置 publicPath 为 cdn 资源地址前缀，这样编译出来的 html 文件，引用的 js，css 路径会自动变成 cdn 上的地址。

注意：如果想对图片生效，image组件的图片地址需要使用相对路径

以 hello-uniapp 发布 H5 时为例

未配置 publicPath 时，发布时 index.html 中的结果：

示例源码如下，请查看 pre > code 标签中的内容

配置 publicPath 为 https://www.cdn.com/h5/（无效地址仅用作示例） 后，发布时 index.html 中的结果：

示例源码如下，请查看 pre > code 标签中的内容

三方SDK配置。三方SDK的使用需要向这些SDK提供商申请，并配置参数到此处。可在HBuilderX可视化界面（H5 配置）输入配置。

地图服务商 SDK 配置，使用地图以及位置（IP 定位及坐标转换）需要配置此项。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Tips：关于摇树优化（treeShaking）原理及优化结果，参考：https://ask.dcloud.net.cn/article/36279

注意: 使用微信小程序手势组件会强制开启 ES6 转 ES5

如果需要使用微信小程序的云开发，需要在 mp-weixin 配置云开发目录

示例源码如下，请查看 pre > code 标签中的内容

配置目录之后，vue2 项目 需要在项目根目录新建 vue.config.js 配置对应的文件编译规则

示例源码如下，请查看 pre > code 标签中的内容

vue3 项目 需要在项目根目录新建 vite.config.js 配置对应的文件编译规则

示例源码如下，请查看 pre > code 标签中的内容

小程序开发者工具 IDE 3.0.1+ 版本开始支持新版配置，查看详情

鸿蒙元服务项目设置，目前只支持一个 distribute 属性，其值为一个 Object 对象：

此配置对象用于配置鸿蒙打包时使用的数字签名证书信息，可分别配置调试证书和发布证书两组信息。

可以通过可视化方式进行设置，支持自动获取调试证书。

调试证书的键名为 "default"，发布证书的键名为 "release"，其值为一个 Object：

HBuilderX 3.6.16+ 支持项目根目录(cli 项目为 src 目录)下创建配置文件自定义小程序项目配置。平台对应文件名如下：

示例源码如下，请查看 pre > code 标签中的内容

以上面的分包为例，放在每个分包root对应目录下的静态文件会被打包到此分包内。

示例源码如下，请查看 pre > code 标签中的内容

Q：iOS 应用调用相机等权限时，弹出的提示语如何修改？ A：在 manifest.json 可视化界面-App模块权限配置-iOS隐私信息访问的许可描述

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
HBuilderX 2.5.10
```

Example 3 (json):
```json
{
  "app-plus": {
    "optimization": {
      "subPackages": true
    },
    "runmode" : "liberate" // 开启分包优化后，必须配置资源释放模式
  }
}
```

Example 4 (json):
```json
{
  "app-plus": {
    "optimization": {
      "subPackages": true
    },
    "runmode" : "liberate" // 开启分包优化后，必须配置资源释放模式
  }
}
```

---

## page-meta | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/page-meta.html

**Contents:**
- # page-meta
    - # head标签
    - # 示例代码
      - 本页导读

页面属性配置节点，用于指定页面的一些属性、监听页面事件。可部分替代pages.json的功能。

从微信基础库2.9.0开始，新增了page-meta组件，它是一个特殊的标签，有点类似html里的header标签。页面的背景色、原生导航栏的参数，都可以写在page-meta里。HBuilderX 2.6.3+ 支持了这个组件，并且全平台都实现了。

从某种意义讲，page-meta对pages.json有一定替代作用，可以让页面的配置和页面内容代码写在一个vue文件中。它还可以实现通过变量绑定来控制页面配置。但它的性能不如pages.json的配置，在新页面加载时，渲染速度还是pages.json方式的写法更快。

page-meta只能是页面内的第一个节点。可以配合 navigation-bar 组件一同使用。

从HBuilderX 2.6.3起，编译到所有平台均支持page-meta，但编译到微信时，受微信基础库版本限制；编译到其他平台不受平台版本限制。

vue3 下还可以在page-meta内使用浏览器原生 head 标签，此用法仅 vue3 版本 ssr 可用，方便在 编译为 ssr 时进行 seo 优化。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
<page-meta>
```

Example 2 (unknown):
```unknown
<page-meta>
```

Example 3 (unknown):
```unknown
HBuilderX 3.3.0
```

Example 4 (html):
```html
<template>
  <page-meta
    :background-text-style="bgTextStyle"
    :background-color="bgColor"
    :background-color-top="bgColorTop"
    :background-color-bottom="bgColorBottom"
    :scroll-top="scrollTop"
    page-style="color: green"
    root-font-size="16px"
  >
    <head>
      // 仅vue3 ssr支持，此节点下的元素会被拷贝到h5页面的head标签下，可以利用此特性进行seo优化
      <meta name="keyword" :content="title" />
    </head>
  </page-meta>
  <view class="content"> </view>
</template>

<script>
  export default {
    data() {
      return {
        keyword: "",
      };
    },
    serverPrefetch() {
      // 仅vue3版本支持
      this.keyword = "ServerKeyword";
    },
    onLoad() {},
    methods: {},
  };
</script>
```

---

## pages.json 页面路由 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/pages.html

**Contents:**
- # pages.json 页面路由
- # 配置项列表
- # globalStyle
- # topWindow
    - # matchMedia
- # leftWindow
- # rightWindow
- # pages
- # style
  - # 自定义导航栏使用注意

pages.json 文件用来对 uni-app 进行全局配置，决定页面文件的路径、窗口样式、原生的导航栏、底部的原生 tabbar 等。

导航栏高度为 44px (不含状态栏)，tabBar 高度为 50px (不含安全区)。

它类似微信小程序中app.json的页面管理部分。注意定位权限申请等原属于app.json的内容，在 uni-app 中是在 manifest 中配置。

以下是一个包含了所有配置选项的 pages.json ：

示例源码如下，请查看 pre > code 标签中的内容

用于设置应用的状态栏、导航条、标题、窗口背景色等。

uni-app 2.9+ 新增 leftWindow, topWindow, rightWindow 配置。用于解决宽屏适配问题。

以现有的手机应用为 mainWindow，在左、上、右，可以追加新的页面显示窗体。

整体的宽屏适配思路，参考单独的宽屏适配指南

目前 style 节点仅支持配置 width，height 等 css 样式相关属性

如果需求当存在 topwindow 时，自动隐藏页面的 navigationBar，根据需求不同在App.vue中配置如下 css：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过 matchMedia 的调节，可以自适应在不同屏幕上显示指定的 window。

示例源码如下，请查看 pre > code 标签中的内容

案例演示：HBuilderX 2.9.9+，新建项目选择 hello uni-app 或新闻模板，或直接浏览：https://hellouniapp.dcloud.net.cn/

窗口通信参考：https://uniapp.dcloud.net.cn/api/window/communication

uni-app 通过 pages 节点配置应用由哪些页面组成，pages 节点接收一个数组，数组每个项都是一个对象，其属性值如下：

示例源码如下，请查看 pre > code 标签中的内容

用于设置每个页面的状态栏、导航条、标题、窗口背景色等。

页面中配置项会覆盖 globalStyle 中相同的配置项

示例源码如下，请查看 pre > code 标签中的内容

当 navigationStyle 设为 custom 或 titleNView 设为 false 时，原生导航栏不显示，此时要注意几个问题：

示例源码如下，请查看 pre > code 标签中的内容

鉴于以上问题，在原生导航能解决业务需求的情况下，尽量使用原生导航。甚至有时需要牺牲一些不是很重要的需求。在 App 和 H5 下，uni-app 提供了灵活的处理方案：titleNView、subNVue、或整页使用 nvue。但在小程序下，因为其自身的限制，没有太好的方案。有必要的话，也可以用条件编译分端处理。

配置编译到 App（安卓、iOS） 平台时的特定样式，部分常用配置 H5 平台也支持。以下仅列出常用，更多配置项参考 WebviewStyles 。

当 autoBackButton 设置为 true 时生效。 通过此属性可自定义返回按钮样式，如图标大小、红点、角标、标题等。

使用 type 值设置按钮的样式时，会忽略 fontSrc 和 text 属性。

searchInput 可以在 titleNView 的原生导航栏上放置搜索框。其宽度根据周围元素自适应。

searchInput 的点击输入框 onNavigationBarSearchInputClicked、文本变化 onNavigationBarSearchInputChanged、点击搜索按钮 onNavigationBarSearchInputConfirmed 等生命周期，见文档页面生命周期。

以下列出部分配置。关于全面的导航栏配置，这里有一个完善的演示工程，演示了导航栏的各种效果，详见：https://ext.dcloud.net.cn/plugin?id=1765

示例源码如下，请查看 pre > code 标签中的内容

subNVues 是 vue 页面的原生子窗体。用于解决 App 中 vue 页面中的层级覆盖和原生界面灵活自定义用的。

它不是全屏页面，也不是组件，就是一个原生子窗体。它是一个 nvue 页面，使用 weex 引擎渲染，提供了比 cover-view、plus.nativeObj.view 更强大的原生排版能力，方便自定义原生导航或覆盖原生地图、视频等。请详读subNVues 开发指南

subNVue 也可以在 nvue 页面中使用。但目前在纯 nvue 下（render 为 native）还不支持。

示例源码如下，请查看 pre > code 标签中的内容

在 App 平台下可以自定义部分下拉刷新的配置 page->style->app-plus->pullToRefresh。

示例源码如下，请查看 pre > code 标签中的内容

配置编译到 app-harmony 平台时的特定样式。

使用 type 值设置按钮的样式时，会忽略 fontSrc 和 text 属性。

h5 平台下拉刷新动画，只有 circle 类型。

配置编译到 MP-ALIPAY 平台时的特定样式

配置编译到 MP-WEIXIN 平台时的特定样式

配置编译到 MP-BAIDU 平台时的特定样式

HBuilderX 2.5.5起支持easycom组件模式。

传统 vue 组件，需要安装、引用、注册，三个步骤后才能使用组件。easycom将其精简为一步。

只要组件路径符合规范（具体见下），就可以不用引用、注册，直接在页面中使用。如下：

示例源码如下，请查看 pre > code 标签中的内容

不管 components 目录下安装了多少组件，easycom打包会自动剔除没有使用的组件，对组件库的使用尤为友好。

组件库批量安装，随意使用，自动按需打包。以官方的uni-ui为例，在 HBuilderX 新建项目界面选择uni-ui项目模板，只需在页面中敲 u，拉出大量组件代码块，直接选择，即可使用。大幅提升开发效率，降低使用门槛。

在uni-app 插件市场 下载符合components/组件名称/组件名称.vue目录结构的组件，均可直接使用。

easycom是自动开启的，不需要手动开启，有需求时可以在pages.json的easycom节点进行个性化设置，如关闭自动扫描，或自定义扫描匹配组件的策略。设置参数如下：

如果你的组件，不符合 easycom 前述的路径规范。可以在 pages.json 的 easycom 节点中自行定义路径规范。

如果需要匹配 node_modules 内的 vue 文件，需要使用packageName/path/to/vue-file-$1.vue形式的匹配规则，其中packageName为安装的包名，/path/to/vue-file-$1.vue为 vue 文件在包内的路径。

示例源码如下，请查看 pre > code 标签中的内容

如果应用是一个多 tab 应用，可以通过 tabBar 配置项指定一级导航栏，以及 tab 切换时显示的对应页。

在 pages.json 中提供 tabBar 配置，不仅仅是为了方便快速开发导航，更重要的是在 App 和小程序端提升性能。在这两个平台，底层原生引擎在启动时无需等待 js 引擎初始化，即可直接读取 pages.json 中配置的 tabBar 信息，渲染原生 tab。

其中 list 接收一个数组，数组中的每个项都是一个对象，其属性值如下：

midButton 没有 pagePath，需监听点击事件，自行处理点击后的行为逻辑。监听点击事件为调用 API：uni.onTabBarMidButtonTap，详见https://uniapp.dcloud.io/api/ui/tabbar?id=ontabbarmidbuttontap

tabbar 的 js api 见接口-界面-tabbar ，可实现动态显示隐藏（如弹出层无法覆盖 tabbar）、内容修改（如国际化）、item 加角标等功能。hello uni-app 中也有示例。

tabbar 的 item 点击事件见页面生命周期的 onTabItemTap 。

代码跳转到 tabbar 页面，api 只能使用uni.switchTab ，不能使用 uni.navigateTo、uni.redirectTo；使用 navigator 组件跳转时必须设置open-type="switchTab"

tabbar 的默认高度，在不同平台不一样。App 端的默认高度在 HBuilderX 2.3.4 起从 56px 调整为 50px，与 H5 端统一。开发者也可以自行设定高度，调回 56px。详见

tabbar 在 H5 端是 div 模拟的，属于前端屏幕窗口的一部分，如果要使用 bottom 居底定位方式，应该使用 css 变量--window-bottom，比如悬浮在 tabbar 上方 10px 的按钮，样式如下bottom: calc(var(--window-bottom) + 10px)

中间带+号的 tabbar 模板例子，参考 。可跨端，但+号不凸起。如需中间凸起，配置 tabbar 的 midButton。

如果是需要先登录、后进入 tab 页面，不需要把登录页设为首页，首页仍然是 tabbar 页，可参考云端一体登录模板

前端弹出遮罩层挡不住 tabbar 的问题，跨端处理方式时动态隐藏 tabbar。App 端可以使用 plus.nativeObj.view 或 subNVue 做弹出和遮罩，可参考这个底部原生图标分享菜单例子

微信小程序模拟器 1.02.1904090 版有 bug，在缩放模拟器页面百分比后，tabbar 点击多次后就会卡死。真机无碍，使用时注意。详见

PC 宽屏上，当页面存在 topWindow 或 leftWindow 或 rightWindow 等多窗体结构时，若想改变 tabbar 显示的位置，请使用 custom-tab-bar 组件 配置，若想隐藏 tabbar，可以使用如下 css（好处是可以和 leftwindow 等窗体联动）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

原生 tabBar 是相对固定的配置方式，可能无法满足所有场景，这就涉及到自定义 tabBar。

但注意除了 H5 端，自定义 tabBar 的性能体验会低于原生 tabBar。App 和小程序端非必要不要自定义。

启动模式配置，仅开发期间生效，用于模拟直达页面的场景，如：小程序转发后，用户点击所打开的页面。

示例源码如下，请查看 pre > code 标签中的内容

分包加载配置，此配置为小程序的分包加载机制。

因小程序有体积和资源加载限制，各家小程序平台提供了分包方式，优化小程序的下载和启动速度。

所谓的主包，即放置默认启动页面/TabBar 页面，以及一些所有分包都需用到公共资源/JS 脚本；而分包则是根据 pages.json 的配置进行划分。

在小程序启动时，默认会下载主包并启动主包内页面，当用户进入分包内某个页面时，会把对应分包自动下载下来，下载完成后再进行展示。此时终端界面会有等待提示。

App 默认为整包。从 uni-app 2.7.12+ 开始，vue2 模式也兼容了小程序的分包配置。其目的不用于下载提速，而用于首页是 vue 时的启动提速。App 下开启分包，除在 pages.json 中配置分包规则外，还需要在 manifest 中设置在 app 端开启分包设置，详见：https://uniapp.dcloud.io/collocation/manifest?id=app-vue-optimization

subPackages 节点接收一个数组，数组每一项都是应用的子包，其属性值如下：

假设支持分包的 uni-app 目录结构如下：

示例源码如下，请查看 pre > code 标签中的内容

配置 preloadRule 后，在进入小程序某个页面时，由框架自动预下载可能需要的分包，提升进入后续分包页面时的启动速度

preloadRule 中，key 是页面路径，value 是进入此页面的预下载配置，每个配置有以下几项：

app 的分包，同样支持 preloadRule，但网络规则无效。

**Examples:**

Example 1 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

Example 2 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

Example 3 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

Example 4 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

---

## uni.pageScrollTo(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/scroll.html

**Contents:**
- # uni.pageScrollTo(OBJECT)
- # 平台差异说明
  - # pageScrollTo 兼容性
- # OBJECT参数说明
- # uni-app x 注意事项
      - 本页导读

将页面滚动到目标位置。可以指定滚动到具体的scrollTop数值，也可以指定滚动到某个元素的位置

selector类似于 CSS 的选择器，但仅支持下列语法。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
.a-class.another-class
```

Example 2 (unknown):
```unknown
.the-parent > .the-child
```

Example 3 (unknown):
```unknown
.the-ancestor .the-descendant
```

Example 4 (unknown):
```unknown
.the-ancestor >>> .the-descendant
```

---

## uni.getLaunchOptionsSync() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/getLaunchOptionsSync

**Contents:**
- # uni.getLaunchOptionsSync()
  - # getLaunchOptionsSync 兼容性
      - 本页导读

获取启动时的参数。返回值与App.onLaunch的回调参数一致

默认提供 7 个渠道（Google、360、小米、华为、应用宝、vivo、oppo），更多可以在manifest.json文件中【源码视图】进行配置，详情

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 2 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 3 (unknown):
```unknown
仅微信小程序(2.20.0+)
```

Example 4 (unknown):
```unknown
仅抖音小程序(1.90.0+)
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/vue-config.html

**Contents:**
      - 本页导读

vue.config.js 是一个可选的配置文件，如果项目的根目录中存在这个文件，那么它会被自动加载，一般用于配置 webpack 等编译选项，具体规范参考：vue.config.js

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

发布时动态修改 manifest.json

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

Example 2 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

Example 3 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

Example 4 (json):
```json
const path = require('path')
const CopyWebpackPlugin = require('copy-webpack-plugin') //最新版本copy-webpack-plugin插件暂不兼容，推荐v5.0.0

module.exports = {
	configureWebpack: {
		plugins: [
			new CopyWebpackPlugin([
				{
					from: path.join(__dirname, 'src/images'),
					to: path.join(__dirname, 'dist', process.env.NODE_ENV === 'production' ? 'build' : 'dev', process.env.UNI_PLATFORM, 'images')
				}
			])
		]
	}
}
```

---

## uni-ad 原生微信小程序开发接入方式 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-weixin-native.html

**Contents:**
- # uni-ad 原生微信小程序开发接入方式
- # 注册广告插件
- # 注册页面组件
- # 修改页面路径
- # 使用uni-ad 广告组件
      - 本页导读

开发者如果使用非 uni-app 发行的项目（即微信小程序原生开发），可以在微信小程序项目中自行配置，从而使用 uni-ad功能。

在小程序 app.json中注册广告插件，需要完全按照下方值配置。

示例源码如下，请查看 pre > code 标签中的内容

在小程序使用广告的页面中，配置广告插件。 即可在当前页面使用 uni-ad 功能。 page.json

示例源码如下，请查看 pre > code 标签中的内容

在使用广告的页面，需要在页面路径中增加广告位标识，如 pages/test-ad/test-ad_1013000002，其中test-ad 为实际页面路径， 1013000002 是广告位 id（即换成你自己申请下来的广告位），如果一个页面使用到多种类型的广告位，任选一个加上。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在使用插件时，必须传入 plugins属性,此属性接受一个字符串类型的值 ，内容为当前插件配置的 name、provider 、version的一维对象数组转换的字符串。

例如 ，当前app.json 中插件配置为：

示例源码如下，请查看 pre > code 标签中的内容

则 plugins 的值为 '[{"name":"uni-ad","provider":"wxe6129e9cc9619c07","version":"2.0.0"}]',具体用法见下方示例。

示例源码如下，请查看 pre > code 标签中的内容

注意事项：通过 wx:if 销毁组件时会自动销毁广告示例，并关闭广告效果

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
  "plugins": {
    "uni-ad": {
      "version": "2.0.0",
      "provider": "wxe6129e9cc9619c07"
    }
  }
}
```

Example 2 (json):
```json
{
  "plugins": {
    "uni-ad": {
      "version": "2.0.0",
      "provider": "wxe6129e9cc9619c07"
    }
  }
}
```

Example 3 (json):
```json
{
  "plugins": {
    "uni-ad": {
      "version": "2.0.0",
      "provider": "wxe6129e9cc9619c07"
    }
  }
}
```

Example 4 (json):
```json
{
  "plugins": {
    "uni-ad": {
      "version": "2.0.0",
      "provider": "wxe6129e9cc9619c07"
    }
  }
}
```

---

## 监听权限申请 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/create-request-permission-listener.html

**Contents:**
- # 监听权限申请
- # uni.createRequestPermissionListener()
  - # createRequestPermissionListener 兼容性
- # 全局监听权限申请并弹窗提示用户权限申请原因
- # Tips
      - 本页导读

app-android平台，可使用本API监听应用权限申请确认框的弹出和关闭。不管是哪处的业务代码在申请权限，当弹出和关闭权限申请确认框时均会触发本监听事件。

华为应用市场审核时要求：APP在调用终端权限时，应同步告知用户申请该权限的目的。此时即可使用本API，在app.uvue里全局监听。

创建监听对象后，返回RequestPermissionListener，然后调起其的onConfirm和onComplete。

创建一个监听权限申请的 RequestPermissionListener 对象。

HBuilderX (4.0+) android 平台支持

注意：HBuilderX 4.01 Vue2项目需要使用自定义基座测试监听权限申请的功能，标准基座暂不支持测试。

RequestPermissionListener 对象的方法列表

示例源码如下，请查看 pre > code 标签中的内容

iOS的权限申请原因，是在manifest或info.plist里配置的。

Android没有在系统层面提供这套机制，但一些应用商店（如华为），又要求申请权限时弹框说明原因。

虽然uni.createRequestPermissionListener可以监听权限申请，但前端弹框的层级较低，无法正常显示权限申请原因。

所以DCloud提供了一个插件，可以在原生层面给出文字提示：

**Examples:**

Example 1 (unknown):
```unknown
APP在调用终端权限时，应同步告知用户申请该权限的目的
```

Example 2 (unknown):
```unknown
RequestPermissionListener
```

Example 3 (vue):
```vue
<template>
	<view>
		<view class="permission-alert" id="permission-alert" :style="{'transform':isPermissionAlertShow ? 'translateY(0)':'translateY(-250rpx)'}">
			<text style="font-size: 20px;margin-bottom: 10px;margin-top: 5px; display: block;">手机状态权限申请说明：</text>
			<text style="color: darkgray;">uni-app正在申请手机状态权限，允许或拒绝均不会获取任何隐私信息。</text>
		</view>
		<button @click="requestPermission">点击申请日历权限</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isPermissionAlertShow: false,
				//permissionListener: null
			}
		},
		onReady() {
			this.watchPermission()
		},
		onUnload() {
			if (this.permissionListener) {
				this.permissionListener.stop()
			}
		},
		methods: {
			watchPermission() {
				this.permissionListener = uni.createRequestPermissionListener();
				this.permissionListener.onConfirm((e) => {
					this.isPermissionAlertShow = true
				});
				this.permissionListener.onComplete((e) => {
					this.isPermissionAlertShow = false
				});
			},
			requestPermission() {
				plus.android.requestPermissions(["android.permission.READ_CALENDAR"], (e) => {

				}, (e) => {

				})
			}
		}
	}
</script>

<style>
	.permission-alert {
		width: 650rpx;
		height: 200rpx;
		margin: 20rpx 40rpx;
		position: absolute;
		top: 0px;
		z-index: 3;
		border-radius: 5px;
		transition-property: transform;
		transition-duration: 200ms;
		background-color: white;
		padding: 10rpx;
	}
</style>
```

Example 4 (vue):
```vue
<template>
	<view>
		<view class="permission-alert" id="permission-alert" :style="{'transform':isPermissionAlertShow ? 'translateY(0)':'translateY(-250rpx)'}">
			<text style="font-size: 20px;margin-bottom: 10px;margin-top: 5px; display: block;">手机状态权限申请说明：</text>
			<text style="color: darkgray;">uni-app正在申请手机状态权限，允许或拒绝均不会获取任何隐私信息。</text>
		</view>
		<button @click="requestPermission">点击申请日历权限</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isPermissionAlertShow: false,
				//permissionListener: null
			}
		},
		onReady() {
			this.watchPermission()
		},
		onUnload() {
			if (this.permissionListener) {
				this.permissionListener.stop()
			}
		},
		methods: {
			watchPermission() {
				this.permissionListener = uni.createRequestPermissionListener();
				this.permissionListener.onConfirm((e) => {
					this.isPermissionAlertShow = true
				});
				this.permissionListener.onComplete((e) => {
					this.isPermissionAlertShow = false
				});
			},
			requestPermission() {
				plus.android.requestPermissions(["android.permission.READ_CALENDAR"], (e) => {

				}, (e) => {

				})
			}
		}
	}
</script>

<style>
	.permission-alert {
		width: 650rpx;
		height: 200rpx;
		margin: 20rpx 40rpx;
		position: absolute;
		top: 0px;
		z-index: 3;
		border-radius: 5px;
		transition-property: transform;
		transition-duration: 200ms;
		background-color: white;
		padding: 10rpx;
	}
</style>
```

---

## uni.getProvider(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/provider.html

**Contents:**
- # uni.getProvider(OBJECT)
  - # getProvider 兼容性
      - 本页导读

在App平台，可用的服务商，是打包环境中配置的服务商，与手机端是否安装了该服务商的App没有关系。

云打包在manifest中配置相关模块和SDK信息，离线打包在原生工程中配置。某个服务商配置被打包进去，运行时就能得到相应的服务供应商。

provider 在不同服务类型下可能的取值说明

providers 在不同服务类型下可能的取值说明

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 4.77
```

Example 2 (javascript):
```javascript
uni.getProvider({
	service: 'oauth',
	success: function (res) {
		console.log(res.provider)
		if (~res.provider.indexOf('qq')) {
			uni.login({
				provider: 'qq',
				success: function (loginRes) {
					console.log(JSON.stringify(loginRes));
				}
			});
		}
	}
});
```

Example 3 (javascript):
```javascript
uni.getProvider({
	service: 'oauth',
	success: function (res) {
		console.log(res.provider)
		if (~res.provider.indexOf('qq')) {
			uni.login({
				provider: 'qq',
				success: function (loginRes) {
					console.log(JSON.stringify(loginRes));
				}
			});
		}
	}
});
```

Example 4 (javascript):
```javascript
uni.getProvider({
	service: 'oauth',
	success: function (res) {
		console.log(res.provider)
		if (~res.provider.indexOf('qq')) {
			uni.login({
				provider: 'qq',
				success: function (loginRes) {
					console.log(JSON.stringify(loginRes));
				}
			});
		}
	}
});
```

---

## uni.authorize(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/authorize

**Contents:**
- # uni.authorize(OBJECT)
    - # scope 列表
      - 本页导读

提前向用户发起授权请求。调用后会立刻弹窗询问用户是否同意授权小程序使用某项功能或获取用户的某些数据，但不会实际调用对应接口。如果用户之前已经同意授权，则不会出现弹窗，直接返回成功。如果用户之前拒绝了授权，此接口会直接进入失败回调，一般搭配uni.getSetting和uni.openSetting使用。

注意：App平台的授权判断方式，另见：https://ext.dcloud.net.cn/plugin?id=594

注意：scope.userLocation 权限需要在 manifest.json 配置 permission， 详见：https://uniapp.dcloud.io/collocation/manifest

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.getSetting
```

Example 2 (unknown):
```unknown
uni.openSetting
```

Example 3 (javascript):
```javascript
uni.authorize({
    scope: 'scope.userLocation',
    success() {
        uni.getLocation()
    }
})
```

Example 4 (javascript):
```javascript
uni.authorize({
    scope: 'scope.userLocation',
    success() {
        uni.getLocation()
    }
})
```

---

## picker | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/picker.html

**Contents:**
- # picker
    - # 普通选择器
    - # 多列选择器
    - # 时间选择器
    - # 日期选择器
    - # 省市区选择器
      - 本页导读

从底部弹起的滚动选择器。支持五种选择器，通过mode来区分，分别是普通选择器，多列选择器，时间选择器，日期选择器，省市区选择器，默认是普通选择器。

支付宝小程序 picker 组件不支持多列选择，可以使用 picker-view 组件替代。

日期选择默认在App端和H5端（PC版Chrome以及PC版FireFox）调用的是os的原生日期选择控件，在不同平台有不同的ui表现，当配置fields参数后使用统一的展示方式。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例代码说明：以上示例代码从hello uni-app示例中复制，涉及的css样式在hello uni-app的app.vue和uni.css中

预览H5效果：使用浏览器的手机模式访问https://hellouniapp.dcloud.net.cn/pages/component/picker/picker

**Examples:**

Example 1 (unknown):
```unknown
mode = selector
```

Example 2 (unknown):
```unknown
Array＜Object＞
```

Example 3 (unknown):
```unknown
mode = multiSelector
```

Example 4 (unknown):
```unknown
this.value[0] = 0
```

---

## App Android@android | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/manifest-app.html

**Contents:**
  - # App Android
    - # enableResourceOptimizations
    - # aaptOptions
    - # buildFeatures
    - # enableOAID
  - # App iOS
    - # privacyRegisterMode
  - # App Harmony
  - # 完整 manifest.json
      - 本页导读

App-Android平台云端打包相关配置

HBuilderX4.33版本新增 enableResourceOptimizations 配置项

Android平台云端打包时配置是否开启Android原生res资源文件优化，开启后res资源文件名称会被混淆。

注意 HBuilder4.25及以上版本云端打包环境升级为Gradle 8.5，enableResourceOptimizations默认值为true，即开启原生res资源文件混淆 HBuilder4.25以下版本云端打包环境为Gradle 7.6.3，enableResourceOptimizations默认值为false，即关闭原生res资源文件混淆

Android平台云端打包时build.gradle的aaptOptions配置项，支持的属性参考：Android官方文档 ，如下示例源码：

示例源码如下，请查看 pre > code 标签中的内容

Android平台云端打包时build.gradle的buildFeatures配置项，支持的属性参考：Android官方文档 ，如下示例源码：

示例源码如下，请查看 pre > code 标签中的内容

获取OAID 需要使用移动智能设备标识公共服务平台 提供的统一SDK（以下简称OAID SDK），OAID SDK从1.0.26版本开始添加了授权证书校验机制（绑定应用包名），要求开发者通过邮件向“移动智能设备标识公共服务平台”申请授权证书并配置到App中。HBuilderX中暂未支持设置此授权证书，而是使用无需授权证书的1.0.13版本OAID SDK。 1.0.13版本OAID SDK在部分手机设备可能存在以下兼容性问题：

如果碰到以上问题在manifest.json的android节点下添加enableOAID字段设置云端打包不使用默认OAID SDK：

示例源码如下，请查看 pre > code 标签中的内容

为了统计应用的崩溃信息，应用在启动时需要获取IDFA/IDFV，虽然不影响苹果审核但是可能被部分合规检测机构判定为不合规。 需要通过隐私合规检测的应用可以将字段配置为manual，并且在用户点击同意隐私政策的方法里执行plus.runtime.argeePrivacy()，详情参考如何配置在用户同意隐私政策后使用IDFA。

在鸿蒙开发中不会读取app-plus 下配置的选项，在 app-harmony 节点下可以设置鸿蒙参数。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

Example 2 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

Example 3 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

Example 4 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

---

## uni.requestPayment(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/payment

**Contents:**
- # uni.requestPayment(OBJECT)
  - # requestPayment 兼容性
  - # 注意事项
  - # orderInfo 注意事项
- # H5 平台
- # App平台支付流程
  - # manifest.json里配置相关参数
- # App支付
  - # 示例
- # 支付宝App支付

uni.requestPayment是一个统一各平台的客户端支付API，不管是在某家小程序还是在App中，客户端均使用本API调用支付。

本API运行在各端时，会自动转换为各端的原生支付调用API。

注意支付不仅仅需要客户端的开发，还需要服务端开发。虽然客户端API统一了，但各平台的支付申请开通、配置回填仍然需要看各个平台本身的支付文档。

比如微信有App支付、小程序支付、H5支付等不同的申请入口和使用流程，对应到uni-app，在App端要申请微信的App支付，而小程序端则申请微信的小程序支付。

如果服务端使用uniCloud ，那么官方提供了uniPay 云端统一支付服务，把App、微信小程序、支付宝小程序里的服务端支付开发进行了统一的封装。

前端统一的uni.requestPayment和云端统一的uniPay搭配，可以极大提升支付业务的开发效率，强烈推荐给开发者使用。uniPay的文档另见：https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-app.html

流程：支付平台功能申请 -> manifest.json 里配置支付参数 -> uni-app 里调用 API 进行支付

示例源码如下，请查看 pre > code 标签中的内容

如果手机端未安装支付宝，调用时会启动支付宝的wap页面登录，如果已安装相应客户端，会启动其客户端登录。

注意微信的App支付、小程序支付、H5支付是不同的体系。微信小程序支付在 微信商户平台 申请支付时，选择公众号支付；普通浏览器里也可以调起微信进行支付，这个在微信叫做H5支付，此功能未开放给普通开发者，需向微信单独申请，详见

示例源码如下，请查看 pre > code 标签中的内容

获取支付通道 (uni.getProvider)

通过支付通道获取产品列表 (iapChannel.requestProduct)

检查是否存在未关闭的订单 (iapChannel.restoreCompletedTransactions, 可选在合适的时机检查)

请求支付，传递产品信息 (uni.requestPayment)

客户端接收苹果返回的支付票据发送到服务器，在服务器请求苹果服务器验证支付是否有效

服务器验证票据有效后在客户端关闭订单 (iapChannel.finishTransaction)

HBuilder 3.5.1 之前因自动关闭订单导致某些情况下丢单的问题

HBuilder 3.5.1 + 增加了手动关闭订单参数 manualFinishTransaction, 在合适的时机调用 iapChannel.finishTransaction 关闭订单

HBuilder 3.5.1+ 开始支持通过 uni.getProvider 获取IAP支付通道的方法

示例源码如下，请查看 pre > code 标签中的内容

iapChannel.requestProduct(<Function> success, <Function> fail)

success 回调值类型 Array<Product>

iapChannel.restoreCompletedTransactions(<Function> success, <Function> fail)

success 回调值类型 Array<Transaction>

iapChannel.finishTransaction(Transaction, <Function> success, <Function> fail)

所有 fail 回调格式为 { errCode: xxx, errMsg: '' }

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

鸿蒙应用、鸿蒙元服务使用华为支付可参考 华为支付接入方式

示例源码如下，请查看 pre > code 标签中的内容

Q：如何使用ping++等聚合支付 A：uni-app的js API 已经完成跨端统一，客户端无需使用三方聚合支付。如果服务器选择uniCloud，也无需三方聚合支付。如果服务端使用php、java等传统服务器开发，可以在服务端使用三方聚合支付。

Q：App端如何使用其他支付，比如银联、PayPal。 A：App 3.4+ 已支持 PayPal，App 3.4 以前的版本使用下面的方案

Q：Appstore审核报PGPay SDK不允许上架的问题 A：数字类产品（比如购买会员等不需要配送实物的商品），Apple规定必须使用苹果IAP应用内支付，给Apple分成30%。打包的时候不要勾选微信或支付宝等其他支付方式。如果你提交的包里包含了微信支付宝等支付的sdk，即使没使用，Appstore也会认为你有隐藏方式，以后会绕过IAP，不给Apple分成，因此拒绝你的App上线。云打包时，manifest里选上支付模块，但sdk配置里去掉微信支付和支付宝支付。很多开发者的Android版是包含微信和支付宝支付的，此时注意分开判断。详见https://ask.dcloud.net.cn/article/36447

**Examples:**

Example 1 (unknown):
```unknown
uni.requestPayment
```

Example 2 (unknown):
```unknown
JSON.stringify(orderInfo)
```

Example 3 (css):
```css
{productid: 'productid'}
```

Example 4 (unknown):
```unknown
manifest.json
```

---

## package.json | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/package

**Contents:**
- # package.json
- # uni-app 属性
  - # 用法
  - # 示例：钉钉小程序
  - # 示例：微信服务号
      - 本页导读

uni-app 通过在package.json文件中增加uni-app扩展节点，可实现自定义条件编译平台。

注意只能扩展 web 和小程序平台，不能扩展 app 打包。并且扩展小程序平台时只能基于指定的基准平台扩展子平台，不能扩展基准平台。基准平台详见下文。

示例源码如下，请查看 pre > code 标签中的内容

如下是一个自定义钉钉小程序（MP-DINGTALK）的 package.json 示例配置（拷贝代码记得去掉注释）：

示例源码如下，请查看 pre > code 标签中的内容

开发者可在代码中使用MP-DINGTALK进行条件编译，如下：

示例源码如下，请查看 pre > code 标签中的内容

vue-cli开发者可通过如下命令，启动钉钉小程序平台的编译：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX会根据package.json的扩展配置，在运行、发行菜单下，生成自定义菜单（钉钉小程序），开发者点击对应菜单编译运行即可，如下图：

Tips：钉钉小程序编译目录依然是mp-alipay，需通过支付宝开发者工具，选择“钉钉小程序”，然后打开该目录进行预览及发布。

如下是一个自定义微信服务号平台（H5-WEIXIN）的示例配置：

示例源码如下，请查看 pre > code 标签中的内容

开发者可在代码块中使用H5-WEIXIN变量，如下：

示例源码如下，请查看 pre > code 标签中的内容

vue-cli开发者可通过如下命令，启动微信服务号平台（H5-WEIXIN）平台的编译：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX会根据package.json的扩展配置，在运行、发行菜单下，生成自定义菜单（微信服务号），开发者点击对应菜单编译运行即可，如下图：

**Examples:**

Example 1 (unknown):
```unknown
package.json
```

Example 2 (json):
```json
{
  /**
   * package.json其它原有配置
   * 拷贝代码后请去掉注释！
   */
  "uni-app": {
    // 扩展配置
    "scripts": {
      "custom-platform": {
        //自定义编译平台配置，可通过cli方式调用
        "title": "自定义扩展名称", // 在HBuilderX中会显示在 运行/发行 菜单中
        "browser": "", //运行到的目标浏览器，仅当UNI_PLATFORM为h5时有效
        "env": {
          //环境变量
          "UNI_PLATFORM": "", //基准平台
          "MY_TEST": "" // ... 其他自定义环境变量
        },
        "define": {
          //自定义条件编译
          "CUSTOM-CONST": true //自定义条件编译常量，建议为大写
        }
      }
    }
  }
}
```

Example 3 (json):
```json
{
  /**
   * package.json其它原有配置
   * 拷贝代码后请去掉注释！
   */
  "uni-app": {
    // 扩展配置
    "scripts": {
      "custom-platform": {
        //自定义编译平台配置，可通过cli方式调用
        "title": "自定义扩展名称", // 在HBuilderX中会显示在 运行/发行 菜单中
        "browser": "", //运行到的目标浏览器，仅当UNI_PLATFORM为h5时有效
        "env": {
          //环境变量
          "UNI_PLATFORM": "", //基准平台
          "MY_TEST": "" // ... 其他自定义环境变量
        },
        "define": {
          //自定义条件编译
          "CUSTOM-CONST": true //自定义条件编译常量，建议为大写
        }
      }
    }
  }
}
```

Example 4 (json):
```json
{
  /**
   * package.json其它原有配置
   * 拷贝代码后请去掉注释！
   */
  "uni-app": {
    // 扩展配置
    "scripts": {
      "custom-platform": {
        //自定义编译平台配置，可通过cli方式调用
        "title": "自定义扩展名称", // 在HBuilderX中会显示在 运行/发行 菜单中
        "browser": "", //运行到的目标浏览器，仅当UNI_PLATFORM为h5时有效
        "env": {
          //环境变量
          "UNI_PLATFORM": "", //基准平台
          "MY_TEST": "" // ... 其他自定义环境变量
        },
        "define": {
          //自定义条件编译
          "CUSTOM-CONST": true //自定义条件编译常量，建议为大写
        }
      }
    }
  }
}
```

---

## 厂商推送应用创建配置流程 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/unipush_vendor_config.html

**Contents:**
- # 厂商推送应用创建配置流程
- # 华为
  - # 1. 创建应用
  - # 2. 推送配置
- # 荣耀
  - # 1. 创建应用
  - # 2. 推送配置
- # 小米
  - # 1. 创建应用
  - # 2. 推送配置

注意：华为、荣耀、vivo、魅族渠道，必须参考此文档配置回执，才能统计到这些渠道完整的到达、折损数据。

华为开发者后台包含安卓推送配置、鸿蒙推送配置，后台配置方法相似，这里做合并说明。

在 “项目设置 > 增长” 中选择“推送服务”，点击“立即开通”，以此来开启华为侧推送服务状态。

在 “项目设置 > 常规” 中填写“ SHA256证书指纹 ”，点击右侧对勾进行保存；若不知道具体值，请参考 SHA256指纹证书获取 。

下载agconnect-services.json文件备用。如下

在 “项目设置 > 推送服务> 配置”中开通项目回执状态，配置个推侧的回调地址以及HTTPS证书。如下

示例源码如下，请查看 pre > code 标签中的内容

证书指纹用于校验应用的真实性。如使用荣耀开放服务能力等，必须配置证书指纹。使用以下命令获取指纹： Keytool-list-v-keystore mystore.keystore

示例源码如下，请查看 pre > code 标签中的内容

勾选我同意接受小米推送的接入合作协议复选框，点击启用按钮：

填写应用名称和应用包名以及上传应用图标创建应用

查看应用信息，获取OPPO App ID、OPPO App Key、OPPO App Secret、OPPO Master Secret

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

消息推送支持集成 Firebase 云信息传递（Firebase Cloud Messaging，简称 FCM）通道，以满足 App 在海外安卓设备上的使用推送的需求，该服务由 Google 拥有的 Firebase 公司提供。若app需要上架海外应用市场，建议您使用 Google Play专版 客户端 SDK 。

**Examples:**

Example 1 (yaml):
```yaml
https://thirdrcp-hz.getui.com/hw
```

Example 2 (yaml):
```yaml
https://thirdrcp-hz.getui.com/hw
```

Example 3 (yaml):
```yaml
https://thirdrcp-hz.getui.com/hw
```

Example 4 (yaml):
```yaml
https://thirdrcp-hz.getui.com/hw
```

---

## pages.json 页面路由 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/pages

**Contents:**
- # pages.json 页面路由
- # 配置项列表
- # globalStyle
- # topWindow
    - # matchMedia
- # leftWindow
- # rightWindow
- # pages
- # style
  - # 自定义导航栏使用注意

pages.json 文件用来对 uni-app 进行全局配置，决定页面文件的路径、窗口样式、原生的导航栏、底部的原生 tabbar 等。

导航栏高度为 44px (不含状态栏)，tabBar 高度为 50px (不含安全区)。

它类似微信小程序中app.json的页面管理部分。注意定位权限申请等原属于app.json的内容，在 uni-app 中是在 manifest 中配置。

以下是一个包含了所有配置选项的 pages.json ：

示例源码如下，请查看 pre > code 标签中的内容

用于设置应用的状态栏、导航条、标题、窗口背景色等。

uni-app 2.9+ 新增 leftWindow, topWindow, rightWindow 配置。用于解决宽屏适配问题。

以现有的手机应用为 mainWindow，在左、上、右，可以追加新的页面显示窗体。

整体的宽屏适配思路，参考单独的宽屏适配指南

目前 style 节点仅支持配置 width，height 等 css 样式相关属性

如果需求当存在 topwindow 时，自动隐藏页面的 navigationBar，根据需求不同在App.vue中配置如下 css：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过 matchMedia 的调节，可以自适应在不同屏幕上显示指定的 window。

示例源码如下，请查看 pre > code 标签中的内容

案例演示：HBuilderX 2.9.9+，新建项目选择 hello uni-app 或新闻模板，或直接浏览：https://hellouniapp.dcloud.net.cn/

窗口通信参考：https://uniapp.dcloud.net.cn/api/window/communication

uni-app 通过 pages 节点配置应用由哪些页面组成，pages 节点接收一个数组，数组每个项都是一个对象，其属性值如下：

示例源码如下，请查看 pre > code 标签中的内容

用于设置每个页面的状态栏、导航条、标题、窗口背景色等。

页面中配置项会覆盖 globalStyle 中相同的配置项

示例源码如下，请查看 pre > code 标签中的内容

当 navigationStyle 设为 custom 或 titleNView 设为 false 时，原生导航栏不显示，此时要注意几个问题：

示例源码如下，请查看 pre > code 标签中的内容

鉴于以上问题，在原生导航能解决业务需求的情况下，尽量使用原生导航。甚至有时需要牺牲一些不是很重要的需求。在 App 和 H5 下，uni-app 提供了灵活的处理方案：titleNView、subNVue、或整页使用 nvue。但在小程序下，因为其自身的限制，没有太好的方案。有必要的话，也可以用条件编译分端处理。

配置编译到 App（安卓、iOS） 平台时的特定样式，部分常用配置 H5 平台也支持。以下仅列出常用，更多配置项参考 WebviewStyles 。

当 autoBackButton 设置为 true 时生效。 通过此属性可自定义返回按钮样式，如图标大小、红点、角标、标题等。

使用 type 值设置按钮的样式时，会忽略 fontSrc 和 text 属性。

searchInput 可以在 titleNView 的原生导航栏上放置搜索框。其宽度根据周围元素自适应。

searchInput 的点击输入框 onNavigationBarSearchInputClicked、文本变化 onNavigationBarSearchInputChanged、点击搜索按钮 onNavigationBarSearchInputConfirmed 等生命周期，见文档页面生命周期。

以下列出部分配置。关于全面的导航栏配置，这里有一个完善的演示工程，演示了导航栏的各种效果，详见：https://ext.dcloud.net.cn/plugin?id=1765

示例源码如下，请查看 pre > code 标签中的内容

subNVues 是 vue 页面的原生子窗体。用于解决 App 中 vue 页面中的层级覆盖和原生界面灵活自定义用的。

它不是全屏页面，也不是组件，就是一个原生子窗体。它是一个 nvue 页面，使用 weex 引擎渲染，提供了比 cover-view、plus.nativeObj.view 更强大的原生排版能力，方便自定义原生导航或覆盖原生地图、视频等。请详读subNVues 开发指南

subNVue 也可以在 nvue 页面中使用。但目前在纯 nvue 下（render 为 native）还不支持。

示例源码如下，请查看 pre > code 标签中的内容

在 App 平台下可以自定义部分下拉刷新的配置 page->style->app-plus->pullToRefresh。

示例源码如下，请查看 pre > code 标签中的内容

配置编译到 app-harmony 平台时的特定样式。

使用 type 值设置按钮的样式时，会忽略 fontSrc 和 text 属性。

h5 平台下拉刷新动画，只有 circle 类型。

配置编译到 MP-ALIPAY 平台时的特定样式

配置编译到 MP-WEIXIN 平台时的特定样式

配置编译到 MP-BAIDU 平台时的特定样式

HBuilderX 2.5.5起支持easycom组件模式。

传统 vue 组件，需要安装、引用、注册，三个步骤后才能使用组件。easycom将其精简为一步。

只要组件路径符合规范（具体见下），就可以不用引用、注册，直接在页面中使用。如下：

示例源码如下，请查看 pre > code 标签中的内容

不管 components 目录下安装了多少组件，easycom打包会自动剔除没有使用的组件，对组件库的使用尤为友好。

组件库批量安装，随意使用，自动按需打包。以官方的uni-ui为例，在 HBuilderX 新建项目界面选择uni-ui项目模板，只需在页面中敲 u，拉出大量组件代码块，直接选择，即可使用。大幅提升开发效率，降低使用门槛。

在uni-app 插件市场 下载符合components/组件名称/组件名称.vue目录结构的组件，均可直接使用。

easycom是自动开启的，不需要手动开启，有需求时可以在pages.json的easycom节点进行个性化设置，如关闭自动扫描，或自定义扫描匹配组件的策略。设置参数如下：

如果你的组件，不符合 easycom 前述的路径规范。可以在 pages.json 的 easycom 节点中自行定义路径规范。

如果需要匹配 node_modules 内的 vue 文件，需要使用packageName/path/to/vue-file-$1.vue形式的匹配规则，其中packageName为安装的包名，/path/to/vue-file-$1.vue为 vue 文件在包内的路径。

示例源码如下，请查看 pre > code 标签中的内容

如果应用是一个多 tab 应用，可以通过 tabBar 配置项指定一级导航栏，以及 tab 切换时显示的对应页。

在 pages.json 中提供 tabBar 配置，不仅仅是为了方便快速开发导航，更重要的是在 App 和小程序端提升性能。在这两个平台，底层原生引擎在启动时无需等待 js 引擎初始化，即可直接读取 pages.json 中配置的 tabBar 信息，渲染原生 tab。

其中 list 接收一个数组，数组中的每个项都是一个对象，其属性值如下：

midButton 没有 pagePath，需监听点击事件，自行处理点击后的行为逻辑。监听点击事件为调用 API：uni.onTabBarMidButtonTap，详见https://uniapp.dcloud.io/api/ui/tabbar?id=ontabbarmidbuttontap

tabbar 的 js api 见接口-界面-tabbar ，可实现动态显示隐藏（如弹出层无法覆盖 tabbar）、内容修改（如国际化）、item 加角标等功能。hello uni-app 中也有示例。

tabbar 的 item 点击事件见页面生命周期的 onTabItemTap 。

代码跳转到 tabbar 页面，api 只能使用uni.switchTab ，不能使用 uni.navigateTo、uni.redirectTo；使用 navigator 组件跳转时必须设置open-type="switchTab"

tabbar 的默认高度，在不同平台不一样。App 端的默认高度在 HBuilderX 2.3.4 起从 56px 调整为 50px，与 H5 端统一。开发者也可以自行设定高度，调回 56px。详见

tabbar 在 H5 端是 div 模拟的，属于前端屏幕窗口的一部分，如果要使用 bottom 居底定位方式，应该使用 css 变量--window-bottom，比如悬浮在 tabbar 上方 10px 的按钮，样式如下bottom: calc(var(--window-bottom) + 10px)

中间带+号的 tabbar 模板例子，参考 。可跨端，但+号不凸起。如需中间凸起，配置 tabbar 的 midButton。

如果是需要先登录、后进入 tab 页面，不需要把登录页设为首页，首页仍然是 tabbar 页，可参考云端一体登录模板

前端弹出遮罩层挡不住 tabbar 的问题，跨端处理方式时动态隐藏 tabbar。App 端可以使用 plus.nativeObj.view 或 subNVue 做弹出和遮罩，可参考这个底部原生图标分享菜单例子

微信小程序模拟器 1.02.1904090 版有 bug，在缩放模拟器页面百分比后，tabbar 点击多次后就会卡死。真机无碍，使用时注意。详见

PC 宽屏上，当页面存在 topWindow 或 leftWindow 或 rightWindow 等多窗体结构时，若想改变 tabbar 显示的位置，请使用 custom-tab-bar 组件 配置，若想隐藏 tabbar，可以使用如下 css（好处是可以和 leftwindow 等窗体联动）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

原生 tabBar 是相对固定的配置方式，可能无法满足所有场景，这就涉及到自定义 tabBar。

但注意除了 H5 端，自定义 tabBar 的性能体验会低于原生 tabBar。App 和小程序端非必要不要自定义。

启动模式配置，仅开发期间生效，用于模拟直达页面的场景，如：小程序转发后，用户点击所打开的页面。

示例源码如下，请查看 pre > code 标签中的内容

分包加载配置，此配置为小程序的分包加载机制。

因小程序有体积和资源加载限制，各家小程序平台提供了分包方式，优化小程序的下载和启动速度。

所谓的主包，即放置默认启动页面/TabBar 页面，以及一些所有分包都需用到公共资源/JS 脚本；而分包则是根据 pages.json 的配置进行划分。

在小程序启动时，默认会下载主包并启动主包内页面，当用户进入分包内某个页面时，会把对应分包自动下载下来，下载完成后再进行展示。此时终端界面会有等待提示。

App 默认为整包。从 uni-app 2.7.12+ 开始，vue2 模式也兼容了小程序的分包配置。其目的不用于下载提速，而用于首页是 vue 时的启动提速。App 下开启分包，除在 pages.json 中配置分包规则外，还需要在 manifest 中设置在 app 端开启分包设置，详见：https://uniapp.dcloud.io/collocation/manifest?id=app-vue-optimization

subPackages 节点接收一个数组，数组每一项都是应用的子包，其属性值如下：

假设支持分包的 uni-app 目录结构如下：

示例源码如下，请查看 pre > code 标签中的内容

配置 preloadRule 后，在进入小程序某个页面时，由框架自动预下载可能需要的分包，提升进入后续分包页面时的启动速度

preloadRule 中，key 是页面路径，value 是进入此页面的预下载配置，每个配置有以下几项：

app 的分包，同样支持 preloadRule，但网络规则无效。

**Examples:**

Example 1 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

Example 2 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

Example 3 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

Example 4 (json):
```json
{
  "pages": [
    {
      "path": "pages/component/index",
      "style": {
        "navigationBarTitleText": "组件"
      }
    },
    {
      "path": "pages/API/index",
      "style": {
        "navigationBarTitleText": "接口"
      }
    },
    {
      "path": "pages/component/view/index",
      "style": {
        "navigationBarTitleText": "view"
      }
    }
  ],
  "condition": {
    //模式配置，仅开发期间生效
    "current": 0, //当前激活的模式（list 的索引项）
    "list": [
      {
        "name": "test", //模式名称
        "path": "pages/component/view/index" //启动页面，必选
      }
    ]
  },
  "globalStyle": {
    "navigationBarTextStyle": "black",
    "navigationBarTitleText": "演示",
    "navigationBarBackgroundColor": "#F8F8F8",
    "backgroundColor": "#F8F8F8",
    "usingComponents": {
      "collapse-tree-item": "/components/collapse-tree-item"
    },
    "renderingMode": "seperated", // 仅微信小程序，webrtc 无法正常时尝试强制关闭同层渲染
    "pageOrientation": "portrait", //横屏配置，全局屏幕旋转设置(仅 APP/微信/QQ小程序)，支持 auto / portrait / landscape
    "rpxCalcMaxDeviceWidth": 960,
    "rpxCalcBaseDeviceWidth": 375,
    "rpxCalcIncludeWidth": 750
  },
  "tabBar": {
    "color": "#7A7E83",
    "selectedColor": "#3cc51f",
    "borderStyle": "black",
    "backgroundColor": "#ffffff",
    "height": "50px",
    "fontSize": "10px",
    "iconWidth": "24px",
    "spacing": "3px",
    "iconfontSrc": "static/iconfont.ttf", // app tabbar 字体.ttf文件路径 app 3.4.4+
    "list": [
      {
        "pagePath": "pages/component/index",
        "iconPath": "static/image/icon_component.png",
        "selectedIconPath": "static/image/icon_component_HL.png",
        "text": "组件",
        "iconfont": {
          // 优先级高于 iconPath，该属性依赖 tabbar 根节点的 iconfontSrc
          "text": "\ue642", // 已实际字体编码为准
          "selectedText": "\ue776",
          "fontSize": "17px",
          "color": "#000000",
          "selectedColor": "#0000ff"
        }
      },
      {
        "pagePath": "pages/API/index",
        "iconPath": "static/image/icon_API.png",
        "selectedIconPath": "static/image/icon_API_HL.png",
        "text": "接口"
      }
    ],
    "midButton": {
      "width": "80px",
      "height": "50px",
      "text": "文字",
      "iconPath": "static/image/midButton_iconPath.png",
      "iconWidth": "24px",
      "backgroundImage": "static/image/midButton_backgroundImage.png"
    }
  },
  "easycom": {
    "autoscan": true, //是否自动扫描组件
    "custom": {
      //自定义扫描规则
      "^uni-(.*)": "@/components/uni-$1.vue"
    }
  },
  "topWindow": {
    "path": "responsive/top-window.vue",
    "style": {
      "height": "44px"
    }
  },
  "leftWindow": {
    "path": "responsive/left-window.vue",
    "style": {
      "width": "300px"
    }
  },
  "rightWindow": {
    "path": "responsive/right-window.vue",
    "style": {
      "width": "300px"
    },
    "matchMedia": {
      "minWidth": 768
    }
  }
}
```

---

## uni.getRecorderManager() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/record-manager

**Contents:**
- # uni.getRecorderManager()
  - # getRecorderManager 兼容性
- # start(options)
- # onStop(callback)
- # onFrameRecorded(callback)
- # onError(callback)
- # 示例
      - 本页导读

获取全局唯一的录音管理器 recorderManager。

recorderManager 对象的方法列表

鸿蒙平台音频参数可使用的封装格式、采样率可参考 鸿蒙文档 音频参数配置对照表

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
recorderManager
```

Example 2 (unknown):
```unknown
Android、iOS、微信小程序
```

Example 3 (unknown):
```unknown
HarmonyOS Next
```

Example 4 (unknown):
```unknown
ohos.permission.MICROPHONE
```

---

## FAQ | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/faq.html

**Contents:**
- # FAQ
- # App平台常见问题
- # web/H5平台常见问题
      - 本页导读

uni-app 中可使用的 UI 框架：https://ask.dcloud.net.cn/article/35489

uni-app 导航栏开发指南： https://ask.dcloud.net.cn/article/34921

uni-app 实现全局变量： https://ask.dcloud.net.cn/article/35021

uni-app 引用 npm 第三方库： https://ask.dcloud.net.cn/article/19727

uni-app 中使用微信小程序第三方 SDK 及资源汇总：https://ask.dcloud.net.cn/article/35070

uni-app/uni-app-x 小程序项目配置 占位组件(componentPlaceholder)：https://ask.dcloud.net.cn/article/42114

原生控件层级过高无法覆盖的解决方案：https://uniapp.dcloud.io/component/native-component

国际化/多语言/i18n方案：https://ask.dcloud.net.cn/article/35872

本地存储详解：https://ask.dcloud.net.cn/article/166

uni-app 各环节（HBuilderX、cli、自定义基座、本地sdk、云打包引擎）版本兼容性说明：https://ask.dcloud.net.cn/article/35845

uni-app App平台如何进行整包升级检测： 参考App升级中心 uni-upgrade-center

uni-app App平台如何进行资源热更新： 参考App升级中心 uni-upgrade-center

App全面屏、安全区、刘海屏适配：https://ask.dcloud.net.cn/article/35564

App权限状态判断及引导：https://ext.dcloud.net.cn/plugin?id=594

Android平台上架要求的隐私政策提示配置方法：https://uniapp.dcloud.net.cn/tutorial/app-privacy-android

Android平台应用启动时读写手机存储、访问设备信息(如IMEI)等权限策略及提示信息：https://ask.dcloud.net.cn/article/36549

App打包前端代码进行加密：https://ask.dcloud.net.cn/article/36437

Android App字体跟随Rom默认字体/系统字体详见

uni-app 中使用 5+ 的原生界面控件（包括map、video、livepusher、barcode、nview）：https://ask.dcloud.net.cn/article/35036

App分享到微信时分享为小程序：使用plus.share，设置分享类型为miniProgram 。注意uni-app不需要plus ready，将plus ready里的代码写到页面的onLoad生命周期即可

App启动微信小程序：使用plus.share的launchMiniProgram 。注意uni-app不需要plus ready，将plus ready里的代码写到页面的onLoad生命周期即可

App初期启动的引导轮播： 因为是App专用，为了更好的性能，推荐使用nvue制作。参考插件市场已经封装的插件https://ext.dcloud.net.cn/plugin?id=676

双向https认证： TLS 双向认证 详情

iOS平台适配暗黑模式（DarkMode）：https://ask.dcloud.net.cn/article/36995

原生App和uni-app混合开发： 详见

uni-app 的 H5 版使用注意事项：https://ask.dcloud.net.cn/article/35232

开发微信公众号（H5）JSSDK 的使用方式：https://ask.dcloud.net.cn/article/35380

**Examples:**

Example 1 (unknown):
```unknown
占位组件(componentPlaceholder)
```

---

## uni.connectSocket(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/websocket

**Contents:**
- # uni.connectSocket(OBJECT)
  - # connectSocket 兼容性
  - # 返回值
    - # SocketTask 的方法
    - # send(options: SendSocketMessageOptions): void;
      - # send 兼容性
      - # 参数 HarmonyOS 兼容性
        - # SendSocketMessageFail 的属性值
    - # close(options: CloseSocketOptions): void;
      - # close 兼容性

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。

uni-app 的 socket，分全局 socket 和 socketTask。全局 socket 只能有一个，一旦被占用就无法再开启。所以不推荐使用全局 socket，一般使用 socketTask。

小程序上，socketTask 也有数量限制，具体需要参阅各家小程序文档。

注意：小程序的运行日志回显、uniPush 的小程序版，均基于 socket，都会占用 socketTask 通道数量。运行日志回显是可以关闭的，详见

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 socketTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

send 通过 WebSocket 连接发送数据

close 关闭 WebSocket 连接

onOpen 监听 WebSocket 连接打开事件

onClose 监听 WebSocket 连接关闭事件

onError 监听 WebSocket 错误

onMessage 监听 WebSocket 接受到服务器的消息事件

已废弃，使用 SocketTask 的 onOpen 替换。

示例源码如下，请查看 pre > code 标签中的内容

已废弃，使用 SocketTask 的 onError 替换。

示例源码如下，请查看 pre > code 标签中的内容

通过 WebSocket 连接发送数据，需要先 uni.connectSocket，并在 uni.onSocketOpen 回调之后才能发送。

已废弃，使用 SocketTask 的 send 替换。

示例源码如下，请查看 pre > code 标签中的内容

监听 WebSocket 接受到服务器的消息事件。

已废弃，使用 SocketTask 的 onMessage 替换。

示例源码如下，请查看 pre > code 标签中的内容

已废弃，使用 SocketTask 的 close 替换。

已废弃，使用 SocketTask 的 onClose 替换。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

Example 2 (javascript):
```javascript
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

Example 3 (javascript):
```javascript
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

Example 4 (css):
```css
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

---

## uni.login(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/login.html

**Contents:**
- # uni.login(OBJECT)
  - # login 兼容性
  - # App平台支持的登录方式
  - # 小程序平台支持的登录方式
  - # web平台支持的登录方式
  - # OBJECT 参数说明
  - # 注意事项
- # uni.getLoginCode(OBJECT)
- # uni.checkSession
- # uni.getUserInfo(OBJECT)

uni.login是一个客户端API，统一封装了各个平台的各种常见的登录方式，包括App手机号一键登陆、三方登录（微信、微博、QQ、Apple、google、facebook）、各家小程序内置登录。

除了前端API，DCloud还提供了uni-id ，这是一个云端一体的、完整的、账户开源框架。不仅包括客户端API，还包括前端页面、服务器代码、管理后台等所有与登录账户有关的服务，包括短信验证码、密码加密存储、忘记密码、头像更新等所有常见账户相关功能。

大多数登录方式，都需要申请开通相关服务，具体点击下面的文档查看。

Web平台常见的登录包括用户名密码、短信验证码、pc端微信扫描、微信公众号登录。这些没有封装在 uni.login API中，但都封装在了uni-id中。请另行参考uni-id

如不使用uni-id，微信内嵌浏览器运行H5版时，可通过js sdk实现微信登录，需要引入一个单独的js，详见

微信登录在未配置onlyAuthorize的情况下，调用uni.login接口用户登录凭证(code)不返回，用以换取登录信息(authResult)；需要在项目manifest.json中配置的appsecret，此参数云端打包后会保存在apk/ipa中，存在参数泄露的风险；HBuilderX3.4.18+ 不再提供此参数的可视化配置。对于安全性要求较低的开发者，可以通过manifest.json -> 源码视图 -> app-plus -> distribute -> sdkConfigs -> oauth -> weixin -> 添加appsecret 配置。

示例源码如下，请查看 pre > code 标签中的内容

获取宿主 App 登录凭证（Authorization Code）

微信小程序端用户头像昵称获取规则已调整，参考 用户信息接口调整说明 、小程序用户头像昵称获取规则调整公告 支付宝小程序获取用户头像昵称规则已调整，将在 2024年09月15日正式生效。参考 关于小程序用户头像昵称获取规则调整公告

注意： 在小程序 withCredentials 为 true 时或是在 App 调用 uni.getUserInfo，要求此前有调用过 uni.login 且登录态尚未过期。微信基础库2.10.4版本对用户信息相关接口进行了调整，使用 uni.getUserInfo 获取得到的 userInfo 为匿名数据，建议使用 uni.getUserProfile 获取用户信息。

除了以上三个必有的信息外，不同服务供应商返回的其它信息会存在差异。

App端还支持更多登录相关API，如logout，详见

App端登录相关的SDK需要在manifest中配置：

如果手机端未安装QQ、微博，调用时会启动这些平台的wap页面登录，如果已安装相应客户端，会启动它们的客户端登录。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序端基础库2.27.1及以上版本，wx.getUserProfile 接口 被收回，详见《小程序用户头像昵称获取规则调整公告》 。

获取用户信息。每次请求都会弹出授权窗口，用户同意后返回 userInfo。

抖音从基础库 2.30.0 开始支持本方法，低版本需做兼容处理。详见

元服务 ASCF 1.0.17 运行时（2025-11-27 ）、用户侧系统要求为鸿蒙6+ 开始支持本接口，点击后自动拉起弹窗授权，用户授权后返回 nickName 和 avatarUrl 参数

注意： 可以使用 if(uni.getUserProfile) 判断uni.getUserProfile是否可用。

按照中国移动、中国联通、中国电信等运营商的要求，一键登录必须有界面。可用此API关闭页面。

获取全局唯一的一键登录管理器 univerifyManager

univerifyManager 方法说明

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 不支持
```

Example 2 (unknown):
```unknown
HarmonyOS 不支持
```

Example 3 (unknown):
```unknown
onlyAuthorize
```

Example 4 (yaml):
```yaml
onlyAuthorize:true
```

---

## map | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/map.html

**Contents:**
- # map
  - # 腾讯地图服务商说明
  - # 高德地图审图号
  - # 腾讯地图审图号
  - # 近期新增功能
  - # 点聚合
  - # App平台地图服务商差异
    - # Map 地图组件
    - # marker
    - # marker 上的气泡 callout

地图组件用于展示地图，而定位API只是获取坐标，请勿混淆两者。

App平台（包含iOS、安卓、鸿蒙）腾讯地图使用web方案，在 申请腾讯位置服务Key 时注意将页面域名白名单设置为空，如下图

出于安全考虑，安卓、iOS端manifest.json内配置的key仅用来展示地图，uni.chooseLocation所依赖的地点搜索、逆地址解析功能需要通过uniCloud云对象uni-map-co 来调用，开发者可以通过安全网络来保障服务端api不被他人盗用，详情参考uni.chooseLocation文档。开发者可以将manifest.json内配置的key的所有api额度设置为0，避免key泄露产生额外的资源消耗。

鸿蒙平台由于暂不支持安全网络，所以chooseLocation依然使用manifest.json内配置的key来调用地点搜索、逆地址解析。

当地图上需要展示的标记点 marker 过多时，可能会导致界面上 marker 出现压盖，展示不全，并导致整体性能变差。针对此类问题，推出点聚合能力。

MapContext.initMarkerCluster 对聚合点进行初始化配置（可选）； MapContext.addMarkers 指定参与聚合的 marker； MapContext.on('markerClusterCreate', callback) 触发时，通过 MapContext.addMarkers 更新聚合簇的样式 （可选）； MapContext.removeMarkers 移除参与聚合的 marker；

指定一系列坐标点，从数组第一项连线至最后一项

polygon 指定一系列坐标点，根据 points 坐标数据生成闭合多边形

地图组件的经纬度必填，如果不填经纬度则默认值是北京的经纬度。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

map 组件相关操作的 JS API：uni.createMapContext

nvue map 更换箭头图标格式参考: https://ask.dcloud.net.cn/article/37901

Q：应用中使用了 <map> 组件，打包为App时，提示缺少权限模块怎么办？

A：App端原生地图，依赖第三方的 SDK，因此打包移动应用时，需要在manifest中勾选相关的权限并填写 key 信息，详见 。

Q：国外应用想使用谷歌地图/google地图怎么办？

A: App 3.4+ 已支持 Google 地图， App 3.4 以下版本使用下面的方案

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过 uni-id-common 内的路线规划API，计算路线、距离、时间

鸿蒙应用可免费使用鸿蒙系统提供的地图服务。开通方式如下：

也可阅读插件文档中提到的 UTS 插件开放文档 、uni-app 中嵌入鸿蒙原生组件 ，参考插件逻辑自行完成能力封装。

**Examples:**

Example 1 (unknown):
```unknown
layer-style
```

Example 2 (vue):
```vue
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map style="width: 100%; height: 300px;" :latitude="latitude" :longitude="longitude" :markers="covers">
				</map>
			</view>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map style="width: 100%; height: 300px;" :latitude="latitude" :longitude="longitude" :markers="covers">
				</map>
			</view>
		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map style="width: 100%; height: 300px;" :latitude="latitude" :longitude="longitude" :markers="covers">
				</map>
			</view>
		</view>
	</view>
</template>
```

---

## navigator | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/navigator.html

**Contents:**
- # navigator
      - 本页导读

该组件类似HTML中的<a>组件，但只能跳转本地页面。目标页面必须在pages.json中注册。

除了组件方式，API方式也可以实现页面跳转，另见：https://uniapp.dcloud.io/api/router?id=navigateto

示例源码如下，请查看 pre > code 标签中的内容

url有长度限制，太长的字符串会传递失败，可使用窗体通信 、全局变量 ，或encodeURIComponent等多种方式解决，如下为encodeURIComponent示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
<navigator>
```

Example 2 (typescript):
```typescript
<navigator>
```

Example 3 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="btn-area">
				<navigator url="navigate/navigate?title=navigate" hover-class="navigator-hover">
					<button type="default">跳转到新页面</button>
				</navigator>
				<navigator url="redirect/redirect?title=redirect" open-type="redirect" hover-class="other-navigator-hover">
					<button type="default">在当前页打开</button>
				</navigator>
				<navigator url="/pages/tabBar/extUI/extUI" open-type="switchTab" hover-class="other-navigator-hover">
					<button type="default">跳转tab页面</button>
				</navigator>
			</view>
		</view>
	</view>
</template>
<script>
// navigate.vue页面接受参数
export default {
	onLoad: function (option) { //option为object类型，会序列化上个页面传递的参数
		console.log(option.id); //打印出上个页面传递的参数。
		console.log(option.name); //打印出上个页面传递的参数。
	}
}
</script>
```

Example 4 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="btn-area">
				<navigator url="navigate/navigate?title=navigate" hover-class="navigator-hover">
					<button type="default">跳转到新页面</button>
				</navigator>
				<navigator url="redirect/redirect?title=redirect" open-type="redirect" hover-class="other-navigator-hover">
					<button type="default">在当前页打开</button>
				</navigator>
				<navigator url="/pages/tabBar/extUI/extUI" open-type="switchTab" hover-class="other-navigator-hover">
					<button type="default">跳转tab页面</button>
				</navigator>
			</view>
		</view>
	</view>
</template>
<script>
// navigate.vue页面接受参数
export default {
	onLoad: function (option) { //option为object类型，会序列化上个页面传递的参数
		console.log(option.id); //打印出上个页面传递的参数。
		console.log(option.name); //打印出上个页面传递的参数。
	}
}
</script>
```

---

## uni.getRecorderManager() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/record-manager.html

**Contents:**
- # uni.getRecorderManager()
  - # getRecorderManager 兼容性
- # start(options)
- # onStop(callback)
- # onFrameRecorded(callback)
- # onError(callback)
- # 示例
      - 本页导读

获取全局唯一的录音管理器 recorderManager。

recorderManager 对象的方法列表

鸿蒙平台音频参数可使用的封装格式、采样率可参考 鸿蒙文档 音频参数配置对照表

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
recorderManager
```

Example 2 (unknown):
```unknown
Android、iOS、微信小程序
```

Example 3 (unknown):
```unknown
HarmonyOS Next
```

Example 4 (unknown):
```unknown
ohos.permission.MICROPHONE
```

---

## uni.connectSocket(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/websocket.html

**Contents:**
- # uni.connectSocket(OBJECT)
  - # connectSocket 兼容性
  - # 返回值
    - # SocketTask 的方法
    - # send(options: SendSocketMessageOptions): void;
      - # send 兼容性
      - # 参数 HarmonyOS 兼容性
        - # SendSocketMessageFail 的属性值
    - # close(options: CloseSocketOptions): void;
      - # close 兼容性

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。

uni-app 的 socket，分全局 socket 和 socketTask。全局 socket 只能有一个，一旦被占用就无法再开启。所以不推荐使用全局 socket，一般使用 socketTask。

小程序上，socketTask 也有数量限制，具体需要参阅各家小程序文档。

注意：小程序的运行日志回显、uniPush 的小程序版，均基于 socket，都会占用 socketTask 通道数量。运行日志回显是可以关闭的，详见

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 socketTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

send 通过 WebSocket 连接发送数据

close 关闭 WebSocket 连接

onOpen 监听 WebSocket 连接打开事件

onClose 监听 WebSocket 连接关闭事件

onError 监听 WebSocket 错误

onMessage 监听 WebSocket 接受到服务器的消息事件

已废弃，使用 SocketTask 的 onOpen 替换。

示例源码如下，请查看 pre > code 标签中的内容

已废弃，使用 SocketTask 的 onError 替换。

示例源码如下，请查看 pre > code 标签中的内容

通过 WebSocket 连接发送数据，需要先 uni.connectSocket，并在 uni.onSocketOpen 回调之后才能发送。

已废弃，使用 SocketTask 的 send 替换。

示例源码如下，请查看 pre > code 标签中的内容

监听 WebSocket 接受到服务器的消息事件。

已废弃，使用 SocketTask 的 onMessage 替换。

示例源码如下，请查看 pre > code 标签中的内容

已废弃，使用 SocketTask 的 close 替换。

已废弃，使用 SocketTask 的 onClose 替换。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

Example 2 (javascript):
```javascript
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

Example 3 (javascript):
```javascript
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

Example 4 (css):
```css
uni.connectSocket({
  url: "wss://www.example.com/socket",
  header: {
    "content-type": "application/json",
  },
  protocols: ["protocol1"],
  method: "GET",
});
```

---

## 原生组件说明 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/native-component.html

**Contents:**
  - # 原生组件说明
  - # 混合渲染模式下原生组件的使用限制
  - # 其他原生界面元素
  - # vue页面层级覆盖解决方案
  - # App的nvue页面层级问题
  - # Android系统主题字体对原生组件渲染的影响
      - 本页导读

小程序和App的vue页面，主体是webview渲染的。为了提升性能，小程序和App的vue页面下部分ui元素，比如导航栏、tabbar、video、map使用了原生控件。这种方式被称为混合渲染。

虽然提升了性能，但原生组件带来了其他问题：

H5、App的nvue页面，不存在混合渲染的情况，它们或者全部是前端渲染、或者全部是原生渲染，不涉及层级问题。

由于原生组件脱离在 WebView 渲染流程外，因此在使用时有以下限制：

可在组件中监听同层失败回调 bindrendererror 来判断

除了原生组件外，uni-app在非H5端还有其他原生界面元素，清单如下：

注意：app的nvue页面里的组件虽然不涉及map、video等原生组件的层级遮挡问题，但pages.json中配置的原生tabbar、原生navigationBar，一样是nvue里的组件也无法遮挡的。

为了解决webview渲染中原生组件层级最高的限制，uni-app提供了 cover-view 和 cover-image 组件，让其覆盖在原生组件上。

除了跨端的cover-view，App端还提供了3种方案：plus.nativeObj.view、subNVue、新开半透明nvue页面。详述如下

cover-view只能覆盖原生组件，不能覆盖其他原生界面元素。比如cover-view可以覆盖video、map，但无法覆盖原生导航栏、tabbar、web-view。

微信小程序在基础库 2.4.0 起已支持 video 组件的同层渲染，2.7.0 起支持 map 组件的同层渲染。可以被前端元素通过调节zindex来遮挡，也支持在scroll-view等组件中内嵌这2个原生组件。但video全屏时，仍需要cover-view覆盖。

app-vue的cover-view相比小程序端还有一些限制，1) 无法嵌套、 2) 无法内部滚动，即cover-view无法内部出现滚动条、 3) 无法覆盖到视频的全屏界面。 app-nvue的cover-view无这些限制。

另外cover-view无论如何都无法解决原生导航栏、tabbar、web-view组件的覆盖，为此App端补充了2个层级覆盖方案plus.nativeObj.view和subNVue

简称nview，它是一个原生的类画布的控件，其实cover-view也是用plus.nativeObj.view封装的。API文档详见：https://www.html5plus.org/doc/zh_cn/nativeobj.html#plus.nativeObj.View

plus.nativeObj.view的API比较原生，可以画出任何界面，但plus.nativeObj.view有3个问题：1. api很底层，开发比较复杂；2. 不支持动画；3. 不支持内部滚动。

subNVue是原生渲染的nvue子窗体，把一个nvue页面以半屏的方式覆盖在vue页面上。它解决了plus.nativeObj.view的不足，提供了强大的层级问题解决方案。subNVue的详细介绍见：https://ask.dcloud.net.cn/article/35948

uni-app支持在App端弹出半透明的nvue窗体。即看起来是在本窗体弹出一个元素，但实际上是弹出了一个部分区域蒙灰透明的新窗体。这样的窗体比subnvue有个优势就是可以全局复用。具体参考这个插件

subNVue或弹出部分区域透明的nvue页面，会比plus.nativeObj.view多占用一些内存。所以如果你要覆盖的内容很简单，cover-view或plus.nativeObj.view可以简单实现的话，就没必要用subNVue或nvue。

所以如果你的层级覆盖问题比较简单，不用嵌套，且有跨端需求，就使用cover-view。

如果App端cover-view无法满足需求，且需要覆盖的原生界面比较简单，可以用plus.nativeObj.view。否则，就使用subnvue或部分区域透明的nvue吧。

关于subNVue和Webview的层级问题 subNVue的层级高于前端元素，但多个subNVue以及Webview，它们之间的也存在层级关系。

默认规则是，先创建的subNVue或webview在底部，后创建的会盖住之前的。

当然每个subNVue和webview，都支持Style参数配置，其中有一个zindex属性，可以调节它们的层级。

nvue页面全部都是原生组件，互相之间没有层级问题。

但如果在pages.json里注册了原生导航栏和tabbar，nvue里的界面元素默认也无法覆盖这些，也需要plus.nativeObj.view或subNVue。

如果仅开发App，不跨端，不愿涉及层级问题，也可以不使用pages.json里的原生导航栏和tabbar，nvue页面不需要这些来强化性能。

在Android手机上，调整系统主题字体，所有原生渲染的控件的字体都会变化，而webview渲染的字体则不一定会变化，有的rom的系统webview会跟随变，有的不会变。

对于webview字体不会跟随rom变的情况，如果原生渲染和webview渲染出现在同一页面，就会发现字体不一致。

部分小程序通过修改了自带的webview内核，实现了webview也可以使用rom主题字体，比如微信、qq、支付宝。

app-nvue因为是原生渲染，没有字体不一致的问题。而app-vue下，在某些rom下，webview字体与系统字体不一致。

**Examples:**

Example 1 (unknown):
```unknown
bindrendererror
```

---

## page-meta | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/page-meta

**Contents:**
- # page-meta
    - # head标签
    - # 示例代码
      - 本页导读

页面属性配置节点，用于指定页面的一些属性、监听页面事件。可部分替代pages.json的功能。

从微信基础库2.9.0开始，新增了page-meta组件，它是一个特殊的标签，有点类似html里的header标签。页面的背景色、原生导航栏的参数，都可以写在page-meta里。HBuilderX 2.6.3+ 支持了这个组件，并且全平台都实现了。

从某种意义讲，page-meta对pages.json有一定替代作用，可以让页面的配置和页面内容代码写在一个vue文件中。它还可以实现通过变量绑定来控制页面配置。但它的性能不如pages.json的配置，在新页面加载时，渲染速度还是pages.json方式的写法更快。

page-meta只能是页面内的第一个节点。可以配合 navigation-bar 组件一同使用。

从HBuilderX 2.6.3起，编译到所有平台均支持page-meta，但编译到微信时，受微信基础库版本限制；编译到其他平台不受平台版本限制。

vue3 下还可以在page-meta内使用浏览器原生 head 标签，此用法仅 vue3 版本 ssr 可用，方便在 编译为 ssr 时进行 seo 优化。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
<page-meta>
```

Example 2 (unknown):
```unknown
<page-meta>
```

Example 3 (unknown):
```unknown
HBuilderX 3.3.0
```

Example 4 (html):
```html
<template>
  <page-meta
    :background-text-style="bgTextStyle"
    :background-color="bgColor"
    :background-color-top="bgColorTop"
    :background-color-bottom="bgColorBottom"
    :scroll-top="scrollTop"
    page-style="color: green"
    root-font-size="16px"
  >
    <head>
      // 仅vue3 ssr支持，此节点下的元素会被拷贝到h5页面的head标签下，可以利用此特性进行seo优化
      <meta name="keyword" :content="title" />
    </head>
  </page-meta>
  <view class="content"> </view>
</template>

<script>
  export default {
    data() {
      return {
        keyword: "",
      };
    },
    serverPrefetch() {
      // 仅vue3版本支持
      this.keyword = "ServerKeyword";
    },
    onLoad() {},
    methods: {},
  };
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/vite-config.html

**Contents:**
- # 注意事项
      - 本页导读

vite.config.js 是一个可选的配置文件，如果项目的根目录中存在这个文件，那么它会被自动加载，一般用于配置 vite 的编译选项，具体规范参考：vite.config.js

必须引用 '@dcloudio/vite-plugin-uni' 并且添加到 plugins 中

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：在 HBuilderX 中读取 .env 环境变量可以通过 loadEnv 获取，注意第二个参数不要使用 processs.cwd()， 第二个参数需要填写配置文件所在的绝对路径： const env = loadEnv(mode, __dirname);

示例源码如下，请查看 pre > code 标签中的内容

发布时动态修改 manifest.json

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

Example 2 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

Example 3 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

Example 4 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

---

## App.vue/App.uvue | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/App.html

**Contents:**
- # App.vue/App.uvue
- # 应用生命周期
- # globalData
- # 全局样式
      - 本页导读

App.vue/uvue是uni-app的主组件。uni-app js引擎版是app.vue。uni-app x是app.uvue。以下出现的app.vue一般泛指包含了app.uvue

所有页面都是在App.vue下进行切换的，是应用入口文件。但App.vue本身不是页面，这里不能编写视图元素，也就是没有<template>。

这个文件的作用包括：监听应用生命周期、配置全局样式、配置全局的存储globalData

应用生命周期仅可在App.vue中监听，在页面监听无效。

uni-app 支持如下应用生命周期函数：

示例源码如下，请查看 pre > code 标签中的内容

小程序有globalData，这是一种简单的全局变量机制。这套机制在uni-app里也可以使用，并且全端通用。

当然vue框架的全局变量，另有其他方式定义。

以下是 App.vue 中定义globalData的相关配置：

示例源码如下，请查看 pre > code 标签中的内容

js中操作globalData的方式如下： getApp().globalData.text = 'test'

在应用onLaunch时，getApp对象还未获取，暂时可以使用this.globalData获取globalData。

如果需要把globalData的数据绑定到页面上，可在页面的onShow页面生命周期里进行变量重赋值。

nvue的weex编译模式中使用globalData的话，由于weex生命周期不支持onShow，但熟悉5+的话，可利用监听webview的addEventListener show事件实现onShow效果，或者直接使用weex生命周期中的beforeCreate。但建议开发者使用uni-app编译模式，而不是weex编译模式。

globalData是简单的全局变量，如果使用状态管理，请使用vuex（main.js中定义）

在App.vue中，可以定义一些全局通用样式，例如需要加一个通用的背景色，首屏页面渲染的动画等都可以写在App.vue中。

注意如果工程下同时有vue和nvue文件，全局样式的所有css会应用于所有文件，而nvue支持的css有限，编译器会在控制台报警，提示某些css无法在nvue中支持。此时需要把nvue不支持的css写在单独的条件编译里。如：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
App.vue/uvue
```

Example 2 (html):
```html
<script>
	// 只能在App.vue里监听应用的生命周期
	export default {
		onLaunch: function(options) {
			console.log('App Launch')
			console.log('应用启动路径：', options.path)
		},
		onShow: function(options) {
			console.log('App Show')
			console.log('应用启动路径：', options.path)
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>
```

Example 3 (html):
```html
<script>
	// 只能在App.vue里监听应用的生命周期
	export default {
		onLaunch: function(options) {
			console.log('App Launch')
			console.log('应用启动路径：', options.path)
		},
		onShow: function(options) {
			console.log('App Show')
			console.log('应用启动路径：', options.path)
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>
```

Example 4 (html):
```html
<script>
	// 只能在App.vue里监听应用的生命周期
	export default {
		onLaunch: function(options) {
			console.log('App Launch')
			console.log('应用启动路径：', options.path)
		},
		onShow: function(options) {
			console.log('App Show')
			console.log('应用启动路径：', options.path)
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/api.html

**Contents:**
- # API
- # Uni 测试框架 API
  - # program
    - # 方法
      - # program.pageStack
      - # program.navigateTo
      - # program.redirectTo
      - # program.navigateBack
      - # program.reLaunch
      - # program.switchTab

program 是uni-automator自动注入的全局对象

program.pageStack(): Promise<Page[]>

保留当前页面，跳转到应用内的某个页面，同 uni.navigateTo。

program.navigateTo(url: string): Promise<Page>

示例源码如下，请查看 pre > code 标签中的内容

关闭当前页面，跳转到应用内的某个页面，同 uni.redirectTo。

program.redirectTo(url: string): Promise<Page>

关闭当前页面，返回上一页面或多级页面，同 uni.navigateBack。

program.navigateBack(): Promise<Page>

关闭所有页面，打开到应用内的某个页面，同 uni.reLaunch。

program.reLaunch(url: string): Promise<Page>

跳转到 tabBar 页面，并关闭其他所有非 tabBar 页面，同 uni.switchTab。

program.switchTab(url: string): Promise<Page>

program.currentPage(): Promise<Page>

获取系统信息，同 uni.getSystemInfo。

program.systemInfo(): Promise<Object>

示例源码如下，请查看 pre > code 标签中的内容

将页面滚动到目标位置，同 uni.pageScrollTo。

program.pageScrollTo(scrollTop: number): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

program.callUniMethod(method: string, ...args: any[]): Promise<any>

调用异步方法时无需传入 success 及 fail 回调函数。

示例源码如下，请查看 pre > code 标签中的内容

对当前页面截图。 微信小程序只有开发者工具模拟器支持，客户端无法使用。

program.screenshot(options?: Object): Promise<string | void>

如果不传 options，该方法返回图片数据的 base64 编码。

示例源码如下，请查看 pre > code 标签中的内容

利用该接口，你可以很方便地直接指定 uni.chooseLocation 等调用系统组件的返回结果。

program.mockUniMethod(method: string, result: any): Promise<void>

program.mockUniMethod(method: string, fn: Function | string, ...args: any[]): Promise<void>

fn 同 program.evaluate 的 appFunction 参数一样，无法使用闭包来引用外部变量。此外，你还可以在方法内使用 this.origin 来调用原始方法。

示例源码如下，请查看 pre > code 标签中的内容

重置 uni 指定方法，消除 mockUniMethod 调用的影响。

program.restoreUniMethod(method: string): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

注入代码片段并返回执行结果。（仅微信小程序支持）

program.evaluate(appFunction: Function | string, ...args: any[]): Promise<any>

appFunction 最终会被序列化传递到开发者工具，因此你无法在函数中利用闭包来引用外部变量。也就是说，传递 function () {} 函数事实上等同于传递其字符串。

示例源码如下，请查看 pre > code 标签中的内容

获取多账号调试中已添加的用户列表。（仅微信小程序支持）

program.testAccounts(): Promise<Account[]>

示例源码如下，请查看 pre > code 标签中的内容

在全局暴露方法，供小程序侧调用测试脚本中的方法（仅微信小程序支持）

program.exposeFunction(name: string, bindingFunction: Function): Promise<void>

你可以利用该方法来监听事件，不支持在小程序侧获取调用结果。

示例源码如下，请查看 pre > code 标签中的内容

页面参数。 page.query: Object

page.$(selector: string): Promise<Element>

示例源码如下，请查看 pre > code 标签中的内容

page.$$(selector: string): Promise<Element[]>

该方法跟 $ 一样均无法选择自定义组件内的元素，请使用 element.$。

示例源码如下，请查看 pre > code 标签中的内容

page.waitFor(condition: string | number | Function): Promise<void>

如果条件是 string 类型，那么该参数会被当成选择器，当该选择器选中元素个数不为零时，结束等待。

如果条件是 number 类型，那么该参数会被当成超时时长，当经过指定时间后，结束等待。

如果条件是 Function 类型，那么该参数会被当成断言函数，当该函数返回真值时，结束等待。

示例源码如下，请查看 pre > code 标签中的内容

获取页面渲染数据, 即选项式 API data 中返回的数据和组合式 API defineExpose 暴露的数据。 注意： uni-app x Android 端暂不支持获取 defineExpose 暴露的 ref 数据。

page.data(path?: string): Promise<Object>

示例源码如下，请查看 pre > code 标签中的内容

page.setData(data: Object): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

page.size(): Promise<Object>

示例源码如下，请查看 pre > code 标签中的内容

page.scrollTop(): Promise<number>

示例源码如下，请查看 pre > code 标签中的内容

page.callMethod(method: string, ...args: any[]): Promise<any>

示例源码如下，请查看 pre > code 标签中的内容

Element 模块提供了控制页面元素的方法。

element.tagName: string

element.$(selector: string): Promise<Element>

示例源码如下，请查看 pre > code 标签中的内容

element.$$(selector: string): Promise<Element[]>

示例源码如下，请查看 pre > code 标签中的内容

element.size(): Promise<Object>

示例源码如下，请查看 pre > code 标签中的内容

element.offset(): Promise<Object>

示例源码如下，请查看 pre > code 标签中的内容

element.text(): Promise<string>

示例源码如下，请查看 pre > code 标签中的内容

element.attribute(name: string): Promise<string>

示例源码如下，请查看 pre > code 标签中的内容

element.property(name: string): Promise<any>

element.property 与 element.attribute 主要区别如下：

element.attribute 获取的是标签上的值，因此它的返回类型一定是字符串，element.property 则不一定。

element.attribute 可以获取到 class 和 id 之类的值，element.property 不行。

element.property 可以获取到文档里对应组件列举的大部分属性值，比如表单 input 等组件的 value 值。

示例源码如下，请查看 pre > code 标签中的内容

element.html(): Promise<string>

element.outerHtml(): Promise<string>

示例源码如下，请查看 pre > code 标签中的内容

element.value(): Promise<string>

示例源码如下，请查看 pre > code 标签中的内容

element.style(name: string): Promise<string>

示例源码如下，请查看 pre > code 标签中的内容

element.tap(): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

element.longpress(): Promise<void>

element.touchstart(options: Object): Promise<void>

element.touchmove(options: Object): Promise<void>

options 字段同 touchstart。

element.touchend(options: Object): Promise<void>

options 字段同 touchstart。

示例源码如下，请查看 pre > code 标签中的内容

element.trigger(type: string, detail?: Object): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

该方法无法改变组件状态，仅触发响应方法，也无法触发用户操作事件，即 tap，longpress 等事件，请使用对应的其它方法调用。

输入文本，仅 input、textarea 组件可以使用。

element.input(value: string): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

调用组件实例指定方法，仅自定义组件可以使用。

element.callMethod(method: string, ...args: any[]): Promise<any>

示例源码如下，请查看 pre > code 标签中的内容

获取组件实例渲染数据，即选项式 API data 中返回的数据和组合式 API defineExpose 暴露的数据，仅自定义组件可以使用。 注意： uni-app x Android 端暂不支持获取 defineExpose 暴露的 ref 数据。

element.data(path?: string): Promise<Object>

示例源码如下，请查看 pre > code 标签中的内容

设置组件实例渲染数据，仅自定义组件可以使用。

element.setData(data: Object): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

调用上下文 Context 对象方法，仅 video 组件可以使用。

element.callContextMethod(method: string, ...args: any[]): Promise<any>

video 组件必须设置了 id 才能使用。

示例源码如下，请查看 pre > code 标签中的内容

获取滚动宽度，仅 scroll-view 组件可以使用。

element.scrollWidth(): Promise<number>

获取滚动高度，仅 scroll-view 组件可以使用。

element.scrollHeight(): Promise<number>

滚动到指定位置，仅 scroll-view 组件可以使用。

element.scrollTo(x: number, y: number): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

滑动到指定滑块，仅 swiper 组件可以使用。

element.swipeTo(index: number): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

移动视图容器，仅 movable-view 组件可以使用。

element.moveTo(x: number, y: number): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

滑动到指定数值，仅 slider 组件可以使用。

element.slideTo(value: number): Promise<void>

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

最简单测试一个值的方法是使用精确匹配的方法。

示例源码如下，请查看 pre > code 标签中的内容

在上面的代码中，expect (2 + 2) 返回了一个"预期"的对象。 你通常不会对这些期望对象调用过多的匹配器。 在此代码中，.toBe(4) 是匹配器。 当 Jest 运行时，它会跟踪所有失败的匹配器，以便它可以为你打印出很好的错误消息。

toBe 使用 Object.is 来进行精准匹配的测试。 如果要检查对象的值，请使用 toEqual:

示例源码如下，请查看 pre > code 标签中的内容

toEqual 递归检查对象或数组的每个字段。

Notice: toEqual 会忽略具有未定义属性、未定义数组项、数组稀疏或对象类型不匹配的对象键。 要考虑这些，请改用 toStrictEqual。

您还可以使用与匹配相反的 not 来进行测试：

示例源码如下，请查看 pre > code 标签中的内容

代码中的 undefined, null 和 false 有不同含义，若你在测试时不想区分他们，可以用真值判断。 Jest 提供 helpers 供你使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
program.pageStack(): Promise<Page[]>
```

Example 2 (unknown):
```unknown
uni.navigateTo
```

Example 3 (typescript):
```typescript
program.navigateTo(url: string): Promise<Page>
```

Example 4 (javascript):
```javascript
const page = await program.navigateTo('/pages/index/index')
  console.log(page.path)// -> 'page/index/index'
```

---

## navigation-bar | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/navigation-bar.html

**Contents:**
- # navigation-bar
    - # 示例代码
      - 本页导读

页面导航条配置节点，用于指定导航栏的一些属性。只能是 page-meta 组件内的第一个节点，需要配合它一同使用。

从HBuilderX 2.9.3起，编译到所有平台均支持navigation-bar，但编译到微信时，受微信基础库版本限制；编译到其他平台不受平台版本限制。

属性说明 /collocation/pages?id=app-titlenview

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
navigation-bar
```

Example 2 (unknown):
```unknown
navigation-bar
```

Example 3 (unknown):
```unknown
navigation-bar
```

Example 4 (html):
```html
<template>
  <page-meta>
    <navigation-bar
      :title="nbTitle"
      :title-icon="titleIcon"
      :title-icon-radius="titleIconRadius"
      :subtitle-text="subtitleText"
      :subtitle-color="nbFrontColor"
      :loading="nbLoading"
      :front-color="nbFrontColor"
      :background-color="nbBackgroundColor"
      :color-animation-duration="2000"
      color-animation-timing-func="easeIn"
    />
  </page-meta>
  <view class="content"></view>
</template>

<script>
  export default {
    data() {
      return {
        nbTitle: '标题',
        titleIcon: '/static/logo.png',
        titleIconRadius: '20px',
        subtitleText: 'subtitleText',
        nbLoading: false,
        nbFrontColor: '#000000',
        nbBackgroundColor: '#ffffff'
      }
    },
    onLoad() {
    },
    methods: {
    }
  }
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-extension/

**Contents:**
- # 自动化测试插件
- # 插件说明
- # 测试注意事项
- # 插件安装
- # 测试环境安装
    - # uni-app普通项目
    - # uniapp-cli项目
- # 创建测试用例
- # 测试运行
    - # 测试平台说明

本插件，用于在HBuilderX内运行uni-app自动化测试，支持H5、微信小程序、Android、iOS、Harmony自动化测试。

如下图所示，在插件市场，进入插件详情页 ，点击【导入插件】，会自动拉起本地安装的HBuilderX。

特别注意：插件安装，依赖HBuilderX 终端插件。

uni-app普通项目，初始化测试环境或运行测试时，如果未安装相关依赖，会自动安装。

如下图所示，项目管理器，选中项目，右键菜单【初始化测试环境】

注意：安装环境依赖时，如果检测到项目下不存在测试配置文件 env.js 和jest.config.js，则会自动创建测试配置文件。

uniapp-cli项目，自动化测试运行，将使用项目下的依赖库。

打开命令行，进入项目目录，输入如下命令进行安装:

示例源码如下，请查看 pre > code 标签中的内容

uni-app项目，pages页面，右键菜单，创建测试用例

创建测试用例之后，选中项目，右键菜单【运行uni-app自动化测试】，选择运行平台，即可开始运行测试。

注意：如果要运行指定的测试用例，请在项目管理器选中要运行的用例，右键菜单【运行当前测试用例】

如下图所示，运行测试时，支持选择对应平台。

点击菜单【设置】【插件配置】，找到hbuilderx-for-uniapp-test项，即可看到设置项。

uni-app自动化测试，使用了业内常见的jest测试库。

下面将使用一个最简单的示例，来讲解测试用例的组成。

示例源码如下，请查看 pre > code 标签中的内容

以uni-app【默认模板】index页面为例。

编写测试用例，检查index.vue页面，标题是否为Hello

示例源码如下，请查看 pre > code 标签中的内容

扩展：如上测试代码中，使用了beforeAll函数，它用于在所有测试之前执行。了解jest更多钩子函数

通常在编写测试时，您需要在测试运行之前进行一些设置工作，并且在测试运行之后需要进行一些完成工作。可以使用Jest的钩子函数来解决这个问题.

文档扩展: jest setup-teardown

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了更快速的编写测试用例，本插件内置了jest部分代码块

提醒：下面关于env.js的介绍，大部分情况下，自动化测试插件会自动修改，无需您手动调整。如果不确定，请勿修改。

通常，测试项目下有个测试配置文件env.js，内容如下:

示例源码如下，请查看 pre > code 标签中的内容

提示：大部分场景下，您不会用到UNI_TEST_CUSTOM_ENV。修改请慎重。

下面将对UNI_TEST_CUSTOM_ENV做介绍。

自动化测试插件 1.9.0版本新增UNI_TEST_CUSTOM_ENV, 用于读取自定义环境变量，并传递给uniapp自动化测试框架命令行。后期会随时扩充新的key。

示例源码如下，请查看 pre > code 标签中的内容

场景：电脑上安装了HBuilderX 正式版、Dev、Alpha版本，每个程序plugins目录都重新安装一遍测试依赖？答案：不需要。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-app普通项目
```

Example 2 (unknown):
```unknown
uniapp-cli项目
```

Example 3 (unknown):
```unknown
node-simctl
```

Example 4 (unknown):
```unknown
hbuilderx-for-uniapp-test
```

---

## uni.setTabBarItem(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/tabbar.html

**Contents:**
- # uni.setTabBarItem(OBJECT)
  - # setTabBarItem 兼容性
- # uni.setTabBarStyle(OBJECT)
  - # setTabBarStyle 兼容性
- # uni.hideTabBar(OBJECT)
  - # hideTabBar 兼容性
- # uni.showTabBar(OBJECT)
  - # showTabBar 兼容性
- # uni.setTabBarBadge(OBJECT)
  - # setTabBarBadge 兼容性

示例源码如下，请查看 pre > code 标签中的内容

注意: 设置 iconfont 属性时，pages.json iconfontSrc 需要指定字体文件，参考下面的配置

示例源码如下，请查看 pre > code 标签中的内容

backgroundImage创建线性渐变说明

backgroundImage: linear-gradient(to top, #a80077, #66ff00);

目前暂不支持 radial-gradient（径向渐变）。

示例源码如下，请查看 pre > code 标签中的内容

为 tabBar 某一项的右上角添加文本。

示例源码如下，请查看 pre > code 标签中的内容

显示 tabBar 某一项的右上角的红点。

隐藏 tabBar 某一项的右上角的红点。

**Examples:**

Example 1 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

Example 2 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

Example 3 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

Example 4 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

---

## uni.getEnterOptionsSync() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/getEnterOptionsSync.html

**Contents:**
- # uni.getEnterOptionsSync()
  - # getEnterOptionsSync 兼容性
      - 本页导读

各平台在启动时，参数获取存在差异，详细如下

默认提供 7 个渠道（Google、360、小米、华为、应用宝、vivo、oppo），更多可以在manifest.json文件中【源码视图】进行配置，详情

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 2 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 3 (unknown):
```unknown
仅微信小程序(2.20.0+)
```

Example 4 (unknown):
```unknown
仅抖音小程序(1.90.0+)
```

---

## uni.setTabBarItem(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/tabbar

**Contents:**
- # uni.setTabBarItem(OBJECT)
  - # setTabBarItem 兼容性
- # uni.setTabBarStyle(OBJECT)
  - # setTabBarStyle 兼容性
- # uni.hideTabBar(OBJECT)
  - # hideTabBar 兼容性
- # uni.showTabBar(OBJECT)
  - # showTabBar 兼容性
- # uni.setTabBarBadge(OBJECT)
  - # setTabBarBadge 兼容性

示例源码如下，请查看 pre > code 标签中的内容

注意: 设置 iconfont 属性时，pages.json iconfontSrc 需要指定字体文件，参考下面的配置

示例源码如下，请查看 pre > code 标签中的内容

backgroundImage创建线性渐变说明

backgroundImage: linear-gradient(to top, #a80077, #66ff00);

目前暂不支持 radial-gradient（径向渐变）。

示例源码如下，请查看 pre > code 标签中的内容

为 tabBar 某一项的右上角添加文本。

示例源码如下，请查看 pre > code 标签中的内容

显示 tabBar 某一项的右上角的红点。

隐藏 tabBar 某一项的右上角的红点。

**Examples:**

Example 1 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

Example 2 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

Example 3 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

Example 4 (css):
```css
uni.setTabBarItem({
  index: 0,
  text: 'text',
  iconPath: '/path/to/iconPath',
  selectedIconPath: '/path/to/selectedIconPath'
})
```

---

## uni.login(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/login

**Contents:**
- # uni.login(OBJECT)
  - # login 兼容性
  - # App平台支持的登录方式
  - # 小程序平台支持的登录方式
  - # web平台支持的登录方式
  - # OBJECT 参数说明
  - # 注意事项
- # uni.getLoginCode(OBJECT)
- # uni.checkSession
- # uni.getUserInfo(OBJECT)

uni.login是一个客户端API，统一封装了各个平台的各种常见的登录方式，包括App手机号一键登陆、三方登录（微信、微博、QQ、Apple、google、facebook）、各家小程序内置登录。

除了前端API，DCloud还提供了uni-id ，这是一个云端一体的、完整的、账户开源框架。不仅包括客户端API，还包括前端页面、服务器代码、管理后台等所有与登录账户有关的服务，包括短信验证码、密码加密存储、忘记密码、头像更新等所有常见账户相关功能。

大多数登录方式，都需要申请开通相关服务，具体点击下面的文档查看。

Web平台常见的登录包括用户名密码、短信验证码、pc端微信扫描、微信公众号登录。这些没有封装在 uni.login API中，但都封装在了uni-id中。请另行参考uni-id

如不使用uni-id，微信内嵌浏览器运行H5版时，可通过js sdk实现微信登录，需要引入一个单独的js，详见

微信登录在未配置onlyAuthorize的情况下，调用uni.login接口用户登录凭证(code)不返回，用以换取登录信息(authResult)；需要在项目manifest.json中配置的appsecret，此参数云端打包后会保存在apk/ipa中，存在参数泄露的风险；HBuilderX3.4.18+ 不再提供此参数的可视化配置。对于安全性要求较低的开发者，可以通过manifest.json -> 源码视图 -> app-plus -> distribute -> sdkConfigs -> oauth -> weixin -> 添加appsecret 配置。

示例源码如下，请查看 pre > code 标签中的内容

获取宿主 App 登录凭证（Authorization Code）

微信小程序端用户头像昵称获取规则已调整，参考 用户信息接口调整说明 、小程序用户头像昵称获取规则调整公告 支付宝小程序获取用户头像昵称规则已调整，将在 2024年09月15日正式生效。参考 关于小程序用户头像昵称获取规则调整公告

注意： 在小程序 withCredentials 为 true 时或是在 App 调用 uni.getUserInfo，要求此前有调用过 uni.login 且登录态尚未过期。微信基础库2.10.4版本对用户信息相关接口进行了调整，使用 uni.getUserInfo 获取得到的 userInfo 为匿名数据，建议使用 uni.getUserProfile 获取用户信息。

除了以上三个必有的信息外，不同服务供应商返回的其它信息会存在差异。

App端还支持更多登录相关API，如logout，详见

App端登录相关的SDK需要在manifest中配置：

如果手机端未安装QQ、微博，调用时会启动这些平台的wap页面登录，如果已安装相应客户端，会启动它们的客户端登录。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序端基础库2.27.1及以上版本，wx.getUserProfile 接口 被收回，详见《小程序用户头像昵称获取规则调整公告》 。

获取用户信息。每次请求都会弹出授权窗口，用户同意后返回 userInfo。

抖音从基础库 2.30.0 开始支持本方法，低版本需做兼容处理。详见

元服务 ASCF 1.0.17 运行时（2025-11-27 ）、用户侧系统要求为鸿蒙6+ 开始支持本接口，点击后自动拉起弹窗授权，用户授权后返回 nickName 和 avatarUrl 参数

注意： 可以使用 if(uni.getUserProfile) 判断uni.getUserProfile是否可用。

按照中国移动、中国联通、中国电信等运营商的要求，一键登录必须有界面。可用此API关闭页面。

获取全局唯一的一键登录管理器 univerifyManager

univerifyManager 方法说明

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 不支持
```

Example 2 (unknown):
```unknown
HarmonyOS 不支持
```

Example 3 (unknown):
```unknown
onlyAuthorize
```

Example 4 (yaml):
```yaml
onlyAuthorize:true
```

---

## uni.pageScrollTo(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/scroll

**Contents:**
- # uni.pageScrollTo(OBJECT)
- # 平台差异说明
  - # pageScrollTo 兼容性
- # OBJECT参数说明
- # uni-app x 注意事项
      - 本页导读

将页面滚动到目标位置。可以指定滚动到具体的scrollTop数值，也可以指定滚动到某个元素的位置

selector类似于 CSS 的选择器，但仅支持下列语法。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
.a-class.another-class
```

Example 2 (unknown):
```unknown
.the-parent > .the-child
```

Example 3 (unknown):
```unknown
.the-ancestor .the-descendant
```

Example 4 (unknown):
```unknown
.the-ancestor >>> .the-descendant
```

---

## uni.getProvider(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/provider

**Contents:**
- # uni.getProvider(OBJECT)
  - # getProvider 兼容性
      - 本页导读

在App平台，可用的服务商，是打包环境中配置的服务商，与手机端是否安装了该服务商的App没有关系。

云打包在manifest中配置相关模块和SDK信息，离线打包在原生工程中配置。某个服务商配置被打包进去，运行时就能得到相应的服务供应商。

provider 在不同服务类型下可能的取值说明

providers 在不同服务类型下可能的取值说明

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 4.77
```

Example 2 (javascript):
```javascript
uni.getProvider({
	service: 'oauth',
	success: function (res) {
		console.log(res.provider)
		if (~res.provider.indexOf('qq')) {
			uni.login({
				provider: 'qq',
				success: function (loginRes) {
					console.log(JSON.stringify(loginRes));
				}
			});
		}
	}
});
```

Example 3 (javascript):
```javascript
uni.getProvider({
	service: 'oauth',
	success: function (res) {
		console.log(res.provider)
		if (~res.provider.indexOf('qq')) {
			uni.login({
				provider: 'qq',
				success: function (loginRes) {
					console.log(JSON.stringify(loginRes));
				}
			});
		}
	}
});
```

Example 4 (javascript):
```javascript
uni.getProvider({
	service: 'oauth',
	success: function (res) {
		console.log(res.provider)
		if (~res.provider.indexOf('qq')) {
			uni.login({
				provider: 'qq',
				success: function (loginRes) {
					console.log(JSON.stringify(loginRes));
				}
			});
		}
	}
});
```

---

## manifest.json 应用配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/manifest

**Contents:**
- # manifest.json 应用配置
- # 配置项列表
  - # networkTimeout
  - # uniStatistics
  - # app-plus
    - # App Splashscreen
    - # App Modules
    - # App Distribute
    - # App SdkConfigs
    - # optimization

manifest.json 文件是应用的配置文件，用于指定应用的名称、图标、权限等。HBuilderX 创建的工程此文件在根目录，CLI 创建的工程此文件在 src 目录。

自HBuilderX 2.5.10起，上述默认超时时间由6秒改为60秒，对齐微信小程序平台。

PS：上表只列出了核心部分，App平台的配置其实非常多，完整内容请参考 完整的 manifest.json。

splash（启动封面）是App必然存在的、不可取消的。

alwaysShowBeforeRender和autoclose属性组合设置，可配置以下三种关闭启动界面（splash）策略，详见

模块选择是为了控制App的包体积，不需要的模块可以在打包时剔除。

三方原生SDK配置。三方SDK的使用需要向这些SDK提供商申请，并配置参数到此处。可在HBuilderX可视化界面（App SDK配置）输入配置，此配置仅云打包后生效，本地打包需自行在原生工程中配置。

可以减轻启动时加载的js数量，提升启动速度。

从uni-app 2.7.12+ 开始，App-vue平台也兼容了小程序的分包配置，但默认并不开启。

在manifest配置以下节点，可以在App端启动分包。

示例源码如下，请查看 pre > code 标签中的内容

在manifest中启动分包后，需要在pages.json中配置具体的分包规则，与小程序的配置相同，详见：https://uniapp.dcloud.io/collocation/pages?id=subpackages

也就是一旦在pages.json里配置分包，小程序一定生效，而app是否生效，取决于manifest里是否开启。

当App代码使用了低版本webview不支持的语法时（比如使用了vue3），可以在manifest配置本属性，来指定最低运行的webview版本。

当系统webview版本不符合需求时，uni-app引擎会自动弹框。同时开发者可以指定使用 x5引擎webview 来替代系统webview，以保障浏览器兼容性。详见x5文档

当你的应用强依赖x5时，比如需要vue页面的字体和tabbar等原生界面保持一致时，也可以在manifest配置本属性。

示例源码如下，请查看 pre > code 标签中的内容

提示：vue3 vue页面 要求 Android 系统 webview 最低版本为 64.0.3282.116

鸿蒙应用项目设置，支持 distribute 属性，其值为一个 Object 对象：

此配置对象用于配置鸿蒙打包时使用的数字签名证书信息，可分别配置调试证书和发布证书两组信息。

可以通过可视化方式进行设置，支持自动获取调试证书。

调试证书的键名为 "default"，发布证书的键名为 "release"，其值为一个 Object：

目前 Vue2 支持， Vue3 暂不支持

需要使用自定义模板的场景，通常有以下几种情况：

使用自定义模板时，1. 工程根目录下新建一个html文件；2. 复制下面的基本模板内容，到这个html文件，在此基础上修改meta和引入js；3. 在 manifest.json->h5->template 节点中关联这个html文件的路径。

示例源码如下，请查看 pre > code 标签中的内容

在hello uni-app示例中有一个template.h5.html文件，即是此用途。

H5平台是SPA单页应用，普通的SEO信息即加meta字段只能在，自定义的模板html里配置首页。

但SEO的时代在变，现在更有效的方式，使用uni-app同时发布一版百度小程序，这个搜索权重更高。DCloud的ask社区的H5版也是uni-app做的，同时发布了百度小程序，权重更高，每天来自百度的搜索量非常多。是一个可现身说法的好案例。

Tips：uni-app 中 manifest.json->h5->devServer，vue2 实际上对应 webpack 的 devServer ，vue3 实际上对应 vite 的 server ，鉴于 manifest 为 json 文件，故 webpack.config.js->devServer 及 vite.config.js->server 配置项下的简单类型属性均可在manifest.json->h5->devServer节点下配置，funciton 等复杂类型暂不支持。

配置 publicPath 为 cdn 资源地址前缀，这样编译出来的 html 文件，引用的 js，css 路径会自动变成 cdn 上的地址。

注意：如果想对图片生效，image组件的图片地址需要使用相对路径

以 hello-uniapp 发布 H5 时为例

未配置 publicPath 时，发布时 index.html 中的结果：

示例源码如下，请查看 pre > code 标签中的内容

配置 publicPath 为 https://www.cdn.com/h5/（无效地址仅用作示例） 后，发布时 index.html 中的结果：

示例源码如下，请查看 pre > code 标签中的内容

三方SDK配置。三方SDK的使用需要向这些SDK提供商申请，并配置参数到此处。可在HBuilderX可视化界面（H5 配置）输入配置。

地图服务商 SDK 配置，使用地图以及位置（IP 定位及坐标转换）需要配置此项。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Tips：关于摇树优化（treeShaking）原理及优化结果，参考：https://ask.dcloud.net.cn/article/36279

注意: 使用微信小程序手势组件会强制开启 ES6 转 ES5

如果需要使用微信小程序的云开发，需要在 mp-weixin 配置云开发目录

示例源码如下，请查看 pre > code 标签中的内容

配置目录之后，vue2 项目 需要在项目根目录新建 vue.config.js 配置对应的文件编译规则

示例源码如下，请查看 pre > code 标签中的内容

vue3 项目 需要在项目根目录新建 vite.config.js 配置对应的文件编译规则

示例源码如下，请查看 pre > code 标签中的内容

小程序开发者工具 IDE 3.0.1+ 版本开始支持新版配置，查看详情

鸿蒙元服务项目设置，目前只支持一个 distribute 属性，其值为一个 Object 对象：

此配置对象用于配置鸿蒙打包时使用的数字签名证书信息，可分别配置调试证书和发布证书两组信息。

可以通过可视化方式进行设置，支持自动获取调试证书。

调试证书的键名为 "default"，发布证书的键名为 "release"，其值为一个 Object：

HBuilderX 3.6.16+ 支持项目根目录(cli 项目为 src 目录)下创建配置文件自定义小程序项目配置。平台对应文件名如下：

示例源码如下，请查看 pre > code 标签中的内容

以上面的分包为例，放在每个分包root对应目录下的静态文件会被打包到此分包内。

示例源码如下，请查看 pre > code 标签中的内容

Q：iOS 应用调用相机等权限时，弹出的提示语如何修改？ A：在 manifest.json 可视化界面-App模块权限配置-iOS隐私信息访问的许可描述

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
HBuilderX 2.5.10
```

Example 3 (json):
```json
{
  "app-plus": {
    "optimization": {
      "subPackages": true
    },
    "runmode" : "liberate" // 开启分包优化后，必须配置资源释放模式
  }
}
```

Example 4 (json):
```json
{
  "app-plus": {
    "optimization": {
      "subPackages": true
    },
    "runmode" : "liberate" // 开启分包优化后，必须配置资源释放模式
  }
}
```

---

## custom-tab-bar | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/custom-tab-bar.html

**Contents:**
  - # custom-tab-bar
      - 本页导读

在小程序和App端，为提升性能，在 pages.json 里配置固定的原生tabBar。但在H5端，这一设计并不会提升性能。

同时，H5端尤其是PC宽屏，对tabBar的位置和样式有更灵活的需求，tabBar作为一级导航，更多的时候是在PC网页顶部而不是底部。

自定义tabBar组件应需而生，它仍然读取 pages.json 里配置的tabBar信息，但这个组件可以自定义摆放的位置，可以灵活的配置各种css。

该组件支持 pages.json 中 tabBar 相关配置（兼容性和 H5 保持一致）， 其中不支持 borderStyle 配置。

该组件支持所有 tabBar 相关 API，例如设置 tab 徽标、显示红点、以及 switchTab 等。

仅 H5 支持，HBuilderX 2.9.9 + 。

本组件无需配置 tabBar 的 list，每个 tabItem 仍然从 pages.json 中读取。避免多端编写重复代码。

在hello uni-app中，在 topWindow 中放置自定义tabBar组件，将页面一级导航放置在网页顶部。

示例源码如下，请查看 pre > code 标签中的内容

示例体验：使用PC浏览器打开https://hellouniapp.dcloud.net.cn/

源码获取：HBuilderX 2.9.9+起新建uni-app项目，选择hello uni-app模板。

custom-tab-bar 水平布局（horizontal）：

custom-tab-bar 竖直布局（vertical）：

**Examples:**

Example 1 (unknown):
```unknown
borderStyle
```

Example 2 (unknown):
```unknown
onTabItemTap
```

Example 3 (unknown):
```unknown
hello uni-app
```

Example 4 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中的 top-window 查看 -->
<template>
    <view>
        <custom-tab-bar direction="horizontal" :show-icon="false" :selected="selected" @onTabItemTap="onTabItemTap" />
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-stat-v1.html

**Contents:**
- # 第一步、配置统计开关
- # 第二步、小程序端需添加域名访问白名单
- # 第三步、使用HBuilderX 2.2.3以上或对应的cli版发行应用
- # 第四步、登陆统计后台看数据
- # 发行时为什么提示“当前应用未配置Appid，无法使用uni统计”
- # 注意事项
- # 常见问题
      - 本页导读

您正在浏览的是老版uni统计1.0的文档。推荐升级到uni统计2.0

uni-app 2.2.3+ 版本新增 uni 统计1.0，支持全平台业务统计，包括App、H5及各家小程序。

web控制台地址：https://tongji.dcloud.net.cn

自 uni-app 2.2.3版本后，uni-app项目在发布时会默认启用 uni统计，开发者可在https://tongji.dcloud.net.cn 查看数据报表。 但从 uni-app 2.7起，默认值改为了不启用。需要在manifest中手动配置开启。

在HBuilderX中打开manifest，选择 uni统计，如下图：

如果不使用HBuilderX，也可在 manifest.json 的源码视图中手动关闭 uni统计

将 manifest.json -> uniStatistics 下的 enable 字段设置为 false 来关闭 uni 统计

示例源码如下，请查看 pre > code 标签中的内容

注意：uniStatistics支持分平台设置，比如若需仅关闭微信平台的 uni统计，则在mp-weixin节点下设置uniStatistics ->enable即可，如下：

示例源码如下，请查看 pre > code 标签中的内容

由于各家小程序对可访问的域名要配置白名单，否则无法联网，所以需要将tongji.dcloud.io配入服务器域名列表。详细教程可参考https://ask.dcloud.net.cn/article/36298

应用在运行、调试时不会上报统计数据，仅在发行后，并启动新版的App、h5、小程序，才会上报数据。

uni统计报表网址：https://tongji.dcloud.net.cn

请使用正确的DCloud账户登陆后台，每个DCloud账户登陆后可看到自己名下创建的应用。如果看不到期待的应用，那说明这个账户不是某个应用的所有者。

如果appid对应的项目的所有者发生变更，请参考如何转让应用

数据报表更新有延时，手机端上报数据后延迟几十分钟可在后台报表看到数据。

uni统计以appid区分不同应用，因此在编译项目时，若发现当前应用未配置appid，则会在控制台显示如下警告提醒：

示例源码如下，请查看 pre > code 标签中的内容

此时，开发者可通过HBuilderX、DCloud开发者中心 两个入口创建应用，获取Appid。

在HBluiderX中先登录，然后在项目根目录打开 manifest.json，在可视化界面点击获取 APPID 获取，无需其他设置，如下图

方式2. 登录DCoud开发者中心获取(即将支持)

登录DCloud开发者中心 ，在线创建应用，然后将新应用的appid填写到manifest.json中

示例源码如下，请查看 pre > code 标签中的内容

自定义事件怎么用 使用 uni.report() API 上报数据，详见自定义事件说明

内容统计是什么/ 页面规则怎么配置 内容统计是uni统计的特色功能之一，是内容详情页的访问统计，详见内容统计说明

不支持导入老数据合并统计。uni统计需要自开通上线后才有数据

售卖用户数据，或未经用户同意共享数据给第三方，属于违法行为，DCloud严格遵守国家法律要求，uni统计可安心使用。

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (php):
```php
manifest.json -> uniStatistics
```

Example 3 (json):
```json
//...
"uniStatistics": {
	"enable": false//全局关闭
},
//...
```

Example 4 (json):
```json
//...
"uniStatistics": {
	"enable": false//全局关闭
},
//...
```

---

## map | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/map

**Contents:**
- # map
  - # 腾讯地图服务商说明
  - # 高德地图审图号
  - # 腾讯地图审图号
  - # 近期新增功能
  - # 点聚合
  - # App平台地图服务商差异
    - # Map 地图组件
    - # marker
    - # marker 上的气泡 callout

地图组件用于展示地图，而定位API只是获取坐标，请勿混淆两者。

App平台（包含iOS、安卓、鸿蒙）腾讯地图使用web方案，在 申请腾讯位置服务Key 时注意将页面域名白名单设置为空，如下图

出于安全考虑，安卓、iOS端manifest.json内配置的key仅用来展示地图，uni.chooseLocation所依赖的地点搜索、逆地址解析功能需要通过uniCloud云对象uni-map-co 来调用，开发者可以通过安全网络来保障服务端api不被他人盗用，详情参考uni.chooseLocation文档。开发者可以将manifest.json内配置的key的所有api额度设置为0，避免key泄露产生额外的资源消耗。

鸿蒙平台由于暂不支持安全网络，所以chooseLocation依然使用manifest.json内配置的key来调用地点搜索、逆地址解析。

当地图上需要展示的标记点 marker 过多时，可能会导致界面上 marker 出现压盖，展示不全，并导致整体性能变差。针对此类问题，推出点聚合能力。

MapContext.initMarkerCluster 对聚合点进行初始化配置（可选）； MapContext.addMarkers 指定参与聚合的 marker； MapContext.on('markerClusterCreate', callback) 触发时，通过 MapContext.addMarkers 更新聚合簇的样式 （可选）； MapContext.removeMarkers 移除参与聚合的 marker；

指定一系列坐标点，从数组第一项连线至最后一项

polygon 指定一系列坐标点，根据 points 坐标数据生成闭合多边形

地图组件的经纬度必填，如果不填经纬度则默认值是北京的经纬度。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

map 组件相关操作的 JS API：uni.createMapContext

nvue map 更换箭头图标格式参考: https://ask.dcloud.net.cn/article/37901

Q：应用中使用了 <map> 组件，打包为App时，提示缺少权限模块怎么办？

A：App端原生地图，依赖第三方的 SDK，因此打包移动应用时，需要在manifest中勾选相关的权限并填写 key 信息，详见 。

Q：国外应用想使用谷歌地图/google地图怎么办？

A: App 3.4+ 已支持 Google 地图， App 3.4 以下版本使用下面的方案

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

若想要在地图上展示自定义的POI信息，试试 unicloud-map 云端一体组件，该组件将前端地图组件与云端数据库无缝连接，只需写一个<unicloud-map>组件，即可从数据库中获取附近的POI信息并在地图上呈现。无论是静态还是动态的POI，甚至更多自定义功能，都轻松实现。让地图开发变得愉快又高效。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-map

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-map.html

通过从数据库获取POI数据，并通过 uni-id-common 内的路线规划API，计算路线、距离、时间

鸿蒙应用可免费使用鸿蒙系统提供的地图服务。开通方式如下：

也可阅读插件文档中提到的 UTS 插件开放文档 、uni-app 中嵌入鸿蒙原生组件 ，参考插件逻辑自行完成能力封装。

**Examples:**

Example 1 (unknown):
```unknown
layer-style
```

Example 2 (vue):
```vue
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map style="width: 100%; height: 300px;" :latitude="latitude" :longitude="longitude" :markers="covers">
				</map>
			</view>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map style="width: 100%; height: 300px;" :latitude="latitude" :longitude="longitude" :markers="covers">
				</map>
			</view>
		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map style="width: 100%; height: 300px;" :latitude="latitude" :longitude="longitude" :markers="covers">
				</map>
			</view>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-sass.html

**Contents:**
- # 使用scss变量
- # 使用类名
  - # 颜色
  - # 边框半径
  - # 间距
      - 本页导读

uni-scss 是 uni-ui提供的一套全局样式 ，通过一些简单的类名和sass变量，实现简单的页面布局操作，比如颜色、边距、圆角等。

安装插件后，需要在项目的根目录的uni.scss文件引入变量文件，即可使用或修改对应的scss变量，变量主要定义的是主题色，后续后加入更多内容。

示例源码如下，请查看 pre > code 标签中的内容

uni-ui.scss 还提供了一批辅助样式 ，目的是供用户完成快速布局。 需要用户决定是否使用 ，如果使用的话css会增大 27kb 左右 使用需在 App.vue <style lang='scss'> 中引入

示例源码如下，请查看 pre > code 标签中的内容

前景色可以直接使用变量名同名的类，对元素快速应用color样式

示例源码如下，请查看 pre > code 标签中的内容

背景色可以在上面变量名的基础上加是 -bg，对元素快速应用background-color样式

示例源码如下，请查看 pre > code 标签中的内容

使用边框半径辅助样式对元素快速应用border-radius样式

规则为 uni-radius-${direction}-${size}

如果需要四边，则不需要指定 direction

边框半径可以通过使用 t, r, b, l 内置类在每条边上配置，例：uni-radius-t 、uni-radius-b-lg

边框半径可以通过使用 tl, tr, br, bl 内置类在每个角上配置，例：uni-radius-tl 、uni-radius-br-lg

基于 $border-radius-root 变量的四舍五入尺寸，该变量的默认值为0.25rpx。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用间距辅助类对元素快速应用 margin 或 padding 样式， 范围是从 0 到 16。

规则为 uni-${property}${direction}-${size}

direction 指定了该属性所应用的侧边:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
/* 需要放到文件最上面 */
@import '@/uni_modules/uni-scss/variables.scss';

/*
 以下变量是默认值，如不需要修改可以不用给下面的变量重新赋值
 */
// 主色
$uni-primary: #2979ff;
$uni-primary-disable:mix(#fff,$uni-primary,50%);
$uni-primary-light: mix(#fff,$uni-primary,80%);

// 辅助色
// 除了主色外的场景色，需要在不同的场景中使用（例如危险色表示危险的操作）。
$uni-success: #18bc37;
$uni-success-disable:mix(#fff,$uni-success,50%);
$uni-success-light: mix(#fff,$uni-success,80%);

$uni-warning: #f3a73f;
$uni-warning-disable:mix(#fff,$uni-warning,50%);
$uni-warning-light: mix(#fff,$uni-warning,80%);

$uni-error: #e43d33;
$uni-error-disable:mix(#fff,$uni-error,50%);
$uni-error-light: mix(#fff,$uni-error,80%);

$uni-info: #8f939c;
$uni-info-disable:mix(#fff,$uni-info,50%);
$uni-info-light: mix(#fff,$uni-info,80%);

// 中性色
// 中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。
$uni-main-color: #3a3a3a; 			// 主要文字
$uni-base-color: #6a6a6a;			// 常规文字
$uni-secondary-color: #909399;	// 次要文字
$uni-extra-color: #c7c7c7;			// 辅助说明

// 边框颜色
$uni-border-1: #F0F0F0;
$uni-border-2: #EDEDED;
$uni-border-3: #DCDCDC;
$uni-border-4: #B9B9B9;

// 常规色
$uni-black: #000000;
$uni-white: #ffffff;
$uni-transparent: rgba($color: #000000, $alpha: 0);

// 背景色
$uni-bg-color: #f7f7f7;

/* 水平间距 */
$uni-spacing-sm: 8px;
$uni-spacing-base: 15px;
$uni-spacing-lg: 30px;

// 阴影
$uni-shadow-sm:0 0 5px rgba($color: #d8d8d8, $alpha: 0.5);
$uni-shadow-base:0 1px 8px 1px rgba($color: #a5a5a5, $alpha: 0.2);
$uni-shadow-lg:0px 1px 10px 2px rgba($color: #a5a4a4, $alpha: 0.5);

// 蒙版
$uni-mask: rgba($color: #000000, $alpha: 0.4);
```

Example 2 (css):
```css
/* 需要放到文件最上面 */
@import '@/uni_modules/uni-scss/variables.scss';

/*
 以下变量是默认值，如不需要修改可以不用给下面的变量重新赋值
 */
// 主色
$uni-primary: #2979ff;
$uni-primary-disable:mix(#fff,$uni-primary,50%);
$uni-primary-light: mix(#fff,$uni-primary,80%);

// 辅助色
// 除了主色外的场景色，需要在不同的场景中使用（例如危险色表示危险的操作）。
$uni-success: #18bc37;
$uni-success-disable:mix(#fff,$uni-success,50%);
$uni-success-light: mix(#fff,$uni-success,80%);

$uni-warning: #f3a73f;
$uni-warning-disable:mix(#fff,$uni-warning,50%);
$uni-warning-light: mix(#fff,$uni-warning,80%);

$uni-error: #e43d33;
$uni-error-disable:mix(#fff,$uni-error,50%);
$uni-error-light: mix(#fff,$uni-error,80%);

$uni-info: #8f939c;
$uni-info-disable:mix(#fff,$uni-info,50%);
$uni-info-light: mix(#fff,$uni-info,80%);

// 中性色
// 中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。
$uni-main-color: #3a3a3a; 			// 主要文字
$uni-base-color: #6a6a6a;			// 常规文字
$uni-secondary-color: #909399;	// 次要文字
$uni-extra-color: #c7c7c7;			// 辅助说明

// 边框颜色
$uni-border-1: #F0F0F0;
$uni-border-2: #EDEDED;
$uni-border-3: #DCDCDC;
$uni-border-4: #B9B9B9;

// 常规色
$uni-black: #000000;
$uni-white: #ffffff;
$uni-transparent: rgba($color: #000000, $alpha: 0);

// 背景色
$uni-bg-color: #f7f7f7;

/* 水平间距 */
$uni-spacing-sm: 8px;
$uni-spacing-base: 15px;
$uni-spacing-lg: 30px;

// 阴影
$uni-shadow-sm:0 0 5px rgba($color: #d8d8d8, $alpha: 0.5);
$uni-shadow-base:0 1px 8px 1px rgba($color: #a5a5a5, $alpha: 0.2);
$uni-shadow-lg:0px 1px 10px 2px rgba($color: #a5a4a4, $alpha: 0.5);

// 蒙版
$uni-mask: rgba($color: #000000, $alpha: 0.4);
```

Example 3 (css):
```css
/* 需要放到文件最上面 */
@import '@/uni_modules/uni-scss/variables.scss';

/*
 以下变量是默认值，如不需要修改可以不用给下面的变量重新赋值
 */
// 主色
$uni-primary: #2979ff;
$uni-primary-disable:mix(#fff,$uni-primary,50%);
$uni-primary-light: mix(#fff,$uni-primary,80%);

// 辅助色
// 除了主色外的场景色，需要在不同的场景中使用（例如危险色表示危险的操作）。
$uni-success: #18bc37;
$uni-success-disable:mix(#fff,$uni-success,50%);
$uni-success-light: mix(#fff,$uni-success,80%);

$uni-warning: #f3a73f;
$uni-warning-disable:mix(#fff,$uni-warning,50%);
$uni-warning-light: mix(#fff,$uni-warning,80%);

$uni-error: #e43d33;
$uni-error-disable:mix(#fff,$uni-error,50%);
$uni-error-light: mix(#fff,$uni-error,80%);

$uni-info: #8f939c;
$uni-info-disable:mix(#fff,$uni-info,50%);
$uni-info-light: mix(#fff,$uni-info,80%);

// 中性色
// 中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。
$uni-main-color: #3a3a3a; 			// 主要文字
$uni-base-color: #6a6a6a;			// 常规文字
$uni-secondary-color: #909399;	// 次要文字
$uni-extra-color: #c7c7c7;			// 辅助说明

// 边框颜色
$uni-border-1: #F0F0F0;
$uni-border-2: #EDEDED;
$uni-border-3: #DCDCDC;
$uni-border-4: #B9B9B9;

// 常规色
$uni-black: #000000;
$uni-white: #ffffff;
$uni-transparent: rgba($color: #000000, $alpha: 0);

// 背景色
$uni-bg-color: #f7f7f7;

/* 水平间距 */
$uni-spacing-sm: 8px;
$uni-spacing-base: 15px;
$uni-spacing-lg: 30px;

// 阴影
$uni-shadow-sm:0 0 5px rgba($color: #d8d8d8, $alpha: 0.5);
$uni-shadow-base:0 1px 8px 1px rgba($color: #a5a5a5, $alpha: 0.2);
$uni-shadow-lg:0px 1px 10px 2px rgba($color: #a5a4a4, $alpha: 0.5);

// 蒙版
$uni-mask: rgba($color: #000000, $alpha: 0.4);
```

Example 4 (python):
```python
/* 需要放到文件最上面 */
@import '@/uni_modules/uni-scss/variables.scss';

/*
 以下变量是默认值，如不需要修改可以不用给下面的变量重新赋值
 */
// 主色
$uni-primary: #2979ff;
$uni-primary-disable:mix(#fff,$uni-primary,50%);
$uni-primary-light: mix(#fff,$uni-primary,80%);

// 辅助色
// 除了主色外的场景色，需要在不同的场景中使用（例如危险色表示危险的操作）。
$uni-success: #18bc37;
$uni-success-disable:mix(#fff,$uni-success,50%);
$uni-success-light: mix(#fff,$uni-success,80%);

$uni-warning: #f3a73f;
$uni-warning-disable:mix(#fff,$uni-warning,50%);
$uni-warning-light: mix(#fff,$uni-warning,80%);

$uni-error: #e43d33;
$uni-error-disable:mix(#fff,$uni-error,50%);
$uni-error-light: mix(#fff,$uni-error,80%);

$uni-info: #8f939c;
$uni-info-disable:mix(#fff,$uni-info,50%);
$uni-info-light: mix(#fff,$uni-info,80%);

// 中性色
// 中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。
$uni-main-color: #3a3a3a; 			// 主要文字
$uni-base-color: #6a6a6a;			// 常规文字
$uni-secondary-color: #909399;	// 次要文字
$uni-extra-color: #c7c7c7;			// 辅助说明

// 边框颜色
$uni-border-1: #F0F0F0;
$uni-border-2: #EDEDED;
$uni-border-3: #DCDCDC;
$uni-border-4: #B9B9B9;

// 常规色
$uni-black: #000000;
$uni-white: #ffffff;
$uni-transparent: rgba($color: #000000, $alpha: 0);

// 背景色
$uni-bg-color: #f7f7f7;

/* 水平间距 */
$uni-spacing-sm: 8px;
$uni-spacing-base: 15px;
$uni-spacing-lg: 30px;

// 阴影
$uni-shadow-sm:0 0 5px rgba($color: #d8d8d8, $alpha: 0.5);
$uni-shadow-base:0 1px 8px 1px rgba($color: #a5a5a5, $alpha: 0.2);
$uni-shadow-lg:0px 1px 10px 2px rgba($color: #a5a4a4, $alpha: 0.5);

// 蒙版
$uni-mask: rgba($color: #000000, $alpha: 0.4);
```

---

## uni.getLaunchOptionsSync() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/getLaunchOptionsSync.html

**Contents:**
- # uni.getLaunchOptionsSync()
  - # getLaunchOptionsSync 兼容性
      - 本页导读

获取启动时的参数。返回值与App.onLaunch的回调参数一致

默认提供 7 个渠道（Google、360、小米、华为、应用宝、vivo、oppo），更多可以在manifest.json文件中【源码视图】进行配置，详情

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 2 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 3 (unknown):
```unknown
仅微信小程序(2.20.0+)
```

Example 4 (unknown):
```unknown
仅抖音小程序(1.90.0+)
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-extension/index.html

**Contents:**
- # 自动化测试插件
- # 插件说明
- # 测试注意事项
- # 插件安装
- # 测试环境安装
    - # uni-app普通项目
    - # uniapp-cli项目
- # 创建测试用例
- # 测试运行
    - # 测试平台说明

本插件，用于在HBuilderX内运行uni-app自动化测试，支持H5、微信小程序、Android、iOS、Harmony自动化测试。

如下图所示，在插件市场，进入插件详情页 ，点击【导入插件】，会自动拉起本地安装的HBuilderX。

特别注意：插件安装，依赖HBuilderX 终端插件。

uni-app普通项目，初始化测试环境或运行测试时，如果未安装相关依赖，会自动安装。

如下图所示，项目管理器，选中项目，右键菜单【初始化测试环境】

注意：安装环境依赖时，如果检测到项目下不存在测试配置文件 env.js 和jest.config.js，则会自动创建测试配置文件。

uniapp-cli项目，自动化测试运行，将使用项目下的依赖库。

打开命令行，进入项目目录，输入如下命令进行安装:

示例源码如下，请查看 pre > code 标签中的内容

uni-app项目，pages页面，右键菜单，创建测试用例

创建测试用例之后，选中项目，右键菜单【运行uni-app自动化测试】，选择运行平台，即可开始运行测试。

注意：如果要运行指定的测试用例，请在项目管理器选中要运行的用例，右键菜单【运行当前测试用例】

如下图所示，运行测试时，支持选择对应平台。

点击菜单【设置】【插件配置】，找到hbuilderx-for-uniapp-test项，即可看到设置项。

uni-app自动化测试，使用了业内常见的jest测试库。

下面将使用一个最简单的示例，来讲解测试用例的组成。

示例源码如下，请查看 pre > code 标签中的内容

以uni-app【默认模板】index页面为例。

编写测试用例，检查index.vue页面，标题是否为Hello

示例源码如下，请查看 pre > code 标签中的内容

扩展：如上测试代码中，使用了beforeAll函数，它用于在所有测试之前执行。了解jest更多钩子函数

通常在编写测试时，您需要在测试运行之前进行一些设置工作，并且在测试运行之后需要进行一些完成工作。可以使用Jest的钩子函数来解决这个问题.

文档扩展: jest setup-teardown

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了更快速的编写测试用例，本插件内置了jest部分代码块

提醒：下面关于env.js的介绍，大部分情况下，自动化测试插件会自动修改，无需您手动调整。如果不确定，请勿修改。

通常，测试项目下有个测试配置文件env.js，内容如下:

示例源码如下，请查看 pre > code 标签中的内容

提示：大部分场景下，您不会用到UNI_TEST_CUSTOM_ENV。修改请慎重。

下面将对UNI_TEST_CUSTOM_ENV做介绍。

自动化测试插件 1.9.0版本新增UNI_TEST_CUSTOM_ENV, 用于读取自定义环境变量，并传递给uniapp自动化测试框架命令行。后期会随时扩充新的key。

示例源码如下，请查看 pre > code 标签中的内容

场景：电脑上安装了HBuilderX 正式版、Dev、Alpha版本，每个程序plugins目录都重新安装一遍测试依赖？答案：不需要。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-app普通项目
```

Example 2 (unknown):
```unknown
uniapp-cli项目
```

Example 3 (unknown):
```unknown
node-simctl
```

Example 4 (unknown):
```unknown
hbuilderx-for-uniapp-test
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/uni-scss.html

**Contents:**
      - 本页导读

uni.scss文件的用途是为了方便整体控制应用的风格。比如按钮颜色、边框风格，uni.scss文件里预置了一批scss变量预置。

uni-app 官方扩展插件（uni ui）及 插件市场 上很多三方插件均使用了这些样式变量，如果你是插件开发者，建议你使用 scss 预处理，并在插件代码中直接使用这些变量（无需 import 这个文件），方便用户通过搭积木的方式开发整体风格一致的App。

uni.scss是一个特殊文件，在代码中无需 import 这个文件即可在scss代码中使用这里的样式变量。uni-app的编译器在webpack配置中特殊处理了这个uni.scss，使得每个scss文件都被注入这个uni.scss，达到全局可用的效果。如果开发者想要less、stylus的全局使用，需要在vue.config.js中自行配置webpack策略。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
lang="scss"
```

Example 2 (html):
```html
<style lang="scss">
</style>
```

Example 3 (html):
```html
<style lang="scss">
</style>
```

Example 4 (html):
```html
<style lang="scss">
</style>
```

---

## uni.getEnterOptionsSync() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/getEnterOptionsSync

**Contents:**
- # uni.getEnterOptionsSync()
  - # getEnterOptionsSync 兼容性
      - 本页导读

各平台在启动时，参数获取存在差异，详细如下

默认提供 7 个渠道（Google、360、小米、华为、应用宝、vivo、oppo），更多可以在manifest.json文件中【源码视图】进行配置，详情

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 2 (unknown):
```unknown
HarmonyOS 4.81+
```

Example 3 (unknown):
```unknown
仅微信小程序(2.20.0+)
```

Example 4 (unknown):
```unknown
仅抖音小程序(1.90.0+)
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/vite-config

**Contents:**
- # 注意事项
      - 本页导读

vite.config.js 是一个可选的配置文件，如果项目的根目录中存在这个文件，那么它会被自动加载，一般用于配置 vite 的编译选项，具体规范参考：vite.config.js

必须引用 '@dcloudio/vite-plugin-uni' 并且添加到 plugins 中

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：在 HBuilderX 中读取 .env 环境变量可以通过 loadEnv 获取，注意第二个参数不要使用 processs.cwd()， 第二个参数需要填写配置文件所在的绝对路径： const env = loadEnv(mode, __dirname);

示例源码如下，请查看 pre > code 标签中的内容

发布时动态修改 manifest.json

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

Example 2 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

Example 3 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

Example 4 (python):
```python
import { defineConfig } from 'vite';
import uni from '@dcloudio/vite-plugin-uni';

export default defineConfig({
	plugins: [uni()],
});
```

---

## 原生组件说明 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/native-component

**Contents:**
  - # 原生组件说明
  - # 混合渲染模式下原生组件的使用限制
  - # 其他原生界面元素
  - # vue页面层级覆盖解决方案
  - # App的nvue页面层级问题
  - # Android系统主题字体对原生组件渲染的影响
      - 本页导读

小程序和App的vue页面，主体是webview渲染的。为了提升性能，小程序和App的vue页面下部分ui元素，比如导航栏、tabbar、video、map使用了原生控件。这种方式被称为混合渲染。

虽然提升了性能，但原生组件带来了其他问题：

H5、App的nvue页面，不存在混合渲染的情况，它们或者全部是前端渲染、或者全部是原生渲染，不涉及层级问题。

由于原生组件脱离在 WebView 渲染流程外，因此在使用时有以下限制：

可在组件中监听同层失败回调 bindrendererror 来判断

除了原生组件外，uni-app在非H5端还有其他原生界面元素，清单如下：

注意：app的nvue页面里的组件虽然不涉及map、video等原生组件的层级遮挡问题，但pages.json中配置的原生tabbar、原生navigationBar，一样是nvue里的组件也无法遮挡的。

为了解决webview渲染中原生组件层级最高的限制，uni-app提供了 cover-view 和 cover-image 组件，让其覆盖在原生组件上。

除了跨端的cover-view，App端还提供了3种方案：plus.nativeObj.view、subNVue、新开半透明nvue页面。详述如下

cover-view只能覆盖原生组件，不能覆盖其他原生界面元素。比如cover-view可以覆盖video、map，但无法覆盖原生导航栏、tabbar、web-view。

微信小程序在基础库 2.4.0 起已支持 video 组件的同层渲染，2.7.0 起支持 map 组件的同层渲染。可以被前端元素通过调节zindex来遮挡，也支持在scroll-view等组件中内嵌这2个原生组件。但video全屏时，仍需要cover-view覆盖。

app-vue的cover-view相比小程序端还有一些限制，1) 无法嵌套、 2) 无法内部滚动，即cover-view无法内部出现滚动条、 3) 无法覆盖到视频的全屏界面。 app-nvue的cover-view无这些限制。

另外cover-view无论如何都无法解决原生导航栏、tabbar、web-view组件的覆盖，为此App端补充了2个层级覆盖方案plus.nativeObj.view和subNVue

简称nview，它是一个原生的类画布的控件，其实cover-view也是用plus.nativeObj.view封装的。API文档详见：https://www.html5plus.org/doc/zh_cn/nativeobj.html#plus.nativeObj.View

plus.nativeObj.view的API比较原生，可以画出任何界面，但plus.nativeObj.view有3个问题：1. api很底层，开发比较复杂；2. 不支持动画；3. 不支持内部滚动。

subNVue是原生渲染的nvue子窗体，把一个nvue页面以半屏的方式覆盖在vue页面上。它解决了plus.nativeObj.view的不足，提供了强大的层级问题解决方案。subNVue的详细介绍见：https://ask.dcloud.net.cn/article/35948

uni-app支持在App端弹出半透明的nvue窗体。即看起来是在本窗体弹出一个元素，但实际上是弹出了一个部分区域蒙灰透明的新窗体。这样的窗体比subnvue有个优势就是可以全局复用。具体参考这个插件

subNVue或弹出部分区域透明的nvue页面，会比plus.nativeObj.view多占用一些内存。所以如果你要覆盖的内容很简单，cover-view或plus.nativeObj.view可以简单实现的话，就没必要用subNVue或nvue。

所以如果你的层级覆盖问题比较简单，不用嵌套，且有跨端需求，就使用cover-view。

如果App端cover-view无法满足需求，且需要覆盖的原生界面比较简单，可以用plus.nativeObj.view。否则，就使用subnvue或部分区域透明的nvue吧。

关于subNVue和Webview的层级问题 subNVue的层级高于前端元素，但多个subNVue以及Webview，它们之间的也存在层级关系。

默认规则是，先创建的subNVue或webview在底部，后创建的会盖住之前的。

当然每个subNVue和webview，都支持Style参数配置，其中有一个zindex属性，可以调节它们的层级。

nvue页面全部都是原生组件，互相之间没有层级问题。

但如果在pages.json里注册了原生导航栏和tabbar，nvue里的界面元素默认也无法覆盖这些，也需要plus.nativeObj.view或subNVue。

如果仅开发App，不跨端，不愿涉及层级问题，也可以不使用pages.json里的原生导航栏和tabbar，nvue页面不需要这些来强化性能。

在Android手机上，调整系统主题字体，所有原生渲染的控件的字体都会变化，而webview渲染的字体则不一定会变化，有的rom的系统webview会跟随变，有的不会变。

对于webview字体不会跟随rom变的情况，如果原生渲染和webview渲染出现在同一页面，就会发现字体不一致。

部分小程序通过修改了自带的webview内核，实现了webview也可以使用rom主题字体，比如微信、qq、支付宝。

app-nvue因为是原生渲染，没有字体不一致的问题。而app-vue下，在某些rom下，webview字体与系统字体不一致。

**Examples:**

Example 1 (unknown):
```unknown
bindrendererror
```

---

## package.json | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/package.html

**Contents:**
- # package.json
- # uni-app 属性
  - # 用法
  - # 示例：钉钉小程序
  - # 示例：微信服务号
      - 本页导读

uni-app 通过在package.json文件中增加uni-app扩展节点，可实现自定义条件编译平台。

注意只能扩展 web 和小程序平台，不能扩展 app 打包。并且扩展小程序平台时只能基于指定的基准平台扩展子平台，不能扩展基准平台。基准平台详见下文。

示例源码如下，请查看 pre > code 标签中的内容

如下是一个自定义钉钉小程序（MP-DINGTALK）的 package.json 示例配置（拷贝代码记得去掉注释）：

示例源码如下，请查看 pre > code 标签中的内容

开发者可在代码中使用MP-DINGTALK进行条件编译，如下：

示例源码如下，请查看 pre > code 标签中的内容

vue-cli开发者可通过如下命令，启动钉钉小程序平台的编译：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX会根据package.json的扩展配置，在运行、发行菜单下，生成自定义菜单（钉钉小程序），开发者点击对应菜单编译运行即可，如下图：

Tips：钉钉小程序编译目录依然是mp-alipay，需通过支付宝开发者工具，选择“钉钉小程序”，然后打开该目录进行预览及发布。

如下是一个自定义微信服务号平台（H5-WEIXIN）的示例配置：

示例源码如下，请查看 pre > code 标签中的内容

开发者可在代码块中使用H5-WEIXIN变量，如下：

示例源码如下，请查看 pre > code 标签中的内容

vue-cli开发者可通过如下命令，启动微信服务号平台（H5-WEIXIN）平台的编译：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX会根据package.json的扩展配置，在运行、发行菜单下，生成自定义菜单（微信服务号），开发者点击对应菜单编译运行即可，如下图：

**Examples:**

Example 1 (unknown):
```unknown
package.json
```

Example 2 (json):
```json
{
  /**
   * package.json其它原有配置
   * 拷贝代码后请去掉注释！
   */
  "uni-app": {
    // 扩展配置
    "scripts": {
      "custom-platform": {
        //自定义编译平台配置，可通过cli方式调用
        "title": "自定义扩展名称", // 在HBuilderX中会显示在 运行/发行 菜单中
        "browser": "", //运行到的目标浏览器，仅当UNI_PLATFORM为h5时有效
        "env": {
          //环境变量
          "UNI_PLATFORM": "", //基准平台
          "MY_TEST": "" // ... 其他自定义环境变量
        },
        "define": {
          //自定义条件编译
          "CUSTOM-CONST": true //自定义条件编译常量，建议为大写
        }
      }
    }
  }
}
```

Example 3 (json):
```json
{
  /**
   * package.json其它原有配置
   * 拷贝代码后请去掉注释！
   */
  "uni-app": {
    // 扩展配置
    "scripts": {
      "custom-platform": {
        //自定义编译平台配置，可通过cli方式调用
        "title": "自定义扩展名称", // 在HBuilderX中会显示在 运行/发行 菜单中
        "browser": "", //运行到的目标浏览器，仅当UNI_PLATFORM为h5时有效
        "env": {
          //环境变量
          "UNI_PLATFORM": "", //基准平台
          "MY_TEST": "" // ... 其他自定义环境变量
        },
        "define": {
          //自定义条件编译
          "CUSTOM-CONST": true //自定义条件编译常量，建议为大写
        }
      }
    }
  }
}
```

Example 4 (json):
```json
{
  /**
   * package.json其它原有配置
   * 拷贝代码后请去掉注释！
   */
  "uni-app": {
    // 扩展配置
    "scripts": {
      "custom-platform": {
        //自定义编译平台配置，可通过cli方式调用
        "title": "自定义扩展名称", // 在HBuilderX中会显示在 运行/发行 菜单中
        "browser": "", //运行到的目标浏览器，仅当UNI_PLATFORM为h5时有效
        "env": {
          //环境变量
          "UNI_PLATFORM": "", //基准平台
          "MY_TEST": "" // ... 其他自定义环境变量
        },
        "define": {
          //自定义条件编译
          "CUSTOM-CONST": true //自定义条件编译常量，建议为大写
        }
      }
    }
  }
}
```

---

## App Android@android | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/collocation/manifest-app

**Contents:**
  - # App Android
    - # enableResourceOptimizations
    - # aaptOptions
    - # buildFeatures
    - # enableOAID
  - # App iOS
    - # privacyRegisterMode
  - # App Harmony
  - # 完整 manifest.json
      - 本页导读

App-Android平台云端打包相关配置

HBuilderX4.33版本新增 enableResourceOptimizations 配置项

Android平台云端打包时配置是否开启Android原生res资源文件优化，开启后res资源文件名称会被混淆。

注意 HBuilder4.25及以上版本云端打包环境升级为Gradle 8.5，enableResourceOptimizations默认值为true，即开启原生res资源文件混淆 HBuilder4.25以下版本云端打包环境为Gradle 7.6.3，enableResourceOptimizations默认值为false，即关闭原生res资源文件混淆

Android平台云端打包时build.gradle的aaptOptions配置项，支持的属性参考：Android官方文档 ，如下示例源码：

示例源码如下，请查看 pre > code 标签中的内容

Android平台云端打包时build.gradle的buildFeatures配置项，支持的属性参考：Android官方文档 ，如下示例源码：

示例源码如下，请查看 pre > code 标签中的内容

获取OAID 需要使用移动智能设备标识公共服务平台 提供的统一SDK（以下简称OAID SDK），OAID SDK从1.0.26版本开始添加了授权证书校验机制（绑定应用包名），要求开发者通过邮件向“移动智能设备标识公共服务平台”申请授权证书并配置到App中。HBuilderX中暂未支持设置此授权证书，而是使用无需授权证书的1.0.13版本OAID SDK。 1.0.13版本OAID SDK在部分手机设备可能存在以下兼容性问题：

如果碰到以上问题在manifest.json的android节点下添加enableOAID字段设置云端打包不使用默认OAID SDK：

示例源码如下，请查看 pre > code 标签中的内容

为了统计应用的崩溃信息，应用在启动时需要获取IDFA/IDFV，虽然不影响苹果审核但是可能被部分合规检测机构判定为不合规。 需要通过隐私合规检测的应用可以将字段配置为manual，并且在用户点击同意隐私政策的方法里执行plus.runtime.argeePrivacy()，详情参考如何配置在用户同意隐私政策后使用IDFA。

在鸿蒙开发中不会读取app-plus 下配置的选项，在 app-harmony 节点下可以设置鸿蒙参数。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

Example 2 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

Example 3 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

Example 4 (json):
```json
"aaptOptions": [
    "noCompress 'png', 'jpg', 'jpeg'"  //配置禁止对 png、jpg、jpeg格式的文件进行压缩
]
```

---

## input | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/input.html

**Contents:**
- # input
  - # 属性说明
    - # type 有效值
    - # text-content-type 有效值
    - # confirm-type 有效值
    - # inputmode 有效值
  - # App平台iOS端软键盘上方横条去除方案
  - # 关于软键盘弹出的逻辑说明
  - # 关于软键盘收起的逻辑说明
  - # App平台原生输入框的说明

html规范中input不仅是输入框，还有radio、checkbox、时间、日期、文件选择功能。在uni-app规范中，input仅仅是输入框。其他功能uni-app有单独的组件或API：radio组件 、checkbox组件 、时间选择 、日期选择 、图片选择 、视频选择 、多媒体文件选择(含图片视频) 、通用文件选择 。

新增于 uni-app 3.6.16+ inputmode是html规范后期更新的内容。各家小程序还未支持此属性。

在符合条件的高版本webview里，uni-app的web和app-vue平台中可使用本属性。

app-vue在iOS上，webview中的软键盘弹出时，默认在软键盘上方有一个横条，显示着：上一项、下一项和完成等按钮。 如不想显示这个横条，可以配置softinputNavBar: 'none'

配置方式，在 pages.json 中某个页面或全局配置 style

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果是nvue页面，iOS默认就没有键盘上方的横条，无需任何设置。

App平台软键盘弹出有 adjustResize|adjustPan 两种模式，默认为 adjustPan 模式，小程序平台只支持 adjustPan 模式，H5平台因不同浏览器而异

配置方式，在 pages.json 中配置 style

示例源码如下，请查看 pre > code 标签中的内容

以上为默认逻辑，uni-app同时提供了隐藏软键盘的api：uni.hideKeyboard()

在app平台，有titleNView配置的searchinput原生输入框和plus.nativeObj.view的drawinput。这两种方式的输入框都是原生的，不是webview里的。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
compositionstart、compositionend、compositionupdate
```

Example 2 (unknown):
```unknown
cursor-color
```

Example 3 (unknown):
```unknown
app-plus vue
```

Example 4 (unknown):
```unknown
Chrome >= 66
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/faq/faq.html

**Contents:**
- # 插件购买相关
  - # 普通授权版和源码授权版有什么区别？
  - # 购买普通授权版之后可以升级为源码授权版吗？
  - # 为协作的应用购买插件后，如何绑定包名？
- # 插件使用相关
  - # 申请试用的插件有什么限制？
  - # 已经购买源码版，HBuilderX仍提示未购买
  - # 已经购买App原生插件，云打包仍提示未购买
      - 本页导读

可以升级。购买普通授权版之后，如果插件支持源码授权版，可以在插件详情操作升级，升级的费用为源码授权版减去普通授权版的差价。

如果为协作应用购买了插件，订单归属下单账号，但应用与插件的绑定关系归属应用所属账号。 只有应用所有者可以查看绑定关系，如果购买时未填写包名，需要使用应用所有者账号登录插件市场 来填写包名。

检查HBuilderX本地项目中的插件是否为之前导入的试用版本，如果是，请删除HBuilderX本地项目中该插件，并从插件市场重新导入源码版。

首先检查打包的appid及包名与购买插件绑定的appid及包名是否一致。如果检查一致无误，重新选择云端插件后再提交云打包，操作路径：HBuilderX项目manifest.json => 安卓/iOS原生插件配置 => 选择云端插件

---

## scroll-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/scroll-view.html

**Contents:**
- # scroll-view
- # 属性说明
- # 示例
  - # 自定义下拉刷新
- # webview中使用scroll-view的注意
- # 其他注意事项
      - 本页导读

需注意在webview渲染的页面中，区域滚动的性能不及页面滚动。

使用竖向滚动时，需要给 <scroll-view> 一个固定高度，通过 css 设置 height；使用横向滚动时，需要给<scroll-view>添加white-space: nowrap;样式。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，在webview渲染时，自定义下拉刷新的性能不及pages.json中配置的原生下拉刷新。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在app-uvue中，其实没有页面级滚动，scroll-view也不存在原生组件层级、下拉刷新性能问题。但app-uvue里使用长列表，请务必使用list-view组件，这个组件内置了recycle-view机制，不管列表多长，都可以通过回收不显示的列表来保证高性能。详见

**Examples:**

Example 1 (unknown):
```unknown
<scroll-view>
```

Example 2 (unknown):
```unknown
<scroll-view>
```

Example 3 (unknown):
```unknown
white-space: nowrap;
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title uni-common-mt">
				Vertical Scroll
				<text>\n纵向滚动</text>
			</view>
			<view>
				<scroll-view :scroll-top="scrollTop" scroll-y="true" class="scroll-Y" @scrolltoupper="upper"
					@scrolltolower="lower" @scroll="scroll">
					<view id="demo1" class="scroll-view-item uni-bg-red">A</view>
					<view id="demo2" class="scroll-view-item uni-bg-green">B</view>
					<view id="demo3" class="scroll-view-item uni-bg-blue">C</view>
				</scroll-view>
			</view>
			<view @tap="goTop" class="uni-link uni-center uni-common-mt">
				点击这里返回顶部
			</view>

			<view class="uni-title uni-common-mt">
				Horizontal Scroll
				<text>\n横向滚动</text>
			</view>
			<view>
				<scroll-view class="scroll-view_H" scroll-x="true" @scroll="scroll" scroll-left="120">
					<view id="demo1" class="scroll-view-item_H uni-bg-red">A</view>
					<view id="demo2" class="scroll-view-item_H uni-bg-green">B</view>
					<view id="demo3" class="scroll-view-item_H uni-bg-blue">C</view>
				</scroll-view>
			</view>
			<view class="uni-common-pb"></view>
		</view>
	</view>
</template>
```

---

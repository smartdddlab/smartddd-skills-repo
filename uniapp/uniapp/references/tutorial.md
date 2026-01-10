# Uniapp - Tutorial

**Pages:** 182

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment-weixin.html

**Contents:**
  - # 开通
  - # 配置
    - # 参数说明
  - # 服务器生成订单
  - # 应用内发起支付
    - # 订单对象参数说明
    - # 示例代码
      - 本页导读

更多信息详见微信官方文档 APP支付接入申请流程指引 ，服务器接入相关信息详见 APP支付接入前准备

在manifest.json文件“App模块配置”项的“Payment(支付)”下，勾选“微信支付”项

在 App 端调用支付前，需在业务服务器生成支付订单，可参考：

更多信息详见微信支付官方文档 APP支付统一下单

更多信息详见微信支付官方文档 APP支付调起支付接口

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "appid": "wx499********7c70e",  // 应用ID（AppID）
  "partnerid": "148*****52",      // 商户号（PartnerID）
  "prepayid": "wx202254********************fbe90000", // 预支付交易会话ID
  "package": "Sign=WXPay",        // 固定值
  "noncestr": "c5sEwbaNPiXAF3iv", // 随机字符串
  "timestamp": 1597935292,        // 时间戳（单位：秒）
  "sign": "A842B45937F6EFF60DEC7A2EAA52D5A0" // 签名，这里用的 MD5 签名
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('wxpay')) {
            uni.requestPayment({
                "provider": "wxpay",  //固定值为"wxpay"
                "orderInfo": orderInfo, 
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("支付成功");
                },
                fail: function (err) {
                    console.log('支付失败:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

Example 2 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "appid": "wx499********7c70e",  // 应用ID（AppID）
  "partnerid": "148*****52",      // 商户号（PartnerID）
  "prepayid": "wx202254********************fbe90000", // 预支付交易会话ID
  "package": "Sign=WXPay",        // 固定值
  "noncestr": "c5sEwbaNPiXAF3iv", // 随机字符串
  "timestamp": 1597935292,        // 时间戳（单位：秒）
  "sign": "A842B45937F6EFF60DEC7A2EAA52D5A0" // 签名，这里用的 MD5 签名
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('wxpay')) {
            uni.requestPayment({
                "provider": "wxpay",  //固定值为"wxpay"
                "orderInfo": orderInfo, 
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("支付成功");
                },
                fail: function (err) {
                    console.log('支付失败:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

Example 3 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "appid": "wx499********7c70e",  // 应用ID（AppID）
  "partnerid": "148*****52",      // 商户号（PartnerID）
  "prepayid": "wx202254********************fbe90000", // 预支付交易会话ID
  "package": "Sign=WXPay",        // 固定值
  "noncestr": "c5sEwbaNPiXAF3iv", // 随机字符串
  "timestamp": 1597935292,        // 时间戳（单位：秒）
  "sign": "A842B45937F6EFF60DEC7A2EAA52D5A0" // 签名，这里用的 MD5 签名
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('wxpay')) {
            uni.requestPayment({
                "provider": "wxpay",  //固定值为"wxpay"
                "orderInfo": orderInfo, 
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("支付成功");
                },
                fail: function (err) {
                    console.log('支付失败:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

Example 4 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "appid": "wx499********7c70e",  // 应用ID（AppID）
  "partnerid": "148*****52",      // 商户号（PartnerID）
  "prepayid": "wx202254********************fbe90000", // 预支付交易会话ID
  "package": "Sign=WXPay",        // 固定值
  "noncestr": "c5sEwbaNPiXAF3iv", // 随机字符串
  "timestamp": 1597935292,        // 时间戳（单位：秒）
  "sign": "A842B45937F6EFF60DEC7A2EAA52D5A0" // 签名，这里用的 MD5 签名
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('wxpay')) {
            uni.requestPayment({
                "provider": "wxpay",  //固定值为"wxpay"
                "orderInfo": orderInfo, 
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("支付成功");
                },
                fail: function (err) {
                    console.log('支付失败:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

---

## App平台调试指南 debug@app-debug | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/debug-app.html

**Contents:**
- # App平台调试指南 debug
  - # 打开调试窗口
  - # Elements
  - # console.log 打日志
  - # 调试页面
  - # 同步断点到调试器
  - # 注意事项
      - 本页导读

常规开发里，在 HBuilderX 的运行菜单里运行 App，手机端的错误或 console.log 日志信息会直接打印到控制台。

如果需要更多功能，比如审查元素、打断点 debug，则需要启动调试模式。自 HBuilderX 2.0.3+ 版本起开始支持 App 端的调试。

在 HBuilderX 中，正确运行项目： 运行 --> 运行到手机或模拟器 --> 选择设备，项目启动后，在下方的控制台选择 debug 图标。

根据上一步，启动完成debug窗口后，可以看到Elements。Elements 主要显示当前页面的组织结构，目前Elements只支持nvue。

console.log是我们日常开发最常用的调试方法，HBuilderX中当然也不能少。

App 端提供真机运行的console.log日志输出，运行到真机或模拟器时，不用点debug按钮，操作手机，会在HBuilderX的控制台直接输出日志。

如果是比较复杂的逻辑，那就推荐使用调试工具中的console了。根据上一步，启动完成debug窗口后，执行console.log方法就可以看到打印的内容了。

debug窗口中看console.log的方法如下图：

在调试窗口控制台的 Sources （图中指示 1） 栏，可以给 js 打断点调试。

在 uniapp（图中指示 2）下找到需要调试的页面，单击打开 ，在右侧可以看到我们需要调试的内容（图中指示 3）。在需要调试的代码行号的位置，点击打上断点（图中指示 4）。

之后，在设备上进行操作，进入断点位置，可以方便我们跟踪调试代码。

在控制台众多代码中寻找要调试的代码是比较麻烦的一件事，HBuilderX的调试还提供一个便利的功能，可直接在编辑器中打断点，断点会自动同步到调试工具中。

操作步骤：在 HBuilderX 编辑器中对目标行的行号处点右键，在右键菜单中选择“同步断点到调试器”，然后调试控制台会自动打开对应的代码并在指定行处标记断点。演示如下：

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 2.0.3+
```

Example 2 (php):
```php
运行 --> 运行到手机或模拟器 --> 选择设备
```

Example 3 (javascript):
```javascript
console.log
```

Example 4 (javascript):
```javascript
console.log
```

---

## 申请开通Google支付 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment-google.html

**Contents:**
    - # 申请开通Google支付
    - # 使用Google支付
    - # 示例
      - 本页导读

打开Google Pay | Google Developers 并登录谷歌账号。

进入控制台Sign up: Google Pay's Business Console 并设置商家名称。如图：

设置完成后进入控制台页面，并设置对应的商家资料。

当需要上线正式版的时候，app的签名秘钥指纹需要确保与Google Play注册的发布秘钥指纹一致。

支付参数 ​ 谷歌支付分为两种:CARD、PAYPAL付款方式，且不同付款方式配置并不相同，具体字段请参照谷歌支付官方字段说明

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
Google Play
```

Example 2 (unknown):
```unknown
tokenizationSpecificationType
```

Example 3 (unknown):
```unknown
PAYMENT_GATEWAY
```

Example 4 (unknown):
```unknown
tokenizationSpecificationType
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/i18n.html

**Contents:**
- # vue界面和js内容的国际化
- # nvue页面国际化
- # pages.json 国际化
- # 框架内置组件和API国际化
  - # 自动适配手机或浏览器语言
  - # 自定义国际化内容
- # manifest.json 国际化
- # 小程序国际化
- # 双向文字流
- # uniCloud国际化

uni-app的国际化，即多语言，分为应用部分和框架部分。

不同端的国际化方案也有差异，uni-app 自 3.1.5起，App 和 H5 支持框架国际化。小程序平台的国际化依赖于小程序平台框架自身。一般而言海外用户更多使用的是App和H5。

可以在HBuilderX新建项目里选择Hello i18n示例或者插件市场查看https://ext.dcloud.net.cn/plugin?id=6462 。

vue和js里的内容国际化是与web通行的方案。

main.js 引入并初始化 VueI18n

注意 推荐使用vue-i18n@9.1.9固定版本

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

页面模板中使用 $t() 获取，并传递国际化json文件中定义的key，js中使用 this.$t('')

示例源码如下，请查看 pre > code 标签中的内容

注意：页面中设置语言后需要调用 this.$i18n.locale = 'zh-Hans' 后生效

注意：nvue 国际化方案需要在每个页面单独引入uni-i18n。

示例源码如下，请查看 pre > code 标签中的内容

pages.json不属于vue页面，其中的原生tabbar和原生导航栏里也有文字内容。这部分内容的国际化方案如下：

项目根目录的locale目录下配置语言json文件，locale/语言地区代码.json，如：en.json，zh-Hans.json，zh-Hant.json

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

pages.json 支持以下属性配置国际化信息

注：小程序下不支持这种国际化方案，也可以使用设置tabbar和navigationbar的API来设置文字。或者废弃原生tabbar和navigationbar，使用自定义方式。

注：目前鸿蒙App 暂不支持 TabBar 国际化。

uni-app 有内置的基础组件，比如picker，或者与界面相关的API，比如showModal。这些界面包含的文字也需要国际化。

自 3.1.5 版本起，App和H5平台内置的基础组件和接口相关的文字内容支持国际化。

这部分国际化，提供了2种策略，有自动策略，也有自定义方案。

uni-app 基础组件和API，内置如下语言：

内置组件和接口显示会根据系统语言环境自动切换，未支持的系统语言环境会显示为英文。

uni-ui在1.4.8版本后也支持国际化

如果自动适配语言不满足你的需求，比如需要预置的5种语言外的更多语言。那么可以使用自定义方案。在指定目录创建指定文件，用同名词条来替换，语言地区代码请遵循 BCP47 规范。

项目根目录支持 locale 目录，locale/uni-app.语言地区代码.json，如：uni-app.en.json，uni-app.zh-Hans.json，uni-app.zh-Hant.json

示例源码如下，请查看 pre > code 标签中的内容

uni-app.zh-Hans.json 文件

示例源码如下，请查看 pre > code 标签中的内容

和 pages.json 一致，在项目根目录增加 locale/uni-app.语言地区代码.json 文件，然后在 manifest.json 中使用 %% 占位

示例源码如下，请查看 pre > code 标签中的内容

manifest.json 中支持配置应用默认语言，参见上面的示例，默认为auto，跟随系统OS的语言。

中东语言的文字大多从右向左 (RTL) 书写。但是，一般而言，最常用的形式为双向 (bidi) 文字 - 混用从左向右和从右向左书写的文字。bidi 文字的一个示例是含有阿拉伯语和英语文字的段落。在 uni-app 中，nvue 页面和 vue 页面以不同的方式控制。

注：大陆以外的终端用户访问uniCloud，开通阿里云的海外加速后可以提高访问速度。详见

uniCloud的 DB Schema 中涉及字段的显示名称、错误格式提示语，这些也需要国际化。

在项目根目录 uniCloud/database/locale/{数据库表名}/语言地区代码.json 文件，然后在 *.schema.json 文件中使用 %% 占位

示例源码如下，请查看 pre > code 标签中的内容

hello.schema.json 文件内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app App端sdk国际化依赖于sdk自身，一般而言推荐直接使用适配海外的SDK。

从HBuilder 3.4起，如下海外常用sdk均得到支持。

云打包详见https://ask.dcloud.net.cn/article/35860 离线打包自行在原生工程中配置。

uni-app内置了一批与国际化相关的API和生命周期。

可以得到设备OS的语言、运行宿主host的语言以及应用自身的语言。

当前应用语言发生变化时，触发回调。也就是uni.setLocale执行时。

语言代码通常为两个或三个字母，参考ISO 639 规范

语言代码-地区代码，地区代码为两个字母，参考ISO 3166-2 规范

HBuilderX 3.3 起，新建项目可以直接选择hello i18n模板，或者去插件市场查阅https://ext.dcloud.net.cn/plugin?id=6462

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.5.2 起，关于i18n国际化，uni-app pages.json和Vue页面 HBuilderX支持i18n相关代码提示、转到定义。

**Examples:**

Example 1 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

Example 2 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

Example 3 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

Example 4 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-uiwebview.html

**Contents:**
  - # 配置使用UIWebview模块
  - # 使用UIWebview
    - # 5+App（含wap2app）如何切换iOS默认使用UIWebview或WKWebview内核？
    - # uni-app 如何配置web-view组件默认使用UIWebview或WKWebview内核？
    - # 如何使用5+ API（plus.webview.create）创建Webview窗口时指定使用UIWebview或WKWebview内核？
  - # 使用WKWebview的影响
  - # uni-app中Webview的使用注意
    - # uni-app的nvue页面问题
  - # 三方SDK中UIWebview的使用
  - # 注意事项

iOS有UIWebview和WKWebview两种webview。从iOS13开始苹果将UIWebview列为过期API。

2020年4月起App Store将不再接受使用UIWebView的新App上架、2020年12月起将不再接受使用UIWebView的App更新。

从HBuilderX 2.2.5起，iOS上默认均已经是WKWebview，除非开发者手动在代码中指定要用UIWebview，否则实际渲染的页面都是在WKWebview里渲染的。 不过，虽然实际页面是WKWebview渲染的，但App底层引擎源码里仍然有UIWebview的可选引用。Appstore的机审会发现二进制代码中包括对UIWebview的引用，从而引发告警。 从HBuilderX 2.6.6起，uiWebview从基础引擎中移除，变成可选模块（manifest里选择）。机审也没有提示了。

老HBuilder和HBuilderX 2.2.5之前的版本，App端策略如下：

HBuilderX 2.2.5+版本已将iOS上所有webview的默认内核由UIWebview调整为WKWebview。

HBuilderX 2.6.6+版本已将iOS中所有UIWebview代码从基础引擎中摘除，独立为UIWebview模块，如继续使用UIWebview则需在manifest中勾选使用UIWebview模块

打开项目的manifest.json文件，在“App模块配置”中勾选“iOS UIWebview”：

使用UIWebview模块提交云端打包后才能生效，真机运行调试时请使用自定义基座 使用UIWebview模块后应用无法通过App Store审核 本地离线打包请参考：配置UIWebview模块

HBuilderX 2.2.5以前的版本，iOS上webview的默认为UIWebview，HBuilderX2.2.5及以后的版本默认改为WKWebview。 如果要修改默认值，可在manifest.json中配置。 在manifest.json文件源码视图中设置plus -> kernel -> ios 的值为 "WKWebview"或"UIWebview"：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 2.2.5以前的版本，iOS上vue页面中web-view组件或调用5+ API创建的Webview窗口默认为UIWebview，HBuilderX2.2.5及以后的版本默认改为WKWebview。 如果要修改默认值，可在manifest.json中配置。 在manifest.json文件源码视图中设置 app-plus -> kernel -> ios 的值为 "WKWebview"或"UIWebview"：

示例源码如下，请查看 pre > code 标签中的内容

nvue页面中的web-view组件强制使用WKWebview，不可配置

创建Webvie窗口时可通过kernel属性指定内核，如下：

示例源码如下，请查看 pre > code 标签中的内容

更多规范参考5+ API的 WebviewStyles

使用WKWebview替换UIWebview将会影响以下功能：

但WKWebview的好处是：节省内存；滚动时懒加载的图片也可以实时渲染，而uiwebview在滚动停止后懒加载的图片才能显示。

如果同时在一个app里使用ui和wk两种webview，注意2种webview之间的cookie、localstorage、session不共享，但plus.storage是共享的。

uni-app的js运行在独立的jscore中，而不是Webview中，不存在跨域问题。 uni-app的渲染层，在iOS下是强制wkwebview。如果你编写了renderjs代码，在渲染层执行js，则同样会遇到跨域问题。此时尽量把与跨域相关的操作放到普通的js逻辑层操作。 除了渲染层，还有一个web-view组件的问题要注意：

如果需要调整uni-app下web-view组件的渲染内核设置，将manifest.json源码视图的app-plus -> kernel -> ios 的值设为 UIWebview。

nvue页面不使用webview渲染，但其中的web-view组件说明如下。

目前如下SDK中仍然使用了UIWebview，不管是5+App还是uni-app。

5+App开发者建议直接升级为uni-app，一劳永逸，不会有跨域、白屏和无法加密等各种问题。

如果没有配置使用“iOS UIWebview”模块，提交App Store，仍然被提示含有UIWebview，那么请检查你的app是否使用了其他原生插件。 一般或者是配置错误，或者是三方原生插件造成。、

**Examples:**

Example 1 (json):
```json
"plus": {
		"kernel": {
			"ios": "UIWebview"    //或者 "WKWebview"
		},
		// ...
	}
```

Example 2 (json):
```json
"plus": {
		"kernel": {
			"ios": "UIWebview"    //或者 "WKWebview"
		},
		// ...
	}
```

Example 3 (json):
```json
"plus": {
		"kernel": {
			"ios": "UIWebview"    //或者 "WKWebview"
		},
		// ...
	}
```

Example 4 (json):
```json
"plus": {
		"kernel": {
			"ios": "UIWebview"    //或者 "WKWebview"
		},
		// ...
	}
```

---

## App Store上架 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/ios-app-store.html

**Contents:**
    - # App Store上架
      - 本页导读

再次说明：uni-app并不是简单的使用Webview套壳，Webview仅负责vue页面的UI渲染，nvue页面则完全由原生UI渲染，业务逻辑代码是运行在独立的JS引擎（JSCore）中，并且封装了很多JS API调用原生能力（OC代码实现），完全可以上架苹果应用市场。

苹果App Store上架审核规范比较细，提交审核前建议仔细阅读苹果官方App Store审核指南 。

使用广告标识（IDFA）相关说明：https://uniapp.dcloud.net.cn/tutorial/app-ios-idfa.html

UIWebview API 已废弃：https://ask.dcloud.net.cn/article/36348

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/snippet.html

**Contents:**
  - # Tag代码块
  - # JS代码块
    - # uni api代码块
    - # vue js代码块
    - # 其他常用js代码块
      - 本页导读

为提升开发效率，HBuilderX将 uni-app 常用代码封装成了以 u 开头的代码块，如在 template 标签内输入 ulist 回车，会自动生成如下代码：

示例源码如下，请查看 pre > code 标签中的内容

注意：需确保uni-list组件已保存在项目的components目录下。比较简单的方式，是新建项目时，选uni-ui项目模板，在里面即可随便敲所有u开头的代码块。如果你的项目不是uni-ui项目模板，那么你需要去插件市场手动把uni ui组件 下载到工程里。

代码块分为Tag代码块、JS代码块，如在 script 标签内输入 uShowToast 回车，会自动生成如下代码：

示例源码如下，请查看 pre > code 标签中的内容

几乎各种组件不管是内置组件还是uni-ui的组件，均已封装为代码块；使用HBuilderX打开uni-app项目中的.vue文件，在template区域敲u，代码助手会提示所有可见代码块列表。

你也可以在HBuilderX菜单-工具-代码块设置-vue代码块的左侧列表查阅所有已支持的代码块。

几乎各种常用js api，均已封装为代码块，在HBuilderX的js代码中敲u，代码助手会提示所有可见列表。也可在HBuilderX菜单-工具-代码块设置-js代码块的左侧列表查阅所有。

预置代码块不满足需求的话，可以自定义代码块，教程参考https://ask.dcloud.net.cn/article/35924

**Examples:**

Example 1 (html):
```html
<uni-list>
	<uni-list-item title="" note=""></uni-list-item>
	<uni-list-item title="" note=""></uni-list-item>
</uni-list>
```

Example 2 (html):
```html
<uni-list>
	<uni-list-item title="" note=""></uni-list-item>
	<uni-list-item title="" note=""></uni-list-item>
</uni-list>
```

Example 3 (html):
```html
<uni-list>
	<uni-list-item title="" note=""></uni-list-item>
	<uni-list-item title="" note=""></uni-list-item>
</uni-list>
```

Example 4 (unknown):
```unknown
<uni-list>
	<uni-list-item title="" note=""></uni-list-item>
	<uni-list-item title="" note=""></uni-list-item>
</uni-list>
```

---

## iOS原生应用配置文件和资源 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-nativeresource-ios

**Contents:**
- # iOS原生应用配置文件和资源
- # 配置文件 Info.plist
  - # iOS隐私信息访问描述配置
  - # iOS url scheme配置
  - # 应用可支持横竖屏列表配置
- # 应用资源
  - # 配置文件UniApp.entitlements
    - # 配置Associated Domains
  - # 配置文件PrivacyInfo.xcprivacy
  - # Bundle资源目录 （Bundle Resources）

app打包，在iOS原生开发中提供了配置 Info.plist 和 资源文件（Bundle Resources）。uni-app中对常用项进行了封装，提供了manifest.json 。

但manifest.json不能包含所有iOS的配置。

在HBuilderX 3.6.5以前，开发者如需使用manifest未封装的配置、或需自定义资源文件（Bundle Resources）内容，只能离线打包或开发App原生语言插件 。

HBuilderX3.6.5起，支持直接在应用项目中配置 iOS 平台的 Info.plist 和 资源文件（Bundle Resources）。

Info.plist文件是 XCode 工程配置文件，可在HBuilderX中项目中添加Info.plist文件，云端打包后将会合并到 XCode 工程生成 ipa。

在HBuilderX中，对项目根目录右键菜单 "新建" -> "自定义文件"

输入文件名称 Info.plist（注意大小写敏感），点击 “创建” 按钮新建文件

根据应用需求编辑添加需要的内容，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果应用需要修改隐私信息访问的许可描述，可根据需求在Info.plist文件中添加，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

注意 uni-app x项目manifest.json中没有提供iOS隐私信息访问许可描述的配置，需在此Info.plist中添加。 配置许可描述时需根据应用实际情况准确描述用途，否则提交AppStore审核可能被拒。

如果应用需要向系统注册url scheme，以便在浏览器中通过scheme打开App，可根据需求在Info.plist文件中添加CFBundleURLTypes数据，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app/uni-app x项目都支持通过此方式配置url scheme，uni-app项目还可通过manifest.json的可视化界面配置，参考iOS设置url scheme

如果希望自定义配置应用可支持的横竖屏列表，可根据需求在Info.plist文件中添加UISupportedInterfaceOrientations数据，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 项目同时也支持在 manifest.json 中配置 screenOrientation ，云端打包会与 Info.plist 中配置的值合并

HBuilderX中对项目右键菜单 "新建" -> "目录"

输入名称 nativeResources（注意大小写敏感），确定并创建目录。

在 XCode 中可以通过项目可视化界面编辑应用的Capabilities，实际上是操作项目的 entitlements 和 Info.plist 文件保存数据。在 HBuilderX 中暂未提供Capabilities可视化界面操作，需手动编辑UniApp.entitlements和Info.plist文件来实现相关配置。

在 nativeResources/ios 目录下创建UniApp.entitlements文件，用于配置 XCode 原生工程的Capabilities，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app/uni-app x 项目都可以通过编辑UniApp.entitlements文件配置Capabilities，需确保此entitlements文件格式正确，可以在 XCode 中编辑验证此文件。

在UniApp.entitlements添加com.apple.developer.associated-domains节点数据开启Associated Domains能力

示例源码如下，请查看 pre > code 标签中的内容

PrivacyInfo.xcprivacy用于配置应用隐私清单文件，详情参考uni-app/uni-app x如何配置隐私清单 。

在“ios”目录下创建“Resources”子目录，结构如下：

将需要添加的iOS原生资源文件拷贝到Resources目录，云端打包时将会合并到安装包的.app中。

ios目录下不支持放Object-C/Swift源码文件，需要开发源码建议使用UTS插件 或uni原生语言插件

resources目录中的资源文件不能通过uni API使用，需通过 iOS 原生 API 访问，参考Accessing a Bundle's Contents 。也就是在uni-app/uni-app x项目中这些资源需要通过uts代码访问，uni-app项目也可编写uni原生语言插件 访问

resources目录中已经保留使用以下文件，需注意避免冲突

uni-app/5+ App 项目 ├─Pandora //uni-app资源目录 │ └─apps //应用资源目录 │ └─[AppID] //使用DCloud AppID作为目录名称 ├─PandoraApi.bundle //uni-app SDK内置资源目录 ├─control.xml //uni-app模块配置文件 ├─dcloud_logo@2x.png //应用logo图片 ├─dcloud_logo@3x.png //应用logo图片 ├─uni-jsframework.js //uni-app vue2框架 ├─uni-jsframework-vue3.js //uni-app vue3框架 ├─uni-jsframework-dev.js //uni-app vue2框架（开发模式） ├─uni-jsframework-vue3-dev.js //uni-app vue3框架（开发模式） ├─unincomponents.ttf //uni-app内置字体图标 └─userPosition@2x.png //地图模块当前位置图标

uni-app x 项目 ├─uni-app-x //uni-app x 项目资源 ├─DCUniVideo //video组件目录 ├─uni_uts_toast_error.png //uni.showToast 使用的图标 └─uni_uts_toast_success.png //uni.showToast 使用的图标

应用资源目录配置需提交云端打包后才能生效，真机运行时请使用自定义调试基座

HBuilderX 4.71 及以上版本新增支持嵌入 Watch App

uni-app/uni-app x 本身还不支持直接用于开发 Watch App。如果已经存在使用 XCode 开发完成的 Watch App，可以将其添加到使用 uni-app/uni-app x 开发的主应用中，提交云端打包即可嵌入到 ipa 中提交。

在 uni-app/uni-app x 项目原生资源目录 “nativeResources” 的 “ios” 目录下创建 “Watch”子目录，并添加 Watch App 二级制文件，结构如下：

uni-app/uni-app x 中要添加的 Watch App 可执行文件。 需在原生 XCode 环境中添加 Watch Target，选择 “Watch App for Existing iOS App”，并在 XCode 中完成开发调试后编译并以发布方式导出包含此 Watch App 的 ipa 包，将 ipa 解压后在 Payload/XXX.app/Watch/ 目录下可以找到对应的 .app 文件。 将此 .app 文件添加到如上所示 uni-app/uni-app x 项目的 nativeResources -> ios -> Watch 目录中。

可选配置文件，仅在需要配置 Watch App 的包名和profile文件时使用，格式如下：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 5.0 及以上版本新增支持配置 ios-uts.json

在部分情况下，如果项目使用的 uts插件 无法修改源码（如从插件市场购买的非源码授权的插件），可通过 ios-uts.json 文件修改配置。 在 uni-app/uni-app x 项目原生资源目录 “nativeResources” 的 “ios” 目录下创建 “ios-uts.json”文件，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

每个uts插件配置项以插件标识（uts插件目录名称）为 key，值为 json 格式数据。

可通过 json 格式中的 identifier 字段配置 uts插件 云端打包使用的 Bundle Identifier。 如下示例配置uts-myutsplugin插件的 Bundle Identifier 为 com.my.custom：

示例源码如下，请查看 pre > code 标签中的内容

如果没有配置则根据插件标识自动生成，默认值为 "io.dcloud.uts.unimodule" + 插件标识首字母大写。 如插件标识为 uts-myutsplugin，默认的 Bundle Identifier 为 io.dcloud.uts.unimoduleUtsMyutsplugin。

离线打包时应用清单文件和资源需要开发者手动合并到XCode原生工程中。

**Examples:**

Example 1 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

Example 2 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

Example 3 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

Example 4 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

---

## 全局配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-api.html

**Contents:**
- # 全局配置
- # 全局 API
- # 选项
- # 生命周期
- # 实例属性
- # 实例方法
- # 模板指令
- # 特殊属性
- # 内置组件
- # 全局变量

实现全局变量的方式需要遵循 Vue 单文件模式的开发规范。详细参考：uni-app全局变量的几种实现方式 。

Vue 组件编译到小程序平台的时候会编译为对应平台的组件，部分小程序平台支持 options 选项（具体选项参考对应小程序平台文档的自定义组件部分），一般情况默认即可，如有特殊需求可在 Vue 组件中增加 options 属性。

示例源码如下，请查看 pre > code 标签中的内容

在 onLoad 里得到，onLoad 的参数是其他页面打开当前页面所传递的数据。

uni-app 内置了 Vuex ，在app里的使用，可参考 hello-uniapp store/index.js。

示例源码如下，请查看 pre > code 标签中的内容

由于 onError 并不是完整意义的生命周期，所以只提供一个捕获错误的方法，在 app 的根组件上添加名为 onError 的回调函数即可。如下：

示例源码如下，请查看 pre > code 标签中的内容

当重复设置某些属性为相同的值时，不会同步到view层。 例如：每次将scroll-view组件的scroll-top属性值设置为0，只有第一次能顺利返回顶部。 这和props的单向数据流特性有关，组件内部scroll-top的实际值改动后，其绑定的属性并不会一同变化。

解决办法有两种（以scroll-view组件为例）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第二种解决方式在某些组件可能造成抖动，推荐第一种解决方式。

**Examples:**

Example 1 (bash):
```bash
this.$parent
```

Example 2 (bash):
```bash
this.$parent.$parent
```

Example 3 (bash):
```bash
this.$children
```

Example 4 (bash):
```bash
this.$children.$children
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-schemes.html

**Contents:**
  - # 设置UrlSchemes
  - # 浏览器中通过href启动应用
  - # App中处理scheme启动传递的参数
      - 本页导读

iOS系统中，由于沙盒的限制，导致程序之间相互隔离，需要url scheme协议来实现程序间的通信，通过定义自己的scheme协议，可以非常方便的实现其它三方App调用你的App。

HBuilderX自带标准真机运行基座的UrlSchemes为"hbuilder://"，方便开发者调测。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “iOS设置” -> “UrlSchemes” 项中进行设置：

注意： 字符串建议使用小写字母（不要使用特殊字符、中文等），如设置为"test"，那么其他App呼起你的app的scheme协议就是"test://"； 多个scheme使用 "," 分割，每个字符串为一个urltypes； 如果可视化界面无法编辑，请切换到“源码视图”删除urltypes节点数据重新操作。

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注：为了向下兼容，HBuilderX源码视图配置时schemes属性值支持字符串数组，上面示例中的值也可以这么配置["hbuilder","myuniapp"]

安装应用后，我们可以在H5页面中，通过href直接调用应用：

示例源码如下，请查看 pre > code 标签中的内容

当其它三方App通过scheme启动App时，可以通过plus.runtime.arguments获取完整的urlscheme字符串。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

---

## uni-app组成和跨端原理 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/

**Contents:**
- # uni-app组成和跨端原理
- # 基本语言和开发规范
- # 编译器
- # 运行时（runtime）
  - # 逻辑层和渲染层分离
      - 本页导读

uni-app代码编写，基本语言包括js、vue、css。以及ts、scss等css预编译器。

在app端，还支持原生渲染的nvue，以及可以编译为kotlin和swift的uts 。

DCloud还提供了使用js编写服务器代码的uniCloud云引擎。所以只需掌握js，你可以开发web、Android、iOS、各家小程序以及服务器等全栈应用。

为了实现多端兼容，综合考虑编译速度、运行性能等因素，uni-app 约定了如下开发规范：

uni-app分编译器和运行时（runtime）。uni-app能实现一套代码、多端运行，是通过这2部分配合完成的。

编译器将开发者的代码进行编译，编译的输出物由各个终端的runtime进行解析，每个平台（Web、Android App、iOS App、各家小程序）都有各自的runtime。

示例源码如下，请查看 pre > code 标签中的内容

runtime不是运行在电脑开发环境，而是运行在真正的终端上。

uni-app在每个平台（Web、Android App、iOS App、各家小程序）都有各自的runtime。这是一个比较庞大的工程。

uni-app runtime包括3部分：基础框架、组件、API。

DCloud还提供了插件市场 ，大多数用得着的组件和API都已经有现成的插件。

在web平台，逻辑层（js）和渲染层（html、css），都运行在统一的webview里。

但在小程序和app端，逻辑层和渲染层被分离了。

分离的核心原因是性能。过去很多开发者吐槽基于webview的app性能不佳，很大原因是js运算和界面渲染抢资源导致的卡顿。

不管小程序还是app，逻辑层都独立为了单独的js引擎，渲染层仍然是webview（app上也支持纯原生渲染）。

所以注意小程序和app的逻辑层都不支持浏览器专用的window、dom等API。app只能在渲染层操作window、dom，即renderjs。

关于逻辑层和渲染层分离带来的注意事项，请详读

**Examples:**

Example 1 (unknown):
```unknown
运行时（runtime）
```

Example 2 (javascript):
```javascript
// #ifdef  App
console.log("这段代码只有在App平台才会被编译进去。非App平台编译后没有这段代码")
// #endif
```

Example 3 (javascript):
```javascript
// #ifdef  App
console.log("这段代码只有在App平台才会被编译进去。非App平台编译后没有这段代码")
// #endif
```

Example 4 (javascript):
```javascript
// #ifdef  App
console.log("这段代码只有在App平台才会被编译进去。非App平台编译后没有这段代码")
// #endif
```

---

## 绝对路径和相对路径 @absolute-path-relative-path | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-path.html

**Contents:**
  - # 绝对路径和相对路径
    - # 绝对路径
    - # 相对路径
      - 本页导读

在日常开发中，经常会遇到使用绝对路径还是相对路径的问题，下面我们介绍下这两种路径。

绝对路径：是指从项目根目录开始的完整路径。它用于指定文件或目录的确切位置。绝对路径通常以斜杠（/）开头，表示从根目录开始。

示例源码如下，请查看 pre > code 标签中的内容

这里的/static/logo.png就是一个绝对路径，表示图片文件位于项目根目录下的 static 文件夹中。

绝对路径的优点是可以直接定位到文件的确切位置，不受当前目录的影响，通常需要动态传递的路径，我们建议使用绝对路径。

相对路径：在编译时是指一个文件或目录相对于另一个文件或目录的位置，在运行时是指一个文件相对于当前页面路由的位置（不建议使用运行时的相对路径，应该优先使用绝对路径）。

组件 components/custom/custom.vue

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (vue):
```vue
<template>
  <!-- 图片组件引用绝对路径 -->
  <image src="/static/logo.png" />
  <!-- 视频组件引用绝对路径  -->
  <video src="/static/demo.mp4" />
  <!-- 其他需要引用资源的媒体组件均可以使用绝对路径 -->
</template>
<script setup>
// 使用一个图片资源时，可以使用绝对路径
uni.getImageInfo({
  src: "/static/logo.png",
});
// 跳转页面时，可以使用绝对路径
uni.navigateTo({
  url: "/pages/login/login",
});
</script>
```

Example 2 (vue):
```vue
<template>
  <!-- 图片组件引用绝对路径 -->
  <image src="/static/logo.png" />
  <!-- 视频组件引用绝对路径  -->
  <video src="/static/demo.mp4" />
  <!-- 其他需要引用资源的媒体组件均可以使用绝对路径 -->
</template>
<script setup>
// 使用一个图片资源时，可以使用绝对路径
uni.getImageInfo({
  src: "/static/logo.png",
});
// 跳转页面时，可以使用绝对路径
uni.navigateTo({
  url: "/pages/login/login",
});
</script>
```

Example 3 (vue):
```vue
<template>
  <!-- 图片组件引用绝对路径 -->
  <image src="/static/logo.png" />
  <!-- 视频组件引用绝对路径  -->
  <video src="/static/demo.mp4" />
  <!-- 其他需要引用资源的媒体组件均可以使用绝对路径 -->
</template>
<script setup>
// 使用一个图片资源时，可以使用绝对路径
uni.getImageInfo({
  src: "/static/logo.png",
});
// 跳转页面时，可以使用绝对路径
uni.navigateTo({
  url: "/pages/login/login",
});
</script>
```

Example 4 (vue):
```vue
<template>
  <!-- 图片组件引用绝对路径 -->
  <image src="/static/logo.png" />
  <!-- 视频组件引用绝对路径  -->
  <video src="/static/demo.mp4" />
  <!-- 其他需要引用资源的媒体组件均可以使用绝对路径 -->
</template>
<script setup>
// 使用一个图片资源时，可以使用绝对路径
uni.getImageInfo({
  src: "/static/logo.png",
});
// 跳转页面时，可以使用绝对路径
uni.navigateTo({
  url: "/pages/login/login",
});
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-apple.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用苹果登录
    - # 登录按钮样式
    - # 示例代码
  - # 注意事项
      - 本页导读

根据苹果审核指南要求，如果 App 使用第三方或社交登录服务 (例如，Facebook 登录、Google 登录、通过 Twitter 登录、通过 LinkedIn 登录、通过 Amazon 登录或微信登录) 来对其进行设置或验证这个 App 的用户主帐户，则该 App 必须同时提供“通过 Apple 登录”作为同等选项。详情参考：App Store 审核指南 - 通过 Apple 登录

HBuilderX2.4.7+版本新增支持苹果登录（Sign in with Apple，苹果登录是** iOS13** 新增加的功能，当你的应用使用了第三方登录比如微信登录，同时也需要集成苹果登录，否则提交AppStore审核会被拒绝

使用苹果登录首先需要在苹果开发者后台开启 App 的 Sign In with Apple 服务：

注：只有发布Appstore的应用才能使用苹果登录。企业版开发者账号不支持 Sign In with Apple （企业版开发者账号指的是用于企业内部分发App，不能用于发布 App Store 的账号，也就是价格为 299$ 的账号）

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“苹果登录（Sign in with Apple）”：

苹果对登录按钮样式有要求，请按照苹果要求统一设置登录按钮的样式，否则审核可能会被拒绝，注意以下事项：

下面是原生端默认的几种按钮样式供大家参考（width:130pt, height:30pt, corner radius: 6pt）

注：因为是 iOS13+ 系统才支持苹果登录，所以建议在App的界面入口判断下，只有 iOS13 才显示Apple登录的选项

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
苹果登录（Sign in with Apple
```

Example 2 (unknown):
```unknown
Sign In with Apple
```

Example 3 (unknown):
```unknown
Capabilities
```

Example 4 (unknown):
```unknown
Sign In with Apple
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-webview-error.html

**Contents:**
  - # 设置自定义错误页面
  - # 错误页面中监听事件
  - # 运行时动态设置自定义错误页面
  - # 常见问题
      - 本页导读

当webview组件(窗口)加载错误地址（如本地页面不存在）或者访问网络资源失败（如无法访问网络）时会自动显示默认错误页面：

如需修改默认错误页面样式，可以通过以下方法自定义Webview的404等错误页面。

打开项目的manifest.json文件，在 “App常用其它设置” -> “自定义404错误页面” 下点击 “浏览” 选择页面文件：

注：建议使用html文件，并放到项目根目录下的 hybrid/html 文件夹中

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置错误页面路径，推荐使用本地地址，相对于应用根目录；设置 url 属性值为 "none" 表示关闭自定义错误页面功能，加载页面错误时显示系统默认错误页面内容。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

其中url地址推荐使用本地地址，相对于应用根目录。 设置为“none”则关闭跳转到错误页面功能，此时页面显示Webview默认的错误页面内容。

自定义404错误页面时，可能需要在 error.html 页面中获取错误原因，可以通过以下方法监听 "error" 事件获取完整错误信息，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

如果需要单独自定义某个Webview窗口的错误页面，则需要在创建时通过WebviewStyle 对象的errorPage属性控制:

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"app-plus": {
    "error": {
      "url": "hybrid/html/error.html"
    },
    //...
  },
  //...
```

Example 2 (json):
```json
"app-plus": {
    "error": {
      "url": "hybrid/html/error.html"
    },
    //...
  },
  //...
```

Example 3 (json):
```json
"app-plus": {
    "error": {
      "url": "hybrid/html/error.html"
    },
    //...
  },
  //...
```

Example 4 (json):
```json
"app-plus": {
    "error": {
      "url": "hybrid/html/error.html"
    },
    //...
  },
  //...
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-privacyinfo.html

**Contents:**
- # 什么是隐私清单？
- # uni-app/uni-app x如何配置隐私清单
- # 原生语言插件及UTS插件如何配置隐私清单
  - # 原生语言插件及UTS插件配置PrivacyInfo.xcprivacy文件
  - # xcframework格式的SDK库配置隐私清单
- # 制作隐私清单文件PrivacyInfo.xcprivacy
  - # 隐私清单文件中键值对说明
    - # NSPrivacyAccessedAPITypes必要理由API的示例
    - # NSPrivacyCollectedDataTypes隐私数据采集的示例
  - # PrivacyInfo.xcprivacy文件示例

HBuilderX 4.08正式版本2024年4月24日更新云端打包机支持 uni-app 项目配置隐私清单 HBuilderX 4.13及以上版本开始支持 uni-app x 项目配置隐私清单

在 2023 年 6 月的全球开发者大会（WWDC23）上，Apple 宣布了一系列关于 App Store 提交隐私更新 的新政策。这些更新旨在增强应用程序在用户数据收集和使用方面的透明度，从而更好地保护用户的隐私权益。

简单的说隐私清单是一个属性列表，记录您的应用程序或第三方SDK使用的API的原因以及使用/收集的隐私数据类型。

从2024年5月1日开始，任何未在隐私清单文件中描述 必要理由API（use of required reason API） 使用情况的应用程序，都将无法通过 App Store Connect 的审核，而隐私数据使用描述(data use in privacy manifests)目前不会触发审核问题，但建议开发者以及插件作者尽早适配隐私清单，如实填写数据使用描述

通常情况你无需额外配置隐私清单，uni-app/uni-app x 框架中涉及隐私清单的功能模块 DCloud 会根据应用配置自动生成，更新到HBuilderX到最新版本重新提交云端打包即可。 在以下情况可能需要你补充隐私清单：

这时需要你根据实际情况制作补充隐私清单文件PrivacyInfo.xcprivacy，详情可参考制作隐私清单文件PrivacyInfo.xcprivacy。 将制作的隐私清单文件PrivacyInfo.xcprivacy保存在项目的 nativeResources/ios 目录，详情如下：

添加或编辑隐私清单文件PrivacyInfo.xcprivacy后需提交云端打包后才能生效

仅插件作者需关心此章节内容，插件使用者可跳过此章节

原生语言插件及UTS插件作者应该根据根据插件的实际情况配置好隐私清单，避免插件使用者手动补充隐私清单，配置后云端打包会自动合并处理隐私清单。

插件依赖的 xcframework 格式SDK库涉及的隐私清单可以通过签名内置 PrivacyInfo.xcprivacy 文件，而其它格式的SDK库(如.framework、.a等)或插件源码涉及的隐私清单需要在插件包里内置PrivacyInfo.xcprivacy 文件

原生语言插件 在 ios 目录下添加 PrivacyInfo.xcprivacy 文件，详情如下：

UTS插件 在 utssdk/app-ios 目录下添加 PrivacyInfo.xcprivacy 文件，详情如下：

xcframework库需在 xcode 环境中进行配置：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

隐私清单文件PrivacyInfo.xcprivacy是 PropertyList 格式文件，建议在XCode中创建并编辑，完成后保存使用。

如应用中用到了UserDefaults相关的API则按如下示例填写：

如应用中需要用户输入手机号则按如下示例填写：

以下是PrivacyInfo.xcprivacy文件示例，仅作为参考，实际使用需删除注释内容：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.13版本开始我们在原生示例工程里内置了默认的PrivacyInfo.xcprivacy 文件，开发者可根据自身项目情况编辑后重新出包 参考：uniMPSDK隐私清单 、离线SDK隐私清单

**Examples:**

Example 1 (unknown):
```unknown
必要理由API（use of required reason API）
```

Example 2 (unknown):
```unknown
隐私数据使用描述(data use in privacy manifests)
```

Example 3 (unknown):
```unknown
PrivacyInfo.xcprivacy
```

Example 4 (unknown):
```unknown
PrivacyInfo.xcprivacy
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-share

**Contents:**
      - 本页导读

App端Share(分享)模块封装了市场上主流的三方分享SDK，提供JS API统一调用分享功能。

uni-app项目中，官方提供了封装好的uni-share 插件方便开发者使用。

使用分享功能需在项目manifest.json的“App模块配置”中勾选“Share(分享)”，并根据项目实际情况勾选使用的三方分享平台：

提示：三方分享模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## uni-app x 下的 uni 统计使用教程 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-stat-uniappx.html

**Contents:**
- # uni-app x 下的 uni 统计使用教程
- # 配置 uni统计后台
- # 前端配置
  - # 配置说明
    - # uniStatistics说明
    - # collectItems 采集项配置说明
  - # 如何引用
  - # 如何使用
    - # 使用示例
  - # 影响范围

注意：当前版本 uni 统计仅支持 uni-app x ,与 uni统计1.0和uni统计2.0 数据不兼容。

uni统计for uni-app x需要单独下载使用，无需在 manifest.json 中配置开关，只需在前端代码中配置即可。

依赖 Hbuilder X Alpha版 4.33+。

与uni统计2.0后台配置一样，只是数据不互通，详情参考 创建 admin 项目

因为当前版本 uni统计是单独的插件，需要在插件市场中下载使用

在 main.uts 中 ，通过vue插件的方式加载 uni统计

示例源码如下，请查看 pre > code 标签中的内容

因版本限制，uni统计无法自动采集应用相关的数据，如应用启动、进入后台、进入前台等信息，需要用户手动调用 uni.report() 来实现对应的数据采集。

示例源码如下，请查看 pre > code 标签中的内容

uni-app-launch 是整个统计的入口，会采集应用启动的相关数据会影响的统计数据为：

uni-app-show 是应用从后台进入前台调用，会影响：

uni-app-hide 是应用从前台进入后台调用，会影响：

**Examples:**

Example 1 (unknown):
```unknown
Hbuilder X Alpha版 4.33+
```

Example 2 (javascript):
```javascript
import App from './App.uvue'
import { createSSRApp } from 'vue'

// 引入uni统计插件
import { uniStat } from '@/uni_modules/uni-stat/plugin.uts'

// uni统计采集项配置
const uniStatcollectItems = {
 uniStatPageLog: true
}

// uni统计基础配置
const uniStatOptions = {
 debug: true,
 collectItems: uniStatcollectItems
}

export function createApp() {
 const app = createSSRApp(App)

 // 载入uni统计插件 ，use 第二个参数不能为空，如需使用默认配置，请传入 {}
 app.use(uniStat, uniStatOptions)

 return {
  app
 }
}
```

Example 3 (javascript):
```javascript
import App from './App.uvue'
import { createSSRApp } from 'vue'

// 引入uni统计插件
import { uniStat } from '@/uni_modules/uni-stat/plugin.uts'

// uni统计采集项配置
const uniStatcollectItems = {
 uniStatPageLog: true
}

// uni统计基础配置
const uniStatOptions = {
 debug: true,
 collectItems: uniStatcollectItems
}

export function createApp() {
 const app = createSSRApp(App)

 // 载入uni统计插件 ，use 第二个参数不能为空，如需使用默认配置，请传入 {}
 app.use(uniStat, uniStatOptions)

 return {
  app
 }
}
```

Example 4 (javascript):
```javascript
import App from './App.uvue'
import { createSSRApp } from 'vue'

// 引入uni统计插件
import { uniStat } from '@/uni_modules/uni-stat/plugin.uts'

// uni统计采集项配置
const uniStatcollectItems = {
 uniStatPageLog: true
}

// uni统计基础配置
const uniStatOptions = {
 debug: true,
 collectItems: uniStatcollectItems
}

export function createApp() {
 const app = createSSRApp(App)

 // 载入uni统计插件 ，use 第二个参数不能为空，如需使用默认配置，请传入 {}
 app.use(uniStat, uniStatOptions)

 return {
  app
 }
}
```

---

## 模板内引入静态资源 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-static-assets.html

**Contents:**
  - # 模板内引入静态资源
  - # css 引入静态资源
  - # js/uts 引入静态资源
  - # 静态资源引入注意事项
  - # 静态资源编译规则
      - 本页导读

template内引入静态资源，如image、video等标签的src属性时，可以使用相对路径或者绝对路径，形式如下

示例源码如下，请查看 pre > code 标签中的内容

css文件或style标签内引入css文件时（scss、less 文件同理），可以使用相对路径或绝对路径（HBuilderX 2.6.6）

示例源码如下，请查看 pre > code 标签中的内容

css文件或style标签内引用的图片路径可以使用相对路径也可以使用绝对路径，需要注意的是，有些小程序端 css 文件不允许引用本地文件（请看注意事项）。

示例源码如下，请查看 pre > code 标签中的内容

js/uts中引入静态资源，多用于静态资源存放在非 static 目录中的情况，可以使用 import 引入相对路径或绝对路径

例：有如下目录结构 ，在static 和页面文件夹下分别有静态资源

示例源码如下，请查看 pre > code 标签中的内容

正常情况下，如 image 的 src 中直接引入 static 中 logo.png ，可以使用相对路径或绝对路径

示例源码如下，请查看 pre > code 标签中的内容

而引入 index 下的 icon.png 不管是相对还是绝对路径，都无法显示，所以这时候需要在 js/uts 中 使用 import 来引入

示例源码如下，请查看 pre > code 标签中的内容

通常项目中规定根目录下的 static 为静态资源文件夹（目前暂不支持修改），资源存放此处后，可在任意文件直接使用相对或者绝对路径引用,具体参考上述模板 css/js/uts 中引入静态资源的说明。

而非 static 目录的静态资源，不支持直接引用，需要在 js/uts 中使用 import 来引入，确保路径正确。

综上所述，我们总结一下静态资源引用的注意事项：

项目 static 目录下的静态资源，会被直接拷贝到编译后目录的 static 目录下。

非static目录下的静态资源在vue3下，被引用的资源会编译到 assets 目录下，并重新命名为 原始名称+内容hash,如：logo.png 会编译为类似 logo.cfd8fa94.png 的名称。如果该静态资源未被引用，则不会被编译器处理。

非static目录下的静态资源在vue2不同平台下，编译规则有些不同：

自 HBuilderX 4.0 起已和 vue3 保持一致

**Examples:**

Example 1 (html):
```html
<!-- 绝对路径，/static指根目录下的static目录，在cli项目中/static指src目录下的static目录 -->
<image class="logo" src="/static/logo.png"></image>
<image class="logo" src="@/static/logo.png"></image>
<!-- 相对路径 -->
<image class="logo" src="../../static/logo.png"></image>
```

Example 2 (html):
```html
<!-- 绝对路径，/static指根目录下的static目录，在cli项目中/static指src目录下的static目录 -->
<image class="logo" src="/static/logo.png"></image>
<image class="logo" src="@/static/logo.png"></image>
<!-- 相对路径 -->
<image class="logo" src="../../static/logo.png"></image>
```

Example 3 (html):
```html
<!-- 绝对路径，/static指根目录下的static目录，在cli项目中/static指src目录下的static目录 -->
<image class="logo" src="/static/logo.png"></image>
<image class="logo" src="@/static/logo.png"></image>
<!-- 相对路径 -->
<image class="logo" src="../../static/logo.png"></image>
```

Example 4 (jsx):
```jsx
<!-- 绝对路径，/static指根目录下的static目录，在cli项目中/static指src目录下的static目录 -->
<image class="logo" src="/static/logo.png"></image>
<image class="logo" src="@/static/logo.png"></image>
<!-- 相对路径 -->
<image class="logo" src="../../static/logo.png"></image>
```

---

## 调用鸿蒙原生API | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/native-api.html

**Contents:**
- # 调用鸿蒙原生API
- # 使用uts调用鸿蒙原生API
- # 使用uts调用鸿蒙第三方库的API
      - 本页导读

uni-app在Android和iOS平台，支持uts插件和App原生语言插件。目前App原生语言插件已经停止维护。uts插件是主推的扩展方式。

鸿蒙系统有很多原生API，可以通过uts插件方式接入，被uni-app调用。

定义API名称为：openAppProduct

注意：下方的属性名中包含的 uni 请勿更改成自己的名字或昵称缩写，只能用 uni

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：如果是新安装的 HBuilderX，【3】这里可能会只显示【下载真机运行插件】，点击它安装好插件才会看到这些菜单项。

鸿蒙的包用法和 npm 包差不多，在鸿蒙项目里面用ohpm安装三方库后，在 /uni_modules/uts插件名/utssdk/app-harmony/index.uts 内即可直接 import

注意：只能在满足uts插件 /uni_modules/*/utssdk/app-harmony/*.uts 的文件下使用，无法直接在项目的pages中使用

具体使用流程：在项目的pages引入uts插件，uts插件内再引入鸿蒙第三方库调用

以调用 @cashier_alipay/cashiersdk 为例，代码如下

示例源码如下，请查看 pre > code 标签中的内容

/uni_modules/*/utssdk/app-harmony/*.uts 内的代码

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
新建uni_modules插件
```

Example 2 (unknown):
```unknown
uni-openAppProduct
```

Example 3 (unknown):
```unknown
wq-openAppProduct
```

Example 4 (unknown):
```unknown
package.json
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-push-unipush.html

**Contents:**
  - # 开通
  - # 配置
    - # FCM配置
      - # 概述
      - # 从谷歌后台申请key信息
      - # UniPush后台配置FCM参数
      - # 本地离线打包
      - # 注意事项
    - # Android平台推送图标配置
      - # 源码视图配置

在manifest.json文件“App模块配置”项的“Push(消息推送)”下，勾选“UniPush”

在海外网络环境下，部分网络在连接UniPush技术支持供应商个推的推送服务时，可能出现不稳定的情况。此时，开发者可以接入 FCM 辅助通道，当在个推服务断线的情况下，通过谷歌的 FCM 推送通道下发消息，提升推送到达率。

使用FCM时手机端需安装Google移动服务（GMS），并且可以正常连接Google服务（国内网络需要翻墙）

进入 Firebase官网 创建项目，获取google-services.json文件及Server key。

登录google账号，如果没有账号请先注册

登录后点击右上角的“Go to console”

打开项目列表页面，点击“Add project”创建项目

输入项目名称（根据自己应用取名），点击“Continue”

确认是否需要使用Google Analytics服务（根据自己需要开启或关闭），点击“Continue”

进入项目详情页面，点击“Android”图标添加Android应用

输入Android应用信息（包名、昵称、证书SHA-1），点击“Register App”

注册Android应用后下载配置文件“google-services.json”，保存google-services.json文件后面需要使用 点击“Next”继续

此步骤中的操作云端打包机已经处理，忽略提示信息，继续点击“Next”，进入下一步 完成注册Android应用，点击“Continue to console”回到项目详情页面

点击“Project settings”，进入项目设置页面

切换到服务账号项，点击生成新的私钥，保存私钥json文件到本地，后面需要使用

配置FCM需先开通UniPush，如应用未开通UniPush请先开通。 在HBuilderX的mainfest.json页面，在“App SDK配置”项下的“uniPush”栏点击“配置”

打开DCloud的开发者中心后台进入应用列表，点击应用名称进入详情，点击上方“uniPush”选项卡，点击“厂商推送设置”按钮进入配置UniPush的FCM参数

保存成功后在HBuilderX中重新提交云端打包，并在“App-云打包”界面选择google play 渠道包：

如果你已经完成了uniPush的代码开发，只需完成上述配置和打包即可，不用修改代码。

如果你还没有开发过推送代码，参考App端使用UniPush参考：https://ask.dcloud.net.cn/article/35622

Android平台离线sdk集成UniPush支持FCM可参考：Push(消息推送)

** FCM 离线消息仅支持GOOGLE 推送，暂不支持国内设备商的海外发行版本**

UniPush和个推推送模块支持设置自定义推送图标，包括push图标和推送小图标(small)

打开项目的manifest.json文件，切换到“源码视图”，手动设置推送图标。 在 "app-plus" -> "distribute" -> "sdkConfigs" -> "push" -> "unipush" -> "icons"节点下配置推送图标

示例源码如下，请查看 pre > code 标签中的内容

也可在HBuilder X（3.5.1+ 版本） 中可视化配置

App勾选“Push（消息推送）”模块后，默认应用启动会立即申请推送消息权限，弹出系统发送通知授权框，如下： 如果希望应用启动不申请推送消息权限（不弹出系统发送通知授权框），可以在manifest.json文件的源码视图中配置"app-plus" -> "distribute" -> "ios" -> "pushRegisterMode"字段值为"manual"，如下：

示例源码如下，请查看 pre > code 标签中的内容

需提交云端打包后生效 配置为"manual"，需要在App代码中调用uni.getPushClientId 触发申请推送消息权限，用户同意返回客户端推送标识

**Examples:**

Example 1 (json):
```json
{
    "unipush": {                    //可选，JSON对象，使用UniPush SDK配置，无需手动配置参数，云端打包自动获取配置参数
        "icons": {                          //可选，JSON对象，推送图标配置
            "push": {                               //可选，JSON对象，Push图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送图标路径，分辨率要求48x48
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送图标路径，分辨率要求64x64
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送图标路径，分辨率要求96x96
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送图标路径，分辨率要求128x128
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送图标路径，分辨率要求192x192
            },
            "small": {                               //可选，JSON对象，Push小图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送小图标路径，分辨率要求18x18
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送小图标路径，分辨率要求24x24
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送小图标路径，分辨率要求36x36
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送小图标路径，分辨率要求48x48
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送小图标路径，分辨率要求72x72
                "xxxhdpi": "",                               //可选，字符串类型，4K屏设备推送小图标路径，分辨率要求96x96
            }
        }
    }
}
```

Example 2 (json):
```json
{
    "unipush": {                    //可选，JSON对象，使用UniPush SDK配置，无需手动配置参数，云端打包自动获取配置参数
        "icons": {                          //可选，JSON对象，推送图标配置
            "push": {                               //可选，JSON对象，Push图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送图标路径，分辨率要求48x48
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送图标路径，分辨率要求64x64
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送图标路径，分辨率要求96x96
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送图标路径，分辨率要求128x128
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送图标路径，分辨率要求192x192
            },
            "small": {                               //可选，JSON对象，Push小图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送小图标路径，分辨率要求18x18
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送小图标路径，分辨率要求24x24
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送小图标路径，分辨率要求36x36
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送小图标路径，分辨率要求48x48
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送小图标路径，分辨率要求72x72
                "xxxhdpi": "",                               //可选，字符串类型，4K屏设备推送小图标路径，分辨率要求96x96
            }
        }
    }
}
```

Example 3 (json):
```json
{
    "unipush": {                    //可选，JSON对象，使用UniPush SDK配置，无需手动配置参数，云端打包自动获取配置参数
        "icons": {                          //可选，JSON对象，推送图标配置
            "push": {                               //可选，JSON对象，Push图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送图标路径，分辨率要求48x48
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送图标路径，分辨率要求64x64
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送图标路径，分辨率要求96x96
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送图标路径，分辨率要求128x128
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送图标路径，分辨率要求192x192
            },
            "small": {                               //可选，JSON对象，Push小图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送小图标路径，分辨率要求18x18
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送小图标路径，分辨率要求24x24
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送小图标路径，分辨率要求36x36
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送小图标路径，分辨率要求48x48
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送小图标路径，分辨率要求72x72
                "xxxhdpi": "",                               //可选，字符串类型，4K屏设备推送小图标路径，分辨率要求96x96
            }
        }
    }
}
```

Example 4 (json):
```json
{
    "unipush": {                    //可选，JSON对象，使用UniPush SDK配置，无需手动配置参数，云端打包自动获取配置参数
        "icons": {                          //可选，JSON对象，推送图标配置
            "push": {                               //可选，JSON对象，Push图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送图标路径，分辨率要求48x48
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送图标路径，分辨率要求64x64
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送图标路径，分辨率要求96x96
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送图标路径，分辨率要求128x128
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送图标路径，分辨率要求192x192
            },
            "small": {                               //可选，JSON对象，Push小图标配置
                "ldpi": "",                                 //可选，字符串类型，普通屏设备推送小图标路径，分辨率要求18x18
                "mdpi": "",                                 //可选，字符串类型，大屏设备设备推送小图标路径，分辨率要求24x24
                "hdpi": "",                                 //可选，字符串类型，高分屏设备推送小图标路径，分辨率要求36x36
                "xhdpi": "",                                 //可选，字符串类型，720P高分屏设备推送小图标路径，分辨率要求48x48
                "xxhdpi": "",                                //可选，字符串类型，1080P高密度屏幕推送小图标路径，分辨率要求72x72
                "xxxhdpi": "",                               //可选，字符串类型，4K屏设备推送小图标路径，分辨率要求96x96
            }
        }
    }
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-modules

**Contents:**
  - # 源码视图
  - # 功能模块
  - # 注意事项
      - 本页导读

App端根据功能划分为不同的模块，项目使用到特定功能时选择包含对应的模块，避免App打包时包含无用的代码或三方SDK，可减少App安装包体积。

可在项目的manifest.json文件的“App模块配置”中根据需求勾选。

如果使用了相关API，但没有勾选对应功能模块，在运行时会弹出以下模块缺失提示框：

碰到此情况请勾选对应缺失的模块，并重新提交云端打包

HBuilderX新版本中增加的模块在老版本可能不存在可视化配置界面，则可以在源码视图中进行手动配置 在项目的manifest.json文件的“源码视图”中的 "app-plus" -> "modules" 手动添加：

示例源码如下，请查看 pre > code 标签中的内容

modules下添加项的键名为“模块标识”，可在下面**功能模块**中查询到

为了避免App隐私合规检测报包含麦克风、相机/相册、运动等敏感权限，从HBuilderX3.6.11版本开始，将App打包默认包含的Barcode(扫码)、Camera&Gallery(相机和相册)、Orientation(传感器)、Record(录音)等调整为独立功能模块。 更新到HBuilderX3.6.11版本后云端打包时默认将不会包含以上功能，需在manifest.json的“App模块配置”中手动勾选要使用的模块。 Orientation(传感器)将不再维护，在manifest.json中不提供可视化界面配置，如需继续使用，请在manifest.json的“源码视图”中手动在 "app-plus" -> "modules" 添加 "Orientation"，如下：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

Example 2 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

Example 3 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

Example 4 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-component.html

**Contents:**
      - 本页导读

传统vue项目开发，引用组件需要导入 - 注册 - 使用三个步骤，如下：

示例源码如下，请查看 pre > code 标签中的内容

Vue 3.x增加了script setup特性，将三步优化为两步，无需注册步骤，更为简洁：

示例源码如下，请查看 pre > code 标签中的内容

uni-app的easycom机制，将组件引用进一步优化，开发者只管使用，无需考虑导入和注册，更为高效：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 项目中，页面引用组件和组件引用组件的方式都是一样的（可以理解为：页面是一种特殊的组件），均支持通过 easycom 方式直接引用。

easycom 规范详细介绍，参考：easycom

**Examples:**

Example 1 (unknown):
```unknown
导入 - 注册 - 使用
```

Example 2 (html):
```html
<template>
	<view>
		<!-- 3.使用组件 -->
		<uni-rate text="1"></uni-rate>
	</view>
</template>
<script>
	// 1. 导入组件
	import uniRate from '@/components/uni-rate/uni-rate.vue';
	export default {
		components: { uniRate } // 2. 注册组件
	}
</script>
```

Example 3 (html):
```html
<template>
	<view>
		<!-- 3.使用组件 -->
		<uni-rate text="1"></uni-rate>
	</view>
</template>
<script>
	// 1. 导入组件
	import uniRate from '@/components/uni-rate/uni-rate.vue';
	export default {
		components: { uniRate } // 2. 注册组件
	}
</script>
```

Example 4 (html):
```html
<template>
	<view>
		<!-- 3.使用组件 -->
		<uni-rate text="1"></uni-rate>
	</view>
</template>
<script>
	// 1. 导入组件
	import uniRate from '@/components/uni-rate/uni-rate.vue';
	export default {
		components: { uniRate } // 2. 注册组件
	}
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/uni-uts-debug-harmony.html

**Contents:**
- # 开启调试
- # 打断点
- # 调试视图
- # 调试操作
- # 数据检查和查看变量
  - # 添加到监视
  - # 悬停显示
- # 联编调试
  - # 开启方式
      - 本页导读

HBuilderX 4.61+ 运行到鸿蒙，支持Debug调试。包括uvue、uts、混编的ets都支持。

如下图所示，运行uni-app x项目到鸿蒙，运行成功后，HBuilderX控制台点击红色虫子图标，下拉菜单选择【开启调试】，即可开启鸿蒙调试功能。

注意：鸿蒙调试，依赖鸿蒙调试插件，弹窗提示安装依赖插件，请务必点击安装，否则无法进行调试。

注意：如果需要触发应用初始化中的断点，比如App.uvue的onLaunch中，需要点击红色虫子图标右边的重启应用按钮，重启之后应用初始化中的断点才会生效

注意：目前部分变量的显示可能还是以ets的方式显示，因为uts编译结果是ets

打开要调试的uts、uvue、ets文件，在代码行号上，鼠标右击或双击添加断点。

开启调试后，即可在HBuilderX左侧视图，看到调试视图，具体如下：

下图中包含了uvue、uts、ets的调试步骤

在【变量窗口】，选中变量，右键菜单，即可将变量添加到监视窗口。

断点调试过程中，将鼠标悬停在要查看的变量上，即可打开悬停窗口。

HBuilderX 4.71+ 版本支持联编调试，针对 uni-app x 项目有效。

在 HX 里面把 uni-app x 项目运行到鸿蒙时，不仅支持在 uni-app x 项目中进行断点调试，也同时支持对鸿蒙工程目录中的源代码（比如 .ets 文件）进行断点调试。

在 uni-app x 项目根目录中的 .hbuilderx/launch.json 文件中添加如下内容（如果文件不存在则手动创建）：

联编功能的介绍可参考线上文档 项目根目录与鸿蒙工程目录

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
.hbuilderx/launch.json
```

Example 2 (json):
```json
{
  "version" : "1.0",
  "configurations": [
    {
      "type": "uni-app:app-harmony",
      "debugWithNativeHarmony": true,
      "nativeHarmonyProjectPath": "D:/native-harmony-project"
    }
  ]
}
```

Example 3 (json):
```json
{
  "version" : "1.0",
  "configurations": [
    {
      "type": "uni-app:app-harmony",
      "debugWithNativeHarmony": true,
      "nativeHarmonyProjectPath": "D:/native-harmony-project"
    }
  ]
}
```

Example 4 (json):
```json
{
  "version" : "1.0",
  "configurations": [
    {
      "type": "uni-app:app-harmony",
      "debugWithNativeHarmony": true,
      "nativeHarmonyProjectPath": "D:/native-harmony-project"
    }
  ]
}
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-disagreemode.html

**Contents:**
  - # 概述
  - # 配置支持disagreeMode
  - # 适配App的基本功能服务
    - # 判断是否运行在disagreeMode模式
    - # disagreeMode模式限制uni API和组件
      - # API
      - # 组件
    - # disagreeMode模式限制plus API
  - # 引导用户同意“隐私政策”协议
  - # 常见问题

为贯彻落实《中华人民共和国网络安全法 》关于“网络运营者收集、使用个人信息，应当遵循合法、正当、必要的原则”、“网络运营者不得收集与其提供的服务无关的个人信息”等规定，国家互联网信息办公室、工业和信息化部、公安部、国家市场监督管理总局联合制定了《常见类型移动互联网应用程序必要个人信息范围规定 》（国信办秘字〔2021〕14号，以下简称“《规定》”），明确移动互联网应用程序（App）运营者不得因用户不同意收集非必要个人信息，而拒绝用户使用App基本功能服务。

《规定》第三条定义了必要个人信息，《规定》第四条明确了基本要求，即“App不得因用户不同意提供非必要个人信息，而拒绝用户使用其基本功能服务”；《规定》第五条划定了三十九种常见类型App，及其基本功能服务和必要个人信息，请开发者仔细阅读《规定》确定自己开发的App所属类型，明确基本功能服务及必要个人信息。这里关键就是对必要个人信息和非必要个人信息的理解，并在App的“隐私政策”中详细描述收集的所有信息及用途，分以下情况：

DCloud uni-app(5+ App/Wap2App) SDK及其它三方SDK运行期收集的信息属于非必要个人信息

也就是说根据《规定》要求，很多App需要支持在用户不同意“隐私政策的情况下仍然可以进入运行，并提供基本功能服务。为了支持此类需求，HBuilderX 3.3.1版本新增“未同意隐私政策模式”（以下简称“disagreeMode”），配置支持disagreeMode后，用户在“隐私政策”提示框点击拒绝按钮后仍然可以继续使用App。在此模式下，uni-app(5+ App/Wap2App) 内部逻辑会做特殊处理：

iOS平台暂不支持disgreeMode，需跟原生隐私政策框一样适配处理

同时要求用户在使用基本功能服务时，不能读取任何个人信息（包括设备标识信息及用户输入的个人信息），不能调用disagreeMode模式限制API，特别需要注意使用的uni原生插件是否合规。

注意：App要支持disagreeMode，需要根据业务进行适配

在HBuilderX中打开项目的原生隐私政策提示框配置文件androidPrivacy.json ，添加disagreeMode配置设置support为true.

示例源码如下，请查看 pre > code 标签中的内容

disagreeMode表示用户未同意“隐私政策”，此时App仅提供基本功能服务，此模式下不能调用涉及隐私合规相关的API，如果调用了可能会因为读取隐私信息导致App无法通过合规检测，参考disagreeMode模式限制uni API和组件及disagreeMode模式限制5+ API。如果基本功能服务的页面需要需要调用到限制API，需先判断是否运行在disagreeMode模式，如果是的话需先引导用户同意“隐私政策”协议，用户同意隐私政策后再调用限制API。

可通过plus.runtime.isAgreePrivacy 查询当前应用是否用户同意隐私政策可判断是否运行在disagreeMode模式，示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

plus.runtime.isAgreePrivacy()返回为true表示用户已经同意隐私政策，调用相关被限制的API；返回false表示用户没有同意隐私政策，运行运行在disagreeMode模式，不能调用相关被限制的API。

在disagreeMode模式下不要使用以下uni API及组件，否则影响应用商店上架合规检测！

在disagreeMode模式下不要使用以下5+ API，否则影响应用商店上架合规检测！

当用户在disagreeMode模式使用基本功能服务时，可能链接打开使用了限制API的业务功能，此时可调用plus.runtime.showPrivacyDialog 弹出隐私政策协议框，引导用户同意隐私政策后再使用相关业务功能。示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

注意：如果项目中使用了 map、push、Statistic，或者设置loadNativePlugins为false时，用户选择同意隐私政策协议后需要调用plus.runtime.restart重启应用才能生效！

**Examples:**

Example 1 (unknown):
```unknown
disagreeMode
```

Example 2 (json):
```json
{
	"prompt": "template",
	"buttonAccept": "同意并接受",
	"buttonRefuse": "基础功能模式",
	"disagreeMode": {
    	"support": false,
    	"loadNativePlugins": false,
    	"visitorEntry": true,
    	"showAlways": false
	}
}
```

Example 3 (json):
```json
{
	"prompt": "template",
	"buttonAccept": "同意并接受",
	"buttonRefuse": "基础功能模式",
	"disagreeMode": {
    	"support": false,
    	"loadNativePlugins": false,
    	"visitorEntry": true,
    	"showAlways": false
	}
}
```

Example 4 (json):
```json
{
	"prompt": "template",
	"buttonAccept": "同意并接受",
	"buttonRefuse": "基础功能模式",
	"disagreeMode": {
    	"support": false,
    	"loadNativePlugins": false,
    	"visitorEntry": true,
    	"showAlways": false
	}
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-splashscreen.html

**Contents:**
  - # 启动界面选项
    - # 等待首页渲染完毕后再关闭Splash图
  - # 启动界面设置
    - # 通用启动界面
      - # Android平台通用启动界面
      - # iOS平台通用启动界面
    - # 自定义启动图
      - # Android平台自定义启动图
      - # Android平台使用.9.png启动图
      - # iOS平台自定义启动图

App启动时，系统加载应用渲染首页需要一定的时间，为了避免用户等待，手机操作系统提供了特殊的启动界面设计，让用户先看到一个简单的界面，等应用加载完成后正式进入应用首页。

这个界面，即被称为启动界面，也成称为 splash 或 lauch screen。

进入应用后启动界面在合适的时机会自动关闭并显示应用首页，可在manifest.json文件中进行配置。

打开项目的manifest.json文件，在“App启动界面配置”中的“启动界面选项”配置是否“等待首页渲染完毕后再关闭Splash图”：

alwaysShowBeforeRender和autoclose属性组合设置，可配置以下三种关闭启动界面（splash）策略：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

启动界面原本是一个静态png图片方式。随着移动设备屏幕的多样化，为了让每种屏幕启动时界面都不变形，开发者需要为越来越多的屏幕尺寸制作不同的图片。这带来很多问题，包括制作复杂、app包体积增大等。

HBuilderX中提供了以下启动界面方式：

提示：启动界面设置需提交云端打包后才能生效

通用启动界面是一种简单、可适配不同屏幕的启动界面。它以app的logo、name为元素，自动生成适配不同屏幕尺寸、适配不同OS要求的启动界面。

通用启动界面有着最低的门槛，仅需要开发者为app在manifest里配好logo和name即可。并且符合任何应用商店的上线规范。它在iOS上就是通过storyboard实现的。

提示通用启动界面是为了方便开发者而设计的，它不具有很强的灵活性，如果开发者有较强的自定义需求，Android平台请使用.9.png格式自定义启动图、iOS平台请使用自定义storyboard启动界面

打开项目的manifest.json文件，在“App启动界面配置”中的“Android启动界面设置”项下勾选“通用启动界面”：

通用启动界面上部显示应用图标（圆形裁剪，外围显示进度），图标下面为应用名称，效果如下：

打开项目的manifest.json文件，在“App启动界面配置”中的“iOS启动界面设置”项下勾选“通用启动界面”：

通用启动界面使用storyboard实现，在界面上部显示应用图标（无裁剪），图标下面为应用名称，效果如下：

如果应用开启适配暗黑模式/夜间模式/深色模式，则启动界面背景色会自动使用深色，文字颜色自动使用白色。

打开项目的manifest.json文件，在“App启动界面配置”中的“Android启动界面设置”项下勾选“自定义启动图”：

目前HBuilderX中仅定义几种标准分辨率的启动图配置，而实际上存在很多不同分辨率的手机，导致启动图在一些不常见的设备会进行拉伸或压缩引起变形，Android平台为了解决此问题就出现了可以适配各种尺寸的一种图片格式“.9.png”。这是一种特殊的图片格式，它可以指定特定的区域进行拉伸而不失真。 使用.9.png的优点

详细制作步骤可参考链接：Android中.9图片的含义及制作教程 可以使用在线.9.png生成工具：http://inloop.github.io/shadow4android/

.9.png配置使用 打开项目的manifest.json文件，在“App启动界面配置”中的“Android启动界面设置”项下勾选“自定义启动图”，在各分辨率启动图设置框选择需要使用的.9.png图片（图片尺寸请按照提示尺寸对应上传），保存后提交云端打包即可。

不同尺寸的启动图是为了适配不同分辨率的手机，所以提交打包时请务必上传不同尺寸的启动图，切忌上传多张同尺寸启动图

可以参考开发者在插件市场 做好的.9样例工程

提示：2020年6月30日起，苹果AppStore审核要求应用在启动时，不能使用启动图片，必须改为使用Storyboard来制作启动界面，如果需要提交AppStore请使用通用启动界面或自定义storyboard启动界面。

打开项目的manifest.json文件，在“App启动界面配置”中的“iOS启动界面设置”项下勾选“自定义启动图”：

Storyboard是Apple提供的一种简化的布局界面，通过xml描述界面，不能编程。 虽然无法制作非常灵活的界面，但满足启动界面是没问题的，比如设定背景色背景图、设定前景文字、图片的位置。 storyboard的优势是启动速度快。在App的真实首页被渲染完成前，可以快速给用户提供一个基于Storyboard的启动屏。

storyboard有两种制作方式： 1. 直接使用模板文件(点击下载) 中提供的相对常用的 storyboard 模板，可在这个文件的基础上进行自定义（不需要 Mac 及 XCode，详情请查看附件中的 readme 教程） 此 storyboard 文件适用于各种 iPhone 及 iPad 设备的横竖屏，支持自定义界面元素包括

2. 使用xcode自行制作。xcode提供了可视化的制作storyboard的方式，但依赖于mac电脑。在xcode中制作storyboard的教程请自行网络搜索，请注意下面的注意事项。

HBuilderX需要的自定义storyboard文件格式为zip压缩包，里面要求包含XCode使用的.storyboard文件，以及.stroybard文件中使用的png图，如下图所示：

打开项目的manifest.json文件，在“App启动界面配置”中的“iOS启动界面设置”项下勾选“自定义storyboard启动界面”，并选择自己制作的storyboard文件：

**Examples:**

Example 1 (json):
```json
"app-plus" : {
    "splashscreen" : {
        "alwaysShowBeforeRender" : true
    }
}
```

Example 2 (json):
```json
"app-plus" : {
    "splashscreen" : {
        "alwaysShowBeforeRender" : true
    }
}
```

Example 3 (json):
```json
"app-plus" : {
    "splashscreen" : {
        "alwaysShowBeforeRender" : true
    }
}
```

Example 4 (json):
```json
"app-plus" : {
    "splashscreen" : {
        "alwaysShowBeforeRender" : true
    }
}
```

---

## 鸿蒙应用唤起鸿蒙应用、元服务 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/open-app.html

**Contents:**
- # 鸿蒙应用唤起鸿蒙应用、元服务
- # 使用 Deep Linking 唤起鸿蒙应用
  - # 定义 querySchemes
  - # 页面调用
- # 使用 App Linking 唤起鸿蒙应用
- # 鸿蒙应用唤起元服务
- # 常见问题
  - # canOpenLink fail by err: BusinessError 17700056: The scheme of the specified link is not in the querySchemes.
  - # 我如何知道用户是否安装了微信、高德等三方程序？
      - 本页导读

目前鸿蒙应用可通过 API 唤起鸿蒙应用、元服务。

鸿蒙 App 中可 使用 Deep Linking 实现应用间跳转 。如何在鸿蒙中注册和定义 Deep Linking，请参阅 uni-app 中设置鸿蒙 Deep Linking 方案。

目前鸿蒙应用 统一应用软件 已经定义了 hellouniapp://router 来唤起应用并传递参数。

在鸿蒙应用中唤起其他鸿蒙应用，需要两步操作：

鸿蒙应用在 HBuilderX 工程启动之后，在 unpackage/dist/dev/app-harmony 文件夹找到鸿蒙产物工程，找到 entry/src/main/module.json5 文件，将其复制，放到 HBuilderX 工程中的 harmony-configs/entry/src/main/module.json5 位置，HBuilderX 编译时候会将该配置文件放入最终产物中，实现配置覆盖。

在 module 节点下新增 querySchemes:[“hellouniapp”]。

注意，querySchemes 有最大 50 个数量限制。

下载导入 uts-openSchema 插件。

安全调用可先检查是否可以唤起应用，再唤起应用。

示例源码如下，请查看 pre > code 标签中的内容

使用过程中有问题，可在 uts-openSchema 页面底部的 IM 交流群沟通。

鸿蒙中可 使用 App Linking 实现应用间跳转 ，如何注册和定义 App Linking 可参考 uni-app 设置 App Linking 方案。

目前鸿蒙应用 统一软件应用 注册了特定的 URL 可唤起应用。

使用 App Linking 唤起鸿蒙应用只需要一个步骤：

canOpenURL 不支持 App Linking 协议，所以无需判断是否可用，直接调用即可。如果应用没有安装会直接跳转到应用商店。

示例源码如下，请查看 pre > code 标签中的内容

目前 uni-app 支持 Vue2/Vue3 开发鸿蒙元服务。目前可通过下面方式唤起应用

创建 API UTS 插件，可在 uts-openSchema 鸿蒙源码中新增下面方法并导出。

示例源码如下，请查看 pre > code 标签中的内容

可在华为文档搜索关键词 17700056，可搜到具体解释 17700056 指定link的scheme未在querySchemes字段下配置

如何添加 querySchemes？阅读上方文档 定义 querySchemes

唤起应用可使用 uts 使用鸿蒙开放的 canOpenLink 方法。参考 使用canOpenLink判断应用是否可访问 ,注意这个方法不支持 App Linking 协议。

**Examples:**

Example 1 (yaml):
```yaml
hellouniapp://router
```

Example 2 (unknown):
```unknown
unpackage/dist/dev/app-harmony
```

Example 3 (unknown):
```unknown
entry/src/main/module.json5
```

Example 4 (unknown):
```unknown
harmony-configs/entry/src/main/module.json5
```

---

## dom | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-api.html

**Contents:**
- # dom
  - # addRule
  - # scrollToElement
  - # getComponentRect
- # animation
  - # transition
- # nvue 里使用 BindingX
      - # 注意
      - # 代码示例:
- # nvue 和 vue 相互通讯

对于那些不依赖 UI 交互的原生功能，nvue将其封装成模块，这是一种通过 javascript 调用原生能力的方法。

示例源码如下，请查看 pre > code 标签中的内容

支持项目nativeplugins目录下和插件市场原生云打包的第三方原生插件。你可以将已有原生模块移植到nvue平台也很方便。 使用方式：在manifest.json->App原生插件配置->选择本地插件或者云端插件->打自定义基座才能使用。详见

nvue还支持uni-app的js API接口，若无特殊说明，则表示vue文件和nvue文件均支持。详见。

nvue 里不支持的 uni-app API，详见

Weex 提供 DOM.addRule 以加载自定义字体。开发者可以通过指定 font-family加载 iconfont 和 custom font。开发者可以使用下面的代码加载自定义字体：

示例源码如下，请查看 pre > code 标签中的内容

addRule(type, contentObject)

addRule 方法里的 fontFamily 可以随意取。这个名字不是字体真正的名字。字体真正的名字（font-family），也就是注册到系统中的名字是保存在字体二进制文件中的。你需要确保你使用的字体的真正名字（font-family）足够特殊，否则在向系统注册时可能发生冲突，导致注册失败，你的字符被显示为‘?’。 如果你使用 http://www.iconfont.cn/ 来构建你的 iconfont。确保在项目设置中，设置一个特殊的 font-family 名字。默认是 “iconfont”，但极大可能发生冲突。 调用addRule 在 beforeCreate 中是被推荐的。

让页面滚动到 ref 对应的组件，这个 API 只能用于可滚动组件的子节点，例如 <scroller>，<list>, <waterfall> 等可滚动组件中。

scrollToElement(ref, options)

示例源码如下，请查看 pre > code 标签中的内容

getComponentRect(ref, callback)

示例源码如下，请查看 pre > code 标签中的内容

此方法需要在节点渲染后调用才能获取正确的信息，可在 mounted 或 更新数据后 updated 中调用

如果想要获取到 Weex 视口容器的布局信息，可以指定 ref 为字符串 'viewport'，即 getComponentRect('viewport', callback).

animation模块可以用来在组件上执行动画。JS-Animation可以对组件执行一系列简单的变换 (位置、大小、旋转角度、背景颜色和不透明度)。

举个例子，如果有一个image组件，通过动画你可以对其进行移动、旋转、拉伸或收缩等动作。

示例源码如下，请查看 pre > code 标签中的内容

如果需要使用CSS动画，参考transition和transform。

uni-app 是逻辑层和视图层分离的。此时会产生两层通信成本。比如拖动视图层的元素，如果在逻辑层不停接收事件，因为通信损耗会产生不顺滑的体验。

BindingX 是weex提供的一种预描述交互语法。由原生解析BindingX规则，按此规则处理视图层的交互和动效。不再实时去js逻辑层运行和通信。

BindingX是一种规则，解析快，但没有js那样足够强的编程灵活性。

uni-app 内置了 BindingX，可在 nvue 中使用 BindingX 完成复杂的动画效果。

从HBuilderX 2.3.4起，uni-app 编译模式可直接引用 uni.requireNativePlugin('bindingx') 模块，weex 模式还需使用 npm 方式引用。

BindingX demo示例可参考 BindingX 示例里 vue 的相关示例，将相关 vue 代码拷贝到 nvue 文件里即可。

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中，nvue 和 vue 页面可以混搭使用。

推荐使用 uni.$on , uni.$emit 的方式进行页面通讯，旧的通讯方式（uni.postMessage及plus.webview.postMessageToUniNView）不再推荐使用。

示例源码如下，请查看 pre > code 标签中的内容

使用此页面通讯时注意事项：要在页面卸载前，使用 uni.$off 移除事件监听器。参考

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

除了通信事件，vue 和 nvue 页面之间还可以共享变量和存储。 uni-app提供的共享变量和数据的方案如下：

注意：不支持直接引入store使用，可以使用mapState、mapGetters、mapMutations等辅助方法或者使用this.$store

示例源码如下，请查看 pre > code 标签中的内容

nvue页面可直接使用plus的API，并且不需要等待plus ready。

nvue 支持大部分 uni-app API ，下面只列举目前还不支持的 API 。

canvas API使用，详见canvas文档 。

**Examples:**

Example 1 (unknown):
```unknown
uni.requireNativePlugin
```

Example 2 (javascript):
```javascript
//使用方式
	const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 3 (javascript):
```javascript
//使用方式
	const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 4 (javascript):
```javascript
//使用方式
	const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

---

## 通过 URL Scheme 唤起鸿蒙应用 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/url-scheme.html

**Contents:**
- # 通过 URL Scheme 唤起鸿蒙应用
- # 基本概念
  - # URL Scheme
  - # Universal Links
- # 鸿蒙中方案
  - # Deep Linking 方案
  - # App Linking 方案
- # 参数解析
- # HBuilderX 中监听参数
      - 本页导读

通过短信、落地页唤起应用是常见的业务需求，这里介绍如何在鸿蒙中唤起应用。

在 Android/iOS 中唤起应用一般有两类方案，URL Scheme 和 Universal Links（安卓中叫 App Links）。查看 Android 设置 UrlSchemes 、 iOS 设置 UrlSchemes

使用 URL Scheme 唤起，用户通过访问自定义的 uri 网址，来打开应用并传递参数，比如 weixin:// 这个 Scheme 是唤起微信的方案。

使用 Universal Links 这种方案，是用户访问一个 https 网页，这个网页在对应的后台已经认证过，打开这个网页可以直接打开应用并传递对应的参数。

缺点：使用 URL Scheme 这种方式打开应用，系统一般会弹窗提示用户是否打开，，用户打开应用每多一个步骤就有流失的风险。Scheme 方案可能有重复注册 Scheme 的方式，用户需要正确选择才能打开应用，容易困惑、错误选择。

优点：这种方案有兜底机制，不打扰用户，不会阻塞用户打开应用。

缺点：需要一个所有人都可以访问的 https 网页

官方文档地址《使用 Deep Linking 实现应用间跳转 》

使用 Deep Linking 方案，需要 1 个步骤

在 HBuilderX 工程中，打开 harmony-configs/entry/src/main/module.json5。如果没有找到这个文件，可以在 unpackage/dist/app-harmony 产物文件里获取，放置到对应位置，HBuilderX 构建过程会自动合并。

重点是添加 skills[1]，找到 module.abilities[0].skills 追加下面内容，保证 skills 数组长度增加。

示例源码如下，请查看 pre > code 标签中的内容

在线网页中添加 a 链接，填写 Scheme

示例源码如下，请查看 pre > code 标签中的内容

这种情况下，点击链接应该就可以正常唤起应用了。如果不能请自查

验证效果如图所示，会在华为浏览器底部出现弹窗提示，这里的文案不可修改，点击之后可以唤起应用。

官方文档 使用 App Linking 实现应用间跳转

这种方案可以实现二维码扫码直达、点击链接直接唤起应用。有验证机制，不会其其他应用仿冒，比较安全。

使用 App Linking 方案需要 4 个步骤

开通功能关联应用。访问 AGC 后台 - 开发与服务 - 增长 - App Linking， 开启 App Linking 功能

在落地页的域名根目录创建 /.well-known/applinking.json，内部填写应用 AppID，结构可以参考 https://uniapp.dcloud.net.cn/.well-known/applinking.json 保证你的落地页域名可以访问该路径。

这步骤要求可以访问 json，需要服务端开启访问，这是为了鉴权访问，需要文件持久存在不可删除。

在 HBuilderX 工程中，打开 harmony-configs/entry/src/main/module.json5。如果没有找到这个文件，可以在 unpackage/dist/app-harmony 产物文件里获取，放置到对应位置，HBuilderX 构建过程会自动合并。

重点是添加 skills[1]，找到 module.abilities[0].skills 追加下面内容，保证 skills 数组长度增加。

示例源码如下，请查看 pre > code 标签中的内容

通过上面设置，当用户直接访问对应的 url 时候会直接唤起应用。如果用户未安装会停留在当前页面。如果用户已经在访问相同 host 的网页，应用不会主动唤起不会干扰用户的正常访问。

具体可根据实际业务场景进行测试。上述代码为线上的统一应用软件 的 Scheme 设置，可对比参考。

应用启动时候获取参数，自定义业务逻辑，在应用加载时候监听参数，具体如何跳转是应用自己处理的。

更新：可直接使用 uni.getLaunchOptionsSync 直接获取相关参数。下面方案解释了背后的实现。

HBuilderX 可以封装一个简单的 UTS 插件完成参数获取。

在项目中新建 uni_modules 文件夹，选择新建 UTS插件 - API 插件，创建之后创建并打开 utssdk/app-harmony/index.uts，如果不存在就手动创建该文件。

示例源码如下，请查看 pre > code 标签中的内容

在页面中引入此插件变量，在 onLaunch 和 onShow 读取 params 后续可根据实际需求完善逻辑。比如通过参数判断如何跳转。

实际中可将参数变量进行返回，在 Vue 页面中访问和读取。

**Examples:**

Example 1 (unknown):
```unknown
harmony-configs/entry/src/main/module.json5
```

Example 2 (unknown):
```unknown
unpackage/dist/app-harmony
```

Example 3 (unknown):
```unknown
module.abilities[0].skills
```

Example 4 (json):
```json
{
  "actions": ["ohos.want.action.viewData"],
  "uris": [
    {
      "scheme": "hellouniapp",
      "host": "router"
    }
  ]
}
```

---

## 背景 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/android-store.html

**Contents:**
  - # 背景
  - # APP因合规问题无法上架
  - # 隐私政策注意事项
  - # 常见问题
    - # 1、如何解决"强制、频繁、过度索取权限"问题
    - # 2、离线打包的apk！提交市场审核被报提前获取用户信息
    - # 3、如何解决“强制用户使用定向推送功能”问题
    - # 4、如何解决 用户点击《隐私政策》“同意”前，APP和SDK不要进行任何行为，包括SDK不能初始化，APP或SDK不能收集用户信息（包括但不限于IMEI、IMSI、设备MAC地址、软件列表、设备序列号、androidID）
    - # 5、如何解决“用户不同意强制退出应用”问题
    - # 6、离线打包集成三方SDK

为有效治理App强制授权、过度索权、超范围收集个人信息等现象，落实《网络安全法》《消费者权益保护法》的要求，保障个人信息安全，2019年1月，中央网信办、工信部、公安部、市场监管总局等四部委发布了《关于开展App违法违规收集使用个人信息专项治理的公告》，在全国范围组织开展App违法违规收集使用个人信息专项治理，并陆续出台完善了《App违法违规收集使用个人信息行为认定方法》、《GB/T 35273-2020 信息安全技术 个人信息安全规范》等标准规范。

根据以上规范要求，各大应用市场都加强应用的检测，要求应用必须符合相关政策，否则应用将有被通报或下架的风险。

DCloud联合业内主流隐私合规检测厂商推出了uni隐私合规检测服务，可在线申请获取详细检测报告，详见：uni隐私合规检测

请认真的阅读以下步骤来检测自己的APP！有效的解决上架问题

示例源码如下，请查看 pre > code 标签中的内容

必须确保应用存在《隐私政策》，在应用首次启动时弹出提示并取得用户同意。

一定要配置使用template模式隐私与政策提示框 详情参考

必须在“隐私与政策”非常清楚、全面地说明（不要用可能收集、了解用户信息这种模糊不清晰的词语）收集用户个人信息的目的、方式和范围，用户个人信息包括但不限于mac地址、设备序列号、imei、imsi、软件安装列表、通讯录信息、短信信息等。

如果反馈说有违规获取敏感信息行为，请查看Android平台各功能模块隐私合规协议 各功能模块隐私协议。如果你集成了相关模块就一定要写入到app的隐私协议中。

必须在《隐私政策》中必告知用户您的应用基于DCloud uni-app(5+ App/Wap2App)开发，添加如下协议：

我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。详情内容请访问《[DCloud App引擎隐私政策](https://dcloud.io/license/appprivacy.html)》。

离线打包请使用3.6.1+版本的SDK。并配置uni-app的隐私协议弹窗。不要自行通过原生能力实现隐私弹窗，否则无法正常限制SDK内部获取用户信息逻辑。导致合规检测不合规！

《隐私政策》中涉及到 “推荐”、“定制”、“个性化”等关键字改为“提供、展示、通知、发送、、、”等字眼，如果确实会涉及到个性化服务请在app的设置中增加个性化推送开关

这个问题可能是隐私弹窗显示后，用户选择了“不同意”按钮后应用退出导致的。请按以下修改。

如果重写了DCloudApplication，需要注意在Application初始化的三方SDK的合规操作。防止导致启动隐私弹窗前获取了用户信息无法上架

我们已经收到很多开发者反馈，其他应用市场都已上架成功。但华为检测时则上架被拒。猜测是华为应用市场提交新的apk检测后依然检测之前提交的apk，导致检测不通过的问题。 这种情况请联系华为应用市场技术支持，告诉他新版本已经修改了，让华为应用市场重新检测审核。

示例源码如下，请查看 pre > code 标签中的内容

HBuilder项目打包需要配置勾选arm64-v8a,默认只会集成armeabi-v7a

如果有使用uni原生插件。需要查看插件是否支持arm64-v8a！是否支持请到插件详情页里查询。如果插件详情页里没有请咨询插件开发者提供信息或更换其他插件。

HX3.6.1+版本 可以配置manifest.json配置checkPermissionDenied = true 校验已拒绝权限不再申请。(仅针对官方api主动权限申请行为，三方SDK、uni原生插件、plus.android.requestPermissions不受限制)

示例源码如下，请查看 pre > code 标签中的内容

可开通付费技术服务 参考：https://ask.dcloud.net.cn/article/13015

各大应用市场上架合规审查细节可能存在差异，如果开发者碰到相关问题请及时反馈，我们会及时汇总整理供大家参考

**Examples:**

Example 1 (json):
```json
//androidPrivacy.json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "..."
 }
```

Example 2 (json):
```json
//androidPrivacy.json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "..."
 }
```

Example 3 (json):
```json
//androidPrivacy.json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "..."
 }
```

Example 4 (json):
```json
//androidPrivacy.json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "..."
 }
```

---

## Android原生应用清单文件和资源 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-nativeresource-android.html

**Contents:**
- # Android原生应用清单文件和资源
- # 应用清单文件 AndroidManifest.xml
  - # Android权限配置
  - # 移除Android权限
  - # Android url scheme配置
    - # 5+ App/uni-app 项目
    - # uni-app x 项目
  - # Android 修改activity注册配置信息
    - # 5+ App/uni-app 项目
    - # uni-app x 项目

app打包，在Android原生开发中提供了配置 AndroidManifest.xml 和 资源目录 assets、res。uni-app中对常用项进行了封装，提供了manifest.json 。

但manifest.json不能包含所有Android的配置。

在HBuilderX 3.6以前，开发者如需使用manifest未封装的配置、或需自定义资源目录 assets、res下的内容，只能离线打包或开发App原生语言插件 。

HBuilderX3.6.0起，支持直接在应用项目中配置应用清单文件 AndroidManifest.xml 和资源目录 assets、res。

在HBuilderX中，对项目根目录右键菜单 "新建" -> "自定义文件"

输入文件名称 AndroidManifest.xml（注意大小写敏感），点击 “创建” 按钮新建文件

根据应用需求编辑添加需要的内容，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果应用需要一些特殊的Android权限配置，可根据需求在manifest节点下添加，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

注意 uni-app x项目manifest.json中没有提供Android权限的配置，需在此AndroidManifest.xml中添加。

如果应用使用了三方SDK（uts插件 或uni原生插件 ）默认包含了一些Android权限，而实际可能不需要用到，则可以在 manifest.json 中的 “安卓/iOS权限配置” -> “Android云打包权限配置” -> “强制移除的权限” 中添加要移除的权限，如下例是移除"android.permission.INSTALL_PACKAGES"、"android.permission.REQUEST_INSTALL_PACKAGES"权限：

注：在应用清单文件文件中配置权限并添加tools:node="remove"移除在某些场景下可能不生效，推荐在 manifest.json 的可视化界面配置。

uni-app 项目请在 manifest.json 可视化界面的 App常用其它设置 中配置，详情参考Android设置url scheme

应用需要向系统注册url scheme，以便在浏览器中通过scheme打开App，可根据需求在AndroidManifest.xml文件中添加android:scheme数据，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 项目支持通过此方式配置url scheme，需 HBuilderX4.18及以上版本

android平台的activity内容载体，部分特殊功能需修改activity注册配置 才能实现功能，因此提供如下方式修改注册的配置信息。

5+ App/uni-app 项目 页面 activity 如下:

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 项目页面 activity 如下:

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX中对项目右键菜单 "新建" -> "目录"

输入名称 nativeResources（注意大小写敏感），确定并创建目录。

继续创建“android”子目录、创建“assets”、“res”二级子目录，结构如下：

将需要添加的Android原生资源文件分别拷贝到assets、res目录，云端打包时将会合并到安装包中。

在 Android 原生开发中可以在 build.gradle 文件配置 manifestPlaceholders 数据用于替换 AndroidManifest.xml 中的占位符，例如 ${api_key} 。 为了满足此需求，在项目的 nativeResources/android 目录下可添加 manifestPlaceholders.json 文件来配置 manifestPlaceholders 数据。

示例源码如下，请查看 pre > code 标签中的内容

manifestPlaceholders.json 文件中的键名和键值必需是字符串，其中键名为占位符的名称，如占位符 ${api_key} 的键名为 api_key，键值为要替换 AndroidManifest.xml 中的占位符的值。

注意 云端打包默认保留以下manifestPlaceholders，避免使用

离线打包时应用清单文件和资源需要开发者手动合并到Android原生工程中。

**Examples:**

Example 1 (unknown):
```unknown
AndroidManifest.xml
```

Example 2 (xml):
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" 
  package="io.dcloud.nativeresouce">
    <!--permissions-->

    <application>
        <!--meta-data-->
        <meta-data android:name="My_Custom_Key" android:value="My_Custom_Value"/>

    </application>
</manifest>
```

Example 3 (xml):
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" 
  package="io.dcloud.nativeresouce">
    <!--permissions-->

    <application>
        <!--meta-data-->
        <meta-data android:name="My_Custom_Key" android:value="My_Custom_Value"/>

    </application>
</manifest>
```

Example 4 (xml):
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" 
  package="io.dcloud.nativeresouce">
    <!--permissions-->

    <application>
        <!--meta-data-->
        <meta-data android:name="My_Custom_Key" android:value="My_Custom_Value"/>

    </application>
</manifest>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-maps.html

**Contents:**
  - # 高德地图
    - # 申请高德地图Key
    - # 配置使用高德地图
    - # 参数说明
    - # 高德开放平台用户名
  - # 百度地图
    - # 申请百度地图Key
    - # 配置使用百度地图
    - # 参数说明
  - # Google地图（谷歌地图/google map）

App端地图模块封装了市场上主流的三方地图SDK，提供JS API统一调用Android、iOS原生地图功能。

使用地图功能需在项目manifest.json的“App模块配置”中勾选“Maps(地图)”，并根据项目实际情况勾选使用的三方地图SDK：

提示：App模块配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

使用前需到高德开放平台 创建应用并申请Key

打开项目的manifest.json文件，在“App模块配置”项的“Maps(地图)”下，勾选“高德地图”：

登录 高德开放平台 ，进入“控制台”，在“账号信息”的“基本信息”中可获取“用户名”：

使用前需到百度开放平台 创建应用并申请Key

打开项目的manifest.json文件，在“App模块配置”项的“Maps(地图)”下，勾选“百度地图”：

HBuilderX3.4.0+版本新增支持

使用前需到Google地图开放平台 创建应用并申请APIKey

打开项目的manifest.json文件，在“App模块配置”项的“Maps(地图)”下，勾选“Google地图”：

---

## 真机运行常见问题@run | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/run-app-faq.html

**Contents:**
- # 真机运行常见问题
- # 第1步 HX中没有运行到手机的菜单
- # 第2步 电脑是否能检测到手机
- # 第3步 电脑与手机是否建立信任调试关系
  - # 3.1 Android设备信任
  - # 3.2 iOS设备信任
- # 第4步 HBuilderX检测手机
  - # 4.1 检测Android手机
    - # 4.1.2 adb占用问题
    - # 4.1.2 ADB版本问题

从在HBuilder/HBuilderX菜单里点真机运行，程序会执行如下几个步骤：

HBuilderX支持项目类型较多，只有uni-app、5+app、wap2app可以真机运行。它们都会在项目根目录下有个manifest.json文件（uni-cli项目会在src目录下有manifest.json）。

如果是web项目，不能运行到手机，只能运行到浏览器。

如果项目管理器显示项目图标的话，web项目前面的图标是W，5+app和wap2app的图标是A，uni-app的项目图标是方型U，uni-app x的项目图标是圆形U。

如果项目类型未能正确识别，可以对项目点右键 - 重新识别项目类型

OS的资源管理器，是否可以发现手机设备。如果插入usb线后电脑检测不到手机设备，那么hx也肯定检测不到。

usb和线的问题，可以通过交叉验证来排查具体的问题。

如果您使用的是模拟器，可以不关心usb口和数据线的问题。

Android11起支持无线adb，可不插线进行开发调试，插件市场有三方插件可用，详见

老版的windows需要安装手机驱动。如果拒绝安装驱动，也无法检测到手机。安装驱动精灵或360、腾讯的各种手机助手或华为手机助手 可解决驱动安装问题。

如果在启动HBuilderX后才安装驱动连接上手机，可能需要重启HBuilderX。

如果你的itunes也连不上你的iOS设备，那HBuilderX肯定也连不上。

有的电脑会停用 Apple Mobile Device Service，这是一个windows系统服务，停止后itunes也无法连接iOS设备。可以在 windows控制面板的服务中手动启动，也可以直接启动itunes，因为itunes启动后会自动启动 Apple Mobile Device Service。

Apple Mobile Device Service 服务启动后，需要重新插拔iOS设备才能检测到。

HBuilderX真机运行并不需要一直开着itunes。itunes仅用于验证手机与电脑是否可正常连接。

如果您的Android手机已开启USB调试模式，那么数据线连接好电脑和手机后，手机端会弹出确认框，询问是否同意该电脑调试本手机。点击同意进行授权。

如果手机未开启USB调试模式，那么按如下步骤开启。

Android手机的设置中，有一个开发人员选项。不同Rom的入口不一样，有的在 系统中，有的叫 系统和更新 或 更多设置

如果你找不到这个选项，那说明这个rom默认隐藏了该选项。此时需要上网查一下这个rom如何打开开发人员选项。

连续点击打开开发人员选项后，返回到之前的系统或系统和更新或更多设置中找开发人员选项。

找到开发人员选项后，往下翻，有几个设置项：

以上设置完成后，如果数据线和电脑连接正常，那么手机端会弹出一个确认框：是否允许该电脑调试本手机。点击同意。并且最好是把始终同意该设备调试勾上。

注意，Android5.0及以上系统，不要使用访客模式。这种模式下无法成功运行。

由于Android的开源性，不少国产Android rom的魔改造成兼容性问题：

iOS设备比较简单，数据线连接好电脑和手机后，手机端会弹出确认框，询问是否同意该电脑调试本手机。点击同意进行授权。

特别注意：Windows连接Android手机，一定要确保电脑已安装相应的手机驱动。

在前述工作完成后，终于到了HBuilderX的环节了。

HBuilderX自带一个ADB，用于调试Android手机。在HBuilderX的安装目录的\plugins\launcher-tools\tools\adbs\adb.exe

您也可以在HBuilderX的设置-运行设置中，选择其他的adb和端口。有些三方模拟器必须使用它自定义的端口才能连接。这需要查阅三方模拟器提供商的官方说明。

但如果您自定义了adb和端口，可能只能连接指定的模拟器。连接其他真机时可能无法识别，此时需要清空自定义设置。

当HBuilderX检测手机时，系统进程中会出现adb.exe。如果系统进程出现多个adb.exe，也可能还有其他名字，比如tadb.exe、kadb.exe，请把HBuilderX关闭，然后把进程里的相关adb进程都强制杀掉。

如果您在HBuilderX的运行界面检测不到手机，可以在cmd窗口里找到HBuilderX的安装目录的 \plugins\launcher-tools\tools\adbs\adb.exe，执行命令：adb.exe devices

这个命令就是google官方的检测手机的命令，如果这个命令拉出的device列表是空的，那么如下可能：

有时mac上不得不修改adb_usb.ini

Android的ADB服务已经被大量软件滥用，除了各种手机助手自带adb，其他如QQ、搜狗输入法、暴风影音、酷狗音乐、阿里旺旺等众多软件都自带adb。

有些工具的adb版本低且独占手机通道，就会导致HBuilderX无法连接手机。

如果你找不到被谁占用，则还可以使用如下方式检测，寻找幕后黑手：

在输出结果中找到类似下面的一行： TCP 127.0.0.1:5037 0.0.0.0:0 LISTENING 5816 如果内容为空，可能是没有程序在占用adb端口。

或者使用 netstat -ano | findstr 5037>d:/1.txt 输出到文件中查找。

根据查询结果确认端口为5037的连接被那个进程占用，结果中显示的“5816”表示占用adb端口的进程PID。

在命令行中输入：tasklist | findstr 5816 在输出结果中找到类似下面的一行：

示例源码如下，请查看 pre > code 标签中的内容

adb.exe（名称一般不是adb.exe，以adb.exe举例）为启动的adb进程。

或者手工在任务管理器中定位这个进程，打开任务管理器后，进入进程选项卡，如果列表里有PID，直接找；如果列表里没有PID，点菜单查看-选择列，勾上PID。

如果以上方式仍然不行，还有一种可能是手机对adb的版本有特定要求（遇到一些魅族手机有此问题），此时需要更换HBuilder的adb版本。

HBuilder安装目录下带了多个版本的adb。

替换版本前，将默认版本的adb.exe备份下。然后把其他版的adb.exe拷贝出来替换主目录下的exe。

当然也可下载Android SDK ，将其中的adb替换HBuilderX自带的adb。

如果上面的方法还无法解决，菜单【帮助】【查看运行日志】，看下日志中存在什么相关的错误。 也可到DCloud论坛 发帖。发帖时，详细说明操作系统信息、HBuilderX版本号、手机型号以及手机系统信息，并提供运行日志。

iOS设备连接比较简单，电脑安装itunes（或iTools），只要这些软件能连上iOS设备，HBuilderX就能连上。

[Windows 32位 iTunes]下载地址 、所有版本的iTunes下载地址

[Windows 64位 iTunes]下载地址 、所有版本的iTunes下载地址

如果以上方案都无法解决，有可能是因为本地库与iTunes带的库冲突了， 一般是iTunes库目录（32位系统目录为：C:\Program Files\Common Files\Apple\Apple Application Support，64位系统目录为：C:\Program Files (x86)\Common Files\Apple\Apple Application Support）下的dll文件 和系统库目录（32位系统目录为：C:\WINDOWS\system32，64位系统目录为：C:\Windows\SysWOW64）下的dll重名， 可将iTunes库目录下的同名dll文件拷贝到系统库目录下，或者将系统目录下的同名dll文件重命名或删除，然后再重启HBuilder或者重试真机运行。

有时iTunes安装时依赖库会丢失，需要重装iTunes解决问题。

iTunes无法检测到手机，iTunes弹窗提示：iTunes 在您的电脑上检测到不兼容的蓝牙软件，可能无法正常运行。

请禁用或更新某些蓝牙驱动。或参考Apple 论坛解决方案

HBuilderX的运行界面检测到手机后，可以点击运行。此后会继续进行：编译、安装基座到手机、同步应用代码和资源到基座、启动基座并运行应用。这些步骤仍然可能出错。

发生此情况一般为检测到手机后，中间因为其他软件连接断开了，需要重新插拔手机或重启HBuilderX。

参考https://ask.dcloud.net.cn/article/1336

Android没有root的手机只有SDCard才有权限。不过此SDCard并不是非得外插一张实体sd卡，是手机里一个叫SDCard的根目录。 如果是使用Android模拟器，在模拟器里可以配置SDCard是否存在及大小。

此情况已过期，目前正常手机都有SDCard目录。

Android手机第一次安装基座应用时，手机端大多有各种杀毒软件要检测一会才会放行，需要等一会。

这是应用的js代码的问题，启动画面的关闭是可配置的。参考 https://ask.dcloud.net.cn/article/110

iTunes支持wifi同步，如果iOS设备启动了wifi同步，电脑端的iTunes就可以检测到，进而HBuilder也可以检测到。

这种情况是adb连接手机成功，但copy项目文件到手机上失败了。重新运行真机调试。 或者检查待运行工程的目录名文件名是不是有特殊符号或超长导致Android不识别。

参见genymotion模拟器报INSTALL_FAILED_CPU_ABI_INCOMPATIBLE的解决办法 其他模拟器的适配在论坛中搜索即可。

参考https://ask.dcloud.net.cn/article/565

HBuilderX 3.5.3之后的版本，App真机运行 使用Node运行，不再依赖Java。

如果以下解决方法，没有解决问题，请到 Ask论坛 详细说明问题（需要包含操作系统、HBuilderX版本、项目信息、基座信息、手机信息、控制台截图等，详细的信息有助于我们排查问题）

遇到mumu模拟器问题，请尝试以下解决方法

某些情况下，如下图所示，点击菜单没有反应。

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
360、腾讯的各种手机助手
```

Example 3 (unknown):
```unknown
\plugins\launcher-tools\tools\adbs\adb.exe
```

Example 4 (unknown):
```unknown
adb.exe devices
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-schemes

**Contents:**
  - # 设置UrlSchemes
  - # 浏览器中通过href启动应用
  - # App中处理scheme启动传递的参数
      - 本页导读

iOS系统中，由于沙盒的限制，导致程序之间相互隔离，需要url scheme协议来实现程序间的通信，通过定义自己的scheme协议，可以非常方便的实现其它三方App调用你的App。

HBuilderX自带标准真机运行基座的UrlSchemes为"hbuilder://"，方便开发者调测。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “iOS设置” -> “UrlSchemes” 项中进行设置：

注意： 字符串建议使用小写字母（不要使用特殊字符、中文等），如设置为"test"，那么其他App呼起你的app的scheme协议就是"test://"； 多个scheme使用 "," 分割，每个字符串为一个urltypes； 如果可视化界面无法编辑，请切换到“源码视图”删除urltypes节点数据重新操作。

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注：为了向下兼容，HBuilderX源码视图配置时schemes属性值支持字符串数组，上面示例中的值也可以这么配置["hbuilder","myuniapp"]

安装应用后，我们可以在H5页面中，通过href直接调用应用：

示例源码如下，请查看 pre > code 标签中的内容

当其它三方App通过scheme启动App时，可以通过plus.runtime.arguments获取完整的urlscheme字符串。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "urltypes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

---

## 安心打包使用指南 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/build/SafePack

**Contents:**
- # 安心打包使用指南
- # 安心打包原理
- # 安心打包优势
- # 使用安心打包
- # 注意事项
- # FAQ
- # Android 安心打包问题汇总
  - # Q1: Windows：控制台提示打包成功，相应目录下没有apk文件
  - # Q2: fakeLogOpen(/dev/log_crash) failed
  - # Q3: 启动图.9.png格式问题

过去，App云端打包时需要将应用代码、打包证书等提交到DCloud云端打包机，在云端打包机的原生开发环境中生成安装包apk/ipa。 DCloud云端服务器虽然不会保存开发者应用代码和证书等信息，但开发者可能还是不放心，或者担心在网络传输过程中可能存在拦截泄漏的风险。

而离线打包，不但不方便，还有2个重要功能无法使用：

HBuilderX2.9.9版本新增Android平台安心打包功能，不再提交应用代码及打包证书到云端服务器，同时也减轻云端打包机压力，缩短高峰期云端打包等待时间。 HBuilderX3.0.7版本新增iOS平台支持安心打包功能（仅支持MacOS）

因为大多数打包，并不改动原生部分（主要是manifest.json），只修改前端代码。此时将无需从云端打包机下载原生包，打包速度会非常快。

新版本HBuilderX云端打包时无需额外操作，默认会勾选“安心打包”，如下图所示：

如果没有安装安心打包插件，会弹出以下提示框，点击“安装”继续

插件安装完成后需重新点击“打包”按钮提交打包

打包完成后自动保存到项目的"unpackage/release/apk/"目录

如果清空了这个目录，那么下次打包将执行首次打包逻辑。

** 问题：** 某些用户反馈，windows电脑，控制台提示Android安心打包成功，进入相应目录(unpackage/release/apk)，目录下找不到apk文件 ** 原因** ：unpackage/release/apk目录，没有写入权限，移动apk文件失败了。

某些情况下，首次提交安心打包，您可能会遇到下列错误：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

** 原因：** 启动图xxx.9.png不是有效9.png图片，格式错误导致。 ** 解决方法：** 重新生成有效的9.png图片

** 备注：** 部分用户可能会提问，同样.9.png项目，为什么传统打包成功，安心打包失败呢？因为：安心打包校验机制更为严格。 ** 文档：** .9.png图片相关文档

示例源码如下，请查看 pre > code 标签中的内容

** 备注：** HBuilderX 3.1.10及以上版本生效

示例源码如下，请查看 pre > code 标签中的内容

** 原因：** 可能是用户手动点击安装了证书导致打包签名失败。

** 解决方法：** 打开钥匙串访问删除相关用户手动安装的证书后重新打包（下图仅供参考，需开发者判断哪些证书是手动安装的证书）。

如果您遇到安心打包问题，且无法解决，请加QQ群827137391。

进群需要提供操作系统和HBuilderX版本号信息，提问请提交错误日志或截图。

本群仅限反馈安心打包问题，请勿发布无关信息。

**Examples:**

Example 1 (unknown):
```unknown
Android 安心打包问题汇总
```

Example 2 (go):
```go
[Error] W: fakeLogOpen(/dev/log_crash) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Info] I: Copying libs... (/lib)
[Info] I: Building apk file...
[Info] I: Copying unknown files/dir...
[Info] I: Built apk...
[Error] Apk tool compile package to apk failed
[Info] 制作结果：Failed. Reason:
```

Example 3 (go):
```go
[Error] W: fakeLogOpen(/dev/log_crash) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Info] I: Copying libs... (/lib)
[Info] I: Building apk file...
[Info] I: Copying unknown files/dir...
[Info] I: Built apk...
[Error] Apk tool compile package to apk failed
[Info] 制作结果：Failed. Reason:
```

Example 4 (go):
```go
[Error] W: fakeLogOpen(/dev/log_crash) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Info] I: Copying libs... (/lib)
[Info] I: Building apk file...
[Info] I: Copying unknown files/dir...
[Info] I: Built apk...
[Error] Apk tool compile package to apk failed
[Info] 制作结果：Failed. Reason:
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-android-schemes.html

**Contents:**
  - # 设置UrlSchemes
  - # 浏览器中通过href启动应用
  - # App中处理scheme启动传递的参数
      - 本页导读

Android中的url scheme是一种页面跳转协议，通过定义自己的scheme协议，可以非常方便的实现其它三方App调用你的App。

HBuilderX自带标准真机运行基座的UrlSchemes为"hbuilder://"，方便开发者调测。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “Android设置” -> “UrlSchemes” 项中进行设置：

注意： 字符串建议使用小写字母（不要使用特殊字符、中文等），如设置为"test"，那么其他App呼起你的app的scheme协议就是"test://"； 多个scheme使用 "," 分割，每个字符串为一个scheme； 如果可视化界面无法编辑，请切换到“源码视图”删除schemes节点数据重新操作。

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注：为了向下兼容，HBuilderX源码视图配置时schemes属性值支持字符串数组，上面示例中的值也可以这么配置["hbuilder","myuniapp"]

安装应用后，我们可以在H5页面中，通过href直接调用应用：

示例源码如下，请查看 pre > code 标签中的内容

当其它三方App通过scheme启动App时，可以通过plus.runtime.arguments获取完整的urlscheme字符串。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

---

## Geolocation定位 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html

**Contents:**
- # Geolocation定位
  - # 系统定位
    - # iOS平台
    - # Android平台
  - # 高德定位
    - # 参数说明
    - # 高德开放平台用户名
  - # 腾讯定位
    - # 参数说明
  - # 商业授权相关说明

定位模块封装了OS自带的系统定位，及市场上主流的三方定位SDK，如高德定位、腾讯定位等。并提供统一的JS API调用定位能力。

三方定位（高德、腾讯、谷歌等）是商业收费服务，需获取授权，注意避免侵权。详见

使用定位功能需在项目manifest.json的“App模块配置”中勾选“Geolocation(定位)”，并根据项目实际需求勾选使用的三方定位SDK：

HBuilderX3.2.16开始独立出“系统定位”模块

使用系统定位需在“App模块配置”项的“Geolocation(定位)”下，勾选“系统定位”：

系统定位调用设备的操作系统提供的定位服务，只支持wgs84坐标系，不同设备对定位功能支持的情况有所差异。

由苹果iOS系统提供定位服务，可以获取经纬度信息，支持解析地址信息，即可以直接返回城市街道信息。

只可以获取经纬度信息，不支持解析地址信息，即无法返回城市街道信息。

标准Android系统的定位服务是Google的GMS服务，需连接Google服务器。中国大陆地区用户无法翻墙，导致无法使用定位，或者很多国产手机阉割掉了GMS，也导致无法使用定位。

国内手机厂商早期均没有内置替代GMS的位置服务，这些设备上只能使用三方定位。但后期大品牌手机和三方定位合作，内置了替代GMS的版本。如下Android手机厂商的新款手机都支持系统定位：

其他小众品牌可能不支持，主流品牌中较老的机型也不支持，暂无机型清单，需自行测试。

需要向高德申请商业授权，参考:商业授权相关说明，使用前需登录 高德开放平台 创建应用申请Key

使用高德定位需在“App模块配置”项的“Geolocation(定位)”下，勾选“高德定位”：

登录 高德开放平台 ，进入“控制台”，在“账号信息”的“基本信息”中可获取“用户名”：

HBuilderX4.31 新增支持 腾讯定位 需要向腾讯申请商业授权，参考:商业授权相关说明，使用前需登录 腾讯位置服务官网 创建应用申请Key

使用腾讯定位需在“安卓/iOS模块配置”项的“Geolocation(定位)”下，勾选“腾讯定位”：

2021年起，高德、腾讯、百度等地图服务商开始商业授权。

例外：如果是公益类应用，可以申请豁免商业授权。只要不是公益应用，不管你有多少用户，都需要获取商业授权。

如需购买地图的商业授权，请点击 获取优惠 。

部分中介采用共享地图授权的模式，吸引开发者向该中介采购地图授权。本质是中介向地图厂商支付授权费，然后把开发者的应用创建到中介在地图厂商的账户下。

这种做法是纯粹的骗局。因为开发者向中介支付了费用，虽然可能低于地图厂商的授权费，但开发者并没有获得商业许可。地图厂商的商业许可是出具给中介的，开发者仍然是侵权的。地图厂商仍然会给您打电话催缴商业许可费用。

所以请开发者务必注意，付款时一定要拿到地图厂商向您出具的授权许可。切勿付了款又没有得到授权，财物两空。

对于已经被中介欺骗的开发者，请尽快向公安报案。

海外用户使用google地图，也需要付费，支持按量付费，具体请参阅google地图官网。

---

## 嵌入鸿蒙原生组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/native-component.html

**Contents:**
- # 嵌入鸿蒙原生组件
- # 注册鸿蒙原生组件
  - # 接口定义
  - # 示例代码
- # 调用鸿蒙原生组件
  - # 属性
  - # 事件
  - # 示例代码
- # 插件市场案例
- # WebView 组件之上展示原生组件

鸿蒙系统有很多原生组件，从 HBuilderX 4.62 版开始 uni-app 可以通过 uts 插件方式注册为 WebView 支持的原生组件，并且支持同层渲染。

目前鸿蒙原生组件仅支持定义在 ets 文件中，uts 插件支持导入 ets 文件，本章节主要介绍在 ets 文件中注册原生组件，其他与调用鸿蒙原生 API相同，请参考调用鸿蒙原生 API章节。

示例源码如下，请查看 pre > code 标签中的内容

编辑或创建 app-harmony/button.ets 填写下面内容：

示例源码如下，请查看 pre > code 标签中的内容

以上代码在 ets 文件内向 uni-app 注册了一个原生组件 ButtonComponent，标签名为 button，在 uts 插件内导入此 ets 文件即可生效。

编辑或者新建 app-harmony/index.uts 文件引入定义的 ets 文件

示例源码如下，请查看 pre > code 标签中的内容

在 WebView 中使用 embed 来渲染原生组件，在 Vue 文件中使用的 embed 组件是经过 uni-app 封装的，更便于使用，支持传递额外的属性和事件。

所有 embed 组件上注册的事件均会转发到原生层。

示例源码如下，请查看 pre > code 标签中的内容

目前 WebView 组件是使用嵌入原生组件进行的封装，如果你希望在 WebView 之上展示内容，可参考下面方案解决。

页面之上展示内容需要嵌入原生组件方案来解决，并设置 nodeRenderType= NodeRenderType.RENDER_TYPE_DISPLAY

示例源码如下，请查看 pre > code 标签中的内容

通过设置 nodeRenderType，可在 WebView 组件之下引入该组件，实现内容覆盖在 WebView 组件上。

**Examples:**

Example 1 (typescript):
```typescript
export interface NativeEmbedEvent {
  detail: object;
}

export interface NativeEmbedBuilderOptions {
  width: number;
  height: number;
  on?: Map<string, (event?: NativeEmbedEvent) => void>;
}

export interface DefineNativeEmbedOptions<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
> {
  builder: (options: T) => void;
}

export declare function defineNativeEmbed<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
>(tag: string, options: DefineNativeEmbedOptions<T>): void;
```

Example 2 (typescript):
```typescript
export interface NativeEmbedEvent {
  detail: object;
}

export interface NativeEmbedBuilderOptions {
  width: number;
  height: number;
  on?: Map<string, (event?: NativeEmbedEvent) => void>;
}

export interface DefineNativeEmbedOptions<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
> {
  builder: (options: T) => void;
}

export declare function defineNativeEmbed<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
>(tag: string, options: DefineNativeEmbedOptions<T>): void;
```

Example 3 (typescript):
```typescript
export interface NativeEmbedEvent {
  detail: object;
}

export interface NativeEmbedBuilderOptions {
  width: number;
  height: number;
  on?: Map<string, (event?: NativeEmbedEvent) => void>;
}

export interface DefineNativeEmbedOptions<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
> {
  builder: (options: T) => void;
}

export declare function defineNativeEmbed<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
>(tag: string, options: DefineNativeEmbedOptions<T>): void;
```

Example 4 (typescript):
```typescript
export interface NativeEmbedEvent {
  detail: object;
}

export interface NativeEmbedBuilderOptions {
  width: number;
  height: number;
  on?: Map<string, (event?: NativeEmbedEvent) => void>;
}

export interface DefineNativeEmbedOptions<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
> {
  builder: (options: T) => void;
}

export declare function defineNativeEmbed<
  T extends NativeEmbedBuilderOptions = NativeEmbedBuilderOptions
>(tag: string, options: DefineNativeEmbedOptions<T>): void;
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-idfa.html

**Contents:**
  - # 如何判断是否需要开启广告标识（IDFA）
  - # 如何配置在用户同意隐私政策后使用IDFA
  - # 设置开启广告标识（IDFA）
    - # 设置 NSUserTrackingUsageDescription 隐私描述
  - # 配置 App 隐私
    - # 设备 ID
    - # 广告数据
    - # 崩溃数据
  - # App中获取IDFA标识
  - # 注意事项

2012年9月份iOS6发布，IDFA面世，主要用于给开发者跟踪应用中广告的投放效果，但很多应用（或三方SDK）会获取IDFA作为设备唯一标识使用。 iOS14.5 发布之后，苹果要求应用获取 IDFA 时，需弹出用户许可收集跟踪数据的授权框，如果没有弹出授权框则可能会被App Store审核拒绝，提示违反5.1.2规则：

示例源码如下，请查看 pre > code 标签中的内容

如果上架App Store遇到上述问题，请按本文步骤配置开启IDFA，重新打包后再提交审核

注意： uni-ad中的基础广告无需访问IDFA，没有勾选三方增强广告SDK时可以不开启广告标识（IDFA） 对于非广告类的三方SDK，我们会密切关注其官方的版本更新，待官方出了不包含IDFA的版本我们会尽快适配升级

应用需要开启广告标识，默认会在应用启动时自动获取IDFA，从而触发跟踪App活动授权提示框，这样可能导致被部分合规检测机构判定为不合规。 如需避免此问题，可在manifest.json中配置 privacyRegisterMode 为 manual 避免应用启动时自动获取IDFA，如下：

示例源码如下，请查看 pre > code 标签中的内容

并且在用户点击同意隐私政策时调用 plus.runtime.argeePrivacy() 方法，这会触发自动获取IDFA操作，弹出跟踪App活动授权提示框。

打开项目的manifest.json文件，在 “App常用其它设置” -> “iOS设置” 中勾选“使用广告标识（IDFA）”：

开启广告标识（IDFA）后，云端打包默认隐私描述为“请放心，开启权限不会获取您在其他站点的隐私信息，该权限仅用于标识设备并保障服务安全与提示浏览体验”。 如需自定义隐私描述，打开项目的 manifest.json 文件，在 “App权限配置” -> “iOS隐私信息访问的许可描述” 下配置“跟踪用户的活动(NSUserTrackingUsageDescription)”：

隐私描述是为了告诉用户，应用为什么要跟踪用户及访问设备的IDFA，配置的描述内容会展示在授权框上，参考以下建议描述说明：

配置后需提交云端打包后才能生效，真机运行时请使用自定义调试基座 ，运行时弹出授权提示框显示效果如下：

开启广告标识（IDFA）后，提交App Store审核之前，需登录App Store Connect ，进入App详情页面，打开 “App 隐私” -> “数据类型”，点击“编辑”，勾选 “是，我们会从此App收集数据”：

点击“下一步”，在标识符项中勾选“设备ID”，在诊断数据向中勾选“崩溃数据”，如果使用了uni-ad则需在使用数据项中勾选“广告数据”：

点击“设备 ID”旁的“编辑”，勾选“其它用途”：

如果使用了uni-ad，需同时勾选“第三方广告”

点击“广告数据”旁的“编辑”，勾选“第三方广告”：

点击“崩溃数据”旁的“编辑”，勾选“App 功能”：

如果使用了uni-ad，需同时勾选“第三方广告”

通过plus.device.getInfo 获取：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

参考Uni插件示例：https://ext.dcloud.net.cn/plugin?id=726

如果配置了开启广告标识（IDFA）并且也配置了 NSUserTrackingUsageDescription隐私描述，但是应用还是被App Stroe审核拒绝，且提示违反5.1.1规则：

示例源码如下，请查看 pre > code 标签中的内容

则可能是描述内容过于简单，没有准确说明应用为什么要跟踪用户及访问设备的IDFA，可参考上文的建议更新NSUserTrackingUsageDescription描述内容

如果配置了开启广告标识（IDFA）并且也配置了 NSUserTrackingUsageDescription隐私描述，但是应用还是被App Stroe审核拒绝，且提示违反2.1规则：

示例源码如下，请查看 pre > code 标签中的内容

则可能是App Store Connect配置 “App 隐私”的选项不对，请参考上文重新 配置 “App 隐私”中的选项。

如果按照上述描述勾选了IDFA 和配置了NSUserTrackingUsageDescription隐私描述，但是真机运行App启动时没有弹出授权提示框，可能的原因是，手机的系统版本是iOS14以下的，或者是iOS14.5的手机，但是手机“设置-隐私-跟踪”里，系统默认将“跟踪选项”关闭了且灰色不可设置；目前这种情况还不确定是iOS的bug，还是是针对地区特殊对待，解决办法：可以将账号切换成一个美区的，这时“跟踪选项”是可以操作的；或者将手机设置还原成默认设置，这时App启动时也能弹出授权提示框，但只会弹出一次。

**Examples:**

Example 1 (sql):
```sql
Guideline 5.1.2 - Legal - Privacy - Data Use and Sharing


We noticed you do not use App Tracking Transparency to request the user's permission before tracking their activity across apps and websites. The app privacy information you provided in App Store Connect indicates you collect data in order to track the user, including Device ID and Precise Location.

Starting with iOS 14.5, apps on the App Store need to receive the user’s permission through the AppTrackingTransparency framework before collecting data used to track them. This requirement protects the privacy of App Store users.

Next Steps

Here are two ways to resolve this issue:

- You can remove the tracking functionality from your app and update your app privacy information in App Store Connect.
- If you decide to continue tracking users, you must implement App Tracking Transparency and request permission before collecting data used to track the user or device.

Resources

- See Frequently Asked Questions about the new requirements for apps that track users.
- Learn more about designing appropriate permission requests.
```

Example 2 (sql):
```sql
Guideline 5.1.2 - Legal - Privacy - Data Use and Sharing


We noticed you do not use App Tracking Transparency to request the user's permission before tracking their activity across apps and websites. The app privacy information you provided in App Store Connect indicates you collect data in order to track the user, including Device ID and Precise Location.

Starting with iOS 14.5, apps on the App Store need to receive the user’s permission through the AppTrackingTransparency framework before collecting data used to track them. This requirement protects the privacy of App Store users.

Next Steps

Here are two ways to resolve this issue:

- You can remove the tracking functionality from your app and update your app privacy information in App Store Connect.
- If you decide to continue tracking users, you must implement App Tracking Transparency and request permission before collecting data used to track the user or device.

Resources

- See Frequently Asked Questions about the new requirements for apps that track users.
- Learn more about designing appropriate permission requests.
```

Example 3 (sql):
```sql
Guideline 5.1.2 - Legal - Privacy - Data Use and Sharing


We noticed you do not use App Tracking Transparency to request the user's permission before tracking their activity across apps and websites. The app privacy information you provided in App Store Connect indicates you collect data in order to track the user, including Device ID and Precise Location.

Starting with iOS 14.5, apps on the App Store need to receive the user’s permission through the AppTrackingTransparency framework before collecting data used to track them. This requirement protects the privacy of App Store users.

Next Steps

Here are two ways to resolve this issue:

- You can remove the tracking functionality from your app and update your app privacy information in App Store Connect.
- If you decide to continue tracking users, you must implement App Tracking Transparency and request permission before collecting data used to track the user or device.

Resources

- See Frequently Asked Questions about the new requirements for apps that track users.
- Learn more about designing appropriate permission requests.
```

Example 4 (sql):
```sql
Guideline 5.1.2 - Legal - Privacy - Data Use and Sharing


We noticed you do not use App Tracking Transparency to request the user's permission before tracking their activity across apps and websites. The app privacy information you provided in App Store Connect indicates you collect data in order to track the user, including Device ID and Precise Location.

Starting with iOS 14.5, apps on the App Store need to receive the user’s permission through the AppTrackingTransparency framework before collecting data used to track them. This requirement protects the privacy of App Store users.

Next Steps

Here are two ways to resolve this issue:

- You can remove the tracking functionality from your app and update your app privacy information in App Store Connect.
- If you decide to continue tracking users, you must implement App Tracking Transparency and request permission before collecting data used to track the user or device.

Resources

- See Frequently Asked Questions about the new requirements for apps that track users.
- Learn more about designing appropriate permission requests.
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/use-html5plus.html

**Contents:**
    - # 条件编译调用 HTML5+
    - # uni-app不需要 plus ready
    - # uni-app 中的事件监听
      - 本页导读

uni-app App 端内置 HTML5+ 引擎，让 js 可以直接调用丰富的原生能力。

小程序及 H5 等平台是没有 HTML5+ 扩展规范的，因此在 uni-app 调用 HTML5+ 的扩展规范时，需要注意使用条件编译。否则运行到h5、小程序等平台会出现 plus is not defined错误。

示例源码如下，请查看 pre > code 标签中的内容

在html中使用plus的api，需要等待plus ready。 而uni-app不需要等，可以直接使用。而且如果你调用plus ready，反而不会触发。

在普通的 H5+ 项目中，需要使用 document.addEventListener 监听原生扩展的事件。

uni-app 中，没有 document。可以使用 plus.globalEvent.addEventListener 来实现。

示例源码如下，请查看 pre > code 标签中的内容

同理，在 uni-app 中使用 Native.js 时，一些 Native.js 中对于原生事件的监听同样需要按照上面的方法去实现。

**Examples:**

Example 1 (unknown):
```unknown
plus is not defined
```

Example 2 (javascript):
```javascript
// #ifdef APP-PLUS
var appid = plus.runtime.appid;
console.log('应用的 appid 为：' + appid);
// #endif
```

Example 3 (javascript):
```javascript
// #ifdef APP-PLUS
var appid = plus.runtime.appid;
console.log('应用的 appid 为：' + appid);
// #endif
```

Example 4 (javascript):
```javascript
// #ifdef APP-PLUS
var appid = plus.runtime.appid;
console.log('应用的 appid 为：' + appid);
// #endif
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment.html

**Contents:**
      - 本页导读

App端支付模块封装了市场上主流的三方支付平台SDK，提供JS API统一调用移动支付功能。

如果服务端使用uniCloud ，官方提供了uniPay 云端统一支付服务，极大提升支付业务的开发效率，强烈推荐给开发者使用，参考示例：https://ext.dcloud.net.cn/plugin?id=1835

使用支付功能需在项目manifest.json的“App模块配置”中勾选“Payment(支付)”，并根据项目实际情况勾选使用的三方支付平台：

提示：支付模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/migration-to-vue3.html

**Contents:**
- # main.js
- # 环境变量
- # 全局属性
- # 插件使用
- # 项目根目录必需创建 index.html 文件
- # 只支持使用 ES6 模块规范
  - # 模块导入
  - # 模块导出
- # vuex 用法
- # 避免在同一元素上同时使用 v-if 与 v-for

首先强调下：vue3支持选项式！vue3不是只支持组合式！

以下列举迁移到 vue3，必须适配的几个点，vue2 项目才能正常运行在 vue3 上。更多查看完整的非兼容特性列表

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

commonJS 需改为 ES6 模块规范

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

而 Vue3 中，v-if 总是优先于 v-for 生效。以上写法将会在 Vue3 中与预期不符合，由于语法上存在歧义，建议避免在同一元素上同时使用两者（更多 ）。

在 Vue3 中组件卸载的生命周期被重新命名

created 和 onLoad 生命周期执行顺序

created为组件生命周期，onLoad为页面生命周期。因此created执行先于onLoad更合理。

Vue3 在实现时 created 先于 onLoad 执行；Vue2 项目由于历史包袱较重不便修改，仅在使用组合式API时与Vue3对齐。

在编写代码时不应依赖 created 和 onLoad 生命周期执行顺序

Vue3 现在提供了一个emits选项，类似于现有props选项。此选项可用于定义组件可以向其父对象发出的事件， 更多

强烈建议使用emits记录每个组件发出的所有事件。

这一点特别重要，因为去除了.native修饰符。emits 现在在未使用声明的事件的所有侦听器都将包含在组件的中$attrs，默认情况下，该侦听器将绑定到组件的根节点。

示例源码如下，请查看 pre > code 标签中的内容

可在执行事件的元素上添加 data-eventsync="true" 属性以解决此问题，如：

示例源码如下，请查看 pre > code 标签中的内容

Vue3 的 v-model 相对 Vue2 来说 ，有了较大的改变。可以使用多 model,相应语法也有变化。更多

用于自定义组件时，Vue3 v-model prop 和事件默认名称已更改 props.value 修改为 props.modelValue ,event.value 修改为 update:modelValue

示例源码如下，请查看 pre > code 标签中的内容

将之前的 this.$emit('input') 修改为 this.$emit('update:modelValue') ，vue3 中将省略这一步骤

自定义组件上的 v-model 相当于传递了 modelValue prop 并接收抛出的 update:modelValue 事件：

示例源码如下，请查看 pre > code 标签中的内容

若需要更改 model 名称，作为组件内 model 选项的替代，现在我们可以将一个 argument 传递给 v-model：

示例源码如下，请查看 pre > code 标签中的内容

Vue3 将不支持 slot="xxx" 的用法 ，请使用 v-slot:xxx 用法。更多

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

从 Vue 3.0 开始，过滤器已删除，不再支持，建议用方法调用或计算属性替换它们。更多

在 Vue3 中，处理 API Promise 化 调用结果的方式不同于 Vue2。更多

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 Vue3 组合式 API 中，也需要遵循 uni-app 生命周期钩子规范, 如 onLaunch 等应用生命周期仅可在 App.vue 中监听，使用中请注意生命周期钩子的适用范围。查看全部生命周期钩子

只能在 <script setup> 单文件语法糖或 setup() 方法中使用生命周期钩子，以 A 页面跳转 B 页面传递参数为例：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 Vue3 中，this 对象下的 $mp 调整为 $scope

在 Vue3 中，如果 nvue 使用了 Vuex 的相关 API，需要在 main.js 的 createApp 的返回值中 return 一下 Vuex 示例：

示例源码如下，请查看 pre > code 标签中的内容

App，小程序端源码调试，需要在 vite.config.js 中主动开启 sourcemap

示例源码如下，请查看 pre > code 标签中的内容

在 vue3 的小程序平台中，监听原生的点击事件可以先使用 tap。 在 vue3 中，移除了.native 修饰符，所以编译器无法预知 click 是要触发原生事件，还是组件的自定义事件，故并未转换成小程序的 tap 事件。

vue3 出于性能考虑，style 中暂不支持 div、p 等 HTML 标签选择器，推荐使用 class 选择器，template 中的 HTML 标签仍会进行转换 。

均可以通过在 manifest.json 的 mp-weixin 中配置 minified 为 true 来解决

示例源码如下，请查看 pre > code 标签中的内容

vue3 支持的范围是：Android > 4.4（具体因系统 webview 版本而异，原生安卓系统升级过系统 webview 一般 5.0 即可，国产安卓系统未使用 x5 内核时一般需 7.0 以上）, ios >= 10

Android < 4.4，配置 X5 内核支持，首次需要联网下载，可以配置下载 X5 内核成功后启动应用，详情

web 平台、app 平台 vue3 项目不再支持小程序自定义组件

vue3 nvue 暂不支持 recycle-list 组件

vue3 在 h5 平台发行时，为了优化包体积大小，会默认启动摇树，仅打包明确使用的 api， 如果要关闭摇树，可以在 manifest.json 中配置：

示例源码如下，请查看 pre > code 标签中的内容

vue3 全平台新增：通过 props 来获取页面参数的使用方式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

因运行平台限制，目前在小程序和 App 端不支持插值方式定义国际化,需要使用 Messages Functions 定义国际化信息，参考文档

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

因为node-sass已经停止维护，所以vue3默认使用dart-sass。

从 HBuilderX 4.56+ ，vue2 项目也将默认使用dart-sass预编译器。

示例源码如下，请查看 pre > code 标签中的内容

解决方案：/deep/ 替换成::v-deep

解决方案：使用 math.div() 替换除法运算符 详情，如果遇到@use 'sass:math';编译报错，可以在uni.scss中定义，详情

解决方案：calc 在特定情况需要带单位，比如：width: calc(100% - 215) 修改为：width: calc(100% - 215px)

**Examples:**

Example 1 (sql):
```sql
// 之前 - Vue 2
import Vue from 'vue'
import App from './App'
Vue.config.productionTip = false    // vue3 不再需要
App.mpType = 'app'    // vue3 不再需要
const app = new Vue({
...App
})
app.$mount()
```

Example 2 (sql):
```sql
// 之前 - Vue 2
import Vue from 'vue'
import App from './App'
Vue.config.productionTip = false    // vue3 不再需要
App.mpType = 'app'    // vue3 不再需要
const app = new Vue({
...App
})
app.$mount()
```

Example 3 (sql):
```sql
// 之前 - Vue 2
import Vue from 'vue'
import App from './App'
Vue.config.productionTip = false    // vue3 不再需要
App.mpType = 'app'    // vue3 不再需要
const app = new Vue({
...App
})
app.$mount()
```

Example 4 (sql):
```sql
// 之前 - Vue 2
import Vue from 'vue'
import App from './App'
Vue.config.productionTip = false    // vue3 不再需要
App.mpType = 'app'    // vue3 不再需要
const app = new Vue({
...App
})
app.$mount()
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/env.html

**Contents:**
  - # vue-config.js
  - # package.json
  - # .env
  - # 注意
      - 本页导读

uni-app 项目中配置环境变量主要有如下三种方式：

在 vue.config.js 中可以修改 webpack 配置，包括环境变量，具体参考 vue-config.js。

在自定义条件编译平台时，可以在 package.json 文件的 env 节点下配置环境变量，具体参考 package.json

HBuilderX 中的 uni-app vue3 和 uni-app x (4.25+) 项目及 CLI 创建的项目中可以在根目录中放置 .env 文件来指定环境变量，具体参考：Vue2 ，Vue3 。

**Examples:**

Example 1 (unknown):
```unknown
uni-app vue3
```

Example 2 (unknown):
```unknown
uni-app x (4.25+)
```

---

## uni版本说明 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/version.html

**Contents:**
- # uni版本说明
- # 版本命名方式
- # 编译器、运行时、打包机的版本差异
  - # cli方式创建项目造成的差异
  - # wgt热更新造成的差异
  - # 离线打包造成的差异
  - # 自定义基座造成的差异
- # 云打包机的引擎版本说明
  - # 版本列表
      - 本页导读

本文梳理了DCloud的HBuilderX、uni-app、uniCloud等产品的版本概念。这里的uni-app包含了uni-app x。

HBuilderX有正式版、alpha版、dev版。

dev版仅限受邀内测，对外开放的版本仅包含alpha和release正式版。

DCloud在每次更新发版时，随着HBuilderX的升级，会一起发布uni-app的本地运行插件、uniCloud的本地运行插件。并且会同时升级app的云打包机。

在HBuilderX 3.9以前，采用的是3段式版本号规则，大版本、小版本、补丁版本，如3.8.12。

这个版本号，在uni-app中使用uni.getSystemInfo可以获得。具体属性是uniRuntimeVersion和uniCompileVersion，类型是字符串。

在HBuilderX界面显示时，还会在末尾再增加一段发版日期，如3.8.12.20230817。上述api不会返回末段日期。

但是这种多段式字符串类型的版本号，不方便做比较。获取到uniRuntimeVersion后，需要再分割三段后分别比较。

并且字符串3段式中，3.9的下一个版本可以是3.10。这个情况又容易被误解，因为3.10很可能被误解为3.1，它和3.9到底谁大就容易混淆。

所以从HBuilderX 3.9起，取消了字符串三段式版本，改为了数字方式，如3.91。具体规则：

基于向下兼容的考虑，uniRuntimeVersion和uniCompileVersion仍然是字符串。

但在uni-app x的uni.getAppBaseInfo 和uni.getSystemInfo 中， 返回值新增了2个属性，uniCompilerVersionCode和uniRuntimeVersionCode，这2个是数字类型，可以直接用于比较。

另外，从HBuilderX 3.9起，条件编译也可以按版本号来编译，比如低版本编译成这样、高版本编译成另一个样子。这种条件编译也可以直接使用比较运算符来比较了。详见

uni-app有编译器和运行时，它们之前的版本在某些情况可能不一样，所以有uniCompileVersion和uniRuntimeVersion的区别，分别表示编译器版本和运行时版本。

如果正常使用HBuilderX 最新版进行云打包，不会出现不一致的情况。但开发者的需求较多，比如cli创建项目、在其他ide中开发、离线打包，就会造成DCloud无法控制的版本差异。

比如用3.91的编译器编译代码后运行在3.92的运行时上。

DCloud无法保障这些交叉版本互相之间的兼容性，虽然有可能正常使用，但DCloud采取的策略是："发现编译器和运行时版本不匹配，就会弹框报警"。

发生告警不代表一定不能运行，只不过需要开发者自行对稳定性做保障。只要开发者自测后发现你的应用可以正常使用，就可以在manifest里配置关闭告警。详见

还有一个经常遇到的误报是：“我的HBuilderX已经是最新版了，升级日志里提到的已解决问题，为什么没有仍然存在？”，其实有的是因为cli项目下编译器是旧的、有的是因为本地打包的sdk是旧的，有的是因为自定义基座的版本是旧的。

当使用HBuilderX创建项目时，uni-app的编译器在HBuilderX目录的plugin下，跟随HBuilderX升级而同步，并且对所有HBuilderX创建的项目生效。

当使用cli创建项目时，uni-app的编译器在项目下。cli是否升级，是开发者自主决定的。

即便是ide仍然使用HBuilderX，HBuilderX不管怎么升级都不会影响编译器版本。你需要在项目下手动npm update来升级编译器。

以及如果你想要安装less、scss等预编译器，也需要自己npm安装在项目下，而不是在HBuilderX的插件管理里安装。

wgt升级意味着编译wgt的HBuilderX版本和手机端已经存在的包的版本可能不匹配。

比如你使用HBuilderX 3.91 开发了第一版应用，并把安装包推给了你的手机用户，那么这些包的uniRuntimeVersion就是3.91。

后续你升级HBuilderX 为3.92，编译了下一版的wgt和apk，那么

如果要把uniCompileVersion是3.92的wgt包，热更新给uniRuntimeVersion为3.91的老用户，这些用户的客户端引擎没有升级，仅仅是前端资源热更新，就会因为3.92和3.91不匹配，默认就会弹框报警。

此时需要你提前测好新的wgt在老版客户端引擎上的兼容性，测试没问题时才能热更新，并在manifest里配置取消弹框。

如果测试有问题，且在前端层面无法处理，那就不能使用wgt更新，需要整包更新。或者回退HBuilderX版本，使用老版来编译wgt。

离线sdk是独立于HBuilderX的下载的，每个sdk都有版本号。其实就是uniRuntimeVersion。

而HBuilderX的版本决定了uniCompileVersion，如果HBuilderX编译的wgt和离线sdk的这2个版本不匹配，也会弹框报警。

解决方案同上，或者保持版本一致性，或者自己测试发现兼容性没有问题，然后在manifest配置忽略报警。

如果你使用自定义基座，该基座的apk是在项目下的unpackage目录中的。每次升级HBuilderX时，之前制作的自定义基座是不会跟随HBuilderX升级的，升级HBuilderX后你需要重新制作新版自定义基座。

HBuilderX已经有几百个版本了，因资源有限，不可能都每个版本都提供云打包机。

自HBuilderX 3.9起，云打包机版本保留了多个可用的版本，具体可用的云端打包版本参考下方的版本对应表。 打包时，服务端会根据用户使用的HBuilderX或cli版本去匹配最合适的打包版本，规则如下（匹配优先级从高到低）：

举个例子： 当云打包机有以下版本[3.7.11, 3.8.12, 3.92, 3.93, 3.99, 4.01, 4.15]可用时：

下面提供 uni-app 开发中各产品的版本对应表：

想避免版本兼容问题，还是推荐使用HBuilderX完成一切工作，包括创建项目、运行编译、云打包app。 因为在这套体系里，官方会对很多常见的问题做出提醒和引导，减少问题的概率。随着HBuilderX的升级，uni-app编译器、真机运行基座、云打包引擎都会升级。

**Examples:**

Example 1 (unknown):
```unknown
uniRuntimeVersion
```

Example 2 (unknown):
```unknown
uniCompileVersion
```

Example 3 (unknown):
```unknown
uniRuntimeVersion
```

Example 4 (unknown):
```unknown
uniRuntimeVersion
```

---

## DarkMode 适配指南 @darkmode | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/darkmode.html

**Contents:**
- # DarkMode 适配指南
- # 开启 DarkMode
  - # app-plus
    - # iOS 底部安全区域及安全区域外适配
  - # app-harmony
    - # 底部安全区域及安全区域外适配
  - # h5
  - # mp-weixin
- # 变量配置文件 theme.json
- # 配置示例

暗黑模式（Dark Mode），也被称为夜间模式或深色模式，是一种高对比度，或者反色模式的显示模式。是一种有利于在黑暗环境下观看手机的高对比度的模式。uni-app 的暗黑模式，是帮助开发者完成自己应用的暗黑模式的一批配置和 API。开发者可以参考本文实现自己应用的暗黑模式。

插件市场示例项目：https://ext.dcloud.net.cn/plugin?name=hello-darkmode

在 manifest.json 配置，应用的部分配置可通过变量的形式配置，在变量配置文件中定义不同主题下的颜色或图标，各平台配置如下：

在 manifest.json -> app-plus 中配置：

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json 文件的 "app-plus" 节点下添加 "safearea" 适配 iOS 的安全区域，"background" 对应正常模式下安全区域外的背景颜色，"backgroundDark"对应暗黑模式下安全区域外的背景颜色

示例源码如下，请查看 pre > code 标签中的内容

将 "offset" 置为 “none” 关闭安全区域的占位，注：关闭安全区域占位在刘海屏页面内容可能会被 “homeBar” 挡住，需要自行适配，具体请参考文档 iOS 刘海屏适配

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json -> app-harmony 中配置：

示例源码如下，请查看 pre > code 标签中的内容

如果在关闭页面时，在页面即将关闭时闪过一条白色，可以通过配置 backgroundDark 解决

在 manifest.json 文件的 "app-harmony" 节点下添加 "safearea" 适配 HarmonyOS 的安全区域，"background" 对应正常模式下安全区域外的背景颜色，"backgroundDark"对应暗黑模式下安全区域外的背景颜色

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json -> h5 中配置：

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json -> mp-weixin 中配置：

示例源码如下，请查看 pre > code 标签中的内容

全局配置 globalStyle 与页面支持

theme.json 用于颜色主题相关的变量定义，需要先在 themeLocation 中配置 theme.json 的路径，否则无法读取变量配置。包含以下属性：

示例源码如下，请查看 pre > code 标签中的内容

完成定义后，可在 pages.json 中全局配置或页面配置的相关属性中以 @ 开头引用，例如：

示例源码如下，请查看 pre > code 标签中的内容

配置完成后，调用相应 api 框架会自动所设属性，展示对应主题下的颜色。

pages.json（示例省略了主题相关以外的配置项）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果 manifest.json 对应平台配置中声明了"darkmode": true，uni.getSystemInfo 或 uni.getSystemInfoSync 的返回结果中会包含 theme 属性，值为 light 或 dark。

如果 manifest.json 对应平台配置未声明"darkmode": true，则无法获取到 theme 属性（即 theme 为 undefined）。

在 css 中，支持通过媒体查询 prefers-color-scheme 适配不同主题，与 Web 中适配方式一致，例如：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (php):
```php
manifest.json -> app-plus
```

Example 3 (yaml):
```yaml
darkmode:true
```

Example 4 (unknown):
```unknown
themeLocation
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-qq.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用QQ登录
    - # 示例代码
      - 本页导读

更多信息详见QQ官方文档 移动应用接入概述

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“QQ登录”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.login({
    provider: 'qq',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'qq',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 2 (css):
```css
uni.login({
    provider: 'qq',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'qq',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 3 (css):
```css
uni.login({
    provider: 'qq',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'qq',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 4 (css):
```css
uni.login({
    provider: 'qq',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'qq',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-share-weibo.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用新浪微博分享
    - # 示例代码
      - 本页导读

更多信息详见新浪微博官方文档 移动应用接入

打开项目的manifest.json文件，在“App模块配置”项的“Share(分享)”下，勾选“新浪微博分享”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.share({
    provider: 'sinaweibo',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 2 (css):
```css
uni.share({
    provider: 'sinaweibo',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 3 (css):
```css
uni.share({
    provider: 'sinaweibo',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 4 (css):
```css
uni.share({
    provider: 'sinaweibo',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-weibo.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用新浪微博登录
    - # 示例代码
      - 本页导读

更多信息详见新浪微博官方文档 移动应用接入

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“新浪微博登录”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.login({
    provider: 'sinaweibo',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'sinaweibo',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 2 (css):
```css
uni.login({
    provider: 'sinaweibo',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'sinaweibo',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 3 (css):
```css
uni.login({
    provider: 'sinaweibo',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'sinaweibo',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 4 (css):
```css
uni.login({
    provider: 'sinaweibo',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'sinaweibo',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

---

## 组合式 API（Composition API） | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-composition-api.html

**Contents:**
- # 组合式 API（Composition API）
  - # 环境准备
  - # 使用组合式API
  - # 使用 Script Setup
  - # 与 TypesSript 一起使用
      - 本页导读

目前 uni-app（Vue2） 基于 Vue 2.6，组合式 API 由 @vue/composition-api 支持，script setup 由 unplugin-vue2-script-setup 支持。

升级 uni-app 编译器到 3.6.8+

pages/index/index.nvue

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (sql):
```sql
import './composition-api'
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

const app = new (typeof App === 'function' ? App : Vue.extend(Object.assign({ mpType: 'app' }, App)))
app.$mount()
```

Example 2 (sql):
```sql
import './composition-api'
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

const app = new (typeof App === 'function' ? App : Vue.extend(Object.assign({ mpType: 'app' }, App)))
app.$mount()
```

Example 3 (sql):
```sql
import './composition-api'
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

const app = new (typeof App === 'function' ? App : Vue.extend(Object.assign({ mpType: 'app' }, App)))
app.$mount()
```

Example 4 (sql):
```sql
import './composition-api'
import Vue from 'vue'
import App from './App.vue'

Vue.config.productionTip = false

const app = new (typeof App === 'function' ? App : Vue.extend(Object.assign({ mpType: 'app' }, App)))
app.$mount()
```

---

## 鸿蒙元服务 AppLinking | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/applinking.html

**Contents:**
- # 鸿蒙元服务 AppLinking
- # 基本概念
- # 接入方案
  - # 配置 .well-known 路径
  - # AGC 后台配置
  - # 链接直达、参数传递
  - # 后续支持
      - 本页导读

通过二维码、短信、落地页唤起应用是常见的业务需求，这里介绍如何在鸿蒙元服务中唤起应用。

鸿蒙元服务目前支持通过鸿蒙 App Linking 实现元服务跳转。

在满足上述两个条件，可以开通 App Linking 服务。文档可参考 《使用 App Linking 实现元服务跳转 》。

配置文件要可访问 .well-known/applinking.json 路径。

示例源码如下，请查看 pre > code 标签中的内容

最终确认 AGC 后台新增的 App Linking 是否展示已生效。

打开特定的页面是通过传递 encodeURIComponent 之后的

示例源码如下，请查看 pre > code 标签中的内容

把这个路径填入自定义参数中，最终会得到一个类似 https://hoas.drcn.agconnect.link/AlXKm 的 URL，将此 URL 转成二维码可实现扫码打开 hellouniapp 的 API 页面，而非默认首页。

如果操作过程有疑问，可点此进入 uni-app 鸿蒙化技术交流群

**Examples:**

Example 1 (unknown):
```unknown
.well-known
```

Example 2 (unknown):
```unknown
.well-known/applinking.json
```

Example 3 (json):
```json
{
  "applinking": {
    "atomicServices": [
      {
        "appIdentifier": ""
      }
    ]
  }
}
```

Example 4 (json):
```json
{
  "applinking": {
    "atomicServices": [
      {
        "appIdentifier": ""
      }
    ]
  }
}
```

---

## Android 自定义渠道包 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/build/AndroidChannel.html

**Contents:**
- # Android 自定义渠道包
- # 云打包如何打渠道包
- # 如何自定义渠道？
- # 离线打包的配置方法
- # 手机端获取渠道信息的js api
- # uni-app如何在uni统计后台查看渠道数据
- # 5+App如何在DCloud统计后台查看渠道数据
      - 本页导读

选中项目 -->菜单发行-原生App-云打包，进入打包窗口。

HBuilderX默认提供 7 个渠道（Google、360、小米、华为、应用宝、vivo、oppo），更多可以在manifest.json文件中【源码视图】进行配置。

注意：提交谷歌应用市场（Google Play）时一定要将渠道标识设置为google，即一定要选择打包界面里的google渠道，否则会无法提交到play store

默认的渠道数量不够使，想要更多渠道？ 在manifest.json【源码视图】中， 根节点增加channel_list字段.

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

配置后会在上面的云端打包界面显示自定义j渠道，提交云端打包时需要勾选才能生效

下载最新的sdk，在Android项目的Androidmanifest.xml中的application节点下添加如下内容

示例源码如下，请查看 pre > code 标签中的内容

android:value值由四个字段组成，使用‘|’符号分割，各字段说明：

示例源码如下，请查看 pre > code 标签中的内容

Android平台本地离线打包渠道相关配置 iOS平台本地离线打包渠道相关配置

示例源码如下，请查看 pre > code 标签中的内容

注意：HBuilder 2.0版本此API有bug，请升级到更新版

这个API主要用于自定义统计，如果是使用DCloud的统计，无需专门写API。具体见下。

登录uni统计官网https://tongji.dcloud.net.cn 。

在左侧导航点击“渠道/场景值分析 - 渠道（app）”，即可查看。

如果你的App不是uni-app，而是5+或wap2app。那么无法使用uni统计。此时可登录DCloud开发者中心 查看应用的基本统计数据。

首页会展示所有已创建的应用列表，点击应用名称进入应用详情，点击可以『5+APP运营』查看该应用的『日活趋势』。

包含渠道信息的应用，左上角选择渠道，即可查看对应渠道的运营统计数据。

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
channel_list
```

Example 3 (json):
```json
{
	"channel_list":[
		{
			"id":"",
			"name":""
		}
	]
}
```

Example 4 (json):
```json
{
	"channel_list":[
		{
			"id":"",
			"name":""
		}
	]
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-style.html

**Contents:**
      - 本页导读

使用@import语句可以导入外联样式表，@import后跟需要导入的外联样式表的相对路径，用;表示语句结束。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<style>
    @import "../../common/uni.css";

    .uni-card {
        box-shadow: none;
    }
</style>
```

Example 2 (html):
```html
<style>
    @import "../../common/uni.css";

    .uni-card {
        box-shadow: none;
    }
</style>
```

Example 3 (html):
```html
<style>
    @import "../../common/uni.css";

    .uni-card {
        box-shadow: none;
    }
</style>
```

Example 4 (css):
```css
<style>
    @import "../../common/uni.css";

    .uni-card {
        box-shadow: none;
    }
</style>
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-google.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用Google登录
    - # 示例代码
      - 本页导读

更多信息详见 申请开通Google登录操作指南

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“Google登录”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 2 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 3 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 4 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

---

## 运行自定义基座到iOS模拟器 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/run-custom-base-ios-simulator.html

**Contents:**
- # 运行自定义基座到iOS模拟器
  - # 制作iOS模拟器自定义基座
  - # iOS模拟器设备选择窗口选择自定义基座
      - 本页导读

HBuilderX 3.7.13起，MacOSX系统，App项目，支持运行自定义基座到iOS模拟器。

MacOSX系统，App项目，运行自定义基座到iOS模拟器前，需要先制作自定义基座。

如何制作自定义基座？ 选择项目，点击顶部菜单【发行】【原生App - 云打包】，如下窗口所示：

选择uni-app等App项目，点击工具栏运行菜单，在下拉列表中，点击【运行到iOS模拟器 App基座】

---

## nvue所支持的通用样式已在本文档中全部列出，一些组件可能有自定义样式，请参考组件文档。除此之外的属性，均不被支持。 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-css

**Contents:**
    - # nvue所支持的通用样式已在本文档中全部列出，一些组件可能有自定义样式，请参考组件文档。除此之外的属性，均不被支持。
  - # 注意事项
- # 盒模型
      - # 基本用法
      - # 内边距
      - # 边框
      - # border-width
      - # border-color
      - # border-radius
      - # 外边距

HBuilderX 3.1.0+ 开始支持更多简写样式

HBuilderX 3.1.0+ 开始支持新的样式编译模式

新增 nvueStyleCompiler 配置，支持组合选择器（相邻兄弟选择器、普通兄弟选择器、子选择器、后代选择器）。详见

nvue的uni-app编译模式下，App.vue 中的样式，会编译到每个 nvue文件。对于共享样式，如果有不合法属性控制台会给出警告，可以通过条件编译 APP-PLUS-NVUE屏蔽 App 中的警告。

nvue盒模型基于 CSS 盒模型，每个 nvue 元素都可视作一个盒子。我们一般在讨论设计或布局时，会提到「盒模型」这个概念。

盒模型描述了一个元素所占用的空间。每一个盒子有四条边界：外边距边界 margin edge, 边框边界 border edge, 内边距边界 padding edge 与内容边界 content edge。这四层边界，形成一层层的盒子包裹起来，这就是盒模型大体上的含义。

nvue盒模型的 box-sizing 默认为 border-box，即盒子的宽高包含内容、内边距和边框的宽度，不包含外边距的宽度。

在 Android 平台，nvue只支持 overflow:hidden。

在 iOS 上，nvue支持 overflow:hidden 和 overflow:visible，默认是 overflow:visible。

示例源码如下，请查看 pre > code 标签中的内容

padding {length}：内边距，内容和边框之间的距离，默认值 0。与标准 CSS 类似，padding 支持简写，也可分解为以下四个：

border-style 设定边框样式，如果四个方向的边框样式不同，可分别设置：

border-width：设定边框宽度，非负值, 默认值 0，如果四个方向的边框宽度不同，可分别设置：

border-color：设定边框颜色，默认值 #000000，如果四个方向的边框颜色不同，可分别设置：

border-radius：设置边框的圆角，默认值 0，如果四个方向的圆角弧度不同，可分别设置：

border-radius和border-width定义了圆心角为90度的椭圆弧的长轴和半长轴的大小。如果邻接两边border-radius 或 border-width不一致，nvue绘制的边框曲线可能不够平滑。

margin {length}：外边距，元素和元素之间的空白距离，默认值 0。与标准 CSS 类似，margin 支持简写，也可分解为四边：

尽管 overflow: hidden 在 Android 上是默认行为，但只有下列条件都满足时，一个父 view 才会去剪切它的子 view。

Flex 是 Flexible Box 的缩写，意为"弹性布局"，用来为盒状模型提供最大的灵活性。

nvue布局模型基于 CSS Flexbox，以便所有页面元素的排版能够一致可预测，同时页面布局能适应各种设备或者屏幕尺寸。Flexbox 包含 flex 容器和 flex 成员项。如果一个nvue元素可以容纳其他元素，那么它就成为 flex 容器。

文档中未说明的 flexbox 属性均不支持：如 order、flex-grow 、flex-shrink 、 flex-basis、align-content、align-self 等。

在 nvue中，Flexbox 是默认且唯一的布局模型，所以你不需要手动为元素添加 display: flex; 属性。

定义了 flex 容器中 flex 成员项的排列方向，默认值为 column

决定了 flex 成员项在一行还是多行分布，默认值为nowrap

定义了 flex 容器中 flex 成员项在主轴方向上如何排列以处理空白部分。默认值为 flex-start

定义了 flex 容器中 flex 成员项在纵轴方向上如何排列以处理空白部分。默认值为 stretch。

flex 属性定义了 flex 成员项可以占用容器中剩余空间的大小。 flex {number}：值为 number 类型。

Flex 成员项暂不支持 flex-shrink 、 flex-basis、align-content 属性。

该属性不支持 flex: flex-grow | flex-shrink | flex-basis 的简写。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置定位类型。默认值为 relative。

运用 position:sticky或position: fixed 可实现头部导航栏固定(吸顶效果)

示例源码如下，请查看 pre > code 标签中的内容

如果定位元素超过容器边界，在 Android 下，超出部分将不可见，原因在于 Android 端元素 overflow 默认值为 hidden，但目前 Android 暂不支持设置 overflow: visible。

transition允许 CSS 的属性值在一定的时间区间内平滑地过渡。

设置过渡动画的属性名，设置不同样式 transition 效果的键值对，默认值为空，表示不执行任何过渡效果

指定过渡的持续时间 (单位是毫秒)，默认值是 0，表示没有动画效果。

指定请求过渡操作到执行过渡之间的时间间隔 (单位是毫秒或者秒)，默认值是 0，表示没有延迟，在请求后立即执行过渡。

描述过渡执行的速度曲线，用于使过渡更为平滑。默认值是 ease。下表列出了所有合法的属性：

示例源码如下，请查看 pre > code 标签中的内容

应用于元素的2D或3D转换。这个属性允许你将元素旋转，缩放，移动，倾斜等。

除了perspective和transform-origin，transition支持了transform的全部能力。 其中transform的rotate 和rotatez 等效.

示例源码如下，请查看 pre > code 标签中的内容

同时生效的时候，优先级高覆盖优先级低。 例如：input:active:enabled 和 input:active 同时生效，前者覆盖后者

所有组件均支持线性渐变。CSS3 渐变 你可以通过 background-image属性创建线性渐变。

示例源码如下，请查看 pre > code 标签中的内容

background-image 优先级高于 background-color，这意味着同时设置 background-image 和 background-color，background-color 被覆盖。 background 不支持简写。

目前暂不支持 radial-gradient（径向渐变）。

示例源码如下，请查看 pre > code 标签中的内容

从HBuilderX3.4.3起，重新支持阴影样式(box-shadow)。修复老版本组件设置box-shadow后在不同系统版本出现的显示异常及闪烁问题! 但需要注意设置阴影样式(box-shadow) 的组件需要让出阴影渲染位置，否则会出现阴影显示不全的问题。

示例源码如下，请查看 pre > code 标签中的内容

目前Android平台对阴影样式(box-shadow)支持的还不太完善，有设置圆角边框时阴影样式显示不正常、占用组件视图渲染区域等问题。

为解决这些问题，从HBuilderX 2.4.7起，新增elevation属性（组件的属性，不是css样式）设置组件的层级，Number类型，层级值越大阴影越明显，阴影效果也与组件位置有关，越靠近页面底部阴影效果越明显

示例源码如下，请查看 pre > code 标签中的内容

color {color}：文字颜色，支持如下字段：

font-size {number}：文字大小，只有text标签可以设置字体大小

font-style {string}：字体类别。可选值 normal | italic，默认为 normal。

font-weight {string}：字体粗细程度。默认值: normal；

text-decoration {string}：字体装饰。默认值为 none。

不支持 text-decoration:overline

text-align {string}：对齐方式。默认值为 left。

不支持text-align:justify

font-family {string}：设置字体。这个设置不保证在不同平台，设备间的一致性。 如所选设置在平台上不可用，将会降级到平台默认字体。 如果需要加载自定义字体，请参考相关DOM.addRule

text-overflow {string}：设置内容超长时的省略样式。

lines {number}: 正整数，指定最大文本行数，默认lines值为0，表示不限制最大行数lines。如果文本不够长，实际展示行数会小于指定行数。

line-height {length}: 正整数，每行文字高度。line-height是 top 至 bottom的距离。 line-height与font-size没有关系，因为line-height被 top 和 bottom 所限制， font-size 被 glyph 所解析。line-height和font-size相等一般会导致文字被截断。

word-wrap:<string> 对nvue来说 anywhere 表示在以字符为最小元素做截断换行，其它值或不指定该属性，都以英文单词为单位进行换行。

**Examples:**

Example 1 (unknown):
```unknown
background-image
```

Example 2 (unknown):
```unknown
background-color
```

Example 3 (unknown):
```unknown
border-right
```

Example 4 (unknown):
```unknown
border-bottom
```

---

## 此文档已迁移 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/run-app-harmony-moved.html

**Contents:**
- # 此文档已迁移
      - 本页导读

---

## uni安全专题 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/safe.html

**Contents:**
- # uni安全专题
- # 背景
- # uni安全网络
- # 人机验证
- # 服务器安全
- # 客户端代码安全
- # FAQ
- # 附录
      - 本页导读

每个工程师，每个测试人员，在验收项目的时候，对功能需求的满足，心里是有底的。甚至也可以模拟大并发来测试应用的性能。

但要问你交付的应用是否安全？那不管工程师还是测试，心里都没底。

安全是一个独立且专业的事情，如果不是一个优秀的黑客，很难发现应用的众多安全问题。

普通工程师和测试人员是无法达到这个水平的。

由于http的无状态特性，服务器很难识别客户端的真伪。这是一个真实请求，还是伪造的假客户端？一个貌似简单的识别问题，难住了很多人。

网络传输的数据，在中间被各种路由器和不规范的运营商偷窃和劫持。

如果您的应用有如下特征，就非常容易被黑客盯上：

攻击者为了你的数据，或者为了褥你的羊毛，可以破解你的网络请求、伪造假的客户端去请求你的服务器、用手机墙批量操作。

你原本期待给正常用户提供福利，以拉新或促活，结果一场促销后，正常用户没得到好处，全给黑客褥走了。

让普通工程师和测试人员具备黑客能力是不现实的，DCloud为开发者赋能，解决了这些安全顾虑。

在过去，客户端和服务器是强分离的，它们使用不同的技术开发，中间通过无状态的http协议交流。

现在，DCloud同时提供了端引擎uni-app和云引擎uniCloud，统一了技术栈，在uni-app开发的客户端和uniCloud开发的服务器之间，使用了更安全的网络通信机制。

安全网络仅支持App和微信小程序，其他小程序和web无法保证客户端不被伪造。

在uni安全网络里，可靠的解决了如下2个老大难问题：

这样，这个客户端和这个服务空间之间就建立了安全网络。云端可以准确识别客户端的真伪，可以在uniCloud控制台直接设置拒绝非法客户端连接您的服务空间。

这条安全网络，几乎不会对请求速度等性能指标产生影响，但又保证可以识别假客户端、马甲包。

另外，还可以在指定的网络请求中做内容加密。不管是云对象请求还是云函数的callFunction，都可以设置secret（一个bool参数）来对通信内容加密。

secret设为true时，这些内容将被加密传输，无法被中间的路由器或伪造客户端解密。

但注意内容加密是影响请求速度的，加解密耗时与内容的数据量有关。数据量小时，可以忽略影响；数据量大时，需自己进行实际测试来评估体验。

uni安全网络还可以鉴别客户端的包名、签名证书，识别客户端设备是否被root或越狱，禁止非法设备访问。

uni安全网络需要开发者在uniCloud上开通，但并不收费。

如此高安全的保障，在商业项目中都需要花掉不少银子来采购。但DCloud免费给uniCloud开发者提供。

还有一类攻击，攻击者没有破解掉客户端和网络协议，但是用一排排手机墙。

这时，您就需要uni的一键登录和实人认证 。

一键登录是运营商提供的安全方案，它要求手机中必须插sim卡，并且从sim中精准读取手机号，防止手机短信验证码被打码池伪造返回。

而实人认证更近一步，是公安部提供的数据库，阿里云提供的活体检测，金融级的安全保障。

输入姓名、身份证，然后启动摄像头，可以检测摄像头前的这个人：

这样手机墙的操作者，不但需要有众多手机号、身份证照片，还需要众多人站在手机墙面前做活体检测，这他就褥不着多少羊毛了。

uni的一键登录和实人认证不但和uni产品完美结合、快捷开发，还比市面上其他类似产品的价格更便宜。

一键登录仅需0.02元/次，比发短信验证码都便宜。

这些价格都极具优势。如果您有非常大的量，还可以再联系bd@dcloud.io沟通。

不管是一键登录还是实人认证，在uni-id 里都已经内置集成好。

无需自己写代码。账户的注册、实人认证，这些代码都已经写好并开源在uni-id-pages 项目中。

如果您没有使用uni安全网络，直接使用一键登录和实人认证。仍然会遇到被刷的风险。 因为这些认证都是收费的，如果没有安全防护，攻击者可以刷你的服务器接口，盗用你的余额来给他提供认证服务，或者干脆就是刷的让你破财。

在人机验证领域，uni还提供了免费的图形验证码 。

当然有的攻击者，不是为了你的数据或你的羊毛，而是单纯的就想打垮你的服务。最常见的就是DDoS攻击。

此时，如果使用uniCloud，因为域名是阿里云或腾讯云的，ip不是固定的，攻击者无法通过域名和ip单独DDoS你的服务空间。

如果让攻击者攻击整个阿里云或腾讯云的serverless资源池，那这个池子太大了，那些攻击者根本无法打垮uniCloud服务。

uniCloud还提供了ip防刷 功能，可以在uniCloud web控制台设置，拉黑某些ip，或者自动屏蔽指定时间内访问次数过高的ip。

如果您的应用涉及用户提交内容，那么有一个很大的风险就是用户提交非法内容，导致您的应用被公安或运营商禁封。

此时，uni的内容安全插件 可以帮助您过滤掉用户提交的风险内容，不管是非法的文字还是图片。

uni-app或5+App，支持对js文件或nvue文件进行原生加密。让js代码不再明文暴露于客户端。详见

DCloud联合业内主流安全厂商，提供uni安全加固产品，可实现移动App的安全性增强，防止应用程序被破解、篡改或重打包等各类安全破坏。它的作用是保护应用程序的安全性和用户的隐私，提高应用程序的抗攻击能力和可靠性。

有uni保驾护航，您可以专注于业务，踏实写代码，安心交付。不用再提心吊胆、担忧各种自己不擅长的事。

uni安全网络只能在uni-app客户端和uniCloud服务之间保障安全。如果您的服务器在其他技术上，或者迁移到uniCloud，或者用uniCloud转发。转发的意思就是客户端和uniCloud联网，uniCloud云函数再与您的传统服务器通信。一键登录和实人认证是虽然也是uniCloud服务器，但相对独立。传统服务器可以与uniCloud通信来使用这些能力。详见附录中这些产品单独的文档。

**Examples:**

Example 1 (unknown):
```unknown
灵魂拷问：你做的应用安全吗？
```

---

## iOS平台Capabilities配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-capabilities.html

**Contents:**
- # iOS平台Capabilities配置
- # HBuilderX4.18及以上版本
- # HBuilderX4.18以前版本
- # 通用链接（Universal Link）配置教程
  - # 第一步：开启Associated Domains服务
  - # 第二步：配置Associated Domains（域名）
    - # uni-app/5+ App项目
    - # uni-app x项目
    - # 本地离线打包
  - # 第三步：服务器配置apple-app-site-association文件

在XCode中可给工程添加设置Capabilities，如图所示：

配置后，会更新XCode工程的.entitlements和Info.plist文件，此文章介绍如何在HBuilderX中配置iOS平台的Capabilities。

注意：uni-app x 项目只支持此方式配置

将 XCode 工程中的 .entitlements 文件中的内容配置到 iOS原生应用配置文件和资源 的 UniApp.entitlements 文件，详情参考：配置文件UniApp.entitlements

将 XCode 工程中的 Info.plist 文件中的内容配置到 iOS原生应用配置文件和资源 的 Info.plist 文件，详情参考：配置文件 Info.plist

将XCode工程中的 .entitlements 和 Info.plist 文件中的内容转换为json格式数据配置到manifest.json文件中，使得HBuilderX云端打包工程设置相应的Capabilities。

打开项目的manifest.json文件，在源码视图中进行配置

示例源码如下，请查看 pre > code 标签中的内容

其中entitlements数据（json）将转换成XCode工程中entitlements文件的数据（字典格式） plists节点数据将转换成XCode工程中Info.plist文件的数据（字典格式）

为了简化配置使用通用链接，推荐使用UniCloud快速生成通用链接，详情参考：一键生成iOS通用链接

Universal Link是苹果在WWDC 2015上提出的iOS 9的新特性之一。此特性类似于深层链接，并能够方便地通过打开一个Https链接来直接启动您的客户端应用(手机有安装App)。对比起以往所使用的URL Sheme, 这种新特性在实现web-app的无缝链接时能够提供极佳的用户体验。 使用前请阅读苹果官方文档 使用通用链接（Universal Link）必须要有域名，下面的配置中将要用到

登录苹果开发者网站，在“Certificates, Identifiers & Profiles”页面选择“Identifiers”中选择对应的App ID，确保开启Associated Domains服务

开启Associated Domains服务后需要重新生成profile文件，提交云端打包时使用

使用HBuilderX可视化界面配置 打开项目的manifest.json文件，切换到“App常用其它设置”项，在“iOS设置”下的“关联域（Associated Domains）”中进行配置：

使用HBuilderX源码视图配置 打开项目的manifest.json文件，切换到“源码视图”项，在uni-app项目在"app-plus" -> "distribute" -> "ios" -> "capabilities" -> "entitlements"节点下添加"com.apple.developer.associated-domains"字段，字段值为字符串数组，每个字符串为要关联的域名：

示例源码如下，请查看 pre > code 标签中的内容

其中demo.dcloud.net.cn是应用通用链接的域名（这里不要包含path），请修改为自己应用要使用的域名

5+ App项目源码视图配置节点为："plus" -> "distribute" -> "apple" -> "capabilities" -> "entitlements"

HBuilderX4.71 及以上版本支持 manifest.json 可视化配置，详情参考：uni-app x 关联域 配置 。

HBuilderX4.71 以下版本未提供 maniest.json 可视化配置，需在项目下创建 "nativeResources" -> "ios" 目录，添加UniApp.entitlements文件配置，详情参考：https://uniapp.dcloud.net.cn/tutorial/app-nativeresource-ios.html#domains 。

在原生XCode工程中配置通用链接域名（使用HBuilderX云端打包跳过）

HBuilderX中自带的默认真机运行基座HBuilderX注册的通用链接为：https://demo.dcloud.net.cn/ulink/

需要在上面域名对应的服务器上放apple-app-site-association文件。 apple-app-site-association文件配置如下：

示例源码如下，请查看 pre > code 标签中的内容

注意：不要直接拷贝使用上面的示例，必须根据自己应用的配置修改 把配置好的apple-app-site-association文件上传到你自己的服务器，确保通过https://demo.dcloud.net.cn/.well-known/apple-app-site-association可访问。

其中demo.dcloud.net.cn为上面配置的域名 应用安装后会通过访问上面的url向系统注册应用的通用链接。

推荐方案：将apple-app-site-association文件部署到，免费的阿里云版unicloud的 前端网页托管

可通过5+ API的plus.runtime.launcher 判断应用启动来源，如果其值为"uniLink"则表示通过通用链接启动应。 这时可通过5+ API的plus.runtime.arguments 获取启动参数，通用链接启动的情况将返回完整的通用链接地址。

在 App.uvue 文件的应用生命周期 onLaunch 和 onShow 回调参数中可通过 appLink 属性获取通用链接地址。

也可以通过 API： uni.getLaunchOptionsSync 和 uni.getEnterOptionsSync 返回值中的 appLink 属性获取通用链接地址。

**Examples:**

Example 1 (unknown):
```unknown
iOS原生应用配置文件和资源
```

Example 2 (unknown):
```unknown
UniApp.entitlements
```

Example 3 (unknown):
```unknown
iOS原生应用配置文件和资源
```

Example 4 (json):
```json
"capabilities": {
		"entitlements": {	// 合并到工程entitlements文件的数据（json格式）
		},
		"plists": {			// 合并到工程Info.plist文件的数据（json格式）
		}
	},
```

---

## HarmonyOS Next 华为账号登录 @harmonyos-next-huawei-login | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/app-oauth-huawei.html

**Contents:**
- # HarmonyOS Next 华为账号登录 HBuilderX 4.31+
- # 开发准备
- # HBuilder X 配置
  - # uni-app 中使用示例
- # Tips
      - 本页导读

根据华为应用市场上架审核要求，如果应用支持用户使用第三方账号登录，则该应用需提供华为账号登录选项 文档

调试时可不配置 Scope 权限，上架时需配置

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“华为登录”，并配置 client_id：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HBuilder X 项目根目录/harmony-configs/entry/src/main/module.json5
```

Example 2 (vue):
```vue
<template>
  <view>
    <button @click="getProviderSync">getProviderSync</button>
    <button @click="login">login</button>
    <button @click="getUserInfo">getUserInfo</button>
  </view>
</template>
<script setup>
const getProviderSync = () => {
  const provider = uni.getProviderSync({service: 'oauth'})
  console.log('provider :>> ' + JSON.stringify(provider));
}

const login = () => {
  uni.login({
    provider: 'huawei',
    success(res) {
      console.log(JSON.stringify(res))
    },
    fail(err) {
      console.log(JSON.stringify(err))
    },
  })
}

const getUserInfo = () => {
  uni.getUserInfo({
    provider: 'huawei',
    success(res) {
      console.log(JSON.stringify(res))
    },
    fail(err) {
      console.log(JSON.stringify(err))
    },
  })
}
</script>
```

Example 3 (vue):
```vue
<template>
  <view>
    <button @click="getProviderSync">getProviderSync</button>
    <button @click="login">login</button>
    <button @click="getUserInfo">getUserInfo</button>
  </view>
</template>
<script setup>
const getProviderSync = () => {
  const provider = uni.getProviderSync({service: 'oauth'})
  console.log('provider :>> ' + JSON.stringify(provider));
}

const login = () => {
  uni.login({
    provider: 'huawei',
    success(res) {
      console.log(JSON.stringify(res))
    },
    fail(err) {
      console.log(JSON.stringify(err))
    },
  })
}

const getUserInfo = () => {
  uni.getUserInfo({
    provider: 'huawei',
    success(res) {
      console.log(JSON.stringify(res))
    },
    fail(err) {
      console.log(JSON.stringify(err))
    },
  })
}
</script>
```

Example 4 (vue):
```vue
<template>
  <view>
    <button @click="getProviderSync">getProviderSync</button>
    <button @click="login">login</button>
    <button @click="getUserInfo">getUserInfo</button>
  </view>
</template>
<script setup>
const getProviderSync = () => {
  const provider = uni.getProviderSync({service: 'oauth'})
  console.log('provider :>> ' + JSON.stringify(provider));
}

const login = () => {
  uni.login({
    provider: 'huawei',
    success(res) {
      console.log(JSON.stringify(res))
    },
    fail(err) {
      console.log(JSON.stringify(err))
    },
  })
}

const getUserInfo = () => {
  uni.getUserInfo({
    provider: 'huawei',
    success(res) {
      console.log(JSON.stringify(res))
    },
    fail(err) {
      console.log(JSON.stringify(err))
    },
  })
}
</script>
```

---

## 鸿蒙元服务配置签名证书 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/manual-signature.html

**Contents:**
- # 鸿蒙元服务配置签名证书
- # 鸿蒙元服务证书签名配置
- # 配置 HBuilderX 工程
      - 本页导读

在 HBuilderX 4.81 之前，uni-app 开发鸿蒙元服务，需要手动配置签名证书，本文介绍如何配置签名证书。

目前 HBuilderX 已经提供了鸿蒙应用、鸿蒙元服务的可视化签名配置方案，推荐在 manifest.json 中进行一键配置。

接下来文档会面向新手，详细介绍如何使用自动签名证书。

打开 DevEco Studio 编辑器，选择 新建工程 - 元服务 AtomService - Empty Ability，下面的截图来自 DevEco Studio：

选择 已注册好的 AppID，创建鸿蒙元服务示例（下面称原生工程）。

在编辑器的右上角点击Project Structure... 图标，勾选自动签名 Automatically generate signature。

这个时候点击 Run - Run 'entry' 或者编辑器顶部的小三角选择运行。如果可以运行成功官方的 Hello World 示例，说明相关环境、证书配置完成。

配置 build-profile.json5

需要配置签名证书，项目根目录创建 harmony-mp-configs/build-profile.json5 文件。

考虑到新手用户不熟悉配置，建议下载 这个模版 修改，只替换签名 signingConfigs部分，其他配置项不要修改。

**Examples:**

Example 1 (unknown):
```unknown
新建工程 - 元服务 AtomService - Empty Ability
```

Example 2 (unknown):
```unknown
Project Structure...
```

Example 3 (unknown):
```unknown
File - Project Structure...
```

Example 4 (unknown):
```unknown
Run - Run 'entry'
```

---

## 组件使用的入门教程 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/

**Contents:**
- # 组件使用的入门教程
  - # 组件的属性类型
  - # 公共属性列表
  - # 在组件中使用script的data变量
  - # 组件的事件
- # 基础组件
  - # 基础组件列表
- # 扩展组件的意义
- # 组件的类别
- # easycom组件规范

每个组件，包括如下几个部分：以组件名称为标记的开始标签和结束标签、组件内容、组件属性、组件属性值。

注意：所有组件与属性名都是小写，单词之间以连字符-连接。

示例源码如下，请查看 pre > code 标签中的内容

下面是一个基本组件的实例，在一个vue页面的根<view>组件下插入一个<button>组件。给这个组件的内容区写上文字“按钮”，同时给这个组件设置了一个属性“size”，并且“size”属性的值设为了“mini”。

注：按照vue单文件组件规范 ，每个vue文件的根节点必须为 <template>。 vue2下，这个 <template> 下只能且必须有一个根 <view> 组件。vue3不限制。

示例源码如下，请查看 pre > code 标签中的内容

通过了解button组件的文档，我们知道上述代码将在页面中绘制一个按钮，按钮显示的文字是“按钮”，按钮的大小是小尺寸的。

下面的例子演示了组件的属性设置boolean值和数字的例子。注意false作为一个js变量，在组件的属性中使用时，属性前面需增加:冒号前缀，属性值仍使用引号包裹，但引号里不是字符串，而是js。

示例源码如下，请查看 pre > code 标签中的内容

每个组件都有各自定义的属性，但所有uni-app的组件，都有如下属性：

除了上述公共属性，还有一类特殊属性以v-开头，称之为vue指令，如v-if、v-else、v-for、v-model。详见vue指令

组件中可以使用script的data中定义的变量，但组件的属性中使用和内容区使用的用法不一样。

下面的button组件示例，等价于上一个的示例。只不过静态内容改成动态js。

示例源码如下，请查看 pre > code 标签中的内容

每个组件都有“事件”。事件就是在指定的条件下触发某个js方法。

比如button组件，有点击事件，也就是当手机用户点击这个button组件时，会触发这个事件。

事件也是组件的属性，只不过这类属性以@为前缀。

事件的属性值，指向一个在script的methods里定义过的js方法，还可以给方法传参数。

示例源码如下，请查看 pre > code 标签中的内容

uni-app的组件，分为基础组件和扩展组件。

基础组件在uni-app框架中已经内置，无需将内置组件的文件导入项目，也无需注册内置组件，随时可以直接使用，比如<view>组件。

除了基础组件，都称为扩展组件。扩展组件需要将组件导入项目中才可以使用。

uni-app为开发者提供了一系列基础组件，类似HTML里的基础标签元素。

但uni-app的组件与HTML不同，而是与小程序相同，可更好的满足手机端的使用习惯。

虽然不推荐使用HTML标签，但实际上如果开发者写了div等标签，在编译到非H5平台时也会被编译器转换为view标签，类似的还有span转text、a转navigator等，包括css里的元素选择器也会转。但为了管理方便、策略统一，新写代码时仍然建议使用view等组件。

开发者可以通过组合这些基础组件进行快速开发。在需要复用的情况下可封装成扩展组件。

uni-app 基础组件规范，与小程序规范相近。如果了解小程序开发的话，uni-app的基础组件会感觉很熟悉。但需要注意组件上的事件绑定，需要以 vue 的事件绑定语法来绑定，如 bindchange="eventName" 事件，需要写成 @change="eventName"

示例源码如下，请查看 pre > code 标签中的内容

视图容器（View Container）：

在小程序平台和nvue平台，还有一些专有组件，比如open-data，详见左侧导航

虽然所有的业务需求都可以通过基础组件满足，但仅有基础组件是低效的，实际开发中会有很多封装的组件。

比如我们需要一个五角星点击评分的组件，在DCloud的插件市场里可以获取到：https://ext.dcloud.net.cn/plugin?id=33

把这个uni-rate组件导入到你的uni-app项目下，在需要的vue页面里引用它，就可以在指定的地方显示出这个五角星组件。

示例源码如下，请查看 pre > code 标签中的内容

uni-app支持的组件分为vue组件和小程序自定义组件。

如果你还不了解这两种组件，可以参阅各自的文档

日常开发来讲，推荐使用vue组件。uni-app支持小程序组件主要是为了兼容更多生态资源。

如果扩展组件符合uni-app的easycom组件规范，则可以免注册，直接使用。比如uni-ui扩展组件就符合easycom组件规范。

如果组件不符合easycom规范，则需要在代码里手动import和注册组件，然后才能使用。

除了easycom规范外，扩展组件还有很多概念，比如uni_module、datacom、原生组件、uniCloud组件。

传统vue组件，需要安装、引用、注册，三个步骤后才能使用组件。easycom将其精简为一步。

只要组件安装在项目的components目录下或uni_modules目录下，并符合components/组件名称/组件名称.(vue|uvue)目录结构（注意：当同时存在vue和uvue时，uni-app 项目优先使用 vue 文件，而uni-app x 项目优先使用 uvue 文件，详情 ）。就可以不用引用、注册，直接在页面中使用。

比如前述举例的uni-rate组件 ，它导入到uni-app项目后，存放在了目录/components/uni-rate/uni-rate.vue

同时它的组件名称也叫uni-rate，所以这样的组件，不用在script里注册和引用。 如下：

示例源码如下，请查看 pre > code 标签中的内容

不管components目录下安装了多少组件，easycom打包后会自动剔除没有使用的组件，对组件库的使用尤为友好。

组件库批量安装，随意使用，自动按需打包。以官方的uni-ui为例，在HBuilderX新建项目界面选择uni-ui项目模板，只需在页面中敲u，拉出大量组件代码块，直接选择，即可使用。大幅提升开发效率，降低使用门槛。

在DCloud插件市场 下载符合components/组件名称/组件名称.vue目录结构的组件，均可直接使用。

easycom是自动开启的，不需要手动开启。

如果你的组件名称或路径不符合easycom的默认规范，可以在pages.json的easycom节点进行个性化设置，自定义匹配组件的策略。另见

如果不使用easycom，手动引用和注册vue组件，则需要分3步写如下代码：

示例源码如下，请查看 pre > code 标签中的内容

uni_module其实不止服务于组件，它可以服务于组件、js库、页面、项目等所有DCloud插件市场所支持的种类。

符合uni_module规范的组件都在项目的uni_modules目录下，以插件id为目录存放。（项目模板不放在uni_modules目录下）

在HBuilderX中点右键可方便的更新插件，插件作者也可以方便的上传插件。

uni_module还支持云端一体的插件。

uni_module有详细的专项文档，请另行查阅uni_module规范。

uniCloud是DCloud提供的、配套uni-app的云开发服务。

uni-app的基础组件中，有一个特殊基础组件是：<unicloud-db>组件。

它可以在前端直接获取和操作uniCloud的云端数据库。

除了内置的数据库组件，在uni-ui扩展库里还有uniCloud的文件选择和上传组件，参考：uni-file-picker

uni-app的基础组件里，有一批原生组件，如video、map...

这些组件如果用于vue页面，也就是webview渲染时，会造成层级高于普通前端组件的情况。

它们的层级需要使用cover-view等特殊组件才能覆盖，同时在使用中有些需要注意的事情。

相关文档详见：uni-app内置原生组件说明

uni-app的App端支持原生插件，这类插件使用iOS或Android原生语言编写，封装成插件，供其他开发者使用js来调用。

原生插件分为原生组件component和原生模块module。

其实原生组件component只能在App-nvue环境中使用。

datacom组件是一种数据驱动的、可云端一体的组件。

传统组件只涉及前端概念，而datacom拉通了uniCloud云端数据，是uni-app+uniCloud协同开发的必备提效工具。

封装组件涉及的知识点较多，相关文档详见：vue组件详解

**Examples:**

Example 1 (unknown):
```unknown
<component-name>
```

Example 2 (unknown):
```unknown
</component-name>
```

Example 3 (html):
```html
<component-name property1="value" property2="value">
	content
</component-name>
```

Example 4 (html):
```html
<component-name property1="value" property2="value">
	content
</component-name>
```

---

## 小程序自定义组件支持 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/miniprogram-subject.html

**Contents:**
- # 小程序自定义组件支持
- # WXS
      - 本页导读

uni-app在支持 vue 组件之外，也实现了对小程序自定义组件的兼容。

小程序组件不是 vue 组件，并且每家小程序都有自己的组件规范，比如微信小程序的组件是 wxml 格式。

小程序组件不是全端可用，支持度最广的微信小程序自定义组件，也只能支持微信小程序、app-vue、web，其他平台无法兼容。

如果需求上只需兼容有限平台，也可以使用小程序组件。否则仍然推荐使用 vue 组件。

此文档要求开发者对各端小程序的自定义组件有一定了解，没接触过小程序自定义组件的可以参考：

在 pages.json 对应页面的 style -> usingComponents 引入组件：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

下面以微信小程序官方自定义组件示例 miniprogram-slide-view 为例演示小程序自定义组件的使用方式。 其他组件使用示例见 GitHub：wxcomponents-template 。 插件市场有一个完整的vant weapp 引用好的示例工程，详见https://ext.dcloud.net.cn/plugin?id=302 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

详细的小程序转 uni-app 语法差异可参考文档https://ask.dcloud.net.cn/article/35786 。

WXS 是一套运行在视图层的脚本语言，微信端的规范详见 。

它的特点是运行在视图层。当需要避免逻辑层和渲染层交互通信折损时，可采用 wxs。

uni-app 可以将 wxs 代码编译到微信小程序、QQ 小程序、app-vue、H5 上（uni-app 2.2.5及以上版本）

与 wxs 类似，百度小程序提供了 Filter，阿里小程序和抖音小程序提供了 SJS，uni-app 也支持使用这些功能，并将它们编译到百度和阿里的小程序端。不过它们的功能还不如 wxs 强大。

App 端 nvue 解决此类需求，不应该使用 wxs，而是使用 bindingx。

以下是一些使用 WXS 的简单示例，要完整了解 WXS 语法，请参考WXS 语法参考 。本示例使用 wxs 响应touchmove事件，减少视图层与逻辑层通信，使滑动更加丝滑。

示例源码如下，请查看 pre > code 标签中的内容

支付宝小程序，百度小程序官方暂未支持事件响应，不过也可以使用对应的 SJS、Filter 过滤器实现一些数据处理的操作，以下代码展示了一个时间格式化的小功能

示例源码如下，请查看 pre > code 标签中的内容

utils.sjs 与 utils.filter.js 内容一致

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
┌─wxcomponents                  微信小程序自定义组件存放目录
│   └──custom                   微信小程序自定义组件
│		├─index.js
│		├─index.wxml
│		├─index.json
│		└─index.wxss
├─mycomponents                  支付宝小程序自定义组件存放目录
│   └──custom                   支付宝小程序自定义组件
│		├─index.js
│		├─index.axml
│		├─index.json
│		└─index.acss
├─swancomponents                百度小程序自定义组件存放目录
│   └──custom                   百度小程序自定义组件
│		├─index.js
│		├─index.swan
│		├─index.json
│		└─index.css
├─pages
│  └─index
│		└─index.vue
│
├─static
├─main.js
├─App.vue
├─manifest.json
└─pages.json
```

Example 2 (unknown):
```unknown
┌─wxcomponents                  微信小程序自定义组件存放目录
│   └──custom                   微信小程序自定义组件
│		├─index.js
│		├─index.wxml
│		├─index.json
│		└─index.wxss
├─mycomponents                  支付宝小程序自定义组件存放目录
│   └──custom                   支付宝小程序自定义组件
│		├─index.js
│		├─index.axml
│		├─index.json
│		└─index.acss
├─swancomponents                百度小程序自定义组件存放目录
│   └──custom                   百度小程序自定义组件
│		├─index.js
│		├─index.swan
│		├─index.json
│		└─index.css
├─pages
│  └─index
│		└─index.vue
│
├─static
├─main.js
├─App.vue
├─manifest.json
└─pages.json
```

Example 3 (javascript):
```javascript
{
	"pages": [{
		"path": "index/index",
		"style": {
			// #ifdef APP-PLUS || H5 || MP-WEIXIN || MP-QQ
			"usingComponents": {
				"custom": "/wxcomponents/custom/index"
			},
			// #endif
			// #ifdef MP-BAIDU
			"usingComponents": {
				"custom": "/swancomponents/custom/index"
			},
			// #endif
			// #ifdef MP-ALIPAY
			"usingComponents": {
				"custom": "/mycomponents/custom/index"
			},
			// #endif
			"navigationBarTitleText": "uni-app"
		}
	}]
}
```

Example 4 (javascript):
```javascript
{
	"pages": [{
		"path": "index/index",
		"style": {
			// #ifdef APP-PLUS || H5 || MP-WEIXIN || MP-QQ
			"usingComponents": {
				"custom": "/wxcomponents/custom/index"
			},
			// #endif
			// #ifdef MP-BAIDU
			"usingComponents": {
				"custom": "/swancomponents/custom/index"
			},
			// #endif
			// #ifdef MP-ALIPAY
			"usingComponents": {
				"custom": "/mycomponents/custom/index"
			},
			// #endif
			"navigationBarTitleText": "uni-app"
		}
	}]
}
```

---

## 页面样式与布局 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/syntax-css

**Contents:**
- # 页面样式与布局
- # css预处理器支持
- # 尺寸单位
- # 样式导入
- # 内联样式
- # 选择器
- # 全局样式与局部样式
- # CSS 变量
- # 固定值
- # Flex 布局

uni-app 有 vue 页面、nvue 页面、uvue页面。

uni-app 的 css 与 web 的 css 基本一致。本文没有讲解 css 的用法。在你了解 web 的 css 的基础之上，本文讲述一些样式相关的注意事项。

本文重点介绍 vue 页面，也就是webview中的样式注意事项。

uni-app 支持less、sass、scss、stylus等预处理器。

sass的预处理器，早年使用node-sass ，也就是vue2最初默认的编译器。

sass官方 推出了dart-sass来替代。node-sass已经停维很久了。

另外node-sass不支持arm cpu，也即Apple的M系列CPU，导致HBuilderX的arm版只能使用dart-sass。

node-sass有些淘汰的写法，在dart-sass里已不再支持。

所以开发者在从vue2升vue3时，使用HBuilderX arm版时，会发现老的vue2项目如果写了废弃scss语法，会编译报错。

这种分裂也导致插件生态混乱，导致多人协作时，比如一个项目有人用arm专版，有人使用intel版，造成协作障碍。

DCloud推荐开发者尽快升级到vue3，改用dart-sass。

从 HBuilderX 4.56+ ，vue2 项目也将默认使用 dart-sass 预编译器。

node-sass升级dart-sass常见问题及改进方法：

解决方案：/deep/ 替换成::v-deep

解决方案：使用 math.div() 替换除法运算符 详情 ，如果遇到@use 'sass:math';编译报错，可以在uni.scss中定义，详情

解决方案：calc 在特定情况需要带单位，比如：width: calc(100% - 215) 修改为：width: calc(100% - 215px)

uni-app 支持的通用 css 单位包括 px、rpx

vue 页面支持下面这些普通 H5 单位，但在 nvue 里不支持：

App 端，在 pages.json 里的 titleNView 或页面里写的 plus api 中涉及的单位，只支持 px。注意此时不支持 rpx

nvue 中，uni-app 模式（nvue 不同编译模式介绍 ）可以使用 px 、rpx，表现与 vue 中基本一致，另外启用 dynamicRpx 后可以适配屏幕大小动态变化。weex 模式目前遵循 weex 的单位，它的单位比较特殊：

设计师在提供设计图时，一般只提供一个分辨率的图。

严格按设计图标注的 px 做开发，在不同宽度的手机上界面很容易变形。

而且主要是宽度变形。高度一般因为有滚动条，不容易出问题。由此，引发了较强的动态宽度单位需求。

微信小程序设计了 rpx 解决这个问题。uni-app 在 App 端、H5 端都支持了 rpx，并且可以配置不同屏幕宽度的计算方式，具体参考：rpx 计算配置 。

rpx 是相对于基准宽度的单位，可以根据屏幕宽度进行自适应。uni-app 规定屏幕基准宽度 750rpx。

开发者可以通过设计稿基准宽度计算页面元素 rpx 值，设计稿 1px 与框架样式 1rpx 转换公式如下：

设计稿 1px / 设计稿基准宽度 = 框架样式 1rpx / 750rpx

换言之，页面元素宽度在 uni-app 中的宽度计算公式：

750 * 元素在设计稿中的宽度 / 设计稿基准宽度

使用@import语句可以导入外联样式表，@import后跟需要导入的外联样式表的相对路径，用;表示语句结束。

示例源码如下，请查看 pre > code 标签中的内容

框架组件上支持使用 style、class 属性来控制组件的样式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中不能使用 * 选择器。

微信小程序自定义组件中仅支持 class 选择器

示例源码如下，请查看 pre > code 标签中的内容

web端可以使用html、body、:root等选择器。由于页面的css样式隔离，且html节点并未添加data-xxx属性，html、:root写在页面style内无效，只能写在App.vue内。

定义在 App.vue 中的样式为全局样式，作用于每一个页面。在 pages 目录下 的 vue 文件中定义的样式为局部样式，只作用在对应的页面，并会覆盖 App.vue 中相同的选择器。

快速书写 css 变量的方法是：在 css 中敲 hei，在候选助手中即可看到 3 个 css 变量。（HBuilderX 1.9.6 以上支持）

示例 1 - 普通页面使用 css 变量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例 2 - nvue 页面获取状态栏高度

示例源码如下，请查看 pre > code 标签中的内容

uni-app 中以下组件的高度是固定的，不可修改：

各小程序平台，包括同小程序平台的 iOS 和 Android 的高度也不一样。

为支持跨平台，框架建议使用 Flex 布局，关于 Flex 布局可以参考外部文档A Complete Guide to Flexbox 、阮一峰的 flex 教程 等。

uni-app 支持使用在 css 里设置背景图片，使用方式与普通 web 项目大体相同，但需要注意以下几点：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 支持使用字体图标，使用方式与普通 web 项目相同，需要注意以下几点：

示例源码如下，请查看 pre > code 标签中的内容

nvue中不可直接使用 css 的方式引入字体文件，需要使用以下方式在 js 内引入。nvue 内不支持本地路径引入字体，请使用网络链接或者base64形式。src字段的url的括号内一定要使用单引号。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (yaml):
```yaml
width: calc(100% - 215)
```

Example 3 (yaml):
```yaml
width: calc(100% - 215px)
```

Example 4 (unknown):
```unknown
设计稿 1px / 设计稿基准宽度 = 框架样式 1rpx / 750rpx
```

---

## 状态管理 Pinia | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-pinia.html

**Contents:**
- # 状态管理 Pinia
- # 介绍
  - # Pinia 是什么？
- # 项目结构
- # 基本示例
      - 本页导读

uni-app 内置了 Pinia 。Vue 2 项目暂不支持

HBuilder X 已内置了 Pinia，无需手动安装，按照下方示例使用即可。

App 升级时，如果之前使用 HBuilder X 版本 < 4.14 打包，现在使用 HBuilder X 版本 >= 4.14，更新时需要整包更新不可使用wgt更新（在 4.14 时升级了 vue 版本，低版本的基座和高版本 wgt 资源包会导致使用 Pinia 时报错）

4.14 之前：执行 yarn add pinia@2.0.36 或 npm install pinia@2.0.36 安装，要固定版本

4.14 之后：执行 yarn add pinia 或 npm install pinia 安装，可不指定版本

Pinia（发音为 /piːnjʌ/，如英语中的 peenya） 是 Vue 的存储库，它允许您跨组件、页面共享状态。在服务器端以及小型单页应用程序中，您也可以从使用 Pinia 中获得很多好处：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为实现更多高级用法，你甚至可以使用一个函数 (与组件 setup() 类似) 来定义一个 Store：

示例源码如下，请查看 pre > code 标签中的内容

如果你还不熟悉 setup() 函数和组合式 API，Pinia 也提供了一组类似 Vuex 的 映射 state 的辅助函数 。

你可以用和之前一样的方式来定义 Store，然后通过 mapStores()、mapState() 或 mapActions() 访问：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HBuilder X 版本 < 4.14
```

Example 2 (unknown):
```unknown
HBuilder X 版本 >= 4.14
```

Example 3 (python):
```python
yarn add pinia@2.0.36
```

Example 4 (python):
```python
npm install pinia@2.0.36
```

---

## 状态管理Vuex | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-vuex.html

**Contents:**
- # 状态管理Vuex
- # 介绍
  - # Vuex 是什么？
  - # 什么是“状态管理模式”？
- # 优势与使用场景
  - # Vuex与全局变量区别
  - # 什么时候需要用vuex？
- # 项目结构
- # 核心概念
  - # State

这是与 Vue 3 匹配的 Vuex 4 的文档。差异对比可参阅从 3.x 迁移到 4.0

已经有 Vue2项目，需要适配 Vue3 的可参阅 vue2 项目迁移 vue3 ！

Vuex 是一个专为 Vue.js 应用程序开发的状态管理模式。它采用集中式存储管理应用的所有组件的状态，并以相应的规则保证状态以一种可预测的方式发生变化。

让我们从一个简单的 Vue 计数应用开始：

示例源码如下，请查看 pre > code 标签中的内容

以下是一个表示“单向数据流”理念的简单示意：

但是，当我们的应用遇到多个组件共享状态时，单向数据流的简洁性很容易被破坏：

因此，我们把组件的共享状态抽取出来，以一个全局单例模式管理。在这种模式下，我们的组件树构成了一个巨大的“视图”，不管在树的哪个位置，任何组件都能获取状态或者触发行为！这就是vuex的产生。

通过定义和隔离状态管理中的各种概念并通过强制规则维持视图和状态间的独立性，我们的代码将会变得更结构化且易维护。这就是 Vuex 背后的基本思想。

Vuex 是专门为 Vue.js 设计的状态管理库，以利用 Vue.js 的细粒度数据响应机制来进行高效的状态更新。

如果你想交互式地学习 Vuex，可以看这个 Scrimba 上的 Vuex 课程 ，它将录屏和代码试验场混合在了一起，你可以随时暂停并尝试。

应用层级的状态应该集中到单个 store 对象中。

提交 mutation 是更改状态的唯一方法，并且这个过程是同步的。

异步逻辑都应该封装到 action 里面。

只要你遵守以上规则，如何组织代码随你便。如果你的 store 文件太大，只需将 action 、mutation 和 getter 分割到单独的文件。

对于大型应用，我们会希望把 Vuex 相关代码分割到模块中。下面是项目结构示例：

示例源码如下，请查看 pre > code 标签中的内容

每一个 Vuex 应用的核心就是 store（仓库），它包含着你的应用中大部分的状态 (state)。

状态管理有5个核心：state、getter、mutation、action、module。

单一状态树，定义应用状态的默认初始值，页面显示所需的数据从该对象中进行读取。

由于 Vuex 的状态存储是响应式的，从 store 实例中读取状态最简单的方法就是在计算属性中返回某个状态：

示例源码如下，请查看 pre > code 标签中的内容

每当 store.state.count 变化的时候, 都会重新求取计算属性，并且触发更新相关联的 DOM。

然而，这种模式导致组件依赖全局状态单例。在模块化的构建系统中，在每个需要使用 state 的组件中需要频繁地导入，并且在测试组件时需要模拟状态。

Vuex 通过 store 选项，提供了一种机制将状态从根组件“注入”到每一个子组件中（需调用 Vue.use(Vuex)）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当一个组件需要获取多个状态的时候，将这些状态都声明为计算属性会有些重复和冗余。 为了解决这个问题，我们可以使用 mapState 辅助函数 帮助我们生成计算属性，让你少按几次键：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

mapState 函数返回的是一个对象。使用对象展开运算符将多个对象合并为一个，以使我们可以将最终对象传给 computed 属性。极大地简化写法：

示例源码如下，请查看 pre > code 标签中的内容

Vuex 允许我们在 store 中定义“getter”（可以认为是 store 的计算属性），对 state 的加工，是派生出来的数据。 可以在多组件中共享 getter 函数，这样做还可以提高运行效率。

从 Vue 3.0 开始，getter 的结果不再像计算属性一样会被缓存起来。详见

在 uni-app 项目根目录下，store 目录 index.js 文件下：

示例源码如下，请查看 pre > code 标签中的内容

在 store 上注册 getter，getter 方法接受以下参数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，getter 在通过属性访问时是作为 Vue 的响应式系统的一部分缓存其中的。

示例源码如下，请查看 pre > code 标签中的内容

你也可以通过让 getter 返回一个函数，来实现给 getter 传参。在你对 store 里的数组进行查询时非常有用。

注意，getter 在通过方法访问时，每次都会去进行调用，而不会缓存结果。

示例源码如下，请查看 pre > code 标签中的内容

mapGetters 辅助函数仅仅是将 store 中的 getter 映射到局部计算属性：

示例源码如下，请查看 pre > code 标签中的内容

如果你想将一个 getter 属性另取一个名字，使用对象形式：

示例源码如下，请查看 pre > code 标签中的内容

Vuex中store数据改变的唯一方法就是mutation

通俗的理解，mutations 里面装着改变数据的方法集合，处理数据逻辑的方法全部放在 mutations 里，使数据和视图分离。

Vuex 中的 mutation 非常类似于事件：每个 mutation 都有一个字符串的 事件类型 (type) 和 一个 回调函数 (handler)。这个回调函数就是我们实际进行状态更改的地方，并且它会接受 state 作为第一个参数：

示例源码如下，请查看 pre > code 标签中的内容

你不能直接调用一个 mutation handler。这个选项更像是事件注册：“当触发一个类型为 add 的 mutation 时，调用此函数”，要唤醒一个 mutation handler，你需要以相应的 type 调用 store.commit 方法。

注意：store.commit 调用 mutation（需要在根节点注入 store）。

示例源码如下，请查看 pre > code 标签中的内容

你可以向 store.commit 传入额外的参数，即 mutation 的 载荷（payload）：

还是以累加器的例子来实现 mutation 函数的传参，来动态定义累加的数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们修改组件中 store.commit 提交方式：

示例源码如下，请查看 pre > code 标签中的内容

当使用对象风格的提交方式，整个对象都作为载荷传给 mutation 函数，因此 handler 保持不变：

示例源码如下，请查看 pre > code 标签中的内容

使用 mapMutations 辅助函数将组件中的 methods 映射为 store.commit 调用（需要在根节点注入 store）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一条重要的原则就是要记住** mutation 必须是同步函数**

我们要通过提交 mutation 的方式来改变状态数据，是因为我们想要更明确地追踪到状态的变化。如果是类似下面这样异步的话：

示例源码如下，请查看 pre > code 标签中的内容

我们就不知道什么时候状态会发生改变，所以也就无法追踪了，这与 mutation 的设计初心相悖，所以强制规定它必须是同步函数。

action 类似于 mutation ，不同在于：

示例源码如下，请查看 pre > code 标签中的内容

action 函数接受一个与 store 实例具有相同方法和属性的 context 对象，因此你可以调用 context.commit 提交一个 mutation，或者通过 context.state 和 context.getters 来获取 state 和 getters。

实践中，我们会经常用到 ES2015 的参数解构来简化代码（特别是我们需要调用 commit 很多次的时候）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

action 可以执行任意的同步和异步操作

我们可以在 action 内部执行异步操作：

示例源码如下，请查看 pre > code 标签中的内容

来看一个更加实际的购物车示例，涉及到调用异步 API 和分发多重 mutation：

示例源码如下，请查看 pre > code 标签中的内容

注意我们正在进行一系列的异步操作，并且通过提交 mutation 来记录 action 产生的状态变更。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

action 通常是异步的，那么如何知道 action 什么时候结束呢？更重要的是，我们如何才能组合多个 action，以处理更加复杂的异步流程？

首先，你需要明白 store.dispatch 可以处理被触发的 action 的处理函数返回的 Promise，并且 store.dispatch 仍旧返回 Promise ：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

最后，如果我们利用 async / await，我们可以如下组合 action ：

示例源码如下，请查看 pre > code 标签中的内容

一个 store.dispatch 在不同模块中可以触发多个 action 函数。在这种情况下，只有当所有触发函数完成后，返回的 Promise 才会执行。

由于使用单一状态树，应用的所有状态会集中到一个比较大的对象。当应用变得非常复杂时，store 对象就有可能变得相当臃肿。

为了解决以上问题，Vuex 允许我们将 store 分割成模块（module）。每个模块拥有自己的 state、mutation、action、getter、甚至是嵌套子模块——从上至下进行同样方式的分割：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

vue是单向数据流，子组件不能直接修改父组件的数据，而通过vuex状态管理实现：把组件的共享状态抽取出来，以一个全局单例模式管理。在这种模式下，我们的组件树构成了一个巨大的“视图”，不管在树的哪个位置，任何组件都能获取状态或者触发行为！

**Examples:**

Example 1 (html):
```html
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

Example 2 (html):
```html
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

Example 3 (html):
```html
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

Example 4 (vue):
```vue
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

---

## 页面 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page.html

**Contents:**
- # 页面
- # 页面简介
- # 页面管理
  - # 新建页面
  - # 删除页面
  - # 页面改名
  - # pages.json
  - # 设置应用首页
- # 页面内容构成
  - # template模板区

uni-app项目中，一个页面就是一个符合Vue SFC规范的 vue 文件。

在 uni-app js 引擎版中，后缀名是.vue文件或.nvue文件。 这些页面均全平台支持，差异在于当 uni-app 发行到App平台时，.vue文件会使用webview进行渲染，.nvue会使用原生进行渲染，详见：nvue原生渲染。

一个页面可以同时存在vue和nvue，在pages.json的路由注册中不包含页面文件名后缀，同一个页面可以对应2个文件名。重名时优先级如下：

在 uni-app x 中，后缀名是.uvue文件

uni-app x 中没有js引擎和webview，不支持和vue页面并存。

uni-app x 在app-android上，每个页面都是一个全屏activity，不支持透明。

uni-app中的页面，默认保存在工程根目录下的pages目录下。

每次新建页面，均需在pages.json中配置pages列表；未在pages.json -> pages 中注册的页面，uni-app会在编译阶段进行忽略。pages.json的完整配置参考：页面配置。

通过HBuilderX开发 uni-app 项目时，在 uni-app 项目上右键“新建页面”，HBuilderX会自动在pages.json中完成页面注册，开发更方便。

同时，HBuilderX 还内置了常用的页面模板（如图文列表、商品列表等），选择这些模板，可以大幅提升你的开发效率。

新建页面时，可以选择是否创建同名目录。创建目录的意义在于：

操作和删除页面同理，依次修改文件和 pages.json。

pages.json是工程的页面管理配置文件，包括：页面路由注册、页面参数配置（原生标题栏、下拉刷新...）、首页tabbar等众多功能。

pages.json -> pages配置项中的第一个页面，作为当前工程的首页（启动页）。

示例源码如下，请查看 pre > code 标签中的内容

uni-app 页面基于 vue 规范。一个页面内，有3个根节点标签：

示例源码如下，请查看 pre > code 标签中的内容

template中文名为模板，它类似html的标签。但有2个区别：

在vue2中，template 的二级节点只能有一个节点，一般是在一个根 view 下继续写页面组件（如上示例代码）。

但在vue3中，template可以有多个二级节点，省去一个层级，如下：

示例源码如下，请查看 pre > code 标签中的内容

可以在 manifest 中切换使用 Vue2 还是 Vue3。

注意：uni-app x 中只支持 Vue3。

script中编写脚本，可以通过lang属性指定脚本语言。

示例源码如下，请查看 pre > code 标签中的内容

在vue的选项式（option）规范中，script下包含 export default {}。除了选项式，还有 组合式 写法。

页面级的代码大多写在 export default {} 中。写在里面的代码，会随着页面关闭而关闭。

写在 export default {} 外面的代码，一般有几种情况：

示例源码如下，请查看 pre > code 标签中的内容

开发者应谨慎编写 export default {} 外面的代码，这里的代码有2个注意事项：

export default {} 里的内容，是页面的主要逻辑代码。包括几部分：

整体效果就是，刚开始按钮文字是"点我"，点一下后按钮文字变成了"被点了"

示例源码如下，请查看 pre > code 标签中的内容

本章节为页面代码介绍，并非vue教程，了解data数据需详见

style的写法与web的css基本相同。

如果页面是nvue或uvue，使用原生渲染而不是webview渲染，那么它们支持的css是有限的。

uni-app 页面除支持 Vue 组件生命周期外还支持下方页面生命周期函数，当以组合式 API 使用时，在 Vue2 和 Vue3 中存在一定区别，请分别参考：Vue2 组合式 API 使用文档 和 Vue3 组合式 API 使用文档。

接下来我们介绍onLoad、onReady、onShow的先后关系，页面加载的详细流程。

所以原生导航栏是最快显示的。页面背景色也应该在这里配置。

这里的dom创建仅包含第一批处理的静态dom。对于通过js/uts更新data然后通过v-for再创建的列表数据，不在第一批处理。

要注意一个页面静态dom元素过多，会影响页面加载速度。在uni-app x Android版本上，可能会阻碍页面进入的转场动画。 因为此时，页面转场动画还没有启动。

此时页面还未显示，没有开始进入的转场动画，页面dom还不存在。

所以这里不能直接操作dom（可以修改data，因为vue框架会等待dom准备后再更新界面）；在 app-uvue 中获取当前的activity拿到的是老页面的activity，只能通过页面栈获取activity。

onLoad比较适合的操作是：接受上页的参数，联网取数据，更新data。

手机都是多核的，uni.request或云开发联网，在子线程运行，不会干扰UI线程的入场动画，并行处理可以更快的拿到数据、渲染界面。

但onLoad里不适合进行大量同步耗时运算，因为此时转场动画还没开始。

尤其uni-app x 在 Android上，onLoad里的代码（除了联网和加载图片）默认是在UI线程运行的，大量同步耗时计算很容易卡住页面动画不启动。除非开发者显式指定在其他线程运行。

新页面开始进入的转场动画，动画默认耗时300ms，可以在路由API中调节时长。

第2步创建dom是虚拟dom，dom创建后需要经历一段时间，UI层才能完成了页面上真实元素的创建，即触发了onReady。

onReady后，页面元素就可以自由操作了，比如ref获取节点。同时首批界面也渲染了。

注意：onReady和转场动画开始、结束之间，没有必然的先后顺序，完全取决于dom的数量和复杂度。

如果元素排版和渲染够快，转场动画刚开始就渲染好了；

大多情况下，转场动画走几格就看到了首批渲染内容；

如果元素排版和渲染过慢，转场动画结束都没有内容，就会造成白屏。

联网进程从onLoad起就在异步获取数据更新data，如果服务器速度够快，第二批数据也可能在转场动画结束前渲染。

再次强调，5和6的先后顺序不一定，取决于首批dom渲染的速度。

了解了页面加载时序原理，我们就知道如何避免页面加载常见的问题：

a页面刚进入时，会触发a页面的onShow。

当a跳转到b页面时，a会触发onHide，而b会触发onShow。

但当b被关闭时，b会触发onUnload，此时a再次显示出现，会再次触发onShow。

在tabbar页面（指pages.json里配置的tabbar），不同tab页面互相切换时，会触发各自的onShow和onHide。

可在pages.json里定义具体页面底部的触发距离onReachBottomDistance，

比如设为50，那么滚动页面到距离底部50px时，就会触发onReachBottom事件。

如使用scroll-view导致页面没有滚动，则触底事件不会被触发。scroll-view滚动到底部的事件请参考scroll-view的文档。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

详细说明及使用：onBackPress 详解

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app 组件支持的生命周期，与vue标准组件的生命周期相同。这里没有页面级的onLoad等生命周期：

getApp() 函数用于获取当前应用实例，一般用于获取globalData。也可通过应用实例调用 App.vue methods 中定义的方法。

示例源码如下，请查看 pre > code 标签中的内容

getCurrentPages() 函数用于获取当前页面栈的实例，以数组形式按栈的顺序给出，数组中的元素为页面实例，第一个元素为首页，最后一个元素为当前页面。

getCurrentPages() 仅用于展示页面栈的情况，请勿修改页面栈，以免造成页面状态错误。 页面关闭时，对应页面实例会在页面栈中删除。

uni-app 在 getCurrentPages()获得的页面里内置了一个方法 $getAppWebview() 可以得到当前webview的对象实例，从而实现对 webview 更强大的控制。在 html5Plus 中，plus.webview具有强大的控制能力，可参考：WebviewObject 。

但uni-app框架有自己的窗口管理机制，请不要自己创建和销毁webview，如有需求覆盖子窗体上去，请使用原生子窗体subNvue。

示例源码如下，请查看 pre > code 标签中的内容

getCurrentPages()可以得到所有页面对象，然后根据数组，可以取指定的页面webview对象

示例源码如下，请查看 pre > code 标签中的内容

uni-app自带的web-view组件，是页面中新插入的一个子webview。获取该对象的方法见：https://ask.dcloud.net.cn/article/35036

触发全局的自定义事件。附加参数都会传给监听器回调。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件。事件可以由 uni.$emit 触发，回调函数会接收所有传入事件触发函数的额外参数。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件。事件可以由 uni.$emit 触发，但是只触发一次，在第一次触发之后移除监听器。

示例源码如下，请查看 pre > code 标签中的内容

$emit、$on、$off常用于跨页面、跨组件通讯，这里为了方便演示放在同一个页面

示例源码如下，请查看 pre > code 标签中的内容

uni-app页面路由为框架统一管理，开发者需要在pages.json里配置每个路由页面的路径及页面样式。类似小程序在 app.json 中配置页面路由一样。所以 uni-app 的路由用法与 Vue Router 不同，如仍希望采用 Vue Router 方式管理路由，可在插件市场搜索 Vue-Router 。

uni-app 有两种页面路由跳转方式：使用navigator组件跳转、调用API跳转。

页面返回时会自动关闭 loading 及 toast, modal 及 actionSheet 不会自动关闭。 页面关闭时，只是销毁了页面实例，未完成的网络请求、计时器等副作用需开发者自行处理。

框架以栈的形式管理当前所有页面， 当发生路由切换的时候，页面栈的表现如下：

uni-app 支持在 template 模板中嵌套 <template/> 和 <block/>，用来进行 条件渲染 和 列表渲染。

<template/> 和 <block/> 并不是一个组件，它们仅仅是一个包装元素，不会在页面中做任何渲染，只接受控制属性。

<block/> 在不同的平台表现存在一定差异，推荐统一使用 <template/>。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

基于原生引擎的渲染，虽然还是前端技术栈，但和 web 开发肯定是有区别的。

**Examples:**

Example 1 (php):
```php
pages.json -> pages
```

Example 2 (php):
```php
pages.json -> pages
```

Example 3 (php):
```php
pages.json -> pages
```

Example 4 (json):
```json
{
	"pages": [
		{
			"path": "pages/index/index", //名字叫不叫index无所谓，位置在第一个，就是首页
			"style": {
				"navigationBarTitleText": "首页" //页面标题
			}
		},
		{
			"path": "pages/my",
			"style": {
				"navigationBarTitleText": "我的"
			}
		},
	]
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment

**Contents:**
      - 本页导读

App端支付模块封装了市场上主流的三方支付平台SDK，提供JS API统一调用移动支付功能。

如果服务端使用uniCloud ，官方提供了uniPay 云端统一支付服务，极大提升支付业务的开发效率，强烈推荐给开发者使用，参考示例：https://ext.dcloud.net.cn/plugin?id=1835

使用支付功能需在项目manifest.json的“App模块配置”中勾选“Payment(支付)”，并根据项目实际情况勾选使用的三方支付平台：

提示：支付模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## Geolocation定位 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-geolocation

**Contents:**
- # Geolocation定位
  - # 系统定位
    - # iOS平台
    - # Android平台
  - # 高德定位
    - # 参数说明
    - # 高德开放平台用户名
  - # 腾讯定位
    - # 参数说明
  - # 商业授权相关说明

定位模块封装了OS自带的系统定位，及市场上主流的三方定位SDK，如高德定位、腾讯定位等。并提供统一的JS API调用定位能力。

三方定位（高德、腾讯、谷歌等）是商业收费服务，需获取授权，注意避免侵权。详见

使用定位功能需在项目manifest.json的“App模块配置”中勾选“Geolocation(定位)”，并根据项目实际需求勾选使用的三方定位SDK：

HBuilderX3.2.16开始独立出“系统定位”模块

使用系统定位需在“App模块配置”项的“Geolocation(定位)”下，勾选“系统定位”：

系统定位调用设备的操作系统提供的定位服务，只支持wgs84坐标系，不同设备对定位功能支持的情况有所差异。

由苹果iOS系统提供定位服务，可以获取经纬度信息，支持解析地址信息，即可以直接返回城市街道信息。

只可以获取经纬度信息，不支持解析地址信息，即无法返回城市街道信息。

标准Android系统的定位服务是Google的GMS服务，需连接Google服务器。中国大陆地区用户无法翻墙，导致无法使用定位，或者很多国产手机阉割掉了GMS，也导致无法使用定位。

国内手机厂商早期均没有内置替代GMS的位置服务，这些设备上只能使用三方定位。但后期大品牌手机和三方定位合作，内置了替代GMS的版本。如下Android手机厂商的新款手机都支持系统定位：

其他小众品牌可能不支持，主流品牌中较老的机型也不支持，暂无机型清单，需自行测试。

需要向高德申请商业授权，参考:商业授权相关说明，使用前需登录 高德开放平台 创建应用申请Key

使用高德定位需在“App模块配置”项的“Geolocation(定位)”下，勾选“高德定位”：

登录 高德开放平台 ，进入“控制台”，在“账号信息”的“基本信息”中可获取“用户名”：

HBuilderX4.31 新增支持 腾讯定位 需要向腾讯申请商业授权，参考:商业授权相关说明，使用前需登录 腾讯位置服务官网 创建应用申请Key

使用腾讯定位需在“安卓/iOS模块配置”项的“Geolocation(定位)”下，勾选“腾讯定位”：

2021年起，高德、腾讯、百度等地图服务商开始商业授权。

例外：如果是公益类应用，可以申请豁免商业授权。只要不是公益应用，不管你有多少用户，都需要获取商业授权。

如需购买地图的商业授权，请点击 获取优惠 。

部分中介采用共享地图授权的模式，吸引开发者向该中介采购地图授权。本质是中介向地图厂商支付授权费，然后把开发者的应用创建到中介在地图厂商的账户下。

这种做法是纯粹的骗局。因为开发者向中介支付了费用，虽然可能低于地图厂商的授权费，但开发者并没有获得商业许可。地图厂商的商业许可是出具给中介的，开发者仍然是侵权的。地图厂商仍然会给您打电话催缴商业许可费用。

所以请开发者务必注意，付款时一定要拿到地图厂商向您出具的授权许可。切勿付了款又没有得到授权，财物两空。

对于已经被中介欺骗的开发者，请尽快向公安报案。

海外用户使用google地图，也需要付费，支持按量付费，具体请参阅google地图官网。

---

## renderjs | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/renderjs.html

**Contents:**
- # renderjs
  - # 使用方式
  - # 示例
  - # 功能详解
  - # 注意事项
      - 本页导读

renderjs是一个运行在视图层的js。它比WXS更加强大。它只支持app-vue和web。

设置 script 节点的 lang 为 renderjs

示例源码如下，请查看 pre > code 标签中的内容

uni-app的app端逻辑层和视图层是分离的，这种机制有很多好处，但也有一个副作用是在造成了两层之间通信阻塞。尤其是App的Android端阻塞问题影响了高性能应用的制作。

renderjs运行在视图层，可以直接操作视图层的元素，避免通信折损。

在hello uni-app的canvas示例中，App端使用了renderjs，由运行在视图层的renderjs直接操作视图层的canvas，实现了远超微信小程序的流畅canvas动画示例。具体在hello uni-app 示例中体验，对比App端和小程序端的性能差异。

官方不建议在uni-app里操作dom，但如果你不开发小程序，想使用一些操作了dom、window的库，其实可以使用renderjs来解决。

在app-vue环境下，视图层由webview渲染，而renderjs运行在视图层，自然可以操作dom和window。

这是一个基于renderjs运行echart完整版的示例：renderjs版echart

同理，f2、threejs等库都可以这么用。

**Examples:**

Example 1 (html):
```html
<script module="test" lang="renderjs">
	export default {
		mounted() {
			// ...
		},
		methods: {
			// ...
		}
	}
</script>
```

Example 2 (html):
```html
<script module="test" lang="renderjs">
	export default {
		mounted() {
			// ...
		},
		methods: {
			// ...
		}
	}
</script>
```

Example 3 (html):
```html
<script module="test" lang="renderjs">
	export default {
		mounted() {
			// ...
		},
		methods: {
			// ...
		}
	}
</script>
```

Example 4 (vue):
```vue
<script module="test" lang="renderjs">
	export default {
		mounted() {
			// ...
		},
		methods: {
			// ...
		}
	}
</script>
```

---

## 应用市场上架注意事项 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/store.html

**Contents:**
- # 应用市场上架注意事项
  - # 华为
  - # 小米
  - # OPPO
  - # VIVO
  - # 荣耀
  - # 苹果
- # 国内应用市场上架
- # Google Play上架
- # App Store上架

应用（或称“APP”）上架至应用市场时，应用市场会根据APP的行业分类以及所涉及的具体功能和服务而要求APP提供者提交相应的资质、许可、备案、授权等文件。以下是主要手机厂商应用市场的APP审核相关规则，以供开发者进行了解和准备。

最近为有效治理App强制授权、过度索权、超范围收集个人信息等现象，落实《网络安全法》《消费者权益保护法》的要求，保障个人信息安全，各大应用市场都加强应用审核的检测，要求应用必须符合相关政策，否则应用将有被通报或下架的风险。

应用市场上架审核合规指南：https://ask.dcloud.net.cn/article/39073

首先App提交云端打包时请务必勾选“GooglePlay”渠道：

Google Play上架审核要求比较严格，需要注意以下问题：

应用必须适配Android11，设置targetSdkVersion大于等于30：https://ask.dcloud.net.cn/article/193

上传安装包使用Android App Bundle（AAB）格式：https://ask.dcloud.net.cn/article/39052

再次说明：uni-app并不是简单的使用Webview套壳，Webview仅负责vue页面的UI渲染，nvue页面则完全由原生UI渲染，业务逻辑代码是运行在独立的JS引擎（JSCore）中，并且封装了很多JS API调用原生能力（OC代码实现），完全可以上架苹果应用市场。

苹果App Store上架审核规范比较细，提交审核前建议仔细阅读苹果官方App Store审核指南 。

使用广告标识（IDFA）相关说明：https://ask.dcloud.net.cn/article/36107

UIWebview API 已废弃：https://ask.dcloud.net.cn/article/36348

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/ssr.html

**Contents:**
    - # 什么是服务器端渲染 (SSR)？
    - # 为什么使用服务器端渲染 (SSR)？
    - # 编写通用代码
      - # 服务器上的数据响应
      - # 组件生命周期钩子函数
      - # 访问特定平台(Platform-Specific) API
    - # 数据预取和状态
    - # 运行与调试
    - # 发行与部署
      - # 部署到uniCloud

uni-app已支持vue 3.0开发，详见：https://ask.dcloud.net.cn/article/37834

uni-app官方基于vue 3.0 & uniCloud提供了简单、易用的SSR支持。

news.dcloud.io 是一套基于uni-app & uniCloud 开发的新闻系统，你可以通过浏览器查看源码，这是一个服务端渲染（SSR）的站点示例。

uni-app 默认情况下，是在客户端中输出 Vue 组件，进行生成 DOM 和操作 DOM。然而，也可以将同一个组件渲染为服务器端的 HTML 字符串，将它们直接发送到浏览器，最后将这些静态标记"激活"为客户端上完全可交互的应用程序。

服务器渲染的 uni-app 应用程序也可以被认为是"同构"或"通用"，因为应用程序的大部分代码都可以在服务器和客户端上运行。

与传统 SPA (单页应用程序 (Single-Page Application)) 相比，服务器端渲染 (SSR) 的优势主要在于：

更好的 SEO，搜索引擎爬虫抓取工具可以直接查看完全渲染的页面。

更快的内容到达时间 (time-to-content)，特别是对于缓慢的网络情况或运行缓慢的设备。无需等待所有的 JavaScript 都完成下载并执行，才显示服务器渲染的标记，所以你的用户将会更快速地看到完整渲染的页面。通常可以产生更好的用户体验，并且对于那些「内容到达时间(time-to-content) 与转化率直接相关」的应用程序而言，服务器端渲染 (SSR) 至关重要。

使用服务器端渲染 (SSR) 时还需要有一些权衡之处：

开发条件所限。浏览器特定的代码，只能在某些生命周期钩子函数 (lifecycle hook) 中使用；一些外部扩展库 (external library) 可能需要特殊处理，才能在服务器渲染应用程序中运行。

涉及构建设置和部署的更多要求。与可以部署在任何静态文件服务器上的完全静态单页面应用程序 (SPA) 不同，服务器渲染应用程序，需要处于 Node.js server 运行环境。

更多的服务器端负载。在 Node.js 中渲染完整的应用程序，显然会比仅仅提供静态文件的 server 更加大量占用 CPU 资源 (CPU-intensive - CPU 密集)，因此如果你预料在高流量环境 (high traffic) 下使用，请准备相应的服务器负载，并明智地采用缓存策略。

幸运的是，以上问题，uniCloud 均为您提供了解决方案

在进一步介绍之前，让我们花点时间来讨论编写"通用"代码时的约束条件 - 即运行在服务器和客户端的代码。由于用例和平台 API 的差异，当运行在不同环境中时，我们的代码将不会完全相同。所以这里我们将会阐述你需要理解的关键事项。

在纯客户端应用程序 (client-only app) 中，每个用户会在他们各自的浏览器中使用新的应用程序实例。对于服务器端渲染，我们也希望如此：每个请求应该都是全新的、独立的应用程序实例，以便不会有交叉请求造成的状态污染 (cross-request state pollution)。

因为实际的渲染过程需要确定性，所以我们也将在服务器上“预取”数据 ("pre-fetching" data) - 这意味着在我们开始渲染时，我们的应用程序就已经解析完成其状态。也就是说，将数据进行响应式的过程在服务器上是多余的，所以默认情况下禁用。禁用响应式数据，还可以避免将「数据」转换为「响应式对象」的性能开销。

由于没有动态更新，所有的生命周期钩子函数中，只有 beforeCreate 和 created 会在服务器端渲染 (SSR) 过程中被调用。这就是说任何其他生命周期钩子函数中的代码（例如 beforeMount 或 mounted），只会在客户端执行。

此外还需要注意的是，你应该避免在 beforeCreate 和 created 生命周期时产生全局副作用的代码，例如在其中使用 setInterval 设置 timer。在纯客户端 (client-side only) 的代码中，我们可以设置一个 timer，然后在 beforeUnmount 或 unmounted 生命周期时将其销毁。但是，由于在 SSR 期间并不会调用销毁钩子函数，所以 timer 将永远保留下来。为了避免这种情况，请将副作用代码移动到 beforeMount 或 mounted 生命周期中。

通用代码不可接受特定平台的 API，因此如果你的代码中，直接使用了像 window 或 document，这种仅浏览器可用的全局变量，则会在 Node.js 中执行时抛出错误，反之也是如此。

对于仅浏览器可用的 API，通常方式是，在「纯客户端 (client-only)」的生命周期钩子函数中惰性访问 (lazily access) 它们。

请注意，考虑到如果第三方 library 不是以上面的通用用法编写，则将其集成到服务器渲染的应用程序中，可能会很棘手。你可能要通过模拟 (mock) 一些全局变量来使其正常运行，但这只是 hack 的做法，并且可能会干扰到其他 library 的环境检测代码。

在服务器端渲染(SSR)期间，我们本质上是在渲染我们应用程序的"快照"，所以如果应用程序依赖于一些异步数据，那么在开始渲染过程之前，需要先预取和解析好这些数据。

另一个需要关注的问题是在客户端，在挂载 (mount) 到客户端应用程序之前，需要获取到与服务器端应用程序完全相同的数据 - 否则，客户端应用程序会因为使用与服务器端应用程序不同的状态，然后导致混合失败。

为了解决这个问题，获取的数据需要位于视图组件之外，即放置在专门的数据预取存储容器(data store)或"状态容器(state container)"中。首先，在服务器端，我们可以在渲染之前预取数据，并将数据填充到 store 中。此外，我们将在 HTML 中序列化(serialize)和内联预置(inline)状态。这样，在挂载(mount)到客户端应用程序之前，可以直接从 store 获取到内联预置(inline)状态。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX创建的项目在运行菜单勾选启用SSR再运行到浏览器即可

cli创建的项目使用npm run dev:h5:ssr运行即可

发行ssr会得到两部分内容，云端部分和静态资源部分。在uniCloud内部署需要将云端部分部署到云函数内，静态资源部分部署在前端网页托管内。

需要HBuilderX版本3.5.1及以上版本，支持部署到阿里云和腾讯云此前仅支持自动部署到阿里云

配置vite.config.js中的base为前端网页托管地址

示例源码如下，请查看 pre > code 标签中的内容

通过HBuilderX的发行菜单->网站 PC-Web或手机H5、勾选ssr、勾选将编译后的资源部署在uniCloud前端网页托管

配置uni-ssr的云函数URL化路径，请参考文档：云函数URL化

配置vite.config.js中的base为前端网页托管地址

示例源码如下，请查看 pre > code 标签中的内容

cli工程：npm run build:h5:ssr或通过HBuilderX 3.1.16及以上版本的发行菜单->网站 PC-Web或手机H5、勾选ssr

非cli工程：通过HBuilderX 3.1.16及以上版本的发行菜单->网站 PC-Web或手机H5、勾选ssr

将编译后的dist/build/h5/client中的资源上传至前端网页托管，推荐使用免费的阿里云服务空间

将编译后的dist/build/h5/server目录拷贝至uni-ssr云函数根目录，并上传。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
vue 3.0 & uniCloud
```

Example 2 (unknown):
```unknown
uni-app & uniCloud
```

Example 3 (python):
```python
@dcloudio/uni-app
```

Example 4 (unknown):
```unknown
shallowSsrRef
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-privacy-android.html

**Contents:**
  - # 概述
  - # DCloud数据采集说明
  - # 配置方式
    - # HBuilderX3.2.1及以上版本配置方式
    - # HBuilderX3.2.0及以下版本配置方法
    - # 模板提示框
    - # 无提示框
  - # 离线打包配置方式
  - # 模板提示框
  - # 二次确认提示框

HBuilderX2.6.3+版本开始支持配置隐私政策提示框 HBuilderX3.1.10+版本优化template模式策略，解决应用市场检测到弹出隐私政策提示框之前读取mac地址和应用列表的问题 HBuilderX3.2.1+版本开始支持androidPrivacy.json文件配置隐私政策提示框，真机运行时也可生效 HBuilderX3.2.5+版本隐私政策提示框内容中的链接支持本地 html 页面地址 注意：目前设置custom模式策略，并不能完全避免在弹出隐私提示框之前，读取设备信息（如mac地址、应用列表等）的情况，主要原因是自定义模式隐私提示框并不能阻塞应用的生命周期，使用到一些三方SDK（如X5 Webview内核、UniPush等）在应用启动时会执行初始化操作，三方SDK这是可能会读取设备信息。碰到此问题的开发者请先使用template模式解决，我们后续会提供新的自定义隐私提示框样式解决方案。

请使用HBuilderX3.2.15+ 版本打包，并使用template配置隐私弹窗否则无法正常上架应用市场 uni小程序SDK暂时不支持uniapp自己配置隐私弹窗，需要宿主自行实现隐私弹窗

DCloud联合业内主流隐私合规检测厂商推出了uni隐私合规检测服务，可在线申请获取详细检测报告，详见：uni隐私合规检测

根据工业和信息化部关于开展APP侵害用户权益专项整治要求，App提交到应用市场必须满足以下条件：

为了兼顾隐私政策提示框的易用性和灵活性，解决弹出隐私政策提示框之前可能弹出系统授权框的问题。Android平台提供了以下隐私政策提示配置策略：

为了持续优化应用及提供统计报表功能，在运行过程中会采集应用启动时间、异常错误日志等数据，其中包含设备唯一识别码。

DCloud通过了国家信息安全等级保护三级，证书编号：11010813802-20001，保障相关数据的安全性 DCloud并非大数据公司，采集的数据是为开发者提供统计服务和产品持续优化，不包含个人隐私信息

请在《隐私政策》中必告知用户您的应用基于DCloud uni-app(5+ App/Wap2App)开发，增加如下参考条款

我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。详情内容请访问《[DCloud App引擎隐私政策](https://dcloud.io/license/appprivacy.html)》。

从HBuilderX3.2.1+版本开始新增androidPrivacy.json文件配置隐私政策提示框，支持真机运行查看效果，在androidPrivacy.json中也支持配置部分样式（如背景颜色、标题颜色、按钮颜色等）。 打开项目的manifest.json文件，切换到“App启动界面配置”，在“Android启动界面样式”中勾选“使用原生隐私政策提示框”

注意！androidPrivacy.json不要添加注释，会影响隐私政策提示框的显示！！！

勾选后会在项目中自动添加androidPrivacy.json文件，可以双击打开自定义配置以下内容：

示例源码如下，请查看 pre > code 标签中的内容

uni-app项目可以使用uni原生插件能支持更多自定义隐私政策提示框样式，可参考：https://ext.dcloud.net.cn/plugin?id=5581

打开项目的manifest.json文件，切换到“源码视图”项

示例源码如下，请查看 pre > code 标签中的内容

配置promt属性值为template时，表示使用原生模板隐私政策提示框，效果如下：

应用启动前，在Splash页面时显示此提示框，用户点击同意按钮后才会进入应用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：用户同意隐私政策前不要调用可能弹出系统授权框的API，如定位（plus.geolocation）、录音（plus.audio.getRecorder）等

配置prompt属性值为none时，表示不显示隐私政策提示框。 如果不提交到应用市场，可以使用此模式。

HBuilderX3.2.1+版本新增androidPrivacy.json配置隐私政策提示框，优先级高于原生环境配置，HBuilderX3.2.1+版本建议使用androidPrivacy.json 替代本章节的离线打包配置

在原生工程中应用的AndroidManifest.xml中配置隐私提供框模式，在application节点下添加meta-data节点数据，如下：

示例源码如下，请查看 pre > code 标签中的内容

android:value可取值为"template"、"none"。

** 配置使用"template"模板提示框时，需要按以下方法配置提示框内容** 在原生工程的res/values目录下的strings.xml配置默认语言内容（为了兼容用户设置不同语言的清空，此文件必须配置）。中文还需要创建res/values-zh目录下的strings.xml文件并配置中文内容。

请在原生工程的strings.xml中添加以下字段配置模板提示框内容。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX3.1.12+版本新增支持模板隐私提示框二次确认功能，点击隐私模板提示框时用户选择“拒绝”按钮并且二次确认提示框内容dcloud_second_privacy_prompt_message配置不为空时会弹出二次确认提示框。

请在原生工程的strings.xml中添加以下字段配置二次确认提示框内容。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX3.2.12+版本androidPrivacy.json支持国际化

示例源码如下，请查看 pre > code 标签中的内容

添加buttonAcceptLocales处理buttonAccept的国际化文本，如下

示例源码如下，请查看 pre > code 标签中的内容

需要在《隐私政策》中必告知用户您的应用基于DCloud uni-app(5+ App/Wap2App)开发，添加如下参考条款：

我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。

另外隐私政策中需要补充使用到的三方SDK，参考：

请参考文档Android平台各功能模块隐私合规条款

如果应用使用了uni原生插件，需要注意一下几点：

《隐私政策》必须非常清楚、全面地说明（不要用可能收集、了解用户信息这种模糊不清晰的词语）收集用户个人信息的目的、方式和范围。 如果应用使用“通讯录”、“短信”等相关功能，请根据应用业务场景进行描述。

**Examples:**

Example 1 (unknown):
```unknown
注意：目前设置custom模式策略，并不能完全避免在弹出隐私提示框之前，读取设备信息（如mac地址、应用列表等）的情况，主要原因是自定义模式隐私提示框并不能阻塞应用的生命周期，使用到一些三方SDK（如X5 Webview内核、UniPush等）在应用启动时会执行初始化操作，三方SDK这是可能会读取设备信息。碰到此问题的开发者请先使用template模式解决，我们后续会提供新的自定义隐私提示框样式解决方案。
```

Example 2 (markdown):
```markdown
我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。详情内容请访问《[DCloud App引擎隐私政策](https://dcloud.io/license/appprivacy.html)》。
```

Example 3 (json):
```json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
  "buttonAccept": "同意并接受",
  "buttonRefuse": "暂不同意",
  "hrefLoader": "system",
  "backToExit":"false",
  "second": {
    "title": "确认提示",
    "message": "　　进入应用前，你需先同意<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>，否则将退出应用。",
    "buttonAccept": "同意并继续",
    "buttonRefuse": "退出应用"
  },
  "disagreeMode":{
    "support": false,
    "loadNativePlugins": false,
    "visitorEntry": false,
    "showAlways": false
  },
  "styles": {
    "backgroundColor": "#00FF00",
    "borderRadius":"5px",
    "title": {
      "color": "#ff00ff"
    },
    "buttonAccept": {
      "color": "#ffff00"
    },
    "buttonRefuse": {
      "color": "#00ffff"
    },
    "buttonVisitor": {
      "color": "#00ffff"
    }
  }
}
```

Example 4 (json):
```json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
  "buttonAccept": "同意并接受",
  "buttonRefuse": "暂不同意",
  "hrefLoader": "system",
  "backToExit":"false",
  "second": {
    "title": "确认提示",
    "message": "　　进入应用前，你需先同意<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>，否则将退出应用。",
    "buttonAccept": "同意并继续",
    "buttonRefuse": "退出应用"
  },
  "disagreeMode":{
    "support": false,
    "loadNativePlugins": false,
    "visitorEntry": false,
    "showAlways": false
  },
  "styles": {
    "backgroundColor": "#00FF00",
    "borderRadius":"5px",
    "title": {
      "color": "#ff00ff"
    },
    "buttonAccept": {
      "color": "#ffff00"
    },
    "buttonRefuse": {
      "color": "#00ffff"
    },
    "buttonVisitor": {
      "color": "#00ffff"
    }
  }
}
```

---

## uni-vue-devtools | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/uni-vue-devtools.html

**Contents:**
- # uni-vue-devtools
  - # HBuilderX中的使用方法
  - # CLI使用方法
  - # 常见问题
      - 本页导读

新增于HBuilderX 3.7.0 及 cli 3.0.0-Alpha-3070020230117001+

uni-vue-devtools 是基于 vue-devtools 开发的 uni-app 项目调试工具。

在web开发时，开发者可以在 chrome 里安装 vue devtools插件。但app和小程序过去无法使用。

现在HBuilderX集成了该功能，web、app、小程序均可使用。

vue devtools提供了2个特色功能：

HBuilderX 运行菜单下针对每个运行平台有一个 运行时自动打开 Vue Devtools 按钮，

勾选后，运行到对应平台时会自动开启 Vue Devtools。服务启动后，会自动打开一个弹窗，并显示待连接状态，

如果您不需要默认开启 Vue Devtools，但在开发过程中临时需要 Devtools 调试，可点击控制台右上角 Vue 图标按钮，

此时会以 Devtools 模式重启开发服务。

如果您不使用HBuilderX开发uni-app，也可以通过cli方式使用vue devtools。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

服务启动后，会自动在默认浏览器打开一个页面，并显示待连接状态，

HBuilderX 项目运行到微信开发者工具，修改页面数据后 Devtools 弹窗组件树丢失？ 答：微信开发者工具热重载未同步数据问题，关闭热重载。

HBuilderX 项目运行到百度开发者工具，修改页面数据后 Devtools 数据未更新？ 答：百度开发者工具隔离编译模式热更新未同步数据问题，切换依赖分析编译模式。

uni.addInterceptor 修改 request url 导致报错 未能获取局域网地址，本地调试服务不可用? 答：uni-vue-devtools 依赖本地服务通信，故修改 request url 应绕开相关服务，特征为 http:localhost|本机IP:端口, 例如：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 3.7.0
```

Example 2 (unknown):
```unknown
cli 3.0.0-Alpha-3070020230117001+
```

Example 3 (unknown):
```unknown
uni-vue-devtools
```

Example 4 (unknown):
```unknown
uni-vue-devtools
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-push.html

**Contents:**
- # 概述
  - # 使用须知
  - # 整体架构
  - # 推送消息类型
- # 使用5+ API处理推送消息
  - # 获取APP终端标识
  - # 监听推送消息事件
  - # 通知栏消息操作
- # 推送平台申请
  - # 个推推送

HBuilder|HBuilderX集成了常用的推送平台，包括个推推送和小米推送。 从HBuilderX1.7.2版本开始支持UniPush推送服务（支持华为、小米、OPPO、魅族厂商推送通道），解决APP离线时因为三方推送进程被杀而导致无法推送的问题，参考UniPush使用指南 。

Push推送功能需配置SDK参数后提交云端打包后才能生效，如需真机运行生效请使用自定义基座

通知栏消息（推送通知） UniPush推送服务定义好的推送样式、后续动作的推送方式，客户端接收到后显示在系统通知栏，用户点击通知栏消息启动APP（激活到前台）。

透传消息 即自定义消息，UniPush推送服务只负责消息传递，不做任何处理，客户端在接收到透传消息后需要自己去处理消息的展示方式或后续动作。

uni-app应用中使用推送服务参考：http://ask.dcloud.net.cn/article/35726 。

在应用安装后第一次运行时应该调用5+ API的plus.push.getClientInfo 方法获取客户端标识，并将此标识提交到开发者的业务服务器进行注册设备，以便在用户登录时可绑定设备，实现向登录用户推送专属消息。 示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

如果获取的cid为空，说明客户端向推送服务器注册还未完成，可以使用setTimeout延时重试。

通常在应用入口页面（首页）中调用5+ API的plus.push.addEventListener 方法监听消息事件，在回调函数中处理消息的响应业务逻辑，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

启动回调函数的参数msg为PushMessage 对象，保存消息的标题(title)、内容(content)、自定义数据(payload)等。

示例源码如下，请查看 pre > code 标签中的内容

时，会作为普通推送通知处理，在系统通知栏创建消息，点击消息激活APP触发"click"事件。

示例源码如下，请查看 pre > code 标签中的内容

5+ Push模块还提供一系列API操作系统通知栏，解决比较少见的业务场景需求。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

iOS平台创建本地消息也会触发监听的"receive"事件，此时需要添加特殊参数来标识本地创建的消息。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

iOS平台不支持获取系统通知栏消息，返回空数组。

使用推送前需要向推送平台申请应用，并获取推送参数（提交云端打包时需配置），如appid、appkey等。

登录个推消息推送开放平台 ： 如果已经申请过个推的消息推送应用，打开“个推·消息推送”页面，在应用列表中找到申请的应用，点击“应用配置”打开应用信息页面，可获取个推的AppID、AppKey、AppSecret等信息。 如果没有申请过应用，打开“应用管理 ”页面选择“创建应用”申请新应用，申请成功后再通过上面的方法获取AppID、AppKey、AppSecret等参数。

个推推送平台相关问题可直接咨询个推客服，企业QQ：2880983159。也可以在ask中@getui_johny

登录小米开放平台 ，进入“管理控制台 ”页面，在“应用服务”栏选择“消息推送”，打开推送运营平台 ： 如果已经在小米开放平台申请应用，则在应用列表中点击相应应用的“应用信息”按钮，打开应用信息页面可查看小米推送的AppID、AppKey、AppSecret等信息；若应用没有启用推送服务，则点击“启用推送”按钮申请开通。 如果没有申请过应用，则点击页面左上角的“创建应用”按钮创建新应用，创建成功后再他通过上面的方法“启用推送”功能并获取小米推送的AppID、AppKey、AppSecret等参数。 小米推送需要为Android和iOS平台分别创建两个应用

HBuilder|HBuilderX中提交云端打包前，需在manifest.json文件中配置Push推送模块的参数。

打开应用的manifest.json文件，选择“模块权限配置”项，勾选“Push(消息推送)”，如下图所示：

打开应用的manifest.json文件，选择“SDK配置”项，选择应用使用的推送平台，并输入从此推送平台申请获取的配置参数，如下图所示：

Android平台云端打包时需要确认填写的app包名和在推送平台创建应用时填写的包名一致 iOS平台云端打包时需要确人打包填写的Bundle ID（Apple AppID）和提交给推送平台的APS证书内包含的AppID一致

1.为什么真机运行时不能收到推送的消息 答： 如果需要测试推送功能，需要使用HBuilder云打包生成安装包进行测试。

2.推送消息到安卓平台为什么没有在消息中心中显示 答： 如果推送到安卓平台的消息是透传消息，并且格式不符合规范则会触发监听页面的receive事件，消息不会进入消息中心。

3. IOS平台本地创建本地消息会触发“receive”事件，如何和服务器发送的消息进行区分。 答： 用户在创建IOS本地消息是可以在“payload”节点添加特殊标记对消息进行区分

4. Android平台如何配置推送消息图标 答：参考https://ask.dcloud.net.cn/article/35537

**Examples:**

Example 1 (javascript):
```javascript
document.addEventListener('plusready', function(){
	// 页面加载时触发
	var pinf = plus.push.getClientInfo();
	var cid = pinf.clientid;//客户端标识
}, false );
```

Example 2 (javascript):
```javascript
document.addEventListener('plusready', function(){
	// 页面加载时触发
	var pinf = plus.push.getClientInfo();
	var cid = pinf.clientid;//客户端标识
}, false );
```

Example 3 (javascript):
```javascript
document.addEventListener('plusready', function(){
	// 页面加载时触发
	var pinf = plus.push.getClientInfo();
	var cid = pinf.clientid;//客户端标识
}, false );
```

Example 4 (gdscript):
```gdscript
document.addEventListener('plusready', function(){
	// 页面加载时触发
	var pinf = plus.push.getClientInfo();
	var cid = pinf.clientid;//客户端标识
}, false );
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-weixin-plugin.html

**Contents:**
    - # 什么是小程序插件
    - # 在uni-app中引入插件代码包
    - # 在页面中使用插件
    - # 在分包内引入插件代码包
    - # 可能遇到的问题
      - 本页导读

本文档意在介绍如何在uni-app中引用和使用小程序插件，如果想了解如何把uni-app项目编译为小程序插件，另见文档：发布为小程序插件

小程序自定义组件是将组件源码导入到工程中，整体发布。

小程序插件是第三方插件作者按照微信等小程序厂商规范开发的独立插件，直接发布到小程序的插件平台。开发者在自己的小程序工程里只配置插件id，并不把插件源码导入工程。在运行期，由小程序引擎动态联网装载。开发者无法获取引入的三方小程序插件的源码。

在不同的小程序内叫法可能略有区别。微信小程序、支付宝小程序中叫插件，百度小程序中叫动态库，方便起见，以下统一称为插件。

在manifest.json中的各平台对应的字段内声明使用的插件，具体配置参照所用插件的开发文档

示例源码如下，请查看 pre > code 标签中的内容

使用插件提供的自定义组件，和使用普通自定义组件的方式相仿。在 json 文件定义需要引入的自定义组件时，使用 plugin:// 协议指明插件的引用名和自定义组件名

在页面内使用插件内包含的组件需要在pages.json内对应页面的style节点下配置对应平台的usingComponents或usingSwanComponents，示例如下：

以"hello-component": "plugin://myPlugin/hello-component"为例，key（冒号前的hello-component）为在页面内使用的组件名称。

value分为三段，plugin为协议（在百度小程序内为dynamicLib），myPlugin为插件名称即引入插件时的名称，hello-component为插件暴露的组件名称。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

支付宝小程序、百度小程序不支持在分包内引入插件。此外如果项目使用了分包，在支付宝小程序内不可使用插件。本节内容仅针对微信小程序。

如果插件只在（同一个插件不能被多个分包同时引用）一个分包用到，可以单独配置到分包中，这样插件不会随主包加载，开发者可以在pages.json的subPackages中声明插件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (json):
```json
// 微信小程序
"mp-weixin": {
  "plugins": {
    "myPlugin": {
      "version": "1.0.0",
      "provider": "wxidxxxxxxxxxxxxxxxx",
      "export": "index.js"
    }
  }
}

// 支付宝小程序
"mp-alipay": {
  "plugins": {
    "myPlugin": {
      "version": "*",
      "provider": "2019235609092837",
      "export": "index.js"
    }
  }
}

// 百度小程序
"mp-baidu": {
  "dynamicLib": {
    "myPlugin": {
      "provider": "TheUniqueNameOwnedByThisDynamicLib"
    }
  }
}
```

Example 3 (json):
```json
// 微信小程序
"mp-weixin": {
  "plugins": {
    "myPlugin": {
      "version": "1.0.0",
      "provider": "wxidxxxxxxxxxxxxxxxx",
      "export": "index.js"
    }
  }
}

// 支付宝小程序
"mp-alipay": {
  "plugins": {
    "myPlugin": {
      "version": "*",
      "provider": "2019235609092837",
      "export": "index.js"
    }
  }
}

// 百度小程序
"mp-baidu": {
  "dynamicLib": {
    "myPlugin": {
      "provider": "TheUniqueNameOwnedByThisDynamicLib"
    }
  }
}
```

Example 4 (json):
```json
// 微信小程序
"mp-weixin": {
  "plugins": {
    "myPlugin": {
      "version": "1.0.0",
      "provider": "wxidxxxxxxxxxxxxxxxx",
      "export": "index.js"
    }
  }
}

// 支付宝小程序
"mp-alipay": {
  "plugins": {
    "myPlugin": {
      "version": "*",
      "provider": "2019235609092837",
      "export": "index.js"
    }
  }
}

// 百度小程序
"mp-baidu": {
  "dynamicLib": {
    "myPlugin": {
      "provider": "TheUniqueNameOwnedByThisDynamicLib"
    }
  }
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-components

**Contents:**
- # 概念
- # 优势
- # 注册
  - # 全局注册
  - # 局部注册
- # props
      - # 示例：
  - # 传递静态或动态 Prop
  - # 单向数据流
- # ref

下面是一个基本组件示例，在根<view>组件下再次引入一个<view>组件，并给组件的text区绑定一个data。

示例源码如下，请查看 pre > code 标签中的内容

基础组件是内置在uni-app框架中的，包括view、text、input、button、video等几十个基础组件，列表详见：uni-app基础组件

但仅有基础组件是不够用的，实际开发中会有很多封装的组件。

比如我们需要一个五角星点击评分的组件，在DCloud的插件市场里可以获取到：https://ext.dcloud.net.cn/plugin?id=33

把这个uni-rate组件导入到你的uni-app项目下，在需要的vue页面里引用它，就可以在指定的地方显示出这个五角星组件。

示例源码如下，请查看 pre > code 标签中的内容

在注册一个组件的时候，我们始终需要给它一个名字。 定义组件名的方式有两种：

当使用 kebab-case (短横线分隔命名) 定义一个组件时，你也必须在引用这个自定义元素时使用 kebab-case，例如 <my-component-name>。

当使用 PascalCase (首字母大写命名) 定义一个组件时，你在引用这个自定义元素时两种命名法都可以使用。 也就是说 <my-component-name> 和 <MyComponentName> 都是可接受的。

在uni-app工程根目录下的 components 目录，创建并存放自定义组件：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 支持配置全局组件，需在 main.js 里进行全局注册，注册后就可在所有页面里使用该组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

局部注册之前，在需要引用该组件的页面，导入你想使用的组件。

如下通过两种方式导入一个角标的组件库，详见 ，推荐使用 easycom 方式引入。

示例源码如下，请查看 pre > code 标签中的内容

对于 components 对象中的每个 property 来说，其 property 名就是自定义元素的名字，其 property 值就是这个组件的选项对象。

在对象中放一个类似 uniBadge 的变量名其实是 uniBadge : uniBadge 的缩写，即这个变量名同时是：

示例源码如下，请查看 pre > code 标签中的内容

easycom是自动开启的，不需要手动开启，有需求时可以在 pages.json 的 easycom 节点进行个性化设置，详见 。

不管components目录下安装了多少组件，easycom打包后会自动剔除没有使用的组件，对组件库的使用尤为友好。

组件是 vue 技术中非常重要的部分，组件使得与ui相关的轮子可以方便的制造和共享，进而使得 vue 使用者的开发效率大幅提升。

uni-app 搭建了组件的插件市场，有很多现成的组件，若下载符合components/组件名称/组件名称.vue目录结构的组件，均可直接使用。uni-app插件市场

uni-app只支持 vue单文件组件（.vue 组件）。其他的诸如：动态组件，自定义 render ，和 <script type="text/x-template"> 字符串模版等，在非H5端不支持。

props 可以是数组或对象，用于接收来自父组件的数据。props 可以是简单的数组，或者使用对象作为替代，对象允许配置高级选项，如类型检测、自定义验证和设置默认值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果你想要将一个对象的所有 property 都作为 prop 传入，你可以使用不带参数的 v-bind (取代 v-bind:prop-name)。例如，对于一个给定的对象 post ：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

所有的 prop 都使得其父子 prop 之间形成了一个单向下行绑定：父级 prop 的更新会向下流动到子组件中，但是反过来则不行。这样会防止从子组件意外变更父级组件的状态，从而导致你的应用的数据流向难以理解。

每次父级组件发生变更时，子组件中所有的 prop 都将会刷新为最新的值。这意味着你不应该在一个子组件内部改变 prop。如果你这样做了，Vue 会在浏览器的控制台中发出警告。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

被用来给元素或子组件注册引用信息，引用信息将会注册在父组件的 $refs 对象上。

如果在普通的 DOM 元素上使用，引用指向的就是 DOM 元素；如果用在子组件上，引用就指向组件实例：

示例源码如下，请查看 pre > code 标签中的内容

当 ref 和 v-for 一起用于元素或组件的时候，引用信息将是包含 DOM 节点或组件实例的数组。

因为 ref 本身是作为渲染结果被创建的，在初始渲染的时候你不能访问它们，它们还不存在！$refs 也不是响应式的，因此你不应该用它在模板中做数据绑定。

尽管存在 prop 和事件，有的时候你仍可能需要在 JavaScript 里直接访问一个子组件。 访问子组件实例或子元素，通过 ref 为子组件赋予一个 ID 引用，在vue的js中可通过this.$refs.XXX来获取到组件对象。

示例源码如下，请查看 pre > code 标签中的内容

你已经定义了这个 ref 的组件里，你可以使用：this.$refs.usernameInput来访问这个<base-input>实例。

示例源码如下，请查看 pre > code 标签中的内容

允许父级组件通过下面的代码聚焦<base-input> 里的输入框：

示例源码如下，请查看 pre > code 标签中的内容

非H5端只能用于获取自定义组件，不能用于获取内置组件实例（如：view、text）

你可能有很多次想要在一个组件的根元素上直接监听一个原生事件。 这时，你可以使用 @事件的 .native 修饰符：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当一个子组件改变了一个 prop 的值时，这个变化也会同步到父组件中所绑定。 .sync 它会被扩展为一个自动更新父组件属性的 v-on 监听器。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Vue 实现了一套内容分发的 API，将 slot 元素作为承载分发内容的出口。

示例源码如下，请查看 pre > code 标签中的内容

在 <componentA> 的模板中可能会写为：

示例源码如下，请查看 pre > code 标签中的内容

当组件渲染的时候，<slot></slot> 将会被替换为“Your Profile”。插槽内可以包含任何模板代码，包括 HTML ：

示例源码如下，请查看 pre > code 标签中的内容

如果 <componentA> 的 template 中没有包含一个 <slot> 元素，则该组件起始标签和结束标签之间的任何内容都会被抛弃。

示例源码如下，请查看 pre > code 标签中的内容

该插槽跟模板的其它地方一样可以访问相同的实例 property (也就是相同的“作用域”)，而不能访问 <navigation-link> 的作用域。例如 url 是访问不到的：

示例源码如下，请查看 pre > code 标签中的内容

记住规则：父级模板里的所有内容都是在父级作用域中编译的；子模板里的所有内容都是在子作用域中编译的。

有时为一个插槽设置具体的后备 (也就是默认的) 内容是很有用的，它只会在没有提供内容的时候被渲染。例如在一个 <submit-button> 组件中：

示例源码如下，请查看 pre > code 标签中的内容

我们可能希望这个 <button> 内绝大多数情况下都渲染文本“Submit”。为了将“Submit”作为后备内容，我们可以将它放在 <slot> 标签内：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要多个插槽时，可以利用 <slot> 元素的一个特殊的特性：name 来定义具名插槽

示例源码如下，请查看 pre > code 标签中的内容

注意： 不要使用 v-for 对 slot 进行循环处理，组件中多次出现相同 name 属性的 slot 会产生意料之外的问题。比如 <slot name='footer'> 出现一次以上在各家小程序中表现不同，合理的做法是传递不同 name 的 slot，或者在外层父组件进行循环，保证多端一致。

示例源码如下，请查看 pre > code 标签中的内容

现在 <template> 元素中的所有内容都将会被传入相应的插槽。任何没有被包裹在带有 v-slot 的 <template> 中的内容都会被视为默认插槽的内容。

v-slot 只能添加在 <template> 上

一个不带 name 的 <slot> 出口会带有隐含的名字 “default” 。

跟 v-on 和 v-bind 一样，v-slot 也有缩写，即把参数之前的所有内容 (v-slot:) 替换为字符 #。例如 v-slot:header 可以被重写为 #header ：

示例源码如下，请查看 pre > code 标签中的内容

在作用域插槽内，父组件可以拿到子组件的数据。子组件可以在 slot 标签上绑定属性值。

有时让插槽内容能够访问子组件中才有的数据是很有用的。

示例源码如下，请查看 pre > code 标签中的内容

我们可能想换掉默认内容，用名而非姓来显示。如下：

示例源码如下，请查看 pre > code 标签中的内容

然而上述代码不会正常工作，因为只有 <current-user> 组件可以访问到 user 而我们提供的内容是在父级渲染的。

为了让 user 在父级的插槽内容中可用，我们可以将 user 作为 <slot> 元素的一个 attribute 绑定上去：

示例源码如下，请查看 pre > code 标签中的内容

绑定在 <slot> 元素上的 attribute 被称为插槽 prop。现在在父级作用域中，我们可以使用带值的 v-slot 来定义我们提供的插槽 prop 的名字：

示例源码如下，请查看 pre > code 标签中的内容

在这个例子中，我们选择将包含所有插槽 prop 的对象命名为 slotProps ，但你也可以使用任意你喜欢的名字。

就像假定未指明的内容对应默认插槽一样，不带参数的 v-slot 被假定对应默认插槽：

示例源码如下，请查看 pre > code 标签中的内容

默认插槽的缩写语法不能和具名插槽混用，因为它会导致作用域不明确：

示例源码如下，请查看 pre > code 标签中的内容

只要出现多个插槽，请始终为所有的插槽使用完整的基于 <template> 的语法：

示例源码如下，请查看 pre > code 标签中的内容

作用域插槽的内部工作原理是将你的插槽内容包裹在一个拥有单个参数的函数里：

示例源码如下，请查看 pre > code 标签中的内容

这意味着 v-slot 的值实际上可以是任何能够作为函数定义中的参数的 JavaScript 表达式。 所以在支持的环境下 ( 单文件组件 或 现代浏览器 )，你也可以使用 ES2015 解构 来传入具体的插槽 prop，如下：

示例源码如下，请查看 pre > code 标签中的内容

这样可以使模板更简洁，尤其是在该插槽提供了多个 prop 的时候。它同样开启了 prop 重命名等其它可能，例如将 user 重命名为 person ：

示例源码如下，请查看 pre > code 标签中的内容

你甚至可以定义后备内容，用于插槽 prop 是 undefined 的情形：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中以下这些作为保留关键字，不可作为组件名。

**Examples:**

Example 1 (html):
```html
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 2 (html):
```html
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 3 (html):
```html
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 4 (vue):
```vue
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-schemewhitelist.html

**Contents:**
  - # 设置应用访问白名单列表
    - # 可视化界面配置
    - # 源码视图配置
  - # 云端打包默认添加应用访问白名单列表
      - 本页导读

从iOS9开始系统安全策略更新，加入对用户隐私以及禁止扫描系统信息的控制，限制了应用对scheme协议的访问。需要将其它App注册的scheme添加到应用访问白名单（LSApplicationQueriesSchemes）中才能实现以下功能：

注意 iOS15及以上系统限制每个应用最多只能配置50个白名单列表，超过50个的白名单会失效，在配置白名单时需要注意以下问题：

打开项目的manifest.json文件，切换到“App常用其它设置”项，在“iOS设置”下的“应用访问白名单”编辑框中配置：

提示：如果可视化界面无法编辑，请切换到“源码视图”配置

打开项目的manifest.json文件，切换到“代码视图”

示例源码如下，请查看 pre > code 标签中的内容

低版本HBuilderX中urlschemewhitelist字段值为数组类型，如下：

示例源码如下，请查看 pre > code 标签中的内容

云端打包也可以兼容生效，只是无法在可视化界面编辑。

为了方便开发者调用一些常用的第三方应用，云端打包默认已经添加以下白名单

示例源码如下，请查看 pre > code 标签中的内容

注意 默认添加的应用访问白名单列表不会影响应用任何功能，当开发者配置的白名单超过50个时，默认添加的白名单列表将失效。

**Examples:**

Example 1 (json):
```json
"plus": {  
"distribute": {  
    "ios": {  
        "urlschemewhitelist": "baidumap,iosamap",  
        //...  
    },  
    //...  
},  
//...  
},  
//...
```

Example 2 (json):
```json
"plus": {  
"distribute": {  
    "ios": {  
        "urlschemewhitelist": "baidumap,iosamap",  
        //...  
    },  
    //...  
},  
//...  
},  
//...
```

Example 3 (json):
```json
"plus": {  
"distribute": {  
    "ios": {  
        "urlschemewhitelist": "baidumap,iosamap",  
        //...  
    },  
    //...  
},  
//...  
},  
//...
```

Example 4 (json):
```json
"plus": {  
"distribute": {  
    "ios": {  
        "urlschemewhitelist": "baidumap,iosamap",  
        //...  
    },  
    //...  
},  
//...  
},  
//...
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-share-weixin.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用微信分享
    - # 示例代码
      - 本页导读

打开项目的manifest.json文件，在“App模块配置”项的“Share(分享)”下，勾选“微信分享”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.share({
	provider: "weixin",
	scene: "WXSceneSession",
	type: 1,
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 2 (css):
```css
uni.share({
	provider: "weixin",
	scene: "WXSceneSession",
	type: 1,
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 3 (css):
```css
uni.share({
	provider: "weixin",
	scene: "WXSceneSession",
	type: 1,
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 4 (css):
```css
uni.share({
	provider: "weixin",
	scene: "WXSceneSession",
	type: 1,
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

---

## js 文件引入 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-script

**Contents:**
  - # js 文件引入
- # NPM支持
      - 本页导读

js文件或script标签内（包括 renderjs 等）引入js文件时，可以使用相对路径和绝对路径，形式如下

示例源码如下，请查看 pre > code 标签中的内容

uni-app支持使用npm安装第三方包。

此文档要求开发者们对npm有一定的了解，因此不会再去介绍npm的基本功能。如若之前未接触过npm，请翻阅NPM官方文档 进行学习。

若项目之前未使用npm管理依赖（项目根目录下无package.json文件），先在项目根目录执行命令初始化npm工程：

示例源码如下，请查看 pre > code 标签中的内容

cli项目默认已经有package.json了。HBuilderX创建的项目默认没有，需要通过初始化命令来创建。

示例源码如下，请查看 pre > code 标签中的内容

安装完即可使用npm包，js中引入npm包：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

Example 2 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

Example 3 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

Example 4 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-share-qq.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用QQ分享
    - # 示例代码
      - 本页导读

更多信息详见QQ官方文档 移动应用接入概述

打开项目的manifest.json文件，在“App模块配置”项的“Share(分享)”下，勾选“QQ分享”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.share({
    provider: 'qq',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 2 (css):
```css
uni.share({
    provider: 'qq',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 3 (css):
```css
uni.share({
    provider: 'qq',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

Example 4 (css):
```css
uni.share({
    provider: 'qq',
	summary: "我正在使用HBuilderX开发uni-app，赶紧跟我一起来体验！",
	success: function (res) {
		console.log("success:" + JSON.stringify(res));
	},
	fail: function (err) {
		console.log("fail:" + JSON.stringify(err));
	}
});
```

---

## 内置模块说明 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/built-in-module.html

**Contents:**
- # 内置模块说明
- # HarmonyOS 特性说明
  - # map 组件及定位等 API
  - # WebView 组件通讯
      - 本页导读

新增于 HBuilderX 4.26，仅 4.31 之前的版本使用下面的配置方式，4.31 及之后的版本请在 manifest.json 可视化界面配置。

map 组件、getLocation、openLocation、chooseLocation 依赖于地图厂商。目前仅支持腾讯地图，且此界面上显示的地图是通过 WebView 加载的。由于目前页面使用的并非 http 协议，因此在申请腾讯地图 key 时需要将域名白名单留空以便地图能正确加载出来。后续在 HarmonyOS 上页面会调整成以 http 方式加载，到时可以在腾讯地图控制台配置域名白名单。

在 uni-app 项目内配置腾讯地图 key：

示例源码如下，请查看 pre > code 标签中的内容

在编译到鸿蒙时，plus 对象不可用。如果要向 WebView 发送消息，可以使用 WebviewContext 的 evalJs ，注意此方案来源于 uni-app-x，仅鸿蒙支持。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
    // ...
    "app-plus" : {
        // ...
        "distribute" : {
            // ...
            "sdkConfigs" : {
                // ...
                "maps" : {
                    "qqmap" : {
                        "key" : "XXX-XXXX-XXXX"
                    }
                }
            }
        }
    },
    // ...
}
```

Example 2 (json):
```json
{
    // ...
    "app-plus" : {
        // ...
        "distribute" : {
            // ...
            "sdkConfigs" : {
                // ...
                "maps" : {
                    "qqmap" : {
                        "key" : "XXX-XXXX-XXXX"
                    }
                }
            }
        }
    },
    // ...
}
```

Example 3 (json):
```json
{
    // ...
    "app-plus" : {
        // ...
        "distribute" : {
            // ...
            "sdkConfigs" : {
                // ...
                "maps" : {
                    "qqmap" : {
                        "key" : "XXX-XXXX-XXXX"
                    }
                }
            }
        }
    },
    // ...
}
```

Example 4 (json):
```json
{
    // ...
    "app-plus" : {
        // ...
        "distribute" : {
            // ...
            "sdkConfigs" : {
                // ...
                "maps" : {
                    "qqmap" : {
                        "key" : "XXX-XXXX-XXXX"
                    }
                }
            }
        }
    },
    // ...
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/internationalization.html

**Contents:**
- # 背景
- # 注册“国际区”账号
- # App打包
- # 隐私政策
- # 海外共建
      - 本页导读

本教程仅适用于没有中国大陆手机号的海外开发者。

因中国法律的要求，开发者使用HBuilderX进行云端打包时，需完成手机号验证，但目前DCloud仅支持中国大陆地区手机号的验证，其它地区的手机号暂不支持。

DCloud为支持海外开发者，特推出“国际区”注册服务，注册在“国际区”的账号，仅需验证邮箱，即可使用云端打包服务。

“国际区”账号的云端打包和“中国大陆地区”账号的云端打包基本操作相同，参考：App打包 。

“国际区”账号尚不支持部分功能点，具体如下：

请严格遵守所属地区的法律法规，不要使用DCloud提供的工具制作任何违法犯罪的应用。

DCloud正在积极开拓海外市场，面向海外工程师提供高效便捷的开发工具，我们正在开发 uni-app官网英文站 ，欢迎熟悉英语的各位开发者，一起参与完善。

文档源码地址：https://github.com/dcloudio/unidocs-en ，欢迎各位踊跃提交 pr 或 issue。

---

## uni-app web版调试@h5-debug | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/debug-web-via-chrome.html

**Contents:**
- # uni-app web版调试
- # 简介
- # 开启调试
- # 添加/删除断点
- # 调试视图
- # 调试操作
  - # 继续
- # 数据检查和查看变量
  - # 添加到监视
  - # 悬停显示

HBuilderX 3.5.0版本，uni-app 运行到 web 平台，可通过 HBuilder自带的调试面板进行调试。

项目管理器，选中任意 uni-app项目，运行到Chrome。控制台右上角，点击debug图标（红色虫子），即可打开调试。如下图：

uni-app web调试，依赖debug插件，弹窗提示安装依赖插件，请务必点击安装，否则无法进行调试。

打开要调试的文件，在js或ts代码行号上，鼠标右击或双击添加断点。

开启调试后，即可在HBuilderX左侧视图，看到调试视图，具体如下：

继续(F8)：点击后，运行直到下一个断点。

在【变量窗口】，选中变量，右键菜单，即可将变量添加到监视窗口。

断点调试过程中，将鼠标悬停在要查看的变量上，即可打开悬停窗口。

**Examples:**

Example 1 (json):
```json
/localhost:3000/src/pages/index/index.vue
```

---

## 务必确保将HBulider X升级到3.2.15+版本。离线打包需要将离线打包SDK升级到3.2.15+版本 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/android-gp.html

**Contents:**
    - # 务必确保将HBulider X升级到3.2.15+版本。离线打包需要将离线打包SDK升级到3.2.15+版本
  - # 必须适配Android11
  - # 不能包含安装应用权限
    - # 离线打包:
  - # 不要使用QQ登录、QQ分享模块
    - # 离线打包:
  - # 不要使用国内增强广告SDK
    - # 离线打包:
  - # 不要使用X5内核
    - # 离线打包:

App提交云端打包时请务必勾选“GooglePlay(AAB)”渠道

Google Play上架审核要求比较严格，应用中不能存在以下行为：

uni-app中部分功能模块不符合Google Play审核要求，请仔细阅读下面章节。

“App常用其它设置”中需要将targetSdkVersion设置值大于等于30

注意：务必在Android11设备上进行测试，确保应用所有功能可以正常运行

在App权限配置中不要勾选 android.permission.INSTALL_PACKAGES、android.permission.REQUEST_INSTALL_PACKAGES 权限

请查看原生项目中的AndroidManifest.xml。如果包含以下权限请手动删除：

示例源码如下，请查看 pre > code 标签中的内容

注意：如果使用了uni原生插件，可能会添加安装应用权限，请联系uni原生插件作者确认

使用QQ登录、分享功能时，如果当前设备上没有安装QQ应用时，会引导用户下载安装，不符合Google Play的审核要求，因此提交到Google Play时不要勾选QQ登录及QQ分享模块

请不要集成qq_mta-sdk-xxx.jar，qq_sdk_vxxx.jar等SDK。如果有请删除

uni-ad国内增强广告（如穿山甲、优量汇、快手等SDK）显示的广告落地页可能会引导用户下载安装apk，不符合Google Play的审核要求，因此提交到Google Play时不要勾选增强广告SDK

请不要集成国内增强广告相关依赖库 ks_adsdk-ad.aar、windAd.aar、GDTSDK.unionNormal.aar,open_ad_sdk.aar,torch-adcore-xx.aar。如有请删除

腾讯TBS（X5）内核在Android平台解决了很多适配问题（详情可参考：https://ask.dcloud.net.cn/article/36806 ），但它使用了动态热更新技术，不符合Google Play的审核要求，因此提交Google Play时不要勾选使用“Android X5 Webview(腾讯TBS)”模块

请不要集成X5相依赖库webview-x5-release.aar，如有请删除

**Examples:**

Example 1 (html):
```html
<uses-permission android:name="android.permission.INSTALL_PACKAGES" />
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```

Example 2 (html):
```html
<uses-permission android:name="android.permission.INSTALL_PACKAGES" />
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```

Example 3 (html):
```html
<uses-permission android:name="android.permission.INSTALL_PACKAGES" />
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```

Example 4 (typescript):
```typescript
<uses-permission android:name="android.permission.INSTALL_PACKAGES" />
<uses-permission android:name="android.permission.REQUEST_INSTALL_PACKAGES" />
```

---

## 使用WIFI连接Android真机@AndroidWifi | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/run-app-android-wifi.html

**Contents:**
- # 使用WIFI连接Android真机
- # HBuilderX 4.71以前的方案
  - # 使用adb命令行配对
- # HBuilderX 4.71+的方案
  - # 无线连接常见的问题
  - # 扩展
      - 本页导读

Android 11起，支持无线adb功能，不插手机线也可以实现所有运行调试功能。

在HBuilderX4.71以前，开发者需要自定义adb，使用高版本的adb，通过adb命令连接手机。

从HBuilderX4.71起内置了这个功能。

6.配对设备后，你可以在HBuilderX的运行设备列表看到此设备，接下来的使用和有线adb相同。

配对成功后，在一定有效期内，无需再重复配对。在手机端打开无线调试后，过一会手机的通知栏会弹出已连接无线调试。然后在HBuilderX的运行界面会自动检测到该设备。

HBuilderX 4.71+提供了可视化操作方式

注意开启无线调试，不是一个持久化的设置，当手机一定时间内不再使用无线调试，该设置会被手机OS自动关闭。一旦被关闭，您需要手动再次开启才可使用。

b. 扫描HBuilderX窗口中的二维码

a. HBuilderX选择"配对码配对"

配对成功后，在一定有效期内，无需再重复配对。

但手机端开启无线调试，不是一个持久化的设置，当手机一定时间内不再使用无线调试，该设置会被手机OS自动关闭。

一旦被关闭，您需要手动再次开启无线调试才可使用。

已经完成配对的电脑和手机，在同一网段，下次再想使用无线调试功能时，无需再次配对，只需在手机端打开无线调试，过一会手机的通知栏会弹出已连接无线调试。然后在HBuilderX的运行界面会自动检测到该设备。如果一直等不到这个通知栏成功消息，见下方的常见问题。

手机端的无线调试开关模式隐藏的比较深，不方便打开。但Android系统提供了一个快捷方式，在开发者选项中，有一个 快捷设置开发者功能块（可能不同的rom叫法不同），其中有无线调试，打开这个无线调试后，在手机的通知栏下拉，可以显示无线调试的图标。这样就可以在通知栏下拉菜单中快捷开启关闭无线调试了。

“通过 Wi-Fi 使用 adb”的功能有时会自动关闭：如果设备切换 Wi-Fi 网络或断开网络连接，就可能会发生这种情况。如需解决此问题，请重新连接到网络。并且尝试关闭无线连接重新打开。

设备连接超时，请重试：adb 依赖于 mDNS 来发现已配对的设备并自动连接到这些设备。

1.如果您的网络或设备配置不支持 mDNS 或已停用 mDNS，则需要使用 adb connect ip:port 手动连接到设备。ip和port可以在设备端无线调试中看到。

2.如果您的设备支持，也可能由于adb缓存等原因导致不能自动连接。可以尝试关闭无线连接后重新打开，重试重新配对连接。

配对设备时出错，请重试：安全的 Wi-Fi 网络（如企业 Wi-Fi 网络）可能会阻止点对点连接，并且不允许您通过 Wi-Fi 进行连接。需要关闭防火墙或者设置信任。

有时adb会出现无法理解的故障，开启无线调试后始终无法连接同网段已经配对的设备，此时需要点击手机端 开发者选项 中的 撤销USB调试授权，把配对信息清楚掉，然后重新配对。

**Examples:**

Example 1 (typescript):
```typescript
<HBuilderX安装目录>/plugins/launcher-tools/tools/adbs
```

Example 2 (typescript):
```typescript
<HBuilderX安装目录>/plugins/launcher-tools/tools/adbs
```

Example 3 (unknown):
```unknown
adb pair ipaddr:port
```

Example 4 (unknown):
```unknown
Successfully paired
```

---

## iOS原生应用配置文件和资源 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-nativeresource-ios.html

**Contents:**
- # iOS原生应用配置文件和资源
- # 配置文件 Info.plist
  - # iOS隐私信息访问描述配置
  - # iOS url scheme配置
  - # 应用可支持横竖屏列表配置
- # 应用资源
  - # 配置文件UniApp.entitlements
    - # 配置Associated Domains
  - # 配置文件PrivacyInfo.xcprivacy
  - # Bundle资源目录 （Bundle Resources）

app打包，在iOS原生开发中提供了配置 Info.plist 和 资源文件（Bundle Resources）。uni-app中对常用项进行了封装，提供了manifest.json 。

但manifest.json不能包含所有iOS的配置。

在HBuilderX 3.6.5以前，开发者如需使用manifest未封装的配置、或需自定义资源文件（Bundle Resources）内容，只能离线打包或开发App原生语言插件 。

HBuilderX3.6.5起，支持直接在应用项目中配置 iOS 平台的 Info.plist 和 资源文件（Bundle Resources）。

Info.plist文件是 XCode 工程配置文件，可在HBuilderX中项目中添加Info.plist文件，云端打包后将会合并到 XCode 工程生成 ipa。

在HBuilderX中，对项目根目录右键菜单 "新建" -> "自定义文件"

输入文件名称 Info.plist（注意大小写敏感），点击 “创建” 按钮新建文件

根据应用需求编辑添加需要的内容，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果应用需要修改隐私信息访问的许可描述，可根据需求在Info.plist文件中添加，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

注意 uni-app x项目manifest.json中没有提供iOS隐私信息访问许可描述的配置，需在此Info.plist中添加。 配置许可描述时需根据应用实际情况准确描述用途，否则提交AppStore审核可能被拒。

如果应用需要向系统注册url scheme，以便在浏览器中通过scheme打开App，可根据需求在Info.plist文件中添加CFBundleURLTypes数据，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app/uni-app x项目都支持通过此方式配置url scheme，uni-app项目还可通过manifest.json的可视化界面配置，参考iOS设置url scheme

如果希望自定义配置应用可支持的横竖屏列表，可根据需求在Info.plist文件中添加UISupportedInterfaceOrientations数据，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 项目同时也支持在 manifest.json 中配置 screenOrientation ，云端打包会与 Info.plist 中配置的值合并

HBuilderX中对项目右键菜单 "新建" -> "目录"

输入名称 nativeResources（注意大小写敏感），确定并创建目录。

在 XCode 中可以通过项目可视化界面编辑应用的Capabilities，实际上是操作项目的 entitlements 和 Info.plist 文件保存数据。在 HBuilderX 中暂未提供Capabilities可视化界面操作，需手动编辑UniApp.entitlements和Info.plist文件来实现相关配置。

在 nativeResources/ios 目录下创建UniApp.entitlements文件，用于配置 XCode 原生工程的Capabilities，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app/uni-app x 项目都可以通过编辑UniApp.entitlements文件配置Capabilities，需确保此entitlements文件格式正确，可以在 XCode 中编辑验证此文件。

在UniApp.entitlements添加com.apple.developer.associated-domains节点数据开启Associated Domains能力

示例源码如下，请查看 pre > code 标签中的内容

PrivacyInfo.xcprivacy用于配置应用隐私清单文件，详情参考uni-app/uni-app x如何配置隐私清单 。

在“ios”目录下创建“Resources”子目录，结构如下：

将需要添加的iOS原生资源文件拷贝到Resources目录，云端打包时将会合并到安装包的.app中。

ios目录下不支持放Object-C/Swift源码文件，需要开发源码建议使用UTS插件 或uni原生语言插件

resources目录中的资源文件不能通过uni API使用，需通过 iOS 原生 API 访问，参考Accessing a Bundle's Contents 。也就是在uni-app/uni-app x项目中这些资源需要通过uts代码访问，uni-app项目也可编写uni原生语言插件 访问

resources目录中已经保留使用以下文件，需注意避免冲突

uni-app/5+ App 项目 ├─Pandora //uni-app资源目录 │ └─apps //应用资源目录 │ └─[AppID] //使用DCloud AppID作为目录名称 ├─PandoraApi.bundle //uni-app SDK内置资源目录 ├─control.xml //uni-app模块配置文件 ├─dcloud_logo@2x.png //应用logo图片 ├─dcloud_logo@3x.png //应用logo图片 ├─uni-jsframework.js //uni-app vue2框架 ├─uni-jsframework-vue3.js //uni-app vue3框架 ├─uni-jsframework-dev.js //uni-app vue2框架（开发模式） ├─uni-jsframework-vue3-dev.js //uni-app vue3框架（开发模式） ├─unincomponents.ttf //uni-app内置字体图标 └─userPosition@2x.png //地图模块当前位置图标

uni-app x 项目 ├─uni-app-x //uni-app x 项目资源 ├─DCUniVideo //video组件目录 ├─uni_uts_toast_error.png //uni.showToast 使用的图标 └─uni_uts_toast_success.png //uni.showToast 使用的图标

应用资源目录配置需提交云端打包后才能生效，真机运行时请使用自定义调试基座

HBuilderX 4.71 及以上版本新增支持嵌入 Watch App

uni-app/uni-app x 本身还不支持直接用于开发 Watch App。如果已经存在使用 XCode 开发完成的 Watch App，可以将其添加到使用 uni-app/uni-app x 开发的主应用中，提交云端打包即可嵌入到 ipa 中提交。

在 uni-app/uni-app x 项目原生资源目录 “nativeResources” 的 “ios” 目录下创建 “Watch”子目录，并添加 Watch App 二级制文件，结构如下：

uni-app/uni-app x 中要添加的 Watch App 可执行文件。 需在原生 XCode 环境中添加 Watch Target，选择 “Watch App for Existing iOS App”，并在 XCode 中完成开发调试后编译并以发布方式导出包含此 Watch App 的 ipa 包，将 ipa 解压后在 Payload/XXX.app/Watch/ 目录下可以找到对应的 .app 文件。 将此 .app 文件添加到如上所示 uni-app/uni-app x 项目的 nativeResources -> ios -> Watch 目录中。

可选配置文件，仅在需要配置 Watch App 的包名和profile文件时使用，格式如下：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 5.0 及以上版本新增支持配置 ios-uts.json

在部分情况下，如果项目使用的 uts插件 无法修改源码（如从插件市场购买的非源码授权的插件），可通过 ios-uts.json 文件修改配置。 在 uni-app/uni-app x 项目原生资源目录 “nativeResources” 的 “ios” 目录下创建 “ios-uts.json”文件，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

每个uts插件配置项以插件标识（uts插件目录名称）为 key，值为 json 格式数据。

可通过 json 格式中的 identifier 字段配置 uts插件 云端打包使用的 Bundle Identifier。 如下示例配置uts-myutsplugin插件的 Bundle Identifier 为 com.my.custom：

示例源码如下，请查看 pre > code 标签中的内容

如果没有配置则根据插件标识自动生成，默认值为 "io.dcloud.uts.unimodule" + 插件标识首字母大写。 如插件标识为 uts-myutsplugin，默认的 Bundle Identifier 为 io.dcloud.uts.unimoduleUtsMyutsplugin。

离线打包时应用清单文件和资源需要开发者手动合并到XCode原生工程中。

**Examples:**

Example 1 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

Example 2 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

Example 3 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

Example 4 (xml):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>My_Custom_String_Key</key>
    <string>My_Custom_String_Value</string>
    <key>My_Custom_Array_Key</key>
    <array>
      <dict>
        <key>My_Custom_Array_Item_Key</key>
        <string>My_Custom_Array_Item_Value</string>
        <key>My_Custom_Array_Item_Key2</key>
        <string>My_Custom_Array_Item_Value2</string>
      </dict>
    </array>
  </dict>
</plist>
```

---

## 宽屏适配指南 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/adapt.html

**Contents:**
  - # 宽屏适配指南
    - # 1. 页面窗体级适配方案：leftWindow、rightWindow、topWindow
    - # 2. 分栏
    - # 3. 组件级适配方案：match-media组件
    - # 4. 内容缩放拉伸的处理
    - # 非webkit浏览器适配
    - # 一个让手机版网页临时可用于pc浏览器的方案
    - # 通过electron打包为windows、mac、linux客户端
    - # 响应式布局组件：uni-row
      - 本页导读

uni-app是以移动为先的理念诞生的。从uni-app 2.9起，提供了PC等宽屏的适配方案，完成了全端统一。

PC适配和屏幕适配略有差异。PC适配包含宽屏适配和uni-app内置组件适配PC两方面的工作。

uni-app内置组件的PC适配，又包括PC交互习惯的UI调整和非webkit浏览器适配这两部分。这块工作不在本文的讨论范围内，尤其是开发者在PC端可以随意使用普通html元素和组件，不局限于uni-app内置组件。所以本文重点讨论屏幕适配。

uni-app提供的屏幕适配方案，包括3部分：

以目前手机屏幕为主window，在左右上，可新扩展 leftWindow、rightWindow、topWindow，这些区域可设定在一定屏幕宽度范围自动出现或消失。这些区域各自独立，切换页面支持在各自的window内刷新，而不是整屏刷新。

以上示例建议使用最新版的chrome、Safari、或firefox访问。可以在PC模式和手机模式分别体验。以上示例源码的运行需使用HBuilderX 2.9+

这套方案是已知的、最便捷的分栏式宽屏应用适配方案。

H5 宽屏下 tabBar(选项卡) 的显示与隐藏

如果在 PC 上不想显示 tabbar 页面可以参考 hello-uniapp，在 app 的首页加载时跳转一个 非tabbar 页, hello-uniapp 的隐藏 tabbar 不是媒体查询实现的，当前页不是 tabbar 页面（是pages/component/view/view页），所以没有显示tabbar。

如果是想在有 leftwindow 等窗体的时候，隐藏 tabar 页面的 tabbar，可以用 css 实现（好处是可以和leftwindow等窗体联动）：

示例源码如下，请查看 pre > code 标签中的内容

leftWindow等配置，在pages.json里进行。文档见：https://uniapp.dcloud.net.cn/collocation/pages?id=topwindow

示例源码如下，请查看 pre > code 标签中的内容

如果已经有了一个为小屏设计的uni-app，在使用leftWindow等窗体适配大屏时，需理清一个思路：现有的小屏内容，放在哪个window里？

如果应用的首页是列表，二级页是详情，此时适合的做法是，将原有的小屏列表作为主window，在右边扩展rightWindow来显示详情。

以新闻示例项目为例。这个项目的源码已经内置于HBuilderX 2.9中，新建uni-app项目时选择新闻/资讯模板。

首先在这个项目的pages.json文件中，配置rightWindow选项 ，放置一个新页面right-window.vue。

示例源码如下，请查看 pre > code 标签中的内容

rightWindow对应的页面不需要重写一遍新闻详情的页面逻辑，只需要引入之前的详情页面组件（详情页面/pages/detail/detail可自动转化为pages-detail-detail组件使用）。

示例源码如下，请查看 pre > code 标签中的内容

然后在新闻列表页面，处理点击列表后与rightWindow交互通信的逻辑。

示例源码如下，请查看 pre > code 标签中的内容

可以看到，无需太多工作量，就可以快速把一个为手机窄屏开发的应用，快速适配为PC宽屏应用。并且以后的代码维护，仍然是同一套，当业务迭代时不需要多处升级。

rightWindow适用于分栏式应用，那leftWindow一般用于什么场景？

leftWindow比较适合放置导航页面。如果你的应用首页有很多tab和宫格导航，那么可以把它们重组，放在leftWindow作为导航。之前在手机竖屏上依靠多级tab和宫格导航的场景，可以在leftWindow里通过tree或折叠面板方式导航。

leftWindow除了适用于手机应用适配大屏，也适用于重新开发的PC应用，尤其是PC Admin管理控制台。

DCloud官方基于uni-app的pc版，推出了unicloud Admin：https://doc.dcloud.net.cn/uniCloud/admin

leftWindow、rightWindow、topWindow 只支持web端。

一些pad应用，或折叠屏应用，有左右分栏。

虽然leftWindow、rightWindow也可以实现类似效果，但仅web支持。

如果有跨端的分栏需求，不推荐使用rightWindow等方案。

利用vue文件可以做页面，也可以做组件的特性，uni-app封装了rightWindow等方案，但其实uni-app不封装，开发者也可以自己做，灵活度会更高。

还是以列表(list.vue)和详情(detail.vue)为例，如果是竖屏手机，list页面全屏，点击item后通过navigateTo调整到detail页面；

如果是pad分栏，则在list页面中并排放置list组件和detail组件，把detail.vue文件从页面变成组件。点击list的item，通过eventbus让detail加载新的响应式数据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述思路也适用于uni-app x，但uni-app x的Android端，暂不支持页面和组件同时使用，后续会修复此问题。

leftWindow等方案是页面窗体级适配方案。适于独立的页面。那么在同一个页面中，是否可以适配不同屏宽？当然可以，此时可以使用组件级适配方案。

uni-app提供了 match-media组件 和配套的 uni.createMediaQueryObserver 方法。

这是一个媒体查询适配组件，可以更简单的用于动态屏幕适配。

在match-media组件中放置内容，并为组件指定一组 media query 媒体查询规则，如屏幕宽度。运行时，如屏幕宽度满足查询条件，这个组件就会被展示，反之则隐藏。

它的详细文档参考：https://uniapp.dcloud.net.cn/component/match-media

当然，开发者也可以继续使用css媒体查询来适配屏幕，或者使用一些类似mobilehide、pcshow之类的css样式。

uni-app的屏幕适配推荐方案是运行时动态适配，而不是为PC版单独条件编译（虽然您也可以通过自定义条件编译来实现单独的PC版）。这样设计的好处是在ipad等设备的浏览器上可以方便的横竖屏切换。

除了根据屏宽动态显示和隐藏内容，其实还有一大类屏幕适配需求，即：内容不会根据屏宽动态显示隐藏，而是缩放或拉伸。

举个实际的例子，比如一个列表页面，左边有一个图标，右边是2行文字。

策略2省事，设计师按750px屏宽出图，程序员直接按rpx写代码即可。但策略2的实际效果不如策略1好。程序员使用策略1，分析下界面，设定好局部拉伸区域，这样可以有更好的用户体验。

在移动设备上也有很多屏幕宽度，设计师一般只会按照750px屏幕宽度出图。此时使用rpx的好处在于，各种移动设备的屏幕宽度差异不是很大，相对于750px微调缩放后的效果，尽可能的还原了设计师的设计。

但是，一旦脱离移动设备，在pc屏幕，或者pad横屏状态下，因为屏幕宽度远大于750了。此时rpx根据屏幕宽度变化的结果就严重脱离了预期，大的惨不忍睹。

为此，在uni-app 2.9+起，新增了 rpx 按750px做基准屏宽的生效范围控制，并且将 rpx 的默认最大适配宽度设为了 960 px。

也就是设计师按750px出具的设计图，可适配的最大屏幕宽度为960px，在这个范围内，rpx可以根据屏幕宽度缩放。一旦超过960，rpx再根据屏幕宽度缩放就变的没有意义了。按如下配置，在超过960宽的屏幕上，会按375px作为基准宽度，这是最大程度上保持界面不失真的策略。

当然这些配置您都可以自己定义调整，在 pages.json 的 globeStyle 里配置 rpx 的如下参数。

示例源码如下，请查看 pre > code 标签中的内容

通过上述配置中的前2个，即rpxCalcMaxDeviceWidth和rpxCalcBaseDeviceWidth，即可有效解决使用了rpx后，在宽屏下界面变的奇大无比的问题。如果你不需要特别定义这2个参数的数值，则无需在pages.json中配置它们，保持默认的960和375即可。

但是，rpx的最大适配宽度被限定后，会带来一个新问题：如果您的代码中把750rpx当做100%来使用（官方强烈不推荐这种写法，即便是nvue不支持百分比，也应该使用flex来解决撑满问题），此时不管屏幕宽度为多少，哪怕超过了960px，您的预期仍然是要占满整个屏幕宽度，但如果按rpxCalcBaseDeviceWidth的375px的策略执行将不再占满屏宽。

此时您有两种解决方案，一种是修改代码，将里面把rpx当做百分比的代码改掉；另一种是配置rpxCalcIncludeWidth，设置某个特定数值不受rpxCalcMaxDeviceWidth约束。如上述例子中的"rpxCalcIncludeWidth": 750，代表着如果写了 750rpx，始终将按屏幕宽度百分百占满来计算。

不少开发者之前对rpx的使用过于没有节制，后来为了适配宽屏，想要改用“局部拉伸：页面内容划分为固定区域和长宽动态适配区域”的策略，此时将回归px。

比如 DCloud社区的宽屏适配示例 和 新闻模板 都没有使用rpx。

如果想把rpx转px，可以在源码里正则替换，也可以使用三方已经写好的单位转换库。下面介绍下三方库的用法。

项目根目录新增文件 postcss.config.js，内容如下。则在编译时，编译器会自动转换rpx单位为px。

** 注意：将rpx作为百分比的用法需要手动处理

示例源码如下，请查看 pre > code 标签中的内容

uni-app理论上不限定浏览器。在HBuilderX 2.9发版时，就新闻示例项目，在chrome、Safari、firefox、edge的最新版上均测试过，可以正常使用。

一般国内的浏览器，如360浏览器、搜狗浏览器，均支持chrome内核，只要版本够新，应该都可以访问。

如果你的应用在其他PC浏览器下异常，请检查自己代码的浏览器兼容问题。

如果你发现了uni-app框架层面、内置组件有浏览器兼容问题，欢迎在github上给我们提交pr。

一般情况下，只要基础框架没有浏览器兼容问题，那么组件层面的问题也可以通过更换组件来解决。当uni-app编译到PC浏览器端时，支持所有的vue组件，包含那些操作了dom、window的ui库，比如elementUI等。

如果你的h5版已经开发完毕，还没来得及适配pc，但想在pc上先用起来。那么可以在pc网页里使用iframe，约定好宽度，在里面套用uni-app的窄屏版。

当然还可以在iframe旁边放置二维码，提供手机版扫码地址，例如：

有了宽屏适配，uni-app的应用就可以方便的通过electron打包为电脑客户端应用，windows、mac、linux均支持。

开发者可以随意调用electron的API，以调用更多操作系统的能力（为方便多端兼容，可以将这些特殊API写在自定义的条件编译里）

插件市场有已经封装好的一些插件，详见：https://ext.dcloud.net.cn/search?q=electron

流式栅格系统，随着屏幕或视口分为 24 份，可以迅速简便地创建布局。

该插件将屏幕分为五个档位：<768px、>=768px、>=992px、>=1200px、>=1920px。

对应的可以使用xs、sm、md、lg、xl来控制在不同分辨率下的显示效果。详情可在插件市场查看。

插件地址：https://ext.dcloud.net.cn/plugin?id=3958

**Examples:**

Example 1 (unknown):
```unknown
uni-app内置组件适配PC
```

Example 2 (unknown):
```unknown
PC交互习惯的UI调整
```

Example 3 (unknown):
```unknown
非webkit浏览器适配
```

Example 4 (css):
```css
.uni-app--showleftwindow + .uni-tabbar-bottom {
  	display: none;
  }
```

---

## 运行和发行 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/runbuild

**Contents:**
- # 运行和发行
- # 兼容性说明
- # 开发环境要求
  - # 项目根目录与鸿蒙工程目录
  - # 在 HBuilderX 中设置 DevEco Studio 的安装位置
- # 运行的方式
  - # 启动鸿蒙模拟器
  - # 连接鸿蒙真机
  - # 运行项目到鸿蒙设备
  - # 热重载

默认情况下，HBuilderX 会在项目内的 unpackage 目录下创建鸿蒙工程目录，用于构建鸿蒙的运行包和发行包：

鸿蒙工具链对于鸿蒙工程目录的路径有一定的限制条件：不能包含中文字符和某些特殊字符，准确地说，允许在路径中使用的字符仅限于大小写英文字母、数字、正斜杠、反斜杠、下划线、连字符、冒号、句点， 如果安装了较新版本的 DevEco Studio 则还允许包含空格。

鸿蒙工具链在对鸿蒙工程目录进行构建的过程中，会在内部产生一些路径比较长的文件，在 Windows 系统中很容易超过系统对于文件路径长度的限制，从而导致构建失败。 从实测来看，留给鸿蒙工程目录本身的路径长度大约 110 个字符。如果 HBuilderX 使用了默认的鸿蒙工程目录位置，那么 uni-app 项目根目录的路径长度大约最多可以用到 77 个字符。

所以，一般而言，为了避免鸿蒙工程构建过程中出现异常情况，uni-app 项目所在的根目录应该路径不要太长，也不要包含中文或者其它特殊字符。

从 HBuilderX 4.61+ 开始支持通过配置指定使用特定的目录作为鸿蒙工程目录，这样就可以避免上述对于 uni-app 项目路径的额外限制了。 方法是在项目根目录下的 .hbuilderx/launch.json 中添加如下内容（如果该文件不存在则手动创建）：

示例源码如下，请查看 pre > code 标签中的内容

其中 distPathDev 用于指定调试运行的时候使用的鸿蒙工程目录，distPathBuild 用于指定发行打包的时候使用的鸿蒙工程目录。

指定的目录不必已经存在，HBuilderX 会创建所需的目录，如果目录已经存在的话 HBuilderX 还可能根据需要尝试删除然后重建。

通过指定鸿蒙工程目录的位置，还可以实现与原生鸿蒙工程的联编调试，具体方法可以参考 联编调试

HBuilderX 依赖于 DevEco Studio 里面带的鸿蒙工具链，所以需要电脑已经安装了符合版本要求的 DevEco Studio。

打开 HBuilderX，点击上方菜单 - 工具 - 设置，再点击 运行配置，在鸿蒙运行配置中设置 DevEco Studio 的安装路径。

HBuilderX 4.27 版本之前需要配置 manifest.json 里面设置 app-harmony.projectPath 属性。

HBuilderX 4.27+ 开始已经把鸿蒙工程模板内置到 HBuilderX 中，【运行到鸿蒙】时自动创建鸿蒙工程目录，与 uni-app 项目的编译产物合并， 然后调用鸿蒙工具链完成打包和安装、运行等操作，同时从运行设备上收集输出的日志显示到 HBuilderX 的控制台。

新的内置模板的方式虽然在调试运行过程中不再调起 DevEco Studio，但一般来说仍然需要安装 DevEco Studio，因为：

鸿蒙模拟器只能在 DevEco Studio 中启动。DevEco 5.1.1 release 开始提供 API20 模拟器，低于 API19 版本的模拟器不支持 Windows x86 平台用户开发 uni-app 鸿蒙，此处系统镜像需要选择 API >= 19 的系统版本。

在 DevEco Studio 中打开任意一个项目（也可以新建一个空项目），然后在下图的位置进入设备管理器：

如果没有登录华为账号，此时需要先登录，登录成功后看到如下页面

注意：真机需要鸿蒙系统版本 API 12 以上

打开鸿蒙手机的开发者模式，开启 USB 调试，通过 USB 线连接电脑，在此处能看到对应的设备标识符则表示连接成功

连接好鸿蒙设备之后，就可以在 HBuilderX 中把当前打开的 uni-app (x) 项目运行到鸿蒙设备上了。

HBuilderX 打开项目，或者新建一个空白的 uni-app 项目，选 vue3（也可使用已有的 uni-app vue3 项目）

点击 HBuilderX 上方【运行】菜单 - 运行到手机或模拟器 - 运行到鸿蒙

提示：目录默认是空的，用户自定义的配置需要放置在此处才能生效。请参考：更多配置指南

在编译代码构建运行包的时候，有三个缓存使用策略可供选择：

如果是运行到真机设备上，需要配置签名证书资料。 HBuilderX 4.61+ 开始支持直接配置证书资料，点击对话框中的【配置调试证书】按钮打开配置对话框，支持自动申请调试证书。 对于更早版本的 HBuilderX，建议升级最新 HBuilderX 版本获得更好开发体验。证书配置可在 DevEco Studio 里面申请证书。 参考：证书签名配置指南

HBuilderX 会对当前项目进行编译，然后把编译产物和配置文件组装到鸿蒙工程目录，再调用鸿蒙工具链进行构建、安装等操作，最终在鸿蒙设备上运行起来。

在把运行包安装到手机设备上的时候，HBuilderX 4.61 以前的版本会先尝试卸载手机设备上已安装的应用，应用的私有存储都会被删除； HBuilderX 4.61+ 开始不再先尝试卸载，而会进行覆盖安装，只有在安装失败的时候才会尝试卸载并重新安装一次。 如果需要从全新安装开始调试运行的话，需自行手动卸载。

HBuilderX 4.81+ 开始支持 uni-app x 项目启用热重载能力。

把应用运行到鸿蒙设备之后，如果修改了源代码，在 uni 编译器进行差量编译之后，HBuilderX 会尝试以热重载的模式调用鸿蒙构建工具，以节省构建时间。

启用热重载模式要求 DevEco Studio 版本为 5.1.1.823+，如果条件不满足，将自动回落到原来的全量构建模式。

本功能实际是调用 DevEco 新版提供的 arkts 热重载能力，热重载速度由 DevEco 决定。

参考鸿蒙文档 使用 DevTools 工具调试前端页面 进行处理。在 uni-app 的开发模式下 setWebDebuggingAccess 会自动开启，此步骤可以跳过。

业务逻辑 debug 可参考 JSVM-API 调试&定位

HBuilderX 4.61+ 开始支持 uts、uvue、ets 的调试文档地址 ，支持断点调试，可以在控制台里面点击调试按钮开启。

点击【开启调试】按钮的时候如果还在编译阶段，则会在后续应用运行起来的时候进入调试状态。

如果点击时应用已经运行起来，则直接进入调试状态，此后代码运行遇到断点就会停下来，但应用启动阶段的代码断点因为已经错过了时机而不会停下来，要想调试那些代码的话可以点击旁边的【重启应用】按钮。

数字签名证书的配置最终需要落在鸿蒙工程根目录中的 build-profile.json5 文件中起作用。

对于 HBuilderX 4.61 以前的版本，需要手动配置 harmony-configs/build-profile.json5 文件，该文件在构建阶段会覆盖到自动生成的鸿蒙工程的 build-profile.json5 文件中。

从 HBuilderX 4.61+ 开始支持以交互方式配置相关信息（且支持自动申请调试证书），这些信息在构建阶段会被覆盖填写到鸿蒙工程的 build-profile.json5 文件中。

为了兼容以前的版本，如果没有以交互方式配置签名证书，则在 harmony-configs/build-profile.json5 中配置的相关信息仍会有效。

从 HBuilderX 4.61+ 开始支持这种配置方式。在【运行到鸿蒙】操作的【选择运行设备】对话框中，点击【配置调试证书】按钮，打开配置对话框：

在 manifest.json 的编辑页面中，【鸿蒙 App 配置】里面也有打开配置对话框的按钮，分别用于配置调试证书和发布证书：

如果已经在 AppGallery Connect 中手动申请过证书，则开发者手中应该已经掌握了所有的必备信息（三个文件，两个密码和一个私钥别名），填写到对话框中即完成配置。 其中三个文件的位置如果位于 harmony-configs 目录里面，则会被处理为相对路径。

如果是通过 DevEco Studio 自动申请的调试证书，在 build-profile.json5 文件里能找到完整的证书配置信息。 需注意的是，在保存那三个文件的目录里还应该有一个 material 子目录，它跟私钥库文件（.p12）和两个密码是配合使用的，如果想把私钥库文件移到别的地方去，这个 material 目录也要复制过去（否则密码将失效）。

也可以在对话框中填写手动申请到的证书，填写的时候注意三个文件要在同一个目录。

自动申请得到的签名描述文件是跟给定的包名绑定的，只能用于对设置了相同包名的项目进行签名。

如果是自己手动申请的签名证书，请注意与这里的包名保持一致，否则在填写了签名描述文件之后会出现提示警告。

只有在配置调试证书的对话框里有这项内容。当自动申请调试证书的时候，得到的签名描述文件与给定的设备是绑定的，签名后的应用只能运行于这里列出的设备。

如果是自己手动申请的签名证书，请注意签名描述文件里面包含了这里列出的所有设备，否则在填写了签名描述文件之后会出现提示警告。

点击左侧的【检测】按钮会自动检测出当前已经连接的运行设备（真机或者模拟器），并自动填写到文本框里。

填写的内容是设备的唯一标识，可以填写多个，用半角逗号或者换行符分隔。

如果没有填写有效的设备唯一标识，则无法进行自动申请调试证书的操作。

私钥库密码和私钥密码需符合一定的要求：须由 6 ~ 64 个字符组成，可包含大小写字母、数字以及如下特殊字符 ~!@#$%^&*()-_=+\|[{}];:\'",<.>/?，首字符不能为连字符（-）。

如果是在 AppGallery Connect 中手动申请的证书，开发者应该知道申请时所使用的密码，直接在这里填写就可以了。

如果是通过 DevEco Studio 自动申请的调试证书，在 build-profile.json5 文件里能找到证书配置信息，其中的密码是加密过的，一般是 76 个或更多的 HEX 字符。 这种加密后的密码也可以直接拿来填写，但需要注意，这种密码要跟前面提到的 material 目录配合使用，否则在签名时将会发生错误。

对于调试证书，可以选择自动申请，此时 HBuilderX 会使用开发者授权的账号身份调用 AppGallery Connect 的 API 来自动完成证书的申请和配置。

受 API 提供能力的限制暂时无法申请到包含了 ACL 权限的调试证书，如果应用中有使用到 ACL 权限，则仍需采用 下一节介绍的方式 配置签名证书。

点击【自动申请】按钮，会触发浏览器打开华为的登录授权页面：

回到 HBuilderX 的对话框中，正常情况下完成自动申请之后，点击【保存】按钮保存即可。

如果自动申请过程中出现错误，可根据错误提示信息进行处理：

数字证书是由华为的 AppGallery Connect 服务系统（简称 AGC）颁发的，开发者首先需要先注册鸿蒙开发者账号 ，然后再到 AppGallery Connect 申请数字证书。

登录 AGC 之后，进入【证书、APP ID 和 Profile】中的【APP ID】页面，为指定的包名创建应用，然后才能为该应用申请证书。

申请的调试证书中需要包含当前正在使用的鸿蒙设备（真机或者模拟器）的标识，该设备标识首先需要在 AGC 中注册。

HBuilderX 会尝试自动把当前运行设备的标识注册到 AGC 中，如果失败，请手动在 AGC 中注册： 登录 AGC 之后，进入【证书、APP ID 和 Profile】中的【设备】页面，把当前设备的 UDID 添加到设备列表中。

可以在前面提到的 运行设备 得到鸿蒙设备的 UDID 标识， 也可以通过如下的命令行来获取，具体请参考 华为的官方文档 ：

示例源码如下，请查看 pre > code 标签中的内容

AGC 中每个开发者账号可以创建的证书是有数量限制的，如果已经达到限制则需要删除一些以释放额度。

登录 AGC 之后，进入【证书、APP ID 和 Profile】中的【证书】页面，从证书列表中删除掉一些已经不再需要的证书。

需要注意的是，如果删除了某个证书，则基于该证书生成的 profile 文件也将失效，可以进入【Profile】页面在列表中找到失效的 profile 并删除掉。

HBuilderX 4.61 之前的版本，只能通过 harmony-configs/build-profile.json5 文件来配置签名证书，里面的证书资料信息只能由 DevEco Studio 来生成, 即使是自己在华为 AppGallery Connect 网站上手动申请的证书，也需要填写到 DevEco Studio 里面才能最终得到所需的 build-profile.json5 文件。

DevEco Studio 须先打开一个鸿蒙工程才可进行证书相关的操作，建议先执行一次【运行到鸿蒙】，然后在项目的 unpackage 目录下找到临时生成的鸿蒙工程目录， 在 DevEco Studio 里面打开后再进行后面的操作。 如果是自己在 DevEco Studio 里面独立创建一个新的鸿蒙工程，虽然也可以用于申请证书，但需注意以下几点：

由于证书资料中包含应用的包名，所以在这个鸿蒙工程中设置的应用包名应该与将要开发的 uni-app 应用项目中设置的鸿蒙应用包名（在 manifest.json 中设置）相一致，这样申请到的证书资料才会有效；

这个鸿蒙工程的根目录中的 build-profile.json5 文件中的内容应该与 HBuilderX 自动生成的鸿蒙工程中的对应文件保持一致（随着版本迭代该文件的内容可能会有少许变化），否则在后续操作中可能产生异常。

如果有用到 ACL 权限，需在 entry/src/main/module.json5 中声明，这样获得的证书中才能包含相关的授权。参考 权限配置指南

完成申请证书的操作之后，把这个鸿蒙工程中的 build-profile.json5 文件复制到 uni-app 项目的 harmony-configs/build-profile.json5 即可。

点击 DevEco Studio 上方菜单 File - Project Structure...

在使用模拟器进行调试运行的时候，一般是不需要做数字签名的，但如果是用真机进行调试运行，或者业务代码用到了 ACL 权限，那么就需要申请并配置一个调试证书用于数字签名。

在对话框中选择 Project - Signing Configs，并勾选 Automatically generate signature，即可自动生成签名证书资料

通过 DevEco Studio 自动申请得到的证书，缺省会保存到电脑的用户目录下，在 Windows 系统中一般是 %USERPROFILE%\.ohos\config，在 Mac 系统中一般是 ~/.ohos/config。 配置信息中包含的三个文件缺省都是采用绝对路径来表示，也可以把这些文件移到 harmony-configs 目录下，这样就可以使用相对路径来表示，相对于 harmony-configs 目录。 如果要移动证书文件的位置，需注意跟这三个文件一起的还有一个名为 material 的目录，也要一起移动。

也可以在对话框中填写手动申请到的证书，填写的时候注意三个文件要在同一个目录。

完成以上操作后，鸿蒙工程中的 build-profile.json5 文件就包含了完整的调试证书配置信息（在 app.signingConfigs 数组里，name 属性的值是 "default"）。

在发行安装包的时候，一定需要配置一个发布证书，否则只能拿到一个未签名的安装包，是无法实际使用的。

发布证书只能手动申请，申请完成后把拿到的相关资料文件填写到 DevEco Studio 里面，填写的时候注意三个文件要在同一个目录。

在对话框中选择 Project - Signing Configs，不要勾选 Automatically generate signature，创建一个名为 release 的配置项。

完成以上操作后，鸿蒙工程中的 build-profile.json5 文件就包含了完整的发布证书配置信息（在 app.signingConfigs 数组里，name 属性的值是 "release"）。

无论是调试证书还是发布证书，生成的证书资料信息都在鸿蒙工程根目录下的 build-profile.json5 文件中，把这个文件复制到 uni-app 项目的 harmony-configs/build-profile.json5 即可。

使用 HBuilderX 4.28+，点击【发行】-【App-Harmony-本地打包】

如果项目中没有 harmony-configs 目录，此时会自动生成。

如果日志窗口提示没有配置签名证书资料，则去 配置发布证书的资料

配置完证书资料后，再次点击【发行】- 【App-Harmony-本地打包】即可得到已签名的 .app 安装包文件

最后还需参考鸿蒙官方文档发布鸿蒙应用到应用市场，详见文档

在应用内测和企业应用场景，有时候需要绕过华为应用商店，直接向部分特定的手机设备分发安装包。 此时可以从 AppGallery Connect 申请内部测试证书，并通过 HBuilderX 的调试运行操作得到 .hap 运行包， 然后再编写相关的分发描述文件上传到自己的服务器供手机用户下载安装。

具体操作过程可以参考 ASK 社区文章 鸿蒙企业应用内部分发打包教程

部分 API 需要在配置文件显式声明权限才能调用，权限的配置文件路径为：/harmony-configs/entry/src/main/module.json5，配置节点为：requestPermissions，如下图所示

这里举例鸿蒙位置定位的权限和如何设置，阅读 鸿蒙 uni.getLocation 的权限配置，这里详细描述了每一个步骤如何操作。

还有一些针对特定企业管理的权限，场景比较特殊，这里不做进一步描述。

Q: 鸿蒙如何申请位置定位权限？ A: 可参考 uni.getLocation 描述，鸿蒙位置权限，精准定位和模糊定位务必成对出现，否则会被驳回

Q: 鸿蒙如何申请读取用户图库、文件？ A: 鸿蒙曾开放读取用户存储的权限 READ_MEDIA/WRITE_MEDIA，但已废弃 。因此鸿蒙中不能直接读取和操作用户目录。官方提供了绕过方案，一般场景下，读取媒体和文件方案是使用 uni.chooseImage/uni.chooseFile，背后封装了鸿蒙官方提供的 Picker 选择器，无需申请权限，直接使用即可。

鸿蒙针对应用克隆、备份图片文件场景提供了 ohos.permission.READ_IMAGEVIDEO/ohos.permission.WRITE_IMAGEVIDEO 两个受控开放权限，需要 鸿蒙单独申请 ，审批通过之后方可使用。

存储文件，图片可直接调用 uni.saveImageToPhotosAlbum 存储到系统相册。存储文件可用 uni.saveFile，

编辑文件，可参考 uni.getFileSystemManager 文档。

在鸿蒙工程中，子模块中申请的权限无需在主项目中重复添加，权限将在整个应用中生效，而 UTS 插件在打包进入鸿蒙工程后，就是作为一个子模块存在，可以在 UTS 插件中即可实现应用的权限配置

通过此插件可以方便的配置权限，而无需在 uni-app 工程中通过替换文件的方式配置权限

HBuilderX 支持把 manifest.json 里面的一些配置项传递给鸿蒙工程，打开这个文件，下面这些配置项与鸿蒙相关：

目前这里的应用名称、应用版本名称、应用版本号将传递给鸿蒙工程使用。

以上的配置项有可能随着 HBuilderX 的升级而有所增加，其优先级高于后面所述的 harmony-configs 目录。如果这些仍没有满足需求，则可以自行在 harmony-configs 目录中进行配置。

项目的根目录下有一个 harmony-configs 目录，每当执行跟鸿蒙相关的操作时，HBuilderX 都会检查这个目录，如果目录不存在则会自动创建。 HBuilderX 早期版本所创建目录初始会存在几个常用的配置文件，4.36+ 版本该目录初始为空。

在执行运行或者发行到鸿蒙的操作过程中，HBuilderX 会根据内置模板生成一个鸿蒙工程目录（一般在 unpackage 目录下），然后把 harmony-configs 目录下的所有内容都原样覆盖过去， 然后再调用鸿蒙的工具链进行编译打包等操作。

所以，harmony-configs 目录中的所有文件最终都会原样进入鸿蒙工程目录参与项目构建，所有需要对鸿蒙工程的定制化配置都可以写在这个目录下。

关于 harmony-configs 目录的使用要遵守鸿蒙的技术规范，具体可参考 鸿蒙官方文档

harmony-configs/build-profile.json5

其中的 app.signingConfigs 用于设置数字签名资料，参见 证书签名配置指南

HBuilderX 4.61+ 开始已经支持在 HBuilderX 里面直接配置证书签名，建议采用此方式，无需使用 build-profile.json5。

harmony-configs/entry/src/main/module.json5

修改其中的 module.requestPermissions 来设置运行权限，参见 权限配置指南

harmony-configs/AppScope/app.json5

其中的 app.bundleName 用于设置应用包名。 HX 4.31+ 已经支持在项目的 manifest.json 里面以图形界面修改应用包名，如果在那里做了设置，将优先于这里的设置。

其中的 app.versionName 和 app.versionCode 用于设置应用版本名称和版本号。 HX 4.43+ 已经支持使用项目的 manifest.json 里面的应用版本名称和版本号，将优先于这里的设置。

一般而言，新版本已经不再需要 harmony-configs/AppScope/app.json5 文件了。

manifest.json 里面已经支持一些应用配置项，未直接支持的可以通过 harmony-configs 来设置，详情参见 更多配置指南。

同时可以参考鸿蒙官方文档：应用/组件级配置

为保证图标在系统内显示的一致性，应用预置的图标资源应满足以下要素：

启动页可以配置背景色代码（默认为#FFFFFF）和一张启动图，启动图没有尺寸要求，但建议为正方形 logo 图

仅 APP-HARMONY 和 APP 可以条件编译命中鸿蒙平台，APP-PLUS 不能命中鸿蒙平台

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.27 以前的版本需要在 DevEco Studio 中运行由 uni-app 项目生成的鸿蒙工程，虽然鸿蒙官方文档提供了如何开启热重载，详见文档 ， 但目前只能针对 ets 文件的修改进行热更，还无法针对 uni-app 打包的 js 文件进行热更。

HBuilderX 4.27+ 支持直接运行到鸿蒙设备，修改源代码之后需重新调用鸿蒙工具链编译打包，并重新安装到鸿蒙设备上运行，不支持热重载。

HBuilderX 4.41+ 支持热重载，但跟具体修改的代码文件有关，如果进行了无法热重载的修改，会自动重新安装整个应用并重新运行。

运行到鸿蒙时，在 uni-app 页面通过 console.log 打印日志可以直接在 HBuilderX 查看。

HBuilderX 4.41+ 在真机运行时需要连接到与主机电脑相同的局域网才能正确接收到日志。

注意：在 UTS 代码里面打印对象或数组时，需要 JSON.stringify 才能正确显示内容，如 console.log("obj", JSON.stringify(obj))

HBuilderX 早期版本使用鸿蒙工具链中的 hilog 来收集日志并显示，可能因为设备连接问题或者鸿蒙系统版本升级调整等原因导致日志收集不到。

HBuilderX 4.41+ 在真机运行时需要连接到与主机电脑相同的局域网才能正确接收到日志。

另外，HBuilderX 4.41+ 在控制台工具条中增加了“显示原生日志”的选项，开启后可以看到更多的日志内容。

作为一个应急处理方案，可以打开一个命令行窗口，执行命令 hdc shell hilog -T JSAPP 来直接从连接的鸿蒙设备查看日志。

如果你的项目能安装到模拟器上，但是打开闪退，如果你是 Windows 系统，你可能使用了低于 API19beta 的模拟器，阅读 开发环境要求 进行下载安装。

如果配置了 harmony-configs/build-profile.json5 文件，请确认里面的 app.products设置了 "useNormalizedOHMUrl": true。

如果不是上述的原因，最常见的情况就是使用了不支持的组件或者 API，请逐个排查所使用的组件和 API 是否已经兼容了鸿蒙平台，先保证空白工程能运行，排除你的环境、配置问题。pages.json 只保留一个页面，先自行验证，每个人的问题不一样，需要先自查，可能的问题比如用到了 plus api，用到了条件编译忽略了 app-android 导致逻辑命中失败。

二分排查速度最快，可以尝试对 pages.json 进行代码二分法排查（删除一半页面如果正常了代表被删除的那一半页面中有造成白屏或闪退的页面）。

也可以查阅 HBuilderX 的原生日志、DevEco 的 log 面板日志，筛选 Warn 级别的日志，观察是否有错误。

确保签名证书资料没有问题的情况下，尝试重启电脑

此问题仅会在 HBuilderX 4.27 以前的版本存在，因为编译 uni-app 代码完成之后需要调起 DevEco Studio 来运行鸿蒙工程。

请用下面的方法确保设置的 DevEco Studio 安装路径是正确的，重新设置之后请重启 HBuilderX。

原路径后面添加 /bin/devecostudio64.exe，然后重启 HBuilderX

原路径后面添加 /Contents/MacOS/devecostudio，然后重启 HBuilderX

当前导航栏未支持，可以尝试关闭原生导航栏，使用自己的自定义导航栏组件实现。

HBuilderX 4.31 起支持 uniPush 推送，具体配置请参考文档

uniPush 初始化时候需要读取 OAID，这对应 ohos.permission.APP_TRACKING_CONSENT 权限，可参考 权限配置指南 定义为下面方案，并在 string.json5 中补充自定义 Reason_TRACKING 文案。

示例源码如下，请查看 pre > code 标签中的内容

这里举例鸿蒙位置定位的权限和如何设置，阅读 鸿蒙 uni.getLocation 的权限配置，这里详细描述了每一个步骤如何操作。

此问题由于 arkTs 的混淆 Bug 引发，即使进入到一个空的组合式 api 页面也会出现这个报错，已反馈给鸿蒙团队处理。

临时解决方案：在鸿蒙项目entry/obfuscation-rules.txt文件中增加一行-disable-obfuscation来禁用混淆。

此章节仅针对 HBuilderX 4.29 及之前版本，4.31 及之后的版本暂不支持在 x86_64 平台的模拟器上运行。

在 x86_64 平台（绝大多数 Windows 系统和部分 MacOS 系统）上使用【运行到鸿蒙】并选择了模拟器作为运行设备的时候，可能会遇到这个报错。

这是由于 HBuilderX 4.29 及之前版本在默认配置里面依赖了支付宝 SDK，而这个包不支持运行在 x86_64 平台的模拟器上，所以在打包后安装到模拟器设备时会报错。

出现这种情况时，如果并不需要这个依赖，可以修改 harmony-configs/oh-package.json5 文件，在 dependencies 里面删除 @cashier_alipay/cashiersdk 就行了； 如果确实需要，那就只能改用真机设备来运行了。

uni-app/uni-app x 用户可参考 uni-app 调试方案 进行调试。

目前下载 API19 模拟器即可运行 uni-app 鸿蒙项目和元服务，点击下载 DevEco5.1.1Beta 版本，低于此版本的模拟器不支持在 Windows 平台运行模拟器。

在满足兼容性要求的前提下，如果要在 Windows 系统如使用模拟器则需要开启以下功能

打开控制面板 - 程序与功能 - 开启以下功能

注意: 需要 win10 专业版或 win11 专业版才能开启以上功能，家庭版需先升级成专业版或企业版

cli 项目的 uni-app 编译器是跟随项目配置的，跟 HBuilderX 的版本并不直接相关，如果是以前创建的 cli 项目，可能因为关联的编译器版本太低而出现此现象。

建议升级 cli 项目的编译器版本，参考 更新编译器的版本

删除 harmony-configs 目录（如果目录里有自己修改过的内容请先做好备份），再删除 unpackage 目录，然后重试。

源代码中有资源文件（比如图片）带有只读属性，导致再次打包的时候鸿蒙工具链删除失败报错。找到有问题的文件去掉只读属性，再删除 unpackage 目录，重试即可。

HBuilderX 在打包的时候会调用鸿蒙的工具链，其中用到了 java 程序，这种问题一般是因为 java 程序版本不匹配导致的。 早期版本是优先使用环境变量 PATH 里面能找到的 java 程序，临时的解决办法是在 PATH 环境变量里去掉 java 程序的路径，再重新启动 HBuilderX。 HBuilderX 4.31+ 会优先使用鸿蒙工具链自带的 java 程序，就不会是这个原因了。

检查电脑上安装的 java 版本，可能是版本过低。建议卸载 java 或者在 PATH 环境变量里去掉 java 的路径。 新版本（4.31+）已调整为优先使用鸿蒙工具链自带的 java 就不会受这个影响了。

鸿蒙工具链运行时要求所涉及到的文件的路径总长度不能超过 255 个字符。请尝试把 uni-app 项目的目录位置改到一个比较短的路径下，可能会避开这个问题。

鸿蒙工具链在首次运行的时候需要安装一些依赖的工具，且此操作只能在 DevEco Studio 中才能正确执行，方法是在 DevEco Studio 里面随便创建一个工程然后构建运行一下即可。

如果在 DevEco Studio 里面也报了同样的错误，则可以尝试自行设置 npm 的镜像源来解决问题，比如设置环境变量 NPM_CONFIG_REGISTRY=https://registry.npmmirror.com 使用境内的镜像源。

可能是使用的 DevEco Studio 版本过低，要求 5.0.3.800+。

也可能是自行配置的 harmony-configs/build-profile.json5 文件里面有错误，导致 DevEco Studio 无法正确解析。 请参考 文档 的方法确保配置正确。

如果项目中配置的签名证书资料有误，则会报这个错，常见的原因是指向的文件不存在，或者密码设置错误。

请参考 证书签名配置指南 检查相关的配置项。

这是由于默认配置里面声明申请了一些权限，其中包含受限权限（需要白名单授权的 ACL 权限），这就要求安装包必须用具备足够权限授权的数字证书进行签名，否则无法安装到设备上。

如果业务代码里面并没有实际使用到这些权限，一个简单的办法就是修改 harmony-configs/entry/src/main/module.json5 文件， 删除 module.requestPermissions 数组里面涉及这三项的内容，重新运行即可。 注：从 HX 4.31+ 开始默认配置中已经不再包含 ACL 权限，如果需要的话请自行修改 harmony-configs/entry/src/main/module.json5 文件添加权限声明。

如果确实需要这里的某些权限，那就需要申请一个调试证书，并配置到 harmony-configs/build-profile.json5 文件的 app.signingConfigs 中。 具体请参考 调试用的数字签名证书

如果配置了签名证书，打包之后会进行签名，但如果项目中配置的 bundleName 与签名证书申请时所填报的 bundleName 不符，就会报这个错。 可以修改 harmony-configs/AppScope/app.json5 文件中 app.bundleName 为签名证书申请时所填的应用包名， 也可以根据配置的 bundleName 重新申请证书。

注：从 HX 4.31+ 开始应该在项目的 manifest.json 文件的【鸿蒙 App 配置】中设置【包名】。

当运行到鸿蒙时，在把打包后的 .hap 安装到设备上时可能会遇到这个报错。常见的原因是当前使用的设备 UUID 没有添加到签名用的 profile 文件中。

推荐使用 manifest.json 提供的 自动申请调试证书 进行一键更新。

如果你是手动维护的证书，首先要 注册调试设备 ， 然后 申请调试 Profile 或修改已有的 profile 文件并重新下载。

当运行到鸿蒙时，如果选择真机为运行设备，则必须配置好数字签名证书，否则无法安装到真机上。 具体的配置方法请参考 证书签名配置指南

当运行到鸿蒙时，所使用的签名证书与鸿蒙设备中已安装的应用不一致，此时无法覆盖安装。请先手动删除已安装的应用。

当运行到鸿蒙真机时，需要在手机上信任授权给调试设备（当前运行 HBuilderX 的电脑），如果没有信任授权，则电脑无法安装应用到手机上，就会报这个错。

重新连接手机到电脑，在弹出提示框的时候选择信任并授权。必要时可以进入手机的【开发者选项】重新设置。

有记录显示，在 Windows 系统下，运行到鸿蒙时如果选择模拟器作为运行设备，可能会出现超时的情况，原因尚不清楚，有可能与模拟器系统里存在以前安装的相同包名的应用有关， 如遇这种情况，可以尝试手工在模拟器里面删除旧的应用然后重试。

由于未知原因导致【鸿蒙真机运行】插件出现破损，需要重新安装。 请在 HX 主菜单中选择【工具>插件安装>已安装插件】，找到【鸿蒙真机运行】插件并点击卸载，然后切换到【安装新插件】页签点击【鸿蒙真机运行】重新安装即可。

为了能够重建完整的鸿蒙工程目录，HBuilderX 需要先删除旧的鸿蒙工程目录，但是由于某些原因（比如其中有文件被其它程序占用，比如源码在 MacOS 文稿中并开启了 iCloud 云同步）导致删除失败。 为确保正确执行后续的操作，请先设法手工删除该目录，然后再重新开始操作。

应该在 manifest.json 的【鸿蒙配置】中设置正确的包名，具体要求请参考 配置应用包名

需要在工程级的 build-profile.json5 的 products 字段（如果有多项都要配置）中配置 compatibleSdkVersionStage: "beta6" 后重新运行 鸿蒙文档

如果是发行阶段报错，可能底层依赖有较高版本的基础要求，可修改 harmony-configs/build-profile.json5 中的 products[1]， 修改 compatibleSdkVersion:"5.0.5(17)" 提高应用兼容版本。

在把 uni-app 项目运行到鸿蒙设备上以后，修改代码后会触发差量编译，然后会对鸿蒙设备中运行的应用执行热更新操作。在某些情况下有可能出现此种报错。

首先确认在鸿蒙设备里确实已经运行了应用，然后尝试在 HBuilderX 里面重新运行到鸿蒙看是否能解决问题。

在某些电脑环境下，存在一种偶发的情况也会导致出现此种报错，原因尚不完全清楚，重启 hdc server 可以解决问题。 hdc 是安装 DevEco Studio 时自带的鸿蒙工具链中的一个重要工具，正常情况下它的安装位置在：

在命令行中执行 hdc kill -r 命令以重启 hdc server，然后在 HBuilderX 里面重新运行到鸿蒙即可。

如果上述命令仍未能解决问题，就需要自行查找 hdc server 进程并杀掉它。在 MacOS 系统下可以使用下面的命令：

示例源码如下，请查看 pre > code 标签中的内容

在 Windows 系统下可以打开任务管理器找到 hdc 进程（一般显示名为 POSIX WinThreads for Windows）杀掉即可。

这个模块 HBuilderX 目前不需要，说明你的 build-profile.json5 没有从 HBuilderX 工程的 unpackage 目录中读取，而是从 DevEco 新建工程里读取的，两者产生了差异。

解决方法：移除 harmony-configs 目录里的 build-profile.json5 ，重新启动并选择清除缓存重新操作，从 unpackage 目录中获取 build-profile.json5 文件放置到 harmony-configs 目录内。

在鸿蒙应用、鸿蒙元服务中可以开发卡片，放置到桌面上，展示特定的应用数据、提供快速启动应用的入口。目前，卡片开发有两种方式：

下面介绍如何开发基于 UI 的卡片，思路和原生开发一致，推荐在 DevEco 中完成卡片开发。

此时，就有了默认的卡片，点击会打开默认应用入口。

更多 API 和数据共享参考 开发卡片事件

鸿蒙平台文档要求 用户首次打开应用，需要同意用户协议与隐私政策，才可进入应用，目前有两个方案实现隐私协议弹窗：

自行绘制。目前鸿蒙隐私弹窗可自行实现，正常在应用启动时候弹窗即可，自己存储用户同意状态。可参考 hellouniapp 线上应用。容易定制效果，自行处理用户同意状态。

托管隐私协议。华为开发者平台提供了隐私协议托管的服务，通过填写表格，完成合规的隐私协议，经过审核之后，最终得到托管网页网址。上架时候选择隐私托管协议即可，正式上线之后，应用会自动提示隐私协议。可参考《隐私管理服务 》。

经检测发现，您的应用使用了 HarmonyOS beta 版本的 API。 修改建议：为提升消费者使用体验，请使用 HarmonyOS release 版本的 API 开发应用，申请上架。请参考版本说明集成 release 版本 API

解决方案：重新下载 release 版本的 DevEco。代码不变，重新发行打包，之后上传提审即可。

Mac 电脑的外接硬盘如果使用了非 Mac 的文件系统（比如 ExFAT 文件系统），Mac 系统会启用资源分叉机制，即为每个文件和目录自动创建一个资源分叉文件（在原本的文件/目录名前面添加一个 ._ 作为文件名），用于保存相关的元信息。

当在这样的文件系统上创建 uni-app (x) 项目目录时，由于 HBuilderX 自动创建的鸿蒙工程目录也在这个文件系统上，而这些资源分叉文件将对鸿蒙工具链产生干扰导致执行异常。 其实在这个场景下，这些资源分叉文件并无实际用途，是可以安全删除的。

HBuilderX 4.81+ 在这种情况下会自动删除鸿蒙工程目录内的所有资源分叉文件。

这个操作会额外消耗一些性能，如果想避免的话，最好的办法还是尽量避免使用非 Mac 的文件系统。

此问题也已经反馈给华为方面，未来 DevEco Studio 也应该能正确处理这种情况而不再报错了。

【腾讯地图】HBuilderX 内置集成了鸿蒙版本腾讯地图，可在 manifest.json 文件鸿蒙 App 配置 - uni-map 地图，勾选腾讯地图。详情可见 uni-app 组件 map

【高德地图】，可使用 uniapp 嵌入鸿蒙原生组件 提供的能力自行接入高德地图，在插件市场搜索 高德 鸿蒙 查阅社区提供的封装能力。

【华为地图】，华为地图目前可免费使用，目前 uniapp 提供了同层渲染的 华为花瓣地图 示例可供参考使用。访问 华为 AGC 开发者后台 ，选择 开发与服务 - 项目设置 - 开放能力管理 - 选择应用 - 勾选开启地图服务。具体使用方案可见插件文档。

鸿蒙中目前支持系统定位，细节配置可参考 API uni.getLocation 鸿蒙配置说明

鸿蒙和 iOS 一样不支持侧载，打包得到的 app 无法安装到任意用户的手机上。

如果是内部需要测试，可以使用调试模式安装到指定的手机上进行测试。本地调试。把对应手机的 UUID 录入 AGC 证书中，然后手机开启开发者模式并连接电脑，在 HBuilderX 中选择运行。

鸿蒙提供的类似 TestFlight 白名单测试服务，访问 AGC 后台 找到 APP - 应用测试 - 版本列表，这里可以生成邀请链接，在白名单内的用户可以下载安装，这个过程也需要提交给华为做审核，对软件的完善程度有一定的要求，适合开发中后期内部测试。

完整测试方案，可参考鸿蒙文档 《AGC 内部测试 》。

在鸿蒙中，设置 userAgent 和 app-plus 配置相似，在 manifest.json 中设置 app-harmony.useragent，具体可参考 鸿蒙 userAgent 配置。

有些移动端网页是检测的 userAgent 来判断是否为 mobile 机型，进而展示移动端适配页面，判断规则中可能缺少判断，这种情况下可参考这个帖子进行兼容。经验分享 鸿蒙通过 WebView 打开页面渲染成桌面 pc 模式怎么办？

这个问题出现在 MacOS 中，你可直接粘贴下面值，此问题后续会修复。 /Applications/DevEco-Studio.app

可参考 UTS 插件介绍 ，新建 uts api 插件，填写下面代码放入 app-harmony/index.uts

示例源码如下，请查看 pre > code 标签中的内容

目前可升级鸿蒙 5/鸿蒙 6 的真机列表在这里：HarmonyOS 6 支持机型

这里特别补充鸿蒙真机不一定都是旗舰机，有一些中端机、旧机可供参考，价格在一千到两千元，比如 Nova14/畅享 70X（2025 年发布的新机），比如 nova12pro （旧机），这两款机器价格较低，可升级鸿蒙 5/6 系统。

近期有用户反馈，应用无法响应键盘 tab 按键

应用/元服务中的走焦事件能够响应 tab 键或方向键切换。https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/device-compatible

在电脑、平板、折叠电脑上属于规则级别，也就是强制要求。

临时规避方案 1，自行明确当前是否需要支持平板，如果目前不需要可在代码中搜索 devicetype，保持为 phone ，在 uniapp 后台、agc 后台表格里只勾选手机，也就是避免支持平板。

解决方案 2：你可在指定的组件中，添加 tabindex，从而让功能区支持 tab 切换。目前规则中未明确要求支持回车按键，可忽略处理，也可在组件中，使用 renderjs ，在 renderjs 的 mounted/unmounted 里监听、取消监听 addEventListener keydown 相关事件，主动触发 click

可参考来自社区热心用户的方案，请参考 https://ask.dcloud.net.cn/question/215693 评论区。

自动申请调试证书时总是检测不到设备怎么办？设备已经加到 AGC 中了。 25 年 12 月开始，华为调整了查询设备信息的接口，影响了现有代码处理逻辑。两个处理方案：使用手动签名或者调整代码做兼容。

在 HBuilderX 安装目录找到 plugins/launcher/out/main.js 文件，查找和替换下面文件

示例源码如下，请查看 pre > code 标签中的内容

目前 uni-app x 已支持付费鸿蒙 uts 插件，用户可通过 uts 插件试用功能进行体验。云打包相关版本参数目前为 commandline-tools-linux-x64-5.0.13.220。

uts 中使用鸿蒙 API 如果有兼容性顾虑，可参考这个指导方案，判断来 DeviceInfo 返回信息。《应用使用 API 兼容性保护判断的指导 》。

HarmonyOS 设备各 API 版本使用量占比如下，开发者可根据占比来为应用合理定义需要兼容的 API 版本，参考 《存量设备 API 版本使用数量参考 》。

自 5.0 alpha 开始，hx 支持对项目代码进行鸿蒙兼容性检测。开发者如果有兼容鸿蒙的需求，可以根据控制台的提示，做出相应的修改。

示例源码如下，请查看 pre > code 标签中的内容

hx 检测到此处代码只判断了安卓端，会以黄字提示开发者未适配鸿蒙，可能造成鸿蒙版微信下异常；开发者可以根据自己的需求修改代码或者点击近期不再提示，以使 hx 不再检测相关内容。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
versionName
```

Example 3 (unknown):
```unknown
versionCode
```

Example 4 (unknown):
```unknown
harmony-configs/AppScope/app.json5
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-event.html

**Contents:**
  - # 事件穿透
  - # View交互性
      - 本页导读

Weex 提供了通过事件触发动作的能力，例如在用户点击组件时执行 JavaScript。 下面列出了可被添加到 Weex 组件上以定义事件动作的属性：

Android和iOS下原生事件传递机制不同，这里仅针对iOS

当一个父View存在多个同级子View时，由于iOS会选择层级最高的View来响应事件，底层的View的事件永远都不会响应。

Weex在view组件中增加了eventPenetrationEnabled属性，当值为true（默认为false）时，View的子View仍能正常响应事件，但View自身将不会响应事件。

Weex在view组件中增加了userInteractionEnabled属性，当值为false（默认为true）时，View及其子View均不响应事件，事件向下层View传递。

如果一个组件被绑定了 longpress 事件，那么当用户长按这个组件时，该事件将会被触发。

如果一个位于某个可滚动区域内的组件被绑定了 appear 事件，那么当这个组件的状态变为在屏幕上可见时，该事件将被触发。

如果一个位于某个可滚动区域内的组件被绑定了 disappear 事件，那么当这个组件被滑出屏幕变为不可见状态时，该事件将被触发。

**Examples:**

Example 1 (unknown):
```unknown
eventPenetrationEnabled
```

Example 2 (unknown):
```unknown
userInteractionEnabled
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-speech

**Contents:**
  - # 配置百度语音识别
  - # 使用百度语音识别
      - 本页导读

App端Speech(语音输入)模块封装了市场上主流的三方语音识别SDK，提供JS API统一调用语音识别功能。

注意 uni-app没有封装语音相关API，需要调用5+ API的plus.speech.* 。

使用语音识别功能需在项目manifest.json的“App模块配置”中勾选“Speech(语音输入)”，并根据项目实际情况勾选使用的三方语音识别平台：

提示：三方语音识别模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

打开项目的manifest.json文件，在“App模块配置”项的“Speech(语音输入)”下，勾选“百度语音识别”： 以下配置参数需要到百度语音开放平台 申请

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

Example 2 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

Example 3 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

Example 4 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

---

## 应用配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-api.html

**Contents:**
- # 应用配置
- # 应用 API
- # 全局 API
- # 选项/Data
- # 选项/DOM
- # 选项/生命周期钩子
- # 选项/资源
- # 选项/组合
- # 选项/杂项
- # 实例 property

config 是一个包含了 Vue 应用全局配置的对象。你可以在应用挂载前修改其以下 property：

示例源码如下，请查看 pre > code 标签中的内容

在 Vue 3 中，改变全局 Vue 行为的 API 现在被移动到了由新的 createApp 方法所创建的应用实例上。此外，现在它们的影响仅限于该特定应用实例：

示例源码如下，请查看 pre > code 标签中的内容

调用 createApp 返回一个应用实例。该实例提供了一个应用上下文。应用实例挂载的整个组件树共享相同的上下文，该上下文提供了之前在 Vue 2.x 中“全局”的配置。

另外，由于 createApp 方法返回应用实例本身，因此可以在其后链式调用其它方法，这些方法可以在以下部分中找到。

实现全局变量的方式需要遵循 Vue 单文件模式的开发规范。详细参考：uni-app全局变量的几种实现方式 。

Vue 组件编译到小程序平台的时候会编译为对应平台的组件，部分小程序平台支持 options 选项（具体选项参考对应小程序平台文档的自定义组件部分），一般情况默认即可，如有特殊需求可在 Vue 组件中增加 options 属性。

示例源码如下，请查看 pre > code 标签中的内容

在 onLoad 里得到，onLoad 的参数是其他页面打开当前页面所传递的数据。

uni-app 内置了 Vuex ，在app里的使用，可参考 hello-uniapp store/index.js。

示例源码如下，请查看 pre > code 标签中的内容

由于 onError 并不是完整意义的生命周期，所以只提供一个捕获错误的方法，在 app 的根组件上添加名为 onError 的回调函数即可。如下：

示例源码如下，请查看 pre > code 标签中的内容

当重复设置某些属性为相同的值时，不会同步到view层。 例如：每次将scroll-view组件的scroll-top属性值设置为0，只有第一次能顺利返回顶部。 这和props的单向数据流特性有关，组件内部scroll-top的实际值改动后，其绑定的属性并不会一同变化。

解决办法有两种（以scroll-view组件为例）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第二种解决方式在某些组件可能造成抖动，推荐第一种解决方式。

**Examples:**

Example 1 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

Example 2 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

Example 3 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

Example 4 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-sec-confusion

**Contents:**
  - # 配置要混淆的js/nvue文件
    - # uni-app项目
    - # 5+ App/Wap2App项目
  - # 提交云端打包
      - 本页导读

App的安装包都可以解压。前端资源，一般都是明文存放在安装包中，为防止解压后泄露敏感信息，需要进行安全处理。

由此DCloud提供了App端的js/nvue文件的原生混淆。5+ App/Wap2App支持对指定的js进行原生混淆。uni-app支持对指定的nvue文件原生混淆。

原生混淆后的安装包，解压后看到的都是乱码。

打开manifest.json文件，切换到“源码视图”，按不同项目类型进行配置。

uni-app的js运行在独立的jscore中，而不是webview中，所以不受iOS平台WKWebview不支持原生混淆的限制。 uni-app的vue页面中的js，是整体编译到一个大js文件中的，它经过编译，已经不再是vue源码了，但还不是乱码。对这个统一的大文件进行混淆会有影响性能。 所以uni-app只支持独立混淆nvue/js文件。

如果要发布多端的话，要保护的js最好写在app-plus的条件编译中，否则发布到其他端，还是无法原生混淆。

HBuilderX2.3.4版本开始，uni-app项目支持对nvue文件进行原生混淆

在"app-plus" -> "confusion" -> "resources"节点下添加要混淆的nvue文件列表：

示例源码如下，请查看 pre > code 标签中的内容

resource下的键名为nvue文件路径（相对于应用根目录），值为空JSON对象（大括号）。

HBuilderX2.6.3+版本开始，uni-app项目使用v3编译器 支持对vue页面中引用的js文件进行原生混淆

在manifest.json文件中添加要混淆的js文件列表：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：uni-app中vue页面的webview组件支持加载使用加密混淆hybrid、static目录中的js文件，nvue页面的webview组件不支持。

应用运行期间在页面打开时需要消耗更多时间进行混淆文件还原，为减少对运行速度的影响，5+App/wap2app仅支持对js文件进行原生混淆。 在"plus" -> "confusion" -> "resources"节点下添加要混淆的js文件列表：

示例源码如下，请查看 pre > code 标签中的内容

resource下的键名为js文件路径（相对于应用根目录），值为空JSON对象（大括号）。

HBuilderX2.6.11+版本开始，在iOS11+设备上使用WKWebview也可以支持JS原生混淆 WKWebview使用了更加严格的安全机制，使用原生混淆的js文件在html页面中必须使用自定义协议头plus-confusion://来引用：

示例源码如下，请查看 pre > code 标签中的内容

在manifest.json的"plus" -> "confusion" -> "resources"节点下添加要混淆的js文件列表。 在"confusion"节点下添加 "supportWKWebview": true 支持WKWebview。 由于自定义协议仅在iOS11及以上设备才支持，建议配置应用支持的最低版本deploymentTarget 为11.0：

示例源码如下，请查看 pre > code 标签中的内容

注意：iOS平台WKWebview需iOS11+系统才支持原生混淆。5+App/wap2app项目，如果要兼容iOS11以下设备只能强制使用UIWebview内核，但苹果将要废弃UIWebview（详情 ）。如对原生混淆很重视，从长远考虑，建议改造升级uni-app

配置好原生混淆的文件列表后，需要提交云端打包，注意在App云端打包对话框中需要勾选“对配置的js文件进行原生混淆”

再次强调：为了保证加密数据的安全性，加密算法和key不对外公开，因此离线打包无法支持原生混淆。 熟悉原生的开发者可将敏感信息存放于原生代码中，再与js进行交互。

对安全性要求较高的开发者，除了对前端js进行加密外，还应该对整个apk再进行一次加固。推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

**Examples:**

Example 1 (javascript):
```javascript
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

Example 2 (javascript):
```javascript
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

Example 3 (javascript):
```javascript
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

Example 4 (json):
```json
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

---

## 分包异步化 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/miniprogram-subcontract-asynchrony.html

**Contents:**
- # 分包异步化
  - # 跨分包自定义组件引用
  - # 跨分包JS代码引用
      - 本页导读

在小程序中，不同的分包对应不同的下载单元；因此，分包之间不能互相使用自定义组件或进行 require。分包异步化 特性将允许通过一些配置和新的接口，使部分跨分包的内容可以等待下载后异步使用，从而一定程度上解决这个限制。

uni-app(-x) 支持 分包异步化 的相关写法和配置，使用之前需要确认目标小程序原生是否支持分包异步化。

此特性依赖配置 componentPlaceholder，目前仅支持在 pages.json 中添加页面级别的配置。

如果需要在某个组件中配置，详见 ask社区帖子

微信、支付宝、抖音等小程序端默认支持跨分包 JS 代码引用，需要写小程序原生支持的语法，不能使用静态引入或者动态引入。示例如下：

示例源码如下，请查看 pre > code 标签中的内容

sub分包 正常使用 utils.js 文件

示例源码如下，请查看 pre > code 标签中的内容

其他分包使用 sub分包 的 utils.js 文件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-app(-x)
```

Example 2 (unknown):
```unknown
componentPlaceholder
```

Example 3 (javascript):
```javascript
// sub/utils.js
export function add(a, b) {
    return a + b
}
```

Example 4 (javascript):
```javascript
// sub/utils.js
export function add(a, b) {
    return a + b
}
```

---

## 页面 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page

**Contents:**
- # 页面
- # 页面简介
- # 页面管理
  - # 新建页面
  - # 删除页面
  - # 页面改名
  - # pages.json
  - # 设置应用首页
- # 页面内容构成
  - # template模板区

uni-app项目中，一个页面就是一个符合Vue SFC规范的 vue 文件。

在 uni-app js 引擎版中，后缀名是.vue文件或.nvue文件。 这些页面均全平台支持，差异在于当 uni-app 发行到App平台时，.vue文件会使用webview进行渲染，.nvue会使用原生进行渲染，详见：nvue原生渲染。

一个页面可以同时存在vue和nvue，在pages.json的路由注册中不包含页面文件名后缀，同一个页面可以对应2个文件名。重名时优先级如下：

在 uni-app x 中，后缀名是.uvue文件

uni-app x 中没有js引擎和webview，不支持和vue页面并存。

uni-app x 在app-android上，每个页面都是一个全屏activity，不支持透明。

uni-app中的页面，默认保存在工程根目录下的pages目录下。

每次新建页面，均需在pages.json中配置pages列表；未在pages.json -> pages 中注册的页面，uni-app会在编译阶段进行忽略。pages.json的完整配置参考：页面配置。

通过HBuilderX开发 uni-app 项目时，在 uni-app 项目上右键“新建页面”，HBuilderX会自动在pages.json中完成页面注册，开发更方便。

同时，HBuilderX 还内置了常用的页面模板（如图文列表、商品列表等），选择这些模板，可以大幅提升你的开发效率。

新建页面时，可以选择是否创建同名目录。创建目录的意义在于：

操作和删除页面同理，依次修改文件和 pages.json。

pages.json是工程的页面管理配置文件，包括：页面路由注册、页面参数配置（原生标题栏、下拉刷新...）、首页tabbar等众多功能。

pages.json -> pages配置项中的第一个页面，作为当前工程的首页（启动页）。

示例源码如下，请查看 pre > code 标签中的内容

uni-app 页面基于 vue 规范。一个页面内，有3个根节点标签：

示例源码如下，请查看 pre > code 标签中的内容

template中文名为模板，它类似html的标签。但有2个区别：

在vue2中，template 的二级节点只能有一个节点，一般是在一个根 view 下继续写页面组件（如上示例代码）。

但在vue3中，template可以有多个二级节点，省去一个层级，如下：

示例源码如下，请查看 pre > code 标签中的内容

可以在 manifest 中切换使用 Vue2 还是 Vue3。

注意：uni-app x 中只支持 Vue3。

script中编写脚本，可以通过lang属性指定脚本语言。

示例源码如下，请查看 pre > code 标签中的内容

在vue的选项式（option）规范中，script下包含 export default {}。除了选项式，还有 组合式 写法。

页面级的代码大多写在 export default {} 中。写在里面的代码，会随着页面关闭而关闭。

写在 export default {} 外面的代码，一般有几种情况：

示例源码如下，请查看 pre > code 标签中的内容

开发者应谨慎编写 export default {} 外面的代码，这里的代码有2个注意事项：

export default {} 里的内容，是页面的主要逻辑代码。包括几部分：

整体效果就是，刚开始按钮文字是"点我"，点一下后按钮文字变成了"被点了"

示例源码如下，请查看 pre > code 标签中的内容

本章节为页面代码介绍，并非vue教程，了解data数据需详见

style的写法与web的css基本相同。

如果页面是nvue或uvue，使用原生渲染而不是webview渲染，那么它们支持的css是有限的。

uni-app 页面除支持 Vue 组件生命周期外还支持下方页面生命周期函数，当以组合式 API 使用时，在 Vue2 和 Vue3 中存在一定区别，请分别参考：Vue2 组合式 API 使用文档 和 Vue3 组合式 API 使用文档。

接下来我们介绍onLoad、onReady、onShow的先后关系，页面加载的详细流程。

所以原生导航栏是最快显示的。页面背景色也应该在这里配置。

这里的dom创建仅包含第一批处理的静态dom。对于通过js/uts更新data然后通过v-for再创建的列表数据，不在第一批处理。

要注意一个页面静态dom元素过多，会影响页面加载速度。在uni-app x Android版本上，可能会阻碍页面进入的转场动画。 因为此时，页面转场动画还没有启动。

此时页面还未显示，没有开始进入的转场动画，页面dom还不存在。

所以这里不能直接操作dom（可以修改data，因为vue框架会等待dom准备后再更新界面）；在 app-uvue 中获取当前的activity拿到的是老页面的activity，只能通过页面栈获取activity。

onLoad比较适合的操作是：接受上页的参数，联网取数据，更新data。

手机都是多核的，uni.request或云开发联网，在子线程运行，不会干扰UI线程的入场动画，并行处理可以更快的拿到数据、渲染界面。

但onLoad里不适合进行大量同步耗时运算，因为此时转场动画还没开始。

尤其uni-app x 在 Android上，onLoad里的代码（除了联网和加载图片）默认是在UI线程运行的，大量同步耗时计算很容易卡住页面动画不启动。除非开发者显式指定在其他线程运行。

新页面开始进入的转场动画，动画默认耗时300ms，可以在路由API中调节时长。

第2步创建dom是虚拟dom，dom创建后需要经历一段时间，UI层才能完成了页面上真实元素的创建，即触发了onReady。

onReady后，页面元素就可以自由操作了，比如ref获取节点。同时首批界面也渲染了。

注意：onReady和转场动画开始、结束之间，没有必然的先后顺序，完全取决于dom的数量和复杂度。

如果元素排版和渲染够快，转场动画刚开始就渲染好了；

大多情况下，转场动画走几格就看到了首批渲染内容；

如果元素排版和渲染过慢，转场动画结束都没有内容，就会造成白屏。

联网进程从onLoad起就在异步获取数据更新data，如果服务器速度够快，第二批数据也可能在转场动画结束前渲染。

再次强调，5和6的先后顺序不一定，取决于首批dom渲染的速度。

了解了页面加载时序原理，我们就知道如何避免页面加载常见的问题：

a页面刚进入时，会触发a页面的onShow。

当a跳转到b页面时，a会触发onHide，而b会触发onShow。

但当b被关闭时，b会触发onUnload，此时a再次显示出现，会再次触发onShow。

在tabbar页面（指pages.json里配置的tabbar），不同tab页面互相切换时，会触发各自的onShow和onHide。

可在pages.json里定义具体页面底部的触发距离onReachBottomDistance，

比如设为50，那么滚动页面到距离底部50px时，就会触发onReachBottom事件。

如使用scroll-view导致页面没有滚动，则触底事件不会被触发。scroll-view滚动到底部的事件请参考scroll-view的文档。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

详细说明及使用：onBackPress 详解

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app 组件支持的生命周期，与vue标准组件的生命周期相同。这里没有页面级的onLoad等生命周期：

getApp() 函数用于获取当前应用实例，一般用于获取globalData。也可通过应用实例调用 App.vue methods 中定义的方法。

示例源码如下，请查看 pre > code 标签中的内容

getCurrentPages() 函数用于获取当前页面栈的实例，以数组形式按栈的顺序给出，数组中的元素为页面实例，第一个元素为首页，最后一个元素为当前页面。

getCurrentPages() 仅用于展示页面栈的情况，请勿修改页面栈，以免造成页面状态错误。 页面关闭时，对应页面实例会在页面栈中删除。

uni-app 在 getCurrentPages()获得的页面里内置了一个方法 $getAppWebview() 可以得到当前webview的对象实例，从而实现对 webview 更强大的控制。在 html5Plus 中，plus.webview具有强大的控制能力，可参考：WebviewObject 。

但uni-app框架有自己的窗口管理机制，请不要自己创建和销毁webview，如有需求覆盖子窗体上去，请使用原生子窗体subNvue。

示例源码如下，请查看 pre > code 标签中的内容

getCurrentPages()可以得到所有页面对象，然后根据数组，可以取指定的页面webview对象

示例源码如下，请查看 pre > code 标签中的内容

uni-app自带的web-view组件，是页面中新插入的一个子webview。获取该对象的方法见：https://ask.dcloud.net.cn/article/35036

触发全局的自定义事件。附加参数都会传给监听器回调。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件。事件可以由 uni.$emit 触发，回调函数会接收所有传入事件触发函数的额外参数。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件。事件可以由 uni.$emit 触发，但是只触发一次，在第一次触发之后移除监听器。

示例源码如下，请查看 pre > code 标签中的内容

$emit、$on、$off常用于跨页面、跨组件通讯，这里为了方便演示放在同一个页面

示例源码如下，请查看 pre > code 标签中的内容

uni-app页面路由为框架统一管理，开发者需要在pages.json里配置每个路由页面的路径及页面样式。类似小程序在 app.json 中配置页面路由一样。所以 uni-app 的路由用法与 Vue Router 不同，如仍希望采用 Vue Router 方式管理路由，可在插件市场搜索 Vue-Router 。

uni-app 有两种页面路由跳转方式：使用navigator组件跳转、调用API跳转。

页面返回时会自动关闭 loading 及 toast, modal 及 actionSheet 不会自动关闭。 页面关闭时，只是销毁了页面实例，未完成的网络请求、计时器等副作用需开发者自行处理。

框架以栈的形式管理当前所有页面， 当发生路由切换的时候，页面栈的表现如下：

uni-app 支持在 template 模板中嵌套 <template/> 和 <block/>，用来进行 条件渲染 和 列表渲染。

<template/> 和 <block/> 并不是一个组件，它们仅仅是一个包装元素，不会在页面中做任何渲染，只接受控制属性。

<block/> 在不同的平台表现存在一定差异，推荐统一使用 <template/>。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

基于原生引擎的渲染，虽然还是前端技术栈，但和 web 开发肯定是有区别的。

**Examples:**

Example 1 (php):
```php
pages.json -> pages
```

Example 2 (php):
```php
pages.json -> pages
```

Example 3 (php):
```php
pages.json -> pages
```

Example 4 (json):
```json
{
	"pages": [
		{
			"path": "pages/index/index", //名字叫不叫index无所谓，位置在第一个，就是首页
			"style": {
				"navigationBarTitleText": "首页" //页面标题
			}
		},
		{
			"path": "pages/my",
			"style": {
				"navigationBarTitleText": "我的"
			}
		},
	]
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth.html

**Contents:**
      - 本页导读

App端OAuth(登录鉴权)模块封装了市场上主流的三方登录SDK，提供JS API统一调用登录鉴权功能。

如果服务端使用uniCloud ，官方提供了uni-id 云端统一登录服务，把微信登录、短信验证码登录及角色权限管理等服务端登录开发，进行了统一的封装。前端统一的uni.login和云端统一的uni-id搭配，可以极大提升登录业务的开发效率，强烈推荐给开发者使用。

使用登录鉴权功能需在项目manifest.json的“App模块配置”中勾选“OAuth(登录鉴权)”，并根据项目实际情况勾选使用的三方登录平台：

提示：三方登录模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-components.html

**Contents:**
- # 概念
- # 优势
- # 注册
  - # 全局注册
  - # 局部注册
- # props
      - # 示例：
  - # 传递静态或动态的 Prop
  - # 单向数据流
  - # Prop 验证

已经了解 Vue 2，只想了解 Vue 3 的新功能可以参阅vue3新功能 ！

已经有 Vue 2项目，需要适配 Vue 3 的可参阅vue2 项目迁移 vue3 ！

下面是一个基本组件示例，在根<view>组件下再次引入一个<view>组件，并给组件的text区绑定一个data。

示例源码如下，请查看 pre > code 标签中的内容

基础组件是内置在uni-app框架中的，包括view、text、input、button、video等几十个基础组件，列表详见：uni-app基础组件

但仅有基础组件是不够用的，实际开发中会有很多封装的组件。

比如我们需要一个五角星点击评分的组件，在DCloud的插件市场里可以获取到：https://ext.dcloud.net.cn/plugin?id=33

把这个uni-rate组件导入到你的uni-app项目下，在需要的vue页面里引用它，就可以在指定的地方显示出这个五角星组件。

示例源码如下，请查看 pre > code 标签中的内容

在注册一个组件的时候，我们始终需要给它一个名字。 定义组件名的方式有两种：

当使用 kebab-case (短横线分隔命名) 定义一个组件时，你也必须在引用这个自定义元素时使用 kebab-case，例如 <my-component-name>。

当使用 PascalCase (首字母大写命名) 定义一个组件时，你在引用这个自定义元素时两种命名法都可以使用。 也就是说 <my-component-name> 和 <MyComponentName> 都是可接受的。

在uni-app工程根目录下的 components 目录，创建并存放自定义组件：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 支持配置全局组件，需在 main.js 里进行全局注册，注册后就可在所有页面里使用该组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

局部注册之前，在需要引用该组件的页面，导入你想使用的组件。

如下通过两种方式导入一个角标的组件库，详见 ，推荐使用 easycom 方式引入。

示例源码如下，请查看 pre > code 标签中的内容

对于 components 对象中的每个 property 来说，其 property 名就是自定义元素的名字，其 property 值就是这个组件的选项对象。

在对象中放一个类似 uniBadge 的变量名其实是 uniBadge : uniBadge 的缩写，即这个变量名同时是：

示例源码如下，请查看 pre > code 标签中的内容

easycom是自动开启的，不需要手动开启，有需求时可以在 pages.json 的 easycom 节点进行个性化设置，详见 。

不管components目录下安装了多少组件，easycom打包后会自动剔除没有使用的组件，对组件库的使用尤为友好。

组件是 vue 技术中非常重要的部分，组件使得与ui相关的轮子可以方便的制造和共享，进而使得 vue 使用者的开发效率大幅提升。

uni-app 搭建了组件的插件市场，有很多现成的组件，若下载符合components/组件名称/组件名称.vue目录结构的组件，均可直接使用。uni-app插件市场

uni-app只支持 vue单文件组件（.vue 组件）。其他的诸如：动态组件，自定义 render ，和 <script type="text/x-template"> 字符串模版等，在非H5端不支持。

props 可以是数组或对象，用于接收来自父组件的数据。props 可以是简单的数组，或者使用对象作为替代，对象允许配置高级选项，如类型检测、自定义验证和设置默认值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在上述两个示例中，我们传入的值都是字符串类型的，但实际上任何类型的值都可以传给一个 prop。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果你想要将一个对象的所有 property 都作为 prop 传入，你可以使用不带参数的 v-bind (取代 v-bind:prop-name)。例如，对于一个给定的对象 post：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

所有的 prop 都使得其父子 prop 之间形成了一个单向下行绑定： 父级 prop 的更新会向下流动到子组件中，但是反过来则不行。这样会防止从子组件意外变更父级组件的状态，从而导致你的应用的数据流向难以理解。

每次父级组件发生变更时，子组件中所有的 prop 都将会刷新为最新的值。这意味着你不应该在一个子组件内部改变 prop。如果你这样做了，Vue 会在浏览器的控制台中发出警告。

这里有两种常见的试图变更一个 prop 的情形：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意在 JavaScript 中对象和数组是通过引用传入的，所以对于一个数组或对象类型的 prop 来说，在子组件中改变变更这个对象或数组本身将会影响到父组件的状态。

我们可以为组件的 prop 指定验证要求，例如你知道的这些类型。如果有一个需求没有被满足，则 Vue 会在浏览器控制台中警告你。这在开发一个会被别人用到的组件时尤其有帮助。

为了定制 prop 的验证方式，你可以为 props 中的值提供一个带有验证需求的对象，而不是一个字符串数组。例如：

示例源码如下，请查看 pre > code 标签中的内容

当 prop 验证失败的时候，(开发环境构建版本的) Vue 将会产生一个控制台的警告。

注意那些 prop 会在一个组件实例创建之前进行验证，所以实例的 property (如 data、computed 等) 在 default 或 validator 函数中是不可用的。

type 可以是下列原生构造函数中的一个：

此外，type 还可以是一个自定义的构造函数，并且通过 instanceof 来进行检查确认。例如，给定下列现成的构造函数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于验证 author prop 的值是否是通过 new Person 创建的。

HTML 中的 attribute 名是大小写不敏感的，所以浏览器会把所有大写字符解释为小写字符。这意味着当你使用 DOM 中的模板时，camelCase (驼峰命名法) 的 prop 名需要使用其等价的 kebab-case (短横线分隔命名) 命名：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一个非 prop 的 attribute 是指传向一个组件，但是该组件并没有相应 props 或 emits 定义的 attribute。常见的示例包括 class、style 和 id 属性。

当组件返回单个根节点时，非 prop attribute 将自动添加到根节点的 attribute 中。例如，在 <date-picker> 组件的实例中：

示例源码如下，请查看 pre > code 标签中的内容

如果我们需要通过 data status property 定义 <date-picker> 组件的状态，它将应用于根节点 (即 div.date-picker)。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当有一个 HTML 元素将 change 事件作为 date-picker 的根元素时，这可能会有帮助。

示例源码如下，请查看 pre > code 标签中的内容

在这种情况下，change 事件监听器从父组件传递到子组件，它将在原生 select 的 change 事件上触发。我们不需要显式地从 date-picker 发出事件：

示例源码如下，请查看 pre > code 标签中的内容

如果你不希望组件的根元素继承 attribute，你可以在组件的选项中设置 inheritAttrs: false。例如：

禁用 attribute 继承的常见情况是需要将 attribute 应用于根节点之外的其他元素。

通过将 inheritAttrs 选项设置为 false，你可以访问组件的 $attrs property，该 property 包括组件 props 和 emits property 中未包含的所有属性 (例如，class、style、v-on 监听器等)。

使用上一节中的 date-picker 组件示例，如果需要将所有非 prop attribute 应用于 input 元素而不是根 div 元素，则可以使用 v-bind 缩写来完成。

示例源码如下，请查看 pre > code 标签中的内容

有了这个新配置，data status attribute 将应用于 input 元素！

示例源码如下，请查看 pre > code 标签中的内容

与单个根节点组件不同，具有多个根节点的组件不具有自动 attribute 回退行为（小程序不支持）。如果未显式绑定 $attrs，将发出运行时警告。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

不同于组件和 prop，事件名不存在任何自动化的大小写转换。而是触发的事件名需要完全匹配监听这个事件所用的名称。举个例子，如果触发一个 camelCase (驼峰命名法) 名字的事件：

示例源码如下，请查看 pre > code 标签中的内容

则监听这个名字的 kebab-case (短横线隔开式) 版本是不会有任何效果的：

示例源码如下，请查看 pre > code 标签中的内容

不同于组件和 prop，事件名不会被用作一个 JavaScript 变量名或 property 名，所以就没有理由使用 camelCase (驼峰命名法) 或 PascalCase(帕斯卡命名法) 了。并且 v-on 事件监听器在 DOM 模板中会被自动转换为全小写 (因为 HTML 是大小写不敏感的)，所以 @myEvent 将会变成 @myevent——导致 myEvent 不可能被监听到。

因此，我们推荐你始终使用 kebab-case (短横线隔开式) 的事件名。

可以通过 emits 选项在组件上定义已发出的事件。

示例源码如下，请查看 pre > code 标签中的内容

当在 emits 选项中定义了原生事件 (如 click) 时，将使用组件中的事件替代原生事件侦听器。

建议定义所有发出的事件，以便更好地记录组件应该如何工作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

与 prop 类型验证类似，如果使用对象语法而不是数组语法定义发出的事件，则可以验证它。

要添加验证，将为事件分配一个函数，该函数接收传递给 $emit 调用的参数，并返回一个布尔值以指示事件是否有效。

示例源码如下，请查看 pre > code 标签中的内容

默认情况下，组件上的 v-model 使用 modelValue 作为 prop 和 update:modelValue 作为事件。我们可以通过向 v-model 传递参数来修改这些名称：

示例源码如下，请查看 pre > code 标签中的内容

在本例中，子组件将需要一个 foo prop 并发出 update:foo 要同步的事件：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过利用以特定 prop 和事件为目标的能力，正如我们之前在 v-model 参数中所学的那样，我们现在可以在单个组件实例上创建多个 v-model 绑定。

每个 v-model 将同步到不同的 prop，而不需要在组件中添加额外的选项：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

让我们创建一个示例自定义修饰符 capitalize，它将 v-model 绑定提供的字符串的第一个字母大写。

添加到组件 v-model 的修饰符将通过 modelModifiers prop 提供给组件。在下面的示例中，我们创建了一个组件，其中包含默认为空对象的 modelModifiers prop。

请注意，当组件的 created 生命周期钩子触发时，modelModifiers prop 包含 capitalize，其值为 true——因为它被设置在 v-model 绑定 v-model.capitalize="bar"。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对于带参数的 v-model 绑定，生成的 prop 名称将为 arg + "Modifiers"：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Vue 实现了一套内容分发的 API，这套 API 的设计灵感源自 Web Components 规范草案 ，将 <slot> 元素作为承载分发内容的出口。

示例源码如下，请查看 pre > code 标签中的内容

然后在 todo-button 的模板中，你可能有：

示例源码如下，请查看 pre > code 标签中的内容

当组件渲染的时候，将会被替换为“Add Todo”。

示例源码如下，请查看 pre > code 标签中的内容

不过，字符串只是开始！插槽还可以包含任何模板代码，包括 HTML：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果 todo-button 的 template 中没有包含一个 slot 元素，则该组件起始标签和结束标签之间的任何内容都会被抛弃

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

该插槽可以访问与模板其余部分相同的实例 property (即相同的“作用域”)。

插槽不能访问 todo-button 的作用域。例如，尝试访问 action 将不起作用：

示例源码如下，请查看 pre > code 标签中的内容

作为一条规则，请记住： 父级模板里的所有内容都是在父级作用域中编译的；子模板里的所有内容都是在子作用域中编译的。

有时为一个插槽设置具体的后备 (也就是默认的) 内容是很有用的，它只会在没有提供内容的时候被渲染。例如在一个 submit-button 组件中：

示例源码如下，请查看 pre > code 标签中的内容

我们可能希望这个 button 内绝大多数情况下都渲染文本“Submit”。为了将“Submit”作为后备内容，我们可以将它放在 slot 标签内：

示例源码如下，请查看 pre > code 标签中的内容

现在当我在一个父级组件中使用 submit-button 并且不提供任何插槽内容时：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

则这个提供的内容将会被渲染从而取代后备内容：

示例源码如下，请查看 pre > code 标签中的内容

有时我们需要多个插槽。例如对于一个带有如下模板的 base-layout 组件：

示例源码如下，请查看 pre > code 标签中的内容

对于这样的情况，slot 元素有一个特殊的 attribute：name。这个 attribute 可以用来定义额外的插槽：

示例源码如下，请查看 pre > code 标签中的内容

一个不带 name 的 slot 出口会带有隐含的名字“default”。

在向具名插槽提供内容的时候，我们可以在一个 template 元素上使用 v-slot 指令，并以 v-slot 的参数的形式提供其名称：

示例源码如下，请查看 pre > code 标签中的内容

现在 template 元素中的所有内容都将会被传入相应的插槽。

示例源码如下，请查看 pre > code 标签中的内容

注意，v-slot 只能添加在 template 上 (只有一种例外情况)

跟 v-on 和 v-bind 一样，v-slot 也有缩写，即把参数之前的所有内容 (v-slot:) 替换为字符 #。例如 v-slot:header 可以被重写为 #header：

示例源码如下，请查看 pre > code 标签中的内容

然而，和其它指令一样，该缩写只在其有参数的时候才可用。这意味着以下语法是无效的：

示例源码如下，请查看 pre > code 标签中的内容

如果你希望使用缩写的话，你必须始终以明确插槽名取而代之：

示例源码如下，请查看 pre > code 标签中的内容

有时让插槽内容能够访问子组件中才有的数据是很有用的。当一个组件被用来渲染一个项目数组时，这是一个常见的情况，我们希望能够自定义每个项目的渲染方式。

例如，我们有一个组件，包含 todo-items 的列表。

示例源码如下，请查看 pre > code 标签中的内容

我们可能需要替换插槽以在父组件上自定义它：

示例源码如下，请查看 pre > code 标签中的内容

但是，这是行不通的，因为只有 todo-list 组件可以访问 item，我们将从其父组件提供槽内容。

要使 item 可用于父级提供的 slot 内容，我们可以添加一个 slot 元素并将其绑定为属性：

示例源码如下，请查看 pre > code 标签中的内容

绑定在 slot 元素上的 attribute 被称为插槽 prop。现在在父级作用域中，我们可以使用带值的 v-slot 来定义我们提供的插槽 prop 的名字：

示例源码如下，请查看 pre > code 标签中的内容

在这个例子中，我们选择将包含所有插槽 prop 的对象命名为 slotProps，但你也可以使用任意你喜欢的名字。

在上述情况下，当被提供的内容只有默认插槽时，组件的标签才可以被当作插槽的模板来使用。这样我们就可以把 v-slot 直接用在组件上：

示例源码如下，请查看 pre > code 标签中的内容

这种写法还可以更简单。就像假定未指明的内容对应默认插槽一样，不带参数的 v-slot 被假定对应默认插槽：

示例源码如下，请查看 pre > code 标签中的内容

注意默认插槽的缩写语法不能和具名插槽混用，因为它会导致作用域不明确：

示例源码如下，请查看 pre > code 标签中的内容

只要出现多个插槽，请始终为所有的插槽使用完整的基于 template 的语法：

示例源码如下，请查看 pre > code 标签中的内容

作用域插槽的内部工作原理是将你的插槽内容包括在一个传入单个参数的函数里：

示例源码如下，请查看 pre > code 标签中的内容

这意味着 v-slot 的值实际上可以是任何能够作为函数定义中的参数的 JavaScript 表达式。你也可以使用 ES2015 解构来传入具体的插槽 prop，如下：

示例源码如下，请查看 pre > code 标签中的内容

这样可以使模板更简洁，尤其是在该插槽提供了多个 prop 的时候。它同样开启了 prop 重命名等其它可能，例如将 item 重命名为 todo：

示例源码如下，请查看 pre > code 标签中的内容

你甚至可以定义后备内容，用于插槽 prop 是 undefined 的情形：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中以下这些作为保留关键字，不可作为组件名。

**Examples:**

Example 1 (html):
```html
<template>
		<view>
			<text>{{userName}}</text>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 2 (html):
```html
<template>
		<view>
			<text>{{userName}}</text>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 3 (html):
```html
<template>
		<view>
			<text>{{userName}}</text>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 4 (vue):
```vue
<template>
		<view>
			<text>{{userName}}</text>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/intro.html

**Contents:**
- # 概述
      - 本页导读

自 HBuilderX 4.27 版本开始，uni-app 支持Harmony Next平台的App开发。

目前仅支持 vue3 项目编译到鸿蒙平台，vue2 项目升级 vue3 项目请参考：vue2 项目迁移到 vue3

本专题旨在介绍如何使用 uni-app 框架开发适用于Harmony Next操作系统的应用，帮助开发者快速掌握鸿蒙应用的开发方法。

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 4.27
```

Example 2 (unknown):
```unknown
Harmony Next
```

Example 3 (unknown):
```unknown
Harmony Next
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-weixin-plugin-dev.html

**Contents:**
    - # 插件目录结构
    - # 插件配置文件
    - # 编译步骤
    - # 如何在项目中使用插件
    - # 在插件中使用条件编译
      - 本页导读

本文档意在介绍如何把 uni-app 项目编译为小程序插件，如果想了解如何在 uni-app 中引用和使用小程序插件，另见文档：使用小程序插件

小程序插件规范由小程序厂商定义，插件是对一组 js 接口、自定义组件或页面的封装，用于嵌入到小程序中使用。

uni-app 不仅仅可以开发完整的小程序，也可以编译为小程序插件。

示例源码如下，请查看 pre > code 标签中的内容

plugin.json 在 uni-app 项目中和 pages.json 同级。向第三方小程序开放的所有组件、页面和 js 接口都必须在 plugin.json 中声明

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

有时候项目不仅要编译到插件，也需要作为一个正常的小程序运行，但有些 api 并不适用于两端，此时可以使用自定义条件编译区分开来。

自定义条件编译（详情），在package.json中添加如以下配置：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

编译时执行命令：yarn dev:custom mp-wx-plugin --plugin test-plugin 即可，可将脚本写入script中，每次执行更加简化。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
plugin
├── components               // 插件提供的自定义组件（可以有多个）
│   ├── hello-component.js
│   ├── hello-component.json
│   ├── hello-component.wxml
│   └── hello-component.wxss
├── pages
│   ├── hello-page.js        // 插件提供的页面（可以有多个）
│   ├── hello-page.json
│   ├── hello-page.wxml
│   └── hello-page.wxss
├── index.js                 // 插件的 js 接口
└── plugin.json              // 插件配置文件
```

Example 2 (unknown):
```unknown
plugin
├── components               // 插件提供的自定义组件（可以有多个）
│   ├── hello-component.js
│   ├── hello-component.json
│   ├── hello-component.wxml
│   └── hello-component.wxss
├── pages
│   ├── hello-page.js        // 插件提供的页面（可以有多个）
│   ├── hello-page.json
│   ├── hello-page.wxml
│   └── hello-page.wxss
├── index.js                 // 插件的 js 接口
└── plugin.json              // 插件配置文件
```

Example 3 (unknown):
```unknown
plugin
├── components               // 插件提供的自定义组件（可以有多个）
│   ├── hello-component.js
│   ├── hello-component.json
│   ├── hello-component.wxml
│   └── hello-component.wxss
├── pages
│   ├── hello-page.js        // 插件提供的页面（可以有多个）
│   ├── hello-page.json
│   ├── hello-page.wxml
│   └── hello-page.wxss
├── index.js                 // 插件的 js 接口
└── plugin.json              // 插件配置文件
```

Example 4 (unknown):
```unknown
plugin
├── components               // 插件提供的自定义组件（可以有多个）
│   ├── hello-component.js
│   ├── hello-component.json
│   ├── hello-component.wxml
│   └── hello-component.wxss
├── pages
│   ├── hello-page.js        // 插件提供的页面（可以有多个）
│   ├── hello-page.json
│   ├── hello-page.wxml
│   └── hello-page.wxss
├── index.js                 // 插件的 js 接口
└── plugin.json              // 插件配置文件
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-sec-android.html

**Contents:**
  - # 安全漏洞风险问题的处理原则
    - # HBuilderX3.1.14版本修复安全相关问题
  - # 常见的安全漏洞风险的解决方案
    - # Webview绕过证书校验漏洞 及 Android主机名\证书弱校验风险
    - # Activity、Service、Receiver等组件导出风险
    - # 应用签名未校验风险
    - # APK可被反编译后取得源代码风险
    - # WebView远程代码执行漏洞
    - # 密钥硬编码漏洞
    - # SO文件破解风险漏洞

近期收到开发者反馈将uni-app/5+ App项目打包Android平台App提交到腾讯云、百度云、爱加密等安全平台检测出存在漏洞风险，对于反馈的漏洞风险问题我们一直在持续跟进并积极寻找解决方案修复。

首先我们需要理解漏洞风险并不代表真实存在安全漏洞，比如WebView远程代码执行漏洞，仅在Android4.2及以下版本系统存在，目前HBuilderX发现App最低要求版本Android4.4；比如Activity、Service、Receiver等组件导出风险，有些功能依赖的组件必须设置为导出，实际上并不存在安全问题。而安全平台会把所有可能存在的漏洞或风险都列出来，很多安全问题都可能是误报或夸大了安全漏洞的隐患。

因此对于存在漏洞风险问题的基本解决方案是使用APK加固，推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

如果加固还不能解决问题，或者安全平台要求加固前进行检测，请在官方论坛ask 发帖反馈，添加话题为“安全漏洞”、“安全检测”，上传完整安全检测报告及检测的apk文件。

对于反馈的安全漏洞问题我们会根据风险等级，优先解决高风险和中风险问题 对于低风险问题，理论上不会影响应用的安全质量，因此通常情况下不会解决低风险安全漏洞问题。

首先我们需要判断风险漏洞是哪些代码引起的，可以通过安全检测报告中漏洞详情中的漏洞代码类名进行判断，如果是以"io.dcloud"开头则表示是DCloud的代码，如下： 如果是以其它字符开头，则表示是三方SDK或uni原生插件的代码，如下：

修复方案 HBuilderX3.1.14+版本新增untrustedca节点配置是否允许使用非受信证书。 在项目manifest.json中"app-plus"->"ssl"节点下配置"untrustedca"为"refuse"，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

风险描述 APP的Activity、Service、Receiver等组件可以在AndroidManifest.xml中通过配置属性android:exported设置 为私有（false）或公有（true），设置为公有时则认为组件对外导出，可以被其它任何程序的任何组件访问。导出的组件可能被第三方App恶意调用，可能返回隐私信息给恶意应用，造成数据泄露；可能导致应用崩溃，造成拒绝服务等漏洞。

修复方案 HBuilderX3.1.14+版本已经将DCloud管理的代码中所有不需要被外部访问的组件都设置为私有（即android:exported属性值设置为false），仅将需要被外部访问的组件，如App入口Activity（io.dcloud.PandoraEntry）设置为公有。

另外需要注意，一些三方SDK因为功能需要会将其组件设置为对外导出，如下：

风险描述 签名证书是对App开发者身份的唯一标识，如果程序未对签名证书进行校验，可能被反编译后进行二次打包使用其它签名证书重新签名。如重新签名的App可以正常启动，则可能导致App被仿冒盗版，影响其合法收入，甚至可能被添加钓鱼代码、病毒代码、恶意代码，导致用户敏感信息泄露或者恶意攻击。

修复方案 对APK进行加固，推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

风险描述 说的打包为App的原生APK可以被反编译获取Java源代码。

修复方案 对APK进行加固，推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

风险描述 用该漏洞可以根据客户端能力实现远程任意代码执行攻击。 WebView 远程代码执行漏洞触发前提条件：

修复方案 HBuilderX发布到App的Android平台最低支持Android4.4，即minSdkVersion大于等于19。也就是说Android4.4及以上版本并不存在此漏洞，如果你的项目配置了minSdkVersion低于19，则请参考https://ask.dcloud.net.cn/article/193 修改。

风险描述 应用程序在加解密时，使用硬编码在程序中的密钥，攻击者通过反编译拿到密钥可以轻易解密APP通信数据

修复方案 HBuilderX3.1.14+版本已修复此问题，在内部逻辑中使用的密钥全部做了混淆加密处理。

风险描述 SO文件为APK中包含的动态链接库文件，Android利用NDK技术将C/C++语言实现的核心代码编译为SO库文件供Java层调用。SO文件被破解可能导致应用的核心功能代码和算法泄露。攻击者利用核心功能与算法可轻易抓取到客户端的敏感数据，并对其解密，导致用户的隐私泄露或直接财产损失

修复方案 对APK中的SO文件进行加固保护,推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

风险描述 StrandHogg之所以独特，是因为它无需进行植根即可启用复杂的攻击，它利用Android的多任务系统中的一个弱点来实施强大的攻击，使恶意应用程序可以伪装成该设备上的任何其他应用程序。此漏洞利用基于一个称为“ taskAffinity”的Android控件设置，该控件允许任何应用程序（包括恶意应用程序）自由地采用其所需的多任务处理系统中的任何身份。

修复方案 该漏洞已于2020.4.1的安全补丁中修复(涵盖Android 8.0 / 8.1 / 9.0+)。由于已经通过系统补丁封堵。理论上该漏洞不会对高版本系统的手机设备构成威胁。 而app客户端开发并没有彻底规避该漏洞的方案。各检测平台推荐配置android:taskAffinity=“”，但仅是临时方案。但该方案会导致应用运行到android11+系统设备时任务堆栈窗口变成两个的问题。 由于android:taskAffinity=“”配置存在bug！所以我们并不会默认这样配置。但为开发者提供的云打包配置选项。由开发者决定是否配置临时封堵该漏洞。具体如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

风险描述 从Nougat(Android 7) 一个名为“Network Security Configuration'的新安全功能也随之而来。如果应用程序的 SDK高于或等于24，则只有系统证书才会被信任。Android Network Security Configuration 功能提供了一个简单的层，用来保护应用程序在未加密的明文中意外传输的敏感数据。可以针对特定域和特定应用配置这些设置。如缺少networkSecurityConfig 特性，应用程序将使用系统默认安全配置，致使应用程序在不安全的定制 ROM 上运行时可能遭受恶意网络攻击。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
WebView File域同源策略绕过漏洞
```

Example 2 (unknown):
```unknown
Android平台WebView控件跨域访问高危漏洞
```

Example 3 (unknown):
```unknown
Webview绕过证书校验漏洞
```

Example 4 (unknown):
```unknown
Android主机名\证书弱校验风险
```

---

## uts Android调试 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/uni-uts-debug.html

**Contents:**
- # uts Android调试
- # 开启调试
- # 添加/删除断点
- # 调试视图
- # 调试操作
- # 数据检查和查看变量
  - # 添加到监视
  - # 悬停显示
- # 注意事项
- # 故障排查指南

uts在Android上的调试，包括3部分：

uts、uvue、kt，这三种文件，本质上都是在调试运行时的kt文件。

HBuilderX中可以对这3种文件打断点，联编、跨语言、跨文件跳转断点。

如下Gif动画所示，运行uni-app uts项目到Android，运行成功后，HBuilder控制台点击红色虫子图标，下拉菜单选择【uts调试】，即可开启uts调试功能。

注意：如果需要触发应用初始化中的断点，比如App.uvue的onLaunch中，需要点击红色虫子图标右边的重启应用按钮，重启之后应用初始化中的断点才会生效

注意：目前部分变量的显示可能还是以kotlin的方式显示，因为uts编译结果是kotlin

如果需要调试kt代码的话，需要安装插件kotlin-language。(在打开kt文件时hx会自动提示需要安装该插件)

注意：断点时App可能会出现Application Not Responding(应用无响应)的弹框(部分机型的表现是app会重启)，这是因为调试默认是以Attach的方式连接，Android系统不允许UI线程被阻塞太长时间，点击下一步或者断点结束时该弹框会自动消失。(开启断点之后点击点击红色虫子图标右边的重启应用按钮会以调试模式启动, 此时断点时不会出现应用无响应的弹框)

打开要调试的uts文件，在代码行号上，鼠标右击或双击添加断点。

开启调试后，即可在HBuilderX左侧视图，看到调试视图，具体如下：

下图中包含了uvue、uts、kotlin的调试步骤

在【变量窗口】，选中变量，右键菜单，即可将变量添加到监视窗口。

断点调试过程中，将鼠标悬停在要查看的变量上，即可打开悬停窗口。

1、默认打开调试时app并不是以调试模式启动的，这可能会造成一些问题，比如Application Not Responding,也就是应用程序无响应。表现为: 出现弹框显示程序无响应。部分手机可能会出现卡顿或者各种奇怪问题，这是因为有的手机厂商并不希望去调试没有开启调试模式的app。

解决办法: 在debug开启之后需要点击红色虫子图标右边的重启应用按钮，这时候app会以调试模式启动。

Hx默认是以附加的方式来调试应用，这样的好处是用户如果默认不是以调试模式启动的app，也可以在测试途中来调试应用，而不需要重启应用再走一遍测试流程。

开启调试模式的好处是不会出现anr，同时手机厂商一般不会对开启调试模式的app做一些限制。

2、有时候监视区域或者变量区域可能无法显示变量(比如this.xxx.xxx 这时候可能无法查看xxx的内容)，目前显示的内容很多都是kotlin的展示方式，但用户肯定是希望以uts的方式展示和查看。(优化中)

3、变量区域没有显示全局变量和上一级作用域的变量信息 (优化中)

4、开启Android Studio的情况下可能导致调试连接失败

---

## 页面样式与布局 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/syntax-css.html

**Contents:**
- # 页面样式与布局
- # css预处理器支持
- # 尺寸单位
- # 样式导入
- # 内联样式
- # 选择器
- # 全局样式与局部样式
- # CSS 变量
- # 固定值
- # Flex 布局

uni-app 有 vue 页面、nvue 页面、uvue页面。

uni-app 的 css 与 web 的 css 基本一致。本文没有讲解 css 的用法。在你了解 web 的 css 的基础之上，本文讲述一些样式相关的注意事项。

本文重点介绍 vue 页面，也就是webview中的样式注意事项。

uni-app 支持less、sass、scss、stylus等预处理器。

sass的预处理器，早年使用node-sass ，也就是vue2最初默认的编译器。

sass官方 推出了dart-sass来替代。node-sass已经停维很久了。

另外node-sass不支持arm cpu，也即Apple的M系列CPU，导致HBuilderX的arm版只能使用dart-sass。

node-sass有些淘汰的写法，在dart-sass里已不再支持。

所以开发者在从vue2升vue3时，使用HBuilderX arm版时，会发现老的vue2项目如果写了废弃scss语法，会编译报错。

这种分裂也导致插件生态混乱，导致多人协作时，比如一个项目有人用arm专版，有人使用intel版，造成协作障碍。

DCloud推荐开发者尽快升级到vue3，改用dart-sass。

从 HBuilderX 4.56+ ，vue2 项目也将默认使用 dart-sass 预编译器。

node-sass升级dart-sass常见问题及改进方法：

解决方案：/deep/ 替换成::v-deep

解决方案：使用 math.div() 替换除法运算符 详情 ，如果遇到@use 'sass:math';编译报错，可以在uni.scss中定义，详情

解决方案：calc 在特定情况需要带单位，比如：width: calc(100% - 215) 修改为：width: calc(100% - 215px)

uni-app 支持的通用 css 单位包括 px、rpx

vue 页面支持下面这些普通 H5 单位，但在 nvue 里不支持：

App 端，在 pages.json 里的 titleNView 或页面里写的 plus api 中涉及的单位，只支持 px。注意此时不支持 rpx

nvue 中，uni-app 模式（nvue 不同编译模式介绍 ）可以使用 px 、rpx，表现与 vue 中基本一致，另外启用 dynamicRpx 后可以适配屏幕大小动态变化。weex 模式目前遵循 weex 的单位，它的单位比较特殊：

设计师在提供设计图时，一般只提供一个分辨率的图。

严格按设计图标注的 px 做开发，在不同宽度的手机上界面很容易变形。

而且主要是宽度变形。高度一般因为有滚动条，不容易出问题。由此，引发了较强的动态宽度单位需求。

微信小程序设计了 rpx 解决这个问题。uni-app 在 App 端、H5 端都支持了 rpx，并且可以配置不同屏幕宽度的计算方式，具体参考：rpx 计算配置 。

rpx 是相对于基准宽度的单位，可以根据屏幕宽度进行自适应。uni-app 规定屏幕基准宽度 750rpx。

开发者可以通过设计稿基准宽度计算页面元素 rpx 值，设计稿 1px 与框架样式 1rpx 转换公式如下：

设计稿 1px / 设计稿基准宽度 = 框架样式 1rpx / 750rpx

换言之，页面元素宽度在 uni-app 中的宽度计算公式：

750 * 元素在设计稿中的宽度 / 设计稿基准宽度

使用@import语句可以导入外联样式表，@import后跟需要导入的外联样式表的相对路径，用;表示语句结束。

示例源码如下，请查看 pre > code 标签中的内容

框架组件上支持使用 style、class 属性来控制组件的样式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中不能使用 * 选择器。

微信小程序自定义组件中仅支持 class 选择器

示例源码如下，请查看 pre > code 标签中的内容

web端可以使用html、body、:root等选择器。由于页面的css样式隔离，且html节点并未添加data-xxx属性，html、:root写在页面style内无效，只能写在App.vue内。

定义在 App.vue 中的样式为全局样式，作用于每一个页面。在 pages 目录下 的 vue 文件中定义的样式为局部样式，只作用在对应的页面，并会覆盖 App.vue 中相同的选择器。

快速书写 css 变量的方法是：在 css 中敲 hei，在候选助手中即可看到 3 个 css 变量。（HBuilderX 1.9.6 以上支持）

示例 1 - 普通页面使用 css 变量：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例 2 - nvue 页面获取状态栏高度

示例源码如下，请查看 pre > code 标签中的内容

uni-app 中以下组件的高度是固定的，不可修改：

各小程序平台，包括同小程序平台的 iOS 和 Android 的高度也不一样。

为支持跨平台，框架建议使用 Flex 布局，关于 Flex 布局可以参考外部文档A Complete Guide to Flexbox 、阮一峰的 flex 教程 等。

uni-app 支持使用在 css 里设置背景图片，使用方式与普通 web 项目大体相同，但需要注意以下几点：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 支持使用字体图标，使用方式与普通 web 项目相同，需要注意以下几点：

示例源码如下，请查看 pre > code 标签中的内容

nvue中不可直接使用 css 的方式引入字体文件，需要使用以下方式在 js 内引入。nvue 内不支持本地路径引入字体，请使用网络链接或者base64形式。src字段的url的括号内一定要使用单引号。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (yaml):
```yaml
width: calc(100% - 215)
```

Example 3 (yaml):
```yaml
width: calc(100% - 215px)
```

Example 4 (unknown):
```unknown
设计稿 1px / 设计稿基准宽度 = 框架样式 1rpx / 750rpx
```

---

## uni隐私合规产品简介 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-privacy-detect.html

**Contents:**
- # uni隐私合规产品简介
- # 应用场景
  - # 应用上架前隐私检测
  - # 应用合规检测
- # 计费规则
- # 使用指南
- # 常见问题
      - 本页导读

uni隐私合规检测是DCloud联合业内主流隐私合规检测服务商提供的移动App隐私权限检测技术。

uni隐私合规检测目前仅支持Android App，后续会扩展到iOS App。

uni隐私合规检测目前已上线蚂蚁⼩程序云版。

各大移动应用市场在应用上架前，需要对应用进行隐私检测，确保安全合规、提醒应用存在的风险

网信办、工信部等监管部门依据GB35273、164号文、《违法违规使用个人信息自评估指南》、《认定方法》等多个监管条文，防止对客户信息过度收集，进行app日常合规检测、整改、二次检测和抽检等。

对比竞对价格最优：360的检测能力，最低价位的检测3999/次，爱加密公司检测5万/次，DCloud检测150/次。

---

## uts iOS调试 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/uni-uts-debug-ios.html

**Contents:**
- # uts iOS调试
- # uni-app (x) uts插件调试
    - # 功能入口
    - # 注意事项
- # uni-app x jscore调试
    - # 功能入口
    - # 注意事项
- # 添加/删除断点
- # 调试视图
- # 调试操作

uts在iOS上的调试HBuilderX版本支持如下

uni-app (x) 的uts插件调试（iOS17以下）需 HBuilderX 3.7.6+

uni-app x 的jscore调试 HBuilderX 4.31+

uni-app (x) 的uts插件调试（iOS17以上）需 HBuilderX 4.81+

uni-app（x）项目运行到iOS，项目包含uts插件或使用原生工程基座，运行成功后，HBuilder控制台点击红色虫子图标，下拉菜单选择【开启uts调试(swift)】，即可开启uts调试(swift)功能。此功能仅Mac电脑支持。

自定义基座首次使用【开启uts调试(swift)】，需要重新编译动态库，当遇到下面的确认弹窗时，请点击【确定】按钮。

点击【开启uts调试(swift)】，uts调试(swift)显示连接成功后可能需要等待十几秒后方可使用。

调试进程codelldb会占用较大的内存。

调试模式下，uts插件修改导致重装App可能安装失败。

基座重装后如果需要再次调试需重新开启uts调试(swift)

uts调试功能，需 HBuilderX 4.31+

uni-app x项目运行到iOS，运行成功后，HBuilder控制台点击红色虫子图标，下拉菜单选择【开启uts调试(jscore)】，即可开启uts调试(jscore)功能。

打开要调试的uts文件，在代码行号上，鼠标右击或双击添加断点。

开启调试后，即可在HBuilderX左侧视图，看到调试视图，具体如下：

在【变量窗口】，选中变量，右键菜单，即可将变量添加到监视窗口。

断点调试过程中，将鼠标悬停在要查看的变量上，即可打开悬停窗口。

开启uts调试(swift)和开启uts调试(jscore)，依赖uts调试插件，弹窗提示安装依赖插件，请务必点击安装，否则无法进行调试。

---

## 鸿蒙应用、鸿蒙元服务支付 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/payment.html

**Contents:**
- # 鸿蒙应用、鸿蒙元服务支付
- # 整体流程
- # 准备工作
- # 技术联调
  - # 获取商户号信息
  - # 生成商户证书
  - # 下载华为支付证书
  - # 关联应用
  - # 修改 uni-pay 配置
  - # HBuilderX 代码开启

目前鸿蒙应用、元服务鼓励通过华为支付完成支付，本文介绍华为支付流程。

整体流程可参考 华为支付申请接入教程 申请流程

华为支付时候，用户需要选择和华为的合作身份：商户身份、平台身份。具体细节可参考 申请接入时如何选择合作身份

等待华为支付入网成功之后，开始进入技术联调阶段。

登录 华为支付商户平台 ，页面右上角会展示商户号，为一串数字，请保存，等待后续使用。

登录 华为支付商户平台 ，选择 商户中心 - 证书管理 - 上传商户证书

这个页面要求上传商户公钥。参考 《生成商户证书 》，这里推荐使用 node.js 脚本完成生成。

保存下面代码到 generateKeyPair.js。

示例源码如下，请查看 pre > code 标签中的内容

执行 node generateKeyPair.js得到返回值，返回结构如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

返回的结果手动存储，将公钥返回部分复制，存储为 payPublicKey.pem，在上传页面，选择 RSA 签名方式，上传公钥文件。

上传成功后，公钥表格会更新内容，说明这部分工作完成。请保存证书 ID 视为证书编号，后续会使用。

进入页面 证书管理 - 华为支付证书 - 下载，得到一个证书文件

示例源码如下，请查看 pre > code 标签中的内容

选择 产品功能 - AppID 管理，观察 AppID 关联列表中是否已经包含你应用的名称，检查对应的 AppID

按照提示进行关联操作，最终应当在列表中包含你的鸿蒙应用、鸿蒙元服务信息。

这里使用开源免费的 uni-pay 项目进行演示，来完成支付。

也可以直接访问 插件市场 uni-pay ，下载示例项目。

下载项目并关联 uniCloud 云服务空间。

编辑配置文件 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js，找到 huawei 节点，如果是元服务编辑 mp 节点，如果是鸿蒙应用请编辑 app 节点

示例源码如下，请查看 pre > code 标签中的内容

继续编辑 uni-pay/config.js 文件修改支付回调地址。

修改顶部 notifyUrl 参数会你的 uniCloud 地址，具体参考 支付回调配置 如何获取对应参数。

修改 manifest.json 找到 鸿蒙 App 配置 - uni-payment - 勾选华为支付。

配置签名，运行鸿蒙配置。鸿蒙元服务可直接唤起支付，鸿蒙应用如果看不到华为支付，可先添加

示例源码如下，请查看 pre > code 标签中的内容

如果上述配置，设置完成，可在鸿蒙应用、鸿蒙元服务中唤起华为支付。

如果遇到提示未正确配置回调地址，重新检查 HBuilderX 登录账号和云端登录的账号是否为同一个，避免匹配失败。

如果操作过程有疑问，可点此进入 uni-app 鸿蒙化技术交流群

**Examples:**

Example 1 (unknown):
```unknown
generateKeyPair.js
```

Example 2 (javascript):
```javascript
const crypto = require('crypto');
// 生成密钥对
const { publicKey, privateKey } = crypto.generateKeyPairSync('rsa', {
  modulusLength: 3072, // 密钥长度，不少于3072
  publicKeyEncoding: {
    type: 'spki', // 公钥编码格式
    format: 'pem', // 公钥输出格式
  },
  privateKeyEncoding: {
    type: 'pkcs8', // 私钥编码格式
    format: 'pem', // 私钥输出格式
  },
});
console.info('生成的公钥：');
console.info(publicKey);
console.info('生成的私钥：');
console.info(privateKey);
```

Example 3 (javascript):
```javascript
const crypto = require('crypto');
// 生成密钥对
const { publicKey, privateKey } = crypto.generateKeyPairSync('rsa', {
  modulusLength: 3072, // 密钥长度，不少于3072
  publicKeyEncoding: {
    type: 'spki', // 公钥编码格式
    format: 'pem', // 公钥输出格式
  },
  privateKeyEncoding: {
    type: 'pkcs8', // 私钥编码格式
    format: 'pem', // 私钥输出格式
  },
});
console.info('生成的公钥：');
console.info(publicKey);
console.info('生成的私钥：');
console.info(privateKey);
```

Example 4 (javascript):
```javascript
const crypto = require('crypto');
// 生成密钥对
const { publicKey, privateKey } = crypto.generateKeyPairSync('rsa', {
  modulusLength: 3072, // 密钥长度，不少于3072
  publicKeyEncoding: {
    type: 'spki', // 公钥编码格式
    format: 'pem', // 公钥输出格式
  },
  privateKeyEncoding: {
    type: 'pkcs8', // 私钥编码格式
    format: 'pem', // 私钥输出格式
  },
});
console.info('生成的公钥：');
console.info(publicKey);
console.info('生成的私钥：');
console.info(privateKey);
```

---

## 客户端安全API | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-sec-api.html

**Contents:**
- # 客户端安全API
  - # 应用签名标识
    - # uni-app x 项目
  - # isSimulator
    - # uni-app x 项目
  - # isSetProxy
    - # uni-app x 项目
  - # isRoot
    - # uni-app x 项目
  - # isUSBDebugging

uni-app和5+App提供了一批API，获取客户端一些与安全有关的信息。

更推荐使用uni云端一体安全网络 ，使用安全网络后将无需在使用本章节提供的API。

plus.navigator.getSignature 用于获取应用签名标识，可以判断App是否被重新签名。

签名证书是对App开发者身份的唯一标识，如果程序未对签名证书进行校验，可能被反编译后进行二次打包使用其它签名证书重新签名。如重新签名的App可以正常启动，则可能导致App被仿冒盗版，影响其合法收入，甚至可能被添加钓鱼代码、病毒代码、恶意代码，导致用户敏感信息泄露或者恶意攻击。

uni-app项目可以在App.vue的应用生命周期onLaunch 中进行校验，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

提示：为了防止js检验代码被反编译篡改，建议将签名校验代码放到独立js文件中并配置js/nvue文件原生混淆加密，或者使用apk加固处理

uni-app x 项目不支持 plus API，需使用 uni.getAppBaseInfo 返回值中的 signature 属性值。

plus.navigator.isSimulator 用于判断当前应用是否运行在模拟器中。

iOS系统由于苹果限制了正式打包后不能在模拟器上运行，一般不存在这种情况；Android系统是开源的，底层代码都是公开的，因此市面上有很多Android模拟器，此问题比较严重。

模拟器通常是运行在PC上，可以利用一些自动化工具自动操作使用App，另外模拟器是一个虚拟操作系统，可能会破坏原生系统的安全性，导致用户敏感信息泄露。

以下示例在App.vue的应用生命周期onLaunch 中进行校验，如下：

示例源码如下，请查看 pre > code 标签中的内容

实际项目中可以将此信息提交业务服务器进行判断，如在模拟器环境不允许登录等，多次尝试在模拟器登录可以临时封号，人工客户联系用户核实等，具体可根据业务情况进行调整。

提示：为了防止js检验代码被反编译篡改，建议将签名校验代码放到独立js文件中并配置js/nvue文件原生混淆加密，或者使用apk加固处理

uni-app x 项目可通过 uni.getDeviceInfo 返回值中的 isSimulator 属性值获取。

plus.networkinfo.isSetProxy 用于判断当前应用网络环境是否设置代理。

设置代理后所有网络传输的数据都会经过代理服务器，也就是说代理服务器可能看到所有传入内容，导致用户敏感信息泄露、业务服务器被恶意攻击等问题。当然在某些企业内部网络环境为了保证安全，访问公网可能需要设置代理，开发者需要考虑这种需求来决定是否限制应用正常运行。

可以在用户登录时提交当前网络环境是否使用代理，示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

plus.navigator.isRoot 用于判断当前应用运行的设备是否被root破解。

注： 仅iOS平台支持，Android平台暂不支持

root破解（也叫越狱）是利用iOS系统的漏洞来破解系统安全机制，让任何应用可以获得系统级权限，从而对系统可以进行更灵活的自定义修改，譬如说修改字体、修改主题以及使用一些插件等。iOS系统设计了沙盒机制，限制应用只能使用自身的数据，root破解后则应用可以读取修改其它任何应用的数据，可能导致用户敏感信息泄露，甚至修改其它应用的数据或代码，恶意攻击正常App。

建议在应用启动时判断，如果运行在root破解环境则提示用户无法正常使用，uni-app项目可以在App.vue的应用生命周期onLaunch 中进行校验，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

提示：为了防止js检验代码被反编译篡改，建议将签名校验代码放到独立js文件中并配置js/nvue文件原生混淆加密，或者使用apk加固处理

uni-app x 项目可通过 uni.getDeviceInfo 返回值中的 isRoot 属性值获取。

判断当前应用运行的设备是否开启USB调试，仅Android平台支持。

uni-app x 项目可通过 uni.getDeviceInfo 返回值中的 isUSBDebugging 属性值获取。

**Examples:**

Example 1 (javascript):
```javascript
onLaunch: function(inf) {
      console.log('App Launch');
// #ifdef APP-PLUS
      // 签名证书检验
      var platform = uni.getSystemInfoSync.platform;
      var sign = plus.navigator.getSignature();
      if('android'==platform){   //Android平台
        var sha1 = 'baad093a82829fb432a7b28cb4ccf0e9f37dae58';  //修改为自己应用签名证书SHA-1值，是全小写并且中间不包含“:”符号
        if(sha1!=sign){
          //证书不对时退出应用
          plus.runtime.quit();
        }
      }else{    //iOS平台
        var md5 = 'a2e629f0ea915b4ed11e296a059c9a12';   //修改为自己应用Apple Bunld ID(AppID)的md5值
        if(md5!=sign){
          //不进入应用或循环弹出提示框
          console.log('应用被破坏，无法正常运行！');
          uni.showModal({
            title:'错误',
            content: '应用被破坏，无法正常运行！',
          });
        }
      }
// #endif
  }
```

Example 2 (javascript):
```javascript
onLaunch: function(inf) {
      console.log('App Launch');
// #ifdef APP-PLUS
      // 签名证书检验
      var platform = uni.getSystemInfoSync.platform;
      var sign = plus.navigator.getSignature();
      if('android'==platform){   //Android平台
        var sha1 = 'baad093a82829fb432a7b28cb4ccf0e9f37dae58';  //修改为自己应用签名证书SHA-1值，是全小写并且中间不包含“:”符号
        if(sha1!=sign){
          //证书不对时退出应用
          plus.runtime.quit();
        }
      }else{    //iOS平台
        var md5 = 'a2e629f0ea915b4ed11e296a059c9a12';   //修改为自己应用Apple Bunld ID(AppID)的md5值
        if(md5!=sign){
          //不进入应用或循环弹出提示框
          console.log('应用被破坏，无法正常运行！');
          uni.showModal({
            title:'错误',
            content: '应用被破坏，无法正常运行！',
          });
        }
      }
// #endif
  }
```

Example 3 (javascript):
```javascript
onLaunch: function(inf) {
      console.log('App Launch');
// #ifdef APP-PLUS
      // 签名证书检验
      var platform = uni.getSystemInfoSync.platform;
      var sign = plus.navigator.getSignature();
      if('android'==platform){   //Android平台
        var sha1 = 'baad093a82829fb432a7b28cb4ccf0e9f37dae58';  //修改为自己应用签名证书SHA-1值，是全小写并且中间不包含“:”符号
        if(sha1!=sign){
          //证书不对时退出应用
          plus.runtime.quit();
        }
      }else{    //iOS平台
        var md5 = 'a2e629f0ea915b4ed11e296a059c9a12';   //修改为自己应用Apple Bunld ID(AppID)的md5值
        if(md5!=sign){
          //不进入应用或循环弹出提示框
          console.log('应用被破坏，无法正常运行！');
          uni.showModal({
            title:'错误',
            content: '应用被破坏，无法正常运行！',
          });
        }
      }
// #endif
  }
```

Example 4 (yaml):
```yaml
onLaunch: function(inf) {
      console.log('App Launch');
// #ifdef APP-PLUS
      // 签名证书检验
      var platform = uni.getSystemInfoSync.platform;
      var sign = plus.navigator.getSignature();
      if('android'==platform){   //Android平台
        var sha1 = 'baad093a82829fb432a7b28cb4ccf0e9f37dae58';  //修改为自己应用签名证书SHA-1值，是全小写并且中间不包含“:”符号
        if(sha1!=sign){
          //证书不对时退出应用
          plus.runtime.quit();
        }
      }else{    //iOS平台
        var md5 = 'a2e629f0ea915b4ed11e296a059c9a12';   //修改为自己应用Apple Bunld ID(AppID)的md5值
        if(md5!=sign){
          //不进入应用或循环弹出提示框
          console.log('应用被破坏，无法正常运行！');
          uni.showModal({
            title:'错误',
            content: '应用被破坏，无法正常运行！',
          });
        }
      }
// #endif
  }
```

---

## 白话uni-app | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/vernacular.html

**Contents:**
- # 白话uni-app
  - # 网络模型的变化
  - # 文件类型变化
  - # 文件内代码架构的变化
  - # 外部文件引用方式变化
    - # js要require进来，变成了对象。
    - # css外部文件导入
    - # 另外，vue支持组件导入，可以更方便的封装一个包括界面、js、样式的库。
  - # 组件/标签的变化
  - # js的变化

传统的h5只有1端，即浏览器。而uni-app可跨多端，虽仍属前端，与传统h5有不同。 如果你对h5比较了解，可通过本文快速了解uni-app。

以前网页大多是b/s，服务端代码混合在页面里；

现在是c/s，前后端分离，通过js api(类似ajax的uni.request)获取json数据，把数据绑定在界面上渲染。

以前是.html文件，开发也是html，运行也是html。 现在是.vue文件，开发是vue，经过编译后，运行时已经变成了js文件。 现代前端开发，很少直接使用HTML，基本都是开发、编译、运行。所以uni-app有编译器、运行时的概念。

以前一个html大节点，里面有script和style节点；

现在template是一级节点，用于写tag组件，script和style是并列的一级节点，也就是有3个一级节点。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以前通过script src、link href引入外部的js和css；

现在是es6的写法，import引入外部的js模块(注意不是文件)或css

示例源码如下，请查看 pre > code 标签中的内容

在hello uni-app的common目录有一个工具类util.js，可以在hello uni-app中搜索这个例子查看。

示例源码如下，请查看 pre > code 标签中的内容

而在这个util.js里，要把之前的function封装为对象的方法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

全局样式，在根目录下的app.vue里写入，每个页面都会加载app.vue里的样式。

如下是导入一个角标的组件库，在页面上显示一个abc并且右上角有个数字角标1，详见

示例源码如下，请查看 pre > code 标签中的内容

如需要全局导入vue组件，即每个页面都可以直接使用而不用引用和注册的话，在项目根目录下的main.js里处理。如下是hello uni-app里的例子。

示例源码如下，请查看 pre > code 标签中的内容

上述的组件使用方式属于传统vue的概念。uni-app 2.7以后推出了更简单的组件使用技术easycom ，无需引用和注册组件，直接在template区域使用组件即可。

以前是html标签，比如<div>，现在是小程序组件，比如<view>。 那么标签和组件有什么区别，不都是用尖括号包围起来一段英文吗？ 其实标签是老的概念，标签属于浏览器内置的东西。但组件，是可以自由扩展的。 类似你可以把一段js封装成函数或模块，你也可以把一个ui控件封装成一个组件。

uni-app参考小程序规范，提供了一批内置组件。

下为html标签和uni-app内置组件的映射表：

scroll-view 可区域滚动视图容器

rich-text 富文本（不可执行js，但可渲染各种文字格式和图片）

cover-view 可覆盖原生组件的视图容器

cover-view需要多强调几句，uni-app的非h5端的video、map、canvas、textarea是原生组件，层级高于其他组件。如需覆盖原生组件，则需要使用cover-view组件。详见层级介绍

除了内置组件，还有很多开源的扩展组件，把常用操作都进行封装，DCloud建立了插件市场收录这些扩展组件，详见插件市场

js的变化，分为运行环境变化、数据绑定模式变化、api变化3部分。

标准js语法和api都支持，比如if、for、settimeout、indexOf等。

但浏览器专用的window、document、navigator、location对象，包括cookie等存储，只有在浏览器中才有，app和小程序都不支持。

可能有些人以为js等于浏览器里的js。其实js是ECMAScript组织管理的，浏览器中的js是w3c组织基于js规范补充了window、document、navigator、location等专用对象。

在uni-app的各个端中，除了h5端，其他端的js都运行在一个独立的v8引擎下，不是在浏览器中，所以浏览器的对象无法使用。如果你做过小程序开发，对此应当很了解。

这意味着依赖document的很多HTML的库，比如jquery无法使用。

当然app和小程序支持web-view组件，里面可以加载标准HTML，这种页面仍然支持浏览器专用对象window、document、navigator、location。

现在前端趋势是去dom化，改用mvvm模式，更简洁的写法，大幅减少代码行数，同时差量渲染性能更好。

uni-app使用vue的数据绑定方式解决js和dom界面交互的问题。

如果你想改变某个dom元素的显示内容，比如一个view的显示文字：

以前是给view设id，然后js里通过选择器获取dom元素，进一步通过js进行赋值操作，修改dom元素的属性或值。

如下演示了一段代码，页面中有个显示的文字区和一个按钮，点击按钮后会修改文字区的值

示例源码如下，请查看 pre > code 标签中的内容

现在的做法，是vue的绑定模式，给这个dom元素绑定一个js变量，在script中修改js变量的值，dom会自动变化，页面会自动更新渲染

示例源码如下，请查看 pre > code 标签中的内容

注意上述代码中的 export default {} 里的 data(): {return { }}。 在vue的设计中，这里存放着页面中需要绑定的数据，写在data里，才能被界面正确的绑定和渲染。 注意：uni-app的vue页面是vue的单文件组件规范，按照vue的定义只接受 function，必须用 return 包起来。

如果你学过小程序的数据绑定，但不了解vue，要注意：

在js中，与data和methods平级的，如上述示例代码中的onload()，称为生命周期。在普通vue页面里的生命周期叫页面生命周期。在项目根目录的app.vue文件中的生命周期叫应用生命周期。 除了onload，还有onready等很多生命周期，具体见uni-app的生命周期

在高级用法里，vue支持给组件设ref（引用标记），这类似于之前html中给一个dom元素设id，然后在js中也可以用this.$refs.xxx来获取。如下：

示例源码如下，请查看 pre > code 标签中的内容

因为uni-app的api是参考小程序的，所以和浏览器的js api有很多不同，如

uni-app的js api还有很多，但基本就是小程序的api，把wx.xxx改为uni.xxx即可。详见

uni-app在不同的端，支持条件编译，无限制的使用各端独有的api，详见条件编译

选择器有2个变化：*选择器不支持；元素选择器里没有body，改为了page。微信小程序即是如此。

示例源码如下，请查看 pre > code 标签中的内容

单位方面，px无法动态适应不同宽度的屏幕，rem无法用于nvue/weex。如果想使用根据屏幕宽度自适应的单位，推荐使用rpx，全端支持。 尺寸单位文档

uni-app推荐使用flex布局，这个布局思路和传统流式布局有点区别。但flex的特色在于，不管是什么技术都支持这种排版，web、小程序/快应用、weex/rn、原生的iOS、Android开发，全都支持flex。它是通吃所有端的新一代布局方案。相关教程请自行百度学习。

uni-app的vue文件里支持所有web排版方式，不管是流式还是flex。但nvue里，只支持flex，因为它在app端是使用原生排版引擎渲染的。

注意css里背景图和字体文件，尽量不要大于40k，因为会影响性能。在小程序端，如果要大于40k，需放到服务器侧远程引用或base64后引入，不能放到本地作为独立文件引用。

uni-app的工程结构有单独的要求，详见

每个可显示的页面，都必须在 pages.json 中注册。如果你开发过小程序，那么pages.json类似app.json。如果你熟悉vue，这里没有vue的路由，都是在pages.json里管理。

原来工程的首页一般是index.html或default.html，是在web server里配的。而uni-app的首页，是在pages.json里配的，page节点下第一个页面就是首页。一般在/pages/xx的目录下。

app和小程序中，为了提升体验，页面提供了原生的导航栏和底部tabbar，注意这些配置是在pages.json中做，而不是在vue页面里创建，但点击事件的监听在显示的vue页面中做。

最后，本文并非uni-app的完整教程，了解掌握uni-app，还需要认真过一遍uni-app的文档。

掌握好vue，也仍需要进一步去vue官网学习。或通过uni-app专业视频培训课程 ，连同vue带uni-app一起学会。

根据腾讯课堂和职友集的数据，会vue的人，比不会vue的普通前端薪资高27%哦。

如果你熟悉小程序，但不熟悉vue的话，这里还有一篇文章总结的很好：vue和微信小程序的区别、比较

**Examples:**

Example 1 (html):
```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript">
			
		</script>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		
	</body>
</html>
```

Example 2 (html):
```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript">
			
		</script>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		
	</body>
</html>
```

Example 3 (html):
```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript">
			
		</script>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		
	</body>
</html>
```

Example 4 (html):
```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript">
			
		</script>
		<style type="text/css">
			
		</style>
	</head>
	<body>
		
	</body>
</html>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-android-targetsdkversion.html

**Contents:**
  - # 设置targetSdkVersion
  - # Android版本列表
      - 本页导读

targetSdkVersion用于指定应用的目标Android版本（API等级），默认值为28（即Android9.0）。

设置targetSdkVersion值表示App适配的Android版本（API等级），设置低版本的targetSdkVersion会使APP兼容模式运行，也就可能无法用到新系统的特性，甚至在兼容模式下运行可能存在安全漏洞等问题。 随着Android系统的升级，一些应用市场会要求设置较高的targetSdkVersion才可以提交，HBuilderX中可在项目的manifest.json中进行配置。

targetSdkVersion值为Number类型，且必须为正整数，取值范围参考Android版本列表中的API等级。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “Android设置” -> “targetSdkVersion” 项中进行设置：

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：配置targetSdkVersion后保存提交App云端打包后才能生效

API等级与Android版本对应列表如下：

**Examples:**

Example 1 (unknown):
```unknown
Android版本列表
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "android":{
        "targetSdkVersion": 30
      }
    }
  }
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "android":{
        "targetSdkVersion": 30
      }
    }
  }
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "android":{
        "targetSdkVersion": 30
      }
    }
  }
```

---

## 组合式 API（Composition API） | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-composition-api.html

**Contents:**
- # 组合式 API（Composition API）
  - # 使用组合式API
  - # 使用 Script Setup
      - 本页导读

通过组合式 API，我们可以使用导入的 API 函数来描述组件逻辑。在单文件组件中，组合式 API 通常会与 <script setup> 搭配使用。这个 setup attribute 是一个标识，告诉 Vue 需要在编译时进行一些处理，让我们可以更简洁地使用组合式 API。比如，<script setup> 中的导入和顶层变量/函数都能够在模板中直接使用。

在组合式 API 中，组件可以监听应用和页面的生命周期。但由于应用和页面都有 onShow 和 onHide，导致重名。所以在组合式的组件中监听页面的显示隐藏，改为了 onPageShow 和 onPageHide。

从 vue 包内导入并使用基础的组合式API，具体 API 可以参考：Vue 官网 。从 @dcloudio/uni-app 包内导入 uni-app 应用生命周期及页面的生命周期。

示例源码如下，请查看 pre > code 标签中的内容

改用 Script Setup 写法导入 API

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (jsx):
```jsx
<script setup>
```

Example 2 (jsx):
```jsx
<script setup>
```

Example 3 (javascript):
```javascript
import { defineComponent, ref } from 'vue'
import { onReady } from '@dcloudio/uni-app'
export default defineComponent({
  setup() {
    const title = ref('Hello')
    onReady(() => {
      console.log('onReady')
    })
    return {
      title
    }
  }
})
```

Example 4 (javascript):
```javascript
import { defineComponent, ref } from 'vue'
import { onReady } from '@dcloudio/uni-app'
export default defineComponent({
  setup() {
    const title = ref('Hello')
    onReady(() => {
      console.log('onReady')
    })
    return {
      title
    }
  }
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-speech.html

**Contents:**
  - # 配置百度语音识别
  - # 使用百度语音识别
      - 本页导读

App端Speech(语音输入)模块封装了市场上主流的三方语音识别SDK，提供JS API统一调用语音识别功能。

注意 uni-app没有封装语音相关API，需要调用5+ API的plus.speech.* 。

使用语音识别功能需在项目manifest.json的“App模块配置”中勾选“Speech(语音输入)”，并根据项目实际情况勾选使用的三方语音识别平台：

提示：三方语音识别模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

打开项目的manifest.json文件，在“App模块配置”项的“Speech(语音输入)”下，勾选“百度语音识别”： 以下配置参数需要到百度语音开放平台 申请

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

Example 2 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

Example 3 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

Example 4 (javascript):
```javascript
var options = {
		engine: 'baidu'
	};
	text.value = '';
	console.log('开始语音识别：');
	plus.speech.startRecognize(options, function(s){
		console.log(s);
		text.value += s;
	}, function(e){
		console.log('语音识别失败：'+JSON.stringify(e));
	} );
```

---

## 域名备案 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/beian.html

**Contents:**
- # 域名备案
- # App备案
- # 小程序备案
- # FAQ
      - 本页导读

如果你有自己的云服务器，则按照云厂商的备案指引，自助备案即可。

云厂商为满足管局要求，进行域名备案时，会要求关联有固定IP的服务器。而Serverless是按需启动的云函数，没有固定IP，在域名备案时就会比较尴尬。

为帮助广大Serverless开发者，DCloud联合支付宝云，推出了备案码业务 ，你只需要通过支付宝云开通服务空间，且消费少量金额，即可获赠一个备案码，通过该备案码，你就可以在阿里云备案系统 快速完成域名备案。

注意：支付宝云的备案码，仅限阿里云备案系统使用。

各大云厂商均已提供显著的App备案入口及详细的App备案教程，选择自己App后端服务所在的云厂商，按照操作指引提交相关资料即可。

注意：APP备案的前提是先进行域名备案，关于域名备案，请参考上一章节。

App备案需要填写App后端服务器域名，该域名持有人需和App备案主体保持一致。

若您不熟悉App备案，需要技术指导、加急办理或三方代办服务，可到服务市场寻求帮助，点此前往

开发者自行到各家小程序管理控制台上传相关信息，即可完成，不涉及域名及固定IP等要素。

HarmonyOS应用/元服务备案要求与APP备案一致，均由接入商代为备案。请注意，在接入商备案系统填写材料时需选择“鸿蒙”平台。如果之前Android应用App备案已完成，可通过“变更备案”加入“鸿蒙”平台提交，完成HarmonyOS应用/元服务的备案。

若您不熟悉小程序备案流程，需要技术指导、加急办理或三方代办服务，可到服务市场寻求帮助，点此前往

---

## 小程序运行日志回显 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/mp-log.html

**Contents:**
- # 小程序运行日志回显
      - 本页导读

以往运行到小程序开发者工具时，打印的日志或报错，只能在小程序开发工具里看编译后的代码。

从HBuilderX 4.41+，uni-app(x) 运行到小程序开发者工具时，可以在HBuilderX的控制台查看运行时日志，并且显示uni-app源码位置，方便回源。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-uibackgroundmodes.html

**Contents:**
  - # 设置后台运行能力
    - # 注意事项
      - 本页导读

iOS平台为了减少系统资源消耗，应用默认不支持后台运行，切换到后台会停止运行。比如当应用切换到后台时音乐将暂停播放，下次切换到前台继续播放。如果应用切换到后台继续运行如播放音乐，定位等功能，需要配置支持后台运行的能力。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “iOS设置” -> “后台运行能力” 项中进行设置：

注意： "audio"表示后台播放音乐能力，"location"表示后台定位能力，更多后台能力配置参考苹果官网UIBackgroundModes文档 ； 多个后台能力使用 "," 分割； 如果可视化界面无法编辑，请切换到“源码视图”删除UIBackgroundModes节点数据重新操作。

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注：为了向下兼容，HBuilderX源码视图配置时UIBackgroundModes属性值支持字符串数组，上面示例中的值也可以这么配置["audio","location"]

**Examples:**

Example 1 (unknown):
```unknown
UIBackgroundModes
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "UIBackgroundModes": "audio,location"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "UIBackgroundModes": "audio,location"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "ios": {
        "UIBackgroundModes": "audio,location"
        //...
      },
      //...
    },
    //...
  },
  //...
```

---

## dom | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-api

**Contents:**
- # dom
  - # addRule
  - # scrollToElement
  - # getComponentRect
- # animation
  - # transition
- # nvue 里使用 BindingX
      - # 注意
      - # 代码示例:
- # nvue 和 vue 相互通讯

对于那些不依赖 UI 交互的原生功能，nvue将其封装成模块，这是一种通过 javascript 调用原生能力的方法。

示例源码如下，请查看 pre > code 标签中的内容

支持项目nativeplugins目录下和插件市场原生云打包的第三方原生插件。你可以将已有原生模块移植到nvue平台也很方便。 使用方式：在manifest.json->App原生插件配置->选择本地插件或者云端插件->打自定义基座才能使用。详见

nvue还支持uni-app的js API接口，若无特殊说明，则表示vue文件和nvue文件均支持。详见。

nvue 里不支持的 uni-app API，详见

Weex 提供 DOM.addRule 以加载自定义字体。开发者可以通过指定 font-family加载 iconfont 和 custom font。开发者可以使用下面的代码加载自定义字体：

示例源码如下，请查看 pre > code 标签中的内容

addRule(type, contentObject)

addRule 方法里的 fontFamily 可以随意取。这个名字不是字体真正的名字。字体真正的名字（font-family），也就是注册到系统中的名字是保存在字体二进制文件中的。你需要确保你使用的字体的真正名字（font-family）足够特殊，否则在向系统注册时可能发生冲突，导致注册失败，你的字符被显示为‘?’。 如果你使用 http://www.iconfont.cn/ 来构建你的 iconfont。确保在项目设置中，设置一个特殊的 font-family 名字。默认是 “iconfont”，但极大可能发生冲突。 调用addRule 在 beforeCreate 中是被推荐的。

让页面滚动到 ref 对应的组件，这个 API 只能用于可滚动组件的子节点，例如 <scroller>，<list>, <waterfall> 等可滚动组件中。

scrollToElement(ref, options)

示例源码如下，请查看 pre > code 标签中的内容

getComponentRect(ref, callback)

示例源码如下，请查看 pre > code 标签中的内容

此方法需要在节点渲染后调用才能获取正确的信息，可在 mounted 或 更新数据后 updated 中调用

如果想要获取到 Weex 视口容器的布局信息，可以指定 ref 为字符串 'viewport'，即 getComponentRect('viewport', callback).

animation模块可以用来在组件上执行动画。JS-Animation可以对组件执行一系列简单的变换 (位置、大小、旋转角度、背景颜色和不透明度)。

举个例子，如果有一个image组件，通过动画你可以对其进行移动、旋转、拉伸或收缩等动作。

示例源码如下，请查看 pre > code 标签中的内容

如果需要使用CSS动画，参考transition和transform。

uni-app 是逻辑层和视图层分离的。此时会产生两层通信成本。比如拖动视图层的元素，如果在逻辑层不停接收事件，因为通信损耗会产生不顺滑的体验。

BindingX 是weex提供的一种预描述交互语法。由原生解析BindingX规则，按此规则处理视图层的交互和动效。不再实时去js逻辑层运行和通信。

BindingX是一种规则，解析快，但没有js那样足够强的编程灵活性。

uni-app 内置了 BindingX，可在 nvue 中使用 BindingX 完成复杂的动画效果。

从HBuilderX 2.3.4起，uni-app 编译模式可直接引用 uni.requireNativePlugin('bindingx') 模块，weex 模式还需使用 npm 方式引用。

BindingX demo示例可参考 BindingX 示例里 vue 的相关示例，将相关 vue 代码拷贝到 nvue 文件里即可。

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中，nvue 和 vue 页面可以混搭使用。

推荐使用 uni.$on , uni.$emit 的方式进行页面通讯，旧的通讯方式（uni.postMessage及plus.webview.postMessageToUniNView）不再推荐使用。

示例源码如下，请查看 pre > code 标签中的内容

使用此页面通讯时注意事项：要在页面卸载前，使用 uni.$off 移除事件监听器。参考

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

除了通信事件，vue 和 nvue 页面之间还可以共享变量和存储。 uni-app提供的共享变量和数据的方案如下：

注意：不支持直接引入store使用，可以使用mapState、mapGetters、mapMutations等辅助方法或者使用this.$store

示例源码如下，请查看 pre > code 标签中的内容

nvue页面可直接使用plus的API，并且不需要等待plus ready。

nvue 支持大部分 uni-app API ，下面只列举目前还不支持的 API 。

canvas API使用，详见canvas文档 。

**Examples:**

Example 1 (unknown):
```unknown
uni.requireNativePlugin
```

Example 2 (javascript):
```javascript
//使用方式
	const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 3 (javascript):
```javascript
//使用方式
	const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 4 (javascript):
```javascript
//使用方式
	const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

---

## 申请开通友盟统计 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-statistic-umeng.html

**Contents:**
    - # 申请开通友盟统计
    - # 使用友盟统计
      - 本页导读

App云端打包友盟统计功能，需要到友盟开发平台申请应用后获取相关配置参数： 友盟统计

在项目manifest.json文件的“App模块配置”页面，在“Statistic(统计)”下勾选“友盟统计”项，并输入从友盟统计平台申请的参数：

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/i18n

**Contents:**
- # vue界面和js内容的国际化
- # nvue页面国际化
- # pages.json 国际化
- # 框架内置组件和API国际化
  - # 自动适配手机或浏览器语言
  - # 自定义国际化内容
- # manifest.json 国际化
- # 小程序国际化
- # 双向文字流
- # uniCloud国际化

uni-app的国际化，即多语言，分为应用部分和框架部分。

不同端的国际化方案也有差异，uni-app 自 3.1.5起，App 和 H5 支持框架国际化。小程序平台的国际化依赖于小程序平台框架自身。一般而言海外用户更多使用的是App和H5。

可以在HBuilderX新建项目里选择Hello i18n示例或者插件市场查看https://ext.dcloud.net.cn/plugin?id=6462 。

vue和js里的内容国际化是与web通行的方案。

main.js 引入并初始化 VueI18n

注意 推荐使用vue-i18n@9.1.9固定版本

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

页面模板中使用 $t() 获取，并传递国际化json文件中定义的key，js中使用 this.$t('')

示例源码如下，请查看 pre > code 标签中的内容

注意：页面中设置语言后需要调用 this.$i18n.locale = 'zh-Hans' 后生效

注意：nvue 国际化方案需要在每个页面单独引入uni-i18n。

示例源码如下，请查看 pre > code 标签中的内容

pages.json不属于vue页面，其中的原生tabbar和原生导航栏里也有文字内容。这部分内容的国际化方案如下：

项目根目录的locale目录下配置语言json文件，locale/语言地区代码.json，如：en.json，zh-Hans.json，zh-Hant.json

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

pages.json 支持以下属性配置国际化信息

注：小程序下不支持这种国际化方案，也可以使用设置tabbar和navigationbar的API来设置文字。或者废弃原生tabbar和navigationbar，使用自定义方式。

注：目前鸿蒙App 暂不支持 TabBar 国际化。

uni-app 有内置的基础组件，比如picker，或者与界面相关的API，比如showModal。这些界面包含的文字也需要国际化。

自 3.1.5 版本起，App和H5平台内置的基础组件和接口相关的文字内容支持国际化。

这部分国际化，提供了2种策略，有自动策略，也有自定义方案。

uni-app 基础组件和API，内置如下语言：

内置组件和接口显示会根据系统语言环境自动切换，未支持的系统语言环境会显示为英文。

uni-ui在1.4.8版本后也支持国际化

如果自动适配语言不满足你的需求，比如需要预置的5种语言外的更多语言。那么可以使用自定义方案。在指定目录创建指定文件，用同名词条来替换，语言地区代码请遵循 BCP47 规范。

项目根目录支持 locale 目录，locale/uni-app.语言地区代码.json，如：uni-app.en.json，uni-app.zh-Hans.json，uni-app.zh-Hant.json

示例源码如下，请查看 pre > code 标签中的内容

uni-app.zh-Hans.json 文件

示例源码如下，请查看 pre > code 标签中的内容

和 pages.json 一致，在项目根目录增加 locale/uni-app.语言地区代码.json 文件，然后在 manifest.json 中使用 %% 占位

示例源码如下，请查看 pre > code 标签中的内容

manifest.json 中支持配置应用默认语言，参见上面的示例，默认为auto，跟随系统OS的语言。

中东语言的文字大多从右向左 (RTL) 书写。但是，一般而言，最常用的形式为双向 (bidi) 文字 - 混用从左向右和从右向左书写的文字。bidi 文字的一个示例是含有阿拉伯语和英语文字的段落。在 uni-app 中，nvue 页面和 vue 页面以不同的方式控制。

注：大陆以外的终端用户访问uniCloud，开通阿里云的海外加速后可以提高访问速度。详见

uniCloud的 DB Schema 中涉及字段的显示名称、错误格式提示语，这些也需要国际化。

在项目根目录 uniCloud/database/locale/{数据库表名}/语言地区代码.json 文件，然后在 *.schema.json 文件中使用 %% 占位

示例源码如下，请查看 pre > code 标签中的内容

hello.schema.json 文件内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app App端sdk国际化依赖于sdk自身，一般而言推荐直接使用适配海外的SDK。

从HBuilder 3.4起，如下海外常用sdk均得到支持。

云打包详见https://ask.dcloud.net.cn/article/35860 离线打包自行在原生工程中配置。

uni-app内置了一批与国际化相关的API和生命周期。

可以得到设备OS的语言、运行宿主host的语言以及应用自身的语言。

当前应用语言发生变化时，触发回调。也就是uni.setLocale执行时。

语言代码通常为两个或三个字母，参考ISO 639 规范

语言代码-地区代码，地区代码为两个字母，参考ISO 3166-2 规范

HBuilderX 3.3 起，新建项目可以直接选择hello i18n模板，或者去插件市场查阅https://ext.dcloud.net.cn/plugin?id=6462

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 3.5.2 起，关于i18n国际化，uni-app pages.json和Vue页面 HBuilderX支持i18n相关代码提示、转到定义。

**Examples:**

Example 1 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

Example 2 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

Example 3 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

Example 4 (javascript):
```javascript
// 国际化 json 文件，文件内容详见下面的示例

import en from './en.json'
import zhHans from './zh-Hans.json'
import zhHant from './zh-Hant.json'
const messages = {
	en,
	'zh-Hans': zhHans,
	'zh-Hant': zhHant
}

let i18nConfig = {
  locale: uni.getLocale(),// 获取已设置的语言
  messages
}

// VUE2
// #ifndef VUE3
import Vue from 'vue'
import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n(i18nConfig)
Vue.config.productionTip = false
App.mpType = 'app'
const app = new Vue({
  i18n,
  ...App
})
app.$mount()
// #endif

// VUE3
// #ifdef VUE3
import { createSSRApp } from 'vue'
import { createI18n } from 'vue-i18n'// v9.x
const i18n = createI18n(i18nConfig)
export function createApp() {
  const app = createSSRApp(App)
  app.use(i18n)
  return {
    app
  }
}
// #endif
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth

**Contents:**
      - 本页导读

App端OAuth(登录鉴权)模块封装了市场上主流的三方登录SDK，提供JS API统一调用登录鉴权功能。

如果服务端使用uniCloud ，官方提供了uni-id 云端统一登录服务，把微信登录、短信验证码登录及角色权限管理等服务端登录开发，进行了统一的封装。前端统一的uni.login和云端统一的uni-id搭配，可以极大提升登录业务的开发效率，强烈推荐给开发者使用。

使用登录鉴权功能需在项目manifest.json的“App模块配置”中勾选“OAuth(登录鉴权)”，并根据项目实际情况勾选使用的三方登录平台：

提示：三方登录模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## 条件编译处理多端差异 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/platform.html

**Contents:**
- # 条件编译处理多端差异
- # 为什么选择条件编译处理跨端兼容
- # 条件编译
  - # 使用方法
  - # API 的条件编译
  - # 组件的条件编译
  - # 样式的条件编译
  - # pages.json 的条件编译
  - # static 目录的条件编译
  - # 整体目录条件编译

uni-app 已将常用的组件、API 封装到框架中，开发者按照 uni-app 规范开发即可保证多平台兼容，大部分业务均可直接满足。

但每个平台有自己的一些特性，因此会存在一些无法跨平台的情况。

在 C 语言中，通过 #ifdef、#ifndef 的方式，为 Windows、Mac 等不同 OS 编译不同的代码。

uni-app 团队参考这个思路，为 uni-app 提供了条件编译手段，在一个工程里优雅的完成了平台个性化实现。

条件编译是用特殊的注释作为标记，在编译时根据这些特殊的注释，将注释里面的代码编译到不同平台。

以 #ifdef 或 #ifndef 加 %PLATFORM% 开头，以 #endif 结尾。

条件编译是利用注释实现的，在不同语法里注释写法不一样，js/uts 使用 // 注释、css 使用 /* 注释 */、vue/nvue/uvue 模板里使用 <!-- 注释 -->；

条件编译 APP-PLUS 包含 APP-NVUE 和 APP-VUE，APP-PLUS-NVUE 和 APP-NVUE 没什么区别，为了简写后面出了 APP-NVUE ；

对于未定义平台名称，可能是名称写错了，也可能是低版本 HBuilderX 还不认识这个平台。此时的条件编译，#ifdef 中的代码不会生效，而 #ifndef 中的代码会生效；

使用条件编译请保证编译前和编译后文件的语法正确性，即要保障无论条件编译是否生效都能通过语法校验。比如：json 文件中不能有多余的逗号，js 中不能重复导入；

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

VUE3 需要在项目的 manifest.json 文件根节点配置 "vueVersion" : "3"；

除了支持单个平台的条件编译外，还支持多平台同时编译，使用 || 来分隔平台名称。

示例，如下代码会在 App 和 H5 平台上出现：

示例，如下公众号关注组件仅会在微信小程序中出现：

示例源码如下，请查看 pre > code 标签中的内容

注意： 样式的条件编译，无论是 css 还是 sass/scss/less/stylus 等预编译语言中，必须使用 /*注释*/ 的写法。

下面的页面，只有运行至 App 时才会编译进去。

不同平台下的特有功能，以及小程序平台的分包，都可以通过 pages.json 的条件编译来更好地实现。这样，就不会在其它平台产生多余的资源，进而减小包体积。

json 的条件编译，如不同平台的 key 名称相同，cli 项目下开发者自己安装的校验器会报错，需自行关闭这些校验器对 json 相同 key 的校验规则。如果使用 HBuilderX 的校验器，无需在意此问题，HBuilderX 的语法校验器为此优化过。

这里也解释了 static 内的哪些目录是特殊的。

在不同平台，引用的静态资源可能也存在差异，通过 static 的条件编译可以解决此问题，static 目录下新建不同平台的专有目录，目录名称均为 小写

专有目录下的静态资源只有在特定平台才会编译进去。

如以下目录结构，a.png 只有在微信小程序平台才会编译进去，b.png 在所有平台都会被编译。

示例源码如下，请查看 pre > code 标签中的内容

如果想把各平台的页面文件更彻底的分开，也可以在 uni-app 项目根目录创建platforms目录，然后在下面进一步创建app-plus、mp-weixin等子目录，存放不同平台的文件。

对于APP-ANDROID和APP-IOS两个平台，

使用UNI-APP-X条件编译，来区分 uni-app x 项目和 uni-app 项目。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

插件作者的插件，需要适配各种插件使用者，使用者的 uni-app 版本，可能有很多。

有些问题可以在运行期判断适配，有些则需要在编译器处理，尤其是不处理可能会导致低版本编译失败的情况。

为此，uni-app 的条件编译新增了uniVersion。在 uni-app 和 uni-app x 中均可使用。

注意，从 HBuilderX 3.9 起，版本号将由三段式字符串改为小数。

即 HBuilderX 3.9.1，将改为 3.91。

这样条件编译判断时，仅需输入一个数字即可。

注意低于 3.9 版本的 HBuilderX 的条件编译不识别uniVersion。

HBuilderX 为 uni-app 的条件编译提供了丰富的支持:

在 HBuilderX 中开发 uni-app 时，通过输入 ifdef 可快速生成条件编译的代码片段

在 HBuilderX 中对条件编译的代码注释部分提供了语法高亮，可分辨出写法是否正确，使得代码更加清晰（独立 js 文件需在编辑器右下角切换 javascript es6+编辑器，独立 css 文件暂不支持高亮，但不高亮不影响使用）

在 HBuilderX 中，ctrl+alt+/ 即可生成正确注释（js：// 注释、css：/* 注释 */、vue/nvue 模板： <!-- 注释 -->）。

点击 ifdef 或 endif 可快速选中条件编译部分；点击左侧的折叠图标，可折叠条件编译部分代码。

**Examples:**

Example 1 (php):
```php
<!-- 注释 -->
```

Example 2 (json):
```json
{
  "key": "a",
  // #ifdef MP-WEIXIN
  "key": "b"
  // #endif
}
```

Example 3 (json):
```json
{
  "key": "a",
  // #ifdef MP-WEIXIN
  "key": "b"
  // #endif
}
```

Example 4 (json):
```json
{
  "key": "a",
  // #ifdef MP-WEIXIN
  "key": "b"
  // #endif
}
```

---

## 鸿蒙元服务登录 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/login.html

**Contents:**
- # 鸿蒙元服务登录
- # 概要
- # 接入流程
  - # 准备工作
    - # 权限申请
    - # 证书配置
    - # client id 配置
  - # 前端开发
  - # 服务端开发
    - # 普通登录

本文介绍使用 uni-app 接入鸿蒙元服务登录的具体操作步骤。

鸿蒙元服务登录和鸿蒙 App 登录流程相似。大致分成三个步骤

静默登录不需要额外申请权限。可以直接调用，静默登录返回的数据不包含用户手机号信息，登录认证的数据可以存储到数据库中进行查询。

手机号获取，需要提前申请。参考鸿蒙 Account Kit 开发准备 申请 获取您的手机号 这个敏感权限。

在这个表格中申请权限时，注意服务类型、使用场景要认真填写，按照华为要求添加正确的分类和使用步骤，不要随意填充内容，避免被人工审核驳回。

权限申请由人工处理，目前不会立即下发，建议尽可能提前申请。

鸿蒙要求在配置中添加 client_id、关联调试证书。

鸿蒙的证书配置很多用户一开始分辨不清具体的作用。这里做一个基础解释。鸿蒙证书目前可以在 manifest.json 中进行配置。应用签名包含三部分内容：

登录使用的证书不要使用自动签名的部分，务必阅读 API 登录 uni.login 获取 code 报错、如何绑定现有用户体系？ 部分，了解易错点。

访问 AGC 开发与服务 - 我的项目，选择对应的项目和应用，打开 常规 - 应用，配置指纹，选择刚才的调试证书。

在刚才添加调试证书指纹的地方，在页面底部，找到 Client ID 和 Client Secret,这里记录下来，后面需要使用。

在元服务的配置文件中，找到 harmony-mp-configs/entry/src/main/module.json5 文件，如果目录为空请参考 元服务配置 build-profile.json5。

module.json5 文件中在 module 节点添加 metadata

示例源码如下，请查看 pre > code 标签中的内容

为了验证上述步骤是否填写正常，请在前端开发部分进行实际验证。

有了刚才的准备部分，现在可以先验证信息是否填写完成。

在前端页面中调用 uni.login 观察返回值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果刚才的 clientID 填写错误、没有关联证书指纹，会有相关报错。

如果已经申请了手机号权限，可以测试手机号获取

示例源码如下，请查看 pre > code 标签中的内容

在这里应当能打印到具体设置，mock 数据如下

示例源码如下，请查看 pre > code 标签中的内容

这样前端部分就开发完成，现在登录和手机号的返回值都是 code，需要由服务端进行解析和存储。

这里举例 uniapp 开发的开源项目 uni-id-pages。可以进一步参考阅读 uni-id 用户体系 。

这个项目已经封装好了常见登录鉴权的服务端开发方案，对外使用通用的 api 快速接入华为登录、微信小程序登录、安卓、iOS 登录等，加速业务落地。

下载 uni-id-pages 提供的示例项目，下载到本地。

在 uniCloud 文件夹中关联云端项目，本地测试不需要关联部署。

打开配置文件 /uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json，参考默认的 mp-weixin 增加一层配置

示例源码如下，请查看 pre > code 标签中的内容

这里的 clientId 和 clientSecret 在刚才添加证书指纹地方获取。

填写完成之后，添加签名证书运行这个项目为鸿蒙元服务。

这个项目的默认首页中，选择 华为登录，选择华为账号登录。稍等片刻就完成了登录鉴权。这里用到了 uni.login api 完成 code 获取，调用服务端方法实现鉴权处理。

这个项目默认首页中，选择 华为账号一键登录 ，页面中展示的按钮包含了 getphonenumber 回调方法。点击按钮会获取当前用户手机号。

这个实例使用了 button 元素获取登录，调用服务端方法进行鉴权处理。

服务端相关代码可访问 uniCloud/cloudfunctions/uni-id-co/lib/third-party/huawei/account/index.js 观察具体源码实现。

元服务的登录要求可以参考阅读 《使用华为账号登录 静默登录 》、《开发者可以使用自行设计的登录界面吗？ 》。

如果需要账号登录，必须使用 uni.login 登录，不得绕过自行使用账号密码登录。建议申请获取用户手机号权限，然后关联自己的账号系统。在应用合适时机调用登录接口换取 UnionID，先标识用户为华为用户，操作关键步骤时候接入现有账号，比如获取手机号关联现有账号。同时务必提供注销用户功能入口，用户自行取消注册，否则会被驳回。

实践中，某些分类下的应用无法申请一键获取手机号，申请会被驳回，这种情况下，建议在业务中完成静默登录，然后在某些操作时候关联其他平台用户，此时通过手机号和验证码完成相关关联平台账号逻辑。

参考鸿蒙 Account Kit 开发准备 设置相关权限，添加 scope 权限。

通过 uni.login 可以得到 code，流程和其他小程序登录流程相似。参考 解析凭证 得到用户的 UnionID，开发者在这一步骤自行判断是已绑定华为 UnionID，如果未绑定，引导用户绑定现有账号体系。如果你没有 code 返回值，观察接口错误提示，一般是 client_id 设置错误。

也可以参考下面手机号接口申请，快速绑定手机号，具体见下个问题。

欢迎使用 uni-id-pages 插件加速元服务开发落地，这里封装了服务端开发的逻辑。在 uni-pay 中也提供了华为元服务支付的服务端逻辑封装，接入更方便。

申请过手机号敏感权限之后，可以通过 button 获取用户手机号。使用这种方式快速注册、绑定账号体系。

如果手机号申请失败，一般是没有严格按照手机号申请的要求完整填写，确保包含三个部分，应用的分类、场景的具体操作步骤、请求频率。尤其是第二部分，参考描述详细步骤。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果有返回值，说明配置项正确。可以让服务端解析数据。如果点击无反应，在 HBuilderX 中打开展示原生日志，观察是否有类似 "Failed to check the fingerprint" 的告警，排查错误方案如下：

用户侧第一次使用会有系统控件弹窗申请，同意之后，后续会自动同意。如果撤回同意，或者测试控件效果，需要手机打开 设置-华为账号-账号安全-使用华为账号的应用-删除授权。

用户侧控件效果如下，默认展示手机系统登录的账号，也可以通过管理手机号，手动验证其他手机号。

最终解析 token 得到最终结果，最终结果数据是下面的结构，供 mock 参考，包含了 unionID/mobileNumber 字段，后面执行用户关联操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
Client Secret
```

Example 2 (unknown):
```unknown
harmony-mp-configs/entry/src/main/module.json5
```

Example 3 (unknown):
```unknown
module.json5
```

Example 4 (json):
```json
"module":{
  // 其他配置
  "metadata":[
    // 其他配置
    {
    "name": "client_id",
    "value": "刚才的 client id"
    }
  ],
  // 其他配置
}
```

---

## 宽屏适配指南 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/adapt

**Contents:**
  - # 宽屏适配指南
    - # 1. 页面窗体级适配方案：leftWindow、rightWindow、topWindow
    - # 2. 分栏
    - # 3. 组件级适配方案：match-media组件
    - # 4. 内容缩放拉伸的处理
    - # 非webkit浏览器适配
    - # 一个让手机版网页临时可用于pc浏览器的方案
    - # 通过electron打包为windows、mac、linux客户端
    - # 响应式布局组件：uni-row
      - 本页导读

uni-app是以移动为先的理念诞生的。从uni-app 2.9起，提供了PC等宽屏的适配方案，完成了全端统一。

PC适配和屏幕适配略有差异。PC适配包含宽屏适配和uni-app内置组件适配PC两方面的工作。

uni-app内置组件的PC适配，又包括PC交互习惯的UI调整和非webkit浏览器适配这两部分。这块工作不在本文的讨论范围内，尤其是开发者在PC端可以随意使用普通html元素和组件，不局限于uni-app内置组件。所以本文重点讨论屏幕适配。

uni-app提供的屏幕适配方案，包括3部分：

以目前手机屏幕为主window，在左右上，可新扩展 leftWindow、rightWindow、topWindow，这些区域可设定在一定屏幕宽度范围自动出现或消失。这些区域各自独立，切换页面支持在各自的window内刷新，而不是整屏刷新。

以上示例建议使用最新版的chrome、Safari、或firefox访问。可以在PC模式和手机模式分别体验。以上示例源码的运行需使用HBuilderX 2.9+

这套方案是已知的、最便捷的分栏式宽屏应用适配方案。

H5 宽屏下 tabBar(选项卡) 的显示与隐藏

如果在 PC 上不想显示 tabbar 页面可以参考 hello-uniapp，在 app 的首页加载时跳转一个 非tabbar 页, hello-uniapp 的隐藏 tabbar 不是媒体查询实现的，当前页不是 tabbar 页面（是pages/component/view/view页），所以没有显示tabbar。

如果是想在有 leftwindow 等窗体的时候，隐藏 tabar 页面的 tabbar，可以用 css 实现（好处是可以和leftwindow等窗体联动）：

示例源码如下，请查看 pre > code 标签中的内容

leftWindow等配置，在pages.json里进行。文档见：https://uniapp.dcloud.net.cn/collocation/pages?id=topwindow

示例源码如下，请查看 pre > code 标签中的内容

如果已经有了一个为小屏设计的uni-app，在使用leftWindow等窗体适配大屏时，需理清一个思路：现有的小屏内容，放在哪个window里？

如果应用的首页是列表，二级页是详情，此时适合的做法是，将原有的小屏列表作为主window，在右边扩展rightWindow来显示详情。

以新闻示例项目为例。这个项目的源码已经内置于HBuilderX 2.9中，新建uni-app项目时选择新闻/资讯模板。

首先在这个项目的pages.json文件中，配置rightWindow选项 ，放置一个新页面right-window.vue。

示例源码如下，请查看 pre > code 标签中的内容

rightWindow对应的页面不需要重写一遍新闻详情的页面逻辑，只需要引入之前的详情页面组件（详情页面/pages/detail/detail可自动转化为pages-detail-detail组件使用）。

示例源码如下，请查看 pre > code 标签中的内容

然后在新闻列表页面，处理点击列表后与rightWindow交互通信的逻辑。

示例源码如下，请查看 pre > code 标签中的内容

可以看到，无需太多工作量，就可以快速把一个为手机窄屏开发的应用，快速适配为PC宽屏应用。并且以后的代码维护，仍然是同一套，当业务迭代时不需要多处升级。

rightWindow适用于分栏式应用，那leftWindow一般用于什么场景？

leftWindow比较适合放置导航页面。如果你的应用首页有很多tab和宫格导航，那么可以把它们重组，放在leftWindow作为导航。之前在手机竖屏上依靠多级tab和宫格导航的场景，可以在leftWindow里通过tree或折叠面板方式导航。

leftWindow除了适用于手机应用适配大屏，也适用于重新开发的PC应用，尤其是PC Admin管理控制台。

DCloud官方基于uni-app的pc版，推出了unicloud Admin：https://doc.dcloud.net.cn/uniCloud/admin

leftWindow、rightWindow、topWindow 只支持web端。

一些pad应用，或折叠屏应用，有左右分栏。

虽然leftWindow、rightWindow也可以实现类似效果，但仅web支持。

如果有跨端的分栏需求，不推荐使用rightWindow等方案。

利用vue文件可以做页面，也可以做组件的特性，uni-app封装了rightWindow等方案，但其实uni-app不封装，开发者也可以自己做，灵活度会更高。

还是以列表(list.vue)和详情(detail.vue)为例，如果是竖屏手机，list页面全屏，点击item后通过navigateTo调整到detail页面；

如果是pad分栏，则在list页面中并排放置list组件和detail组件，把detail.vue文件从页面变成组件。点击list的item，通过eventbus让detail加载新的响应式数据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上述思路也适用于uni-app x，但uni-app x的Android端，暂不支持页面和组件同时使用，后续会修复此问题。

leftWindow等方案是页面窗体级适配方案。适于独立的页面。那么在同一个页面中，是否可以适配不同屏宽？当然可以，此时可以使用组件级适配方案。

uni-app提供了 match-media组件 和配套的 uni.createMediaQueryObserver 方法。

这是一个媒体查询适配组件，可以更简单的用于动态屏幕适配。

在match-media组件中放置内容，并为组件指定一组 media query 媒体查询规则，如屏幕宽度。运行时，如屏幕宽度满足查询条件，这个组件就会被展示，反之则隐藏。

它的详细文档参考：https://uniapp.dcloud.net.cn/component/match-media

当然，开发者也可以继续使用css媒体查询来适配屏幕，或者使用一些类似mobilehide、pcshow之类的css样式。

uni-app的屏幕适配推荐方案是运行时动态适配，而不是为PC版单独条件编译（虽然您也可以通过自定义条件编译来实现单独的PC版）。这样设计的好处是在ipad等设备的浏览器上可以方便的横竖屏切换。

除了根据屏宽动态显示和隐藏内容，其实还有一大类屏幕适配需求，即：内容不会根据屏宽动态显示隐藏，而是缩放或拉伸。

举个实际的例子，比如一个列表页面，左边有一个图标，右边是2行文字。

策略2省事，设计师按750px屏宽出图，程序员直接按rpx写代码即可。但策略2的实际效果不如策略1好。程序员使用策略1，分析下界面，设定好局部拉伸区域，这样可以有更好的用户体验。

在移动设备上也有很多屏幕宽度，设计师一般只会按照750px屏幕宽度出图。此时使用rpx的好处在于，各种移动设备的屏幕宽度差异不是很大，相对于750px微调缩放后的效果，尽可能的还原了设计师的设计。

但是，一旦脱离移动设备，在pc屏幕，或者pad横屏状态下，因为屏幕宽度远大于750了。此时rpx根据屏幕宽度变化的结果就严重脱离了预期，大的惨不忍睹。

为此，在uni-app 2.9+起，新增了 rpx 按750px做基准屏宽的生效范围控制，并且将 rpx 的默认最大适配宽度设为了 960 px。

也就是设计师按750px出具的设计图，可适配的最大屏幕宽度为960px，在这个范围内，rpx可以根据屏幕宽度缩放。一旦超过960，rpx再根据屏幕宽度缩放就变的没有意义了。按如下配置，在超过960宽的屏幕上，会按375px作为基准宽度，这是最大程度上保持界面不失真的策略。

当然这些配置您都可以自己定义调整，在 pages.json 的 globeStyle 里配置 rpx 的如下参数。

示例源码如下，请查看 pre > code 标签中的内容

通过上述配置中的前2个，即rpxCalcMaxDeviceWidth和rpxCalcBaseDeviceWidth，即可有效解决使用了rpx后，在宽屏下界面变的奇大无比的问题。如果你不需要特别定义这2个参数的数值，则无需在pages.json中配置它们，保持默认的960和375即可。

但是，rpx的最大适配宽度被限定后，会带来一个新问题：如果您的代码中把750rpx当做100%来使用（官方强烈不推荐这种写法，即便是nvue不支持百分比，也应该使用flex来解决撑满问题），此时不管屏幕宽度为多少，哪怕超过了960px，您的预期仍然是要占满整个屏幕宽度，但如果按rpxCalcBaseDeviceWidth的375px的策略执行将不再占满屏宽。

此时您有两种解决方案，一种是修改代码，将里面把rpx当做百分比的代码改掉；另一种是配置rpxCalcIncludeWidth，设置某个特定数值不受rpxCalcMaxDeviceWidth约束。如上述例子中的"rpxCalcIncludeWidth": 750，代表着如果写了 750rpx，始终将按屏幕宽度百分百占满来计算。

不少开发者之前对rpx的使用过于没有节制，后来为了适配宽屏，想要改用“局部拉伸：页面内容划分为固定区域和长宽动态适配区域”的策略，此时将回归px。

比如 DCloud社区的宽屏适配示例 和 新闻模板 都没有使用rpx。

如果想把rpx转px，可以在源码里正则替换，也可以使用三方已经写好的单位转换库。下面介绍下三方库的用法。

项目根目录新增文件 postcss.config.js，内容如下。则在编译时，编译器会自动转换rpx单位为px。

** 注意：将rpx作为百分比的用法需要手动处理

示例源码如下，请查看 pre > code 标签中的内容

uni-app理论上不限定浏览器。在HBuilderX 2.9发版时，就新闻示例项目，在chrome、Safari、firefox、edge的最新版上均测试过，可以正常使用。

一般国内的浏览器，如360浏览器、搜狗浏览器，均支持chrome内核，只要版本够新，应该都可以访问。

如果你的应用在其他PC浏览器下异常，请检查自己代码的浏览器兼容问题。

如果你发现了uni-app框架层面、内置组件有浏览器兼容问题，欢迎在github上给我们提交pr。

一般情况下，只要基础框架没有浏览器兼容问题，那么组件层面的问题也可以通过更换组件来解决。当uni-app编译到PC浏览器端时，支持所有的vue组件，包含那些操作了dom、window的ui库，比如elementUI等。

如果你的h5版已经开发完毕，还没来得及适配pc，但想在pc上先用起来。那么可以在pc网页里使用iframe，约定好宽度，在里面套用uni-app的窄屏版。

当然还可以在iframe旁边放置二维码，提供手机版扫码地址，例如：

有了宽屏适配，uni-app的应用就可以方便的通过electron打包为电脑客户端应用，windows、mac、linux均支持。

开发者可以随意调用electron的API，以调用更多操作系统的能力（为方便多端兼容，可以将这些特殊API写在自定义的条件编译里）

插件市场有已经封装好的一些插件，详见：https://ext.dcloud.net.cn/search?q=electron

流式栅格系统，随着屏幕或视口分为 24 份，可以迅速简便地创建布局。

该插件将屏幕分为五个档位：<768px、>=768px、>=992px、>=1200px、>=1920px。

对应的可以使用xs、sm、md、lg、xl来控制在不同分辨率下的显示效果。详情可在插件市场查看。

插件地址：https://ext.dcloud.net.cn/plugin?id=3958

**Examples:**

Example 1 (unknown):
```unknown
uni-app内置组件适配PC
```

Example 2 (unknown):
```unknown
PC交互习惯的UI调整
```

Example 3 (unknown):
```unknown
非webkit浏览器适配
```

Example 4 (css):
```css
.uni-app--showleftwindow + .uni-tabbar-bottom {
  	display: none;
  }
```

---

## 全局配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-api

**Contents:**
- # 全局配置
- # 全局 API
- # 选项
- # 生命周期
- # 实例属性
- # 实例方法
- # 模板指令
- # 特殊属性
- # 内置组件
- # 全局变量

实现全局变量的方式需要遵循 Vue 单文件模式的开发规范。详细参考：uni-app全局变量的几种实现方式 。

Vue 组件编译到小程序平台的时候会编译为对应平台的组件，部分小程序平台支持 options 选项（具体选项参考对应小程序平台文档的自定义组件部分），一般情况默认即可，如有特殊需求可在 Vue 组件中增加 options 属性。

示例源码如下，请查看 pre > code 标签中的内容

在 onLoad 里得到，onLoad 的参数是其他页面打开当前页面所传递的数据。

uni-app 内置了 Vuex ，在app里的使用，可参考 hello-uniapp store/index.js。

示例源码如下，请查看 pre > code 标签中的内容

由于 onError 并不是完整意义的生命周期，所以只提供一个捕获错误的方法，在 app 的根组件上添加名为 onError 的回调函数即可。如下：

示例源码如下，请查看 pre > code 标签中的内容

当重复设置某些属性为相同的值时，不会同步到view层。 例如：每次将scroll-view组件的scroll-top属性值设置为0，只有第一次能顺利返回顶部。 这和props的单向数据流特性有关，组件内部scroll-top的实际值改动后，其绑定的属性并不会一同变化。

解决办法有两种（以scroll-view组件为例）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第二种解决方式在某些组件可能造成抖动，推荐第一种解决方式。

**Examples:**

Example 1 (bash):
```bash
this.$parent
```

Example 2 (bash):
```bash
this.$parent.$parent
```

Example 3 (bash):
```bash
this.$children
```

Example 4 (bash):
```bash
this.$children.$children
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-statistic.html

**Contents:**
      - 本页导读

App端统计模块封装了市场上主流的三方移动App统计SDK，提供JS API统一调用统计功能。

注意：打包时勾选三方统计模块后会自动统计应用日活、启动次数等数据，统计API是为了扩展自定义统计数据时使用。

uni-app自带uni统计，无需使用三方统计。三方统计增加包体积且无法做到自带的免埋点采集行为数据。详见：https://tongji.dcloud.io/

使用统计功能需在项目manifest.json的“App模块配置”中勾选“Statistic(统计)”，并根据项目实际情况勾选使用的三方统计平台：

提示：统计模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## Android UTS 扩展开发 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/uts-development-android.html

**Contents:**
- # Android UTS 扩展开发
- # uts 扩展插件
- # 环境配置
  - # 上面的截图展示了以下配置：
    - # 配置 Gradle
    - # 配置 Gradle JDK
    - # 配置 Android SDK
      - # ◇ 下载 Android Studio
      - # ◇ 如不想安装 Android Studio 可通过下载 Command line tools only
    - # 配置示例

版本要求: HBuilderX 3.6.9+

HBuilderX 3.6.9+， 新增 uts 插件 Android 平台 真机运行支持通过 Gradle 下载三方仓储。

运行带有 uts 插件的项目到 Android 设备，如果您遇到以下提示，请配置运行环境

当您运行带有 uts 插件的项目到 Android 设备时，会自动安装【uts 开发扩展 - Android】插件，请务必安装。具体如下：

HBuilderX 4.27之前，入口在 设置-插件配置 中。

gradle是Android的库管理工具。如果你的电脑没有单独安装gradle的话（Android Studio自带的gradle版本太低），按如下步骤下载。

点击图标 3 的下载地址进入下载页面，选择所需要的版本。 如本地已安装 JDK 可跳过此步骤。如果本地安装过Android Studio，那么其自带JDK，路径一般在“C:\Program Files\Android\Android Studio\jre”。

将步骤 1 下载的内容解压，填入图标 4 处（Mac电脑找到 Home 目录，Win电脑为解压后的根目录），可参考文档最后的示例。

点击图标 5 的下载地址进入安卓官网，提供如下两种形式，下载Android Studio 或 单独下载 Command line tools only。

Android Studio占用体积较大，空间不足时可考虑单独下载 Command line tools only

示例源码如下，请查看 pre > code 标签中的内容

mac系统配置后如下图（根据本地目录结构有所不同）

win系统配置后如下图（根据本地目录结构有所不同）

项目依赖的三方仓储下载完成后会生成缓存，缓存如果有效，下次运行将直接跳过配置检测和下载过程。如需要缓存主动失效可清理gradle的缓存目录，正常存放于用户目录/.gradle/caches。

**Examples:**

Example 1 (unknown):
```unknown
%解压路径%/bin/gradle
```

Example 2 (unknown):
```unknown
%解压路径%\bin\gradle.bat
```

Example 3 (unknown):
```unknown
/Users/用户名/Library/Android/sdk
```

Example 4 (yaml):
```yaml
C:\Users\用户名\AppData\Local\Android\Sdk
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-android-minsdkversion.html

**Contents:**
  - # 设置minSdkVersion
    - # 注意事项
  - # Android版本列表
      - 本页导读

minSdkVersion用于指定应用兼容的最低Android版本（API等级），默认值为19（即最低支持Android4.4）。 如果APP某些功能无法支持低版本Android系统的设备，可以配置minSdkVersion确保APP只能安装到指定Android版本及以上的设备。HBuilderX中可在manifest.json中进行配置minSdkVersion。

️注意: App升级时 minSdkVersion 只能增加不能降低，也就是说 minSdkVersion 高的App无法被 minSdkVersion 低的App覆盖安装，开发者需要注意！

minSdkVersion值为Number类型，且必须为正整数，取值范围参考Android版本列表中的API等级。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “Android设置” -> “minSdkVersion” 项中进行设置：

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

配置minSdkVersion后保存提交App云端打包后才能生效，并注意以下问题：

注意：云端打包时如果其他模块或插件设置了minSdkVersion，最终最大的minSdkVersion值生效

API等级与Android版本对应列表如下：

**Examples:**

Example 1 (unknown):
```unknown
Android版本列表
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "android":{
        "minSdkVersion": 21
      }
    }
  }
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "android":{
        "minSdkVersion": 21
      }
    }
  }
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "android":{
        "minSdkVersion": 21
      }
    }
  }
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-android-schemes

**Contents:**
  - # 设置UrlSchemes
  - # 浏览器中通过href启动应用
  - # App中处理scheme启动传递的参数
      - 本页导读

Android中的url scheme是一种页面跳转协议，通过定义自己的scheme协议，可以非常方便的实现其它三方App调用你的App。

HBuilderX自带标准真机运行基座的UrlSchemes为"hbuilder://"，方便开发者调测。

可视化界面配置 打开项目的manifest.json文件，在 “App常用其它设置” -> “Android设置” -> “UrlSchemes” 项中进行设置：

注意： 字符串建议使用小写字母（不要使用特殊字符、中文等），如设置为"test"，那么其他App呼起你的app的scheme协议就是"test://"； 多个scheme使用 "," 分割，每个字符串为一个scheme； 如果可视化界面无法编辑，请切换到“源码视图”删除schemes节点数据重新操作。

源码视图配置 打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注：为了向下兼容，HBuilderX源码视图配置时schemes属性值支持字符串数组，上面示例中的值也可以这么配置["hbuilder","myuniapp"]

安装应用后，我们可以在H5页面中，通过href直接调用应用：

示例源码如下，请查看 pre > code 标签中的内容

当其它三方App通过scheme启动App时，可以通过plus.runtime.arguments获取完整的urlscheme字符串。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "schemes": "hbuilder,myuniapp"
        //...
      },
      //...
    },
    //...
  },
  //...
```

---

## js 文件引入 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-script.html

**Contents:**
  - # js 文件引入
- # NPM支持
      - 本页导读

js文件或script标签内（包括 renderjs 等）引入js文件时，可以使用相对路径和绝对路径，形式如下

示例源码如下，请查看 pre > code 标签中的内容

uni-app支持使用npm安装第三方包。

此文档要求开发者们对npm有一定的了解，因此不会再去介绍npm的基本功能。如若之前未接触过npm，请翻阅NPM官方文档 进行学习。

若项目之前未使用npm管理依赖（项目根目录下无package.json文件），先在项目根目录执行命令初始化npm工程：

示例源码如下，请查看 pre > code 标签中的内容

cli项目默认已经有package.json了。HBuilderX创建的项目默认没有，需要通过初始化命令来创建。

示例源码如下，请查看 pre > code 标签中的内容

安装完即可使用npm包，js中引入npm包：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

Example 2 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

Example 3 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

Example 4 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import add from '@/common/add.js';
// 相对路径
import add from '../../common/add.js';
```

---

## uni-app发行到微信小程序@uploadPrivateKey | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/build/publish-mp-weixin-cli.html

**Contents:**
- # uni-app发行到微信小程序
      - 本页导读

HBuilderX 3.3.7+, uni-app 发行到微信小程序，支持自动上传代码到微信平台，无需再打开微信开发者工具上传发行

通过微信小程序CI，使用上传密钥上传代码，无需打开微信开发者工具，一键完成微信小程序代码的上传、预览等操作。

---

## 运行和发行 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/runbuild.html

**Contents:**
- # 运行和发行
- # 兼容性说明
- # 开发环境要求
  - # 项目根目录与鸿蒙工程目录
  - # 在 HBuilderX 中设置 DevEco Studio 的安装位置
- # 运行的方式
  - # 启动鸿蒙模拟器
  - # 连接鸿蒙真机
  - # 运行项目到鸿蒙设备
  - # 热重载

默认情况下，HBuilderX 会在项目内的 unpackage 目录下创建鸿蒙工程目录，用于构建鸿蒙的运行包和发行包：

鸿蒙工具链对于鸿蒙工程目录的路径有一定的限制条件：不能包含中文字符和某些特殊字符，准确地说，允许在路径中使用的字符仅限于大小写英文字母、数字、正斜杠、反斜杠、下划线、连字符、冒号、句点， 如果安装了较新版本的 DevEco Studio 则还允许包含空格。

鸿蒙工具链在对鸿蒙工程目录进行构建的过程中，会在内部产生一些路径比较长的文件，在 Windows 系统中很容易超过系统对于文件路径长度的限制，从而导致构建失败。 从实测来看，留给鸿蒙工程目录本身的路径长度大约 110 个字符。如果 HBuilderX 使用了默认的鸿蒙工程目录位置，那么 uni-app 项目根目录的路径长度大约最多可以用到 77 个字符。

所以，一般而言，为了避免鸿蒙工程构建过程中出现异常情况，uni-app 项目所在的根目录应该路径不要太长，也不要包含中文或者其它特殊字符。

从 HBuilderX 4.61+ 开始支持通过配置指定使用特定的目录作为鸿蒙工程目录，这样就可以避免上述对于 uni-app 项目路径的额外限制了。 方法是在项目根目录下的 .hbuilderx/launch.json 中添加如下内容（如果该文件不存在则手动创建）：

示例源码如下，请查看 pre > code 标签中的内容

其中 distPathDev 用于指定调试运行的时候使用的鸿蒙工程目录，distPathBuild 用于指定发行打包的时候使用的鸿蒙工程目录。

指定的目录不必已经存在，HBuilderX 会创建所需的目录，如果目录已经存在的话 HBuilderX 还可能根据需要尝试删除然后重建。

通过指定鸿蒙工程目录的位置，还可以实现与原生鸿蒙工程的联编调试，具体方法可以参考 联编调试

HBuilderX 依赖于 DevEco Studio 里面带的鸿蒙工具链，所以需要电脑已经安装了符合版本要求的 DevEco Studio。

打开 HBuilderX，点击上方菜单 - 工具 - 设置，再点击 运行配置，在鸿蒙运行配置中设置 DevEco Studio 的安装路径。

HBuilderX 4.27 版本之前需要配置 manifest.json 里面设置 app-harmony.projectPath 属性。

HBuilderX 4.27+ 开始已经把鸿蒙工程模板内置到 HBuilderX 中，【运行到鸿蒙】时自动创建鸿蒙工程目录，与 uni-app 项目的编译产物合并， 然后调用鸿蒙工具链完成打包和安装、运行等操作，同时从运行设备上收集输出的日志显示到 HBuilderX 的控制台。

新的内置模板的方式虽然在调试运行过程中不再调起 DevEco Studio，但一般来说仍然需要安装 DevEco Studio，因为：

鸿蒙模拟器只能在 DevEco Studio 中启动。DevEco 5.1.1 release 开始提供 API20 模拟器，低于 API19 版本的模拟器不支持 Windows x86 平台用户开发 uni-app 鸿蒙，此处系统镜像需要选择 API >= 19 的系统版本。

在 DevEco Studio 中打开任意一个项目（也可以新建一个空项目），然后在下图的位置进入设备管理器：

如果没有登录华为账号，此时需要先登录，登录成功后看到如下页面

注意：真机需要鸿蒙系统版本 API 12 以上

打开鸿蒙手机的开发者模式，开启 USB 调试，通过 USB 线连接电脑，在此处能看到对应的设备标识符则表示连接成功

连接好鸿蒙设备之后，就可以在 HBuilderX 中把当前打开的 uni-app (x) 项目运行到鸿蒙设备上了。

HBuilderX 打开项目，或者新建一个空白的 uni-app 项目，选 vue3（也可使用已有的 uni-app vue3 项目）

点击 HBuilderX 上方【运行】菜单 - 运行到手机或模拟器 - 运行到鸿蒙

提示：目录默认是空的，用户自定义的配置需要放置在此处才能生效。请参考：更多配置指南

在编译代码构建运行包的时候，有三个缓存使用策略可供选择：

如果是运行到真机设备上，需要配置签名证书资料。 HBuilderX 4.61+ 开始支持直接配置证书资料，点击对话框中的【配置调试证书】按钮打开配置对话框，支持自动申请调试证书。 对于更早版本的 HBuilderX，建议升级最新 HBuilderX 版本获得更好开发体验。证书配置可在 DevEco Studio 里面申请证书。 参考：证书签名配置指南

HBuilderX 会对当前项目进行编译，然后把编译产物和配置文件组装到鸿蒙工程目录，再调用鸿蒙工具链进行构建、安装等操作，最终在鸿蒙设备上运行起来。

在把运行包安装到手机设备上的时候，HBuilderX 4.61 以前的版本会先尝试卸载手机设备上已安装的应用，应用的私有存储都会被删除； HBuilderX 4.61+ 开始不再先尝试卸载，而会进行覆盖安装，只有在安装失败的时候才会尝试卸载并重新安装一次。 如果需要从全新安装开始调试运行的话，需自行手动卸载。

HBuilderX 4.81+ 开始支持 uni-app x 项目启用热重载能力。

把应用运行到鸿蒙设备之后，如果修改了源代码，在 uni 编译器进行差量编译之后，HBuilderX 会尝试以热重载的模式调用鸿蒙构建工具，以节省构建时间。

启用热重载模式要求 DevEco Studio 版本为 5.1.1.823+，如果条件不满足，将自动回落到原来的全量构建模式。

本功能实际是调用 DevEco 新版提供的 arkts 热重载能力，热重载速度由 DevEco 决定。

参考鸿蒙文档 使用 DevTools 工具调试前端页面 进行处理。在 uni-app 的开发模式下 setWebDebuggingAccess 会自动开启，此步骤可以跳过。

业务逻辑 debug 可参考 JSVM-API 调试&定位

HBuilderX 4.61+ 开始支持 uts、uvue、ets 的调试文档地址 ，支持断点调试，可以在控制台里面点击调试按钮开启。

点击【开启调试】按钮的时候如果还在编译阶段，则会在后续应用运行起来的时候进入调试状态。

如果点击时应用已经运行起来，则直接进入调试状态，此后代码运行遇到断点就会停下来，但应用启动阶段的代码断点因为已经错过了时机而不会停下来，要想调试那些代码的话可以点击旁边的【重启应用】按钮。

数字签名证书的配置最终需要落在鸿蒙工程根目录中的 build-profile.json5 文件中起作用。

对于 HBuilderX 4.61 以前的版本，需要手动配置 harmony-configs/build-profile.json5 文件，该文件在构建阶段会覆盖到自动生成的鸿蒙工程的 build-profile.json5 文件中。

从 HBuilderX 4.61+ 开始支持以交互方式配置相关信息（且支持自动申请调试证书），这些信息在构建阶段会被覆盖填写到鸿蒙工程的 build-profile.json5 文件中。

为了兼容以前的版本，如果没有以交互方式配置签名证书，则在 harmony-configs/build-profile.json5 中配置的相关信息仍会有效。

从 HBuilderX 4.61+ 开始支持这种配置方式。在【运行到鸿蒙】操作的【选择运行设备】对话框中，点击【配置调试证书】按钮，打开配置对话框：

在 manifest.json 的编辑页面中，【鸿蒙 App 配置】里面也有打开配置对话框的按钮，分别用于配置调试证书和发布证书：

如果已经在 AppGallery Connect 中手动申请过证书，则开发者手中应该已经掌握了所有的必备信息（三个文件，两个密码和一个私钥别名），填写到对话框中即完成配置。 其中三个文件的位置如果位于 harmony-configs 目录里面，则会被处理为相对路径。

如果是通过 DevEco Studio 自动申请的调试证书，在 build-profile.json5 文件里能找到完整的证书配置信息。 需注意的是，在保存那三个文件的目录里还应该有一个 material 子目录，它跟私钥库文件（.p12）和两个密码是配合使用的，如果想把私钥库文件移到别的地方去，这个 material 目录也要复制过去（否则密码将失效）。

也可以在对话框中填写手动申请到的证书，填写的时候注意三个文件要在同一个目录。

自动申请得到的签名描述文件是跟给定的包名绑定的，只能用于对设置了相同包名的项目进行签名。

如果是自己手动申请的签名证书，请注意与这里的包名保持一致，否则在填写了签名描述文件之后会出现提示警告。

只有在配置调试证书的对话框里有这项内容。当自动申请调试证书的时候，得到的签名描述文件与给定的设备是绑定的，签名后的应用只能运行于这里列出的设备。

如果是自己手动申请的签名证书，请注意签名描述文件里面包含了这里列出的所有设备，否则在填写了签名描述文件之后会出现提示警告。

点击左侧的【检测】按钮会自动检测出当前已经连接的运行设备（真机或者模拟器），并自动填写到文本框里。

填写的内容是设备的唯一标识，可以填写多个，用半角逗号或者换行符分隔。

如果没有填写有效的设备唯一标识，则无法进行自动申请调试证书的操作。

私钥库密码和私钥密码需符合一定的要求：须由 6 ~ 64 个字符组成，可包含大小写字母、数字以及如下特殊字符 ~!@#$%^&*()-_=+\|[{}];:\'",<.>/?，首字符不能为连字符（-）。

如果是在 AppGallery Connect 中手动申请的证书，开发者应该知道申请时所使用的密码，直接在这里填写就可以了。

如果是通过 DevEco Studio 自动申请的调试证书，在 build-profile.json5 文件里能找到证书配置信息，其中的密码是加密过的，一般是 76 个或更多的 HEX 字符。 这种加密后的密码也可以直接拿来填写，但需要注意，这种密码要跟前面提到的 material 目录配合使用，否则在签名时将会发生错误。

对于调试证书，可以选择自动申请，此时 HBuilderX 会使用开发者授权的账号身份调用 AppGallery Connect 的 API 来自动完成证书的申请和配置。

受 API 提供能力的限制暂时无法申请到包含了 ACL 权限的调试证书，如果应用中有使用到 ACL 权限，则仍需采用 下一节介绍的方式 配置签名证书。

点击【自动申请】按钮，会触发浏览器打开华为的登录授权页面：

回到 HBuilderX 的对话框中，正常情况下完成自动申请之后，点击【保存】按钮保存即可。

如果自动申请过程中出现错误，可根据错误提示信息进行处理：

数字证书是由华为的 AppGallery Connect 服务系统（简称 AGC）颁发的，开发者首先需要先注册鸿蒙开发者账号 ，然后再到 AppGallery Connect 申请数字证书。

登录 AGC 之后，进入【证书、APP ID 和 Profile】中的【APP ID】页面，为指定的包名创建应用，然后才能为该应用申请证书。

申请的调试证书中需要包含当前正在使用的鸿蒙设备（真机或者模拟器）的标识，该设备标识首先需要在 AGC 中注册。

HBuilderX 会尝试自动把当前运行设备的标识注册到 AGC 中，如果失败，请手动在 AGC 中注册： 登录 AGC 之后，进入【证书、APP ID 和 Profile】中的【设备】页面，把当前设备的 UDID 添加到设备列表中。

可以在前面提到的 运行设备 得到鸿蒙设备的 UDID 标识， 也可以通过如下的命令行来获取，具体请参考 华为的官方文档 ：

示例源码如下，请查看 pre > code 标签中的内容

AGC 中每个开发者账号可以创建的证书是有数量限制的，如果已经达到限制则需要删除一些以释放额度。

登录 AGC 之后，进入【证书、APP ID 和 Profile】中的【证书】页面，从证书列表中删除掉一些已经不再需要的证书。

需要注意的是，如果删除了某个证书，则基于该证书生成的 profile 文件也将失效，可以进入【Profile】页面在列表中找到失效的 profile 并删除掉。

HBuilderX 4.61 之前的版本，只能通过 harmony-configs/build-profile.json5 文件来配置签名证书，里面的证书资料信息只能由 DevEco Studio 来生成, 即使是自己在华为 AppGallery Connect 网站上手动申请的证书，也需要填写到 DevEco Studio 里面才能最终得到所需的 build-profile.json5 文件。

DevEco Studio 须先打开一个鸿蒙工程才可进行证书相关的操作，建议先执行一次【运行到鸿蒙】，然后在项目的 unpackage 目录下找到临时生成的鸿蒙工程目录， 在 DevEco Studio 里面打开后再进行后面的操作。 如果是自己在 DevEco Studio 里面独立创建一个新的鸿蒙工程，虽然也可以用于申请证书，但需注意以下几点：

由于证书资料中包含应用的包名，所以在这个鸿蒙工程中设置的应用包名应该与将要开发的 uni-app 应用项目中设置的鸿蒙应用包名（在 manifest.json 中设置）相一致，这样申请到的证书资料才会有效；

这个鸿蒙工程的根目录中的 build-profile.json5 文件中的内容应该与 HBuilderX 自动生成的鸿蒙工程中的对应文件保持一致（随着版本迭代该文件的内容可能会有少许变化），否则在后续操作中可能产生异常。

如果有用到 ACL 权限，需在 entry/src/main/module.json5 中声明，这样获得的证书中才能包含相关的授权。参考 权限配置指南

完成申请证书的操作之后，把这个鸿蒙工程中的 build-profile.json5 文件复制到 uni-app 项目的 harmony-configs/build-profile.json5 即可。

点击 DevEco Studio 上方菜单 File - Project Structure...

在使用模拟器进行调试运行的时候，一般是不需要做数字签名的，但如果是用真机进行调试运行，或者业务代码用到了 ACL 权限，那么就需要申请并配置一个调试证书用于数字签名。

在对话框中选择 Project - Signing Configs，并勾选 Automatically generate signature，即可自动生成签名证书资料

通过 DevEco Studio 自动申请得到的证书，缺省会保存到电脑的用户目录下，在 Windows 系统中一般是 %USERPROFILE%\.ohos\config，在 Mac 系统中一般是 ~/.ohos/config。 配置信息中包含的三个文件缺省都是采用绝对路径来表示，也可以把这些文件移到 harmony-configs 目录下，这样就可以使用相对路径来表示，相对于 harmony-configs 目录。 如果要移动证书文件的位置，需注意跟这三个文件一起的还有一个名为 material 的目录，也要一起移动。

也可以在对话框中填写手动申请到的证书，填写的时候注意三个文件要在同一个目录。

完成以上操作后，鸿蒙工程中的 build-profile.json5 文件就包含了完整的调试证书配置信息（在 app.signingConfigs 数组里，name 属性的值是 "default"）。

在发行安装包的时候，一定需要配置一个发布证书，否则只能拿到一个未签名的安装包，是无法实际使用的。

发布证书只能手动申请，申请完成后把拿到的相关资料文件填写到 DevEco Studio 里面，填写的时候注意三个文件要在同一个目录。

在对话框中选择 Project - Signing Configs，不要勾选 Automatically generate signature，创建一个名为 release 的配置项。

完成以上操作后，鸿蒙工程中的 build-profile.json5 文件就包含了完整的发布证书配置信息（在 app.signingConfigs 数组里，name 属性的值是 "release"）。

无论是调试证书还是发布证书，生成的证书资料信息都在鸿蒙工程根目录下的 build-profile.json5 文件中，把这个文件复制到 uni-app 项目的 harmony-configs/build-profile.json5 即可。

使用 HBuilderX 4.28+，点击【发行】-【App-Harmony-本地打包】

如果项目中没有 harmony-configs 目录，此时会自动生成。

如果日志窗口提示没有配置签名证书资料，则去 配置发布证书的资料

配置完证书资料后，再次点击【发行】- 【App-Harmony-本地打包】即可得到已签名的 .app 安装包文件

最后还需参考鸿蒙官方文档发布鸿蒙应用到应用市场，详见文档

在应用内测和企业应用场景，有时候需要绕过华为应用商店，直接向部分特定的手机设备分发安装包。 此时可以从 AppGallery Connect 申请内部测试证书，并通过 HBuilderX 的调试运行操作得到 .hap 运行包， 然后再编写相关的分发描述文件上传到自己的服务器供手机用户下载安装。

具体操作过程可以参考 ASK 社区文章 鸿蒙企业应用内部分发打包教程

部分 API 需要在配置文件显式声明权限才能调用，权限的配置文件路径为：/harmony-configs/entry/src/main/module.json5，配置节点为：requestPermissions，如下图所示

这里举例鸿蒙位置定位的权限和如何设置，阅读 鸿蒙 uni.getLocation 的权限配置，这里详细描述了每一个步骤如何操作。

还有一些针对特定企业管理的权限，场景比较特殊，这里不做进一步描述。

Q: 鸿蒙如何申请位置定位权限？ A: 可参考 uni.getLocation 描述，鸿蒙位置权限，精准定位和模糊定位务必成对出现，否则会被驳回

Q: 鸿蒙如何申请读取用户图库、文件？ A: 鸿蒙曾开放读取用户存储的权限 READ_MEDIA/WRITE_MEDIA，但已废弃 。因此鸿蒙中不能直接读取和操作用户目录。官方提供了绕过方案，一般场景下，读取媒体和文件方案是使用 uni.chooseImage/uni.chooseFile，背后封装了鸿蒙官方提供的 Picker 选择器，无需申请权限，直接使用即可。

鸿蒙针对应用克隆、备份图片文件场景提供了 ohos.permission.READ_IMAGEVIDEO/ohos.permission.WRITE_IMAGEVIDEO 两个受控开放权限，需要 鸿蒙单独申请 ，审批通过之后方可使用。

存储文件，图片可直接调用 uni.saveImageToPhotosAlbum 存储到系统相册。存储文件可用 uni.saveFile，

编辑文件，可参考 uni.getFileSystemManager 文档。

在鸿蒙工程中，子模块中申请的权限无需在主项目中重复添加，权限将在整个应用中生效，而 UTS 插件在打包进入鸿蒙工程后，就是作为一个子模块存在，可以在 UTS 插件中即可实现应用的权限配置

通过此插件可以方便的配置权限，而无需在 uni-app 工程中通过替换文件的方式配置权限

HBuilderX 支持把 manifest.json 里面的一些配置项传递给鸿蒙工程，打开这个文件，下面这些配置项与鸿蒙相关：

目前这里的应用名称、应用版本名称、应用版本号将传递给鸿蒙工程使用。

以上的配置项有可能随着 HBuilderX 的升级而有所增加，其优先级高于后面所述的 harmony-configs 目录。如果这些仍没有满足需求，则可以自行在 harmony-configs 目录中进行配置。

项目的根目录下有一个 harmony-configs 目录，每当执行跟鸿蒙相关的操作时，HBuilderX 都会检查这个目录，如果目录不存在则会自动创建。 HBuilderX 早期版本所创建目录初始会存在几个常用的配置文件，4.36+ 版本该目录初始为空。

在执行运行或者发行到鸿蒙的操作过程中，HBuilderX 会根据内置模板生成一个鸿蒙工程目录（一般在 unpackage 目录下），然后把 harmony-configs 目录下的所有内容都原样覆盖过去， 然后再调用鸿蒙的工具链进行编译打包等操作。

所以，harmony-configs 目录中的所有文件最终都会原样进入鸿蒙工程目录参与项目构建，所有需要对鸿蒙工程的定制化配置都可以写在这个目录下。

关于 harmony-configs 目录的使用要遵守鸿蒙的技术规范，具体可参考 鸿蒙官方文档

harmony-configs/build-profile.json5

其中的 app.signingConfigs 用于设置数字签名资料，参见 证书签名配置指南

HBuilderX 4.61+ 开始已经支持在 HBuilderX 里面直接配置证书签名，建议采用此方式，无需使用 build-profile.json5。

harmony-configs/entry/src/main/module.json5

修改其中的 module.requestPermissions 来设置运行权限，参见 权限配置指南

harmony-configs/AppScope/app.json5

其中的 app.bundleName 用于设置应用包名。 HX 4.31+ 已经支持在项目的 manifest.json 里面以图形界面修改应用包名，如果在那里做了设置，将优先于这里的设置。

其中的 app.versionName 和 app.versionCode 用于设置应用版本名称和版本号。 HX 4.43+ 已经支持使用项目的 manifest.json 里面的应用版本名称和版本号，将优先于这里的设置。

一般而言，新版本已经不再需要 harmony-configs/AppScope/app.json5 文件了。

manifest.json 里面已经支持一些应用配置项，未直接支持的可以通过 harmony-configs 来设置，详情参见 更多配置指南。

同时可以参考鸿蒙官方文档：应用/组件级配置

为保证图标在系统内显示的一致性，应用预置的图标资源应满足以下要素：

启动页可以配置背景色代码（默认为#FFFFFF）和一张启动图，启动图没有尺寸要求，但建议为正方形 logo 图

仅 APP-HARMONY 和 APP 可以条件编译命中鸿蒙平台，APP-PLUS 不能命中鸿蒙平台

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.27 以前的版本需要在 DevEco Studio 中运行由 uni-app 项目生成的鸿蒙工程，虽然鸿蒙官方文档提供了如何开启热重载，详见文档 ， 但目前只能针对 ets 文件的修改进行热更，还无法针对 uni-app 打包的 js 文件进行热更。

HBuilderX 4.27+ 支持直接运行到鸿蒙设备，修改源代码之后需重新调用鸿蒙工具链编译打包，并重新安装到鸿蒙设备上运行，不支持热重载。

HBuilderX 4.41+ 支持热重载，但跟具体修改的代码文件有关，如果进行了无法热重载的修改，会自动重新安装整个应用并重新运行。

运行到鸿蒙时，在 uni-app 页面通过 console.log 打印日志可以直接在 HBuilderX 查看。

HBuilderX 4.41+ 在真机运行时需要连接到与主机电脑相同的局域网才能正确接收到日志。

注意：在 UTS 代码里面打印对象或数组时，需要 JSON.stringify 才能正确显示内容，如 console.log("obj", JSON.stringify(obj))

HBuilderX 早期版本使用鸿蒙工具链中的 hilog 来收集日志并显示，可能因为设备连接问题或者鸿蒙系统版本升级调整等原因导致日志收集不到。

HBuilderX 4.41+ 在真机运行时需要连接到与主机电脑相同的局域网才能正确接收到日志。

另外，HBuilderX 4.41+ 在控制台工具条中增加了“显示原生日志”的选项，开启后可以看到更多的日志内容。

作为一个应急处理方案，可以打开一个命令行窗口，执行命令 hdc shell hilog -T JSAPP 来直接从连接的鸿蒙设备查看日志。

如果你的项目能安装到模拟器上，但是打开闪退，如果你是 Windows 系统，你可能使用了低于 API19beta 的模拟器，阅读 开发环境要求 进行下载安装。

如果配置了 harmony-configs/build-profile.json5 文件，请确认里面的 app.products设置了 "useNormalizedOHMUrl": true。

如果不是上述的原因，最常见的情况就是使用了不支持的组件或者 API，请逐个排查所使用的组件和 API 是否已经兼容了鸿蒙平台，先保证空白工程能运行，排除你的环境、配置问题。pages.json 只保留一个页面，先自行验证，每个人的问题不一样，需要先自查，可能的问题比如用到了 plus api，用到了条件编译忽略了 app-android 导致逻辑命中失败。

二分排查速度最快，可以尝试对 pages.json 进行代码二分法排查（删除一半页面如果正常了代表被删除的那一半页面中有造成白屏或闪退的页面）。

也可以查阅 HBuilderX 的原生日志、DevEco 的 log 面板日志，筛选 Warn 级别的日志，观察是否有错误。

确保签名证书资料没有问题的情况下，尝试重启电脑

此问题仅会在 HBuilderX 4.27 以前的版本存在，因为编译 uni-app 代码完成之后需要调起 DevEco Studio 来运行鸿蒙工程。

请用下面的方法确保设置的 DevEco Studio 安装路径是正确的，重新设置之后请重启 HBuilderX。

原路径后面添加 /bin/devecostudio64.exe，然后重启 HBuilderX

原路径后面添加 /Contents/MacOS/devecostudio，然后重启 HBuilderX

当前导航栏未支持，可以尝试关闭原生导航栏，使用自己的自定义导航栏组件实现。

HBuilderX 4.31 起支持 uniPush 推送，具体配置请参考文档

uniPush 初始化时候需要读取 OAID，这对应 ohos.permission.APP_TRACKING_CONSENT 权限，可参考 权限配置指南 定义为下面方案，并在 string.json5 中补充自定义 Reason_TRACKING 文案。

示例源码如下，请查看 pre > code 标签中的内容

这里举例鸿蒙位置定位的权限和如何设置，阅读 鸿蒙 uni.getLocation 的权限配置，这里详细描述了每一个步骤如何操作。

此问题由于 arkTs 的混淆 Bug 引发，即使进入到一个空的组合式 api 页面也会出现这个报错，已反馈给鸿蒙团队处理。

临时解决方案：在鸿蒙项目entry/obfuscation-rules.txt文件中增加一行-disable-obfuscation来禁用混淆。

此章节仅针对 HBuilderX 4.29 及之前版本，4.31 及之后的版本暂不支持在 x86_64 平台的模拟器上运行。

在 x86_64 平台（绝大多数 Windows 系统和部分 MacOS 系统）上使用【运行到鸿蒙】并选择了模拟器作为运行设备的时候，可能会遇到这个报错。

这是由于 HBuilderX 4.29 及之前版本在默认配置里面依赖了支付宝 SDK，而这个包不支持运行在 x86_64 平台的模拟器上，所以在打包后安装到模拟器设备时会报错。

出现这种情况时，如果并不需要这个依赖，可以修改 harmony-configs/oh-package.json5 文件，在 dependencies 里面删除 @cashier_alipay/cashiersdk 就行了； 如果确实需要，那就只能改用真机设备来运行了。

uni-app/uni-app x 用户可参考 uni-app 调试方案 进行调试。

目前下载 API19 模拟器即可运行 uni-app 鸿蒙项目和元服务，点击下载 DevEco5.1.1Beta 版本，低于此版本的模拟器不支持在 Windows 平台运行模拟器。

在满足兼容性要求的前提下，如果要在 Windows 系统如使用模拟器则需要开启以下功能

打开控制面板 - 程序与功能 - 开启以下功能

注意: 需要 win10 专业版或 win11 专业版才能开启以上功能，家庭版需先升级成专业版或企业版

cli 项目的 uni-app 编译器是跟随项目配置的，跟 HBuilderX 的版本并不直接相关，如果是以前创建的 cli 项目，可能因为关联的编译器版本太低而出现此现象。

建议升级 cli 项目的编译器版本，参考 更新编译器的版本

删除 harmony-configs 目录（如果目录里有自己修改过的内容请先做好备份），再删除 unpackage 目录，然后重试。

源代码中有资源文件（比如图片）带有只读属性，导致再次打包的时候鸿蒙工具链删除失败报错。找到有问题的文件去掉只读属性，再删除 unpackage 目录，重试即可。

HBuilderX 在打包的时候会调用鸿蒙的工具链，其中用到了 java 程序，这种问题一般是因为 java 程序版本不匹配导致的。 早期版本是优先使用环境变量 PATH 里面能找到的 java 程序，临时的解决办法是在 PATH 环境变量里去掉 java 程序的路径，再重新启动 HBuilderX。 HBuilderX 4.31+ 会优先使用鸿蒙工具链自带的 java 程序，就不会是这个原因了。

检查电脑上安装的 java 版本，可能是版本过低。建议卸载 java 或者在 PATH 环境变量里去掉 java 的路径。 新版本（4.31+）已调整为优先使用鸿蒙工具链自带的 java 就不会受这个影响了。

鸿蒙工具链运行时要求所涉及到的文件的路径总长度不能超过 255 个字符。请尝试把 uni-app 项目的目录位置改到一个比较短的路径下，可能会避开这个问题。

鸿蒙工具链在首次运行的时候需要安装一些依赖的工具，且此操作只能在 DevEco Studio 中才能正确执行，方法是在 DevEco Studio 里面随便创建一个工程然后构建运行一下即可。

如果在 DevEco Studio 里面也报了同样的错误，则可以尝试自行设置 npm 的镜像源来解决问题，比如设置环境变量 NPM_CONFIG_REGISTRY=https://registry.npmmirror.com 使用境内的镜像源。

可能是使用的 DevEco Studio 版本过低，要求 5.0.3.800+。

也可能是自行配置的 harmony-configs/build-profile.json5 文件里面有错误，导致 DevEco Studio 无法正确解析。 请参考 文档 的方法确保配置正确。

如果项目中配置的签名证书资料有误，则会报这个错，常见的原因是指向的文件不存在，或者密码设置错误。

请参考 证书签名配置指南 检查相关的配置项。

这是由于默认配置里面声明申请了一些权限，其中包含受限权限（需要白名单授权的 ACL 权限），这就要求安装包必须用具备足够权限授权的数字证书进行签名，否则无法安装到设备上。

如果业务代码里面并没有实际使用到这些权限，一个简单的办法就是修改 harmony-configs/entry/src/main/module.json5 文件， 删除 module.requestPermissions 数组里面涉及这三项的内容，重新运行即可。 注：从 HX 4.31+ 开始默认配置中已经不再包含 ACL 权限，如果需要的话请自行修改 harmony-configs/entry/src/main/module.json5 文件添加权限声明。

如果确实需要这里的某些权限，那就需要申请一个调试证书，并配置到 harmony-configs/build-profile.json5 文件的 app.signingConfigs 中。 具体请参考 调试用的数字签名证书

如果配置了签名证书，打包之后会进行签名，但如果项目中配置的 bundleName 与签名证书申请时所填报的 bundleName 不符，就会报这个错。 可以修改 harmony-configs/AppScope/app.json5 文件中 app.bundleName 为签名证书申请时所填的应用包名， 也可以根据配置的 bundleName 重新申请证书。

注：从 HX 4.31+ 开始应该在项目的 manifest.json 文件的【鸿蒙 App 配置】中设置【包名】。

当运行到鸿蒙时，在把打包后的 .hap 安装到设备上时可能会遇到这个报错。常见的原因是当前使用的设备 UUID 没有添加到签名用的 profile 文件中。

推荐使用 manifest.json 提供的 自动申请调试证书 进行一键更新。

如果你是手动维护的证书，首先要 注册调试设备 ， 然后 申请调试 Profile 或修改已有的 profile 文件并重新下载。

当运行到鸿蒙时，如果选择真机为运行设备，则必须配置好数字签名证书，否则无法安装到真机上。 具体的配置方法请参考 证书签名配置指南

当运行到鸿蒙时，所使用的签名证书与鸿蒙设备中已安装的应用不一致，此时无法覆盖安装。请先手动删除已安装的应用。

当运行到鸿蒙真机时，需要在手机上信任授权给调试设备（当前运行 HBuilderX 的电脑），如果没有信任授权，则电脑无法安装应用到手机上，就会报这个错。

重新连接手机到电脑，在弹出提示框的时候选择信任并授权。必要时可以进入手机的【开发者选项】重新设置。

有记录显示，在 Windows 系统下，运行到鸿蒙时如果选择模拟器作为运行设备，可能会出现超时的情况，原因尚不清楚，有可能与模拟器系统里存在以前安装的相同包名的应用有关， 如遇这种情况，可以尝试手工在模拟器里面删除旧的应用然后重试。

由于未知原因导致【鸿蒙真机运行】插件出现破损，需要重新安装。 请在 HX 主菜单中选择【工具>插件安装>已安装插件】，找到【鸿蒙真机运行】插件并点击卸载，然后切换到【安装新插件】页签点击【鸿蒙真机运行】重新安装即可。

为了能够重建完整的鸿蒙工程目录，HBuilderX 需要先删除旧的鸿蒙工程目录，但是由于某些原因（比如其中有文件被其它程序占用，比如源码在 MacOS 文稿中并开启了 iCloud 云同步）导致删除失败。 为确保正确执行后续的操作，请先设法手工删除该目录，然后再重新开始操作。

应该在 manifest.json 的【鸿蒙配置】中设置正确的包名，具体要求请参考 配置应用包名

需要在工程级的 build-profile.json5 的 products 字段（如果有多项都要配置）中配置 compatibleSdkVersionStage: "beta6" 后重新运行 鸿蒙文档

如果是发行阶段报错，可能底层依赖有较高版本的基础要求，可修改 harmony-configs/build-profile.json5 中的 products[1]， 修改 compatibleSdkVersion:"5.0.5(17)" 提高应用兼容版本。

在把 uni-app 项目运行到鸿蒙设备上以后，修改代码后会触发差量编译，然后会对鸿蒙设备中运行的应用执行热更新操作。在某些情况下有可能出现此种报错。

首先确认在鸿蒙设备里确实已经运行了应用，然后尝试在 HBuilderX 里面重新运行到鸿蒙看是否能解决问题。

在某些电脑环境下，存在一种偶发的情况也会导致出现此种报错，原因尚不完全清楚，重启 hdc server 可以解决问题。 hdc 是安装 DevEco Studio 时自带的鸿蒙工具链中的一个重要工具，正常情况下它的安装位置在：

在命令行中执行 hdc kill -r 命令以重启 hdc server，然后在 HBuilderX 里面重新运行到鸿蒙即可。

如果上述命令仍未能解决问题，就需要自行查找 hdc server 进程并杀掉它。在 MacOS 系统下可以使用下面的命令：

示例源码如下，请查看 pre > code 标签中的内容

在 Windows 系统下可以打开任务管理器找到 hdc 进程（一般显示名为 POSIX WinThreads for Windows）杀掉即可。

这个模块 HBuilderX 目前不需要，说明你的 build-profile.json5 没有从 HBuilderX 工程的 unpackage 目录中读取，而是从 DevEco 新建工程里读取的，两者产生了差异。

解决方法：移除 harmony-configs 目录里的 build-profile.json5 ，重新启动并选择清除缓存重新操作，从 unpackage 目录中获取 build-profile.json5 文件放置到 harmony-configs 目录内。

在鸿蒙应用、鸿蒙元服务中可以开发卡片，放置到桌面上，展示特定的应用数据、提供快速启动应用的入口。目前，卡片开发有两种方式：

下面介绍如何开发基于 UI 的卡片，思路和原生开发一致，推荐在 DevEco 中完成卡片开发。

此时，就有了默认的卡片，点击会打开默认应用入口。

更多 API 和数据共享参考 开发卡片事件

鸿蒙平台文档要求 用户首次打开应用，需要同意用户协议与隐私政策，才可进入应用，目前有两个方案实现隐私协议弹窗：

自行绘制。目前鸿蒙隐私弹窗可自行实现，正常在应用启动时候弹窗即可，自己存储用户同意状态。可参考 hellouniapp 线上应用。容易定制效果，自行处理用户同意状态。

托管隐私协议。华为开发者平台提供了隐私协议托管的服务，通过填写表格，完成合规的隐私协议，经过审核之后，最终得到托管网页网址。上架时候选择隐私托管协议即可，正式上线之后，应用会自动提示隐私协议。可参考《隐私管理服务 》。

经检测发现，您的应用使用了 HarmonyOS beta 版本的 API。 修改建议：为提升消费者使用体验，请使用 HarmonyOS release 版本的 API 开发应用，申请上架。请参考版本说明集成 release 版本 API

解决方案：重新下载 release 版本的 DevEco。代码不变，重新发行打包，之后上传提审即可。

Mac 电脑的外接硬盘如果使用了非 Mac 的文件系统（比如 ExFAT 文件系统），Mac 系统会启用资源分叉机制，即为每个文件和目录自动创建一个资源分叉文件（在原本的文件/目录名前面添加一个 ._ 作为文件名），用于保存相关的元信息。

当在这样的文件系统上创建 uni-app (x) 项目目录时，由于 HBuilderX 自动创建的鸿蒙工程目录也在这个文件系统上，而这些资源分叉文件将对鸿蒙工具链产生干扰导致执行异常。 其实在这个场景下，这些资源分叉文件并无实际用途，是可以安全删除的。

HBuilderX 4.81+ 在这种情况下会自动删除鸿蒙工程目录内的所有资源分叉文件。

这个操作会额外消耗一些性能，如果想避免的话，最好的办法还是尽量避免使用非 Mac 的文件系统。

此问题也已经反馈给华为方面，未来 DevEco Studio 也应该能正确处理这种情况而不再报错了。

【腾讯地图】HBuilderX 内置集成了鸿蒙版本腾讯地图，可在 manifest.json 文件鸿蒙 App 配置 - uni-map 地图，勾选腾讯地图。详情可见 uni-app 组件 map

【高德地图】，可使用 uniapp 嵌入鸿蒙原生组件 提供的能力自行接入高德地图，在插件市场搜索 高德 鸿蒙 查阅社区提供的封装能力。

【华为地图】，华为地图目前可免费使用，目前 uniapp 提供了同层渲染的 华为花瓣地图 示例可供参考使用。访问 华为 AGC 开发者后台 ，选择 开发与服务 - 项目设置 - 开放能力管理 - 选择应用 - 勾选开启地图服务。具体使用方案可见插件文档。

鸿蒙中目前支持系统定位，细节配置可参考 API uni.getLocation 鸿蒙配置说明

鸿蒙和 iOS 一样不支持侧载，打包得到的 app 无法安装到任意用户的手机上。

如果是内部需要测试，可以使用调试模式安装到指定的手机上进行测试。本地调试。把对应手机的 UUID 录入 AGC 证书中，然后手机开启开发者模式并连接电脑，在 HBuilderX 中选择运行。

鸿蒙提供的类似 TestFlight 白名单测试服务，访问 AGC 后台 找到 APP - 应用测试 - 版本列表，这里可以生成邀请链接，在白名单内的用户可以下载安装，这个过程也需要提交给华为做审核，对软件的完善程度有一定的要求，适合开发中后期内部测试。

完整测试方案，可参考鸿蒙文档 《AGC 内部测试 》。

在鸿蒙中，设置 userAgent 和 app-plus 配置相似，在 manifest.json 中设置 app-harmony.useragent，具体可参考 鸿蒙 userAgent 配置。

有些移动端网页是检测的 userAgent 来判断是否为 mobile 机型，进而展示移动端适配页面，判断规则中可能缺少判断，这种情况下可参考这个帖子进行兼容。经验分享 鸿蒙通过 WebView 打开页面渲染成桌面 pc 模式怎么办？

这个问题出现在 MacOS 中，你可直接粘贴下面值，此问题后续会修复。 /Applications/DevEco-Studio.app

可参考 UTS 插件介绍 ，新建 uts api 插件，填写下面代码放入 app-harmony/index.uts

示例源码如下，请查看 pre > code 标签中的内容

目前可升级鸿蒙 5/鸿蒙 6 的真机列表在这里：HarmonyOS 6 支持机型

这里特别补充鸿蒙真机不一定都是旗舰机，有一些中端机、旧机可供参考，价格在一千到两千元，比如 Nova14/畅享 70X（2025 年发布的新机），比如 nova12pro （旧机），这两款机器价格较低，可升级鸿蒙 5/6 系统。

近期有用户反馈，应用无法响应键盘 tab 按键

应用/元服务中的走焦事件能够响应 tab 键或方向键切换。https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/device-compatible

在电脑、平板、折叠电脑上属于规则级别，也就是强制要求。

临时规避方案 1，自行明确当前是否需要支持平板，如果目前不需要可在代码中搜索 devicetype，保持为 phone ，在 uniapp 后台、agc 后台表格里只勾选手机，也就是避免支持平板。

解决方案 2：你可在指定的组件中，添加 tabindex，从而让功能区支持 tab 切换。目前规则中未明确要求支持回车按键，可忽略处理，也可在组件中，使用 renderjs ，在 renderjs 的 mounted/unmounted 里监听、取消监听 addEventListener keydown 相关事件，主动触发 click

可参考来自社区热心用户的方案，请参考 https://ask.dcloud.net.cn/question/215693 评论区。

自动申请调试证书时总是检测不到设备怎么办？设备已经加到 AGC 中了。 25 年 12 月开始，华为调整了查询设备信息的接口，影响了现有代码处理逻辑。两个处理方案：使用手动签名或者调整代码做兼容。

在 HBuilderX 安装目录找到 plugins/launcher/out/main.js 文件，查找和替换下面文件

示例源码如下，请查看 pre > code 标签中的内容

目前 uni-app x 已支持付费鸿蒙 uts 插件，用户可通过 uts 插件试用功能进行体验。云打包相关版本参数目前为 commandline-tools-linux-x64-5.0.13.220。

uts 中使用鸿蒙 API 如果有兼容性顾虑，可参考这个指导方案，判断来 DeviceInfo 返回信息。《应用使用 API 兼容性保护判断的指导 》。

HarmonyOS 设备各 API 版本使用量占比如下，开发者可根据占比来为应用合理定义需要兼容的 API 版本，参考 《存量设备 API 版本使用数量参考 》。

自 5.0 alpha 开始，hx 支持对项目代码进行鸿蒙兼容性检测。开发者如果有兼容鸿蒙的需求，可以根据控制台的提示，做出相应的修改。

示例源码如下，请查看 pre > code 标签中的内容

hx 检测到此处代码只判断了安卓端，会以黄字提示开发者未适配鸿蒙，可能造成鸿蒙版微信下异常；开发者可以根据自己的需求修改代码或者点击近期不再提示，以使 hx 不再检测相关内容。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
versionName
```

Example 3 (unknown):
```unknown
versionCode
```

Example 4 (unknown):
```unknown
harmony-configs/AppScope/app.json5
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-icons.html

**Contents:**
  - # Android平台
    - # 云端打包
    - # 离线打包
  - # iOS平台
    - # 云端打包
      - # iPhone图标源码参数
      - # iPad图标源码参数
    - # 离线打包
  - # 常见问题
    - # iOS平台配置/更新图标后打包安装，图标显示不正确

HBuilderX中打开项目的manifest.json文件，在“App图标配置”中可以设置App的桌面图标，推荐使用“自动生成图标”功能：

如果不使用自动生成图标方式，可按下面文档分别配置Android和iOS平台的图标。

提示：可能有些特殊手机ROM对图标有所要求，提交相应应用市场时注意看是否有要求

可视化界面配置 推荐在可视化界面操作配置，在“Android图标配置”下根据分辨率选择对应的图标：

源码视图配置 切换到源码视图界面，在 "app-plus"->"distribute"->"icons"->"android" 节点根据以下属性配置对应分辨率图标路径：

提示：5+ App项目源码视图节点为app->distribute->icons->android

默认图标 云端打包没有配置图标时将使用以下默认图标：

离线打包需在原生工程中配置应用图标，参考Android原生工程配置

更多应用图标相关信息，参考苹果官方说明：https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/app-icon/

可视化界面配置 推荐在可视化界面操作配置，分别在“app store”、“iPhone图标配置”、“iPad图标配置”下根据分辨率选择对应的图标：

源码视图配置 切换到源码视图界面，在 "app-plus"->"distribute"->"icons"->"ios" 节点根据以下属性配置对应分辨率图标路径：

离线打包需在原生工程中配置应用图标，参考iOS原生工程配置

解决方案 iOS系统会缓存应用图标，需要重启手机新图标才能生效

这是因为图片中包含透明信息，即alpha通道，完整错误提示如下：

示例源码如下，请查看 pre > code 标签中的内容

解决方案 生成png图标文件时去掉alpha通道，重新提交云端打包

**Examples:**

Example 1 (javascript):
```javascript
ERROR ITMS-90717: "Invalid App Store Icon. The App Store Icon in the asset catalog in 'HBuilder.app' can't be transparent nor contain an alpha channel."
```

Example 2 (javascript):
```javascript
ERROR ITMS-90717: "Invalid App Store Icon. The App Store Icon in the asset catalog in 'HBuilder.app' can't be transparent nor contain an alpha channel."
```

Example 3 (javascript):
```javascript
ERROR ITMS-90717: "Invalid App Store Icon. The App Store Icon in the asset catalog in 'HBuilder.app' can't be transparent nor contain an alpha channel."
```

Example 4 (json):
```json
ERROR ITMS-90717: "Invalid App Store Icon. The App Store Icon in the asset catalog in 'HBuilder.app' can't be transparent nor contain an alpha channel."
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/intro

**Contents:**
- # 概述
- # 前置准备
  - # 开发环境准备
  - # 元服务 appid 注册
  - # 元服务上架备案（上架重要）
  - # 准备签名证书
- # 运行与调试
  - # 1. 配置 manifest.json 文件
  - # 2. 配置 module.json5
  - # 4. 运行鸿蒙元服务

如果你是服务商、外包商，承诺短期可快速上架 20 个元服务，欢迎点此联系我们 ，我们可提供单独技术支持，以及帮助协调鸿蒙测试机。

从 HBuilderX 4.34 版本开始，uni-app 支持 鸿蒙元服务 平台应用开发。鸿蒙元服务就是鸿蒙 Next 系统上的快应用、小程序。在鸿蒙 Next 系统上，不再支持快应用，对标替换产品即为鸿蒙元服务。

欢迎加入 uni-app 鸿蒙化技术交流群 进行交流。

元服务的开发和上架需要使用元服务的包名 BundleName，包名的形式 com.atomicservice.[你的 APPID]。

如果还没有创建元服务，访问 华为 AppGallery Connect 完成元服务应用的注册，得到相关包名。方便进行签名证书的操作。

元服务上架需要提前做好备案，强烈建议注册元服务时候立刻开始备案流程，避免临上架才开始备案，耽误上架时间。参考 App 备案相关注意事项 .

如果你的元服务需要使用登录、支付权限，也立即开始着手准备申请相关权限，参考 华为支付服务开发准备 。

常见问题：我已经备案、上架了安卓应用，参考 HarmonyOS 应用/元服务应如何进行备案？

初次运行元服务，需要配置好证书签名、权限设置等信息，第一次参与鸿蒙开发的新手请仔细阅读下面相关建议，否则可能会影响开发元服务。

在 HBuilderX 4.81+ 可在 HBuilderX manifest.json 中进行可视化操作，完成证书的自动签名。

在 HBuilderX 4.81 版本之前，需要手动配置鸿蒙签名，可参考 鸿蒙元服务配置签名证书。

此版本之前，元服务的证书签名、权限配置和鸿蒙 App 的相关操作基本一致，需要使用启动 DevEco 启动模拟器，参考 证书签名配置指南 。

填入已经注册的元服务包名（com.atomicservice.xxx），点击运行设备检测，在保证模拟器、真机运行。然后选择 自动申请调试证书，授权并完成自动签名后，会自动填写签名信息，选择保存即可。

在华为开发者后台会自动生成对应的文件，后续如果需要更新设备、开通地图功能、申请 ACL 权限时候，需要更新 p7b，请选择编辑设备，重新下载，替换 签名描述文件 一栏的文件路径。

具体操作步骤是，访问 华为开发者后台 - 证书、APP ID 和 Profile - 对应证书 - 编辑设备，勾选设备后重新下载，得到 p7b 文件，替换原始文件。

并在手机设置-应用与元服务列表中，移除正在开发的元服务，并选择重新运行元服务并清空缓存，确保立即生效。

如果可以运行成功官方的 Hello World 示例，说明相关环境、证书配置完成。后续用到登录、支付、定位等权限时候需要使用调试证书，到时候替换正确的手动签名证书即可，本部分目的是配置元服务环境，减少上手阻碍。

到这里前置工作就准备完成了。因为元服务还在开发迭代，下面补充相关注意事项。

在 HBuilderX 运行 uni-app 项目到元服务需要执行下面步骤：

项目运行需要配置元服务包名，打开项目根目录的 manifest.json 填写 鸿蒙元服务 - 应用包名，结构类似 com.atomicservice.[你的AppID]。

鸿蒙元服务需要获取使用特定的能力，比如元服务登录、震动、获取网络状态等权限、配置应用名称和图标时候需要配置权限模版。

重要： 下载 module.json5 文件。

项目根目录创建 harmony-mp-configs/entry/src/main/module.json5 文件。进行替换操作。

访问 AGC 后台 ，选择你的项目，在 项目设置 - 常规 页面中搜索 Client ID，匹配到的结果是下面需要到 client_id，这个参数会关联当前应用的相关权限，比如位置服务、登录功能等。

注意点击添加公钥指纹，添加调试证书，否则登录等鉴权功能会失败。

选择 运行 - 运行到小程序模拟器 - 鸿蒙元服务，在弹出的鸿蒙设置选择框中选择鸿蒙真机。

同时真机页面更新，即可进行元服务开发和运行。

元服务的条件编译是 MP-HARMONY。

开发过程中遇到的问题，欢迎加入 uni-app 鸿蒙化技术交流群 进行交流，有官方人员进行答疑和指导。

如果遇到需要 debug 或者白屏问题可以下面方案 进行调试。

构建鸿蒙工程的过程中可能需要访问 npm 公共仓库，如果遇到网络问题可以通过设置环境变量 NPM_CONFIG_REGISTRY 来指向特定的 npm 公共仓库。

从 HBuilderX 4.81 开始，运行鸿蒙元服务的时候支持热更新，当修改了源代码并保存后，修改的内容会很快反映到应用里，不需要重启应用。注意：目前仅真机生效，现网模拟器暂不支持。

启用这个热更新特性需要运行元服务应用的设备满足一定条件，即已经安装了所必需的达到一定版本的基础依赖包。如果不满足启用条件，则仍会使用原本的全量打包模式。

验证设备是否满足条件的方法是：在命令行环境执行下面的命令，并检查输出结果中的 versionName 是否达到 1.0.13.310 版本。

示例源码如下，请查看 pre > code 标签中的内容

如果设备中没有安装这个基础依赖包，或者版本没有达到要求，则需要通过一定的操作来安装这个包的最新版本。

对于模拟器来说，因为这个包是以固件方式安装在虚拟设备里面的，无法更新，所以只能等待新发布的模拟器镜像来解决这个问题。

对于真机来说，进入【设置>应用和元服务>元服务】界面，如果看到 helloUniApp 则卸载它，然后进入负一屏的搜索界面，搜索 helloUniApp，找到这个元服务之后打开一次即可。

元服务上架需要授权 DCloud 作为服务商完成上架，这里介绍如何将元服务上架到鸿蒙应用市场。

注意：目前上架元服务，部分应用信息需要在鸿蒙元服务后台填写，访问 华为 AppGallery Connect 后台 ，选择 我的元服务，选择对应的元服务 - 编辑。

填写完点击页面右上角的 保存 按钮，其他没有提到的数据无需填写，这一步骤作用是填写上架所需的特定数据。

在 HBuilderX 中开发 uni-app 上架到鸿蒙元服务需要下面几个步骤：

选择你要上架的元服务，授权 DCloud 完成后续的上架流程。

开发调试期间的证书不可用于应用上架。元服务发布证书的申请流程和鸿蒙应用开发类似，访问 鸿蒙发布元服务文档 进行发布证书的获取。

修改 build-profile.json5 里的 release 证书签名。务必注意调试和发行证书是两套，不能混用。

参考下方常见问题，配置 module.json5 设置图标、启动图等自定义配置项。

在 HBuilderX 中选择 发行 - 鸿蒙元服务，进行元服务打包。等待打包完成，会提示上传完成。接下来到 DCloud 开发者中心完善上架资料。

在上个步骤中，控制台在上传完成之后，提示打开 DCloud 开发者中心 。如果你是项目协作者账号登录，请切换为项目作者账号登录。

选择 应用管理 - 我的应用 - 选择项目 APPID，进入项目详情，选择 各平台信息，打开下面截图的页面，选择 发布 按钮。

表单会默认填写部分元服务信息，请务必确定完成了 上架前置准备 要求内容。填写完成后选择 提交审核 按钮。

上架过程中遇到的问题，欢迎加入 uni-app 鸿蒙化技术交流群 进行交流，有官方人员进行答疑和指导。

建议先阅读上面调试开发文档，了解大致流程。也可参考 鸿蒙签名文件配置 了解如何生成证书。

新用户面对鸿蒙签名相关文件会不确定怎么调整。这里对概念做进一步解释：签名文件总共需要四个配置文件（p12/csr/cer/p7b），和两个配置选项（alias/password）。

访问 AGC 后台 的 证书/APPID/Profile 页面中可以下载。

文档调试章节提到了权限配置、metadata 等信息配置。HBuilderX 工程文件重点关注 harmony-mp-configs 这个文件夹，内部的文件在编译时候会自动同步到最终鸿蒙工程中，如果没有需要新建对应文件。

在 harmony-mp-configs/entry/src/main/module.json5，可以设置权限、metadata、隐私协议托管等功能，完整配置文档可以参考 module.json5 配置文件

可看 uni.getLocation 鸿蒙位置设置指南 具体看详细介绍。

元服务图标必须在华为提供的标准图标底板上设计，否则会上架审核不通过。参考 生成元服务图标 生成图标，最终得到两个图片，一个是 216x216 用于在 uniapp 开发者后台上传图片，一个是 512x512 的图标放置代码里，具体是 harmony-mp-configs/AppScope/resources/base/media/my_app_icon.png 路径上，后续可通过 $media:my_app_icon 访问。

如何修改元服务的标题、图标、启动图？需要把文字和图标先定义，然后在资源文件中引用。下载文档中推荐的 module.json5 文件，下载放置到 harmony-mp-configs/entry/src/main/module.json5 ，定位到 module.abilities[0] 会找到下面几个字段：

通过设置 $media:xxx 关联图片，$string:xxx $color:xxx 对应配置文件的值。

在项目 harmony-mp-configs 目录创建 entry/src/main/resources/ 目录。注意， zh_CN 大于 base 配置，最终会在 AppScope 查找配置，优先修改 zh_CN 配置。

举例，下面是 zh-CN/element/string.json 中的内容，可以修改 EntryAbility_label 字段。

示例源码如下，请查看 pre > code 标签中的内容

访问 开发者后台 - 凭证 - 项目级凭证，查询到当前项目的相关信息。

其中 OAth 2.0 客户端 ID 中的凭证名称标识对应的应用、元服务名称，客户端凭证ID 代表 ClientID,密钥代表 ClientSecret 在解析 code 时候需要。

如果发生在应用运行、发行阶段。可能是构建时候证书缺少或者配置不对。参考 鸿蒙发布元服务 进行证书申请。

如果是发生应用发行阶段，可能是未填写完整的发布证书，需要调整 build-profile.json5。

临时方案。进入手机 - 设置 - 系统 - 开发者选项（如果未开启 关于手机 - 软件版本连续点击开启） - 开发中元服务豁免管控，选择开启后，可以自由调试。

稳定方案。整理 web-view 需要用到的相关域名，进入华为 AppGallery Connect 后台 - 我的项目 - 开发管理 - 元服务域名管理 - httpRequest 合法域名。按照提示进行填写。填写完成后打开 手机设置 - 应用与元服务，删掉正在开发的元服务，重新启动应用。

如果你手动配置过 module.json5 文件，需要确保 requestPermissions 下存在 {"name":"ohos.permission.INTERNET"} 权限。

页面中使用地图需要 华为 AppGallery Connect 后台 进行权限申请。具体可以参考 鸿蒙 Map Kit 开发准备 ，在 项目设置 - API 管理开启地图服务。

在 harmony-mp-configs/entry/src/main/module.json5 在 requestPermissions 字段里添加 ohos.permission.LOCATION 和 ohos.permission.APPROXIMATELY_LOCATION 两条记录。操作步骤可参阅 API getLocation 鸿蒙位置设置指南

元服务不允许未经用户同意发起定位。在请求位置之前需要获取用户授权。伪代码如下：

示例源码如下，请查看 pre > code 标签中的内容

元服务的登录要求可以参考阅读 《使用华为账号登录 静默登录 》、《开发者可以使用自行设计的登录界面吗？ 》。

如果需要账号登录，必须使用 uni.login 登录，不得绕过自行使用账号密码登录。建议申请获取用户手机号权限，然后关联自己的账号系统。在应用合适时机调用登录接口换取 UnionID，先标识用户为华为用户，操作关键步骤时候接入现有账号，比如获取手机号关联现有账号。同时务必提供注销用户功能入口，用户自行取消注册，否则会被驳回。

实践中，某些分类下的应用无法申请一键获取手机号，申请会被驳回，这种情况下，建议在业务中完成静默登录，然后在某些操作时候关联其他平台用户，此时通过手机号和验证码完成相关关联平台账号逻辑。

参考鸿蒙 Account Kit 开发准备 设置相关权限，添加 scope 权限。

通过 uni.login 可以得到 code，流程和其他小程序登录流程相似。参考 解析凭证 得到用户的 UnionID，开发者在这一步骤自行判断是已绑定华为 UnionID，如果未绑定，引导用户绑定现有账号体系。如果你没有 code 返回值，观察接口错误提示，一般是 client_id 设置错误。

也可以参考下面手机号接口申请，快速绑定手机号，具体见下个问题。

欢迎使用 uni-id-pages 插件加速元服务开发落地，这里封装了服务端开发的逻辑。在 uni-pay 中也提供了华为元服务支付的服务端逻辑封装，接入更方便。

申请过手机号敏感权限之后，可以通过 button 获取用户手机号。使用这种方式快速注册、绑定账号体系。

如果手机号申请失败，一般是没有严格按照手机号申请的要求完整填写，确保包含三个部分，应用的分类、场景的具体操作步骤、请求频率。尤其是第二部分，参考描述详细步骤。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果有返回值，说明配置项正确。可以让服务端解析数据。如果点击无反应，在 HBuilderX 中打开展示原生日志，观察是否有类似 Failed to check the fingerprint 的告警，排查错误方案如下：

用户侧第一次使用会有系统控件弹窗申请，同意之后，后续会自动同意。如果撤回同意，或者测试控件效果，需要手机打开 设置-华为账号-账号安全-使用华为账号的应用-删除授权。

用户侧控件效果如下，默认展示手机系统登录的账号，也可以通过管理手机号，手动验证其他手机号。

最终解析 token 得到最终结果，最终结果数据是下面的结构，供 mock 参考，包含了 unionID/mobileNumber 字段，后面执行用户关联操作。

示例源码如下，请查看 pre > code 标签中的内容

新版模版已内置，如果你自定义过权限，需要存在 GET_NETWORK_INFO 和 vibrate 权限。具体的鸿蒙元服务权限列表可以参考 鸿蒙对所有应用开放的权限清单 进行查询。按照 配置权限模版 章节进行配置。

模拟器或者真机上已经安装了当前 BundleName 的应用。可能是证书复用导致的错误，重新确认当前证书是元服务证书，而不是鸿蒙 App 的证书。

你可能声明了不兼容的字段，需要在 harmony-mp-configs/build-profile.json5 里面去掉 app.products.*.compileSdkVersion 属性。

一般来说 harmony-mp-configs/entry/src/main/module.json5 配置文件有问题，导致运行失败，需要检查配置文件，如果配置文件没有问题，可以尝试删除文件，重新运行一下。

确保 entry/src/main/module.json5 文件是使用文档顶部的网络模版下载的。

文件 harmony-mp-configs/entry/src/main/module.json5 会用来配置应用的一些行为，你可以参考 鸿蒙 module.json5 配置文件 进行学习和参考。

如果你已经在开发鸿蒙 App ，见到 module.json5 会感觉比较熟悉，有几个属性需要特别注意：

MP-HARMONY，具体参考 条件编译文档 。

错误原因：表明当前环境缺少元服务运行所必须的基础依赖，通常出现在初次运行的错误提示。

在终端中运行 hdc shell bm dump-shared -a，观察返回值是否包含 com.huawei.hms.ascfruntime，如果不包含运行元服务会出现此错误。

注意：如果使用模拟器仍然报错上述错误，临时方案需要新建 harmony-mp-configs/entry/oh-package.json5，填充下面内容。使用真机时候不需要执行这个操作。此为鸿蒙 Bug，后续鸿蒙会优化处理。

示例源码如下，请查看 pre > code 标签中的内容

已修复，在 HBuilderX alpha 4.63 上有问题，请参考 这个问题 进行兼容。

目前华为提供了一个自动化工具，用来自动化处理多个元服务的创建、信息维护和更新操作。详见 元服务工具使用指导

备案类问题参考阅读：APP 备案 FAQ 。

补充： Mac 电脑上指纹信息填写 SHA-1 的数值，不要填写 SHA-256。

如果希望开启远程调试，可以按照下面方法操作。

调试分成两个部分，一个是视图层的 WebView 调试，一个是逻辑层 V8 的调试。阅读官方文档 运行调试元服务

WebView 调试按照文档操作，简单来说可以分成三个步骤：

如果你遇到应用几秒后闪退，说明不是 debugger 模式，正常运行情况下阻塞 6s 系统会让应用闪退。

观察上传参数里是否有数字类型参数，强转为字符串。可进一步参考 鸿蒙相关问题

有用户反馈在 Windows 平台下运行 DevEco 原生元服务正常，使用 HBuilderX 运行空白工程会卡住无法完成。发现是个别系统安全工具会默认拦截，拦截发生在 DevEco 调用内置取得 node 处理编译时候。提示文案：“有程序正在进行可疑操作，建议阻止”。

目前没有好的方案解决，建议始终信任 DevEco 的操作，或者临时退出安全软件。有相关经验也欢迎交流反馈。

元服务在 HBuilderX 中执行发布操作，发布成功后登录 uni-app 后台，软件的状态显示失败。

一般来说是机器解析发行包时候遇到了问题，需要访问 华为 AGC 开发者后台 ，访问 APP 与元服务 - 应用上架 - 软件包管理，这里会有具体错误代码，点击错误原因即可看到详细解释

从 HBuilderX Alpha 4.51 开始，鸿蒙元服务启用了新的内置模版，适配 ASCF 最新能力，产生了不兼容变化，需要手动处理。

如果仍有报错，你可以在华为应用市场中搜索 helloUniApp 打开体验一次，这个过程会主动下载 com.huawei.hms.ascfruntime。

目前已支持通过 Vue3 CLI 开发元服务：

示例源码如下，请查看 pre > code 标签中的内容

目前已支持通过 Vue2 CLI 开发元服务:

示例源码如下，请查看 pre > code 标签中的内容

修改 package.json 的 scripts ，添加

示例源码如下，请查看 pre > code 标签中的内容

在鸿蒙应用、鸿蒙元服务中可以开发卡片，放置到桌面上，展示特定的应用数据、提供快速启动应用的入口。目前，卡片开发有两种方式：

在元服务中，只能通过 ArkTS UI 开发实现布局，参考文档方案如下：

下面介绍如何开发基于 UI 的卡片，思路和原生开发一致，推荐在 DevEco 中完成卡片开发验证，之后再迁移到 HBuilderX 工程中。首先在 DevEco 中先创建一个 ascf 工程。

这里推荐通过 git 来管理文件变化，选择默认的 2x2 和 2x4 会自动生成模板文件。

在默认的模板中，定义了一个 Hello World 卡片，点击卡片时候会自动打开元服务。复制这些文件放置到 mp-harmony-configs 文件夹，比如 entry/src/main/module.json5 文件放到 harmony-mp-configs/entry/src/main/module.json5 中，保持路径一致，构建时候会自动做替换。

运行服务之后，滚动手机到负一屏，选择卡片，点击加号，添加卡片，卡片可以放到负一屏，也可以长按拖动到桌面中。

更多开发细节参阅鸿蒙文档：开发基于 ArkTS UI 的卡片

元服务开发还在不断迭代，建议通过 HBuilderX alpha 版本进行开发。

如果无法在 HBuilderX 中看到鸿蒙日志，请确保开启鸿蒙网络豁免，打开手机设置 - 系统 - 开发者选项 - 开发中元服务豁免管控。

可在 HBuilderX 中开启原生日志，观察完整日志，如果报错中包含 xxx is not defined，可能是对应的 api 在元服务中还未实现，比如 uni.createAnimation、获取胶囊位置、获取激励视频等。此类问题需要使用条件编译进行规避。

如果报错中包含 vendor.js 中有报错，可能是三方组件库不兼容元服务，可以参考 debug 文档进行错误定位。

分包异步化 能力默认是支持的。开发者使用不生效一般是下面错误原因：

示例源码如下，请查看 pre > code 标签中的内容

在页面中正常使用： import CustomButton from "@/packageB/components/component1/index.vue";

如果你需要组件中使用占位组件，可参考阅读 小程序专题-分包异步化

检查代码中 module.json5 中的 requestPermissions 和 AGC 后台的隐私协议权限第二条 设备权限调用要严格一致。

代码内应用适配平台和鸿蒙后台勾选的设备不匹配，也就是代码中设备清单和线上资料不一样。

代码工程中，需要在 harmony-mp-configs/entry/src/main/module.json5 中搜索 deviceTypes，通常只设置 phone 值，表示兼容手机

在 AGC 后台或者 uni-app 提审后台，也有适配设备选项，确保和代码中保持一致，通常勾选 手机 Phone 值，表示兼容手机

观察按钮右侧有个联系方式，可以和 uniapp 发起沟通，看是否有更好的激励政策。如果仍有问题，可以在 uni-app 鸿蒙化技术交流群 沟通。

这说明你已经绑定了 DCloud 为服务商，绑定服务商可以简化提交审核的流程，统一处理不同平台的应用发布。你需要在 uniapp 后台来完成操作，访问应用管理-我的应用-具体项目-各平台信息-鸿蒙元服务发布，在这里进行发布。

自动申请调试证书是总是检测不到设备怎么办？设备已经加到 AGC 中了。 25 年 12 月开始，华为调整了查询设备信息的接口，影响了现有代码处理逻辑。两个处理方案：使用手动签名或者调整代码做兼容。

在 HBuilderX 安装目录找到 plugins/launcher/out/main.js 文件，查找和替换下面文件

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.76 运行元服务 tabbar 页面切换页面不会闪烁，HBuilderX 4.85+ 运行元服务快速切换 tab 页面会有闪烁重新加载的现象。这是目前技术实现的限制，实际发行不会卡顿。

技术方案解释：4.76 版本中元服务编译时间比较长，后续修改代码生效时间比较长，加载比较慢。华为底层的 ascf 针对这种情况提出了改进方案，改为启动本地服务网页，元服务通过访问本地服务器来展示内容，加载速度快，逻辑简单，性能优势明显，称之为热重载方案。

HBuilderX 4.85+ 采用了这个方案，用户切换页面时候会访问本地服务，会产生轻微的闪烁，页面生命周期也会重新触发。本地调试可忽略此问题，实际发布后不会有此问题。

目前华为的 ASCF 团队是这样规划的，不可修改，这个表现不会影响应用运行，不会影响审核上架

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 4.34
```

Example 2 (unknown):
```unknown
com.atomicservice.[你的 APPID]
```

Example 3 (unknown):
```unknown
manifest.json
```

Example 4 (unknown):
```unknown
module.json5
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-maps

**Contents:**
  - # 高德地图
    - # 申请高德地图Key
    - # 配置使用高德地图
    - # 参数说明
    - # 高德开放平台用户名
  - # 百度地图
    - # 申请百度地图Key
    - # 配置使用百度地图
    - # 参数说明
  - # Google地图（谷歌地图/google map）

App端地图模块封装了市场上主流的三方地图SDK，提供JS API统一调用Android、iOS原生地图功能。

使用地图功能需在项目manifest.json的“App模块配置”中勾选“Maps(地图)”，并根据项目实际情况勾选使用的三方地图SDK：

提示：App模块配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

使用前需到高德开放平台 创建应用并申请Key

打开项目的manifest.json文件，在“App模块配置”项的“Maps(地图)”下，勾选“高德地图”：

登录 高德开放平台 ，进入“控制台”，在“账号信息”的“基本信息”中可获取“用户名”：

使用前需到百度开放平台 创建应用并申请Key

打开项目的manifest.json文件，在“App模块配置”项的“Maps(地图)”下，勾选“百度地图”：

HBuilderX3.4.0+版本新增支持

使用前需到Google地图开放平台 创建应用并申请APIKey

打开项目的manifest.json文件，在“App模块配置”项的“Maps(地图)”下，勾选“Google地图”：

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-google

**Contents:**
  - # 开通
  - # 配置
  - # 使用Google登录
    - # 示例代码
      - 本页导读

更多信息详见 申请开通Google登录操作指南

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“Google登录”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 2 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 3 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 4 (css):
```css
uni.login({
    provider: 'google',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'google',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

---

## 安心打包使用指南 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/build/SafePack.html

**Contents:**
- # 安心打包使用指南
- # 安心打包原理
- # 安心打包优势
- # 使用安心打包
- # 注意事项
- # FAQ
- # Android 安心打包问题汇总
  - # Q1: Windows：控制台提示打包成功，相应目录下没有apk文件
  - # Q2: fakeLogOpen(/dev/log_crash) failed
  - # Q3: 启动图.9.png格式问题

过去，App云端打包时需要将应用代码、打包证书等提交到DCloud云端打包机，在云端打包机的原生开发环境中生成安装包apk/ipa。 DCloud云端服务器虽然不会保存开发者应用代码和证书等信息，但开发者可能还是不放心，或者担心在网络传输过程中可能存在拦截泄漏的风险。

而离线打包，不但不方便，还有2个重要功能无法使用：

HBuilderX2.9.9版本新增Android平台安心打包功能，不再提交应用代码及打包证书到云端服务器，同时也减轻云端打包机压力，缩短高峰期云端打包等待时间。 HBuilderX3.0.7版本新增iOS平台支持安心打包功能（仅支持MacOS）

因为大多数打包，并不改动原生部分（主要是manifest.json），只修改前端代码。此时将无需从云端打包机下载原生包，打包速度会非常快。

新版本HBuilderX云端打包时无需额外操作，默认会勾选“安心打包”，如下图所示：

如果没有安装安心打包插件，会弹出以下提示框，点击“安装”继续

插件安装完成后需重新点击“打包”按钮提交打包

打包完成后自动保存到项目的"unpackage/release/apk/"目录

如果清空了这个目录，那么下次打包将执行首次打包逻辑。

** 问题：** 某些用户反馈，windows电脑，控制台提示Android安心打包成功，进入相应目录(unpackage/release/apk)，目录下找不到apk文件 ** 原因** ：unpackage/release/apk目录，没有写入权限，移动apk文件失败了。

某些情况下，首次提交安心打包，您可能会遇到下列错误：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

** 原因：** 启动图xxx.9.png不是有效9.png图片，格式错误导致。 ** 解决方法：** 重新生成有效的9.png图片

** 备注：** 部分用户可能会提问，同样.9.png项目，为什么传统打包成功，安心打包失败呢？因为：安心打包校验机制更为严格。 ** 文档：** .9.png图片相关文档

示例源码如下，请查看 pre > code 标签中的内容

** 备注：** HBuilderX 3.1.10及以上版本生效

示例源码如下，请查看 pre > code 标签中的内容

** 原因：** 可能是用户手动点击安装了证书导致打包签名失败。

** 解决方法：** 打开钥匙串访问删除相关用户手动安装的证书后重新打包（下图仅供参考，需开发者判断哪些证书是手动安装的证书）。

如果您遇到安心打包问题，且无法解决，请加QQ群827137391。

进群需要提供操作系统和HBuilderX版本号信息，提问请提交错误日志或截图。

本群仅限反馈安心打包问题，请勿发布无关信息。

**Examples:**

Example 1 (unknown):
```unknown
Android 安心打包问题汇总
```

Example 2 (go):
```go
[Error] W: fakeLogOpen(/dev/log_crash) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Info] I: Copying libs... (/lib)
[Info] I: Building apk file...
[Info] I: Copying unknown files/dir...
[Info] I: Built apk...
[Error] Apk tool compile package to apk failed
[Info] 制作结果：Failed. Reason:
```

Example 3 (go):
```go
[Error] W: fakeLogOpen(/dev/log_crash) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Info] I: Copying libs... (/lib)
[Info] I: Building apk file...
[Info] I: Copying unknown files/dir...
[Info] I: Built apk...
[Error] Apk tool compile package to apk failed
[Info] 制作结果：Failed. Reason:
```

Example 4 (go):
```go
[Error] W: fakeLogOpen(/dev/log_crash) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Error] W: fakeLogOpen(/dev/log_stats) failed
[Info] I: Copying libs... (/lib)
[Info] I: Building apk file...
[Info] I: Copying unknown files/dir...
[Info] I: Built apk...
[Error] Apk tool compile package to apk failed
[Info] 制作结果：Failed. Reason:
```

---

## uni-app项目 苹果应用内支付支付用法 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment-aip.html

**Contents:**
  - # uni-app项目 苹果应用内支付支付用法
  - # 开通
  - # 配置
  - # 5+应用 苹果应用内支付
    - # 应用内发起支付
    - # 获取应用内支付对象
    - # 获取商品信息
      - # 商品信息参数说明
      - # 优惠促销信息参数说明
    - # 发起支付

更多信息详见苹果官方文档 App 内购买项目配置流程 。

打开项目的manifest.json文件，在“App模块配置”项的“Payment(支付)”下勾选“Apple应用内支付”：

提示：需提交云端打包后才能生效，真机运行时请使用自定义调试基座 ；本地离线打包参考Apple应用内支付模块配置

应用内支付通道标识为appleiap，调用plus.payment.getChannels 获取应用内支付对象：

示例源码如下，请查看 pre > code 标签中的内容

发起支付前需调用requestOrder 传入产品ID（productId）获取订单信息：

示例源码如下，请查看 pre > code 标签中的内容

调用 plus.payment.request(channel, orderInfo, successCB, errorCB) 发起支付, channel参数为应用内支付对象，orderInfo参数为订单对象

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

restoreComplateRequest作用描述:

示例源码如下，请查看 pre > code 标签中的内容

在监听页面 resume 事件回调中调用 restoreComplateRequest

示例源码如下，请查看 pre > code 标签中的内容

用户没有绑定 AppStore 支付方式，调用 plus.payment.request 准备支付，触发失败 fail 回调，errCode=2，用户未绑定支付方式，app内支付流程结束。 系统弹出框引导用户绑定支付方式，此过程将跳转到系统应用 AppStore 进行绑定支付方式，绑定成功同步支付成功，用户成功付款

新增手动关闭订单参数 manualFinishTransaction, 在合适的时机调用 iapChannel.finishTransaction 关闭订单

新增关闭订单方法 iapChannel.finishTransaction(Transaction, <Function> success, <Function> fail)

示例源码如下，请查看 pre > code 标签中的内容

过段时间调用恢复购买 restoreComplateRequest 可以获取到上次异常或未完成的订单

**Examples:**

Example 1 (javascript):
```javascript
var iap = null;  //保存应用内支付对象
plus.payment.getChannels(function(channels){
    for (var i in channels) {
        var channel = channels[i];
        // 获取 id 为 'appleiap' 的 channel  
        if (channel.id === 'appleiap') {
            iap = channel;
        }
    }
  }, function(e){
    console.log("获取iap支付通道失败：" + e.message);
});
```

Example 2 (javascript):
```javascript
var iap = null;  //保存应用内支付对象
plus.payment.getChannels(function(channels){
    for (var i in channels) {
        var channel = channels[i];
        // 获取 id 为 'appleiap' 的 channel  
        if (channel.id === 'appleiap') {
            iap = channel;
        }
    }
  }, function(e){
    console.log("获取iap支付通道失败：" + e.message);
});
```

Example 3 (javascript):
```javascript
var iap = null;  //保存应用内支付对象
plus.payment.getChannels(function(channels){
    for (var i in channels) {
        var channel = channels[i];
        // 获取 id 为 'appleiap' 的 channel  
        if (channel.id === 'appleiap') {
            iap = channel;
        }
    }
  }, function(e){
    console.log("获取iap支付通道失败：" + e.message);
});
```

Example 4 (javascript):
```javascript
var iap = null;  //保存应用内支付对象
plus.payment.getChannels(function(channels){
    for (var i in channels) {
        var channel = channels[i];
        // 获取 id 为 'appleiap' 的 channel  
        if (channel.id === 'appleiap') {
            iap = channel;
        }
    }
  }, function(e){
    console.log("获取iap支付通道失败：" + e.message);
});
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/native-js.html

**Contents:**
- # 概述
- # 注意事项：
  - # 技术要求
- # 开始使用
  - # 判断平台
  - # 类型转换
    - # 类型转换表
  - # 其他转换
  - # 概念
    - # 类对象

Native.js技术，简称NJS，是一种将手机操作系统的原生对象转义，映射为JS对象，在JS里编写原生代码的技术。 如果说Node.js把js扩展到服务器世界，那么Native.js则把js扩展到手机App的原生世界。 HTML/JS/Css全部语法只有7万多，而原生语法有几十万，Native.js大幅提升了HTML5的能力。 NJS突破了浏览器的功能限制，也不再需要像Hybrid那样由原生语言开发插件才能补足浏览器欠缺的功能。 NJS编写的代码，最终需要在HBuilder里打包发行为App安装包，或者在支持Native.js技术的浏览器里运行。目前Native.js技术不能在普通手机浏览器里直接运行。

再次强调，Native.js不是一个js库，不需要下载引入到页面的script中，也不像nodejs那样有单独的运行环境，Native.js的运行环境是集成在5+runtime里的，使用HBuilder打包的app或流应用都可以直接使用Native.js。

Uni-app不支持Native.js执行UI相关操作的API调用及webview相关API调用。将失效无法正常使用。Uni-app不推荐使用Native.js

由于NJS是直接调用Native API，需要对Native API有一定了解，知道所需要的功能调用了哪些原生API，能看懂原生代码并参考原生代码修改为JS代码。 否则只能直接copy别人写好的NJS代码。

Native API具有平台依赖性，所以需要通过以下方式判断当前的运行平台：

示例源码如下，请查看 pre > code 标签中的内容

在NJS中调用Native API或从Native API返回数据到NJS时会自动转换数据类型。

由于JavaScript中本身没有类的概念，为了使用Native API层的类，在NJS中引入了类对象（ClassObject）的概念，用于对Native中的类进行操作，如创建类的实例对象、访问类的静态属性、调用类的静态方法等。其原型如下：

示例源码如下，请查看 pre > code 标签中的内容

获取类对象 在iOS平台我们可以通过plus.ios.importClass(name)方法导入类对象，参数name为类的名称；在Android平台我们可以通过plus.android.importClass(name)方法导入类对象，其参数name为类的名称，必须包含完整的命名空间。

示例源码如下，请查看 pre > code 标签中的内容

获取类对象后，可以通过类对象“.”操作符获取类的静态常量属性、调用类的静态方法，类的静态非常量属性需通过plusGetAttribute、plusSetAttribute方法操作。

在JavaScript中，所有对象都是Object，为了操作Native层类的实例对象，在NJS中引入了实例对象（InstanceObject）的概念，用于对Native中的对象进行操作，如操作对象的属性、调用对象的方法等。其原型如下：

示例源码如下，请查看 pre > code 标签中的内容

获取实例对象 有两种方式获取类的实例对象，一种是调用Native API返回值获取，另一种是通过new操作符来创建导入的类对象的实例，如下：

示例源码如下，请查看 pre > code 标签中的内容

获取实例对象后，可以通过实例对象“.”操作符获取对象的常量属性、调用对象的成员方法，实例对象的非常量属性则需通过plusGetAttribute、plusSetAttribute方法操作。

常量属性 获取对象后就可以通过“.”操作符获取对象的常量属性，如果是类对象则获取的是类的静态常量属性，如果是实例对象则获取的是对象的成员常量属性。

非常量属性 如果Native层对象的属性值在原生环境下被更改，此时使用“.”操作符获取到对应NJS对象的属性值就可能不是实时的属性值，而是该Native层对象被映射为NJS对象那一刻的属性值。 为获取获取Native层对象的实时属性值，需调用NJS对象的plusGetAttribute(name)方法，参数name为属性的名称，返回值为属性的值。调用NJS对象的plusSetAttribute(name,value)方法设置Native层对象的非常量属性值，参数name为属性的名称，value为要设置新的属性值。 注意：使用plusGetAttribute(name)方法也可以获取Native层对象的常量属性值，但不如直接使用“.”操作符来获取性能高。

方法 获取对象后可以通过“.”操作符直接调用Native层方法，如果是类对象调用的是Native层类的静态方法，如果是实例对象调用的是Native层对象的成员方法。 注意：在iOS平台由于JS语法的原因，Objective-C方法名称中的“:”字符转成NJS对象的方法名称后将会被忽略，因此在NJS中调用的方法名需去掉所有“：”字符。

类的继承 Objective-C和Java中类如果存在继承自基类，在NJS中对应的对象会根据继承关系递归将所有基类的公有方法一一换成NJS对象的方法，所有基类的公有属性也可以通过其plusGetAttribute、plusSetAttribute方法访问。

使用NJS调用Native API非常简单，基本步骤如下：

以下例子使用NJS调用iOS和Android的原生弹出提示框（类似但不同于js的alert）。

以下代码在Android平台展示调用Native API显示系统提示框。 首先是Android原生 Java代码，用于比对参考：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：NJS代码中创建提示框构造对象要求传入程序全局环境对象，可通过plus.android.runtimeMainActivity()方法获取应用的主Activity对象，它是HTML5+应用运行期自动创建的程序全局环境对象。

Android设备上运行效果图： `注意：其实HTML5+规范已经封装过原生提示框消息API：plus.ui.alert( message, alertCB, title, buttonCapture)。此处NJS的示例仅为了开发者方便理解，实际使用时调用plus.ui.alert更简单，性能也更高。**

以下代码在iOS平台展示调用Native API显示系统提示对话框。 iOS原生Objective-C代码，用于比对参考：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：在OC语法中方法的定义格式为: “(返回值类型) 函数名: (参数1类型) 形参1 参数2名称: (参数2类型) 形参2” 方法的完整名称为: “函数名:参数2名称:”。 如:“（void）setPositionX:(int)x Y:(int)y;”，方法的完整名称为“setPositionX:Y:” 调用时语法为：“[pos setPositionX:x Y:y];”。 在JS语法中函数名称不能包含“:”字符，所以OC对象的方法名映射成NJS对象方法名时将其中的“:”字符自动删除，上面方法名映射为“setPositionXY”，在NJS调用的语法为：“pos.setPositionXY(x,y);”。 iOS设备上运行效果图： `注意：其实HTML5+规范已经封装过原生提示框消息API：plus.ui.alert( message, alertCB, title, buttonCapture)。此处NJS的示例仅为了开发者方便理解，实际使用时调用plus.ui.alert更简单、性能也更高。

在HBuilder自带的Hello H5+模板应用中“Native.JS”（plus/njs.html）页面有完整的源代码，可真机运行查看效果。

为了能更好的理解NJS调用Java Native API，我们在Android平台用Java实现以下测试类，将在会后面API说明中的示例来调用。 文件NjsHello.java代码如下：

示例源码如下，请查看 pre > code 标签中的内容

文件NjsHelloEvent.java代码如下：

示例源码如下，请查看 pre > code 标签中的内容

注：此NjsHello示例仅为了说明原生代码与NJS代码之间的映射关系，以下示例代码无法直接在HBuilder里真机运行，必须在以后HBuilder开放自定义打包后方可把NjsHello类打入app并被NJS调用。实际使用中，这种需要并非必要，大多数情况可以通过直接写NJS代码调用操作系统API，而无需由原生语言二次封装类供JS调用。

示例源码如下，请查看 pre > code 标签中的内容

导入类对象后，就可以通过“.”操作符直接调用对象（类对象/实例对象）的常量和方法。 classname：要导入的Java类名，必须是完整的命名空间（使用"."分割），如果指定的类名不存在，则导入类失败，返回null。

注意：导入类对象可以方便的使用“.”操作符来调用对象的属性和方法，但也会消耗较多的系统资源。因此导入过多的类对象会影响性能，此时可以使用“高级API”中提供的方法在不导入类对象的情况下调用Native API。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

调用plus.android.importClass()方法导入类并返回ClassObject类对象，通过该类对象，可以创建类的实例对象。在Java中类的静态方法会转换成NJS类对象的方法，可通过类对象的“.”操作符调用；类的静态常量会转换为NJS类对象的属性，可通过类对象的“.”操作符访问；类的静态属性则需通过NJS类对象的plusGetAttribute、plusSetAttribute方法操作。 示例：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

导入类对象后，就可以调用其plusGetAttribute方法获取类的静态属性值。

注意：如果导入的类对象中存在“plusGetAttribute”同名的静态方法，则必须通过plus.android.invoke()方法调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

导入类对象后，就可以调用其plusSetAttribute方法设置类的静态属性值。

注意：如果导入的类对象中存在“plusSetAttribute”同名的静态方法，则必须通过plus.android.invoke()方法调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

NJS中实例对象与Java中的对象对应，调用plus.android.importClass()方法导入类后，通过new操作符可创建该类的实例对象，或直接调用plus.android.newObject方法创建类的实例对象，也可通过调用Native API返回实例对象。在Java中对象的方法会转换成NJS实例对象的方法，可通过实例对象的“.”操作符调用；对象的常量属性会转换NJS实例对象的属性，可通过实例对象的“.”操作符访问。对象的非常量属性则必须通过NJS实例对象的plusGetAttribute、plusSetAttribute方法操作。 示例：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取实例对象后，就可以调用其plusGetAttribute方法获取对象的属性值。 name：要获取对象的属性名称，如果指定的属性名称不存在，则获取属性失败，返回null。

注意：如果实例对象中存在“plusGetAttribute”同名的方法，则必须通过plus.android.invoke()方法调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

导入类对象后，就可以调用其plusSetAttribute方法设置类的静态属性值。

注意：如果导入的类对象中存在“plusSetAttribute”同名的静态方法，则必须通过plus.android.invoke()方法调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在Java中可以通过定义新类并实现Interface的接口，并创建出新类对象作为其它接口的参数，在NJS中则可快速创建对应的Interface对象，方法原型如下： Object plus.android.implements( String name, Object obj );

此方法创建Native层中Java的接口实现对象，作为调用其它Native API的参数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取运行期环境主Activity实例对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法将获取程序的主Activity的实例对象，它是Html5+运行期环境主组件，用于处理与用户交互的各种事件，也是应用程序全局环境android.app.Activity的实现对象。android.app.Activity是一个特殊的类，需要在原生开发环境中注册后才能使用，所以使用new操作符创建对象无实际意义。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取当前Webview窗口对象的native层实例对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

Android平台完整Java类名为android.webkit.Webview，完整API请参考Android开发文档android.webkit.Webview 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

完整API文档参考：HTML5+ API - Native.js for Android

为了能更好的理解NJS调用Objective-C Native API，我们在iOS平台用Objective-C实现以下测试类，将会在后面API说明中的示例来调用。 头文件njshello.h代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

导入Objective-C类对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

导入类对象后，就可以通过“.”操作符直接调用对象（类对象/实例对象）的常量和方法。通过“.”操作符号调用方法时，不需要使用“:”来分割方法名。

注意：导入类对象可以方便的使用“.”操作符来调用对象的属性和方法，但也会消耗较多的系统资源。因此导入过多的类对象会影响性能，此时可以使用“高级API”中提供的方法在不导入类对象的情况下调用Native API。 示例：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

调用plus.ios.importClass()方法导入类并返回ClassObject类对象，通过该类对象，可以创建类的实例对象。在Objective-C中类的静态方法会转换成NJS类对象的方法，可通过类对象的“.”操作符调用；

注意：由于Objective-C中类没有静态变量，而是通过定义全局变量来实现，目前NJS中无法访问全局变量的值。对于全局常量，在NJS中也无法访问，对于原类型常量可在文档中找到其具体的值，在JS代码中直接赋值；对于非原类型常量目前还无法访问。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

NJS中实例对象与Objective-C中的对象对应，调用plus.ios.importClass()方法导入类后，通过new操作符可创建该类的实例对象，或直接调用plus.ios.newObject方法创建类的实例对象，也可通过调用Native API返回实例对象。在Objective-C中对象的方法会转换成NJS实例对象的方法，可通过实例对象的“.”操作符调用；对象的属性则必须通过NJS实例对象的plusGetAttribute、plusSetAttribute方法操作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取实例对象后，就可以调用其plusGetAttribute方法获取对象的属性值。

注意：如果实例对象中存在“plusGetAttribute”同名的方法，则只能通过plus.ios.invoke()方法调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

导入类对象后，就可以调用其plusSetAttribute方法设置类的静态属性值。

注意：如果导入的类对象中存在“plusSetAttribute”同名的静态方法，则只能通过plus.android.invoke()方法调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在Objective-C中可以通过定义新类并实现Protocol的协议，并创建出新类对象作为代理对象，在NJS中则可实现协议快速创建代理对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法返回一个NJS实例对象，映射到Native层中的代理对象，其父类为“NSObject”，并且实现obj中指定的协议方法。通常作为调用其它Native API的参数。

示例源码如下，请查看 pre > code 标签中的内容

在NJS中不需要创建新的类对象，调用plus.ios.implements实现协议接口即可创建出代理对象，代码如下：

示例源码如下，请查看 pre > code 标签中的内容

释放NJS中实例对象中映射的Native对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

NJS中所有的实例对象（InstanceObject）都可以通过此方法释放，会将Native层的对象使用的资源进行释放。

注意：此方法是可选的，如果不调用此方法释放实例对象，则在页面关闭时会自动释放所有对象；若对象占用较多的系统资源，则在业务逻辑处理完成时应该主动调用此方法释放资源，以提到程序的运行效率。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取当前Webview窗口对象的native层UIWebview实例对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

UIWebview对象的API请参考Apple开发文档UIWebview

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

完整API文档参考：HTML5+ API - Native.js for iOS

在Android手机桌面上创建快捷方式图标，这是原本只有原生程序才能实现的功能。即使使用Hybrid方案，也需要原生工程师来配合写插件。 下面我们演示如何直接使用js在Android手机桌面创建快捷方式，在HelloH5+应用中Native.JS页面中“Shortcut (Android)”可以查看运行效果。 这段代码是使用原生Java实现的创建快捷方式的代码，用于参考比对：

示例源码如下，请查看 pre > code 标签中的内容

使用NJS实现时首先导入需要使用到的android.content.Intent、android.graphics.BitmapFactory类，按照Java代码中的方法对应转换成JavaScript代码。 其中快捷方式图标是通过解析本地png文件进行设置，在JavaScript中需要使用plus.io.* API转换成本地路径传递给Native API，完整代码如下：

示例源码如下，请查看 pre > code 标签中的内容

注意：提交到云平台打包时需要添加Android权限才能在桌面创建快捷方式，在HBuilder工程中双击应用的“manifest.json”文件，切换到“代码视图”中在plus->distribute->google->permissions节点下添加权限数据：

示例源码如下，请查看 pre > code 标签中的内容

在iOS手机上登录game center，一个游戏中心服务，这是原本只有原生程序才能实现的功能。即使使用Hybrid方案，也需要原生工程师来配合写插件。 下面我们演示如何直接使用js在iOS手机上登录game center，在HelloH5+应用中Native.JS页面中的“Game Center (iOS)”可以查看运行效果。 注意手机未开通game center则无法登陆，请先点击iOS自带的game center进行配置。 这段代码是使用原生Objective-C实现的登录game center的代码，用于参考比对。原生Objective-C代码的头文件Test.h中代码如下：

示例源码如下，请查看 pre > code 标签中的内容

使用NJS实现时可以按照Objective-C代码中的方法对应转换成JavaScript代码，最关键的代码是loginGamecenter方法中对用户登录状态的监听，需调用NSNotificationCenter对象的“addObserver:selector:name:object”方法，

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

，如下图所示： 2. 正式发布提交到AppStore时，在配置苹果开发者网站上配置App ID需要选中“Game Center”服务：

##开发注意和建议用途 Native.js的运行性能仍然不比纯原生应用；JS与Native之间的数据交换效率并不如在js内部的数据交换效率；基于如上原因，有几点开发建议：

##调试 使用safari和chrome的控制台调试HBuilder的5+App时，一样可以调试NJS对象，即可以在浏览器控制台中查看各种原生对象的属性和方法，如下图所示，57行设了断点，watch了Intent对象，并在右边展开了该对象的所有属性方法： 关于如何在浏览器控制台调试HBuilder的5+App，请参考HBuilder的5+App开发入门教程。

##开发资源 iOS 官方在线文档：https://developer.apple.com/library/ios/navigation/ Android 官方在线文档：https://developer.android.com/reference/packages.html 演讲视频：http://v.youku.com/v_show/id_XNzYzNTcwNDI4.html

##高级API 有前述的常用API，已经可以完成各项业务开发。此处补充的高级API，是在熟悉NJS后，为了提升性能而使用的API。高级API无法直接用“.”操作符使用原生对象的方法，在debug时也无法watch原生对象，但高级API性能高于常规API。 虽然导入类对象（plus.android.importClass和plus.ios.importClass）后，可以方便的通过“.”操作符来访问对象的常量、调用对象的方法，但导入类对象也需要消耗较多的系统资源，所以在实际开发时应该尽可能的减少导入类对象，以提高程序效率。可以参考以下依据进行判断：

如果我们不导入类对象则无法通过new操作符实例化类对象，这时可通过plus.ios.newObject()、plus.android.newObject()方法来创建实例对象，如下：

示例源码如下，请查看 pre > code 标签中的内容

不导入类对象直接创建类的实例对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法对Native层中对类进行实例化操作，创建一个类的实体并返回NJS层的实例对象。相比导入类对象后使用new操作符创建对象效率要高。

注意：由于没有导入类对象，所以通过此方法创建的实例对象无法通过“.”操作符直接调用对象的方法，而必须使用plus.android.invoke方法来调用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

不导入类对象，则无法通过类对象并访问类的静态属性，需调用以下方法获取类的静态属性值，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法也可以获取类对象或实例对象的属性值，如果是类对象获取的则是类的静态属性，如果是实例对象则获取的是对象的非静态属性。

注意：同样导入类对象后也可以调用此方法，obj参数类型为ClassObject时，其作用与ClassObject.plusSetAttribute方法一致。obj参数类型为InstanceObject时，其作用与InstanceObject.plusSetAttribute方法一致。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若没有导入类对象，则无法通过类对象设置类的静态属性值，需调用以下方法设置类的静态属性值，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法也可以设置类对象或实例对象的属性值，如果是类对象设置的则是类的静态属性，如果是实例对象则设置的是对象的非静态属性。

注意：同样导入类对象后也可以调用此方法，obj参数类型为ClassObject时，其作用与ClassObject.plusSetAttribute方法一致。obj参数类型为InstanceObject时，其作用与InstanceObject.plusSetAttribute方法一致。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若没有导入类对象，则无法通过实例对象的“.”操作符调用其成员方法，需通过以下方法调用实例对象的成员方法，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法也可以调用类对象或实例对象的方法，如果是类对象则调用的是类的静态方法，如果是实例对象则调用的是对象的普通成员方法。函数返回值是调用Native层方法运行后的返回值，Native对象的方法无返回值则返回undefined。

注意：同样导入类对象后也可以调用此方法，其作用与通过类对象或实例对象的“.”操作符调用方法作用一致。

示例： 1．不导入类对象，调用类的静态方法 Java代码：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

完整API文档参考：HTML5+ API - Native.js for Android

不导入类对象直接创建类的实例对象，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法会在Native层中对类进行实例化操作，创建一个类的实体并返回NJS层的类实例对象。相比导入类对象后使用new操作符创建对象效率要高。

注意：由于没有导入类对象，所以通过此方法创建的实例对象无法通过“.”操作符直接调用对象的方法，而必须使用plus.ios.invoke方法来调用。classname参数值为“@selector”表示需要创建一个函数指针对象，与Objective-C中的@selector指令功能相似，args参数为函数的名称，此时函数的名称需要包含“：”字符。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

若没有导入类对象，则无法通过实例对象的“.”操作符调用其成员方法，需通过以下方法调用实例对象的成员方法，方法原型如下：

示例源码如下，请查看 pre > code 标签中的内容

此方法也可以调用类对象或实例对象的方法，如果是类对象则调用的是类的静态方法，如果是实例对象则调用的是对象的普通成员方法。函数返回值是调用Native层方法运行后的返回值，Native对象的方法无返回值则返回undefined。

注意：同样导入类对象后也可以调用此方法，其作用与通过类对象或实例对象的“.”操作符调用方法作用一致。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

完整API文档参考：HTML5+ API - Native.js for iOS

前面章节中我们介绍如何通过NJS调用Native API来显示系统提示框，在真机运行时会发现第一次调用时会有0.5s左右的延时，再次调用则不会延时。这是因为NJS中导入类对象操作会花费较长的时间，再次调用时由于类对象已经导入过，会能很快执行完毕。因此可以调整代码结构进行优化，在页面打开后触发的“plusready”事件中进行类对象的导入操作，从而避免第一次调用的延时。

Android平台调整NJS代码结构如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前面章节中我们提到导入类对象会消耗较多的系统资源，导入过多的类对象会影响性能。在高级API中提供一组接口可以在不导入类对象的情况下调用Native API，从而提升代码运行性能。

Android平台使用高级API优化代码如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
function judgePlatform(){
	switch ( plus.os.name ) {
		case "Android":
		// Android平台: plus.android.*
		break;
		case "iOS":
		// iOS平台: plus.ios.*
		break;
		default:
		// 其它平台
		break;
	}
}
```

Example 2 (javascript):
```javascript
function judgePlatform(){
	switch ( plus.os.name ) {
		case "Android":
		// Android平台: plus.android.*
		break;
		case "iOS":
		// iOS平台: plus.ios.*
		break;
		default:
		// 其它平台
		break;
	}
}
```

Example 3 (javascript):
```javascript
function judgePlatform(){
	switch ( plus.os.name ) {
		case "Android":
		// Android平台: plus.android.*
		break;
		case "iOS":
		// iOS平台: plus.ios.*
		break;
		default:
		// 其它平台
		break;
	}
}
```

Example 4 (javascript):
```javascript
function judgePlatform(){
	switch ( plus.os.name ) {
		case "Android":
		// Android平台: plus.android.*
		break;
		case "iOS":
		// iOS平台: plus.ios.*
		break;
		default:
		// 其它平台
		break;
	}
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-android-abifilters.html

**Contents:**
  - # CPU类型
  - # 配置支持的CPU类型
    - # 离线打包配置
  - # 默认值
  - # CPU类型选择建议
  - # 查看apk支持的CPU类型
  - # 常见问题
    - # 在部分华为鸿蒙设备上启动应用慢的问题
    - # CPU类型配置了x86，云端打包后缺没有包含x86
    - # 上架Google Play市场对CPU类型的要求

Android平台配置CPU类型针对的是为了提高运行效率使用C/C++语言开发生成的so库，需要为各cpu类型平台单独编译生成对应指令的so库。Java语言开发的代码运行在虚拟机中，由虚拟机适配CPU类型，不涉及到此问题。

5+ app/uni-app 项目中使用so库的功能（模块）

HBuilderX2.7.0+ 调整 云端打包默认不再包含 x86 CPU类型库，减少apk包体积详情 HBuilderX2.1.5+ 开始支持Android平台的新增适配64位CPU类型，云端打包支持配置App支持的CPU类型 满足Google Play从2019年8月1日起上传的App必需支持64位CPU的要求。

HBuilderX已适配支持以下主流CPU类型：

不支持64位x86指令cpu，即不支持x86_64

注意：不勾选x86在模拟器上可能无法正常运行，以下是常见模拟器是否需要包含x86的情况

5+ app/uni-app 项目，打开manifest.json文件，在 “App常用其它设置” -> “Android设置” -> “支持CPU类型” 项中勾选需要支持的CPU类型：

uni-app x 项目暂不支持可视化配置

打开项目的manifest.json文件，切换到“源码视图”，根据项目类型进行配置

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用Android studio打开Android原生项目，打开对应项目的build.gradle文件。 在Android -> defaultConfig下添加支持的CPU类型，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

注意：离线打包仅支持arm64-v8a、armeabi-v7a、x86三种类型，建议根据自己需求选择打包的CPU类型

ARM64位（arm64-v8a）CPU可以兼容ARM32的指令，也就是说只选择armeabi-v7a类型的so库也可以在64位手机上运行，只是没有完全发挥CPU的性能。 选择支持的CPU类型时请参考以下建议：

使用解压工具打开apk，在lib目录下可以查看到支持的CPU类型，如下图所示：

部分华为新设备（Mate60、Mate X5等）使用的芯片运行32位应用时只能跑在小核上，相当于限制的CPU的性能，如果应用只包含armeabi-v7a会导致应用启动速度非常慢。需要勾选arm64-v8a来解决此问题。 为了适配更多的新设备，建议开发者尽量勾选arm64-v8a。

如果勾选了不支持x86的内置模块或uni原生插件，云端打包后不会包含x86

提交Google Play时要求支持64位，建议选择"armeabi-v7a"和"arm64-v8a"两个即可，也可以只选择"arm64-v8a"。

如果打包选择的CPU类型与设备不兼容，会导致无法正常安装。 通过adb命令安装通常会提示如下错误：

示例源码如下，请查看 pre > code 标签中的内容

使用Android Studio自带的x86模拟器，将不包含x86 cpu类型的apk拖到模拟器安装时会弹出如下提示框：

目前市面上常见的手机都是使用ARM处理器，很少有设备使用x86处理器，因此从HBuilderX2.7.0开始云端打包调整为默认不再包含x86的CPU类型，减少apk包大小：

注意：大多数模拟器（如夜神）必须包含x86，否则应用启动时可能会白屏，请根据上面教程进行配置

**Examples:**

Example 1 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "abiFilters": [
          "armeabi-v7a",
          "arm64-v8a"
        ]
        //...
      },
      //...
    },
    //...
  },
  //..
```

Example 2 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "abiFilters": [
          "armeabi-v7a",
          "arm64-v8a"
        ]
        //...
      },
      //...
    },
    //...
  },
  //..
```

Example 3 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "abiFilters": [
          "armeabi-v7a",
          "arm64-v8a"
        ]
        //...
      },
      //...
    },
    //...
  },
  //..
```

Example 4 (json):
```json
"app-plus": {
    "distribute": {
      "android": {
        "abiFilters": [
          "armeabi-v7a",
          "arm64-v8a"
        ]
        //...
      },
      //...
    },
    //...
  },
  //..
```

---

## 性能优化专题 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/performance.html

**Contents:**
- # 性能优化专题
- # 运行原理
  - # 逻辑层和视图层分离，且非 H5 端通信有折损
  - # 逻辑层详解
  - # 视图层详解
  - # 逻辑层和视图层分离的利与弊
  - # app-vue 和小程序的数据更新，分页面级和组件级
- # 优化建议
  - # 避免使用大图
  - # 优化数据更新

uni-app 在非 H5 端运行时，从架构上分为逻辑层和视图层两个部分。逻辑层负责执行业务逻辑，也就是运行 js 代码，视图层负责页面渲染。

虽然开发者在一个 vue 页面里写 js 和 css，但其实，编译时就已经将它们拆分了。

逻辑层是运行在一个独立的 jscore 里的，它不依赖于本机的 webview，所以一方面它没有浏览器兼容问题，可以在 Android4.4 上跑 es6 代码，另一方面，它无法运行 window、document、navigator、localstorage 等浏览器专用的 js API。

jscore就是一个标准 js 引擎，标准 js 是可以正常运行的，比如 if、for、各种字符串、日期处理等。js 和浏览器的区别要注意区分开来。 `

h5 和小程序平台，以及 app-vue，视图层是 webview。而 app-nvue 的视图层是基于 weex 改造的原生渲染视图。

关于 webview，在 iOS 上，只能使用 iOS 提供的 Webview（默认是 WKWebview）。它有一定的浏览器兼容问题，iOS 版本不同，它的表现有细微差异（一般可忽略）。

Android 上小程序大多自带了一个几十 M 的 chromium webview，而 App 端没办法带这么大体积的三方包，所以 App 端默认使用了 Android system webview，这个系统 webview 跟随手机不同而有差异。当然 App 端也支持使用腾讯 X5 引擎，此时可以在 Android 端统一视图层。

所以 uni-app 的 js 基本没有不同手机的兼容问题（因为 js 引擎自带了），而视图层的 css，在 app-vue 上使用系统 webview 时会有手机浏览器的 css 兼容问题。此时或者不要用太新的 css 语法，或者集成腾讯 x5 引擎。

逻辑层和视图层分离，好处是 js 运算不卡渲染，最简单直接的感受就是：窗体动画稳。

如果开发者使用过 App，应该有概念，webview 新窗体一边做进入动画，一边自身渲染，很容易卡动画。而 uni-app 则无需写预载代码，新窗体渲染快且动画稳定。

但是两层分离也带来一个坏处，这两层互相通信，其实是有损耗的。

iOS 还好，但 Android 低端机上，每次通信都要耗时几十毫秒。平时看不出来影响，但有几个场景表现明显。

不管小程序还是 app，不管 app-vue 还是 app-nvue，都有这个两层通信损耗的问题。

解决这类问题，在 webview 渲染和原生渲染引用了不同的做法：

在 app-vue 和微信小程序上，提供了一种运行于视图层的专属 js，微信叫做wxs 。

wxs 中可以监听手势，以 uni ui 的 swiperAction 组件为例，手指拖动，侧边的列表菜单项要跟手滑出，此时就需要使用 wxs 才能实现流畅效果。还有插件市场里一些自定义下拉刷新的插件，通过 wxs 实现了更高的性能体验。

uni-app 支持把 wxs 编译到微信小程序、App 和 H5 中。

微信里对 wxs 限制较多，只能实现有限的功能。app 端提供了更强大的renderjs ，并兼容到 H5 平台。

比如 canvas 动画，微信的 canvas 无法通过 wxs 操作，js 不停绘制 canvas 动画因通信折损而无法流畅。uni-app 的 app-vue 里的 canvas 对象设计在 webview 视图层的，通过 renderjs 可以在视图层直接操作 canvas 动画，将不再有通信折损，实现更流畅的效果，详见：renderjs

在 app-nvue 里，逻辑层和视图层的折损一样存在。包括 react native 也有这个问题。所以也千万别以为原生渲染就多么高级。

weex 提供了一套 bindingx 机制，可以在 js 里一次性传一个表达式给原生层，由原生层解析后根据指令操作原生的视图层，避免反复跨层通信。这个技术在 uni-app 里也可以使用。

bindingx 作为一种表达式，它的功能不及 js 强大，但手势监听、动画还是可以实现的，比如 uni ui 的 swiperAction 组件在 app-nvue 下运行时会自动启用 bindingx，以实现流畅跟手。

对于复杂页面，更新某个区域的数据时，需要把这个区域做成组件，这样更新数据时就只更新这个组件，否则会整个页面的数据更新，造成点击延迟卡顿。

比如微博长列表页面，点击一个点赞图标，赞数要立即+1，此时这个点赞按钮一定要做成组件。否则这个+1 会引发页面级所有数据的从 js 层向视图层的同步。

app-nvue 和 h5 不存在此问题。造成差异的原因是小程序目前只提供了组件差量更新的机制，不能自动计算所有页面差量。

页面中若大量使用大图资源，会造成页面切换的卡顿，导致系统内存升高，甚至白屏崩溃。

尤其是不要把多张大图缩小后显示在一个屏幕内，比如上传图片前选了数张几 M 体积的照片，然后缩小在一个屏幕中展示多张几 M 的大图，非常容易白屏崩溃。

对大体积的二进制文件进行 base64，也非常耗费资源。

在 uni-app 中，定义在 data 里面的数据每次变化时都会通知视图层重新渲染页面。所以如果不是视图所需要的变量，可以不定义在 data 中，可在外部定义变量或直接挂载在 vue 实例上，以避免造成资源浪费。

页面初始化时，逻辑层如果一次性向视图层传递很大的数据，使视图层一次性渲染大量节点，可能造成通讯变慢、页面切换卡顿，所以建议以局部更新页面的方式渲染页面。如：服务端返回 100 条数据，可进行分批加载，一次加载 50 条，500ms 后进行下一次加载。

深层嵌套的节点在页面初始化构建时往往需要更多的内存占用，并且在遍历节点时也会更慢些，所以建议减少深层的节点嵌套。

有些 nvue 页面在 Android 低端机上初次渲染时，会看到从上到下的渲染过程，这往往都是因为组件过多导致的。每个组件渲染时都会触发一次通信，太多组件就会阻塞通信。

HBuilder X 3.6.9+ 已支持暗黑模式。详情

示例源码如下，请查看 pre > code 标签中的内容

在 App 端 uni-app 的 nvue 页面可是基于 weex 升级改造的原生渲染引擎，实现了页面原生渲染能力、提高了页面流畅性。若对页面性能要求较高可以使用此方式开发，详见：nvue。

**Examples:**

Example 1 (unknown):
```unknown
localstorage
```

Example 2 (json):
```json
"style": {
    "app-plus": {
        "background":"#000000"
    }
}
```

Example 3 (json):
```json
"style": {
    "app-plus": {
        "background":"#000000"
    }
}
```

Example 4 (json):
```json
"style": {
    "app-plus": {
        "background":"#000000"
    }
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-android-x5.html

**Contents:**
  - # 配置使用X5内核
  - # X5内核能解决什么问题：
  - # 验证是否使用x5以及x5版本号的方法
  - # X5内核的注意事项
  - # x5内核自更新
  - # 适配问题
  - # 汇总x5浏览器内核加载失败问题
  - # 非WiFi情况下载X5浏览器内核
      - 本页导读

腾讯TBS x5内核仅支持Android平台；iOS只能使用自带的WKWebview/UIWebview

以下说明中的“腾讯TBS x5内核“精简为“x5内核”。 集成x5内核说明：

打开项目的manifest.json文件，在“App模块配置”中勾选“Android X5 Webview(腾讯TBS)”：

使用X5内核模块提交云端打包后才能生效，真机运行调试时请使用自定义基座 CPU类型配置 不支持“x86”，建议仅配置“armeabi-v7a” 否则可能无法正常使用X5内核 HBuilderX3.0.7+版本CPU类型配置 开始支持“arm64-v8a” 本地离线打包请参考：X5 Webview 配置 uni小程序SDK请参考：unimp小程序集成x5教程

示例源码如下，请查看 pre > code 标签中的内容

x5内核存在自更新机制。所以可能存在历史版本升级了x5内核导致的兼容性问题。集成的同学需要注意！

目前已知 TBS45738版本更新后会导致 uniapp vue页面的input组件adjust-position=false失效！使用x5内核的同学请知晓尽快适配，可以改为nvue或不适用x5内核。

manifest.json 配置webView节点

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
plus.navigator.getUserAgent()
```

Example 2 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 11; PEXM00 Build/RKQ1.201217.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045738
```

Example 3 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 11; PEXM00 Build/RKQ1.201217.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045738
```

Example 4 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 11; PEXM00 Build/RKQ1.201217.002; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/77.0.3865.120 MQQBrowser/6.2 TBS/045738
```

---

## iOS UTS扩展开发 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/uts-development-ios.html

**Contents:**
- # iOS UTS扩展开发
- # uts扩展插件
- # Xcode环境配置
    - # Xcode 的命令行工具
      - 本页导读

版本要求: HBuilderX 3.6.9+

HBuilderX 3.6.9+，新增 uts插件 iOS平台 支持本地编译和真机运行，需要配置Xcode环境。

安装uts扩展插件和Xcode后，您在本地修改uts插件iOS平台代码，即可在本地编译并真机运行到iOS设备，而无需再提交代码到云端制作自定义基座。

当您运行带有uts插件的项目到iOS真机设备时，会自动安装【uts开发扩展 - iOS】插件，请务必安装。具体如下：

本地真机运行 uts插件 目前需要安装Xcode 15.2 或更高版本，以及和 Xcode版本相同的 Xcode Command Line Tools。

你可以通过 App Store 或到Apple 开发者官网上下载 。这一步骤会同时安装 Xcode IDE、Xcode 的命令行工具和 iOS 模拟器。

如果是新下载Xcode后, 要打开一次，并确认Xcode的命令行工具如下图所示:

启动 Xcode，并在Xcode | Settings(或者 Preferences) | Locations菜单中检查一下是否装有某个版本的Command Line Tools。Xcode 的命令行工具中包含一些必须的工具，比如git等。

请在使用uts插件真机运行 之前确保你本地的环境 如上图一样 准备完毕。

**Examples:**

Example 1 (unknown):
```unknown
Xcode | Settings(或者 Preferences) | Locations
```

Example 2 (unknown):
```unknown
Command Line Tools
```

---

## Android原生应用清单文件和资源 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-nativeresource-android

**Contents:**
- # Android原生应用清单文件和资源
- # 应用清单文件 AndroidManifest.xml
  - # Android权限配置
  - # 移除Android权限
  - # Android url scheme配置
    - # 5+ App/uni-app 项目
    - # uni-app x 项目
  - # Android 修改activity注册配置信息
    - # 5+ App/uni-app 项目
    - # uni-app x 项目

app打包，在Android原生开发中提供了配置 AndroidManifest.xml 和 资源目录 assets、res。uni-app中对常用项进行了封装，提供了manifest.json 。

但manifest.json不能包含所有Android的配置。

在HBuilderX 3.6以前，开发者如需使用manifest未封装的配置、或需自定义资源目录 assets、res下的内容，只能离线打包或开发App原生语言插件 。

HBuilderX3.6.0起，支持直接在应用项目中配置应用清单文件 AndroidManifest.xml 和资源目录 assets、res。

在HBuilderX中，对项目根目录右键菜单 "新建" -> "自定义文件"

输入文件名称 AndroidManifest.xml（注意大小写敏感），点击 “创建” 按钮新建文件

根据应用需求编辑添加需要的内容，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果应用需要一些特殊的Android权限配置，可根据需求在manifest节点下添加，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

注意 uni-app x项目manifest.json中没有提供Android权限的配置，需在此AndroidManifest.xml中添加。

如果应用使用了三方SDK（uts插件 或uni原生插件 ）默认包含了一些Android权限，而实际可能不需要用到，则可以在 manifest.json 中的 “安卓/iOS权限配置” -> “Android云打包权限配置” -> “强制移除的权限” 中添加要移除的权限，如下例是移除"android.permission.INSTALL_PACKAGES"、"android.permission.REQUEST_INSTALL_PACKAGES"权限：

注：在应用清单文件文件中配置权限并添加tools:node="remove"移除在某些场景下可能不生效，推荐在 manifest.json 的可视化界面配置。

uni-app 项目请在 manifest.json 可视化界面的 App常用其它设置 中配置，详情参考Android设置url scheme

应用需要向系统注册url scheme，以便在浏览器中通过scheme打开App，可根据需求在AndroidManifest.xml文件中添加android:scheme数据，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 项目支持通过此方式配置url scheme，需 HBuilderX4.18及以上版本

android平台的activity内容载体，部分特殊功能需修改activity注册配置 才能实现功能，因此提供如下方式修改注册的配置信息。

5+ App/uni-app 项目 页面 activity 如下:

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 项目页面 activity 如下:

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX中对项目右键菜单 "新建" -> "目录"

输入名称 nativeResources（注意大小写敏感），确定并创建目录。

继续创建“android”子目录、创建“assets”、“res”二级子目录，结构如下：

将需要添加的Android原生资源文件分别拷贝到assets、res目录，云端打包时将会合并到安装包中。

在 Android 原生开发中可以在 build.gradle 文件配置 manifestPlaceholders 数据用于替换 AndroidManifest.xml 中的占位符，例如 ${api_key} 。 为了满足此需求，在项目的 nativeResources/android 目录下可添加 manifestPlaceholders.json 文件来配置 manifestPlaceholders 数据。

示例源码如下，请查看 pre > code 标签中的内容

manifestPlaceholders.json 文件中的键名和键值必需是字符串，其中键名为占位符的名称，如占位符 ${api_key} 的键名为 api_key，键值为要替换 AndroidManifest.xml 中的占位符的值。

注意 云端打包默认保留以下manifestPlaceholders，避免使用

离线打包时应用清单文件和资源需要开发者手动合并到Android原生工程中。

**Examples:**

Example 1 (unknown):
```unknown
AndroidManifest.xml
```

Example 2 (xml):
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" 
  package="io.dcloud.nativeresouce">
    <!--permissions-->

    <application>
        <!--meta-data-->
        <meta-data android:name="My_Custom_Key" android:value="My_Custom_Value"/>

    </application>
</manifest>
```

Example 3 (xml):
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" 
  package="io.dcloud.nativeresouce">
    <!--permissions-->

    <application>
        <!--meta-data-->
        <meta-data android:name="My_Custom_Key" android:value="My_Custom_Value"/>

    </application>
</manifest>
```

Example 4 (xml):
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" xmlns:tools="http://schemas.android.com/tools" 
  package="io.dcloud.nativeresouce">
    <!--permissions-->

    <application>
        <!--meta-data-->
        <meta-data android:name="My_Custom_Key" android:value="My_Custom_Value"/>

    </application>
</manifest>
```

---

## 状态管理Vuex | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-vuex.html

**Contents:**
- # 状态管理Vuex
- # 介绍
  - # Vuex 是什么？
  - # 什么是“状态管理模式”？
- # 优势与使用场景
  - # Vuex与全局变量区别
  - # 什么时候需要用vuex？
- # 项目结构
- # 核心概念
  - # State

Vuex 是一个专为 Vue.js 应用程序开发的状态管理模式。它采用集中式存储管理应用的所有组件的状态，并以相应的规则保证状态以一种可预测的方式发生变化。

让我们从一个简单的 Vue 计数应用开始：

示例源码如下，请查看 pre > code 标签中的内容

以下是一个表示“单向数据流”理念的简单示意：

但是，当我们的应用遇到多个组件共享状态时，单向数据流的简洁性很容易被破坏：

因此，我们把组件的共享状态抽取出来，以一个全局单例模式管理。在这种模式下，我们的组件树构成了一个巨大的“视图”，不管在树的哪个位置，任何组件都能获取状态或者触发行为！这就是vuex的产生。

通过定义和隔离状态管理中的各种概念并通过强制规则维持视图和状态间的独立性，我们的代码将会变得更结构化且易维护。这就是 Vuex 背后的基本思想。

Vuex 是专门为 Vue.js 设计的状态管理库，以利用 Vue.js 的细粒度数据响应机制来进行高效的状态更新。

如果你想交互式地学习 Vuex，可以看这个 Scrimba 上的 Vuex 课程 ，它将录屏和代码试验场混合在了一起，你可以随时暂停并尝试。

应用层级的状态应该集中到单个 store 对象中。

提交 mutation 是更改状态的唯一方法，并且这个过程是同步的。

异步逻辑都应该封装到 action 里面。

只要你遵守以上规则，如何组织代码随你便。如果你的 store 文件太大，只需将 action 、mutation 和 getter 分割到单独的文件。

对于大型应用，我们会希望把 Vuex 相关代码分割到模块中。下面是项目结构示例：

示例源码如下，请查看 pre > code 标签中的内容

每一个 Vuex 应用的核心就是 store（仓库），它包含着你的应用中大部分的状态 (state)。

状态管理有5个核心：state、getter、mutation、action、module。

单一状态树，定义应用状态的默认初始值，页面显示所需的数据从该对象中进行读取。

由于 Vuex 的状态存储是响应式的，从 store 实例中读取状态最简单的方法就是在计算属性中返回某个状态：

示例源码如下，请查看 pre > code 标签中的内容

每当 store.state.count 变化的时候, 都会重新求取计算属性，并且触发更新相关联的 DOM。

然而，这种模式导致组件依赖全局状态单例。在模块化的构建系统中，在每个需要使用 state 的组件中需要频繁地导入，并且在测试组件时需要模拟状态。

Vuex 通过 store 选项，提供了一种机制将状态从根组件“注入”到每一个子组件中（需调用 Vue.use(Vuex)）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当一个组件需要获取多个状态的时候，将这些状态都声明为计算属性会有些重复和冗余。 为了解决这个问题，我们可以使用 mapState 辅助函数 帮助我们生成计算属性，让你少按几次键：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

mapState 函数返回的是一个对象。使用对象展开运算符将多个对象合并为一个，以使我们可以将最终对象传给 computed 属性。极大地简化写法：

示例源码如下，请查看 pre > code 标签中的内容

可以认为是 store 的计算属性，对 state 的加工，是派生出来的数据。

在 uni-app 项目根目录下，store 目录 index.js 文件下：

示例源码如下，请查看 pre > code 标签中的内容

在 store 上注册 getter，getter 方法接受以下参数：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意，getter 在通过属性访问时是作为 Vue 的响应式系统的一部分缓存其中的。

示例源码如下，请查看 pre > code 标签中的内容

你也可以通过让 getter 返回一个函数，来实现给 getter 传参。在你对 store 里的数组进行查询时非常有用。

注意，getter 在通过方法访问时，每次都会去进行调用，而不会缓存结果。

示例源码如下，请查看 pre > code 标签中的内容

mapGetters 辅助函数仅仅是将 store 中的 getter 映射到局部计算属性：

示例源码如下，请查看 pre > code 标签中的内容

如果你想将一个 getter 属性另取一个名字，使用对象形式：

示例源码如下，请查看 pre > code 标签中的内容

Vuex中store数据改变的唯一方法就是mutation

通俗的理解，mutations 里面装着改变数据的方法集合，处理数据逻辑的方法全部放在 mutations 里，使数据和视图分离。

Vuex 中的 mutation 非常类似于事件：每个 mutation 都有一个字符串的 事件类型 (type) 和 一个 回调函数 (handler)。这个回调函数就是我们实际进行状态更改的地方，并且它会接受 state 作为第一个参数：

示例源码如下，请查看 pre > code 标签中的内容

你不能直接调用一个 mutation handler。这个选项更像是事件注册：“当触发一个类型为 add 的 mutation 时，调用此函数”，要唤醒一个 mutation handler，你需要以相应的 type 调用 store.commit 方法。

注意：store.commit 调用 mutation（需要在根节点注入 store）。

示例源码如下，请查看 pre > code 标签中的内容

你可以向 store.commit 传入额外的参数，即 mutation 的 载荷（payload）：

还是以累加器的例子来实现 mutation 函数的传参，来动态定义累加的数量。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

我们修改组件中 store.commit 提交方式：

示例源码如下，请查看 pre > code 标签中的内容

当使用对象风格的提交方式，整个对象都作为载荷传给 mutation 函数，因此 handler 保持不变：

示例源码如下，请查看 pre > code 标签中的内容

使用 mapMutations 辅助函数将组件中的 methods 映射为 store.commit 调用（需要在根节点注入 store）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

既然 Vuex 的 store 中的状态是响应式的，那么当我们变更状态时，监视状态的 Vue 组件也会自动更新。这也意味着 Vuex 中的 mutation 也需要与使用 Vue 一样遵守一些注意事项：

最好提前在你的 store 中初始化好所有所需属性。

使用 Vue.set(obj, 'newProp', 123), 或者

以新对象替换老对象。例如，利用对象展开运算符我们可以这样写：

示例源码如下，请查看 pre > code 标签中的内容

一条重要的原则就是要记住** mutation 必须是同步函数**

我们要通过提交 mutation 的方式来改变状态数据，是因为我们想要更明确地追踪到状态的变化。如果是类似下面这样异步的话：

示例源码如下，请查看 pre > code 标签中的内容

我们就不知道什么时候状态会发生改变，所以也就无法追踪了，这与 mutation 的设计初心相悖，所以强制规定它必须是同步函数。

action 类似于 mutation ，不同在于：

示例源码如下，请查看 pre > code 标签中的内容

action 函数接受一个与 store 实例具有相同方法和属性的 context 对象，因此你可以调用 context.commit 提交一个 mutation，或者通过 context.state 和 context.getters 来获取 state 和 getters。

实践中，我们会经常用到 ES2015 的参数解构来简化代码（特别是我们需要调用 commit 很多次的时候）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

action 可以执行任意的同步和异步操作

我们可以在 action 内部执行异步操作：

示例源码如下，请查看 pre > code 标签中的内容

来看一个更加实际的购物车示例，涉及到调用异步 API 和分发多重 mutation：

示例源码如下，请查看 pre > code 标签中的内容

注意我们正在进行一系列的异步操作，并且通过提交 mutation 来记录 action 产生的状态变更。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

action 通常是异步的，那么如何知道 action 什么时候结束呢？更重要的是，我们如何才能组合多个 action，以处理更加复杂的异步流程？

首先，你需要明白 store.dispatch 可以处理被触发的 action 的处理函数返回的 Promise，并且 store.dispatch 仍旧返回 Promise ：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

最后，如果我们利用 async / await，我们可以如下组合 action ：

示例源码如下，请查看 pre > code 标签中的内容

一个 store.dispatch 在不同模块中可以触发多个 action 函数。在这种情况下，只有当所有触发函数完成后，返回的 Promise 才会执行。

由于使用单一状态树，应用的所有状态会集中到一个比较大的对象。当应用变得非常复杂时，store 对象就有可能变得相当臃肿。

为了解决以上问题，Vuex 允许我们将 store 分割成模块（module）。每个模块拥有自己的 state、mutation、action、getter、甚至是嵌套子模块——从上至下进行同样方式的分割：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

vue是单向数据流，子组件不能直接修改父组件的数据，而通过vuex状态管理实现：把组件的共享状态抽取出来，以一个全局单例模式管理。在这种模式下，我们的组件树构成了一个巨大的“视图”，不管在树的哪个位置，任何组件都能获取状态或者触发行为！

**Examples:**

Example 1 (html):
```html
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

Example 2 (html):
```html
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

Example 3 (html):
```html
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

Example 4 (vue):
```vue
<!-- view 视图-->
<template>
	<view>
		{{count}}
	</view>
</template>
<script>
	export default {
		// state 数据源
		data() {
			return {
				count: 0
			}
		},
		// actions 控制状态变化
		methods: {
			increment() {
				this.count++
			}
		}
	}
</script>
```

---

## uni错误规范 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/err-spec.html

**Contents:**
- # uni错误规范
- # 背景
- # 定义
- # SourceError
- # UniAggregateError
- # UniError
- # errSubject（模块/主题）名称
- # uts插件或uvue页面中使用UniError
  - # 构造UniError对象
  - # 构造SourceError对象

小程序平台的错误信息，大多返回的格式是errCode和errMsg。但不同的小程序平台，返回的errCode有可能不一样。

在实际开发中，uni-app引擎、三方插件、开发者自己的业务代码，都会返回错误，但errCode也可能彼此冲突。

在统一的错误拦截和uni统计中，混乱的errCode会造成很多问题。

很多错误是由更底层的错误引发的，但只暴露最外层错误难以入手排查，需要暴露更底层的错误。

为了进一步规范错误信息格式，uni-app定义了更完善的错误规范：

从2022-11-11起，DCloud新增的所有API将使用这套uni错误规范。同时我们推荐所有的插件作者也使用这套规范，在errSubject中声明自己的插件id。

所有异步API，都应通过callback回调返回错误，在回调函数参数中包含错误信息，回调函数参数为UniError类型

示例源码如下，请查看 pre > code 标签中的内容

用于保存引起错误的源错误，如app端三方SDK的错误信息，包括以下属性：

注意 源错误可以根据业务情况扩展其它属性，如uni-ad中，可以添加slotId来表示聚合的三方广告位标识

用于保存多个源错误，如app端某个错误可能是由多个三方SDK的错误引起，可将多个源错误组成UniAggregateError对象。 包括以下属性：

Uni统一错误信息，用于统一各平台（端）错误信息

当源错误存在多个时，需要将SourceError封装到AggregateError对象中，按以下方式获取SourceError数组：

示例源码如下，请查看 pre > code 标签中的内容

errSubject属性值表示返回错误的调用模块名称。

在uni-app、uni-app x中的错误信息建议统一使用UniError对象，以便在发生错误时统一捕获处理，特别是以下情况：

在App端，UniError和SourceError都是从uts的Error 继承。

UniError对象必须通过 new 操作符构造

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当错误信息是有三方SDK或其它模块引起时，可以将三方SDK或其它模块的错误信息封装在SourceError中作为UniError的源错误

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当错误是由多个SourceError源错误引起时，可以将多个源错误放到一个UniAggregateError对象中

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
//源错误信息
interface SourceError {
    message: string,
    subject?: string,
    code?: number,
    cause?: SourceError | UniAggregateError
}

//Uni聚合源错误信息
interface UniAggregateError extends SourceError {
	errors: Array<SourceError|UniAggregateError>
}

//uni错误信息
interface UniError {
	errSubject: string,
	errCode: number,
	errMsg: string,
	data?: Object,
	cause?: SourceError | UniAggregateError
}

//回调函数
function CallBack(err:UniError){
	//console.log(JSON.stringify(res));
}
```

Example 2 (typescript):
```typescript
//源错误信息
interface SourceError {
    message: string,
    subject?: string,
    code?: number,
    cause?: SourceError | UniAggregateError
}

//Uni聚合源错误信息
interface UniAggregateError extends SourceError {
	errors: Array<SourceError|UniAggregateError>
}

//uni错误信息
interface UniError {
	errSubject: string,
	errCode: number,
	errMsg: string,
	data?: Object,
	cause?: SourceError | UniAggregateError
}

//回调函数
function CallBack(err:UniError){
	//console.log(JSON.stringify(res));
}
```

Example 3 (typescript):
```typescript
//源错误信息
interface SourceError {
    message: string,
    subject?: string,
    code?: number,
    cause?: SourceError | UniAggregateError
}

//Uni聚合源错误信息
interface UniAggregateError extends SourceError {
	errors: Array<SourceError|UniAggregateError>
}

//uni错误信息
interface UniError {
	errSubject: string,
	errCode: number,
	errMsg: string,
	data?: Object,
	cause?: SourceError | UniAggregateError
}

//回调函数
function CallBack(err:UniError){
	//console.log(JSON.stringify(res));
}
```

Example 4 (typescript):
```typescript
//源错误信息
interface SourceError {
    message: string,
    subject?: string,
    code?: number,
    cause?: SourceError | UniAggregateError
}

//Uni聚合源错误信息
interface UniAggregateError extends SourceError {
	errors: Array<SourceError|UniAggregateError>
}

//uni错误信息
interface UniError {
	errSubject: string,
	errCode: number,
	errMsg: string,
	data?: Object,
	cause?: SourceError | UniAggregateError
}

//回调函数
function CallBack(err:UniError){
	//console.log(JSON.stringify(res));
}
```

---

## json 文件引入 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/page-json.html

**Contents:**
  - # json 文件引入
      - 本页导读

uni-app vue3 和 uni-app x (HBuilderX 4.25+) 项目支持引入 json 文件。

js | ts | uts 文件或 script 标签内引入 json 文件时，可以使用相对路径或绝对路径，例如:

示例源码如下，请查看 pre > code 标签中的内容

导入 json 文件时支持解构，此时会根据导入内容进行摇树，减小包体积，例如：

示例源码如下，请查看 pre > code 标签中的内容

导入的 json 文件内部支持条件编译, 导入的结果是根据条件编译规则进行处理后的结果，以如下 json 文件为例：

示例源码如下，请查看 pre > code 标签中的内容

在 App 平台导入的结果中，pages 下只包含 path 为 pages/index/index 和 pages/index/app 的对象。 在 Web 平台导入的结果中，pages 下只包含 path 为 pages/index/index 和 pages/index/web 的对象。

**Examples:**

Example 1 (unknown):
```unknown
uni-app vue3
```

Example 2 (unknown):
```unknown
uni-app x (HBuilderX 4.25+)
```

Example 3 (unknown):
```unknown
js | ts | uts
```

Example 4 (python):
```python
// 绝对路径，@指向项目根目录，在cli项目中@指向src目录
import pagesJson from '@/pages.json';
// 相对路径
import pagesJson from '../../common/pages.json';
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/syntax-js.html

**Contents:**
- # 标准js和浏览器js的区别
- # ES6 支持
- # App端
  - # Android平台
  - # iOS平台
  - # 部分兼容性示例
      - 本页导读

uni-app的js API由标准ECMAScript的js API 和 uni 扩展 API 这两部分组成。

标准ECMAScript的js仅是最基础的js。浏览器基于它扩展了window、document、navigator等对象。小程序也基于标准js扩展了各种wx.xx、my.xx、swan.xx的API。node也扩展了fs等模块。

uni-app基于ECMAScript扩展了uni对象，并且API命名与小程序保持兼容。

uni-app的js代码，h5端运行于浏览器中。非h5端（包含小程序和App），Android平台运行在v8引擎中，iOS平台运行在iOS自带的jscore引擎中，都没有运行在浏览器或webview里。

非H5端，虽然不支持window、document、navigator等浏览器的js API，但也支持标准ECMAScript。

请注意不要把浏览器里的js扩展对象等价于标准js。

所以uni-app的非H5端，一样支持标准js，支持if、for等语法，支持字符串、数字、时间、布尔值、数组、自定义对象等变量类型及各种处理方法。仅仅是不支持window、document、navigator等浏览器专用对象。

uni-app 在支持绝大部分 ES6 API 的同时，也支持了 ES7 的 await/async。

ES6 API 的支持，详见如下表格部分（x 表示不支持，无特殊说明则表示支持）：

因为iOS上不允许三方js引擎，所以iOS上不区分App、小程序、H5，各端均仅依赖iOS版本。

在App端JS脚本运行在独立的JS引擎中，vue页面使用系统webview渲染，nvue页面使用系统原生View渲染。

正则反向预查 ?<= ?<! ，iOS16.4+支持

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run-and-debug.html

**Contents:**
- # 运行调试入口
  - # 运行入口
  - # 调试入口
  - # 线上平台排错
      - 本页导读

运行，指将项目运行起来，可以一边修改代码、一边立即看到修改结果，同时可以打log日志（console.log）。

而调试，也称之为debug，在运行的基础之上，进一步可以打断点、单步跟踪、看堆栈信息。

uni-app可以用cli项目的npm命令运行，但更重要的是，DCloud提供了uni-app的专用开发工具HBuilder，可以更好的开发uni-app。

如果使用cli项目，在非HBuilder环境下运行uni-app，那就执行普通的 npm run dev:%platform%命令即可，使用外部工具运行。详见

本文重点讲述HBuilder中的运行和调试方法。

简要来讲，HBuilder为uni-app提供了内置的web浏览器、web端调试环境、App的真机运行环境、App调试环境、uniCloud运行环境、uniCloud调试环境。

在HBuilder中，有顶部菜单、toolbar运行按钮、快捷键三种运行入口。

弹出的菜单还支持键盘快捷选择：按回车可以选中菜单的第一项；按数字可以快捷选中菜单项开头数字对应的菜单项。

如果你不能看到相关菜单，那么HBuilder当前打开的文件可能不是uni-app项目下的文件。

uni-app一般是先运行后调试。debug的入口在运行之后的控制台上。

运行后的控制台，右上角会有一个红色虫子图标或调试的checkbox。

应用上线后，各种用户环境下可能会有报错，需要开发者统计和分析。但三方统计系统（如友盟、阿拉丁、百度），对运行端的报错采集，提示的是uni-app编译器编译后的代码报错的行数，相当于乱码，无法告知开发者是uni-app的vue或js的哪一行代码报错。

为了解决这个问题，DCloud提供了uni统计的sourceMap功能，在uni统计后台可以清晰的看到报错的环境和准确的报错代码，是uni-app编译前的vue或js的具体信息。详见

**Examples:**

Example 1 (unknown):
```unknown
npm run dev:%platform%
```

Example 2 (unknown):
```unknown
toolbar的运行按钮点击后会展开一个菜单。这个菜单可配置，通过`自定义菜单`将不常用的运行项目折叠起来。
```

Example 3 (unknown):
```unknown
toolbar的运行按钮点击后会展开一个菜单。这个菜单可配置，通过`自定义菜单`将不常用的运行项目折叠起来。
```

Example 4 (unknown):
```unknown
toolbar的运行按钮点击后会展开一个菜单。这个菜单可配置，通过`自定义菜单`将不常用的运行项目折叠起来。
```

---

## 鸿蒙元服务唤起鸿蒙应用 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/open-app.html

**Contents:**
- # 鸿蒙元服务唤起鸿蒙应用
- # 唤起系统应用
- # 唤起相同开发名下鸿蒙应用
- # 参数获取
      - 本页导读

目前鸿蒙元服务可以通过 button 组件 唤起系统应用、相同开发者名下的鸿蒙应用。

示例源码如下，请查看 pre > code 标签中的内容

跳转非同名开发者应用系统拦截，提示无法打开。

示例源码如下，请查看 pre > code 标签中的内容

上述代码可在 uniapp 的 helloUniApp 元服务中唤起 统一应用软件 应用并传递参数。

传递的参数可通过 UTS 插件来读取。创建 UTS API 插件，定位到 uni_modules/uni-onLaunch/utssdk/app-harmony/index.uts

示例源码如下，请查看 pre > code 标签中的内容

传递的参数，可在 want.parameters 中读取。

**Examples:**

Example 1 (html):
```html
<button
  type="primary"
  open-type="launchApp"
  @launchapp="onLaunchApp"
  @error="onError"
  app-bundle-name="com.huawei.hmos.calendar"
  app-ability-name="MainAbility"
>
  打开日历
</button>
```

Example 2 (html):
```html
<button
  type="primary"
  open-type="launchApp"
  @launchapp="onLaunchApp"
  @error="onError"
  app-bundle-name="com.huawei.hmos.calendar"
  app-ability-name="MainAbility"
>
  打开日历
</button>
```

Example 3 (html):
```html
<button
  type="primary"
  open-type="launchApp"
  @launchapp="onLaunchApp"
  @error="onError"
  app-bundle-name="com.huawei.hmos.calendar"
  app-ability-name="MainAbility"
>
  打开日历
</button>
```

Example 4 (jsx):
```jsx
<button
  type="primary"
  open-type="launchApp"
  @launchapp="onLaunchApp"
  @error="onError"
  app-bundle-name="com.huawei.hmos.calendar"
  app-ability-name="MainAbility"
>
  打开日历
</button>
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment-alipay.html

**Contents:**
  - # 开通
  - # 配置
  - # 服务器生成订单
  - # 应用内发起支付
    - # 订单对象说明
    - # 示例代码
      - 本页导读

更多信息详见支付宝官方文档 App 支付接入准备

打开项目的manifest.json文件，在“App模块配置”项的“Payment(支付)”下，勾选“支付宝支付”：

在 App 端调用支付前，需在业务服务器生成支付订单，可参考：

更多信息详见支付宝官方文档 服务端接入流程

支付宝支付订单对象为String类型，字符串数据格式为"application/x-www-form-urlencoded"，即 key=value 形式，使用 & 符号连接。示例如下：

示例源码如下，请查看 pre > code 标签中的内容

更多信息详见支付宝官方文档 APP支付请求参数说明

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
app_id=2015052600090779&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=2016-08-15%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D
```

Example 2 (unknown):
```unknown
app_id=2015052600090779&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=2016-08-15%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D
```

Example 3 (unknown):
```unknown
app_id=2015052600090779&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=2016-08-15%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D
```

Example 4 (unknown):
```unknown
app_id=2015052600090779&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=2016-08-15%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-share.html

**Contents:**
      - 本页导读

App端Share(分享)模块封装了市场上主流的三方分享SDK，提供JS API统一调用分享功能。

uni-app项目中，官方提供了封装好的uni-share 插件方便开发者使用。

使用分享功能需在项目manifest.json的“App模块配置”中勾选“Share(分享)”，并根据项目实际情况勾选使用的三方分享平台：

提示：三方分享模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## 工程简介 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/project.html

**Contents:**
- # 工程简介
- # 目录结构
  - # static目录
      - 本页导读

一个 uni-app 工程，就是一个 Vue 项目，你可以通过 HBuilderX 或 cli 方式快速创建 uni-app 工程，详见：快速上手。

一个uni-app工程，默认包含如下目录及文件：

uni-app编译器根据pages.json扫描需要编译的页面，并根据页面引入的js、css合并打包文件。 对于本地的图片、字体、视频、文件等资源，如果可以直接识别，那么也会把这些资源文件打包进去，但如果这些资源以变量的方式引用， 比如：<image :src="url"></image>，甚至可能有更复杂的函数计算，此时编译器无法分析。

那么有了static目录，编译器就会把这个目录整体复制到最终编译包内。这样只要运行时确实能获取到这个图片，就可以显示。

当然这也带来一个注意事项，如果static里有一些没有使用的废文件，也会被打包到编译包里，造成体积变大。

另外注意，static目录支持特殊的平台子目录，比如web、app、mp-weixin等，这些目录存放专有平台的文件，这些平台的文件在打包其他平台时不会被包含。详见条件编译

非 static 目录下的文件（vue组件、js、css 等）只有被引用时，才会被打包编译。

css、less/scss 等资源不要放在 static 目录下，建议这些公用的资源放在自建的 common 目录下。

uni-app支持App原生资源目录nativeResources，下面有assets、res等目录，详见。但和static目录没有关系。

static目录下的文件，在app第一次启动时，解压到了app的外部存储目录（external-path）。（uni-app x 从3.99+不再解压）

所以注意控制static目录的大小，太大的static目录和太多文件，会造成App安装后第一次启动变慢。

**Examples:**

Example 1 (unknown):
```unknown
┌─uniCloud              云空间目录，支付宝小程序云为uniCloud-alipay，阿里云为uniCloud-aliyun，腾讯云为uniCloud-tcb（详见uniCloud）
│─components            符合vue组件规范的uni-app组件目录
│  └─comp-a.vue         可复用的a组件
├─utssdk                存放uts文件（已废弃）
├─pages                 业务页面文件存放的目录
│  ├─index
│  │  └─index.vue       index页面
│  └─list
│     └─list.vue        list页面
├─static                存放应用引用的本地静态资源（如图片、视频等）的目录，注意：静态资源都应存放于此目录
├─uni_modules           存放uni_module 详见
├─platforms             存放各平台专用页面的目录，详见
├─nativeplugins         App原生语言插件 详见
├─nativeResources       App端原生资源目录
│  ├─android            Android原生资源目录 详见
|  └─ios                iOS原生资源目录 详见
├─hybrid                App端存放本地html文件的目录，详见
├─wxcomponents          存放微信小程序、QQ小程序组件的目录，详见
├─mycomponents          存放支付宝小程序组件的目录，详见
├─swancomponents        存放百度小程序组件的目录，详见
├─ttcomponents          存放抖音小程序、飞书小程序组件的目录，详见
├─kscomponents          存放快手小程序组件的目录，详见
├─jdcomponents          存放京东小程序组件的目录，详见
├─unpackage             非工程代码，一般存放运行或发行的编译结果
├─main.js               Vue初始化入口文件
├─App.vue               应用配置，用来配置App全局样式以及监听 应用生命周期
├─pages.json            配置页面路由、导航条、选项卡等页面类信息，详见
├─manifest.json         配置应用名称、appid、logo、版本等打包信息，详见
├─AndroidManifest.xml   Android原生应用清单文件 详见
├─Info.plist            iOS原生应用配置文件 详见
└─uni.scss              内置的常用样式变量
```

Example 2 (unknown):
```unknown
┌─uniCloud              云空间目录，支付宝小程序云为uniCloud-alipay，阿里云为uniCloud-aliyun，腾讯云为uniCloud-tcb（详见uniCloud）
│─components            符合vue组件规范的uni-app组件目录
│  └─comp-a.vue         可复用的a组件
├─utssdk                存放uts文件（已废弃）
├─pages                 业务页面文件存放的目录
│  ├─index
│  │  └─index.vue       index页面
│  └─list
│     └─list.vue        list页面
├─static                存放应用引用的本地静态资源（如图片、视频等）的目录，注意：静态资源都应存放于此目录
├─uni_modules           存放uni_module 详见
├─platforms             存放各平台专用页面的目录，详见
├─nativeplugins         App原生语言插件 详见
├─nativeResources       App端原生资源目录
│  ├─android            Android原生资源目录 详见
|  └─ios                iOS原生资源目录 详见
├─hybrid                App端存放本地html文件的目录，详见
├─wxcomponents          存放微信小程序、QQ小程序组件的目录，详见
├─mycomponents          存放支付宝小程序组件的目录，详见
├─swancomponents        存放百度小程序组件的目录，详见
├─ttcomponents          存放抖音小程序、飞书小程序组件的目录，详见
├─kscomponents          存放快手小程序组件的目录，详见
├─jdcomponents          存放京东小程序组件的目录，详见
├─unpackage             非工程代码，一般存放运行或发行的编译结果
├─main.js               Vue初始化入口文件
├─App.vue               应用配置，用来配置App全局样式以及监听 应用生命周期
├─pages.json            配置页面路由、导航条、选项卡等页面类信息，详见
├─manifest.json         配置应用名称、appid、logo、版本等打包信息，详见
├─AndroidManifest.xml   Android原生应用清单文件 详见
├─Info.plist            iOS原生应用配置文件 详见
└─uni.scss              内置的常用样式变量
```

Example 3 (unknown):
```unknown
sitemap.json
```

Example 4 (jsx):
```jsx
<image :src="url"></image>
```

---

## HBuilderX 内置浏览器运行 web | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/debug-web-via-hx.html

**Contents:**
- # HBuilderX 内置浏览器运行 web
- # 同步断点
      - 本页导读

打开 uni-app 项目的页面，点 HBuilderX 右上角的预览按钮，可以在内置浏览器里打开 Web 运行结果，也可以点右键打开控制台调试。

修改保存工程源码时，右边的浏览器内容可以自动刷新。

在 HBuilderX 控制台里，可以直接看到内置浏览器打印的日志。

注意浏览器控制台打印的日志无法转到代码，只有HBuilder控制台打印的才能转到代码。而运行到外部浏览器是没有这个功能的。只有HBuilder内置浏览器才可以。

HBuilder中有2种断点调试方案，一种是使用浏览器自带的调试控制台；一种是使用HBuilderX的调试控制台。

在HBuilderX内置浏览器中，可以使用HBuilderX内置浏览器的控制台。此时无需点击运行控制台的红色虫子按钮。

对源码点右键，可以同步断点到内置浏览器的调试工具，调试方法同chrome通行的用法。

关于另一种使用HBuilderX的调试控制台的方案，另见

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment-stripe.html

**Contents:**
  - # 开通
  - # 配置
  - # 服务器生成订单
  - # 应用内发起支付
    - # 订单对象参数说明
    - # 示例代码
      - 本页导读

在manifest.json文件“App模块配置”项的“Payment(支付)”下，勾选“paypal支付”项并配置相关参数

在 App 端调用支付前，需在业务服务器生成PaymentIntent ，详情可参考Stripe官方文档：Add an endpoint

激活账户前可通过POST请求Stripe官方沙盒服务器https://stripe.com/docs/payments/accept-a-payment ，生成测试PaymentIntent，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

注意：customer与ephemeralKey必须成对出现，只传其一无效

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.request({
    url: 'https://stripe-mobile-payment-sheet.glitch.me/checkout',//仅为示例
    method: "POST", 
    success:(res) => {
        console.log("订单信息" + res.data);
        var publishKey = res.data.publishableKey;
        var paymentIntent = res.data.paymentIntent; 
        var customer = res.data.customer;
        var ephemeralKey = res.data.ephemeralKey;
        var billingDetails = res.data.billingDetails,
    }
});
```

Example 2 (javascript):
```javascript
uni.request({
    url: 'https://stripe-mobile-payment-sheet.glitch.me/checkout',//仅为示例
    method: "POST", 
    success:(res) => {
        console.log("订单信息" + res.data);
        var publishKey = res.data.publishableKey;
        var paymentIntent = res.data.paymentIntent; 
        var customer = res.data.customer;
        var ephemeralKey = res.data.ephemeralKey;
        var billingDetails = res.data.billingDetails,
    }
});
```

Example 3 (javascript):
```javascript
uni.request({
    url: 'https://stripe-mobile-payment-sheet.glitch.me/checkout',//仅为示例
    method: "POST", 
    success:(res) => {
        console.log("订单信息" + res.data);
        var publishKey = res.data.publishableKey;
        var paymentIntent = res.data.paymentIntent; 
        var customer = res.data.customer;
        var ephemeralKey = res.data.ephemeralKey;
        var billingDetails = res.data.billingDetails,
    }
});
```

Example 4 (javascript):
```javascript
uni.request({
    url: 'https://stripe-mobile-payment-sheet.glitch.me/checkout',//仅为示例
    method: "POST", 
    success:(res) => {
        console.log("订单信息" + res.data);
        var publishKey = res.data.publishableKey;
        var paymentIntent = res.data.paymentIntent; 
        var customer = res.data.customer;
        var ephemeralKey = res.data.ephemeralKey;
        var billingDetails = res.data.billingDetails,
    }
});
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-facebook.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用Facebook登录
    - # 示例代码
      - 本页导读

更多信息详见 申请开通Facebook登录操作指南

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“Facebook登录”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 2 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 3 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 4 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-sec-confusion.html

**Contents:**
  - # 配置要混淆的js/nvue文件
    - # uni-app项目
    - # 5+ App/Wap2App项目
  - # 提交云端打包
      - 本页导读

App的安装包都可以解压。前端资源，一般都是明文存放在安装包中，为防止解压后泄露敏感信息，需要进行安全处理。

由此DCloud提供了App端的js/nvue文件的原生混淆。5+ App/Wap2App支持对指定的js进行原生混淆。uni-app支持对指定的nvue文件原生混淆。

原生混淆后的安装包，解压后看到的都是乱码。

打开manifest.json文件，切换到“源码视图”，按不同项目类型进行配置。

uni-app的js运行在独立的jscore中，而不是webview中，所以不受iOS平台WKWebview不支持原生混淆的限制。 uni-app的vue页面中的js，是整体编译到一个大js文件中的，它经过编译，已经不再是vue源码了，但还不是乱码。对这个统一的大文件进行混淆会有影响性能。 所以uni-app只支持独立混淆nvue/js文件。

如果要发布多端的话，要保护的js最好写在app-plus的条件编译中，否则发布到其他端，还是无法原生混淆。

HBuilderX2.3.4版本开始，uni-app项目支持对nvue文件进行原生混淆

在"app-plus" -> "confusion" -> "resources"节点下添加要混淆的nvue文件列表：

示例源码如下，请查看 pre > code 标签中的内容

resource下的键名为nvue文件路径（相对于应用根目录），值为空JSON对象（大括号）。

HBuilderX2.6.3+版本开始，uni-app项目使用v3编译器 支持对vue页面中引用的js文件进行原生混淆

在manifest.json文件中添加要混淆的js文件列表：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：uni-app中vue页面的webview组件支持加载使用加密混淆hybrid、static目录中的js文件，nvue页面的webview组件不支持。

应用运行期间在页面打开时需要消耗更多时间进行混淆文件还原，为减少对运行速度的影响，5+App/wap2app仅支持对js文件进行原生混淆。 在"plus" -> "confusion" -> "resources"节点下添加要混淆的js文件列表：

示例源码如下，请查看 pre > code 标签中的内容

resource下的键名为js文件路径（相对于应用根目录），值为空JSON对象（大括号）。

HBuilderX2.6.11+版本开始，在iOS11+设备上使用WKWebview也可以支持JS原生混淆 WKWebview使用了更加严格的安全机制，使用原生混淆的js文件在html页面中必须使用自定义协议头plus-confusion://来引用：

示例源码如下，请查看 pre > code 标签中的内容

在manifest.json的"plus" -> "confusion" -> "resources"节点下添加要混淆的js文件列表。 在"confusion"节点下添加 "supportWKWebview": true 支持WKWebview。 由于自定义协议仅在iOS11及以上设备才支持，建议配置应用支持的最低版本deploymentTarget 为11.0：

示例源码如下，请查看 pre > code 标签中的内容

注意：iOS平台WKWebview需iOS11+系统才支持原生混淆。5+App/wap2app项目，如果要兼容iOS11以下设备只能强制使用UIWebview内核，但苹果将要废弃UIWebview（详情 ）。如对原生混淆很重视，从长远考虑，建议改造升级uni-app

配置好原生混淆的文件列表后，需要提交云端打包，注意在App云端打包对话框中需要勾选“对配置的js文件进行原生混淆”

再次强调：为了保证加密数据的安全性，加密算法和key不对外公开，因此离线打包无法支持原生混淆。 熟悉原生的开发者可将敏感信息存放于原生代码中，再与js进行交互。

对安全性要求较高的开发者，除了对前端js进行加密外，还应该对整个apk再进行一次加固。推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

**Examples:**

Example 1 (javascript):
```javascript
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

Example 2 (javascript):
```javascript
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

Example 3 (javascript):
```javascript
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

Example 4 (json):
```json
"app-plus": { 
        "confusion": {  
            "description": "NVUE原生混淆",  
            "resources": {  
                "pages/barcode/barcode.nvue": {   
                },   
                "pages/map/map.nvue": {   
                }   
            }   
        },  
        // ...  
    }
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-statistic

**Contents:**
      - 本页导读

App端统计模块封装了市场上主流的三方移动App统计SDK，提供JS API统一调用统计功能。

注意：打包时勾选三方统计模块后会自动统计应用日活、启动次数等数据，统计API是为了扩展自定义统计数据时使用。

uni-app自带uni统计，无需使用三方统计。三方统计增加包体积且无法做到自带的免埋点采集行为数据。详见：https://tongji.dcloud.io/

使用统计功能需在项目manifest.json的“App模块配置”中勾选“Statistic(统计)”，并根据项目实际情况勾选使用的三方统计平台：

提示：统计模块参数配置需提交云端打包后才能生效，真机运行调试时请使用自定义基座

---

## uni安全加固简介 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-security.html

**Contents:**
- # uni安全加固简介
- # 功能介绍
- # 应用场景
  - # 上线前安全加固
  - # 防止应用被二次打包
  - # 敏感数据保护
- # 计费规则
- # 使用指南
- # 常见问题
      - 本页导读

uni安全加固相关功能建议或问题，可以加入uni-im交流群进行讨论，点此加入

uni安全加固是DCloud联合业内主流安全厂商提供的移动App安全加固技术。

uni安全加固对移动App进行安全性增强，旨在防止应用程序被破解、篡改或重打包等各类安全破坏。它的作用是保护应用程序的安全性和用户的隐私，提高应用程序的抗攻击能力和可靠性。

uni安全加固目前仅支持Android App，后续会扩展到iOS App及小程序平台。

uni安全加固在Android平台支持如下加固方案：

App 开发完毕直接上线，可能存在代码泄露风险，通过 dex 整体加壳加固，有效保护应用代码安全，提高企业 App 被逆向、破解的难度。

未经安全防护的 App 易被攻击者获取代码信息，制造仿冒应用，采用签名校验、防重打包等加固技术，有效防止应用被二次打包后投放应用市场。

敏感数据信息、核心算法逻辑、版本内容等需要进行保护，移动应用安全推出的安全加固支持本地资源加密，有效防止攻击者窃取用户敏感数据。

蚂蚁加固目前无法解决动态注入攻击、动态调试攻击风险。查看详情

上传之前apk已经签过名了，为什么加固后又要重新签一次？

加固之后会破坏apk原有的签名，所以需要重新签名，否则无法安装。

如果不保持一致，则会触发加固的防二次打包功能，无法正常运行。

可以下载逆向工具：jadx，拖拽APK包到工具的主界面中，可以看到源代码被加密或混淆了，然后向检测机构申诉，告知加固使用了蚂蚁厂商。

使用测试版加固后，Java代码反编译风险检测不通过

测试版会注入用于管控的临时类，用于实现加固有效期 15 天的限制，期限到期后 App 将无法运行。正式版不存在此问题。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/dev.html

**Contents:**
      - 本页导读

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-useragent.html

**Contents:**
  - # 默认User Agent
  - # 自定义User Agent
    - # 在默认User Agent中添加额外字段
    - # 替换默认User Agent
      - 本页导读

用户代理（User Agent，简称 UA），是http/https网络请求头中的一个特殊字符串，使服务器能够识别客户端使用的操作系统及版本、浏览器渲染引擎、内核版本等信息。uni-app中的vue页面使用系统Webview渲染，为了保持一致，App端所有http/https网络请求头使用统一的User Agent。 API包括uni.request 、uni.uploadFile 、uni.downloadFile 等 组件包括image 、web-view 等。

默认情况使用系统Webview的User Agent，并添加Html5Plus/1.0、uni-app两字段

示例源码如下，请查看 pre > code 标签中的内容

使用Android X5 Webview(腾讯TBS) ，则在X5的User Agent后添加Html5Plus/1.0、uni-app字段：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如需自定义User Agent，在项目的 manifest.json 中 "app-plus" -> "useragent" 进行配置，支持以下属性：

在鸿蒙中，设置为 app-harmony.useragent参数相同，具体可参考 鸿蒙 userAgent 配置。

如需在默认User Agent中添加myua字段，可配置如下：

示例源码如下，请查看 pre > code 标签中的内容

如需完全自定义User Agent为"CustomUA"，可配置如下：

示例源码如下，请查看 pre > code 标签中的内容

注意：此时默认UA信息中的操作系统及版本、浏览器渲染引擎、内核版本等信息将丢失，实际项目中不建议使用替换默认User Agent。

**Examples:**

Example 1 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 10; AKA-AL10 Build/HONORAKA-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.93 Mobile Safari/537.36 uni-app Html5Plus/1.0 (Immersed/34.5)
```

Example 2 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 10; AKA-AL10 Build/HONORAKA-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.93 Mobile Safari/537.36 uni-app Html5Plus/1.0 (Immersed/34.5)
```

Example 3 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 10; AKA-AL10 Build/HONORAKA-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.93 Mobile Safari/537.36 uni-app Html5Plus/1.0 (Immersed/34.5)
```

Example 4 (unknown):
```unknown
Mozilla/5.0 (Linux; Android 10; AKA-AL10 Build/HONORAKA-AL10; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.93 Mobile Safari/537.36 uni-app Html5Plus/1.0 (Immersed/34.5)
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/run-app.html

**Contents:**
- # 运行入口
- # 连接设备
  - # Android设备选择
  - # iOS设备选择
  - # iOS模拟器设备选择
- # 运行到设备
- # 使用标准基座运行
- # 使用自定义基座运行
  - # 云打包自定基座
  - # 离线打包自定基座

因手机差异较大，HBuilder并没有提供App的模拟器。不管uni-app (x)或5+App/wap2app项目，都需要连接真实的手机或手机模拟器来运行测试，称之为“真机运行”。

真机运行的目的，是为了实现代码修改的热刷新，避免打包才能看到效果。在HBuilder中编辑代码，在手机上实时看到修改效果，并且可以在HBuilder控制台看到日志。

通过HBuilder顶部运行菜单、或工具栏运行按钮、或快捷键，均可激活运行入口。

可以按数字快速选择菜单项。比如按“4”选择“运行到Android App基座”。也可以按上下键然后回车选择。

相比于HBuilder顶部运行菜单，工具栏运行按钮下的运行菜单内容较少，只保留了最常见的运行。

实际上激活了工具栏运行按钮。可继续搭配数字键，实现无鼠标快捷运行操作。

点击运行到iOS或Android设备时，会弹出选择界面，需选择要连接的手机设备或模拟器。

可以多设备运行，每个运行设备会在HBuilder底部控制台新开一个独立窗口，互不干扰。 但一个设备同时只能运行一个项目，不同的项目运行到相同手机只有最后一个项目生效。

HBuilderX 4.71+版本，Android设备支持无线连接设备 。

连接设备过程中如果找不到手机，可以尝试点击“刷新”按钮，如果还是无法找到手机请参考真机运行常见问题

HBuilderX中自带的标准真机运行基座使用DCloud向苹果申请的企业开发者证书签名，根据苹果开发者企业计划许可协议 要求，使用企业开发者证书签名的App只允许企业员工内部使用，不允许企业外部人员安装使用。

因收到苹果公司警告，自2022年9月14日起iOS真机设备不再支持使用标准真机运行基座，详情见论坛公告：https://ask.dcloud.net.cn/article/40041

在iOS真机设备上运行请向苹果申请证书制作自定义基座或者在Mac电脑使用iOS模拟器

如果是Mac电脑安装XCode后，“标准运行基座”支持使用iOS模拟器，此功能仅Mac电脑支持

上面的界面会额外显示搜索框，因XCode的iOS模拟器非常多，可通过搜索框过滤快速选择需要使用的模拟器。

该插件内置“标准运行基座”，这个基座使用的是DCloud的包名、证书和三方SDK配置。如果要自定义，则需要使用自定义运行基座

在运行菜单中选择要运行的手机设备或模拟器，点击运行按钮，会执行如下流程：

运行成功后，HBuilder底部的控制台显示成功日志。此后修改代码会差量同步到手机上，手机程序会动态热刷。同时console.log代码会打印到控制台上，点击打印日志可以跳转到相关代码。

注意：uni-app x 的 web-view 组件网页日志和错误从 HBuilderX 4.51+ 开始支持同步显示到控制台。

HBuilderX 3.7.0+版本，新增 运行App项目到iOS真机，运行成功后，手机上的App会自动打开（目前仅支持MacOSX，不支持Windows）。

注意： MacOSX需要安装跟iOS手机系统相匹配的Xcode版本。 比如iPhone手机系统是iOS 16.2，那么也需要安装支持iOS 16.2的Xcode版本。如果/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport目录下不存在跟手机系统相匹配的iOS Platforms, 那么是无法自启动App的。请在手机端点击运行基座图标手动启动。

使用如下命令，可以查看Xcode iOS Platforms数据。

示例源码如下，请查看 pre > code 标签中的内容

MacOSX，如果无法自动启动App，请排查以下原因：

标准运行基座，是DCloud为方便开发者低门槛调试而提供的，此基座App使用的是DCloud的包名、证书和三方SDK配置。

在原生层不变的情况下，js等动态代码可以在运行基座上动态加载，实现热重载运行。（uni-app x的Android端，uts代码编译为kt后通过dex动态加载来实现热刷新）

HBuilderX3.7.1版本调整标准基座支持的系统版本

标准基座仅能更新热刷代码和资源文件，其他诸如修改包名、应用名称、证书、权限、原生模块变更、xml等资源变更、引入三方sdk等，需要完整的执行Android/iOS的打包流程，由Android studio或XCode编译打包生成apk或ipa安装包，才能生效。

但真的打包为正式包，又无法调试，不能热重载和显示控制台日志。所以HBuilder在运行打包时提供了一个特殊选项，“自定义运行基座”。

自定义运行基座可以所有配置生效（主要是manifest.json的配置），包括：

可以云打包自定义基座，也可以本地打包自定义基座。

打包App的入口在HBuilder顶部发行菜单，或快捷键【Ctrl+u】

打包自定义运行基座后，HBuilder会自动将生成后的apk或ipa或app包存放在 项目目录/unpackage/debug目录下，文件名分别为android_debug.apk或iOS_debug.ipa或Pandora_simulator_debug.app。

一个项目只能生成一个自定义基座，多次生成只保留最后一次结果。

生成自定义基座后，在设备选择窗口，选择自定义基座-本地基座，如下图所示：

注意：自定义运行基座必须在HBuilderX中真机运行使用，不可直接安装使用，启动时会弹出toast提示信息。正式发版时需要按正常打包方式重新打包。

HBuilderX 3.7.13起，MacOSX系统，App项目，支持运行自定义基座到iOS模拟器。参考文档

使用离线SDK打包生成自定义运行基座(不支持cli方式,将src拖拽到编辑器中，并重新识别项目类型)，生成后将apk或ipa或app包存放在项目目录/unpackage/debug目录下，文件名分别为android_debug.apk、iOS_debug.ipa、Pandora_simulator_debug.app。

可以在设备选择窗口，选择自定义基座-本地基座，如下图所示：

HBuilderX 4.71+（仅Android）

Android通过离线SDK打包生成的自定义基座后，如果基座已通过Android Studio的运行安装到手机中。 可以在设备选择窗口，选择自定义基座-已安装基座，并选择对应调试的包名。如下图所示：

配置关联项目后，可以在HBuilderX中调试原生代码。关联项目为打包离线SDK的原生工程项目，详细使用请参考原生联调（仅uni-app x）

iOS通过离线SDK打包生成的自定义基座后，选择自定义基座-原生工程基座。如下图所示：

配置基座位置后，可以在HBuilderX中调试原生代码。基座位置为打包离线SDK的原生工程项目的产物，详细使用请参考原生联调（仅uni-app x）

默认标准基座闪退 可以查看手机存储根目录 /Android/data/io.dcloud.HBuilder/logs/io.dcloud.HBuilder/crash/ 崩溃日志文件

自定义基座闪退 可以查看手机存储根目录 /Android/data/packageName/logs/packageName/crash/ 崩溃日志文件

apk包名是“uni.UNIB89CXX”，目录则为：/Android/data/uni.UNIB89CXX/logs/uni.UNIB89CXX/crash/

uni-app x的闪退日志有多种查看方式。

不管是uni-app还是uni-app x，线上应用还可以通过uni统计 查看崩溃日志。

**Examples:**

Example 1 (unknown):
```unknown
/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport
```

Example 2 (unknown):
```unknown
iOS Platforms
```

Example 3 (shell):
```shell
ls -lh  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport
```

Example 4 (shell):
```shell
ls -lh  /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport
```

---

## 微信小程序隐私协议开发指南 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-weixin-user-privacy.html

**Contents:**
- # 微信小程序隐私协议开发指南
      - 本页导读

涉及处理用户个人信息的小程序开发者，需通过弹窗等明显方式提示用户阅读隐私政策等收集使用规则。

为规范开发者的用户个人信息处理行为，保障用户合法权益，微信要求开发者主动同步微信当前用户已阅读并同意小程序的隐私政策等收集使用规则，方可调用微信提供的隐私接口。

以下指南中涉及的 getPrivacySetting 、onNeedPrivacyAuthorization 、requirePrivacyAuthorize 等接口目前可以正常接入调试。调试说明：

在 2023年9月15号之前，在 app.json 中配置 __usePrivacyCheck__: true 后，会启用隐私相关功能，如果不配置或者配置为 false 则不会启用。

在 2023年9月15号之后，不论 app.json 中是否有配置 __usePrivacyCheck__，隐私相关功能都会启用。

从基础库 2.32.3 开始支持，低于 2.32.3 版本的基础库未集成隐私相关功能，也不会拦截隐私接口调用。

隐私相关功能启用时间延期至 2023年10月17日。

在 2023年10月17日之前，在 app.json 中配置 usePrivacyCheck: true 后，会启用隐私相关功能，如果不配置或者配置为 false 则不会启用。

在 2023年10月17日之后，不论 app.json 中是否有配置 usePrivacyCheck，隐私相关功能都会启用。

新增官方隐私授权弹窗功能，相关功能参考小程序隐私协议开发指南 。

在uni-app编译后的 app.json 文件中配置：__usePrivacyCheck__: true，启用隐私相关功能。

**Examples:**

Example 1 (yaml):
```yaml
__usePrivacyCheck__: true
```

Example 2 (unknown):
```unknown
__usePrivacyCheck__
```

Example 3 (yaml):
```yaml
__usePrivacyCheck__: true
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-blureffect.html

**Contents:**
  - # tabBar 使用高斯模糊效果
    - # 实现原理
    - # 启用高斯模糊效果
      - # vue 页面适配
      - # nvue 页面适配
  - # navigation-bar 使用高斯模糊效果
    - # 使用方法
  - # nvue view组件使用高斯模糊效果
    - # 使用方法
      - 本页导读

HBuilderX 从 2.4.4 版本开始，uni-app iOS 端 TabBar 支持高斯模糊效果（毛玻璃效果） HBuilderX 从 3.4.10 版本开始，uni-app Android 端 TabBar 支持高斯模糊效果（毛玻璃效果）

下面介绍一下如何使用高斯模糊效果，和一些注意事项。

示例 demo 地址 https://github.com/dcloudio/BlurEffectDemo （点进去了，记得 star 一波）

实现原理很简单，启用高斯模糊效果后，页面会变高（增加 tabBar 的高度），页面布局会延伸到 tabBar 下面，框架会在 tabBar 上自动添加一个高斯模糊效果的视图，然后透过这个视图看下面的内容就会看到模糊的效果。

启用高斯模糊效果后，不建议设置 tabBar 的 backgroundColor，如果非要设置的话需要使用 rgba 设置透明度，否则看不到模糊效果；

由于页面高度发生了变化，因此在页面布局上需要有一些注意事项（很简单），下面会说明 vue 及 nvue 页面如何适配；并会提供一个 demo，供大家参考；

启用高斯模糊效果后不要动态设置 tabBar 的隐藏，不然会影响页面布局；

为了方便开发者适配多平台，框架已经提供了获取 tabBar 高度的方法，并会根据不同平台返回不同的值 windowBottom；使用方法如下

示例源码如下，请查看 pre > code 标签中的内容

首先需要在 manifest.json 的 app-plus节点下添加 safearea 的配置，bottom 的 offset 设置为 none，这样平台会自动处理 iPhoneX 等全面屏机型的高度适配，不然在全面屏机型上可能会出现页面被遮挡的问题

示例源码如下，请查看 pre > code 标签中的内容

然后在 pages.json 中添加 tabBar 的配置信息，并配置 blurEffect 值

示例源码如下，请查看 pre > code 标签中的内容

blurEffect 对应的就是高斯模糊的配置，可取值：

示例（源码请参考示例工程的 index.vue）

示例源码如下，请查看 pre > code 标签中的内容

因为 nvue 页面为纯原生布局，当启用毛玻璃效果后，原生端框架可以自动调整滚动视图的 contentInset bottom 值，相当于在页面最底部，偏移出 tabbar 的高度，这样页面原有的元素就不会被遮挡，滚动条的位置也会自动处理。注：偏移出的位置显示的是滚动视图的背影颜色；

注意 android暂时不支持 adjustBottom

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 从 2.4.4 版本开始，uni-app iOS 端 navigationBar 支持高斯模糊效果（毛玻璃效果） HBuilderX 从 3.4.10 版本开始，uni-app Android 端 navigationBar 支持高斯模糊效果（毛玻璃效果）

页面 style --> app-plus --> titleNView中添加 blurEffect 属性启用高斯模糊效果

示例源码如下，请查看 pre > code 标签中的内容

注意：backgroundColor需要设置带有透明度颜色才能看到高斯模糊效果。不设置backgroundColor也无法看到高斯模糊效果！

HBuilderX 从 2.4.8+ 版本开始，iOS 端 nvue view组件支持高斯模糊效果（毛玻璃效果） Android平台暂不支持

在 view 组件中添加 blurEffect 属性启用高斯模糊效果，取值同 TabBar

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
windowBottom
```

Example 2 (css):
```css
// vue中直接在 css 中使用
.fixed1{
	position: fixed;
	left: 0;
	bottom: var(--window-bottom);
}

// nvue 不支持css的写法，请使用 js 方法 获取
uni.getSystemInfoSync().windowBottom
```

Example 3 (css):
```css
// vue中直接在 css 中使用
.fixed1{
	position: fixed;
	left: 0;
	bottom: var(--window-bottom);
}

// nvue 不支持css的写法，请使用 js 方法 获取
uni.getSystemInfoSync().windowBottom
```

Example 4 (css):
```css
// vue中直接在 css 中使用
.fixed1{
	position: fixed;
	left: 0;
	bottom: var(--window-bottom);
}

// nvue 不支持css的写法，请使用 js 方法 获取
uni.getSystemInfoSync().windowBottom
```

---

## 应用配置 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-api

**Contents:**
- # 应用配置
- # 应用 API
- # 全局 API
- # 选项/Data
- # 选项/DOM
- # 选项/生命周期钩子
- # 选项/资源
- # 选项/组合
- # 选项/杂项
- # 实例 property

config 是一个包含了 Vue 应用全局配置的对象。你可以在应用挂载前修改其以下 property：

示例源码如下，请查看 pre > code 标签中的内容

在 Vue 3 中，改变全局 Vue 行为的 API 现在被移动到了由新的 createApp 方法所创建的应用实例上。此外，现在它们的影响仅限于该特定应用实例：

示例源码如下，请查看 pre > code 标签中的内容

调用 createApp 返回一个应用实例。该实例提供了一个应用上下文。应用实例挂载的整个组件树共享相同的上下文，该上下文提供了之前在 Vue 2.x 中“全局”的配置。

另外，由于 createApp 方法返回应用实例本身，因此可以在其后链式调用其它方法，这些方法可以在以下部分中找到。

实现全局变量的方式需要遵循 Vue 单文件模式的开发规范。详细参考：uni-app全局变量的几种实现方式 。

Vue 组件编译到小程序平台的时候会编译为对应平台的组件，部分小程序平台支持 options 选项（具体选项参考对应小程序平台文档的自定义组件部分），一般情况默认即可，如有特殊需求可在 Vue 组件中增加 options 属性。

示例源码如下，请查看 pre > code 标签中的内容

在 onLoad 里得到，onLoad 的参数是其他页面打开当前页面所传递的数据。

uni-app 内置了 Vuex ，在app里的使用，可参考 hello-uniapp store/index.js。

示例源码如下，请查看 pre > code 标签中的内容

由于 onError 并不是完整意义的生命周期，所以只提供一个捕获错误的方法，在 app 的根组件上添加名为 onError 的回调函数即可。如下：

示例源码如下，请查看 pre > code 标签中的内容

当重复设置某些属性为相同的值时，不会同步到view层。 例如：每次将scroll-view组件的scroll-top属性值设置为0，只有第一次能顺利返回顶部。 这和props的单向数据流特性有关，组件内部scroll-top的实际值改动后，其绑定的属性并不会一同变化。

解决办法有两种（以scroll-view组件为例）：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

第二种解决方式在某些组件可能造成抖动，推荐第一种解决方式。

**Examples:**

Example 1 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

Example 2 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

Example 3 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

Example 4 (javascript):
```javascript
const app = Vue.createApp({})

app.config = {...}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-modules.html

**Contents:**
  - # 源码视图
  - # 功能模块
  - # 注意事项
      - 本页导读

App端根据功能划分为不同的模块，项目使用到特定功能时选择包含对应的模块，避免App打包时包含无用的代码或三方SDK，可减少App安装包体积。

可在项目的manifest.json文件的“App模块配置”中根据需求勾选。

如果使用了相关API，但没有勾选对应功能模块，在运行时会弹出以下模块缺失提示框：

碰到此情况请勾选对应缺失的模块，并重新提交云端打包

HBuilderX新版本中增加的模块在老版本可能不存在可视化配置界面，则可以在源码视图中进行手动配置 在项目的manifest.json文件的“源码视图”中的 "app-plus" -> "modules" 手动添加：

示例源码如下，请查看 pre > code 标签中的内容

modules下添加项的键名为“模块标识”，可在下面**功能模块**中查询到

为了避免App隐私合规检测报包含麦克风、相机/相册、运动等敏感权限，从HBuilderX3.6.11版本开始，将App打包默认包含的Barcode(扫码)、Camera&Gallery(相机和相册)、Orientation(传感器)、Record(录音)等调整为独立功能模块。 更新到HBuilderX3.6.11版本后云端打包时默认将不会包含以上功能，需在manifest.json的“App模块配置”中手动勾选要使用的模块。 Orientation(传感器)将不再维护，在manifest.json中不提供可视化界面配置，如需继续使用，请在manifest.json的“源码视图”中手动在 "app-plus" -> "modules" 添加 "Orientation"，如下：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

Example 2 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

Example 3 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

Example 4 (json):
```json
{
"app-plus" : {
	"modules" : {
		"Barcode" : {},
		"Camera" : {}
	},
	//...
},
//...
}
```

---

## 使用各家小程序开发工具调试@mp-debug | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/debug/debug-mp.html

**Contents:**
- # 使用各家小程序开发工具调试
      - 本页导读

uni-app 运行到微信、阿里等平台的小程序开发者工具时，可在这些工具的控制台查看 console 信息，网络请求等信息等。

页面样式调试和一般的web项目一样，通过调试的箭头选中元素即可查看相应的节点和样式，如下图：

调试 js 时需要切换到 Sources 栏，根据 sourcemap，找到 webpack 里正确的目录，选中想要调试的那个页面的js，进行调试（如果js代码是压缩过的，点击右下角的{}可格式化代码），如下图：

---

## 安装模拟器@Simulator | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/run/installSimulator.html

**Contents:**
- # 安装模拟器
- # iOS模拟器
  - # 运行App到iOS模拟器
  - # 运行App到iOS模拟器功能限制
  - # 运行App到iOS26模拟器，应用安装失败
- # Android模拟器
  - # 运行App到Android模拟器
  - # 常见模拟器端口说明
- # 鸿蒙模拟器
  - # 运行App到鸿蒙模拟器

Android模拟器在MacOSX、Windows上都可以安装；iOS模拟器只能在MacOSX上安装。

MacOSX，安装ios模拟器，需要先安装xcode ；或在App store中搜索xcode完成安装。

xcode安装打开，按下快捷键command+,，打开Preferences窗口，如下图：

如上窗口，点击【Locations】，点击【Command Line Tools】

项目管理器，选中要运行的项目，点击工具栏 运行图标，如下图：

iOS模拟器和真机使用不同的CPU架构，部分模块依赖的三方SDK没有包含模拟器或者对模拟器兼容不好，导致无法在模拟器上正常运行，目前已知无法在模拟上使用以下功能：

注意：2024年3月21日审计云端打包环境为XCode15.2，不再支持讯飞语音识别，推荐使用百度语音识别模块。

在部分 M系列芯片 的MAC上，如果macos系统升级到了macos26及以上，xcode升到到了xcode26及以上时，运行App到iOS26模拟器时可能会出现应用安装失败的问题

解决方案： 1、删除现有安装的 iOS26 模拟器

删除后可以在终端执行命令 xcrun simctl list runtimes 查看是否还有 iOS26 模拟器，如果结果列有 Shutdown 等不可用的模拟器，则可以在终端执行命令 xcrun simctl delete unavailable 删除它们。

示例源码如下，请查看 pre > code 标签中的内容

2、安装新的 universal 格式的 iOS26 模拟器

新的模拟器下载成功后，重启 xcode 应用 和模拟器应用，重启 HX，将应用重新运行到模拟器，注意点击重新运行前请先点击更新模拟器列表。新的模拟器被拉起后，可以看到，应用能够被正常安装了。

市场上有很多成熟的Android模拟器，这里就不推荐了，自行搜索安装。

当然，Google官方也有自己的模拟器，您可以在Android Studio 中安装不同版本的模拟器。

android studio模拟器如下图所示：

Android模拟器启动后，HBuilderX会将其识别为名称为emulator-xxxx的Android手机，其中的xxxx为模拟器的id如下图：

运行app项目到android模拟器效果如下：

HBuilderX是通过adb发现设备的，如果端口为5555到5585的模拟器启动后会自动出现在设备列表。其他端口模拟器需要在“设置-运行配置-Android运行配置-Android模拟器端口”配置你使用模拟器的端口，HBuilderX会自动连接。或通过命令行adb connect 127.0.0.1:port手动连接设备。 以下是对市面一些模拟器默认端口的汇总（经供参考，以实际端口为准）

安装鸿蒙模拟器，需要先安装DevEco-Studio ；

Windows系统如使用模拟器则需要开启以下功能

打开控制面板 - 程序与功能 - 开启以下功能

注意: 需要win10专业版或win11专业版才能开启以上功能，家庭版需先升级成专业版或企业版

如果没有登录华为账号，此时需要先登录，登录成功后看到如下页面

启动模拟器成功后，如果提示需要先签名（配置签名需要先启动模拟器后才能配置）

点击 DevEco-Studio 上方菜单 File - Project Structure...

在弹出的窗体中选择 Project - Signing Configs 并打钩 Automatically generate signature，即可自动生成签名

最后依次点击 Apply 和 OK 使签名生效

**Examples:**

Example 1 (unknown):
```unknown
Preferences
```

Example 2 (unknown):
```unknown
仅支持 x86_64 架构
```

Example 3 (unknown):
```unknown
xcrun simctl list runtimes
```

Example 4 (unknown):
```unknown
xcrun simctl delete unavailable
```

---

## 系统信息的概念 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/info.html

**Contents:**
- # 系统信息的概念
- # uni.getSystemInfo(OBJECT)
  - # getSystemInfo 兼容性
  - # success 返回参数说明
  - # 某些小程序特殊的返回参数
  - # 不推荐使用的返回参数，仅为向下兼容保留
  - # uniPlatform 返回值说明
  - # romName 返回值说明
  - # hostName 返回值说明
  - # safeArea 返回值说明

本 API 在微信小程序上使用会产生警告，请使用 uni.getSystemSetting、uni.getAppAuthorizeSetting、uni.getDeviceInfo、uni.getWindowInfo、uni.getAppBaseInfo 代替

uni-app提供了异步(uni.getSystemInfo)和同步(uni.getSystemInfoSync)的2个API获取系统信息。

系统信息返回的内容非常多，各操作系统、各家小程序、各浏览器对它们的定义也不相同。uni-app里重新梳理了这些概念，同时为了向下兼容也保留了这些平台原来的概念，但不推荐使用。

按照运行环境层级排序，从底层向上，uni-app有6个概念：

uniCompileVersion编译器版本 和 uniRuntimeVersion运行时版本，正常情况应该是一样的值，即uni-app的版本。

如果使用HBuilder自带的uni-app开发，该值即等同于HBuilder的版本；如果使用单独的uni-app cli开发，则等同于cli版本。

但在App平台，uniCompileVersion 和 uniRuntimeVersion 在某些情况的值会不一样：

language的国际规范是BCP47规范，分为三段，主语言-次语言-地区。例如zh-Hans-CN，表示 中文-简体-中国大陆

但除了主语言外，后两者均可省略。在不同平台，它们的省略规则也不相同。

所以获取语言后，不能直接字符串比较，需要拆段比较，npm上也有专门做BCP47语言规范比较的库。

Web、小程序、iOS，属于对用户隐私保护比较严格的平台，在这些平台很难获取有效的设备唯一标记。

Android也已经改进用户隐私保护。在极老的手机上可以无限制获取imei，在次老的手机上，获取imei等隐私信息时需要弹框让用户授权。新的Android手机（Android10以上）已经彻底无法获取imei了。

所以标记设备，大多只能依靠本地存储一个随机数来标记。

deviceId，在app-android平台，会根据优先使用imei、mac（仅在用户已授权的情况下，如果发现需要授权或未授权，则跳过此步骤），如果没有获取到就使用随机生成的标识。其他平台是直接使用随机生成的标识。

当使用本地存贮的随机数时，发生以下情况将导致deviceId失效：

app下需要广告追踪的场景，在iOS上可以使用idfa 、部分国产Android手机可以使用OAID

uni-app 3.5.1+ 版本规范了 deviceModel 返回值，例如之前返回 iPhone11ProMax 新版本返回值为 iPhone 11 Pro Max，各设备型号参考规范 中 Generation 对应的值

注意：新机型刚推出一段时间会显示 Unknown，官方会尽快进行适配。

示例源码如下，请查看 pre > code 标签中的内容

osTheme：app-ios 只有将应用主题设置为跟随系统时才能获取到系统的主题。小程序也有类似限制。

屏幕高度 = 原生NavigationBar高度（含状态栏高度）+ 可使用窗口高度 + 原生TabBar高度

windowHeight不包含NavigationBar和TabBar的高度

Web端，windowTop等于NavigationBar高度，windowBottom等于TabBar高度

App端，windowTop等于透明状态NavigationBar高度，windowBottom等于透明状态TabBar高度

高度相关信息，要放在 onReady 里获取。太早取不到。

示例源码如下，请查看 pre > code 标签中的内容

在不同平台 getSystemInfo 的返回值（表格较长，可缩放页面后拖动横向滚动条）

标明 - 的都为 undefined，其他值都与所列出项相同

获取系统信息的同步接口。调用参数和返回值同上getSystemInfo。

设备信息内容多且复杂，欢迎开发者测试更多环境设备并编辑本文档参与贡献。

**Examples:**

Example 1 (unknown):
```unknown
uni.getSystemInfo
```

Example 2 (unknown):
```unknown
uni.getSystemInfoSync
```

Example 3 (unknown):
```unknown
竖屏 portrait
```

Example 4 (unknown):
```unknown
横屏 landscape
```

---

## 历史变更 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/harmony/history.html

**Contents:**
- # 历史变更
  - # uni-app 4.81
  - # uni-app 4.51
  - # uni-app 4.31
      - 本页导读

自 uni-app 4.81 版本开始，运行逻辑层的 JSVM 转移到单独的子线程中运行，以避免阻塞主线程。

升级至 uni-app 4.51 版本后，由于 SDK 调整，影响如下：

将鸿蒙模拟器更新到 HarmonyOS 5.1.1(19) Beta1（2025-06-12） 对应 DevEco Studio 5.1.1 Beta。由 4.31 架构改动引发的 uni-app 项目无法运行到 windows 的 x86_64 模拟器的问题得到了修复，开发者可以通过升级鸿蒙模拟器的版本之后，点击运行不兼容的对话框中的 强制继续运行 按钮。

自 uni-app 4.31 版本开始，鸿蒙运行时架构进行了较大的变更。逻辑层从 ArkTS 环境加载改为使用 JSVM 加载。uts 插件仍然是 ArkTS 环境，仅开发者编写的普通代码和 Vue 框架运行在 JSVM 中。

**Examples:**

Example 1 (unknown):
```unknown
build-profile.json5
```

Example 2 (yaml):
```yaml
compatibleSdkVersionStage: "beta6"
```

Example 3 (unknown):
```unknown
HarmonyOS 5.1.1(19) Beta1（2025-06-12）
```

Example 4 (unknown):
```unknown
DevEco Studio 5.1.1 Beta
```

---

## app平台 uni-app 项目云端打包环境 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-env.html

**Contents:**
- # app平台 uni-app 项目云端打包环境
- # Android平台云端打包环境
  - # HBulder4.81及以上版本升级云端打包环境
  - # HBulder4.41及以上版本升级云端打包环境
  - # HBuilder4.25及以上版本云端打包环境（不推荐使用）
  - # HBuilder4.24及以下版本云端打包环境（不推荐使用）
- # iOS平台云端打包环境
  - # HBuilderX4.41及以上版本云端打包环境
  - # HBuilderX4.36及以下版本云端打包环境（不推荐使用）
      - 本页导读

uni-app x 项目云端打包环境参考这里

注意 云端打包环境升级后可能导致某些 uni原生语言插件 无法兼容，如碰到无法兼容的问题请联系插件作者尽快升级支持，同时将在 ask社区 反馈，我们也会跟进协助插件作者适配支持。

使用 XCode 的 xcodebuild 命令编译

---

## JSX/TSX 支持 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/syntax-jsx.html

**Contents:**
- # JSX/TSX 支持
- # 支持方式
  - # 安装插件
  - # 配置 vite.config.js
      - 本页导读

uniapp 支持 JSX 开发，可参考 Vue.js JSX/TSX 支持 说明。

示例源码如下，请查看 pre > code 标签中的内容

项目根目录新增 vite.config.js 文件，并增加如下配置：

示例源码如下，请查看 pre > code 标签中的内容

项目根目录 vite.config.js 文件中增加如下配置：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (shell):
```shell
npm install @vitejs/plugin-vue-jsx@3.1.0 --save-dev
```

Example 2 (shell):
```shell
npm install @vitejs/plugin-vue-jsx@3.1.0 --save-dev
```

Example 3 (shell):
```shell
npm install @vitejs/plugin-vue-jsx@3.1.0 --save-dev
```

Example 4 (python):
```python
npm install @vitejs/plugin-vue-jsx@3.1.0 --save-dev
```

---

## 准备条件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-statistic-google.html

**Contents:**
    - # 准备条件
    - # 申请开通Google统计
    - # 使用Google统计
      - 本页导读

创建iOS平台配置 将 GoogleService-Info.plist 下载到本地，HBuilderX中云端打包需要使用此文件

创建Android平台配置 (如已创建项目，无须创建新项目，直接进行Android平台的配置)

项目创建完成后，进入项目配置Android平台的包名、签名证书步骤如下：

将 google-services.json 下载到本地，HBuilderX中云端打包需要配置使用此文件

在项目manifest.json文件的“App模块配置”页面，在“Statistic(统计)”下勾选“Google统计”项，并添加从Google统计平台申请的配置文件：

**Examples:**

Example 1 (unknown):
```unknown
Google Analytics
```

Example 2 (unknown):
```unknown
GoogleService-Info.plist
```

Example 3 (unknown):
```unknown
google-services.json
```

---

## 等保测评服务 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/djbh.html

**Contents:**
- # 等保测评服务
  - # 什么是等级保护？
  - # 为什么要做等保测评？
    - # 法律法规要求
    - # 行业准入要求
    - # 企业系统安全的需求
  - # 等级保护分级说明
  - # 如何定级？
  - # DCloud等保测评服务
    - # 核心优势

DCloud 可以承接全国各地的等保测评服务。我们能够避免三方测评机构对 DCloud 产品不了解而产生误报的问题，从而减少测评过程中的反复交互，提升测评效率。等保测评服务 点此咨询

等级保护简称等保，全称网络安全等级保护，是指对国家重要信息、法人和其他组织及公民的专有信息以及公开信息和存储、传输、处理这些信息的信息系统分等级实行安全保护，对信息系统中使用的信息安全产品实行按等级管理，对信息系统中发生的信息安全事件分等级响应、处置。网络安全等级保护是国家网络安全保障的基本制度、基本策略、基本方法。

等级保护总共分为五个等级，系统的重要程度从1-5级逐级升高，其中包含：

网络安全等级保护工作包括定级、备案、建设整改、等级测评、监督检查五个阶段。

2017 年 6 月 1 日，《中华人民共和国网络安全法》正式实施，等保工作正式入法，等保制度已成为新时期国家网络安全的基本国策和基本制度。《中华人民共和国网络安全法》条款要求如下：第二十一条要求，国家实施网络安全等级保护制度；第二十五条要求，网络运营者应当制定网络安全事件应急预案；第三十一条要求，关键信息基础设施，在网络安全等级保护制度的基础上，实行重点保护；第五十九条明确了，网络运营者不履行本法第二十一条、第二十五条规定的网络安全保护义务的，由有关主管部门给予处罚。

在金融、电力、广电、医疗、教育行业，主管单位明确要求企业开展等保工作。

信息系统运营、使用单位通过开展等级保护工作可以发现系统内部的安全隐患与不足之处，可通过安全整改提升系统的安全防护能力，降低被攻击的风险。

依据公安部关于网络安全等级保护的有关法律法规和要求，对开发者的重要二、三、四级信息系统的网络安全等级保护状况进行评估、咨询和评测，全面、完整地了解网络安全等级保护要求的基本安全控制在信息系统中的实施配置情况以及系统的整体安全性，出具安全等级测评的结论；指出该系统存在的安全问题并提出相应的整改建议，出具《网络安全等级保护测评报告》。

对DCloud自有产品的测评流程有丰富经验，测评及时、安全、顺畅。

DCloud可以准确、安全、及时、顺利的出具评测报告，并且可以根据法律要求，解决DCloud引擎涉及的安全问题，让开发者无忧顺利过保。

我们建议开发者及时了解本信息，避免先与其他等保测评机构签约，然后又遇到问题造成自身被动。

如仍然希望先尝试其他等保机构，建议留好退款准备条款，遇到不顺利时可与其他机构退款，再改与DCloud签约。

答:《中华人民共和国网络安全法》第二十一条规定网络运营者应当按照网络安全等级保护制度的要求，履行相关的安全保护义务。同时第七十六条定义了网络运营者是指网络的所有者、管理者和网络服务提供者。

等级保护相关标准虽然为非强制性的推荐标准，但网络（个人与家庭网络除外）运营者必须按网络安全法开展等级保护工作。

答：根据《网络安全法》要求，不备案视为违法，需要承担相应法律责任与处罚。

以下为《网络安全法》中相关违法处罚内容，供参考：

第五十九条 网络运营者不履行本法第二十一条、第二十五条规定的网络安全保护义务的，由有关主管部门责令改正，给予警告；拒不改正或者导致危害网络安全等后果的，处一万元以上十万元以下罚款，对直接负责的主管人员处五千元以上五万元以下罚款。

关键信息基础设施的运营者不履行本法第三十三条、第三十四条、第三十六条、第三十八条规定的网络安全保护义务的，由有关主管部门责令改正，给予警告；拒不改正或者导致危害网络安全等后果的，处十万元以上一百万元以下罚款，对直接负责的主管人员处一万元以上十万元以下罚款。

答：等保工作费用大体包含：针对业务系统开展测评的费用，以及按等级保护要求开发、购买或部署安全防护产品成本，开展安全日常运维等人力成本。

等保测评工作属于属地化管理，测评收费非全国统一价，测评费用每个省都有一个参考报价标准。依据不同属地，不同系统规模与级别，测评收费不同。详情点此咨询

答：一个二级或三级的系统整体持续周期约3个月。现场测评周期一般2周左右，具体时间还要根据信息系统数量及信息系统的规模，以及测评方与被测评方的配合情况等有所增减。安全整改（管理制度、策略配置技术整改）视系统整改成本而不同，一般情况约2周左右，出具报告时间1-2周。

Q5：全国各地的开发者，都可以与DCloud签约做等保吗？

答：关于系统测评时间有明确规定，二级信息系统每两年测评一次，三级信息系统明确规定每年测评一次，四级信息系统每半年测评一次。

答：备案证明和测评报告，即加盖测评机构公章或测评专用章的测评报告以及有主管部门公章的系统备案证明或系统定级备案资料。等保备案证书由公安机关颁发备案证明，测评按系统等级测评，提供测评报告，目前公安机关要求测评报告依不同等级进行年检制并上报至公安机关。

Q8：我的系统涉及DCloud产品，也涉及DCloud之外的产品，都可以和DCloud签约做测评吗？

答：都可以。DCloud会与传统代理商一起完成全面评测。

答：全国各省网警管理有所差异，一般提交备案流程后，如资料完备（三级系统要求含测评报告），顺利通过审核后15个工作日即可拿到备案证明。

---

## nvue所支持的通用样式已在本文档中全部列出，一些组件可能有自定义样式，请参考组件文档。除此之外的属性，均不被支持。 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-css.html

**Contents:**
    - # nvue所支持的通用样式已在本文档中全部列出，一些组件可能有自定义样式，请参考组件文档。除此之外的属性，均不被支持。
  - # 注意事项
- # 盒模型
      - # 基本用法
      - # 内边距
      - # 边框
      - # border-width
      - # border-color
      - # border-radius
      - # 外边距

HBuilderX 3.1.0+ 开始支持更多简写样式

HBuilderX 3.1.0+ 开始支持新的样式编译模式

新增 nvueStyleCompiler 配置，支持组合选择器（相邻兄弟选择器、普通兄弟选择器、子选择器、后代选择器）。详见

nvue的uni-app编译模式下，App.vue 中的样式，会编译到每个 nvue文件。对于共享样式，如果有不合法属性控制台会给出警告，可以通过条件编译 APP-PLUS-NVUE屏蔽 App 中的警告。

nvue盒模型基于 CSS 盒模型，每个 nvue 元素都可视作一个盒子。我们一般在讨论设计或布局时，会提到「盒模型」这个概念。

盒模型描述了一个元素所占用的空间。每一个盒子有四条边界：外边距边界 margin edge, 边框边界 border edge, 内边距边界 padding edge 与内容边界 content edge。这四层边界，形成一层层的盒子包裹起来，这就是盒模型大体上的含义。

nvue盒模型的 box-sizing 默认为 border-box，即盒子的宽高包含内容、内边距和边框的宽度，不包含外边距的宽度。

在 Android 平台，nvue只支持 overflow:hidden。

在 iOS 上，nvue支持 overflow:hidden 和 overflow:visible，默认是 overflow:visible。

示例源码如下，请查看 pre > code 标签中的内容

padding {length}：内边距，内容和边框之间的距离，默认值 0。与标准 CSS 类似，padding 支持简写，也可分解为以下四个：

border-style 设定边框样式，如果四个方向的边框样式不同，可分别设置：

border-width：设定边框宽度，非负值, 默认值 0，如果四个方向的边框宽度不同，可分别设置：

border-color：设定边框颜色，默认值 #000000，如果四个方向的边框颜色不同，可分别设置：

border-radius：设置边框的圆角，默认值 0，如果四个方向的圆角弧度不同，可分别设置：

border-radius和border-width定义了圆心角为90度的椭圆弧的长轴和半长轴的大小。如果邻接两边border-radius 或 border-width不一致，nvue绘制的边框曲线可能不够平滑。

margin {length}：外边距，元素和元素之间的空白距离，默认值 0。与标准 CSS 类似，margin 支持简写，也可分解为四边：

尽管 overflow: hidden 在 Android 上是默认行为，但只有下列条件都满足时，一个父 view 才会去剪切它的子 view。

Flex 是 Flexible Box 的缩写，意为"弹性布局"，用来为盒状模型提供最大的灵活性。

nvue布局模型基于 CSS Flexbox，以便所有页面元素的排版能够一致可预测，同时页面布局能适应各种设备或者屏幕尺寸。Flexbox 包含 flex 容器和 flex 成员项。如果一个nvue元素可以容纳其他元素，那么它就成为 flex 容器。

文档中未说明的 flexbox 属性均不支持：如 order、flex-grow 、flex-shrink 、 flex-basis、align-content、align-self 等。

在 nvue中，Flexbox 是默认且唯一的布局模型，所以你不需要手动为元素添加 display: flex; 属性。

定义了 flex 容器中 flex 成员项的排列方向，默认值为 column

决定了 flex 成员项在一行还是多行分布，默认值为nowrap

定义了 flex 容器中 flex 成员项在主轴方向上如何排列以处理空白部分。默认值为 flex-start

定义了 flex 容器中 flex 成员项在纵轴方向上如何排列以处理空白部分。默认值为 stretch。

flex 属性定义了 flex 成员项可以占用容器中剩余空间的大小。 flex {number}：值为 number 类型。

Flex 成员项暂不支持 flex-shrink 、 flex-basis、align-content 属性。

该属性不支持 flex: flex-grow | flex-shrink | flex-basis 的简写。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置定位类型。默认值为 relative。

运用 position:sticky或position: fixed 可实现头部导航栏固定(吸顶效果)

示例源码如下，请查看 pre > code 标签中的内容

如果定位元素超过容器边界，在 Android 下，超出部分将不可见，原因在于 Android 端元素 overflow 默认值为 hidden，但目前 Android 暂不支持设置 overflow: visible。

transition允许 CSS 的属性值在一定的时间区间内平滑地过渡。

设置过渡动画的属性名，设置不同样式 transition 效果的键值对，默认值为空，表示不执行任何过渡效果

指定过渡的持续时间 (单位是毫秒)，默认值是 0，表示没有动画效果。

指定请求过渡操作到执行过渡之间的时间间隔 (单位是毫秒或者秒)，默认值是 0，表示没有延迟，在请求后立即执行过渡。

描述过渡执行的速度曲线，用于使过渡更为平滑。默认值是 ease。下表列出了所有合法的属性：

示例源码如下，请查看 pre > code 标签中的内容

应用于元素的2D或3D转换。这个属性允许你将元素旋转，缩放，移动，倾斜等。

除了perspective和transform-origin，transition支持了transform的全部能力。 其中transform的rotate 和rotatez 等效.

示例源码如下，请查看 pre > code 标签中的内容

同时生效的时候，优先级高覆盖优先级低。 例如：input:active:enabled 和 input:active 同时生效，前者覆盖后者

所有组件均支持线性渐变。CSS3 渐变 你可以通过 background-image属性创建线性渐变。

示例源码如下，请查看 pre > code 标签中的内容

background-image 优先级高于 background-color，这意味着同时设置 background-image 和 background-color，background-color 被覆盖。 background 不支持简写。

目前暂不支持 radial-gradient（径向渐变）。

示例源码如下，请查看 pre > code 标签中的内容

从HBuilderX3.4.3起，重新支持阴影样式(box-shadow)。修复老版本组件设置box-shadow后在不同系统版本出现的显示异常及闪烁问题! 但需要注意设置阴影样式(box-shadow) 的组件需要让出阴影渲染位置，否则会出现阴影显示不全的问题。

示例源码如下，请查看 pre > code 标签中的内容

目前Android平台对阴影样式(box-shadow)支持的还不太完善，有设置圆角边框时阴影样式显示不正常、占用组件视图渲染区域等问题。

为解决这些问题，从HBuilderX 2.4.7起，新增elevation属性（组件的属性，不是css样式）设置组件的层级，Number类型，层级值越大阴影越明显，阴影效果也与组件位置有关，越靠近页面底部阴影效果越明显

示例源码如下，请查看 pre > code 标签中的内容

color {color}：文字颜色，支持如下字段：

font-size {number}：文字大小，只有text标签可以设置字体大小

font-style {string}：字体类别。可选值 normal | italic，默认为 normal。

font-weight {string}：字体粗细程度。默认值: normal；

text-decoration {string}：字体装饰。默认值为 none。

不支持 text-decoration:overline

text-align {string}：对齐方式。默认值为 left。

不支持text-align:justify

font-family {string}：设置字体。这个设置不保证在不同平台，设备间的一致性。 如所选设置在平台上不可用，将会降级到平台默认字体。 如果需要加载自定义字体，请参考相关DOM.addRule

text-overflow {string}：设置内容超长时的省略样式。

lines {number}: 正整数，指定最大文本行数，默认lines值为0，表示不限制最大行数lines。如果文本不够长，实际展示行数会小于指定行数。

line-height {length}: 正整数，每行文字高度。line-height是 top 至 bottom的距离。 line-height与font-size没有关系，因为line-height被 top 和 bottom 所限制， font-size 被 glyph 所解析。line-height和font-size相等一般会导致文字被截断。

word-wrap:<string> 对nvue来说 anywhere 表示在以字符为最小元素做截断换行，其它值或不指定该属性，都以英文单词为单位进行换行。

**Examples:**

Example 1 (unknown):
```unknown
background-image
```

Example 2 (unknown):
```unknown
background-color
```

Example 3 (unknown):
```unknown
border-right
```

Example 4 (unknown):
```unknown
border-bottom
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-base.html

**Contents:**
  - # 应用标识
    - # 本地离线打包
  - # 应用名称
    - # 本地离线打包
  - # 应用描述
  - # 应用版本名称
    - # 本地离线打包
  - # 应用版本号
    - # 本地离线打包
      - 本页导读

HBuilderX中打开项目的manifest.json文件，在“基础配置”中可以设置App的应用名称、版本号等信息：

DCloud应用appid（简称appid）是由DCloud创建App项目时生成的唯一标识，关联DCloud云端服务，创建项目后会自动生成，不能随意变更。

注：这与各家小程序的appid、Apple的appid(bundle id)及其它三方SDK平台申请的appid不同，它们分别属于各自平台的appid体系

更多appid用途详见 DCloud appid使用说明

离线打包时需在原生工程中设置，Android平台参考 Android Studio工程配置DCloud appid ，iOS平台参考 XCode工程配置DCloud appid

应用的名称，发行为App时作为应用桌面图标的名称，支持国际化时请参考 manifest.json国际化

离线打包时需在原生工程中设置，Android平台参考 Android Studio工程配置应用名称 ，iOS平台参考 XCode工程配置应用名称

应用的描述信息，用于简单介绍应用情况，发行为App时不会使用。

应用显示的版本名称，可以使用任何字符串，推荐使用“.”分割的数字表示“主版本号.次版本号.编译版本号”，如“1.1.1234”。云端打包后设置为原生工程的应用版本名称：

在 App 中可通过 plus.runtime.version 获取应用版本名称。

离线打包时需在原生工程中设置，Android平台参考 Android Studio工程配置应用版本名称 ，iOS平台参考 XCode工程配置应用版本名称

应用的内部版本号，必须使用整数，用于记录开发版本的，建议每次发布（云端打包）时更新为比上一次高。如：当前版本是100，下次发布就要大于100，比如101、102等。云端打包后设置为原生工程的应用版本号：

在 App 中可通过 plus.runtime.versionCode 获取应用版本号。

离线打包时需在原生工程中设置，Android平台参考 Android Studio工程配置应用版本名称 ，iOS平台参考 XCode工程配置应用版本号

**Examples:**

Example 1 (yaml):
```yaml
android:versionName
```

Example 2 (unknown):
```unknown
CFBundleShortVersionString
```

Example 3 (yaml):
```yaml
android:versionCode
```

Example 4 (unknown):
```unknown
CFBundleVersion
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-privacy-android

**Contents:**
  - # 概述
  - # DCloud数据采集说明
  - # 配置方式
    - # HBuilderX3.2.1及以上版本配置方式
    - # HBuilderX3.2.0及以下版本配置方法
    - # 模板提示框
    - # 无提示框
  - # 离线打包配置方式
  - # 模板提示框
  - # 二次确认提示框

HBuilderX2.6.3+版本开始支持配置隐私政策提示框 HBuilderX3.1.10+版本优化template模式策略，解决应用市场检测到弹出隐私政策提示框之前读取mac地址和应用列表的问题 HBuilderX3.2.1+版本开始支持androidPrivacy.json文件配置隐私政策提示框，真机运行时也可生效 HBuilderX3.2.5+版本隐私政策提示框内容中的链接支持本地 html 页面地址 注意：目前设置custom模式策略，并不能完全避免在弹出隐私提示框之前，读取设备信息（如mac地址、应用列表等）的情况，主要原因是自定义模式隐私提示框并不能阻塞应用的生命周期，使用到一些三方SDK（如X5 Webview内核、UniPush等）在应用启动时会执行初始化操作，三方SDK这是可能会读取设备信息。碰到此问题的开发者请先使用template模式解决，我们后续会提供新的自定义隐私提示框样式解决方案。

请使用HBuilderX3.2.15+ 版本打包，并使用template配置隐私弹窗否则无法正常上架应用市场 uni小程序SDK暂时不支持uniapp自己配置隐私弹窗，需要宿主自行实现隐私弹窗

DCloud联合业内主流隐私合规检测厂商推出了uni隐私合规检测服务，可在线申请获取详细检测报告，详见：uni隐私合规检测

根据工业和信息化部关于开展APP侵害用户权益专项整治要求，App提交到应用市场必须满足以下条件：

为了兼顾隐私政策提示框的易用性和灵活性，解决弹出隐私政策提示框之前可能弹出系统授权框的问题。Android平台提供了以下隐私政策提示配置策略：

为了持续优化应用及提供统计报表功能，在运行过程中会采集应用启动时间、异常错误日志等数据，其中包含设备唯一识别码。

DCloud通过了国家信息安全等级保护三级，证书编号：11010813802-20001，保障相关数据的安全性 DCloud并非大数据公司，采集的数据是为开发者提供统计服务和产品持续优化，不包含个人隐私信息

请在《隐私政策》中必告知用户您的应用基于DCloud uni-app(5+ App/Wap2App)开发，增加如下参考条款

我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。详情内容请访问《[DCloud App引擎隐私政策](https://dcloud.io/license/appprivacy.html)》。

从HBuilderX3.2.1+版本开始新增androidPrivacy.json文件配置隐私政策提示框，支持真机运行查看效果，在androidPrivacy.json中也支持配置部分样式（如背景颜色、标题颜色、按钮颜色等）。 打开项目的manifest.json文件，切换到“App启动界面配置”，在“Android启动界面样式”中勾选“使用原生隐私政策提示框”

注意！androidPrivacy.json不要添加注释，会影响隐私政策提示框的显示！！！

勾选后会在项目中自动添加androidPrivacy.json文件，可以双击打开自定义配置以下内容：

示例源码如下，请查看 pre > code 标签中的内容

uni-app项目可以使用uni原生插件能支持更多自定义隐私政策提示框样式，可参考：https://ext.dcloud.net.cn/plugin?id=5581

打开项目的manifest.json文件，切换到“源码视图”项

示例源码如下，请查看 pre > code 标签中的内容

配置promt属性值为template时，表示使用原生模板隐私政策提示框，效果如下：

应用启动前，在Splash页面时显示此提示框，用户点击同意按钮后才会进入应用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：用户同意隐私政策前不要调用可能弹出系统授权框的API，如定位（plus.geolocation）、录音（plus.audio.getRecorder）等

配置prompt属性值为none时，表示不显示隐私政策提示框。 如果不提交到应用市场，可以使用此模式。

HBuilderX3.2.1+版本新增androidPrivacy.json配置隐私政策提示框，优先级高于原生环境配置，HBuilderX3.2.1+版本建议使用androidPrivacy.json 替代本章节的离线打包配置

在原生工程中应用的AndroidManifest.xml中配置隐私提供框模式，在application节点下添加meta-data节点数据，如下：

示例源码如下，请查看 pre > code 标签中的内容

android:value可取值为"template"、"none"。

** 配置使用"template"模板提示框时，需要按以下方法配置提示框内容** 在原生工程的res/values目录下的strings.xml配置默认语言内容（为了兼容用户设置不同语言的清空，此文件必须配置）。中文还需要创建res/values-zh目录下的strings.xml文件并配置中文内容。

请在原生工程的strings.xml中添加以下字段配置模板提示框内容。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX3.1.12+版本新增支持模板隐私提示框二次确认功能，点击隐私模板提示框时用户选择“拒绝”按钮并且二次确认提示框内容dcloud_second_privacy_prompt_message配置不为空时会弹出二次确认提示框。

请在原生工程的strings.xml中添加以下字段配置二次确认提示框内容。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX3.2.12+版本androidPrivacy.json支持国际化

示例源码如下，请查看 pre > code 标签中的内容

添加buttonAcceptLocales处理buttonAccept的国际化文本，如下

示例源码如下，请查看 pre > code 标签中的内容

需要在《隐私政策》中必告知用户您的应用基于DCloud uni-app(5+ App/Wap2App)开发，添加如下参考条款：

我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。

另外隐私政策中需要补充使用到的三方SDK，参考：

请参考文档Android平台各功能模块隐私合规条款

如果应用使用了uni原生插件，需要注意一下几点：

《隐私政策》必须非常清楚、全面地说明（不要用可能收集、了解用户信息这种模糊不清晰的词语）收集用户个人信息的目的、方式和范围。 如果应用使用“通讯录”、“短信”等相关功能，请根据应用业务场景进行描述。

**Examples:**

Example 1 (unknown):
```unknown
注意：目前设置custom模式策略，并不能完全避免在弹出隐私提示框之前，读取设备信息（如mac地址、应用列表等）的情况，主要原因是自定义模式隐私提示框并不能阻塞应用的生命周期，使用到一些三方SDK（如X5 Webview内核、UniPush等）在应用启动时会执行初始化操作，三方SDK这是可能会读取设备信息。碰到此问题的开发者请先使用template模式解决，我们后续会提供新的自定义隐私提示框样式解决方案。
```

Example 2 (markdown):
```markdown
我们的产品基于DCloud uni-app(5+ App/Wap2App)开发，应用运行期间需要收集您的设备唯一识别码（IMEI/android ID/DEVICE_ID/IDFA、SIM 卡 IMSI 信息、OAID）以提供统计分析服务，并通过应用启动数据及异常错误日志分析改进性能和用户体验，为用户提供更好的服务。详情内容请访问《[DCloud App引擎隐私政策](https://dcloud.io/license/appprivacy.html)》。
```

Example 3 (json):
```json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
  "buttonAccept": "同意并接受",
  "buttonRefuse": "暂不同意",
  "hrefLoader": "system",
  "backToExit":"false",
  "second": {
    "title": "确认提示",
    "message": "　　进入应用前，你需先同意<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>，否则将退出应用。",
    "buttonAccept": "同意并继续",
    "buttonRefuse": "退出应用"
  },
  "disagreeMode":{
    "support": false,
    "loadNativePlugins": false,
    "visitorEntry": false,
    "showAlways": false
  },
  "styles": {
    "backgroundColor": "#00FF00",
    "borderRadius":"5px",
    "title": {
      "color": "#ff00ff"
    },
    "buttonAccept": {
      "color": "#ffff00"
    },
    "buttonRefuse": {
      "color": "#00ffff"
    },
    "buttonVisitor": {
      "color": "#00ffff"
    }
  }
}
```

Example 4 (json):
```json
{
  "version": "1",
  "prompt": "template",
  "title": "服务协议和隐私政策",
  "message": "　　请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了更好的向你提供服务，我们需要收集你的设备标识、操作日志等信息用于分析、优化应用性能。<br/>　　你可阅读<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>了解详细信息。如果你同意，请点击下面按钮开始接受我们的服务。",
  "buttonAccept": "同意并接受",
  "buttonRefuse": "暂不同意",
  "hrefLoader": "system",
  "backToExit":"false",
  "second": {
    "title": "确认提示",
    "message": "　　进入应用前，你需先同意<a href=\"\">《服务协议》</a>和<a href=\"\">《隐私政策》</a>，否则将退出应用。",
    "buttonAccept": "同意并继续",
    "buttonRefuse": "退出应用"
  },
  "disagreeMode":{
    "support": false,
    "loadNativePlugins": false,
    "visitorEntry": false,
    "showAlways": false
  },
  "styles": {
    "backgroundColor": "#00FF00",
    "borderRadius":"5px",
    "title": {
      "color": "#ff00ff"
    },
    "buttonAccept": {
      "color": "#ffff00"
    },
    "buttonRefuse": {
      "color": "#00ffff"
    },
    "buttonVisitor": {
      "color": "#00ffff"
    }
  }
}
```

---

## ios 安心打包证书安装 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/build/iosSafePack.html

**Contents:**
- # ios 安心打包证书安装
- # 前言
- # 打开证书目录
- # 安装证书
      - 本页导读

某些MacOSX系统上, 使用ios安心打包, 需要安装相关证书.

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-sec-android

**Contents:**
  - # 安全漏洞风险问题的处理原则
    - # HBuilderX3.1.14版本修复安全相关问题
  - # 常见的安全漏洞风险的解决方案
    - # Webview绕过证书校验漏洞 及 Android主机名\证书弱校验风险
    - # Activity、Service、Receiver等组件导出风险
    - # 应用签名未校验风险
    - # APK可被反编译后取得源代码风险
    - # WebView远程代码执行漏洞
    - # 密钥硬编码漏洞
    - # SO文件破解风险漏洞

近期收到开发者反馈将uni-app/5+ App项目打包Android平台App提交到腾讯云、百度云、爱加密等安全平台检测出存在漏洞风险，对于反馈的漏洞风险问题我们一直在持续跟进并积极寻找解决方案修复。

首先我们需要理解漏洞风险并不代表真实存在安全漏洞，比如WebView远程代码执行漏洞，仅在Android4.2及以下版本系统存在，目前HBuilderX发现App最低要求版本Android4.4；比如Activity、Service、Receiver等组件导出风险，有些功能依赖的组件必须设置为导出，实际上并不存在安全问题。而安全平台会把所有可能存在的漏洞或风险都列出来，很多安全问题都可能是误报或夸大了安全漏洞的隐患。

因此对于存在漏洞风险问题的基本解决方案是使用APK加固，推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

如果加固还不能解决问题，或者安全平台要求加固前进行检测，请在官方论坛ask 发帖反馈，添加话题为“安全漏洞”、“安全检测”，上传完整安全检测报告及检测的apk文件。

对于反馈的安全漏洞问题我们会根据风险等级，优先解决高风险和中风险问题 对于低风险问题，理论上不会影响应用的安全质量，因此通常情况下不会解决低风险安全漏洞问题。

首先我们需要判断风险漏洞是哪些代码引起的，可以通过安全检测报告中漏洞详情中的漏洞代码类名进行判断，如果是以"io.dcloud"开头则表示是DCloud的代码，如下： 如果是以其它字符开头，则表示是三方SDK或uni原生插件的代码，如下：

修复方案 HBuilderX3.1.14+版本新增untrustedca节点配置是否允许使用非受信证书。 在项目manifest.json中"app-plus"->"ssl"节点下配置"untrustedca"为"refuse"，示例如下：

示例源码如下，请查看 pre > code 标签中的内容

风险描述 APP的Activity、Service、Receiver等组件可以在AndroidManifest.xml中通过配置属性android:exported设置 为私有（false）或公有（true），设置为公有时则认为组件对外导出，可以被其它任何程序的任何组件访问。导出的组件可能被第三方App恶意调用，可能返回隐私信息给恶意应用，造成数据泄露；可能导致应用崩溃，造成拒绝服务等漏洞。

修复方案 HBuilderX3.1.14+版本已经将DCloud管理的代码中所有不需要被外部访问的组件都设置为私有（即android:exported属性值设置为false），仅将需要被外部访问的组件，如App入口Activity（io.dcloud.PandoraEntry）设置为公有。

另外需要注意，一些三方SDK因为功能需要会将其组件设置为对外导出，如下：

风险描述 签名证书是对App开发者身份的唯一标识，如果程序未对签名证书进行校验，可能被反编译后进行二次打包使用其它签名证书重新签名。如重新签名的App可以正常启动，则可能导致App被仿冒盗版，影响其合法收入，甚至可能被添加钓鱼代码、病毒代码、恶意代码，导致用户敏感信息泄露或者恶意攻击。

修复方案 对APK进行加固，推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

风险描述 说的打包为App的原生APK可以被反编译获取Java源代码。

修复方案 对APK进行加固，推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

风险描述 用该漏洞可以根据客户端能力实现远程任意代码执行攻击。 WebView 远程代码执行漏洞触发前提条件：

修复方案 HBuilderX发布到App的Android平台最低支持Android4.4，即minSdkVersion大于等于19。也就是说Android4.4及以上版本并不存在此漏洞，如果你的项目配置了minSdkVersion低于19，则请参考https://ask.dcloud.net.cn/article/193 修改。

风险描述 应用程序在加解密时，使用硬编码在程序中的密钥，攻击者通过反编译拿到密钥可以轻易解密APP通信数据

修复方案 HBuilderX3.1.14+版本已修复此问题，在内部逻辑中使用的密钥全部做了混淆加密处理。

风险描述 SO文件为APK中包含的动态链接库文件，Android利用NDK技术将C/C++语言实现的核心代码编译为SO库文件供Java层调用。SO文件被破解可能导致应用的核心功能代码和算法泄露。攻击者利用核心功能与算法可轻易抓取到客户端的敏感数据，并对其解密，导致用户的隐私泄露或直接财产损失

修复方案 对APK中的SO文件进行加固保护,推荐uni安全加固，目前由蚂蚁小程序云提供支持，可有效提升应用整体安全性。

风险描述 StrandHogg之所以独特，是因为它无需进行植根即可启用复杂的攻击，它利用Android的多任务系统中的一个弱点来实施强大的攻击，使恶意应用程序可以伪装成该设备上的任何其他应用程序。此漏洞利用基于一个称为“ taskAffinity”的Android控件设置，该控件允许任何应用程序（包括恶意应用程序）自由地采用其所需的多任务处理系统中的任何身份。

修复方案 该漏洞已于2020.4.1的安全补丁中修复(涵盖Android 8.0 / 8.1 / 9.0+)。由于已经通过系统补丁封堵。理论上该漏洞不会对高版本系统的手机设备构成威胁。 而app客户端开发并没有彻底规避该漏洞的方案。各检测平台推荐配置android:taskAffinity=“”，但仅是临时方案。但该方案会导致应用运行到android11+系统设备时任务堆栈窗口变成两个的问题。 由于android:taskAffinity=“”配置存在bug！所以我们并不会默认这样配置。但为开发者提供的云打包配置选项。由开发者决定是否配置临时封堵该漏洞。具体如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

风险描述 从Nougat(Android 7) 一个名为“Network Security Configuration'的新安全功能也随之而来。如果应用程序的 SDK高于或等于24，则只有系统证书才会被信任。Android Network Security Configuration 功能提供了一个简单的层，用来保护应用程序在未加密的明文中意外传输的敏感数据。可以针对特定域和特定应用配置这些设置。如缺少networkSecurityConfig 特性，应用程序将使用系统默认安全配置，致使应用程序在不安全的定制 ROM 上运行时可能遭受恶意网络攻击。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
WebView File域同源策略绕过漏洞
```

Example 2 (unknown):
```unknown
Android平台WebView控件跨域访问高危漏洞
```

Example 3 (unknown):
```unknown
Webview绕过证书校验漏洞
```

Example 4 (unknown):
```unknown
Android主机名\证书弱校验风险
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/mp-harmony/intro.html

**Contents:**
- # 概述
- # 前置准备
  - # 开发环境准备
  - # 元服务 appid 注册
  - # 元服务上架备案（上架重要）
  - # 准备签名证书
- # 运行与调试
  - # 1. 配置 manifest.json 文件
  - # 2. 配置 module.json5
  - # 4. 运行鸿蒙元服务

如果你是服务商、外包商，承诺短期可快速上架 20 个元服务，欢迎点此联系我们 ，我们可提供单独技术支持，以及帮助协调鸿蒙测试机。

从 HBuilderX 4.34 版本开始，uni-app 支持 鸿蒙元服务 平台应用开发。鸿蒙元服务就是鸿蒙 Next 系统上的快应用、小程序。在鸿蒙 Next 系统上，不再支持快应用，对标替换产品即为鸿蒙元服务。

欢迎加入 uni-app 鸿蒙化技术交流群 进行交流。

元服务的开发和上架需要使用元服务的包名 BundleName，包名的形式 com.atomicservice.[你的 APPID]。

如果还没有创建元服务，访问 华为 AppGallery Connect 完成元服务应用的注册，得到相关包名。方便进行签名证书的操作。

元服务上架需要提前做好备案，强烈建议注册元服务时候立刻开始备案流程，避免临上架才开始备案，耽误上架时间。参考 App 备案相关注意事项 .

如果你的元服务需要使用登录、支付权限，也立即开始着手准备申请相关权限，参考 华为支付服务开发准备 。

常见问题：我已经备案、上架了安卓应用，参考 HarmonyOS 应用/元服务应如何进行备案？

初次运行元服务，需要配置好证书签名、权限设置等信息，第一次参与鸿蒙开发的新手请仔细阅读下面相关建议，否则可能会影响开发元服务。

在 HBuilderX 4.81+ 可在 HBuilderX manifest.json 中进行可视化操作，完成证书的自动签名。

在 HBuilderX 4.81 版本之前，需要手动配置鸿蒙签名，可参考 鸿蒙元服务配置签名证书。

此版本之前，元服务的证书签名、权限配置和鸿蒙 App 的相关操作基本一致，需要使用启动 DevEco 启动模拟器，参考 证书签名配置指南 。

填入已经注册的元服务包名（com.atomicservice.xxx），点击运行设备检测，在保证模拟器、真机运行。然后选择 自动申请调试证书，授权并完成自动签名后，会自动填写签名信息，选择保存即可。

在华为开发者后台会自动生成对应的文件，后续如果需要更新设备、开通地图功能、申请 ACL 权限时候，需要更新 p7b，请选择编辑设备，重新下载，替换 签名描述文件 一栏的文件路径。

具体操作步骤是，访问 华为开发者后台 - 证书、APP ID 和 Profile - 对应证书 - 编辑设备，勾选设备后重新下载，得到 p7b 文件，替换原始文件。

并在手机设置-应用与元服务列表中，移除正在开发的元服务，并选择重新运行元服务并清空缓存，确保立即生效。

如果可以运行成功官方的 Hello World 示例，说明相关环境、证书配置完成。后续用到登录、支付、定位等权限时候需要使用调试证书，到时候替换正确的手动签名证书即可，本部分目的是配置元服务环境，减少上手阻碍。

到这里前置工作就准备完成了。因为元服务还在开发迭代，下面补充相关注意事项。

在 HBuilderX 运行 uni-app 项目到元服务需要执行下面步骤：

项目运行需要配置元服务包名，打开项目根目录的 manifest.json 填写 鸿蒙元服务 - 应用包名，结构类似 com.atomicservice.[你的AppID]。

鸿蒙元服务需要获取使用特定的能力，比如元服务登录、震动、获取网络状态等权限、配置应用名称和图标时候需要配置权限模版。

重要： 下载 module.json5 文件。

项目根目录创建 harmony-mp-configs/entry/src/main/module.json5 文件。进行替换操作。

访问 AGC 后台 ，选择你的项目，在 项目设置 - 常规 页面中搜索 Client ID，匹配到的结果是下面需要到 client_id，这个参数会关联当前应用的相关权限，比如位置服务、登录功能等。

注意点击添加公钥指纹，添加调试证书，否则登录等鉴权功能会失败。

选择 运行 - 运行到小程序模拟器 - 鸿蒙元服务，在弹出的鸿蒙设置选择框中选择鸿蒙真机。

同时真机页面更新，即可进行元服务开发和运行。

元服务的条件编译是 MP-HARMONY。

开发过程中遇到的问题，欢迎加入 uni-app 鸿蒙化技术交流群 进行交流，有官方人员进行答疑和指导。

如果遇到需要 debug 或者白屏问题可以下面方案 进行调试。

构建鸿蒙工程的过程中可能需要访问 npm 公共仓库，如果遇到网络问题可以通过设置环境变量 NPM_CONFIG_REGISTRY 来指向特定的 npm 公共仓库。

从 HBuilderX 4.81 开始，运行鸿蒙元服务的时候支持热更新，当修改了源代码并保存后，修改的内容会很快反映到应用里，不需要重启应用。注意：目前仅真机生效，现网模拟器暂不支持。

启用这个热更新特性需要运行元服务应用的设备满足一定条件，即已经安装了所必需的达到一定版本的基础依赖包。如果不满足启用条件，则仍会使用原本的全量打包模式。

验证设备是否满足条件的方法是：在命令行环境执行下面的命令，并检查输出结果中的 versionName 是否达到 1.0.13.310 版本。

示例源码如下，请查看 pre > code 标签中的内容

如果设备中没有安装这个基础依赖包，或者版本没有达到要求，则需要通过一定的操作来安装这个包的最新版本。

对于模拟器来说，因为这个包是以固件方式安装在虚拟设备里面的，无法更新，所以只能等待新发布的模拟器镜像来解决这个问题。

对于真机来说，进入【设置>应用和元服务>元服务】界面，如果看到 helloUniApp 则卸载它，然后进入负一屏的搜索界面，搜索 helloUniApp，找到这个元服务之后打开一次即可。

元服务上架需要授权 DCloud 作为服务商完成上架，这里介绍如何将元服务上架到鸿蒙应用市场。

注意：目前上架元服务，部分应用信息需要在鸿蒙元服务后台填写，访问 华为 AppGallery Connect 后台 ，选择 我的元服务，选择对应的元服务 - 编辑。

填写完点击页面右上角的 保存 按钮，其他没有提到的数据无需填写，这一步骤作用是填写上架所需的特定数据。

在 HBuilderX 中开发 uni-app 上架到鸿蒙元服务需要下面几个步骤：

选择你要上架的元服务，授权 DCloud 完成后续的上架流程。

开发调试期间的证书不可用于应用上架。元服务发布证书的申请流程和鸿蒙应用开发类似，访问 鸿蒙发布元服务文档 进行发布证书的获取。

修改 build-profile.json5 里的 release 证书签名。务必注意调试和发行证书是两套，不能混用。

参考下方常见问题，配置 module.json5 设置图标、启动图等自定义配置项。

在 HBuilderX 中选择 发行 - 鸿蒙元服务，进行元服务打包。等待打包完成，会提示上传完成。接下来到 DCloud 开发者中心完善上架资料。

在上个步骤中，控制台在上传完成之后，提示打开 DCloud 开发者中心 。如果你是项目协作者账号登录，请切换为项目作者账号登录。

选择 应用管理 - 我的应用 - 选择项目 APPID，进入项目详情，选择 各平台信息，打开下面截图的页面，选择 发布 按钮。

表单会默认填写部分元服务信息，请务必确定完成了 上架前置准备 要求内容。填写完成后选择 提交审核 按钮。

上架过程中遇到的问题，欢迎加入 uni-app 鸿蒙化技术交流群 进行交流，有官方人员进行答疑和指导。

建议先阅读上面调试开发文档，了解大致流程。也可参考 鸿蒙签名文件配置 了解如何生成证书。

新用户面对鸿蒙签名相关文件会不确定怎么调整。这里对概念做进一步解释：签名文件总共需要四个配置文件（p12/csr/cer/p7b），和两个配置选项（alias/password）。

访问 AGC 后台 的 证书/APPID/Profile 页面中可以下载。

文档调试章节提到了权限配置、metadata 等信息配置。HBuilderX 工程文件重点关注 harmony-mp-configs 这个文件夹，内部的文件在编译时候会自动同步到最终鸿蒙工程中，如果没有需要新建对应文件。

在 harmony-mp-configs/entry/src/main/module.json5，可以设置权限、metadata、隐私协议托管等功能，完整配置文档可以参考 module.json5 配置文件

可看 uni.getLocation 鸿蒙位置设置指南 具体看详细介绍。

元服务图标必须在华为提供的标准图标底板上设计，否则会上架审核不通过。参考 生成元服务图标 生成图标，最终得到两个图片，一个是 216x216 用于在 uniapp 开发者后台上传图片，一个是 512x512 的图标放置代码里，具体是 harmony-mp-configs/AppScope/resources/base/media/my_app_icon.png 路径上，后续可通过 $media:my_app_icon 访问。

如何修改元服务的标题、图标、启动图？需要把文字和图标先定义，然后在资源文件中引用。下载文档中推荐的 module.json5 文件，下载放置到 harmony-mp-configs/entry/src/main/module.json5 ，定位到 module.abilities[0] 会找到下面几个字段：

通过设置 $media:xxx 关联图片，$string:xxx $color:xxx 对应配置文件的值。

在项目 harmony-mp-configs 目录创建 entry/src/main/resources/ 目录。注意， zh_CN 大于 base 配置，最终会在 AppScope 查找配置，优先修改 zh_CN 配置。

举例，下面是 zh-CN/element/string.json 中的内容，可以修改 EntryAbility_label 字段。

示例源码如下，请查看 pre > code 标签中的内容

访问 开发者后台 - 凭证 - 项目级凭证，查询到当前项目的相关信息。

其中 OAth 2.0 客户端 ID 中的凭证名称标识对应的应用、元服务名称，客户端凭证ID 代表 ClientID,密钥代表 ClientSecret 在解析 code 时候需要。

如果发生在应用运行、发行阶段。可能是构建时候证书缺少或者配置不对。参考 鸿蒙发布元服务 进行证书申请。

如果是发生应用发行阶段，可能是未填写完整的发布证书，需要调整 build-profile.json5。

临时方案。进入手机 - 设置 - 系统 - 开发者选项（如果未开启 关于手机 - 软件版本连续点击开启） - 开发中元服务豁免管控，选择开启后，可以自由调试。

稳定方案。整理 web-view 需要用到的相关域名，进入华为 AppGallery Connect 后台 - 我的项目 - 开发管理 - 元服务域名管理 - httpRequest 合法域名。按照提示进行填写。填写完成后打开 手机设置 - 应用与元服务，删掉正在开发的元服务，重新启动应用。

如果你手动配置过 module.json5 文件，需要确保 requestPermissions 下存在 {"name":"ohos.permission.INTERNET"} 权限。

页面中使用地图需要 华为 AppGallery Connect 后台 进行权限申请。具体可以参考 鸿蒙 Map Kit 开发准备 ，在 项目设置 - API 管理开启地图服务。

在 harmony-mp-configs/entry/src/main/module.json5 在 requestPermissions 字段里添加 ohos.permission.LOCATION 和 ohos.permission.APPROXIMATELY_LOCATION 两条记录。操作步骤可参阅 API getLocation 鸿蒙位置设置指南

元服务不允许未经用户同意发起定位。在请求位置之前需要获取用户授权。伪代码如下：

示例源码如下，请查看 pre > code 标签中的内容

元服务的登录要求可以参考阅读 《使用华为账号登录 静默登录 》、《开发者可以使用自行设计的登录界面吗？ 》。

如果需要账号登录，必须使用 uni.login 登录，不得绕过自行使用账号密码登录。建议申请获取用户手机号权限，然后关联自己的账号系统。在应用合适时机调用登录接口换取 UnionID，先标识用户为华为用户，操作关键步骤时候接入现有账号，比如获取手机号关联现有账号。同时务必提供注销用户功能入口，用户自行取消注册，否则会被驳回。

实践中，某些分类下的应用无法申请一键获取手机号，申请会被驳回，这种情况下，建议在业务中完成静默登录，然后在某些操作时候关联其他平台用户，此时通过手机号和验证码完成相关关联平台账号逻辑。

参考鸿蒙 Account Kit 开发准备 设置相关权限，添加 scope 权限。

通过 uni.login 可以得到 code，流程和其他小程序登录流程相似。参考 解析凭证 得到用户的 UnionID，开发者在这一步骤自行判断是已绑定华为 UnionID，如果未绑定，引导用户绑定现有账号体系。如果你没有 code 返回值，观察接口错误提示，一般是 client_id 设置错误。

也可以参考下面手机号接口申请，快速绑定手机号，具体见下个问题。

欢迎使用 uni-id-pages 插件加速元服务开发落地，这里封装了服务端开发的逻辑。在 uni-pay 中也提供了华为元服务支付的服务端逻辑封装，接入更方便。

申请过手机号敏感权限之后，可以通过 button 获取用户手机号。使用这种方式快速注册、绑定账号体系。

如果手机号申请失败，一般是没有严格按照手机号申请的要求完整填写，确保包含三个部分，应用的分类、场景的具体操作步骤、请求频率。尤其是第二部分，参考描述详细步骤。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果有返回值，说明配置项正确。可以让服务端解析数据。如果点击无反应，在 HBuilderX 中打开展示原生日志，观察是否有类似 Failed to check the fingerprint 的告警，排查错误方案如下：

用户侧第一次使用会有系统控件弹窗申请，同意之后，后续会自动同意。如果撤回同意，或者测试控件效果，需要手机打开 设置-华为账号-账号安全-使用华为账号的应用-删除授权。

用户侧控件效果如下，默认展示手机系统登录的账号，也可以通过管理手机号，手动验证其他手机号。

最终解析 token 得到最终结果，最终结果数据是下面的结构，供 mock 参考，包含了 unionID/mobileNumber 字段，后面执行用户关联操作。

示例源码如下，请查看 pre > code 标签中的内容

新版模版已内置，如果你自定义过权限，需要存在 GET_NETWORK_INFO 和 vibrate 权限。具体的鸿蒙元服务权限列表可以参考 鸿蒙对所有应用开放的权限清单 进行查询。按照 配置权限模版 章节进行配置。

模拟器或者真机上已经安装了当前 BundleName 的应用。可能是证书复用导致的错误，重新确认当前证书是元服务证书，而不是鸿蒙 App 的证书。

你可能声明了不兼容的字段，需要在 harmony-mp-configs/build-profile.json5 里面去掉 app.products.*.compileSdkVersion 属性。

一般来说 harmony-mp-configs/entry/src/main/module.json5 配置文件有问题，导致运行失败，需要检查配置文件，如果配置文件没有问题，可以尝试删除文件，重新运行一下。

确保 entry/src/main/module.json5 文件是使用文档顶部的网络模版下载的。

文件 harmony-mp-configs/entry/src/main/module.json5 会用来配置应用的一些行为，你可以参考 鸿蒙 module.json5 配置文件 进行学习和参考。

如果你已经在开发鸿蒙 App ，见到 module.json5 会感觉比较熟悉，有几个属性需要特别注意：

MP-HARMONY，具体参考 条件编译文档 。

错误原因：表明当前环境缺少元服务运行所必须的基础依赖，通常出现在初次运行的错误提示。

在终端中运行 hdc shell bm dump-shared -a，观察返回值是否包含 com.huawei.hms.ascfruntime，如果不包含运行元服务会出现此错误。

注意：如果使用模拟器仍然报错上述错误，临时方案需要新建 harmony-mp-configs/entry/oh-package.json5，填充下面内容。使用真机时候不需要执行这个操作。此为鸿蒙 Bug，后续鸿蒙会优化处理。

示例源码如下，请查看 pre > code 标签中的内容

已修复，在 HBuilderX alpha 4.63 上有问题，请参考 这个问题 进行兼容。

目前华为提供了一个自动化工具，用来自动化处理多个元服务的创建、信息维护和更新操作。详见 元服务工具使用指导

备案类问题参考阅读：APP 备案 FAQ 。

补充： Mac 电脑上指纹信息填写 SHA-1 的数值，不要填写 SHA-256。

如果希望开启远程调试，可以按照下面方法操作。

调试分成两个部分，一个是视图层的 WebView 调试，一个是逻辑层 V8 的调试。阅读官方文档 运行调试元服务

WebView 调试按照文档操作，简单来说可以分成三个步骤：

如果你遇到应用几秒后闪退，说明不是 debugger 模式，正常运行情况下阻塞 6s 系统会让应用闪退。

观察上传参数里是否有数字类型参数，强转为字符串。可进一步参考 鸿蒙相关问题

有用户反馈在 Windows 平台下运行 DevEco 原生元服务正常，使用 HBuilderX 运行空白工程会卡住无法完成。发现是个别系统安全工具会默认拦截，拦截发生在 DevEco 调用内置取得 node 处理编译时候。提示文案：“有程序正在进行可疑操作，建议阻止”。

目前没有好的方案解决，建议始终信任 DevEco 的操作，或者临时退出安全软件。有相关经验也欢迎交流反馈。

元服务在 HBuilderX 中执行发布操作，发布成功后登录 uni-app 后台，软件的状态显示失败。

一般来说是机器解析发行包时候遇到了问题，需要访问 华为 AGC 开发者后台 ，访问 APP 与元服务 - 应用上架 - 软件包管理，这里会有具体错误代码，点击错误原因即可看到详细解释

从 HBuilderX Alpha 4.51 开始，鸿蒙元服务启用了新的内置模版，适配 ASCF 最新能力，产生了不兼容变化，需要手动处理。

如果仍有报错，你可以在华为应用市场中搜索 helloUniApp 打开体验一次，这个过程会主动下载 com.huawei.hms.ascfruntime。

目前已支持通过 Vue3 CLI 开发元服务：

示例源码如下，请查看 pre > code 标签中的内容

目前已支持通过 Vue2 CLI 开发元服务:

示例源码如下，请查看 pre > code 标签中的内容

修改 package.json 的 scripts ，添加

示例源码如下，请查看 pre > code 标签中的内容

在鸿蒙应用、鸿蒙元服务中可以开发卡片，放置到桌面上，展示特定的应用数据、提供快速启动应用的入口。目前，卡片开发有两种方式：

在元服务中，只能通过 ArkTS UI 开发实现布局，参考文档方案如下：

下面介绍如何开发基于 UI 的卡片，思路和原生开发一致，推荐在 DevEco 中完成卡片开发验证，之后再迁移到 HBuilderX 工程中。首先在 DevEco 中先创建一个 ascf 工程。

这里推荐通过 git 来管理文件变化，选择默认的 2x2 和 2x4 会自动生成模板文件。

在默认的模板中，定义了一个 Hello World 卡片，点击卡片时候会自动打开元服务。复制这些文件放置到 mp-harmony-configs 文件夹，比如 entry/src/main/module.json5 文件放到 harmony-mp-configs/entry/src/main/module.json5 中，保持路径一致，构建时候会自动做替换。

运行服务之后，滚动手机到负一屏，选择卡片，点击加号，添加卡片，卡片可以放到负一屏，也可以长按拖动到桌面中。

更多开发细节参阅鸿蒙文档：开发基于 ArkTS UI 的卡片

元服务开发还在不断迭代，建议通过 HBuilderX alpha 版本进行开发。

如果无法在 HBuilderX 中看到鸿蒙日志，请确保开启鸿蒙网络豁免，打开手机设置 - 系统 - 开发者选项 - 开发中元服务豁免管控。

可在 HBuilderX 中开启原生日志，观察完整日志，如果报错中包含 xxx is not defined，可能是对应的 api 在元服务中还未实现，比如 uni.createAnimation、获取胶囊位置、获取激励视频等。此类问题需要使用条件编译进行规避。

如果报错中包含 vendor.js 中有报错，可能是三方组件库不兼容元服务，可以参考 debug 文档进行错误定位。

分包异步化 能力默认是支持的。开发者使用不生效一般是下面错误原因：

示例源码如下，请查看 pre > code 标签中的内容

在页面中正常使用： import CustomButton from "@/packageB/components/component1/index.vue";

如果你需要组件中使用占位组件，可参考阅读 小程序专题-分包异步化

检查代码中 module.json5 中的 requestPermissions 和 AGC 后台的隐私协议权限第二条 设备权限调用要严格一致。

代码内应用适配平台和鸿蒙后台勾选的设备不匹配，也就是代码中设备清单和线上资料不一样。

代码工程中，需要在 harmony-mp-configs/entry/src/main/module.json5 中搜索 deviceTypes，通常只设置 phone 值，表示兼容手机

在 AGC 后台或者 uni-app 提审后台，也有适配设备选项，确保和代码中保持一致，通常勾选 手机 Phone 值，表示兼容手机

观察按钮右侧有个联系方式，可以和 uniapp 发起沟通，看是否有更好的激励政策。如果仍有问题，可以在 uni-app 鸿蒙化技术交流群 沟通。

这说明你已经绑定了 DCloud 为服务商，绑定服务商可以简化提交审核的流程，统一处理不同平台的应用发布。你需要在 uniapp 后台来完成操作，访问应用管理-我的应用-具体项目-各平台信息-鸿蒙元服务发布，在这里进行发布。

自动申请调试证书是总是检测不到设备怎么办？设备已经加到 AGC 中了。 25 年 12 月开始，华为调整了查询设备信息的接口，影响了现有代码处理逻辑。两个处理方案：使用手动签名或者调整代码做兼容。

在 HBuilderX 安装目录找到 plugins/launcher/out/main.js 文件，查找和替换下面文件

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.76 运行元服务 tabbar 页面切换页面不会闪烁，HBuilderX 4.85+ 运行元服务快速切换 tab 页面会有闪烁重新加载的现象。这是目前技术实现的限制，实际发行不会卡顿。

技术方案解释：4.76 版本中元服务编译时间比较长，后续修改代码生效时间比较长，加载比较慢。华为底层的 ascf 针对这种情况提出了改进方案，改为启动本地服务网页，元服务通过访问本地服务器来展示内容，加载速度快，逻辑简单，性能优势明显，称之为热重载方案。

HBuilderX 4.85+ 采用了这个方案，用户切换页面时候会访问本地服务，会产生轻微的闪烁，页面生命周期也会重新触发。本地调试可忽略此问题，实际发布后不会有此问题。

目前华为的 ASCF 团队是这样规划的，不可修改，这个表现不会影响应用运行，不会影响审核上架

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 4.34
```

Example 2 (unknown):
```unknown
com.atomicservice.[你的 APPID]
```

Example 3 (unknown):
```unknown
manifest.json
```

Example 4 (unknown):
```unknown
module.json5
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-payment-paypal.html

**Contents:**
  - # 开通
  - # 配置
  - # 服务器生成订单
  - # 应用内发起支付
    - # 订单对象参数说明
    - # 示例代码
  - # 服务器授权
- # 注意事项
      - 本页导读

更多信息详见 申请开通Paypal操作指南

在manifest.json文件“App模块配置”项的“Payment(支付)”下，勾选“paypal支付”项并配置相关参数

提示：returnURL_android 和 returnURL_ios 可以相同，不相同时需要paypal开发者中心添加多个return URL

在 App 端调用支付前，需在业务服务器生成支付订单并获取orderId，详情可参考paypal官方文档：Create Order

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在App端发起支付完成后，返回订单id，并没有完成支付操作，需要在服务器授权或捕获订单完成扣款。

**Examples:**

Example 1 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "clientId": "clientId from paypal",     //客户端id
  "orderId": "orderId from server",       //订单id
  "userAction": "continue",  //  paynow/continue
  "currency":"USD",          // 币种  
  "environment":"sandbox",   //运行环境 sandbox/live
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('paypal')) {
            uni.requestPayment({
                "provider": "paypal", 
                "orderInfo": orderInfo,
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("orderId：" + rawdata.orderId);
                },
                fail: function (err) {
                    console.log('fail:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

Example 2 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "clientId": "clientId from paypal",     //客户端id
  "orderId": "orderId from server",       //订单id
  "userAction": "continue",  //  paynow/continue
  "currency":"USD",          // 币种  
  "environment":"sandbox",   //运行环境 sandbox/live
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('paypal')) {
            uni.requestPayment({
                "provider": "paypal", 
                "orderInfo": orderInfo,
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("orderId：" + rawdata.orderId);
                },
                fail: function (err) {
                    console.log('fail:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

Example 3 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "clientId": "clientId from paypal",     //客户端id
  "orderId": "orderId from server",       //订单id
  "userAction": "continue",  //  paynow/continue
  "currency":"USD",          // 币种  
  "environment":"sandbox",   //运行环境 sandbox/live
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('paypal')) {
            uni.requestPayment({
                "provider": "paypal", 
                "orderInfo": orderInfo,
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("orderId：" + rawdata.orderId);
                },
                fail: function (err) {
                    console.log('fail:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

Example 4 (json):
```json
//订单对象，从服务器获取
var orderInfo = {
  "clientId": "clientId from paypal",     //客户端id
  "orderId": "orderId from server",       //订单id
  "userAction": "continue",  //  paynow/continue
  "currency":"USD",          // 币种  
  "environment":"sandbox",   //运行环境 sandbox/live
};
uni.getProvider({
    service: 'payment',
    success: function (res) {
        console.log(res.provider)
        if (~res.provider.indexOf('paypal')) {
            uni.requestPayment({
                "provider": "paypal", 
                "orderInfo": orderInfo,
                success: function (res) {
                    var rawdata = JSON.parse(res.rawdata);
                    console.log("orderId：" + rawdata.orderId);
                },
                fail: function (err) {
                    console.log('fail:' + JSON.stringify(err));
                }
            });
        }
    }
});
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/android-16kb.html

**Contents:**
- # 概述
- # 不支持 16KB 的模块
  - # uni-ad
  - # uni-push
  - # uni实人认证
  - # 友盟统计
  - # OAID
- # 高德地图
      - 本页导读

随着设备制造商为设备配备更多 RAM 以优化性能，许多制造商将采用更大的页面大小（例如 16 KB）。为了迎接这些即将推出的设备，Google Play 推出了一项新的兼容性要求： 自 2025 年 11 月 1 日起，提交到 Google Play 且以 Android15（API 级别 35）及更高版本的设备为目标平台的所有新应用和现有应用更新都必须支持 16KB 的页面大小。 如需详细了解此兼容性要求，请参阅Google官方博文 。

HBuilderX4.81版本已适配支持 16KB 内存页面大小

uni-app 核心功能模块为了适配支持 16KB 内存页面大小，更新了部分依赖库（如Fresco3.4.0），最低支持的版本由 Android4.4（API 等级19） 调整为 Android5（API 等级21）。 也就是说升级HBuilderX4.81及以上版本后，生成的安装包将无法安装到 Android5 以下的设备，如果还需兼容 Android4.4 版本请继续使用 HBuilderX4.76 版本。

虽然 uni-app 核心功能模块已适配支持 16KB 内存页面大小，但部分涉及三方 SDK 的模块仍未完全适配支持。

uni-ad使用国内广告渠道SDK 仅支持国内环境，建议应用用于提交 Google Play 时不要使用国内渠道 SDK。

国外广告 applovin、pangle(海外穿山甲) 广告渠道SDK 未适配支持 16KB 内存页面大小，需等待官方升级相关SDK版本解决。 如果应用用于提交 Google Play 时不要包含这些SDK。

uni-push是由 DCloud 与合作伙伴个推共同推出的统一推送服务，在国内环境下，该服务依赖卓信ID SDK，但该 SDK 目前未适配支持 16KB 内存页面大小。 为满足 Google Play 的要求，应用在提交至 Google Play 时需避免使用卓信ID SDK。按以下方式配置，使用uni-push时将不会包含卓信ID SDK：

uni实人认证功能仅支持国内环境，建议应用用于提交 Google Play 时不要使用此功能。

友盟统计模块使用的SDK 版本为 9.4.4，目前无计划更新此 SDK 版本，建议应用用于提交 Google Play 时不要使用此功能。 如确实需要使用，请开发uni原生语言插件或uts插件 接入支持。

OAID目前使用的 SDK 版本为 1.0.25或1.0.13，更高版本需要申请证书，暂时无计划更新。此功能在生成 Google Play 渠道包时默认不包含。

离线打包时默认包含此SDK，如果需要上架 Google Play，可以直接删除库msa_mdid_1.0.13.aar和oaid_sdk_1.0.25.aar。

高德地图模块在国内渠道使用的SDK 版本为 10.0.700，高德地图官方暂时未适配支持 16KB 页面大小（后续会持续跟进处理）。如果要上架 Google Play 将以切换使用 Google 地图。

**Examples:**

Example 1 (unknown):
```unknown
pangle(海外穿山甲)
```

Example 2 (unknown):
```unknown
msa_mdid_1.0.13.aar
```

Example 3 (unknown):
```unknown
oaid_sdk_1.0.25.aar
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/env

**Contents:**
  - # vue-config.js
  - # package.json
  - # .env
  - # 注意
      - 本页导读

uni-app 项目中配置环境变量主要有如下三种方式：

在 vue.config.js 中可以修改 webpack 配置，包括环境变量，具体参考 vue-config.js。

在自定义条件编译平台时，可以在 package.json 文件的 env 节点下配置环境变量，具体参考 package.json

HBuilderX 中的 uni-app vue3 和 uni-app x (4.25+) 项目及 CLI 创建的项目中可以在根目录中放置 .env 文件来指定环境变量，具体参考：Vue2 ，Vue3 。

**Examples:**

Example 1 (unknown):
```unknown
uni-app vue3
```

Example 2 (unknown):
```unknown
uni-app x (4.25+)
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-components.html

**Contents:**
- # 概念
- # 优势
- # 注册
  - # 全局注册
  - # 局部注册
- # props
      - # 示例：
  - # 传递静态或动态 Prop
  - # 单向数据流
- # ref

下面是一个基本组件示例，在根<view>组件下再次引入一个<view>组件，并给组件的text区绑定一个data。

示例源码如下，请查看 pre > code 标签中的内容

基础组件是内置在uni-app框架中的，包括view、text、input、button、video等几十个基础组件，列表详见：uni-app基础组件

但仅有基础组件是不够用的，实际开发中会有很多封装的组件。

比如我们需要一个五角星点击评分的组件，在DCloud的插件市场里可以获取到：https://ext.dcloud.net.cn/plugin?id=33

把这个uni-rate组件导入到你的uni-app项目下，在需要的vue页面里引用它，就可以在指定的地方显示出这个五角星组件。

示例源码如下，请查看 pre > code 标签中的内容

在注册一个组件的时候，我们始终需要给它一个名字。 定义组件名的方式有两种：

当使用 kebab-case (短横线分隔命名) 定义一个组件时，你也必须在引用这个自定义元素时使用 kebab-case，例如 <my-component-name>。

当使用 PascalCase (首字母大写命名) 定义一个组件时，你在引用这个自定义元素时两种命名法都可以使用。 也就是说 <my-component-name> 和 <MyComponentName> 都是可接受的。

在uni-app工程根目录下的 components 目录，创建并存放自定义组件：

示例源码如下，请查看 pre > code 标签中的内容

uni-app 支持配置全局组件，需在 main.js 里进行全局注册，注册后就可在所有页面里使用该组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

局部注册之前，在需要引用该组件的页面，导入你想使用的组件。

如下通过两种方式导入一个角标的组件库，详见 ，推荐使用 easycom 方式引入。

示例源码如下，请查看 pre > code 标签中的内容

对于 components 对象中的每个 property 来说，其 property 名就是自定义元素的名字，其 property 值就是这个组件的选项对象。

在对象中放一个类似 uniBadge 的变量名其实是 uniBadge : uniBadge 的缩写，即这个变量名同时是：

示例源码如下，请查看 pre > code 标签中的内容

easycom是自动开启的，不需要手动开启，有需求时可以在 pages.json 的 easycom 节点进行个性化设置，详见 。

不管components目录下安装了多少组件，easycom打包后会自动剔除没有使用的组件，对组件库的使用尤为友好。

组件是 vue 技术中非常重要的部分，组件使得与ui相关的轮子可以方便的制造和共享，进而使得 vue 使用者的开发效率大幅提升。

uni-app 搭建了组件的插件市场，有很多现成的组件，若下载符合components/组件名称/组件名称.vue目录结构的组件，均可直接使用。uni-app插件市场

uni-app只支持 vue单文件组件（.vue 组件）。其他的诸如：动态组件，自定义 render ，和 <script type="text/x-template"> 字符串模版等，在非H5端不支持。

props 可以是数组或对象，用于接收来自父组件的数据。props 可以是简单的数组，或者使用对象作为替代，对象允许配置高级选项，如类型检测、自定义验证和设置默认值。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果你想要将一个对象的所有 property 都作为 prop 传入，你可以使用不带参数的 v-bind (取代 v-bind:prop-name)。例如，对于一个给定的对象 post ：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

所有的 prop 都使得其父子 prop 之间形成了一个单向下行绑定：父级 prop 的更新会向下流动到子组件中，但是反过来则不行。这样会防止从子组件意外变更父级组件的状态，从而导致你的应用的数据流向难以理解。

每次父级组件发生变更时，子组件中所有的 prop 都将会刷新为最新的值。这意味着你不应该在一个子组件内部改变 prop。如果你这样做了，Vue 会在浏览器的控制台中发出警告。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

被用来给元素或子组件注册引用信息，引用信息将会注册在父组件的 $refs 对象上。

如果在普通的 DOM 元素上使用，引用指向的就是 DOM 元素；如果用在子组件上，引用就指向组件实例：

示例源码如下，请查看 pre > code 标签中的内容

当 ref 和 v-for 一起用于元素或组件的时候，引用信息将是包含 DOM 节点或组件实例的数组。

因为 ref 本身是作为渲染结果被创建的，在初始渲染的时候你不能访问它们，它们还不存在！$refs 也不是响应式的，因此你不应该用它在模板中做数据绑定。

尽管存在 prop 和事件，有的时候你仍可能需要在 JavaScript 里直接访问一个子组件。 访问子组件实例或子元素，通过 ref 为子组件赋予一个 ID 引用，在vue的js中可通过this.$refs.XXX来获取到组件对象。

示例源码如下，请查看 pre > code 标签中的内容

你已经定义了这个 ref 的组件里，你可以使用：this.$refs.usernameInput来访问这个<base-input>实例。

示例源码如下，请查看 pre > code 标签中的内容

允许父级组件通过下面的代码聚焦<base-input> 里的输入框：

示例源码如下，请查看 pre > code 标签中的内容

非H5端只能用于获取自定义组件，不能用于获取内置组件实例（如：view、text）

你可能有很多次想要在一个组件的根元素上直接监听一个原生事件。 这时，你可以使用 @事件的 .native 修饰符：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当一个子组件改变了一个 prop 的值时，这个变化也会同步到父组件中所绑定。 .sync 它会被扩展为一个自动更新父组件属性的 v-on 监听器。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Vue 实现了一套内容分发的 API，将 slot 元素作为承载分发内容的出口。

示例源码如下，请查看 pre > code 标签中的内容

在 <componentA> 的模板中可能会写为：

示例源码如下，请查看 pre > code 标签中的内容

当组件渲染的时候，<slot></slot> 将会被替换为“Your Profile”。插槽内可以包含任何模板代码，包括 HTML ：

示例源码如下，请查看 pre > code 标签中的内容

如果 <componentA> 的 template 中没有包含一个 <slot> 元素，则该组件起始标签和结束标签之间的任何内容都会被抛弃。

示例源码如下，请查看 pre > code 标签中的内容

该插槽跟模板的其它地方一样可以访问相同的实例 property (也就是相同的“作用域”)，而不能访问 <navigation-link> 的作用域。例如 url 是访问不到的：

示例源码如下，请查看 pre > code 标签中的内容

记住规则：父级模板里的所有内容都是在父级作用域中编译的；子模板里的所有内容都是在子作用域中编译的。

有时为一个插槽设置具体的后备 (也就是默认的) 内容是很有用的，它只会在没有提供内容的时候被渲染。例如在一个 <submit-button> 组件中：

示例源码如下，请查看 pre > code 标签中的内容

我们可能希望这个 <button> 内绝大多数情况下都渲染文本“Submit”。为了将“Submit”作为后备内容，我们可以将它放在 <slot> 标签内：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要多个插槽时，可以利用 <slot> 元素的一个特殊的特性：name 来定义具名插槽

示例源码如下，请查看 pre > code 标签中的内容

注意： 不要使用 v-for 对 slot 进行循环处理，组件中多次出现相同 name 属性的 slot 会产生意料之外的问题。比如 <slot name='footer'> 出现一次以上在各家小程序中表现不同，合理的做法是传递不同 name 的 slot，或者在外层父组件进行循环，保证多端一致。

示例源码如下，请查看 pre > code 标签中的内容

现在 <template> 元素中的所有内容都将会被传入相应的插槽。任何没有被包裹在带有 v-slot 的 <template> 中的内容都会被视为默认插槽的内容。

v-slot 只能添加在 <template> 上

一个不带 name 的 <slot> 出口会带有隐含的名字 “default” 。

跟 v-on 和 v-bind 一样，v-slot 也有缩写，即把参数之前的所有内容 (v-slot:) 替换为字符 #。例如 v-slot:header 可以被重写为 #header ：

示例源码如下，请查看 pre > code 标签中的内容

在作用域插槽内，父组件可以拿到子组件的数据。子组件可以在 slot 标签上绑定属性值。

有时让插槽内容能够访问子组件中才有的数据是很有用的。

示例源码如下，请查看 pre > code 标签中的内容

我们可能想换掉默认内容，用名而非姓来显示。如下：

示例源码如下，请查看 pre > code 标签中的内容

然而上述代码不会正常工作，因为只有 <current-user> 组件可以访问到 user 而我们提供的内容是在父级渲染的。

为了让 user 在父级的插槽内容中可用，我们可以将 user 作为 <slot> 元素的一个 attribute 绑定上去：

示例源码如下，请查看 pre > code 标签中的内容

绑定在 <slot> 元素上的 attribute 被称为插槽 prop。现在在父级作用域中，我们可以使用带值的 v-slot 来定义我们提供的插槽 prop 的名字：

示例源码如下，请查看 pre > code 标签中的内容

在这个例子中，我们选择将包含所有插槽 prop 的对象命名为 slotProps ，但你也可以使用任意你喜欢的名字。

就像假定未指明的内容对应默认插槽一样，不带参数的 v-slot 被假定对应默认插槽：

示例源码如下，请查看 pre > code 标签中的内容

默认插槽的缩写语法不能和具名插槽混用，因为它会导致作用域不明确：

示例源码如下，请查看 pre > code 标签中的内容

只要出现多个插槽，请始终为所有的插槽使用完整的基于 <template> 的语法：

示例源码如下，请查看 pre > code 标签中的内容

作用域插槽的内部工作原理是将你的插槽内容包裹在一个拥有单个参数的函数里：

示例源码如下，请查看 pre > code 标签中的内容

这意味着 v-slot 的值实际上可以是任何能够作为函数定义中的参数的 JavaScript 表达式。 所以在支持的环境下 ( 单文件组件 或 现代浏览器 )，你也可以使用 ES2015 解构 来传入具体的插槽 prop，如下：

示例源码如下，请查看 pre > code 标签中的内容

这样可以使模板更简洁，尤其是在该插槽提供了多个 prop 的时候。它同样开启了 prop 重命名等其它可能，例如将 user 重命名为 person ：

示例源码如下，请查看 pre > code 标签中的内容

你甚至可以定义后备内容，用于插槽 prop 是 undefined 的情形：

示例源码如下，请查看 pre > code 标签中的内容

在 uni-app 中以下这些作为保留关键字，不可作为组件名。

**Examples:**

Example 1 (html):
```html
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 2 (html):
```html
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 3 (html):
```html
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

Example 4 (vue):
```vue
<template>
		<view>
			<view>{{userName}}</view>
		</view>
	</template>
	<script>
		export default {
			data() {
				return {
					"userName":"foo"
				}
			}
		}
	</script>
```

---

## TypeScript 支持 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/typescript-subject.html

**Contents:**
  - # TypeScript 支持
  - # 开发方式
  - # 修改 Typescript 配置
  - # TypeScript 支持兼容性说明
  - # ts组件
      - 本页导读

uni-app 支持使用 ts 开发，可参考 Vue.js TypeScript 支持 说明。

类型定义文件由 @dcloudio/types 模块提供，安装后请注意配置 tsconfig.json 文件中的 compilerOptions > types 部分，如需其他小程序平台类型定义也可以安装，如：miniprogram-api-typings、mini-types。对于缺少或者错误的类型定义，可以自行在本地新增或修改并同时报告给官方请求更新。

在 vue 或 nvue 页面的 script 节点，添加属性 lang="ts"

示例源码如下，请查看 pre > code 标签中的内容

如果需使用vue组件，则需要import Vue from 'vue'，具体见下

需要在创建项目时就指定ts，具体请另行参考文档

在根目录创建 tsconfig.json 文件，并进行个性化配置，推荐配置如下：

示例源码如下，请查看 pre > code 标签中的内容

个性化配置是可选的，没有tsconfig.json时会自动使用默认配置运行。

声明 lang="ts" 后，该 vue/nvue 文件 import 进来的所有 vue 组件，均需要使用 ts 编写。

示例源码如下，请查看 pre > code 标签中的内容

在 index.vue 中引用 uni-badge 组件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<script lang="ts">
// 这里编写ts代码
	let s:string = "123"
	console.log(s)
</script>
```

Example 2 (html):
```html
<script lang="ts">
// 这里编写ts代码
	let s:string = "123"
	console.log(s)
</script>
```

Example 3 (html):
```html
<script lang="ts">
// 这里编写ts代码
	let s:string = "123"
	console.log(s)
</script>
```

Example 4 (jsx):
```jsx
<script lang="ts">
// 这里编写ts代码
	let s:string = "123"
	console.log(s)
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/compiler-config.html

**Contents:**
      - 本页导读

你可以通过如下入口，对uni-app编译器进行配置：

在manifest.json中，你可以配置Vue的版本（Vue2/Vue3），以及发行H5平台路由模式，详见： manifest.json

在 vue.config.js 中可以修改 webpack 配置，包括环境变量，具体参考 vue-config.js。

在 vite.config.js 中可以修改 Vite 配置，包括环境变量，具体参考 vite.config.js。

在自定义条件编译平台时，可以在 package.json 文件的 env 节点下配置环境变量，具体参考 package.json

CLI 创建的项目中可以在根目录中放置 .env 文件来指定环境变量，具体参考：环境变量 。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-weixin.html

**Contents:**
  - # 开通
  - # 配置
  - # 使用微信登录
    - # 配置参数安全性问题
    - # 示例代码
      - 本页导读

此文档为App端登录说明，H5和小程序端详情

更多信息详见微信官方文档 移动应用微信登录开放指南

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“微信登录”：

示例源码如下，请查看 pre > code 标签中的内容

相关API文档： uni.login ，uni.request

示例源码如下，请查看 pre > code 标签中的内容

相关API文档： plus.oauth.getServices ，plus.oauth.AuthService

HarmonyOS 不支持配置 appsecret 参数，推荐使用 uniCloud 获取微信用户信息 获取 access_token 、获取微信用户信息

HBuilderX中配置的appsecret参数，云端打包后会保存在apk/ipa中，存在参数泄露的风险！HBuilderX3.4.18+ 不再提供此参数的可视化配置。

对于安全性要求较低的开发者，可以通过manifest.json -> 源码视图 -> app-plus -> distribute -> sdkConfigs -> oauth -> weixin -> 添加appsecret 配置。即可不经业务服务器验证完成登录：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
"queryScheme": ["weixin"]
```

Example 2 (json):
```json
"actions": [ "action.system.home", "wxentity.action.open" ]
```

Example 3 (json):
```json
uni.login({
	"provider": "weixin",
	"onlyAuthorize": true, // 微信登录仅请求授权认证
	success: function(event){
		const {code} = event
		//客户端成功获取授权临时票据（code）,向业务服务器发起登录请求。
		uni.request({
		    url: 'https://www.example.com/loginByWeixin', //仅为示例，并非真实接口地址。
		    data: {
		        code: event.code
		    },
		    success: (res) => {
		        //获得token完成登录
				uni.setStorageSync('token',res.token)
		    }
		});
	},
	fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
})
```

Example 4 (json):
```json
uni.login({
	"provider": "weixin",
	"onlyAuthorize": true, // 微信登录仅请求授权认证
	success: function(event){
		const {code} = event
		//客户端成功获取授权临时票据（code）,向业务服务器发起登录请求。
		uni.request({
		    url: 'https://www.example.com/loginByWeixin', //仅为示例，并非真实接口地址。
		    data: {
		        code: event.code
		    },
		    success: (res) => {
		        //获得token完成登录
				uni.setStorageSync('token',res.token)
		    }
		});
	},
	fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
})
```

---

## 开通 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-oauth-facebook

**Contents:**
  - # 开通
  - # 配置
  - # 使用Facebook登录
    - # 示例代码
      - 本页导读

更多信息详见 申请开通Facebook登录操作指南

打开项目的manifest.json文件，在“App模块配置”项的“OAuth(登录鉴权)”下，勾选“Facebook登录”：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 2 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 3 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

Example 4 (css):
```css
uni.login({
    provider: 'facebook',
    success: function (loginRes) {
        // 登录成功
        uni.getUserInfo({
            provider: 'facebook',
            success: function(info) {
                // 获取用户信息成功, info.authResult保存用户信息
            }
        })
    },
    fail: function (err) {
        // 登录授权失败
        // err.code是错误码
    }
});
```

---

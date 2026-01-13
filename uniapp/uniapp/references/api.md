# Uniapp - Api

**Pages:** 194

---

## 短视频内容联盟广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/a-d/content-page.html

**Contents:**
  - # 短视频内容联盟广告
      - 本页导读

⼀个视频内容频道，支持上下滑动切换视频内容

内容联盟广告是一个原生全屏组件，大小不可控制

如果需要嵌入到页面控制大小请使用 短视频内容联盟组件

---

## uni.onCompassChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/compass.html

**Contents:**
- # uni.onCompassChange(CALLBACK)
  - # onCompassChange 兼容性
- # uni.offCompassChange(CALLBACK)
  - # offCompassChange 兼容性
- # uni.startCompass(OBJECT)
  - # startCompass 兼容性
- # uni.stopCompass(OBJECT)
  - # stopCompass 兼容性
      - 本页导读

监听罗盘数据，频率：5次/秒，接口调用后会自动开始监听，可使用 uni.offCompassChange 取消监听。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.offCompassChange
```

Example 2 (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

Example 3 (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

Example 4 (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

---

## uni.setScreenBrightness(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/brightness

**Contents:**
  - # uni.setScreenBrightness(OBJECT)
  - # uni.getScreenBrightness(OBJECT)
  - # uni.setKeepScreenOn(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

Tips: 避免 onshow() 里使用 setScreenBrightness() , 亮度变化会再次触发 onShow() 造成死循环

示例源码如下，请查看 pre > code 标签中的内容

设置是否保持常亮状态。仅在当前应用生效，离开应用后设置失效。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

---

## uni.getLocation(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/location

**Contents:**
- # uni.getLocation(OBJECT)
  - # getLocation 兼容性
  - # 鸿蒙位置设置指南
- # uni.chooseLocation(OBJECT)
  - # chooseLocation 兼容性
- # 三方定位和地图服务收费说明
- # unicloud-city-select 城市选择组件
      - 本页导读

Web平台本API之前调用了腾讯地图的gcj02坐标免费转换接口，该接口从2024年7月18日起被腾讯逐步下线，导致老版本中本API无法使用。请立即升级到 uni-app 4.24版。

如果运行在微信浏览器中，可以使用微信的jssdk的定位能力。这个是微信向腾讯地图申请的key，开发者无需配置自己的key。

地图厂商的商业授权较贵，如需购买，请点击获取优惠 。

示例源码如下，请查看 pre > code 标签中的内容

这里介绍鸿蒙位置权限如何配置。将鸿蒙应用正常运行启动。在 HBuilderX 工程中找到

编辑 module.json5，在 requestPermissions 中添加下面代码

示例源码如下，请查看 pre > code 标签中的内容

这里的定位和模糊定位务必同时存在，否则会被上架驳回。在 api 可在 isHighAccuracy 属性中切换。

这里的 reason 值为 $string: 开头，不可直接中文字符，需要使用资源引用。编辑刚才复制的 harmony-config 目录中的 string.json，添加下面代码并改写 value。

示例源码如下，请查看 pre > code 标签中的内容

这里使用也可以放入 zh_CN 目录中，zh_CN > base 目录，细节可参考《鸿蒙 资源分类与访问 》

打开地图选择位置。chooseLocation会使用项目配置的地图服务商来展示地图，地图服务商支持情况参考：map组件。

Web平台和App平台，本API之前调用了腾讯地图的gcj02坐标免费，该接口从2024年7月18日起被腾讯逐步下线，导致老版本中本API无法使用。请立即升级到 uni-app 4.24版。

地图厂商的商业授权较贵，如需购买，请点击获取优惠 。

出于安全考虑，安卓、iOS端manifest.json内配置的 腾讯位置服务 Key 仅用来展示地图，uni.chooseLocation所依赖的地点搜索、逆地址解析功能需要通过uniCloud云对象uni-map-co 来调用，开发者可以通过安全网络来保障服务端api不被他人盗用。

鸿蒙平台由于暂不支持安全网络，所以chooseLocation依然使用manifest.json内配置的key来调用地点搜索、逆地址解析。

默认情况下，uni.chooseLocation不会使用安全网络请求uni-map-co。如果需要使用安全网络请求uni-map-co，需按如下步骤操作：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

若想要实现城市选择功能，可以使用 unicloud-city-select 城市选择组件。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-city-select

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-city-select.html

**Examples:**

Example 1 (unknown):
```unknown
uni-app 4.24版
```

Example 2 (unknown):
```unknown
uni.openLocation
```

Example 3 (javascript):
```javascript
uni.getLocation({
	type: 'wgs84',
	success: function (res) {
		console.log('当前位置的经度：' + res.longitude);
		console.log('当前位置的纬度：' + res.latitude);
	}
});
```

Example 4 (javascript):
```javascript
uni.getLocation({
	type: 'wgs84',
	success: function (res) {
		console.log('当前位置的经度：' + res.longitude);
		console.log('当前位置的纬度：' + res.latitude);
	}
});
```

---

## uni.scanCode(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/barcode.html

**Contents:**
- # uni.scanCode(OBJECT)
  - # scanCode 兼容性
      - 本页导读

调起客户端扫码界面，扫码成功后返回对应的结果。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
scanType的合法值
```

Example 2 (javascript):
```javascript
// 允许从相机和相册扫码
uni.scanCode({
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 只允许通过相机扫码
uni.scanCode({
	onlyFromCamera: true,
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 调起条码扫描
uni.scanCode({
	scanType: ['barCode'],
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});
```

Example 3 (javascript):
```javascript
// 允许从相机和相册扫码
uni.scanCode({
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 只允许通过相机扫码
uni.scanCode({
	onlyFromCamera: true,
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 调起条码扫描
uni.scanCode({
	scanType: ['barCode'],
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});
```

Example 4 (javascript):
```javascript
// 允许从相机和相册扫码
uni.scanCode({
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 只允许通过相机扫码
uni.scanCode({
	onlyFromCamera: true,
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 调起条码扫描
uni.scanCode({
	scanType: ['barCode'],
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/facialRecognitionVerify

**Contents:**
- # uni.getFacialRecognitionMetaInfo()
  - # getFacialRecognitionMetaInfo 兼容性
- # uni.startFacialRecognitionVerify(OBJECT)
  - # startFacialRecognitionVerify 兼容性
      - 本页导读

实人认证提供核验终端操作者的真实身份，包含活体检测和人脸对比等生物识别技术，可快速校验自然人的真实身份。

uni.getFacialRecognitionMetaInfo是客户端API，获取实人认证设备信息，用于uniCloud云函数getCertifyId 获取certifyId。

uni.startFacialRecognitionVerify是客户端API，在App端打开刷脸认证界面。

**Examples:**

Example 1 (php):
```php
工程根目录->build-profile.json5->app.products.buildOption.strictMode.caseSensitiveCheck
```

Example 2 (unknown):
```unknown
uni.getFacialRecognitionMetaInfo
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/report.html

**Contents:**
- # 统计
- # uni.report( eventKey , param)
- # 支持 uni.report 的 uni-ui 组件
- # 非官方自定义统计
  - # 微信小程序平台：
  - # 支付宝小程序平台：
  - # 百度小程序平台：
  - # 抖音小程序平台：
  - # QQ小程序平台：
  - # App平台的友盟统计：

从uni-app 2.2.3起，支持uni统计。一张报表，掌握全端数据。业务介绍详见https://tongji.dcloud.net.cn

自定义事件是统计中不可或缺的功能。开发者可通过本API自定义上报统计数据，如统计登录、注册、点击某个按钮，我们都可以称之为自定义事件。

示例源码如下，请查看 pre > code 标签中的内容

uni-ui 中内置了一些数据采集相关的组件,用户使用这些组件，并设置属性 stat:true，即可在使用相关组件时，自动上报相关自定义数据

除了官方的uni统计，如果开发者还需要调用小程序平台的自定义统计，给小程序的后台上报数据，那么需使用条件编译，在各端调用此自己的API。

**Examples:**

Example 1 (unknown):
```unknown
uni.login()
```

Example 2 (unknown):
```unknown
uni.report('login',{...})
```

Example 3 (unknown):
```unknown
uni.share()
```

Example 4 (unknown):
```unknown
onShareAppMessage
```

---

## uni.getSystemSetting() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/getsystemsetting.html

**Contents:**
- # uni.getSystemSetting()
  - # getSystemSetting 兼容性
  - # 返回值
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
bluetoothError
```

Example 2 (unknown):
```unknown
locationError
```

Example 3 (unknown):
```unknown
竖屏：portrait
```

Example 4 (unknown):
```unknown
横屏：landscape
```

---

## uni.loadFontFace(Object object) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/font.html

**Contents:**
- # uni.loadFontFace(Object object)
  - # 平台差异说明
  - # loadFontFace 兼容性
  - # 参数说明
  - # 代码示例
  - # Tips
- # uni.rpx2px()
- # uni.upx2px()
      - 本页导读

app-nvue 不支持本 api，而是使用 Weex 提供的 DOM.addRule 加载自定义字体，详见 。

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 中加载字体图标，详见 hello uni-app x 的 loadFontFace

将 rpx 单位值转换成 px。在 App 上暂不支持，可先使用 upx2px

示例源码如下，请查看 pre > code 标签中的内容

将 upx 单位值转换成 px。因 upx 已废弃，推荐使用 rpx。rpx 无需特殊 API 可直接使用。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

Example 2 (javascript):
```javascript
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

Example 3 (javascript):
```javascript
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

Example 4 (css):
```css
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

---

## uni.getWindowInfo() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/getWindowInfo.html

**Contents:**
- # uni.getWindowInfo()
  - # getWindowInfo 兼容性
  - # 返回值
      - 本页导读

**Examples:**

Example 1 (unknown):
```unknown
--window-top
```

Example 2 (unknown):
```unknown
--window-bottom
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/universal-links.html

**Contents:**
  - # 背景介绍：
  - # 第一步：开启Associated Domains服务
  - # 第二步骤 自动生成通用连接(Universal Links)
  - # 第三步：在第三方开放平台配置通用链接
    - # 微信
    - # QQ
    - # 微博
  - # 其他相关
    - # 云资源消耗说明
    - # 通用链接迁移指南

Universal Link是苹果在WWDC 2015上提出的iOS 9的新特性之一。此特性类似于深层链接，并能够方便地通过打开一个Https链接来直接启动您的客户端应用(手机有安装App)。对比以往所使用的URLSheme, 这种新特性在实现web-app的无缝链接时,能够提供极佳的用户体验。 使用前请阅读苹果官方文档 。

由于苹果iOS 13系统版本安全升级，微信SDK1.8.6版本要求支持Universal Links方式跳转，以便进行合法性校验，提升安全性。更多详情请参考微信官方说明

大白话：以前你的APP要打开其他APP是通过URLScheme 实现，后来苹果提出用Https链接来启动，手机上对应的app（已安装），更方便与web-app的无缝对接。微信响应了这个方案。所以大家开发的APP无论是微信登录、微信支付，还是微信分享等一切会跳转到微信，再跳回来的场景，需要提供这个链接。要不然你的应用打开了微信，微信就打不开你的应用。

如果不配置通用链接，使用新版本HX提交云端打包会失败，提示以下错误信息：

示例源码如下，请查看 pre > code 标签中的内容

其中需要注意的细节较多，且调试起来困难繁琐，困扰了大量开发者。

现在通过HBuilderX（3.1.9版起）云打包，支持自动生成apple-app-site-association文件，并自动托管到：自带cdn、ssl等服务的“免费”的云服务空间uniCloud的前端网页托管 ，自动完成manifest.json中的相关配置。用自动化技术替代了，如上所示传统方式令人苦恼的（2-5）4个步骤；只需如下三步直接搞定通用链接。

登录苹果开发者网站 ，在“Certificates, Identifiers & Profiles”页面选择“Identifiers”中选择对应的App ID，确保开启Associated Domains服务

开启Associated Domains服务后需要重新生成profile文件，提交云端打包时使用

HBuilderX (3.2.0 版本起) 新增QQ互联和新浪微博开放平台的通用链接的设置。以微信模块为例,QQ与微博与之类似。

打开项目的manifest.json文件，在“(App) SDK配置”项中的微信登录（微信分享、微信支付）下的“iOS平台通用链接（Universal Links）”中， 点击如图所示【自动生成】

打开微信开放平台 ，在“管理中心”页面的“移动应用”下找到已经申请的应用（没有申请应用请点击“创建移动应用”新建应用），点击“查看”打开应用详情页面。 在“开发信息”栏后点击修改，在“iOS应用”下的“Universal Links”项中配置应用的通用链接，如下图所示：

打开QQ开放平台 ，在“管理中心”页面的“移动应用”下找到已经申请的应用（没有申请应用请点击“创建移动应用”新建应用），点击“查看”打开应用详情页面。 在“开发信息”栏后点击修改，在“iOS应用”下的“Universal Links”项中配置应用的通用链接，如下图所示：

打开微博开放平台 ，在“我的应用”下找到已经申请的应用，点击“查看”打开应用详情页面。 在“应用信息”栏后点击修改，在“iOS应用”下的“Universal Links”项中配置应用的通用链接，如下图所示：

至此，就已经完成了通用链接的配置全过程，云打包后生效。

托管通用链接所资源消耗的云服务器资源量非常小，文件小于0.5kb，仅你的iOS版App在：安装、登录、分享、支付时才会被联网请求（且设备会缓存通用链接的文件内容，缓存有效期内不会再次联网请求）。而阿里云正式版-开发者版（免费版）的前端网页托管，免费额度为：1GB/月；普通项目的服务空间，如果仅托管“通用链接”使用免费版也够用。

阿里云公测版即将下线，需要将通用链接文件迁移到新的正式版服务空间的用户参考以下步骤：

uniCloud阿里云正式版-付费版，支持“一键迁移”（即将上线）可省略步骤3和4

在uniCloud web控制台 打开旧的服务空间 -> 前端网页托管 -> 参数配置 -> 域名信息 配置网站域名 -> 点击删除

在uniCloud web控制台 打开新服务空间 -> 前端网页托管 -> 参数配置 -> 域名信息 配置网站域名 -> 添加域名(添加后CNAME的值不会马上出现，需要过一会后点击右上角的刷新按钮，直至出现) -> 解析域名

在HBuilderX中点击项目的 manifest.json -> App模块配置 OAuth（登录鉴权）-> 微信登录（其他模块同理），点击自动生成 -> 选择“新开通的服务空间“ -> 下一步 -> 自定义域名 -> 完成

直接提交云打包即可。注意：提交云打包，只是为了触发：“生成新的通用文件并自动部署到新服务空间”，用户的客户端无需更新。

可通过5+ API的plus.runtime.launcher判断应用启动来源，如果其值为"uniLink"则表示通过通用链接启动应。这时可通过5+ API的plus.runtime.arguments获取启动参数，通用链接启动的情况将返回完整的通用链接地址。 例：HBuilderX中自带的默认真机运行基座HBuilderX注册的通用链接:https://demo.dcloud.net.cn/ulink/

如果你是本地离线打包或者由于某种原因你需要用传统的方式：私有化部署服务器来托管apple-app-site-association文件创建通用链接。你仍然可以通过手动配置manifest.json实现。详情：https://ask.dcloud.net.cn/article/36393#unilink

1.为什么我打开通用链接提示：The requested file was not found on this server.

这是正常现象。通用链接并不要求是一个有效的路径，换句话说这个链接指向的目录允许为空。原理是访问这个链接时，iphone检测到当前域名为通用链接对应的域名，就读取域名服务器下的apple-app-site-association，然后根据域名后面的路径名称，验证并解析出要打开的app包名并唤醒对应的app。

2.如何验证通用链接已经生效，有什么表现或者测试方案

你可以将通用链接输入到iphone自带Safari浏览器中，下拉即可看到通用链接对应到应用名称和一个打开按钮，点击按钮即可直接在浏览器打开对应的APP。详情：点此查看演示视频

3.使用微信登录、分享、支付等功能时，用户非首次调起微信，仍然出现二次跳转app

微信SDK要求通用链接apple-app-site-association文件中 path不能带query参数，且末尾必须添加通配符*号。如下:

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
Error code = -5000
Error message:
Error: not set parameter 'UniversalLinks' @'oauth-weixin'
```

Example 2 (javascript):
```javascript
Error code = -5000
Error message:
Error: not set parameter 'UniversalLinks' @'oauth-weixin'
```

Example 3 (javascript):
```javascript
Error code = -5000
Error message:
Error: not set parameter 'UniversalLinks' @'oauth-weixin'
```

Example 4 (yaml):
```yaml
Error code = -5000
Error message:
Error: not set parameter 'UniversalLinks' @'oauth-weixin'
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/media-query-observer.html

**Contents:**
- # uni.createMediaQueryObserver([this])
- # MediaQueryObserver 对象的方法列表
- # 代码示例
      - 本页导读

MediaQueryObserver 对象，用于监听页面 media query 状态的变化，如界面的宽高是不是在某个指定的范围内。

创建并返回一个 MediaQueryObserver 对象实例。

自定义组件实例。小程序端不支持此参数，传入仅为抹平写法差异

注意：支付宝小程序、qq小程序、百度小程序、抖音小程序，暂不支持监听屏幕动态改变，即只执行一次媒体查询。

tips: 和 UI 相关的 api 在组件 mounted 后执行

以下示例代码，推荐使用HBuilderX，新建uni-app项目，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
MediaQueryObserver
```

Example 2 (vue):
```vue
<template>
    <view class="content">
        <view class="">
            要求页面最小宽度 375px， 且页面宽度最大 500px，是否匹配: {{matches}}
        </view>
        <view>
            要求屏幕方向为纵向，是否匹配: {{landscape}}
        </view>
    </view>
</template>

<script>
    let landscapeOb
    export default {
        data() {
            return {
                matches: false,
                landscape: false,
                mediaQueryOb: null
            }
        },
        onLoad() {

        },

        // 和 UI 相关的 api 在组件 mountd 后执行
        mounted() {
            this.testMediaQueryObserver()
            this.landscapeObserver()
        },

        methods: {
            testMediaQueryObserver() {
                this.mediaQueryOb = uni.createMediaQueryObserver(this)

                this.mediaQueryOb.observe({
                    minWidth: 375,  //页面最小宽度 375px
                    maxWidth: 500  //页面宽度最大 500px
                }, matches => {
                    this.matches = matches;
                })
            },
            landscapeObserver() {
                landscapeOb = uni.createMediaQueryObserver(this)
                landscapeOb.observe({
                    orientation: 'landscape'  //屏幕方向为纵向
                }, matches => {
                        this.landscape = matches
                })
            },
            destroyed () {
                this.mediaQueryOb.disconnect()  //组件销毁时停止监听
                landscapeOb.disconnect()
            }
        }
    }
</script>

<style>
    .content {
        text-align: center;
        height: 400upx;
    }
</style>
```

Example 3 (vue):
```vue
<template>
    <view class="content">
        <view class="">
            要求页面最小宽度 375px， 且页面宽度最大 500px，是否匹配: {{matches}}
        </view>
        <view>
            要求屏幕方向为纵向，是否匹配: {{landscape}}
        </view>
    </view>
</template>

<script>
    let landscapeOb
    export default {
        data() {
            return {
                matches: false,
                landscape: false,
                mediaQueryOb: null
            }
        },
        onLoad() {

        },

        // 和 UI 相关的 api 在组件 mountd 后执行
        mounted() {
            this.testMediaQueryObserver()
            this.landscapeObserver()
        },

        methods: {
            testMediaQueryObserver() {
                this.mediaQueryOb = uni.createMediaQueryObserver(this)

                this.mediaQueryOb.observe({
                    minWidth: 375,  //页面最小宽度 375px
                    maxWidth: 500  //页面宽度最大 500px
                }, matches => {
                    this.matches = matches;
                })
            },
            landscapeObserver() {
                landscapeOb = uni.createMediaQueryObserver(this)
                landscapeOb.observe({
                    orientation: 'landscape'  //屏幕方向为纵向
                }, matches => {
                        this.landscape = matches
                })
            },
            destroyed () {
                this.mediaQueryOb.disconnect()  //组件销毁时停止监听
                landscapeOb.disconnect()
            }
        }
    }
</script>

<style>
    .content {
        text-align: center;
        height: 400upx;
    }
</style>
```

Example 4 (vue):
```vue
<template>
    <view class="content">
        <view class="">
            要求页面最小宽度 375px， 且页面宽度最大 500px，是否匹配: {{matches}}
        </view>
        <view>
            要求屏幕方向为纵向，是否匹配: {{landscape}}
        </view>
    </view>
</template>

<script>
    let landscapeOb
    export default {
        data() {
            return {
                matches: false,
                landscape: false,
                mediaQueryOb: null
            }
        },
        onLoad() {

        },

        // 和 UI 相关的 api 在组件 mountd 后执行
        mounted() {
            this.testMediaQueryObserver()
            this.landscapeObserver()
        },

        methods: {
            testMediaQueryObserver() {
                this.mediaQueryOb = uni.createMediaQueryObserver(this)

                this.mediaQueryOb.observe({
                    minWidth: 375,  //页面最小宽度 375px
                    maxWidth: 500  //页面宽度最大 500px
                }, matches => {
                    this.matches = matches;
                })
            },
            landscapeObserver() {
                landscapeOb = uni.createMediaQueryObserver(this)
                landscapeOb.observe({
                    orientation: 'landscape'  //屏幕方向为纵向
                }, matches => {
                        this.landscape = matches
                })
            },
            destroyed () {
                this.mediaQueryOb.disconnect()  //组件销毁时停止监听
                landscapeOb.disconnect()
            }
        }
    }
</script>

<style>
    .content {
        text-align: center;
        height: 400upx;
    }
</style>
```

---

## uni.uploadFile(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/network-file

**Contents:**
- # uni.uploadFile(OBJECT)
  - # uploadFile 兼容性
  - # 返回值
    - # UploadTask 的方法
    - # abort(): void,
      - # abort 兼容性
    - # onProgressUpdate(callback: UploadFileProgressUpdateCallback): void,
      - # onProgressUpdate 兼容性
      - # 参数 HarmonyOS 兼容性
      - # OnProgressUpdateResult 的属性值

将本地资源上传到开发者服务器，客户端发起一个 POST 请求，其中 content-type 为 multipart/form-data。 如页面通过 uni.chooseImage 等接口获取到一个本地资源的临时文件路径后，可通过此接口将本地资源上传到指定服务器。另外选择和上传非图像、视频文件参考：https://ask.dcloud.net.cn/article/35547 。

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。

推荐开发者上传到uniCloud，uniCloud提供了免费CDN和更好的易用性，包括安全的cdn直传。

files 参数是一个 file 对象的数组，file 对象的结构如下：

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 uploadTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

通过 uploadTask，可监听上传进度变化事件，以及取消上传任务。

onProgressUpdate 返回参数说明

onProgressUpdate 监听上传进度变化。

示例源码如下，请查看 pre > code 标签中的内容

下载文件资源到本地，客户端直接发起一个 HTTP GET 请求，返回文件的本地临时路径。

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。在h5上是跨域的，用户需要处理好跨域问题。

注：文件的临时路径，在应用本次启动期间可以正常使用，如需持久保存，需在主动调用 uni.saveFile，才能在应用下次启动时访问得到。

onProgressUpdate 监听下载进度变化。

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 downloadTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

通过 downloadTask，可监听下载进度变化事件，以及取消下载任务。

onProgressUpdate 返回参数说明

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
content-type
```

Example 2 (unknown):
```unknown
multipart/form-data
```

Example 3 (unknown):
```unknown
manifest.json
```

Example 4 (javascript):
```javascript
uni.chooseImage({
	success: (chooseImageRes) => {
		const tempFilePaths = chooseImageRes.tempFilePaths;
		uni.uploadFile({
			url: 'https://www.example.com/upload', //仅为示例，非真实的接口地址
			filePath: tempFilePaths[0],
			name: 'file',
			formData: {
				'user': 'test'
			},
			success: (uploadFileRes) => {
				console.log(uploadFileRes.data);
			}
		});
	}
});
```

---

## CanvasContext | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/CanvasContext

**Contents:**
- # CanvasContext
- # CanvasContext.fillStyle string
- # CanvasContext.strokeStyle string
- # CanvasContext.shadowOffsetX number
- # CanvasContext.shadowOffsetY number
- # CanvasContext.shadowColor number
- # CanvasContext.shadowBlur number
- # CanvasContext.lineWidth number
- # CanvasContext.lineCap number
- # CanvasContext.lineJoin number

App-nvue下如需使用canvas，暂未封装为uni API，可参考文档 使用。

填充颜色。用法同 CanvasContext.setFillStyle()。

边框颜色。用法同 CanvasContext.setStrokeStyle()。

线条的宽度。用法同 CanvasContext.setLineWidth()。

线条的端点样式。用法同 CanvasContext.setLineCap()。

线条的交点样式。用法同 CanvasContext.setLineJoin()。

最大斜接长度。用法同 CanvasContext.setMiterLimit()。

当前字体样式的属性。符合 CSS font 语法 的 DOMString 字符串，至少需要提供字体大小和字体族名。默认值为 10px sans-serif。

全局画笔透明度。范围 0-1，0 表示完全透明，1 表示完全不透明。

在绘制新形状时应用的合成操作的类型。目前安卓版本只适用于 fill 填充块的合成，用于 stroke 线段的合成效果都是 source-over。

画一条弧线。创建一个圆可以用 arc() 方法指定起始弧度为0，终止弧度为 2 * Math.PI。用 stroke() 或者 fill() 方法来在 canvas 中画弧线。

示例源码如下，请查看 pre > code 标签中的内容

针对 arc(100, 75, 50, 0, 1.5 * Math.PI)的三个关键坐标如下：

示例源码如下，请查看 pre > code 标签中的内容

开始创建一个路径，需要调用fill或者stroke才会使用路径进行填充或描边。

Tip: 在最开始的时候相当于调用了一次 beginPath()。 Tip: 同一个路径内的多次setFillStyle()、setStrokeStyle()、setLineWidth()等设置，以最后一次设置为准。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

针对 moveTo(20, 20) bezierCurveTo(20, 100, 200, 100, 200, 20) 的三个关键坐标如下：

clearRect 并非画一个白色的矩形在地址区域，而是清空，为了有直观感受，对 canvas 加了一层背景色。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

从原始画布中剪切任意形状和尺寸。一旦剪切了某个区域，则所有之后的绘图都会被限制在被剪切的区域内（不能访问画布上的其他区域）。可以在使用 clip() 方法前通过使用 save() 方法对当前画布区域进行保存，并在以后的任意时间对其进行恢复（通过 restore() 方法）。

Tip: 用 setFillStroke() 设置矩形线条的颜色，如果没设置默认是黑色。

示例源码如下，请查看 pre > code 标签中的内容

Tip: 关闭路径会连接起点和终点。 Tip: 如果关闭路径后没有调用 fill() 或者 stroke() 并开启了新的路径，那之前的路径将不会被渲染。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

创建一个从圆心开始的渐变。返回的 CanvasGradient 对象，需要使用 CanvasGradient.addColorStop() 来指定渐变点，至少要两个。

示例源码如下，请查看 pre > code 标签中的内容

创建一个线性的渐变颜色。返回的 CanvasGradient 对象，需要使用 CanvasGradient.addColorStop() 来指定渐变点，至少要两个。

示例源码如下，请查看 pre > code 标签中的内容

对指定的图像创建模式的方法，可在指定的方向上重复元图像

示例源码如下，请查看 pre > code 标签中的内容

将之前在绘图上下文中的描述（路径、变形、样式）画到 canvas 中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对当前路径中的内容进行填充。默认的填充色为黑色。

Tip: 如果当前路径没有闭合，fill() 方法会将起点和终点进行连接，然后填充，详情见例一。

Tip: fill() 填充的的路径是从 beginPath() 开始计算，但是不会将 fillRect() 包含进去，详情见例二。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Tip: 用 setFillStyle() 设置矩形的填充色，如果没设置默认是黑色。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

增加一个新点，然后创建一条从上次指定点到目标点的线。

Tip: 用 stroke() 方法来画线条

示例源码如下，请查看 pre > code 标签中的内容

该方法在 HarmonyOS Next 设备上是异步，需要传入回调函数获取文本尺寸信息。

测量文本尺寸信息，目前仅返回文本宽度。同步接口。（App 端 2.8.12+ 支持）

返回 TextMetrics 对象，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

把路径移动到画布中的指定点，不创建线条。用 stroke() 方法来画线条。

示例源码如下，请查看 pre > code 标签中的内容

创建二次贝塞尔曲线路径。曲线的起始点为路径中前一个点。

示例源码如下，请查看 pre > code 标签中的内容

针对 moveTo(20, 20) quadraticCurveTo(20, 100, 200, 20) 的三个关键坐标如下：

Tip: 用 fill() 或者 stroke() 方法将矩形真正的画到 canvas 中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以原点为中心，原点可以用 translate方法修改。顺时针旋转当前坐标轴。多次调用rotate，旋转的角度会叠加。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在调用scale方法后，之后创建的路径其横纵坐标会被缩放。多次调用scale，倍数会相乘。

示例源码如下，请查看 pre > code 标签中的内容

设置填充色，如果没有设置 fillStyle，默认颜色为 black。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置最大斜接长度，斜接长度指的是在两条线交汇处内角和外角之间的距离。 当 setLineJoin() 为 miter 时才有效。超过最大倾斜长度的，连接处将以 lineJoin 为 bevel 来显示。

示例源码如下，请查看 pre > code 标签中的内容

设置阴影样式。如果没有设置，offsetX 默认值为0， offsetY 默认值为0， blur 默认值为0，color 默认值为 black。

示例源码如下，请查看 pre > code 标签中的内容

设置边框颜色。如果没有设置 fillStyle，默认颜色为 black。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Tip: stroke() 描绘的的路径是从 beginPath() 开始计算，但是不会将 strokeRect() 包含进去，详情见例二。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

画一个矩形(非填充)。用 setFillStroke() 设置边框颜色，如果没设置默认是黑色。

示例源码如下，请查看 pre > code 标签中的内容

给定的 (x, y) 位置绘制文本描边的方法

示例源码如下，请查看 pre > code 标签中的内容

对当前坐标系的原点(0, 0)进行变换，默认的坐标系原点为页面左上角。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
source-over
```

Example 2 (unknown):
```unknown
2 * Math.PI
```

Example 3 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Draw coordinates
ctx.arc(100, 75, 50, 0, 2 * Math.PI)
ctx.setFillStyle('#EEEEEE')
ctx.fill()

ctx.beginPath()
ctx.moveTo(40, 75)
ctx.lineTo(160, 75)
ctx.moveTo(100, 15)
ctx.lineTo(100, 135)
ctx.setStrokeStyle('#AAAAAA')
ctx.stroke()

ctx.setFontSize(12)
ctx.setFillStyle('black')
ctx.fillText('0', 165, 78)
ctx.fillText('0.5*PI', 83, 145)
ctx.fillText('1*PI', 15, 78)
ctx.fillText('1.5*PI', 83, 10)

// Draw points
ctx.beginPath()
ctx.arc(100, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('lightgreen')
ctx.fill()

ctx.beginPath()
ctx.arc(100, 25, 2, 0, 2 * Math.PI)
ctx.setFillStyle('blue')
ctx.fill()

ctx.beginPath()
ctx.arc(150, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('red')
ctx.fill()

// Draw arc
ctx.beginPath()
ctx.arc(100, 75, 50, 0, 1.5 * Math.PI)
ctx.setStrokeStyle('#333333')
ctx.stroke()

ctx.draw()
```

Example 4 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Draw coordinates
ctx.arc(100, 75, 50, 0, 2 * Math.PI)
ctx.setFillStyle('#EEEEEE')
ctx.fill()

ctx.beginPath()
ctx.moveTo(40, 75)
ctx.lineTo(160, 75)
ctx.moveTo(100, 15)
ctx.lineTo(100, 135)
ctx.setStrokeStyle('#AAAAAA')
ctx.stroke()

ctx.setFontSize(12)
ctx.setFillStyle('black')
ctx.fillText('0', 165, 78)
ctx.fillText('0.5*PI', 83, 145)
ctx.fillText('1*PI', 15, 78)
ctx.fillText('1.5*PI', 83, 10)

// Draw points
ctx.beginPath()
ctx.arc(100, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('lightgreen')
ctx.fill()

ctx.beginPath()
ctx.arc(100, 25, 2, 0, 2 * Math.PI)
ctx.setFillStyle('blue')
ctx.fill()

ctx.beginPath()
ctx.arc(150, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('red')
ctx.fill()

// Draw arc
ctx.beginPath()
ctx.arc(100, 75, 50, 0, 1.5 * Math.PI)
ctx.setStrokeStyle('#333333')
ctx.stroke()

ctx.draw()
```

---

## uni.showToast(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/prompt

**Contents:**
- # uni.showToast(OBJECT)
  - # showToast 兼容性
- # uni.hideToast()
  - # hideToast 兼容性
- # uni.showLoading(OBJECT)
  - # showLoading 兼容性
- # uni.hideLoading()
  - # hideLoading 兼容性
- # uni.showModal(OBJECT)
  - # showModal 兼容性

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

显示 loading 提示框, 需主动调用 uni.hideLoading 才能关闭提示框。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

显示模态弹窗，可以只有一个确定按钮，也可以同时有确定和取消按钮。类似于一个API整合了 html 中：alert、confirm。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.showToast({
	title: '标题',
	duration: 2000
});
```

Example 2 (javascript):
```javascript
uni.showToast({
	title: '标题',
	duration: 2000
});
```

Example 3 (javascript):
```javascript
uni.showToast({
	title: '标题',
	duration: 2000
});
```

Example 4 (css):
```css
uni.showToast({
	title: '标题',
	duration: 2000
});
```

---

## uni.requestMerchantTransfer(options) @requestmerchanttransfer | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/request-merchant-transfer.html

**Contents:**
- # uni.requestMerchantTransfer(options)
  - # 参数 HarmonyOS 兼容性
    - # RequestMerchantTransferGeneralCallbackResult 的属性值
      - 本页导读

商家转账用户确认模式下，拉起页面请求用户确认收款

本 API 是 uni ext api ，需下载插件：uni-requestMerchantTransfer

uni.requestMerchantTransfer 是​商家转账到用户零钱的API，适用于需要向用户直接发放资金（如提现、奖励发放、活动返现）的场景。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/media-query-observer

**Contents:**
- # uni.createMediaQueryObserver([this])
- # MediaQueryObserver 对象的方法列表
- # 代码示例
      - 本页导读

MediaQueryObserver 对象，用于监听页面 media query 状态的变化，如界面的宽高是不是在某个指定的范围内。

创建并返回一个 MediaQueryObserver 对象实例。

自定义组件实例。小程序端不支持此参数，传入仅为抹平写法差异

注意：支付宝小程序、qq小程序、百度小程序、抖音小程序，暂不支持监听屏幕动态改变，即只执行一次媒体查询。

tips: 和 UI 相关的 api 在组件 mounted 后执行

以下示例代码，推荐使用HBuilderX，新建uni-app项目，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
MediaQueryObserver
```

Example 2 (vue):
```vue
<template>
    <view class="content">
        <view class="">
            要求页面最小宽度 375px， 且页面宽度最大 500px，是否匹配: {{matches}}
        </view>
        <view>
            要求屏幕方向为纵向，是否匹配: {{landscape}}
        </view>
    </view>
</template>

<script>
    let landscapeOb
    export default {
        data() {
            return {
                matches: false,
                landscape: false,
                mediaQueryOb: null
            }
        },
        onLoad() {

        },

        // 和 UI 相关的 api 在组件 mountd 后执行
        mounted() {
            this.testMediaQueryObserver()
            this.landscapeObserver()
        },

        methods: {
            testMediaQueryObserver() {
                this.mediaQueryOb = uni.createMediaQueryObserver(this)

                this.mediaQueryOb.observe({
                    minWidth: 375,  //页面最小宽度 375px
                    maxWidth: 500  //页面宽度最大 500px
                }, matches => {
                    this.matches = matches;
                })
            },
            landscapeObserver() {
                landscapeOb = uni.createMediaQueryObserver(this)
                landscapeOb.observe({
                    orientation: 'landscape'  //屏幕方向为纵向
                }, matches => {
                        this.landscape = matches
                })
            },
            destroyed () {
                this.mediaQueryOb.disconnect()  //组件销毁时停止监听
                landscapeOb.disconnect()
            }
        }
    }
</script>

<style>
    .content {
        text-align: center;
        height: 400upx;
    }
</style>
```

Example 3 (vue):
```vue
<template>
    <view class="content">
        <view class="">
            要求页面最小宽度 375px， 且页面宽度最大 500px，是否匹配: {{matches}}
        </view>
        <view>
            要求屏幕方向为纵向，是否匹配: {{landscape}}
        </view>
    </view>
</template>

<script>
    let landscapeOb
    export default {
        data() {
            return {
                matches: false,
                landscape: false,
                mediaQueryOb: null
            }
        },
        onLoad() {

        },

        // 和 UI 相关的 api 在组件 mountd 后执行
        mounted() {
            this.testMediaQueryObserver()
            this.landscapeObserver()
        },

        methods: {
            testMediaQueryObserver() {
                this.mediaQueryOb = uni.createMediaQueryObserver(this)

                this.mediaQueryOb.observe({
                    minWidth: 375,  //页面最小宽度 375px
                    maxWidth: 500  //页面宽度最大 500px
                }, matches => {
                    this.matches = matches;
                })
            },
            landscapeObserver() {
                landscapeOb = uni.createMediaQueryObserver(this)
                landscapeOb.observe({
                    orientation: 'landscape'  //屏幕方向为纵向
                }, matches => {
                        this.landscape = matches
                })
            },
            destroyed () {
                this.mediaQueryOb.disconnect()  //组件销毁时停止监听
                landscapeOb.disconnect()
            }
        }
    }
</script>

<style>
    .content {
        text-align: center;
        height: 400upx;
    }
</style>
```

Example 4 (vue):
```vue
<template>
    <view class="content">
        <view class="">
            要求页面最小宽度 375px， 且页面宽度最大 500px，是否匹配: {{matches}}
        </view>
        <view>
            要求屏幕方向为纵向，是否匹配: {{landscape}}
        </view>
    </view>
</template>

<script>
    let landscapeOb
    export default {
        data() {
            return {
                matches: false,
                landscape: false,
                mediaQueryOb: null
            }
        },
        onLoad() {

        },

        // 和 UI 相关的 api 在组件 mountd 后执行
        mounted() {
            this.testMediaQueryObserver()
            this.landscapeObserver()
        },

        methods: {
            testMediaQueryObserver() {
                this.mediaQueryOb = uni.createMediaQueryObserver(this)

                this.mediaQueryOb.observe({
                    minWidth: 375,  //页面最小宽度 375px
                    maxWidth: 500  //页面宽度最大 500px
                }, matches => {
                    this.matches = matches;
                })
            },
            landscapeObserver() {
                landscapeOb = uni.createMediaQueryObserver(this)
                landscapeOb.observe({
                    orientation: 'landscape'  //屏幕方向为纵向
                }, matches => {
                        this.landscape = matches
                })
            },
            destroyed () {
                this.mediaQueryOb.disconnect()  //组件销毁时停止监听
                landscapeOb.disconnect()
            }
        }
    }
</script>

<style>
    .content {
        text-align: center;
        height: 400upx;
    }
</style>
```

---

## uni.openAppAuthorizeSetting() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/openappauthorizesetting.html

**Contents:**
- # uni.openAppAuthorizeSetting()
  - # openAppAuthorizeSetting 兼容性
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.openAppAuthorizeSetting({
  success (res) {
    console.log(res)
  }
})
```

Example 2 (javascript):
```javascript
uni.openAppAuthorizeSetting({
  success (res) {
    console.log(res)
  }
})
```

Example 3 (javascript):
```javascript
uni.openAppAuthorizeSetting({
  success (res) {
    console.log(res)
  }
})
```

Example 4 (javascript):
```javascript
uni.openAppAuthorizeSetting({
  success (res) {
    console.log(res)
  }
})
```

---

## 定时器 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/timer

**Contents:**
- # 定时器
- # setTimeout(callback, delay, rest)
- # clearTimeout(timeoutID)
  - # 最佳实践
- # setInterval(callback, delay, rest)
- # clearInterval(intervalID)
  - # 最佳实践
- # 注意事项
      - 本页导读

设定一个定时器。在定时到期以后执行注册的回调函数

取消由 setTimeout 设置的定时器。

定时器应当在组件、页面销毁时候取消，否则该定时器将成为游离定时器，无法被回收销毁。

示例源码如下，请查看 pre > code 标签中的内容

设定一个定时器。按照指定的周期（以毫秒计）来执行注册的回调函数

示例源码如下，请查看 pre > code 标签中的内容

取消由 setInterval 设置的定时器。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

Example 2 (html):
```html
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

Example 3 (html):
```html
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

Example 4 (vue):
```vue
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/image

**Contents:**
- # uni.chooseImage(OBJECT)
  - # chooseImage 兼容性
- # uni.previewImage(OBJECT)
  - # previewImage 兼容性
- # uni.closePreviewImage(OBJECT)
  - # closePreviewImage 兼容性
- # uni.getImageInfo(OBJECT)
  - # getImageInfo 兼容性
- # uni.saveImageToPhotosAlbum(OBJECT)
  - # saveImageToPhotosAlbum 兼容性

图片需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

App端如需要更丰富的相机拍照API（如直接调用前置摄像头），参考plus.camera

微信小程序从基础库 2.21.0 开始， wx.chooseImage 停止维护，请使用 uni.chooseMedia 代替。

注：文件的临时路径，在应用本次启动期间可以正常使用，如需持久保存，需在主动调用 uni.saveFile，在应用下次启动时才能访问得到。

示例源码如下，请查看 pre > code 标签中的内容

1.9.5+ 支持传图片在 urls 中的索引值

current 为当前显示图片的链接/索引值，不填或填写的值无效则为 urls 的第一张。App平台在 1.9.5至1.9.8之间，current为必填。不填会报错

注意，当 urls 中有重复的图片链接时：

一组图片 [A, B1, C, B2, D]，其中 B1 与 B2 的图片链接是一样的。

longPressActions 参数说明

示例源码如下，请查看 pre > code 标签中的内容

小程序下获取网络图片信息需先配置download域名白名单才能生效。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

Example 2 (javascript):
```javascript
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

Example 3 (javascript):
```javascript
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

Example 4 (css):
```css
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/ibeacon

**Contents:**
- # uni.onBeaconServiceChange(CALLBACK)
- # uni.onBeaconUpdate(CALLBACK)
- # uni.getBeacons(OBJECT)
  - # 错误
- # uni.startBeaconDiscovery(OBJECT)
  - # 错误
  - # 示例代码
- # uni.stopBeaconDiscovery(OBJECT)
  - # 错误
- # IBeaconInfo

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

Example 2 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

Example 3 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

Example 4 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

---

## 分享 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/share

**Contents:**
- # 分享
- # uni.share(OBJECT)
  - # 分享到微信聊天界面示例代码
  - # 分享到微信朋友圈示例代码
  - # uni.share 在App端各社交平台分享配置说明
    - # 微信分享
    - # 新浪微博分享
    - # QQ 分享
    - # FAQ
- # uni.shareWithSystem(OBJECT)

在不同平台，分享的调用方式和逻辑有较大差异。

uni-app的App引擎已经封装了微信、QQ、微博的分享SDK，开发者可以直接调用相关功能。

可以分享到微信、QQ、微博，每个社交平台被称为分享服务提供商，即provider。

可以分享文字、图片、图文横条、音乐、视频等多种形式。同时注意，分享为小程序也使用本API。即在App里可以通过本API把一个内容以小程序（通常为内容页）方式直接分享给微信好友。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

href、imageUrl 为必选参数，title/summary 二选一，最好将这四个参数都选上。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

href、imageUrl 为必选参数，title、summary 至少有一项。

示例源码如下，请查看 pre > code 标签中的内容

App分享为微信小程序（App中分享一个内容到微信好友，对方微信中呈现的是一个小程序卡片）

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json 的 App SDK 配置里，勾选微信消息及朋友圈，并填写 appid，如需在iOS平台使用还需要配置通用链接。

在 manifest.json 的 App SDK 配置里，勾选勾选新浪微博，并填写相关appkey，新浪微博 appkey 申请步骤可参考：https://ask.dcloud.net.cn/article/209 。

在 manifest.json 的 App SDK 配置里，勾选分享到QQ好友，并填写相关appkey，QQ分享 appkey 申请步骤：

这些配置需要打包生效，真机运行仍然是HBuilder基座的设置，可使用自定义基座包 调试。离线打包请参考离线打包文档在原生工程中配置。

配置并打包后，通过uni.getProvider可以得到配置的结果列表，注意这里返回的是manifest配置的，与手机端是否安装微信、QQ、微博无关。

如果手机端未安装QQ、微博，调用时会启动这些平台的wap页面分享，如果已安装相应客户端，会启动它们的客户端分享。

Q：App端如何集成其他分享SDK，如facebook分享、twitter分享

A：插件市场已有相关插件，详见 ；也可以根据原生插件教程自行开发，原生插件开发文档见https://ask.dcloud.net.cn/article/35428

A：插件市场有很多封装好的分享菜单插件，底部图标菜单 ，可直接弹出菜单，并且没有遮挡层级问题，推荐使用。

调用系统分享组件发送分享消息，不需要配置分享SDK

示例源码如下，请查看 pre > code 标签中的内容

小程序中用户点击分享后，在 js 中定义 onShareAppMessage 处理函数（和 onLoad 等生命周期函数同级），设置该页面的分享信息。

微信小程序平台的分享管理比较严格，请参考 小程序分享指引 。

此事件需要 return 一个 Object，用于自定义分享内容，其内容如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.shareWithSystem
```

Example 2 (unknown):
```unknown
openCustomerServiceChat = true
```

Example 3 (unknown):
```unknown
openCustomerServiceChat = true
```

Example 4 (javascript):
```javascript
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

## uni.preloadPage(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/preload-page

**Contents:**
- # uni.preloadPage(OBJECT)
  - # H5 平台
  - # App-nvue 平台
- # uni.unPreloadPage(OBJECT)
      - 本页导读

预加载页面，是一种性能优化技术。被预载的页面，在打开时速度更快。

预加载 /pages/test/test 对应的js文件，不执行页面预渲染逻辑

示例源码如下，请查看 pre > code 标签中的内容

预加载nvue页面 /pages/test/test

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 2.7.12+的hello uni-app，在navigator示例和uni ui的日历示例中增加了页面预载示例。

**Examples:**

Example 1 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

Example 2 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

Example 3 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

Example 4 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/socket-task.html

**Contents:**
- # SocketTask.onMessage(CALLBACK)
- # SocketTask.send(OBJECT)
- # SocketTask.close(OBJECT)
- # SocketTask.onOpen(CALLBACK)
- # SocketTask.onClose(CALLBACK)
- # SocketTask.onError(CALLBACK)
      - 本页导读

SocketTask 由 uni.connectSocket() 接口创建。

支付宝小程序、抖音小程序，没有明确的文档来具体说明这个对象，而是指向了 Web Websocket 对象。

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

---

## mDNS 服务 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/mDNS

**Contents:**
    - # mDNS 服务
      - 本页导读

---

## onPullDownRefresh | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/pulldown.html

**Contents:**
- # onPullDownRefresh
- # uni.startPullDownRefresh(OBJECT)
  - # startPullDownRefresh 兼容性
- # uni.stopPullDownRefresh()
  - # stopPullDownRefresh 兼容性
- # FAQ
      - 本页导读

在 js 中定义 onPullDownRefresh 处理函数（和onLoad等生命周期函数同级），监听该页面用户下拉刷新事件。

开始下拉刷新，调用后触发下拉刷新动画，效果与用户手动下拉刷新一致。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Q：如何暂时禁用掉下拉刷新，待需要的时候再重新开启？ A：App 平台下可以处理此类场景，详细参考：uni-app 中实现动态禁用/开启下拉刷新

Q：自定义title如何让下拉刷新在title之下 A：App和H5端使用circle方式的下拉刷新，设offset在title高度之下。hello uni-app的模板-导航栏中有示例。小程序端无法实现，除非放弃原生下拉刷新，自己模拟下拉刷新，插件市场有类似插件，但性能不如原生下拉刷新。

Q：如何自定义下拉刷新样式 A：小程序端的原生下拉刷新样式是固定的；App端原生的下拉刷新有2种样式可选择，下拉漏出雪花和下拉circle圈。如果使用nvue，可以使用refresh组件 自定义下拉刷新，都是原生渲染。如果想使用scroll-view在前端实现自定义下拉刷新，需要注意列表不可太长和太复杂，否则会有性能问题。插件市场 搜索下拉刷新有示例。

**Examples:**

Example 1 (unknown):
```unknown
enablePullDownRefresh
```

Example 2 (unknown):
```unknown
uni.stopPullDownRefresh
```

Example 3 (javascript):
```javascript
{
    "pages": [
        {
        	"path": "pages/index/index",
        	"style": {
        		"navigationBarTitleText": "uni-app",
        		"enablePullDownRefresh": true
        	}
        }
    ],
    "globalStyle": {
    	"navigationBarTextStyle": "white",
    	"navigationBarBackgroundColor": "#0faeff",
    	"backgroundColor": "#fbf9fe"
    }
}
```

Example 4 (javascript):
```javascript
{
    "pages": [
        {
        	"path": "pages/index/index",
        	"style": {
        		"navigationBarTitleText": "uni-app",
        		"enablePullDownRefresh": true
        	}
        }
    ],
    "globalStyle": {
    	"navigationBarTextStyle": "white",
    	"navigationBarBackgroundColor": "#0faeff",
    	"backgroundColor": "#fbf9fe"
    }
}
```

---

## uni.onThemeChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/theme.html

**Contents:**
- # uni.onThemeChange(CALLBACK)
  - # onThemeChange 兼容性
- # uni.offThemeChange(CALLBACK)
  - # offThemeChange 兼容性
- #
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

Function CallBack：onThemeChange 传入的监听函数。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
Android 3.6.9+
```

Example 2 (javascript):
```javascript
uni.onThemeChange(function (res) {
	console.log(res.theme);
});
```

Example 3 (javascript):
```javascript
uni.onThemeChange(function (res) {
	console.log(res.theme);
});
```

Example 4 (javascript):
```javascript
uni.onThemeChange(function (res) {
	console.log(res.theme);
});
```

---

## editorContext | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/editor-context.html

**Contents:**
- # editorContext
- # editorContext.format(name, value)
- # editorContext.insertDivider(OBJECT)
- # editorContext.insertImage(OBJECT)
- # editorContext.insertText(OBJECT)
- # editorContext.setContents(OBJECT)
- # editorContext.getContents(OBJECT)
- # editorContext.clear(OBJECT)
- # editorContext.removeFormat(OBJECT)
- # editorContext.undo(OBJECT)

editor 组件对应的 editorContext 实例，可通过 uni.createSelectorQuery 获取。

示例源码如下，请查看 pre > code 标签中的内容

百度小程序 Editor 富文本编辑器动态库提供了 createEditorContext 的方法来获取。

示例源码如下，请查看 pre > code 标签中的内容

editorContext 通过 id 跟一个 <editor> 组件绑定，操作对应的 <editor> 组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对已经应用样式的选区设置会取消样式。css style 表示 css 中规定的允许值。

微信小程序平台地址为临时文件时，获取的编辑器html格式内容中 <img> 标签增加属性 data-local，delta 格式内容中图片 attributes 属性增加 data-local 字段，该值为传入的临时文件地址。 开发者可选择在提交阶段上传图片到服务器，获取到网络地址后进行替换。替换时对于html内容应替换掉 <img> 的 src 值，对于 delta 内容应替换掉 insert { image: abc } 值。

初始化编辑器内容，html和delta同时存在时仅delta生效

获取编辑器已选区域内的纯文本内容。当编辑器失焦或未选中一段区间时，返回内容为空。

**Examples:**

Example 1 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

Example 2 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

Example 3 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

Example 4 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

---

## uni.onUserCaptureScreen(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/capture-screen.html

**Contents:**
- # uni.onUserCaptureScreen(CALLBACK)
  - # onUserCaptureScreen 兼容性
- # uni.offUserCaptureScreen(function callback)
  - # offUserCaptureScreen 兼容性
- # uni.setUserCaptureScreen(OBJECT)
  - # setUserCaptureScreen 兼容性
- # 错误码
      - 本页导读

监听用户主动截屏事件，用户使用系统截屏按键截屏时触发此事件。

在 App 平台本 API 是 uni ext api ，需下载插件：uni-usercapturescreen 需要HBuilder X 3.7.7+版本

示例源码如下，请查看 pre > code 标签中的内容

Android的截屏监听原理是监听相册中截屏目录的文件新增，需赋予App本地文件读取权限。

在 App 平台本 API 是 uni ext api ，需下载插件：uni-usercapturescreen 需要HBuilder X 3.7.7+版本

在 App 平台本 API 是 uni ext api ，需下载插件：uni-usercapturescreen 需要HBuilder X 3.7.7+版本

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

Example 2 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

Example 3 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

Example 4 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

---

## uni.getFileSystemManager() @getfilesystemmanager | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/file/getFileSystemManager.html

**Contents:**
- # uni.getFileSystemManager()
  - # getFileSystemManager 兼容性
  - # 返回值
    - # FileSystemManager 的方法
    - # access(options: AccessOptions): void;
      - # access 兼容性
      - # 参数 HarmonyOS 兼容性
        - # FileSystemManagerFail 的属性值
    - # accessSync(path: string): void;
      - # accessSync 兼容性

accessSync FileSystemManager.access 的同步版本

appendFileSync FileSystemManager.appendFile 的同步版本

copyFileSync FileSystemManager.copyFile 的同步版本

isDirectory 判断当前文件是否一个目录

isFile 判断当前文件是否一个普通文件

fstatSync 同步获取文件的状态信息

ftruncate 对文件内容进行截断操作

ftruncateSync 同步对文件内容进行截断操作

getFileInfo 获取该本地临时文件 或 本地缓存文件 信息

getSavedFileList 获取该已保存的本地缓存文件列表

mkdirSync FileSystemManager.mkdir 的同步版本

openSync 同步打开文件，返回文件描述符

readFileSync FileSystemManager.readFile 的同步版本参数

readdirSync FileSystemManager.readdir 的同步版本

readZipEntry 读取压缩包内的文件

rmdirSync FileSystemManager.rmdir 的同步版本

rename 重命名文件。可以把文件从 oldPath 移动到 newPath

renameSync FileSystemManager.rename 的同步版本

removeSavedFile 删除该小程序下已保存的本地缓存文件

readCompressedFile 读取指定压缩类型的本地文件内容

readCompressedFileSync 同步读取指定压缩类型的本地文件内容

saveFile 保存临时文件到本地。此接口会移动临时文件，因此调用成功后，tempFilePath 将不可用。

saveFileSync FileSystemManager.saveFile 的同步版本。自 4.71 起，返回 unifile:// 协议的路径

statSync FileSystemManager.stat 的同步版本

truncateSync 对文件内容进行截断操作 (truncate 的同步版本)

unlinkSync FileSystemManager.unlink 的同步版本

writeFileSync FileSystemManager.writeFile 的同步版本

**Examples:**

Example 1 (yaml):
```yaml
unifile://cache/uni-store/
```

---

## 生物认证说明 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/authentication.html

**Contents:**
- # 生物认证说明
- # uni.startSoterAuthentication(OBJECT)
  - # startSoterAuthentication 兼容性
- # uni.checkIsSupportSoterAuthentication(OBJECT)
  - # checkIsSupportSoterAuthentication 兼容性
- # uni.checkIsSoterEnrolledInDevice(OBJECT)
  - # checkIsSoterEnrolledInDevice 兼容性
  - # 代码示例
  - # 注意事项
      - 本页导读

生物认证，包含手机的指纹识别、faceid两部分。即通过人体身体特征来进行身份认证识别。

如需要专业的活体检测、人脸识别、金融级实人认证，需另见文档uni实人认证

OBJECT.requestAuthModes说明

此数据为设备TEE中，将传入的challenge和TEE内其他安全信息组成的数据进行组装而来的JSON，对下述字段的解释如下表。例子如下：

OBJECT.checkAuthMode合法值

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS Next
```

Example 2 (unknown):
```unknown
ohos.permission.ACCESS_BIOMETRIC
```

Example 3 (unknown):
```unknown
HarmonyOS Next
```

Example 4 (unknown):
```unknown
ohos.permission.ACCESS_BIOMETRIC
```

---

## uni.onWindowResize(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/window.html

**Contents:**
- # uni.onWindowResize(CALLBACK)
- # uni.offWindowResize(CALLBACK)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

Example 2 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

Example 3 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

Example 4 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

---

## uni.onCompassChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/compass

**Contents:**
- # uni.onCompassChange(CALLBACK)
  - # onCompassChange 兼容性
- # uni.offCompassChange(CALLBACK)
  - # offCompassChange 兼容性
- # uni.startCompass(OBJECT)
  - # startCompass 兼容性
- # uni.stopCompass(OBJECT)
  - # stopCompass 兼容性
      - 本页导读

监听罗盘数据，频率：5次/秒，接口调用后会自动开始监听，可使用 uni.offCompassChange 取消监听。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.offCompassChange
```

Example 2 (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

Example 3 (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

Example 4 (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/ble

**Contents:**
- # uni.setBLEMTU(OBJECT)
- # uni.writeBLECharacteristicValue(OBJECT)
  - # 错误
  - # 注意
  - # 示例代码
- # uni.readBLECharacteristicValue(OBJECT)
  - # 错误
  - # 注意
  - # 示例代码
- # uni.onBLEConnectionStateChange(CALLBACK)

设置蓝牙最大传输单元。需在 uni.createBLEConnection调用成功后调用，mtu 设置范围 (22,512)。安卓5.1以上有效。

向低功耗蓝牙设备特征值中写入二进制数据。注意：必须设备的特征值支持 write 才可以成功调用。

示例源码如下，请查看 pre > code 标签中的内容

读取低功耗蓝牙设备的特征值的二进制数据值。注意：必须设备的特征值支持 read 才可以成功调用。

示例源码如下，请查看 pre > code 标签中的内容

监听低功耗蓝牙连接状态的改变事件。包括开发者主动连接或断开连接，设备丢失，连接异常断开等等

示例源码如下，请查看 pre > code 标签中的内容

监听低功耗蓝牙设备的特征值变化事件。必须先启用 notifyBLECharacteristicValueChange 接口才能接收到设备推送的 notification。

示例源码如下，请查看 pre > code 标签中的内容

启用低功耗蓝牙设备特征值变化时的 notify 功能，订阅特征值。注意：必须设备的特征值支持 notify 或者 indicate 才可以成功调用。 另外，必须先启用 notifyBLECharacteristicValueChange 才能监听到设备 characteristicValueChange 事件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取蓝牙设备某个服务中所有特征值(characteristic)。

|属性|类型|说明| |---|---|---|---| |characteristics|Array<Object>|设备服务列表|

res.characteristics 的结构

示例源码如下，请查看 pre > code 标签中的内容

若APP在之前已有搜索过某个蓝牙设备，并成功建立连接，可直接传入之前搜索获取的 deviceId 直接尝试连接该设备，无需进行搜索操作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
notifyBLECharacteristicValueChange
```

Example 2 (unknown):
```unknown
writeBLECharacteristicValue
```

Example 3 (javascript):
```javascript
// 向蓝牙设备发送一个0x00的16进制数据
const buffer = new ArrayBuffer(1)
const dataView = new DataView(buffer)
dataView.setUint8(0, 0)
uni.writeBLECharacteristicValue({
  // 这里的 deviceId 需要在 getBluetoothDevices 或 onBluetoothDeviceFound 接口中获取
  deviceId,
  // 这里的 serviceId 需要在 getBLEDeviceServices 接口中获取
  serviceId,
  // 这里的 characteristicId 需要在 getBLEDeviceCharacteristics 接口中获取
  characteristicId,
  // 这里的value是ArrayBuffer类型
  value: buffer,
  success(res) {
    console.log('writeBLECharacteristicValue success', res.errMsg)
  }
})
```

Example 4 (javascript):
```javascript
// 向蓝牙设备发送一个0x00的16进制数据
const buffer = new ArrayBuffer(1)
const dataView = new DataView(buffer)
dataView.setUint8(0, 0)
uni.writeBLECharacteristicValue({
  // 这里的 deviceId 需要在 getBluetoothDevices 或 onBluetoothDeviceFound 接口中获取
  deviceId,
  // 这里的 serviceId 需要在 getBLEDeviceServices 接口中获取
  serviceId,
  // 这里的 characteristicId 需要在 getBLEDeviceCharacteristics 接口中获取
  characteristicId,
  // 这里的value是ArrayBuffer类型
  value: buffer,
  success(res) {
    console.log('writeBLECharacteristicValue success', res.errMsg)
  }
})
```

---

## uni.vibrate(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/vibrate.html

**Contents:**
- # uni.vibrate(OBJECT)
- # uni.vibrateLong(OBJECT)
- # uni.vibrateShort(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

---

## addTemplate | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/template

**Contents:**
- # addTemplate
- # deleteTemplate
- # getTemplateLibraryById
- # getTemplateLibraryList
- # getTemplateList
- # sendTemplateMessage
- # alipay.open.app.mini.templatemessage.send
      - 本页导读

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

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

小程序通过 openapi 给用户触达消息，主要为支付后的触达（通过消费id）和用户提交表单后的触达（通过formId）。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

Example 2 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

Example 3 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

Example 4 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

---

## uni.onGyroscopeChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/gyroscope

**Contents:**
- # uni.onGyroscopeChange(CALLBACK)
- # uni.startGyroscope(OBJECT)
- # uni.stopGyroscope(OBJECT)
      - 本页导读

支付宝小程序频率为 500ms/次，微信小程序频率根据 uni.startGyroscope 的 interval 参数设置。事件只有在调用 uni.startGyroscope 后才会开始监听，使用 uni.stopGyroscope 可以停止监听。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

Example 2 (html):
```html
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

Example 3 (html):
```html
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

Example 4 (vue):
```vue
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

---

## uni.getUpdateManager() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/update.html

**Contents:**
- # uni.getUpdateManager()
      - 本页导读

本API返回全局唯一的版本更新管理器对象： updateManager，用于管理小程序更新。

updateManager 对象的方法列表：

onCheckForUpdate(callback) 回调结果说明：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

Example 2 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

Example 3 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

Example 4 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/push

**Contents:**
- # 客户端API
- # uni.getPushClientId(OBJECT)
  - # getPushClientId 兼容性
- # uni.onPushMessage(callback)
  - # onPushMessage 兼容性
  - # 回调参数说明
- # uni.offPushMessage(callback)
  - # offPushMessage 兼容性
  - # Tips
- # uni.getChannelManager()

以下为uni-push2.0的api文档，业务介绍详情参考

uni-push有服务器API和客户端API。

注意：这是一个异步的方法，且仅支持uni-push2.0；

常见报错： getPushClientId:fail register fail: {\"errorCode\":1,\"errorMsg\":\"\"} 请检查：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取通知渠道管理器，Android 8系统以上才可以设置通知渠道。

示例源码如下，请查看 pre > code 标签中的内容

创建本地通知栏消息（HBuilderX 3.5.2起支持）

设置应用图标上显示的角标数字 注意：此api仅鸿蒙平台支持，iOS和Android平台请使用plus.runtime.setBadgeNumber详情参考

小程序平台的类似概念叫做模板消息，也有的平台改名为订阅消息。

以微信为例，开发者的服务器发送消息给微信的服务器，微信服务器会发送一条订阅消息，折叠到微信的消息列表中的服务通知里。它属于后台开发，和手机端无关。

如果使用uniCloud发送微信、支付宝订阅消息，参考：https://ext.dcloud.net.cn/plugin?id=1810

微信订阅消息文档：https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/subscribe-message.html

支付宝模板消息文档：https://docs.alipay.com/mini/introduce/message

百度模板消息文档：https://smartprogram.baidu.com/docs/develop/third/api/

抖音订阅消息文档：https://developer.open-douyin.com/docs/resource/zh-CN/mini-app/open-capacity/operation/subscribe-message/

QQ小程序订阅消息文档：https://q.qq.com/wiki/develop/miniprogram/frame/open_ability/open_message.html#%E8%AE%A2%E9%98%85%E6%B6%88%E6%81%AF

华为快应用推送文档：https://developer.huawei.com/consumer/cn/doc/development/quickApp-References/webview-api-hwpush

**Examples:**

Example 1 (yaml):
```yaml
getPushClientId:fail register fail: {\"errorCode\":1,\"errorMsg\":\"\"}
```

Example 2 (javascript):
```javascript
uni.getPushClientId({
		success: (res) => {
			console.log(res.cid);
		},
		fail(err) {
			console.log(err)
		}
	})
```

Example 3 (javascript):
```javascript
uni.getPushClientId({
		success: (res) => {
			console.log(res.cid);
		},
		fail(err) {
			console.log(err)
		}
	})
```

Example 4 (javascript):
```javascript
uni.getPushClientId({
		success: (res) => {
			console.log(res.cid);
		},
		fail(err) {
			console.log(err)
		}
	})
```

---

## uni.scanCode(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/barcode

**Contents:**
- # uni.scanCode(OBJECT)
  - # scanCode 兼容性
      - 本页导读

调起客户端扫码界面，扫码成功后返回对应的结果。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
scanType的合法值
```

Example 2 (javascript):
```javascript
// 允许从相机和相册扫码
uni.scanCode({
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 只允许通过相机扫码
uni.scanCode({
	onlyFromCamera: true,
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 调起条码扫描
uni.scanCode({
	scanType: ['barCode'],
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});
```

Example 3 (javascript):
```javascript
// 允许从相机和相册扫码
uni.scanCode({
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 只允许通过相机扫码
uni.scanCode({
	onlyFromCamera: true,
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 调起条码扫描
uni.scanCode({
	scanType: ['barCode'],
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});
```

Example 4 (javascript):
```javascript
// 允许从相机和相册扫码
uni.scanCode({
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 只允许通过相机扫码
uni.scanCode({
	onlyFromCamera: true,
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});

// 调起条码扫描
uni.scanCode({
	scanType: ['barCode'],
	success: function (res) {
		console.log('条码类型：' + res.scanType);
		console.log('条码内容：' + res.result);
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/app/geolocation

**Contents:**
  - # 背景
  - # 系统定位
    - # iOS平台
    - # Android平台
      - 本页导读

HBuilderX3.3.0开始独立出“系统定位”模块

从2021年初开始，高德、百度、腾讯等地图服务商更新了服务协议、开始实施商业授权机制，要求除公益App外所有使用地图相关功能（包括定位SDK、地图SDK、H5地图等）都需要获取地图服务商的商业授权。重点强调一下，免费应用同样需要商业授权，除非你的应用是公益类App，其它类型App都需要商业授权。

为了避免商业授权引起的问题，也可以只使用“系统定位”模块，“系统定位”在功能和机型适配上没有高德、百度等商业定位服务完善，需开发者根据实际情况选择。

系统定位调用的系统提供的定位服务，不同设备对定位功能支持的情况有所差异

由苹果公司提供定位服务，可以获取经纬度信息，也支持解析地址信息。即可以直接返回城市街道信息。

标准Android平台的定位服务是Google提供的，但需要手机内置GMS服务，连接Google服务器。国产手机大多不支持。

主流国内手机厂商均自行提供了定位服务，但小众品牌可能不支持，主流品牌中较老的机型也不支持。如下Android手机厂商都支持系统定位：

在国外通常都是使用Google的GMS提供定位服务。

注意：Android系统定位模块不支持位置解析服务，只可以获取经纬度信息，不支持解析地址信息。如需要根据经纬度获取城市街道信息，仍然需要请求高德、百度等商业服务

---

## 分享 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/share.html

**Contents:**
- # 分享
- # uni.share(OBJECT)
  - # 分享到微信聊天界面示例代码
  - # 分享到微信朋友圈示例代码
  - # uni.share 在App端各社交平台分享配置说明
    - # 微信分享
    - # 新浪微博分享
    - # QQ 分享
    - # FAQ
- # uni.shareWithSystem(OBJECT)

在不同平台，分享的调用方式和逻辑有较大差异。

uni-app的App引擎已经封装了微信、QQ、微博的分享SDK，开发者可以直接调用相关功能。

可以分享到微信、QQ、微博，每个社交平台被称为分享服务提供商，即provider。

可以分享文字、图片、图文横条、音乐、视频等多种形式。同时注意，分享为小程序也使用本API。即在App里可以通过本API把一个内容以小程序（通常为内容页）方式直接分享给微信好友。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

href、imageUrl 为必选参数，title/summary 二选一，最好将这四个参数都选上。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

href、imageUrl 为必选参数，title、summary 至少有一项。

示例源码如下，请查看 pre > code 标签中的内容

App分享为微信小程序（App中分享一个内容到微信好友，对方微信中呈现的是一个小程序卡片）

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json 的 App SDK 配置里，勾选微信消息及朋友圈，并填写 appid，如需在iOS平台使用还需要配置通用链接。

在 manifest.json 的 App SDK 配置里，勾选勾选新浪微博，并填写相关appkey，新浪微博 appkey 申请步骤可参考：https://ask.dcloud.net.cn/article/209 。

在 manifest.json 的 App SDK 配置里，勾选分享到QQ好友，并填写相关appkey，QQ分享 appkey 申请步骤：

这些配置需要打包生效，真机运行仍然是HBuilder基座的设置，可使用自定义基座包 调试。离线打包请参考离线打包文档在原生工程中配置。

配置并打包后，通过uni.getProvider可以得到配置的结果列表，注意这里返回的是manifest配置的，与手机端是否安装微信、QQ、微博无关。

如果手机端未安装QQ、微博，调用时会启动这些平台的wap页面分享，如果已安装相应客户端，会启动它们的客户端分享。

Q：App端如何集成其他分享SDK，如facebook分享、twitter分享

A：插件市场已有相关插件，详见 ；也可以根据原生插件教程自行开发，原生插件开发文档见https://ask.dcloud.net.cn/article/35428

A：插件市场有很多封装好的分享菜单插件，底部图标菜单 ，可直接弹出菜单，并且没有遮挡层级问题，推荐使用。

调用系统分享组件发送分享消息，不需要配置分享SDK

示例源码如下，请查看 pre > code 标签中的内容

小程序中用户点击分享后，在 js 中定义 onShareAppMessage 处理函数（和 onLoad 等生命周期函数同级），设置该页面的分享信息。

微信小程序平台的分享管理比较严格，请参考 小程序分享指引 。

此事件需要 return 一个 Object，用于自定义分享内容，其内容如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.shareWithSystem
```

Example 2 (unknown):
```unknown
openCustomerServiceChat = true
```

Example 3 (unknown):
```unknown
openCustomerServiceChat = true
```

Example 4 (javascript):
```javascript
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

## 窗口样式相关的 API | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/adapt.html

**Contents:**
- # 窗口样式相关的 API
- # uni.getTopWindowStyle()
- # uni.getLeftWindowStyle()
- # uni.getRightWindowStyle()
- # uni.setTopWindowStyle(OBJECT)
- # uni.setLeftWindowStyle(OBJECT)
- # uni.setRightWindowStyle(OBJECT)
      - 本页导读

在web上，宽屏界面会出现topWindow、LeftWindow、RightWindow，相关概念详见宽屏适配指南

获取对应窗口的样式，返回一个 css 属性值对象; 设置对应窗口的样式，传入一个 css 属性值对象

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.getTopWindowStyle()
```

Example 2 (javascript):
```javascript
uni.getTopWindowStyle()
```

Example 3 (javascript):
```javascript
uni.getTopWindowStyle()
```

Example 4 (unknown):
```unknown
uni.getTopWindowStyle()
```

---

## uni.addPhoneContact(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/contact.html

**Contents:**
- # uni.addPhoneContact(OBJECT)
  - # addPhoneContact 兼容性
      - 本页导读

调用后，用户可以选择将该表单以“新增联系人”或“添加到已有联系人”的方式（APP端目前没有选择步骤，将直接写入），写入手机系统通讯录，完成手机通讯录联系人和联系方式的增加。

App平台提供了更多通讯录相关API，包括读取联系人，详见：https://www.html5plus.org/doc/zh_cn/contacts.html

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

Example 2 (javascript):
```javascript
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

Example 3 (javascript):
```javascript
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

Example 4 (css):
```css
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/window/subNVues.html

**Contents:**
- # uni.getSubNVueById(subNvueId)
  - # 返回值
- # uni.getCurrentSubNVue()
  - # 返回值
  - # subNVue 对象的方法列表
- # subNVue.show (aniShow,duration,showedCB)
- # subNVue.hide (aniShow,duration)
- # subNVue.setStyle (style)
- # subNVue.postMessage(OBJECT)
- # subNVue.onMessage(CallBack)

subNvue，是 vue 页面的原生子窗体，把weex渲染的原生界面当做 vue 页面的子窗体覆盖在页面上。它不是全屏页面，它给App平台vue页面中的层级覆盖和原生界面自定义提供了更强大和灵活的解决方案。它也不是组件，就是一个原生子窗体。

它的设计背景和用途详见：subNVue 原生子窗体开发指南

subNvue 自1.9.10 起支持 ，仅支持 app 平台

通过 ID 获取 subNVues 原生子窗体的实例。 subNVues 配置

示例源码如下，请查看 pre > code 标签中的内容

在一个subnvue窗体的nvue页面代码中，获取当前 subNVues 原生子窗体的实例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

发送消息，此通讯方式已过时，请使用uni.$emit进行通讯，参考

示例源码如下，请查看 pre > code 标签中的内容

监听消息，此通讯方式已过时，请使用uni.$on进行通讯，参考

示例源码如下，请查看 pre > code 标签中的内容

显示动画与关闭动画，会有默认的对应规则。但是如果通过 API 原生子窗体的关闭动画类型，则不会使用默认的类型。

**Examples:**

Example 1 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

Example 2 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

Example 3 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

Example 4 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uts/buildin-object-api/timers.html

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

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/bluetooth

**Contents:**
- # uni.openBluetoothAdapter(OBJECT)
  - # 错误
- # uni.startBluetoothDevicesDiscovery(OBJECT)
  - # 错误
- # uni.onBluetoothDeviceFound(CALLBACK)
- # uni.stopBluetoothDevicesDiscovery(OBJECT)
  - # 错误
- # uni.onBluetoothAdapterStateChange(CALLBACK)
- # uni.getConnectedBluetoothDevices(OBJECT)
  - # 错误

示例源码如下，请查看 pre > code 标签中的内容

开始搜寻附近的蓝牙外围设备。此操作比较耗费系统资源，请在搜索并连接到设备后调用 uni.stopBluetoothDevicesDiscovery 方法停止搜索。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

停止搜寻附近的蓝牙外围设备。若已经找到需要的蓝牙设备并不需要继续搜索时，建议调用该接口停止蓝牙搜索。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据 uuid 获取处于已连接状态的设备。

示例源码如下，请查看 pre > code 标签中的内容

获取在蓝牙模块生效期间所有已发现的蓝牙设备。包括已经和本机处于连接状态的设备。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

关闭蓝牙模块。调用该方法将断开所有已建立的连接并释放系统资源。建议在使用蓝牙流程后，与 uni.openBluetoothAdapter 成对调用。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.openBluetoothAdapter
```

Example 2 (unknown):
```unknown
uni.openBluetoothAdapter
```

Example 3 (unknown):
```unknown
uni.onBluetoothAdapterStateChange
```

Example 4 (javascript):
```javascript
uni.openBluetoothAdapter({
  success(res) {
    console.log(res)
  }
})
```

---

## uni.onWindowResize(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/window

**Contents:**
- # uni.onWindowResize(CALLBACK)
- # uni.offWindowResize(CALLBACK)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

Example 2 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

Example 3 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

Example 4 (javascript):
```javascript
const windowResizeCallback = (res) => {
  console.log('变化后的窗口宽度=' + res.size.windowWidth)
  console.log('变化后的窗口高度=' + res.size.windowHeight)
}
uni.onWindowResize(windowResizeCallback)
```

---

## uni.preloadPage(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/preload-page.html

**Contents:**
- # uni.preloadPage(OBJECT)
  - # H5 平台
  - # App-nvue 平台
- # uni.unPreloadPage(OBJECT)
      - 本页导读

预加载页面，是一种性能优化技术。被预载的页面，在打开时速度更快。

预加载 /pages/test/test 对应的js文件，不执行页面预渲染逻辑

示例源码如下，请查看 pre > code 标签中的内容

预加载nvue页面 /pages/test/test

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 2.7.12+的hello uni-app，在navigator示例和uni ui的日历示例中增加了页面预载示例。

**Examples:**

Example 1 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

Example 2 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

Example 3 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

Example 4 (css):
```css
uni.preloadPage({url: "/pages/test/test"});
```

---

## uni.createAnimation(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/animation

**Contents:**
- # uni.createAnimation(OBJECT)
  - # animation
      - 本页导读

创建一个动画实例 animation。调用实例的方法来描述动画。最后通过动画实例的export方法导出动画数据传递给组件的animation属性。

示例源码如下，请查看 pre > code 标签中的内容

动画实例可以调用以下方法来描述动画，调用结束后会返回自身，支持链式调用的写法。

调用动画操作方法后要调用 step() 来表示一组动画完成，可以在一组动画中调用任意多个动画方法，一组动画中的所有动画会同时开始，一组动画完成后才会进行下一组动画。step 可以传入一个跟 uni.createAnimation() 一样的配置参数用于指定当前组动画的配置。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

Example 2 (javascript):
```javascript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

Example 3 (javascript):
```javascript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

Example 4 (gdscript):
```gdscript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

---

## uni.getExtConfig(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/get-extconfig

**Contents:**
- # uni.getExtConfig(OBJECT)
- # uni.getExtConfigSync()
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

uni.getExtConfig 的同步版本。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.canIUse
```

Example 2 (unknown):
```unknown
uni.getExtConfig
```

Example 3 (javascript):
```javascript
if (uni.getExtConfig) {
  uni.getExtConfig({
    success(res) {
      console.log(res.extConfig)
    }
  })
}
```

Example 4 (javascript):
```javascript
if (uni.getExtConfig) {
  uni.getExtConfig({
    success(res) {
      console.log(res.extConfig)
    }
  })
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/video

**Contents:**
- # uni.chooseVideo(OBJECT)
  - # chooseVideo 兼容性
- # uni.chooseMedia(OBJECT)
  - # chooseMedia 兼容性
- # uni.saveVideoToPhotosAlbum(OBJECT)
  - # saveVideoToPhotosAlbum 兼容性
- # uni.getVideoInfo(OBJECT)
  - # getVideoInfo 兼容性
- # uni.compressVideo(OBJECT)
  - # compressVideo 兼容性

视频需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

拍摄视频或从手机相册中选视频，返回视频的临时文件路径。

若选择和上传非图像、视频文件，另行参考：https://uniapp.dcloud.io/api/media/file 。

示例源码如下，请查看 pre > code 标签中的内容

拍摄或从手机相册中选择图片或视频。注意在app平台，相册选择使用的是系统相册。系统相册选择不需要本地媒体访问权限，但上面的UI无法定制，不能自行添加类似“原图”的单选框，

若选择和上传非图像、视频文件，另行参考：https://uniapp.dcloud.io/api/media/file 。

OBJECT.sourceType 合法值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

压缩视频接口。开发者可指定压缩质量 quality 进行压缩。当需要更精细的控制时，可指定 bitrate、fps、和 resolution，当 quality 传入时，这三个参数将被忽略。原视频的相关信息可通过 getVideoInfo 获取。

App端有很多插件支持视频压缩，详见插件市场

压缩完毕后如需上传到cdn，可使用uniCloud.uploadFile API，uniCloud提供了免费cdn给开发者使用，详见https://doc.dcloud.net.cn/uniCloud/storage?id=uploadfile

**Examples:**

Example 1 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

Example 2 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

Example 3 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

Example 4 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

---

## uni.getEnvInfoSync() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/getEnvInfoSync.html

**Contents:**
- # uni.getEnvInfoSync()
      - 本页导读

**Examples:**

Example 1 (unknown):
```unknown
development
```

---

## uni.requestSubscribeMessage(Object object) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/requestSubscribeMessage.html

**Contents:**
- # uni.requestSubscribeMessage(Object object)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
uni.requestSubscribeMessage({
  tmplIds: [''],
  success (res) { }
})
```

Example 2 (css):
```css
uni.requestSubscribeMessage({
  tmplIds: [''],
  success (res) { }
})
```

Example 3 (css):
```css
uni.requestSubscribeMessage({
  tmplIds: [''],
  success (res) { }
})
```

Example 4 (css):
```css
uni.requestSubscribeMessage({
  tmplIds: [''],
  success (res) { }
})
```

---

## uni.onPageNotFound(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/application

**Contents:**
- # uni.onPageNotFound(CALLBACK)
  - # 参数
  - # 参数
- # uni.onError(CALLBACK)
  - # 参数
  - # 参数
- # uni.onAppShow(CALLBACK)
  - # 参数
  - # 参数
- # uni.onAppHide(CALLBACK)

监听应用要打开的页面不存在事件。该事件与 App.onPageNotFound 的回调时机一致

监听小程序错误事件。如脚本错误或 API 调用报错等。该事件与 App.onError 的回调时机与参数一致。

监听应用切前台事件。该事件与 App.onShow 的回调参数一致。

监听应用切后台事件。该事件与 App.onHide 的回调参数一致。

**Examples:**

Example 1 (unknown):
```unknown
App.onPageNotFound
```

Example 2 (unknown):
```unknown
uni.onPageNotFound
```

Example 3 (unknown):
```unknown
App.onPageNotFound
```

Example 4 (unknown):
```unknown
uni.onPageNotFound
```

---

## uni.base64ToArrayBuffer(base64) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/base64ToArrayBuffer

**Contents:**
- # uni.base64ToArrayBuffer(base64)
  - # base64ToArrayBuffer 兼容性
      - 本页导读

将 Base64 字符串转成 ArrayBuffer 对象

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

Example 2 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

Example 3 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

Example 4 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/quick-start.html

**Contents:**
- # uni-app自动化测试
- # 特性
- # CLI
- # 测试插件
- # 测试工程目录说明
    - # 测试用例文件规范
    - # 测试用例文件编写示例
- # 测试配置文件
    - # jest.config.js
- # 注意事项

uni-app提供了一批API，这些API可以操控uni-app应用，包括运行、跳转页面、触发点击等，并可以获取页面元素状态、进行截图，从而实现对uni-app项目进行自动化测试的目的。

本功能使用到了业内常见的测试库如jest （MIT协议）。

推荐使用方式：研发提交源码到版本库后，持续集成系统自动拉取源码，自动运行自动化测试。

如果您想在终端命令行进行自动化测试、或使用持续集成进行测试。

为了方便大家在HBuilderX内，进行uni-app自动化测试，开发了 HBuilderX uni-app自动化测试插件 。

插件支持在HBuilderX内对uni-app普通项目、CLI项目进行自动化测试。

插件简化了测试环境安装、测试用例创建、测试运行、测试设备选择等步骤。插件使用文档

如下所示，是一个标准的uni-app x项目测试工程目录介绍。

示例源码如下，请查看 pre > code 标签中的内容

以下代码是一个简单的uni-app页面测试用例，使用page.$获取.title选择器的文本，然后进行断言。

示例源码如下，请查看 pre > code 标签中的内容

一个完整的jest.config.js文件，为测试配置文件，详细内容如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

GitHub： https://github.com/dcloudio/hello-uniapp

**Examples:**

Example 1 (unknown):
```unknown
uni-app普通项目
```

Example 2 (shell):
```shell
.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss
```

Example 3 (shell):
```shell
.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss
```

Example 4 (shell):
```shell
.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss
```

---

## uni.getDeviceInfo() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/getDeviceInfo.html

**Contents:**
- # uni.getDeviceInfo()
  - # getDeviceInfo 兼容性
  - # 返回值
      - 本页导读

**Examples:**

Example 1 (unknown):
```unknown
竖屏 portrait
```

Example 2 (unknown):
```unknown
横屏 landscape
```

Example 3 (unknown):
```unknown
getSystemInfo Api
```

Example 4 (unknown):
```unknown
getSystemInfo Api
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/socket-task

**Contents:**
- # SocketTask.onMessage(CALLBACK)
- # SocketTask.send(OBJECT)
- # SocketTask.close(OBJECT)
- # SocketTask.onOpen(CALLBACK)
- # SocketTask.onClose(CALLBACK)
- # SocketTask.onError(CALLBACK)
      - 本页导读

SocketTask 由 uni.connectSocket() 接口创建。

支付宝小程序、抖音小程序，没有明确的文档来具体说明这个对象，而是指向了 Web Websocket 对象。

监听 WebSocket 接受到服务器的消息事件

WebSocket 接受到服务器的消息事件的回调函数

WebSocket 连接打开事件的回调函数

WebSocket 连接关闭事件的回调函数

---

## uni.requestMerchantTransfer(options) @requestmerchanttransfer | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/request-merchant-transfer

**Contents:**
- # uni.requestMerchantTransfer(options)
  - # 参数 HarmonyOS 兼容性
    - # RequestMerchantTransferGeneralCallbackResult 的属性值
      - 本页导读

商家转账用户确认模式下，拉起页面请求用户确认收款

本 API 是 uni ext api ，需下载插件：uni-requestMerchantTransfer

uni.requestMerchantTransfer 是​商家转账到用户零钱的API，适用于需要向用户直接发放资金（如提现、奖励发放、活动返现）的场景。

---

## voice | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/voice.html

**Contents:**
  - # voice
      - 本页导读

voice 包括语言识别和语音朗读两部分。

仅百度小程序平台、App平台支持，各平台开发方式暂未统一，使用时需注意用条件编译 调用不同平台的代码。

百度小程序平台支持语音识别，参考：规范详情

---

## addTemplate | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/template.html

**Contents:**
- # addTemplate
- # deleteTemplate
- # getTemplateLibraryById
- # getTemplateLibraryList
- # getTemplateList
- # sendTemplateMessage
- # alipay.open.app.mini.templatemessage.send
      - 本页导读

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

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

小程序通过 openapi 给用户触达消息，主要为支付后的触达（通过消费id）和用户提交表单后的触达（通过formId）。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

Example 2 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

Example 3 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

Example 4 (unknown):
```unknown
/* 微信小程序 */
POST https://api.weixin.qq.com/cgi-bin/wxopen/template/add?access_token=ACCESS_TOKEN

/* 百度小程序 */
POST https://openapi.baidu.com/rest/2.0/smartapp/template/templateadd?access_token=ACCESS_TOKEN
```

---

## uni.hideKeyboard() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/key

**Contents:**
- # uni.hideKeyboard()
  - # hideKeyboard 兼容性
- # uni.onKeyboardHeightChange(CALLBACK)
- # uni.offKeyboardHeightChange(CALLBACK)
- # uni.getSelectedTextRange(OBJECT)
      - 本页导读

隐藏已经显示的软键盘，如果软键盘没有显示则不做任何操作。

示例源码如下，请查看 pre > code 标签中的内容

onKeyboardHeightChange 传入的监听函数。不传此参数则移除所有监听函数。

示例源码如下，请查看 pre > code 标签中的内容

在input、textarea等focus之后，获取输入框的光标位置。注意：只有在focus的时候调用此接口才有效。目前仅支持 vue 页面，nvue 可以直接使用 weex 的 getSelectionRange 。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

Example 2 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

Example 3 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

Example 4 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

---

## uni.onPageNotFound(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/application.html

**Contents:**
- # uni.onPageNotFound(CALLBACK)
  - # 参数
  - # 参数
- # uni.onError(CALLBACK)
  - # 参数
  - # 参数
- # uni.onAppShow(CALLBACK)
  - # 参数
  - # 参数
- # uni.onAppHide(CALLBACK)

监听应用要打开的页面不存在事件。该事件与 App.onPageNotFound 的回调时机一致

监听小程序错误事件。如脚本错误或 API 调用报错等。该事件与 App.onError 的回调时机与参数一致。

监听应用切前台事件。该事件与 App.onShow 的回调参数一致。

监听应用切后台事件。该事件与 App.onHide 的回调参数一致。

**Examples:**

Example 1 (unknown):
```unknown
App.onPageNotFound
```

Example 2 (unknown):
```unknown
uni.onPageNotFound
```

Example 3 (unknown):
```unknown
App.onPageNotFound
```

Example 4 (unknown):
```unknown
uni.onPageNotFound
```

---

## uni.setEnableDebug(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/set-enable-debug

**Contents:**
- # uni.setEnableDebug(OBJECT)
  - # 示例代码
      - 本页导读

设置是否打开调试开关。此开关对正式版也能生效。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

Example 2 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

Example 3 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

Example 4 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

---

## 全屏视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/a-d/full-screen-video.html

**Contents:**
  - # 全屏视频广告
      - 本页导读

---

## uni.addInterceptor(STRING, OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/interceptor.html

**Contents:**
- # uni.addInterceptor(STRING, OBJECT)
  - # addInterceptor 兼容性
- # uni.removeInterceptor(STRING)
  - # removeInterceptor 兼容性
      - # 拦截器的适用场景非常多，比如路由拦截，权限引导等。
      - 本页导读

需要拦截的api名称，如：uni.addInterceptor('request', OBJECT) ，将拦截 uni.request()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：拦截uni.switchTab 本身没有问题。但是在微信小程序端点击tabbar的底层逻辑并不是触发uni.switchTab。所以误认为拦截无效，此类场景的解决方案是在tabbar页面的页面生命周期onShow中处理。

你可以参考插件市场,拦截器应用示例：图片选择api时无权限，引导用户快捷打开系统设置：https://ext.dcloud.net.cn/plugin?id=5095

**Examples:**

Example 1 (unknown):
```unknown
uni.addInterceptor('request', OBJECT)
```

Example 2 (unknown):
```unknown
uni.request()
```

Example 3 (unknown):
```unknown
uni.setStorage(OBJECT)
```

Example 4 (unknown):
```unknown
uni.setStorageSync(KEY,DATA)
```

---

## uniCloud | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/uniCloud.html

**Contents:**
  - # uniCloud
      - 本页导读

完整uniCloud客户端api列表请参考：uniCloud客户端sdk

---

## uni.onUserCaptureScreen(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/capture-screen

**Contents:**
- # uni.onUserCaptureScreen(CALLBACK)
  - # onUserCaptureScreen 兼容性
- # uni.offUserCaptureScreen(function callback)
  - # offUserCaptureScreen 兼容性
- # uni.setUserCaptureScreen(OBJECT)
  - # setUserCaptureScreen 兼容性
- # 错误码
      - 本页导读

监听用户主动截屏事件，用户使用系统截屏按键截屏时触发此事件。

在 App 平台本 API 是 uni ext api ，需下载插件：uni-usercapturescreen 需要HBuilder X 3.7.7+版本

示例源码如下，请查看 pre > code 标签中的内容

Android的截屏监听原理是监听相册中截屏目录的文件新增，需赋予App本地文件读取权限。

在 App 平台本 API 是 uni ext api ，需下载插件：uni-usercapturescreen 需要HBuilder X 3.7.7+版本

在 App 平台本 API 是 uni ext api ，需下载插件：uni-usercapturescreen 需要HBuilder X 3.7.7+版本

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

Example 2 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

Example 3 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

Example 4 (javascript):
```javascript
uni.onUserCaptureScreen(function() {
    console.log('用户截屏了')
});
```

---

## uni.onMemoryWarning(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/memory.html

**Contents:**
- # uni.onMemoryWarning(CALLBACK)
  - # onMemoryWarning 兼容性
- # uni.offMemoryWarning(CALLBACK)
  - # offMemoryWarning 兼容性
      - 本页导读

当 iOS/Android 向小程序进程发出内存警告时，触发该事件。Android 下有告警等级划分，iOS 无等级划分。

本 API 是 uni ext api ，需下载插件：https://ext.dcloud.net.cn/plugin?id=10071

示例源码如下，请查看 pre > code 标签中的内容

取消监听内存不足告警事件。不传入 callback 则取消所有监听。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const callback = function (res) {
 console.log(res,'onMemoryWarningReceive');
}
uni.onMemoryWarning(callback);
```

Example 2 (javascript):
```javascript
const callback = function (res) {
 console.log(res,'onMemoryWarningReceive');
}
uni.onMemoryWarning(callback);
```

Example 3 (javascript):
```javascript
const callback = function (res) {
 console.log(res,'onMemoryWarningReceive');
}
uni.onMemoryWarning(callback);
```

Example 4 (javascript):
```javascript
const callback = function (res) {
 console.log(res,'onMemoryWarningReceive');
}
uni.onMemoryWarning(callback);
```

---

## onPullDownRefresh | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/pulldown

**Contents:**
- # onPullDownRefresh
- # uni.startPullDownRefresh(OBJECT)
  - # startPullDownRefresh 兼容性
- # uni.stopPullDownRefresh()
  - # stopPullDownRefresh 兼容性
- # FAQ
      - 本页导读

在 js 中定义 onPullDownRefresh 处理函数（和onLoad等生命周期函数同级），监听该页面用户下拉刷新事件。

开始下拉刷新，调用后触发下拉刷新动画，效果与用户手动下拉刷新一致。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Q：如何暂时禁用掉下拉刷新，待需要的时候再重新开启？ A：App 平台下可以处理此类场景，详细参考：uni-app 中实现动态禁用/开启下拉刷新

Q：自定义title如何让下拉刷新在title之下 A：App和H5端使用circle方式的下拉刷新，设offset在title高度之下。hello uni-app的模板-导航栏中有示例。小程序端无法实现，除非放弃原生下拉刷新，自己模拟下拉刷新，插件市场有类似插件，但性能不如原生下拉刷新。

Q：如何自定义下拉刷新样式 A：小程序端的原生下拉刷新样式是固定的；App端原生的下拉刷新有2种样式可选择，下拉漏出雪花和下拉circle圈。如果使用nvue，可以使用refresh组件 自定义下拉刷新，都是原生渲染。如果想使用scroll-view在前端实现自定义下拉刷新，需要注意列表不可太长和太复杂，否则会有性能问题。插件市场 搜索下拉刷新有示例。

**Examples:**

Example 1 (unknown):
```unknown
enablePullDownRefresh
```

Example 2 (unknown):
```unknown
uni.stopPullDownRefresh
```

Example 3 (javascript):
```javascript
{
    "pages": [
        {
        	"path": "pages/index/index",
        	"style": {
        		"navigationBarTitleText": "uni-app",
        		"enablePullDownRefresh": true
        	}
        }
    ],
    "globalStyle": {
    	"navigationBarTextStyle": "white",
    	"navigationBarBackgroundColor": "#0faeff",
    	"backgroundColor": "#fbf9fe"
    }
}
```

Example 4 (javascript):
```javascript
{
    "pages": [
        {
        	"path": "pages/index/index",
        	"style": {
        		"navigationBarTitleText": "uni-app",
        		"enablePullDownRefresh": true
        	}
        }
    ],
    "globalStyle": {
    	"navigationBarTextStyle": "white",
    	"navigationBarBackgroundColor": "#0faeff",
    	"backgroundColor": "#fbf9fe"
    }
}
```

---

## uniIDHasRole | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/global

**Contents:**
- # uniIDHasRole
- # uniIDHasPermission
      - 本页导读

新增于HBuilderX 3.1.15，判断当前用户是否拥有某角色。此功能依赖uni-id另见详情

需要应用关联 uniCloud 服务空间并使用 uni-id 。

需要在token内缓存角色权限才可使用，请参考：缓存角色权限

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

新增于HBuilderX 3.1.15，判断当前用户是否拥有某权限，注意：admin角色的用户拥有所有权限。此功能依赖uni-id另见详情

需要应用关联 uniCloud 服务空间并使用 uni-id 。

需要在token内缓存角色权限才可使用，请参考：缓存角色权限

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 3.1.15
```

Example 2 (html):
```html
<template>
  <view v-if="uniIDHasRole('admin')">仅管理员可见</view>
</template>
```

Example 3 (html):
```html
<template>
  <view v-if="uniIDHasRole('admin')">仅管理员可见</view>
</template>
```

Example 4 (html):
```html
<template>
  <view v-if="uniIDHasRole('admin')">仅管理员可见</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-cli-uniapp-test.html

uni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务uni-appuni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务简体中文搜索文档K介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub工程化介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub概述Git/SVNcli 脚手架编译运行环境自动化测试快速开始APIHBuilderX自动化测试插件使用 CLI 运行uniapp自动化测试CLI项目运行自动化测试持续集成uniCloud Web控制台插件市场ask问答社区uni-aduni统计代码仓库：Gitee、GitHubuni-app的uni-im交流群：点击加入官方QQ交流群群35：713420817（2000人已满）群34：530305531（2000人已满）群33：498071674（2000人已满）群32：166188631（2000人已满）群31：567471669（2000人已满）群30：371046920（2000人已满）群29：202965481（2000人已满）群28：166188776（2000人已满）群27：811363410（2000人已满）群26：147867597（2000人已满）群25：165297000（2000人已满）群24：672494800（2000人已满）群23：599958679（2000人已满）群22：687186952（2000人已满）群21：717019120（2000人已满）群20：165796402（2000人已满）群19：165657124（2000人已满）群18：698592271（2000人已满）群17：951348804（2000人已满）群16：719211033（2000人已满）群15：516984120（2000人已满）群14：465953250（2000人已满）群13：699478442（2000人已满）群12：884860657（2000人已满）群11：296811328（2000人已满）群10：959059626（2000人已满）群9：775128777（2000人已满）群8：695442854（2000人已满）群7：942061423（2000人已满）群6：697264024（2000人已满）群5：731951419（2000人已满）群4：942702595（2000人已满）群3：773794803（2000人已满）群2：901474938（2000人已满）群1：531031261（2000人已满）关注微信公众号插件安装cli使用方法支持的平台参数说明uni-app 自动化测试依赖说明示例通过npm scripts使用CLI添加 npm 脚本支持使用npm命令查看日志#uniapp.test CLI 命令行工具文档插件市场HBuilderX uni-app自动化测试插件 4.1.0版本起，支持被HBuilderX CLI调用了。支持在命令行运行 uni-app (x) 自动化测试到 Web、微信小程序、Android、iOS 和 Harmony。关于HBuilderX cli命令基本介绍，请参考：https://hx.dcloud.net.cn/cli/README特别注意事项：运行HBuilderXcli uniapp.test前，请先确保HBuilderX uni-app自动化测试插件可以在HBuilderX内正常使用。#插件安装插件安装地址在插件市场，点击【导入插件】，会自动拉起本地安装的HBuilderX。#cli使用方法注意事项：使用CLI需要进入HBuilderX安装目录；在windows电脑，HBuilderX安装目录下调用cli命令要输入完整，具体为.\cli.exe以下是该工具的基本用法：// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>示例源码如下，请查看 pre > code 标签中的内容// 查看帮助
cli uniapp.test --help

// 基本使用方法
cli uniapp.test <platform> --project <ProjectPath>

// windows电脑基本使用方法
.\cli.exe uniapp.test <platform> --project <ProjectPath>#支持的平台Webweb-chrome：在 Chrome 浏览器中运行测试web-safari：在 Safari 浏览器中运行测试web-firefox：在 Firefox 浏览器中运行测试小程序mp-weixin：在微信小程序中运行测试移动应用app-android：在 Android 设备上运行测试app-ios-simulator：在 iOS 模拟器中运行测试app-harmony：在 Harmony 设备上运行测试#参数说明必需参数--project <ProjectPath>：指定项目的路径。可选参数--testcaseFile <testcase_file_path>：指定测试用例文件的路径（仅适用于app-harmony）。--device_id <id>：指定设备 ID（仅适用于app-harmony）。--help：显示命令帮助信息。--version：查看插件版本号。#uni-app 自动化测试依赖说明如果您没有安装自动化测试依赖，调用HBuilderX CLI测试时，会出现如下提示，请根据提示语进行操作。注意：playwright，依赖包体积很大（约1G左右），安装受限于网络、操作系统等环境，可能安装较慢。如果playwright安装遇到问题，请参考:https://playwright.dev/docs/intro#示例注意事项：请先在终端切换到HBuilderX安装目录，再运行以下命令。运行测试到chrome// Mac电脑
/Applications/HBuilderX.app/Contents/MacOS/cli uniapp.test web-chrome--project/path/to/your/project

// windows电脑
D:\ide\HBuilderX\cli.exe uniapp.test web-chrome--project/path/to/your/project示例源码如下，请查看 pre > code 标签中的内容// Mac电脑
/Applications/HBuilderX.app/Contents/MacOS/cli uniapp.test web-chrome --project /path/to/your/project

// windows电脑
D:\ide\HBuilderX\cli.exe uniapp.test web-chrome --project /path/to/your/project运行测试到微信开发者工具cli uniapp.test mp-weixin--project/path/to/your/project示例源码如下，请查看 pre > code 标签中的内容cli uniapp.test mp-weixin --project /path/to/your/project运行测试到Androidcli uniapp.test app-android--project/path/to/your/project示例源码如下，请查看 pre > code 标签中的内容cli uniapp.test app-android --project /path/to/your/project指定设备IDcli uniapp.test app-android--project/path/to/your/project--device_idfeyh2342343uos8ai89jr4p示例源码如下，请查看 pre > code 标签中的内容cli uniapp.test app-android --project /path/to/your/project --device_id feyh2342343uos8ai89jr4p运行特定的测试用例文件cli uniapp.test app-android--project/path/to/your/project--testcaseFilepages/index/index.test.js示例源码如下，请查看 pre > code 标签中的内容cli uniapp.test app-android --project /path/to/your/project --testcaseFile pages/index/index.test.js#通过npm scripts使用CLI我们需要在项目中安装@dcloudio/hbuilderx-cli,它是一个桥梁，让我们可以通过命令行来调用 HBuilderX 的强大功能（如启动测试流程）。#添加 npm 脚本支持# 首先，请确保你的项目根目录下有 package.json 文件。如果没有，可以通过以下命令快速生成：npminit-y# 然后，安装 hbuilderx-cli 作为开发依赖：npminstall@dcloudio/hbuilderx-cli --save-dev示例源码如下，请查看 pre > code 标签中的内容# 首先，请确保你的项目根目录下有 package.json 文件。如果没有，可以通过以下命令快速生成：
npm init -y

# 然后，安装 hbuilderx-cli 作为开发依赖：
npm install @dcloudio/hbuilderx-cli --save-dev#使用npm命令查看日志# 在 Chrome 中测试npmrun test:web ----browserChrome# 在 Safari 中测试npmrun test:web ----browserSafari# 在连接的 Android 设备上测试 (默认会使用第一个android设备进行测试)npmrun test:app-android# 在 iOS 模拟器上测试 (默认会使用第一个iOS模拟器设备进行测试)npmrun test:app-ios# 在连接的 Harmony 设备上测试 (默认会使用第一个Harmony设备进行测试)npmrun test:app-harmony# 在指定的 Android 设备上测试 (需替换为你的设备ID)npmrun test:app-android ----udidyour_device_id示例源码如下，请查看 pre > code 标签中的内容# 在 Chrome 中测试
npm run test:web -- --browser Chrome

# 在 Safari 中测试
npm run test:web -- --browser Safari

# 在连接的 Android 设备上测试 (默认会使用第一个android设备进行测试)
npm run test:app-android

# 在 iOS 模拟器上测试 (默认会使用第一个iOS模拟器设备进行测试)
npm run test:app-ios

# 在连接的 Harmony 设备上测试 (默认会使用第一个Harmony设备进行测试)
npm run test:app-harmony

# 在指定的 Android 设备上测试 (需替换为你的设备ID)
npm run test:app-android -- --udid your_device_id帮助我们改善此页面！上次更新:2026/1/8 11:26:36开发产品HBuilderXuni-appuni-app xuniClouduniMPsdk5+Runtimewap2appMUIuni-iduni-cdnuni-payuni-pushuni一键登录uni实人认证smsuni-starteruni-adminuni-upgrade-centeruni-imuni-aiuni-cmsuniCloud-mapuni-search运营产品uni-aduni统计uni发行uni安全专题开发者服务问答社区开发者后台技术文档uni-app文档uniCloud文档原生开发者支持文档HBuilder文档生态服务插件市场OAuth用户开放平台关于我们：DCloud官网案例需求墙许可协议加入我们赞助我们联系我们：商务合作：bd@dcloud.io广告合作：uniad@dcloud.ioDCloud.io数字天堂（北京）网络技术有限公司是HTML5中国产业联盟发起单位京公网安备：11010802035340号国家信息安全等级保护三级，证书编号：11010813802-20001本页导读插件安装cli使用方法支持的平台参数说明uni-app 自动化测试依赖说明示例通过npm scripts使用CLI添加 npm 脚本支持使用npm命令查看日志

---

## uni.setStorage(OBJECT) @setstorage | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/storage/storage.html

**Contents:**
- # uni.setStorage(OBJECT)
  - # setStorage 兼容性
- # uni.setStorageSync(KEY,DATA)
- # uni.getStorage(OBJECT)
  - # getStorage 兼容性
- # uni.getStorageSync(KEY)
  - # getStorageSync 兼容性
- # uni.getStorageInfo(OBJECT)
  - # getStorageInfo 兼容性
- # uni.getStorageInfoSync()

将数据存储在本地缓存中指定的 key 中，会覆盖掉原来该 key 对应的内容，这是一个异步接口。

示例源码如下，请查看 pre > code 标签中的内容

将 data 存储在本地缓存中指定的 key 中，会覆盖掉原来该 key 对应的内容，这是一个同步接口。

示例源码如下，请查看 pre > code 标签中的内容

从本地缓存中异步获取指定 key 对应的内容。

示例源码如下，请查看 pre > code 标签中的内容

从本地缓存中同步获取指定 key 对应的内容。

示例源码如下，请查看 pre > code 标签中的内容

异步获取当前 storage 的相关信息。

示例源码如下，请查看 pre > code 标签中的内容

同步获取当前 storage 的相关信息。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app的Storage在不同端的实现不同：

**Examples:**

Example 1 (javascript):
```javascript
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/a-d/rewarded-video.html

**Contents:**
  - # 语法
  - # 参数说明
  - # 返回值
  - # 广告创建
  - # 推荐接入示例
  - # 显示/隐藏
  - # 广告拉取成功与失败
  - # 拉取失败，重新拉取
  - # 监听用户关闭广告
  - # 服务器回调

激励视频广告组件是原生组件，层级最高，会覆盖在普通前端组件上。

uni.createRewardedVideoAd(options)

options 为 object 类型，属性如下：

返回值为 RewarededVideoAd 类型，属性如下：

开发者可以调用 uni.createRewardedVideoAd 创建激励视频广告组件。

激励视频广告组件默认是隐藏的，因此可以提前创建，以提前初始化组件。开发者可以在页面的 onReady 事件回调中创建广告实例，并在该页面的生命周期内重复调用该广告实例。

示例源码如下，请查看 pre > code 标签中的内容

ad.js 是对 uni.createRewardedVideoAd 的封装，一个页面缓存多页面生效，避免每个页面都预载而不展示的问题，可以传入不同广告位，内部处理了Loading状态、快速点击、数据过期、失败重试1次逻辑

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

激励视频广告组件默认是隐藏的，在用户主动触发广告后，开发者需要调用 RewardedVideoAd.show() 进行显示。

示例源码如下，请查看 pre > code 标签中的内容

只有在用户点击激励视频广告组件上的 关闭广告 按钮时，广告才会关闭。开发者不可控制激励视频广告组件的隐藏。

激励视频广告组件是自动拉取广告并进行更新的。在组件创建后会拉取一次广告，用户点击 关闭广告 后会去拉取下一条广告。

如果拉取成功，通过 RewardedVideoAd.onLoad() 注册的回调函数会执行，RewardedVideoAd.show() 返回的 Promise 也会是一个 resolved Promise。两者的回调函数中都没有参数传递。

示例源码如下，请查看 pre > code 标签中的内容

如果拉取失败，通过 RewardedVideoAd.onError() 注册的回调函数会执行，回调函数的参数是一个包含错误信息的对象。常见异常错误参考文档

示例源码如下，请查看 pre > code 标签中的内容

RewardedVideoAd.show() 返回的 Promise 也会是一个 rejected Promise。

示例源码如下，请查看 pre > code 标签中的内容

如果组件的某次自动拉取失败，那么之后调用的 show() 将会被 reject。此时可以调用 RewardedVideoAd.load() 手动重新拉取广告。

示例源码如下，请查看 pre > code 标签中的内容

如果组件的自动拉取是成功的，那么调用 load() 方法会直接返回一个 resolved Promise，而不会去拉取广告。

示例源码如下，请查看 pre > code 标签中的内容

只有在用户点击激励视频广告组件上的 关闭广告 按钮时，广告才会关闭。这个事件可以通过 RewardedVideoAd.onClose() 监听。

RewardedVideoAd.onClose() 的回调函数会传入一个参数 res，res.isEnded 描述广告被关闭时的状态。

开发者需要根据 res.isEnded 判断是否视频是否播放结束，如果成功播放完毕则应该向用户发放奖励。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.createRewardedVideoAd(options)
```

Example 2 (unknown):
```unknown
uni.createRewardedVideoAd
```

Example 3 (html):
```html
<script>
    export default {
        data() {
            return {
                title: 'createRewardedVideoAd'
            }
        },
        onReady() {
          this._isLoaded = false
          rewardedVideoAd = this._rewardedVideoAd = uni.createRewardedVideoAd({ adpid: '1507000689' }) // 仅用于HBuilder基座调试 adpid: '1507000689'
          rewardedVideoAd.onLoad(() => {
            this._isLoaded = true
            console.log('onLoad event')
            // 当激励视频被关闭时，默认预载下一条数据，加载完成时仍然触发 `onLoad` 事件
          })
          rewardedVideoAd.onError((err) => {
            console.log('onError event', err)
          })
          rewardedVideoAd.onClose((res) => {
            console.log('onClose event', res)
          })
        },
        methods: {
          show() {
            if (this._isLoaded) {
              this._rewardedVideoAd.show()
            }
          }
        }
    }
</script>
```

Example 4 (html):
```html
<script>
    export default {
        data() {
            return {
                title: 'createRewardedVideoAd'
            }
        },
        onReady() {
          this._isLoaded = false
          rewardedVideoAd = this._rewardedVideoAd = uni.createRewardedVideoAd({ adpid: '1507000689' }) // 仅用于HBuilder基座调试 adpid: '1507000689'
          rewardedVideoAd.onLoad(() => {
            this._isLoaded = true
            console.log('onLoad event')
            // 当激励视频被关闭时，默认预载下一条数据，加载完成时仍然触发 `onLoad` 事件
          })
          rewardedVideoAd.onError((err) => {
            console.log('onError event', err)
          })
          rewardedVideoAd.onClose((res) => {
            console.log('onClose event', res)
          })
        },
        methods: {
          show() {
            if (this._isLoaded) {
              this._rewardedVideoAd.show()
            }
          }
        }
    }
</script>
```

---

## 卡券 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/card.html

**Contents:**
    - # 卡券
      - 本页导读

仅微信小程序、支付宝小程序支持，各平台开发方式暂未统一，使用时需注意用条件编译 调用不同平台的代码。

---

## uni.addInterceptor(STRING, OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/interceptor

**Contents:**
- # uni.addInterceptor(STRING, OBJECT)
  - # addInterceptor 兼容性
- # uni.removeInterceptor(STRING)
  - # removeInterceptor 兼容性
      - # 拦截器的适用场景非常多，比如路由拦截，权限引导等。
      - 本页导读

需要拦截的api名称，如：uni.addInterceptor('request', OBJECT) ，将拦截 uni.request()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：拦截uni.switchTab 本身没有问题。但是在微信小程序端点击tabbar的底层逻辑并不是触发uni.switchTab。所以误认为拦截无效，此类场景的解决方案是在tabbar页面的页面生命周期onShow中处理。

你可以参考插件市场,拦截器应用示例：图片选择api时无权限，引导用户快捷打开系统设置：https://ext.dcloud.net.cn/plugin?id=5095

**Examples:**

Example 1 (unknown):
```unknown
uni.addInterceptor('request', OBJECT)
```

Example 2 (unknown):
```unknown
uni.request()
```

Example 3 (unknown):
```unknown
uni.setStorage(OBJECT)
```

Example 4 (unknown):
```unknown
uni.setStorageSync(KEY,DATA)
```

---

## uni.setStorage(OBJECT) @setstorage | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/storage/storage

**Contents:**
- # uni.setStorage(OBJECT)
  - # setStorage 兼容性
- # uni.setStorageSync(KEY,DATA)
- # uni.getStorage(OBJECT)
  - # getStorage 兼容性
- # uni.getStorageSync(KEY)
  - # getStorageSync 兼容性
- # uni.getStorageInfo(OBJECT)
  - # getStorageInfo 兼容性
- # uni.getStorageInfoSync()

将数据存储在本地缓存中指定的 key 中，会覆盖掉原来该 key 对应的内容，这是一个异步接口。

示例源码如下，请查看 pre > code 标签中的内容

将 data 存储在本地缓存中指定的 key 中，会覆盖掉原来该 key 对应的内容，这是一个同步接口。

示例源码如下，请查看 pre > code 标签中的内容

从本地缓存中异步获取指定 key 对应的内容。

示例源码如下，请查看 pre > code 标签中的内容

从本地缓存中同步获取指定 key 对应的内容。

示例源码如下，请查看 pre > code 标签中的内容

异步获取当前 storage 的相关信息。

示例源码如下，请查看 pre > code 标签中的内容

同步获取当前 storage 的相关信息。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app的Storage在不同端的实现不同：

**Examples:**

Example 1 (javascript):
```javascript
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.setStorage({
	key: 'storage_key',
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/window/subNVues

**Contents:**
- # uni.getSubNVueById(subNvueId)
  - # 返回值
- # uni.getCurrentSubNVue()
  - # 返回值
  - # subNVue 对象的方法列表
- # subNVue.show (aniShow,duration,showedCB)
- # subNVue.hide (aniShow,duration)
- # subNVue.setStyle (style)
- # subNVue.postMessage(OBJECT)
- # subNVue.onMessage(CallBack)

subNvue，是 vue 页面的原生子窗体，把weex渲染的原生界面当做 vue 页面的子窗体覆盖在页面上。它不是全屏页面，它给App平台vue页面中的层级覆盖和原生界面自定义提供了更强大和灵活的解决方案。它也不是组件，就是一个原生子窗体。

它的设计背景和用途详见：subNVue 原生子窗体开发指南

subNvue 自1.9.10 起支持 ，仅支持 app 平台

通过 ID 获取 subNVues 原生子窗体的实例。 subNVues 配置

示例源码如下，请查看 pre > code 标签中的内容

在一个subnvue窗体的nvue页面代码中，获取当前 subNVues 原生子窗体的实例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

发送消息，此通讯方式已过时，请使用uni.$emit进行通讯，参考

示例源码如下，请查看 pre > code 标签中的内容

监听消息，此通讯方式已过时，请使用uni.$on进行通讯，参考

示例源码如下，请查看 pre > code 标签中的内容

显示动画与关闭动画，会有默认的对应规则。但是如果通过 API 原生子窗体的关闭动画类型，则不会使用默认的类型。

**Examples:**

Example 1 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

Example 2 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

Example 3 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

Example 4 (javascript):
```javascript
const subNVue = uni.getSubNVueById('popup');
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/facialRecognitionVerify.html

**Contents:**
- # uni.getFacialRecognitionMetaInfo()
  - # getFacialRecognitionMetaInfo 兼容性
- # uni.startFacialRecognitionVerify(OBJECT)
  - # startFacialRecognitionVerify 兼容性
      - 本页导读

实人认证提供核验终端操作者的真实身份，包含活体检测和人脸对比等生物识别技术，可快速校验自然人的真实身份。

uni.getFacialRecognitionMetaInfo是客户端API，获取实人认证设备信息，用于uniCloud云函数getCertifyId 获取certifyId。

uni.startFacialRecognitionVerify是客户端API，在App端打开刷脸认证界面。

**Examples:**

Example 1 (php):
```php
工程根目录->build-profile.json5->app.products.buildOption.strictMode.caseSensitiveCheck
```

Example 2 (unknown):
```unknown
uni.getFacialRecognitionMetaInfo
```

---

## uni.openSetting(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/setting.html

**Contents:**
- # uni.openSetting(OBJECT)
- # uni.getSetting(OBJECT)
  - # 示例代码
      - 本页导读

调起客户端小程序设置界面，返回用户设置的操作结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

Example 2 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

Example 3 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

Example 4 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/uniapp-cli-project.html

**Contents:**
- # uni-app cli项目
  - # H5平台测试流程
  - # App-Android测试流程
  - # App-iOS测试流程
  - # 微信小程序测试流程
  - # 测试示例
    - # 屏幕截图示例
      - 本页导读

创建 cli 工程，详见https://uniapp.dcloud.io/quickstart-cli.html

如果之前是HBuilderX工程，则把HBuilderX工程内的文件（除 unpackage、node_modules 目录）拷贝至 vue-cli 工程的 src 目录。 在 vue-cli 工程内重新安装 npm 依赖（如果之前使用了 npm 依赖的话）

cli创建项目时若选择hello uni-app模板，可看到其中已经自带部分测试例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意： 从v3.0.0开始，Puppeteer 开始依赖于Node 10.18.1+ ，Puppeteer仅支持14.0.0及以下版本

根据API编写测试的js代码，参考测试用例 API文档见：https://uniapp.dcloud.io/collocation/auto/api 测试文件目录配置见 jest.config.js

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更多配置参考 jest.config.js

配置 Hbuilder 调试基座/自定义基座 android_base.apk 目录，参考 jest.config.js

创建 cli 工程/现有 cli 工程 切换到工程目录，安装依赖包 adbkit

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

目前仅支持 iOS 模拟器（需要mac电脑安装xcode）

示例源码如下，请查看 pre > code 标签中的内容

配置模拟器id，参考 jest.config.js

配置 Hbuilder 调试基座/自定义基座 Pandora_simulator.app 目录，参考 jest.config.js

示例源码如下，请查看 pre > code 标签中的内容

创建cli项目，同H5平台 (必须配置微信小程序 appid, manifest.json -> mp-weixin -> appid)

运行测试(如果微信开发者工具无法成功打开项目，请手动打开)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用 hello uni-app 工程测试 H5 平台

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更多测试示例见： hello uni-app

GitHub： https://github.com/dcloudio/hello-uniapp

**Examples:**

Example 1 (unknown):
```unknown
hello uni-app
```

Example 2 (python):
```python
jest@27.0.4
jest-environment-node@27.5.1
```

Example 3 (python):
```python
jest@27.0.4
jest-environment-node@27.5.1
```

Example 4 (python):
```python
jest@27.0.4
jest-environment-node@27.5.1
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/file.html

**Contents:**
- # uni.chooseFile(OBJECT)
  - # chooseFile 兼容性
- # wx.chooseMessageFile(OBJECT)
      - 本页导读

文件需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

本API主要用于选择非媒体文件，如果选择的文件是媒体文件，另有3个专用API：

注：文件的临时路径，在应用本次启动期间可以正常使用，如需持久保存，需在主动调用 uni.saveFile，在应用下次启动时才能访问得到。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
(HBuilder X2.9.9+)
```

Example 2 (unknown):
```unknown
(可使用wx.chooseMessageFile)
```

Example 3 (unknown):
```unknown
tempFilePaths
```

Example 4 (json):
```json
['.zip','.exe','.js']
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/a-d/rewarded-video

**Contents:**
  - # 语法
  - # 参数说明
  - # 返回值
  - # 广告创建
  - # 推荐接入示例
  - # 显示/隐藏
  - # 广告拉取成功与失败
  - # 拉取失败，重新拉取
  - # 监听用户关闭广告
  - # 服务器回调

激励视频广告组件是原生组件，层级最高，会覆盖在普通前端组件上。

uni.createRewardedVideoAd(options)

options 为 object 类型，属性如下：

返回值为 RewarededVideoAd 类型，属性如下：

开发者可以调用 uni.createRewardedVideoAd 创建激励视频广告组件。

激励视频广告组件默认是隐藏的，因此可以提前创建，以提前初始化组件。开发者可以在页面的 onReady 事件回调中创建广告实例，并在该页面的生命周期内重复调用该广告实例。

示例源码如下，请查看 pre > code 标签中的内容

ad.js 是对 uni.createRewardedVideoAd 的封装，一个页面缓存多页面生效，避免每个页面都预载而不展示的问题，可以传入不同广告位，内部处理了Loading状态、快速点击、数据过期、失败重试1次逻辑

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

激励视频广告组件默认是隐藏的，在用户主动触发广告后，开发者需要调用 RewardedVideoAd.show() 进行显示。

示例源码如下，请查看 pre > code 标签中的内容

只有在用户点击激励视频广告组件上的 关闭广告 按钮时，广告才会关闭。开发者不可控制激励视频广告组件的隐藏。

激励视频广告组件是自动拉取广告并进行更新的。在组件创建后会拉取一次广告，用户点击 关闭广告 后会去拉取下一条广告。

如果拉取成功，通过 RewardedVideoAd.onLoad() 注册的回调函数会执行，RewardedVideoAd.show() 返回的 Promise 也会是一个 resolved Promise。两者的回调函数中都没有参数传递。

示例源码如下，请查看 pre > code 标签中的内容

如果拉取失败，通过 RewardedVideoAd.onError() 注册的回调函数会执行，回调函数的参数是一个包含错误信息的对象。常见异常错误参考文档

示例源码如下，请查看 pre > code 标签中的内容

RewardedVideoAd.show() 返回的 Promise 也会是一个 rejected Promise。

示例源码如下，请查看 pre > code 标签中的内容

如果组件的某次自动拉取失败，那么之后调用的 show() 将会被 reject。此时可以调用 RewardedVideoAd.load() 手动重新拉取广告。

示例源码如下，请查看 pre > code 标签中的内容

如果组件的自动拉取是成功的，那么调用 load() 方法会直接返回一个 resolved Promise，而不会去拉取广告。

示例源码如下，请查看 pre > code 标签中的内容

只有在用户点击激励视频广告组件上的 关闭广告 按钮时，广告才会关闭。这个事件可以通过 RewardedVideoAd.onClose() 监听。

RewardedVideoAd.onClose() 的回调函数会传入一个参数 res，res.isEnded 描述广告被关闭时的状态。

开发者需要根据 res.isEnded 判断是否视频是否播放结束，如果成功播放完毕则应该向用户发放奖励。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.createRewardedVideoAd(options)
```

Example 2 (unknown):
```unknown
uni.createRewardedVideoAd
```

Example 3 (html):
```html
<script>
    export default {
        data() {
            return {
                title: 'createRewardedVideoAd'
            }
        },
        onReady() {
          this._isLoaded = false
          rewardedVideoAd = this._rewardedVideoAd = uni.createRewardedVideoAd({ adpid: '1507000689' }) // 仅用于HBuilder基座调试 adpid: '1507000689'
          rewardedVideoAd.onLoad(() => {
            this._isLoaded = true
            console.log('onLoad event')
            // 当激励视频被关闭时，默认预载下一条数据，加载完成时仍然触发 `onLoad` 事件
          })
          rewardedVideoAd.onError((err) => {
            console.log('onError event', err)
          })
          rewardedVideoAd.onClose((res) => {
            console.log('onClose event', res)
          })
        },
        methods: {
          show() {
            if (this._isLoaded) {
              this._rewardedVideoAd.show()
            }
          }
        }
    }
</script>
```

Example 4 (html):
```html
<script>
    export default {
        data() {
            return {
                title: 'createRewardedVideoAd'
            }
        },
        onReady() {
          this._isLoaded = false
          rewardedVideoAd = this._rewardedVideoAd = uni.createRewardedVideoAd({ adpid: '1507000689' }) // 仅用于HBuilder基座调试 adpid: '1507000689'
          rewardedVideoAd.onLoad(() => {
            this._isLoaded = true
            console.log('onLoad event')
            // 当激励视频被关闭时，默认预载下一条数据，加载完成时仍然触发 `onLoad` 事件
          })
          rewardedVideoAd.onError((err) => {
            console.log('onError event', err)
          })
          rewardedVideoAd.onClose((res) => {
            console.log('onClose event', res)
          })
        },
        methods: {
          show() {
            if (this._isLoaded) {
              this._rewardedVideoAd.show()
            }
          }
        }
    }
</script>
```

---

## uni.chooseInvoiceTitle(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/invoice-title.html

**Contents:**
- # uni.chooseInvoiceTitle(OBJECT)
      - 本页导读

选择用户的发票抬头，需要用户授权 scope.invoiceTitle。

在微信小程序中，当前小程序必须关联一个公众号，且这个公众号是完成了微信认证 的，才能调用 chooseInvoiceTitle。

|属性|类型|必填|说明| |:-|:-|:-|:-|:-| |success|function|否|接口调用成功的回调函数| |fail|function|否|接口调用失败的回调函数| |complete|function|否|接口调用结束的回调函数（调用成功、失败都会执行）|

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

Example 2 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

Example 3 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

Example 4 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

---

## uni.getUpdateManager() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/update

**Contents:**
- # uni.getUpdateManager()
      - 本页导读

本API返回全局唯一的版本更新管理器对象： updateManager，用于管理小程序更新。

updateManager 对象的方法列表：

onCheckForUpdate(callback) 回调结果说明：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

Example 2 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

Example 3 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

Example 4 (javascript):
```javascript
const updateManager = uni.getUpdateManager();

updateManager.onCheckForUpdate(function (res) {
  // 请求完新版本信息的回调
  console.log(res.hasUpdate);
});

updateManager.onUpdateReady(function (res) {
  uni.showModal({
    title: '更新提示',
    content: '新版本已经准备好，是否重启应用？',
    success(res) {
      if (res.confirm) {
        // 新的版本已经下载好，调用 applyUpdate 应用新版本并重启
        updateManager.applyUpdate();
      }
    }
  });

});

updateManager.onUpdateFailed(function (res) {
  // 新的版本下载失败
});
```

---

## uniIDHasRole | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/global.html

**Contents:**
- # uniIDHasRole
- # uniIDHasPermission
      - 本页导读

新增于HBuilderX 3.1.15，判断当前用户是否拥有某角色。此功能依赖uni-id另见详情

需要应用关联 uniCloud 服务空间并使用 uni-id 。

需要在token内缓存角色权限才可使用，请参考：缓存角色权限

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

新增于HBuilderX 3.1.15，判断当前用户是否拥有某权限，注意：admin角色的用户拥有所有权限。此功能依赖uni-id另见详情

需要应用关联 uniCloud 服务空间并使用 uni-id 。

需要在token内缓存角色权限才可使用，请参考：缓存角色权限

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 3.1.15
```

Example 2 (html):
```html
<template>
  <view v-if="uniIDHasRole('admin')">仅管理员可见</view>
</template>
```

Example 3 (html):
```html
<template>
  <view v-if="uniIDHasRole('admin')">仅管理员可见</view>
</template>
```

Example 4 (html):
```html
<template>
  <view v-if="uniIDHasRole('admin')">仅管理员可见</view>
</template>
```

---

## uni.createInnerAudioContext() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/audio-context.html

**Contents:**
- # uni.createInnerAudioContext()
  - # createInnerAudioContext 兼容性
      - 本页导读

创建并返回内部 audio 上下文 innerAudioContext 对象。

innerAudioContext 对象的属性列表

innerAudioContext 对象的方法列表

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
innerAudioContext
```

Example 2 (unknown):
```unknown
uni.createInnerAudioContext()
```

Example 3 (javascript):
```javascript
const innerAudioContext = uni.createInnerAudioContext();
innerAudioContext.autoplay = true;
innerAudioContext.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
innerAudioContext.onPlay(() => {
  console.log('开始播放');
});
innerAudioContext.onError((res) => {
  console.log(res.errMsg);
  console.log(res.errCode);
});


**当出现-99错误时** 可以按照下面思路进行排查：

```javascript
// 多次会调用播放新的文件时，提前销毁实例，可避免-99错误
if (innerAudioContext) {
  try {
    innerAudioContext.pause();
    innerAudioContext.destroy()
    innerAudioContext = null
  } catch (e) {
    //TODO handle the exception
  }
}
```

Example 4 (javascript):
```javascript
const innerAudioContext = uni.createInnerAudioContext();
innerAudioContext.autoplay = true;
innerAudioContext.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
innerAudioContext.onPlay(() => {
  console.log('开始播放');
});
innerAudioContext.onError((res) => {
  console.log(res.errMsg);
  console.log(res.errCode);
});


**当出现-99错误时** 可以按照下面思路进行排查：

```javascript
// 多次会调用播放新的文件时，提前销毁实例，可避免-99错误
if (innerAudioContext) {
  try {
    innerAudioContext.pause();
    innerAudioContext.destroy()
    innerAudioContext = null
  } catch (e) {
    //TODO handle the exception
  }
}
```

---

## UDP 通信 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/UDP.html

**Contents:**
    - # UDP 通信
      - 本页导读

---

## uni.saveFile(OBJECT) @savefile | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/file/file

**Contents:**
- # uni.saveFile(OBJECT)
  - # saveFile 兼容性
- # uni.getSavedFileList(OBJECT)
  - # getSavedFileList 兼容性
- # uni.getSavedFileInfo(OBJECT)
  - # getSavedFileInfo 兼容性
- # uni.removeSavedFile(OBJECT)
  - # removeSavedFile 兼容性
- # uni.getFileInfo(OBJECT)
  - # getFileInfo 兼容性

注意：saveFile 会把临时文件移动，因此调用成功后传入的 tempFilePath 将不可用

微信小程序已停止维护wx.saveFile(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序已停止维护wx.getSavedFileList(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

获取本地文件的文件信息。此接口只能用于获取已保存到本地的文件。

微信小程序已停止维护wx.getSavedFileInfo(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序已停止维护wx.removeSavedFile(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序已停止维护wx.getFileInfo(Object object) 接口，建议使用FileSystemManager 对象中的方法。

新开页面打开文档，支持格式：doc, xls, ppt, pdf, docx, xlsx, pptx。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

Example 2 (javascript):
```javascript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

Example 3 (javascript):
```javascript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

Example 4 (gdscript):
```gdscript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

---

## 定时器 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/timer.html

**Contents:**
- # 定时器
- # setTimeout(callback, delay, rest)
- # clearTimeout(timeoutID)
  - # 最佳实践
- # setInterval(callback, delay, rest)
- # clearInterval(intervalID)
  - # 最佳实践
- # 注意事项
      - 本页导读

设定一个定时器。在定时到期以后执行注册的回调函数

取消由 setTimeout 设置的定时器。

定时器应当在组件、页面销毁时候取消，否则该定时器将成为游离定时器，无法被回收销毁。

示例源码如下，请查看 pre > code 标签中的内容

设定一个定时器。按照指定的周期（以毫秒计）来执行注册的回调函数

示例源码如下，请查看 pre > code 标签中的内容

取消由 setInterval 设置的定时器。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

Example 2 (html):
```html
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

Example 3 (html):
```html
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

Example 4 (vue):
```vue
<script lang="ts">
	let timer: ReturnType<typeof setTimeout> | null = null;
	export default {
		data() {
			return {};
		},
		methods: {
			onSetTimeout() {
				timer = setTimeout(() => {
					console.log("setTimeout");
				}, 1000);
			},
			clearTimer() {
				// clearTime
				if (timer) {
					clearTimeout(timer);
					timer = null;
				}
			},
		},
		beforeUnmount() {
			// clearTime
			this.clearTimer();
		},
	};
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-plugin.html

**Contents:**
- # UTS插件介绍
- # 介绍
  - # 什么是uts语言
  - # 什么是uts插件
  - # uts插件与老版uni原生语言插件的区别
  - # uts插件和Native.js的区别
- # 创建uts插件
  - # HBuilderX项目中uts插件目录结构
  - # 新建步骤拆解
  - # package.json

HBuilderX 3.6+ 支持uni-app中使用uts插件 HBuilderX 3.9+ 支持uni-app x中使用uts插件

UTS插件开发官方uni-im交流群点此加入

uts，全称 uni type script，统一、强类型、脚本语言。

uts 采用了与 ts 基本一致的语法规范，支持绝大部分 ES6 API。

如需详细了解uts语法，另见uts语法介绍

uts插件，指利用uts语法，操作原生的API（包括手机os的api或三方sdk），并封装成一个uni_modules 插件，供前端调用。

uni-app中，是js来调用uts插件。（HBuilderX 3.6支持vue3编译器，3.6.8支持vue2编译器）

uni-app x中，是uts来调用uts插件。（HBuilderX 3.9支持）

也就是一个uts插件，可以同时支持uni-app和uni-app x。

为了兼容全端，uts插件可以分目录写所有平台代码，也就是一个uts插件除了支持App的扩展，还可以支持web、小程序。

比如这个uts插件，电量 ，其源码在uni-getbatteryinfo ，内部有多个目录（app-android、app-ios、web、mp-weixin、mp-alipay...），在非App目录也可以写js。

这个电量插件在uni-app和uni-app x中均可以使用。

uts插件分api和组件。这和uni-app的组件、api的概念是一样的。

api插件也可以操作界面，但更多是独立的全屏窗口或弹出窗口。而不能嵌入在template中。

比如lottie动画的uts插件，就是一个组件插件。https://ext.dcloud.net.cn/plugin?id=10674 ，其源码在uni-animation-view

本章节适用于老插件作者，了解uts插件比老版uni原生语言插件的好处。新插件作者可以跳过本章节。

uts 插件编译到 app 平台时，在功能上相当于 uni-app 之前的 app 原生插件。都是给app扩展原生能力。

开发 uts 插件不需要熟悉 Kotlin 和 Swift 的语法，因为使用的是 uts语法。但需要熟悉 Android 和 iOS 的系统 API，至少需要知道什么原生能力在哪个API里。

在 HBuilderX 3.6 以前，uni-app 在 App 侧只有一种原生插件，即用 java 或 Objective-C 开发的插件。

在 uts 推出后，原来的 “App原生插件”，更名为 “App原生语言插件”。

不同的名字，代表它们需要开发者编写语言不同。但殊途同归，最后都编译为原生的二进制代码。

如果您是插件作者，可以了解更多uts插件和uni原生语言插件对插件作者的区别。详见

更新：“App原生语言插件”已停止维护，插件市场不再受理新增App原生插件。请插件开发者都使用uts插件。

注意： 目前仅支持通过HBuilder X 创建和使用UTS插件，不支持通过cli的方式使用UTS插件

在 uni-app / uni-app x 的项目工程下，提供了独立的目录 utssdk，来存放 uts 插件。

当然官方更推荐使用 uni_modules 方式，这是更好的包管理方案。

首先确保项目根目录存在 uni_modules 文件夹，如果不存在，需要手动创建一个。

右键点击uni_modules目录 -> 新建插件

为了避免和插件市场的其他插件冲突，建议起一个自己的插件前缀名称。

package.json 为 uni_modules 插件配置清单文件，负责描述插件的基本配置。

示例源码如下，请查看 pre > code 标签中的内容

上面是一个默认的清单文件示例,关于 package.json 更多描述详见

根目录 index.uts 文件是程序主入口。如果插件根目录下没有 index.uts，则会在编译到不同平台时，寻找分平台的目录下的 index.uts 文件。

比如编译到 app-android 平台时，如果 uts 插件根目录没有 index.uts，会寻找 utssdk/app-android/index.uts。如果也没有找到，会报错。

当同时存在分平台目录的 index.uts 和根目录 index.uts 时，会优先获取具体的分平台目录。

插件对外暴露能力的总入口在 interface.uts ，他与 index.uts的关系是声明和实现的关系。

在这里声明的类型，HBuilderX 可以自动识别 并进行语法提示。

app-android 文件夹下存在Android平台原生配置，包括以下目录或文件

Android平台原生assets资源目录，建议只保存UTS插件内置的资源文件。

除了插件下有assets目录，项目下也有。注意2者的区别。 如果需要插件使用者配置（如三方SDK的授权文件），则插件作者应该在插件文档中告诉插件使用者，配置到项目的Android原生应用资源目录，而不是配置在插件目录下。详见

Android平台原生三方库目录，支持以下类型文件：

注意：UTS插件本地调试不支持直接使用so文件，需要将so文件和调用代码封装为AAR 或者分别集成 so和jar文件

如果封装三方原生sdk为uni-app插件，可以将sdk的jar/aar文件放到此目录，但因为多个uts插件引用相同三方原生sdk时可能会产生冲突，所以如果sdk支持仓储，建议优先使用仓储配置，而不是直接把jar等文件放在libs目录。

仓储配置参考config.json的dependencies。

关于libs目录的使用，可以参考 Hello UTS

Android平台原生res资源目录，建议只保存UTS插件内置的资源文件。

除了插件下有res目录，项目下也有。注意2者的区别。一般使用者的配置不放在插件下，而放在自己的项目下。项目下配置详见

Android原生应用清单文件，建议只保存UTS插件内置的清单文件配置。

除了插件下有AndroidManifest.xml，项目下也有。注意2者的区别。一般使用者的配置不放在插件下，而放在自己的项目下。项目下配置详见

uts插件在Android平台的原生层配置文件，可以在其中配置依赖仓储等gradle相关内容。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对于JSON类型项，将会把source字段值作为gradle源码添加到build.gradle中，上面示例中"id": "com.xxx.richtext:richtext"项将会添加以下配置

示例源码如下，请查看 pre > code 标签中的内容

minSdkVersion 插件支持的Android最低版本，整数类型，取值范围为Android API Level

project 云端打包项目相关配置，当使用的三方SDK需要配置gradle插件时可配置此项：

plugins 此配置将会添加到云端打包工程app及build.gradle文件的“plugins”中：

示例源码如下，请查看 pre > code 标签中的内容

此配置将会添加到云端打包工程项目级build.gradle文件的 "buildscript" -> "dependencies" 中：

示例源码如下，请查看 pre > code 标签中的内容

repositories（HBuilderX4.36+版本支持）

添加自定义仓储服务器地址。 此配置将会添加到云端打包工程项目级别 settings.gradle 文件的 "dependencyResolutionManagement" -> "repositories" 中：

示例源码如下，请查看 pre > code 标签中的内容

默认的仓储服务器地址请参考：Android平台云端打包环境

Android平台原生配置（包括引入、变更三方sdk）均需提交云端打包才能生效，真机运行时需使用自定义基座

HBuilderX 内置了android常见的依赖：内置依赖清单 ，开发者需要注意两点：

1 内置清单中涉及的依赖，无需手动添加，即可直接使用

2 请勿通过 手动添加jar/aar 等方式引入相同的依赖，否则会因依赖冲突导致云打包失败。

app-ios 文件夹下存在iOS平台原生配置，包括以下目录或文件

iOS平台插件依赖的三方framework存放目录，支持以下类型文件：

HBuilder X 3.7.2+ 版本支持

iOS平台插件依赖的三方.a库存放目录，支持以下类型的.a库：

备注：有关OC及Swift创建的.a库的区别、.a库的使用方法和注意事项详见

iOS平台原生资源目录，建议只保存uts插件内置的资源文件。云端打包时会将此目录下的所有文件添加到应用 main bundle 中。

除了插件下有Resources目录，项目下也有。注意2者的区别。一般使用者的配置不放在插件下，而放在自己的项目下。项目下配置详见

iOS平台原生 Info.plist 文件配置，云端打包时会将配置信息合并到原生工程的 Info.plist 中。

除了插件下有Info.plist，项目下也有。注意2者的区别。一般使用者的配置不放在插件下，而放在自己的项目下。项目下配置详见

示例： 添加自定义字段 TencentLBSAPIKey 和 开启后台定位

示例源码如下，请查看 pre > code 标签中的内容

iOS平台隐私清单文件，配置方法参考uts插件如何配置隐私清单

iOS平台原生 entitlements 文件配置，云端打包时会将配置信息合并到原生工程的 entitlements 配置文件中

插件需要开启 capabilities 中的相关服务时需要配置 UTS.entitlements 文件

示例：在 capabilities 中勾选 Access WiFi Information 项后对应的 UTS.entitlements 的配置

示例源码如下，请查看 pre > code 标签中的内容

uts插件在iOS平台的其它原生配置文件，可以在其中配置依赖的系统库等信息

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.61+版本 云端打包 uts插件支持原生iOS Extension（扩展）

插件作者配置 需在原生XCode环境中开发iOS Extension，编译并以发布方式导出包含此扩展的ipa包，将ipa解压后在Payload/XXX.app/PlugIns/ 下可以找到.appex文件 将.appex添加到 uts 插件下的 app-ios/Plugins/ 目录中

插件使用者配置 默认情况下云端打包不会包含 uts 插件中的iOS Extension，需在 uni-app/uni-app x 项目的 nativeResources/ios 目录下添加 ios-extension.json 文件，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

其中 ios-extension.json 文件格式如下：

示例源码如下，请查看 pre > code 标签中的内容

app-harmony文件夹存放uts插件编译到鸿蒙时的代码逻辑，目前仅支持uts文件。

在HBuilder X 中选中你的项目下uni_modules目录，右键选择新建uni_modules插件, 例如 uts-api

插件 uts-api 创建完成后，我们需要确定插件对外暴露的 API。

为了多端统一规范的定义对外暴露的接口，获得更好的语法提示和多端一致性约束，标准做法是在 interface.uts 文件中统一定义插件要暴露的 API 类型、 API 的参数类型、返回值类型、错误码类型、错误接口等信息，然后在各端的 index.uts 中做具体的业务实现。

打开 interface.uts 文件，键入下面的源码, 为了方便说明，源码的每个部分的作用都用注释来说明。

示例源码如下，请查看 pre > code 标签中的内容

特别注意 interface.uts 是官方推荐的多端一致性的最佳实践，不做强制要求，可以根据自己的实际情况决定是否实现。比如某个插件只有一个平台，不写interface也可以。 interface.uts 文件中定义并 export 的 interface 接口例如 MyApiFail 只能在插件内部的 uts 文件代码中使用，不能在 .uvue 文件中使用插件时导入使用。

至此，我们就完成了 interface 的定义，如果你遵循规范，定义了错误码的类型和错误码的 interface 如 MyApiFail, 那么你还需要在 unierror.uts 文件中对 MyApiFail 这个接口做具体实现。

为了获得更好语法提示和校验效果，我们在 interface.uts 文件中已经定义了错误的类型和错误的接口。但是错误码对应的具体错误信息，以及错误对象的具体实现，都还没有完成。 unierror.uts 文件就是专门用来实现这些的。

打开 unierror.uts 文件, 键入下面的源码。同样为了说明，源码的每个部分的作用都用注释来说明。

示例源码如下，请查看 pre > code 标签中的内容

至此我们完成了符合 uni 错误规范的错误码的定义和实现，后面我们就可以去实现插件的具体逻辑了。 Uni错误规范的更多信息详见 。

分别在插件的 app-android 、app-ios 等目录下打开 index.uts 文件，键入下面的插件源码:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面的代码，我们完成了一个名为 "uts-api" 的UTS 插件，在 uvue 文件中使用该插件的代码示例如下：

示例源码如下，请查看 pre > code 标签中的内容

运行和编译uts插件，需要在HBuilderX的设置中配置Android和iOS的环境，见如下文档：

开发uts插件，调试、打断点是重要帮手，参考如下文档

首先在 uni_modules 目录下新建名为 uts-getbatteryinfo 的 uts 插件

在Android平台目录下，编辑index.uts，键入以下内容。

示例源码如下，请查看 pre > code 标签中的内容

至此，我们已经完成一个Android平台上获取电量的原生能力封装。

示例源码如下，请查看 pre > code 标签中的内容

有些场景下，我们期望 将获取电量的能力封装为 异步的接口，我们可以使用下面的代码

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在下一节，我们将更加详细地介绍 前端如何使用这个插件。

注1：HBuilderX的代码提示系统，支持在uts文件中对Android的原生API进行提示

注2：io.dcloud.uts.android库介绍文档

有android开发经验的开发者可以参考：Android平台uts开发指南

在 iOS 平台目录下，编辑 index.uts，键入以下内容

示例源码如下，请查看 pre > code 标签中的内容

如果你想以同步接口的方式提供电量信息，代码可调整如下：

示例源码如下，请查看 pre > code 标签中的内容

至此，我们已经完成一个 iOS 平台上获取电量的原生能力封装。

在utssdk目录下创建harmonyOS平台目录app-harmony

在harmonyOS平台目录下，编辑index.uts，键入以下内容，即可完成harmonyOS平台获取电量能力。

示例源码如下，请查看 pre > code 标签中的内容

特别注意： 此功能在 HBuilderX 3.97+ 版本支持，HBuilderX 3.97 之前的版本不支持。

在插件开发过程中，有时我们需要监听 APP 的生命周期函数来完成一些业务逻辑，比如在应用启动时初始化三方 SDK, 在收到推送消息时做消息的处理，在被 url scheme 唤醒时调用指定功能等等。

在 iOS 平台可以通过自定义 class 遵循 UTSiOSHookProxy 协议的方式来实现对应用程序生命周期函数的监听。

注意： 该自定义 class 需要 export, 否则不会参与编译。 该自定义 class 会自动完成注册, 无需开发者进行额外注册。 UTSiOSHookProxy 协议中所有的 api 均是可选实现的，可以选择自己关心的 api 进行实现。 UTSiOSHookProxy 协议的定义详见

监听推送相关回调特别注意： 监听推送和本地通知相关的回调需要证书具备推送功能，正确配置 aps-environment，在打自定义基座时需要在 manifest 中勾选 push 模块，否则相关功能不会被打进基座内，对应回调也就不会触发（可以只勾选 push，而不选择具体 push 版本）。 勾选 push 模块后，系统会自动进行推送的注册，如果不需要自动注册，请在 manifest 中将 pushRegisterMode 字段设置为 manual。详细配置详见

示例源码如下，请查看 pre > code 标签中的内容

Android平台部分三方SDK的初始化依赖Application的onCreate生命周期回调。所以UTS提供了UTSAndroidHookProxy接口。用于支持三方SDK初始化的代码实现。

UTSAndroidHookProxy代码如下：

示例源码如下，请查看 pre > code 标签中的内容

开发者需要在插件代码中实现UTSAndroidHookProxy接口 示例如下：

示例源码如下，请查看 pre > code 标签中的内容

以上代码，将会在Application 的OnCreate函数中被调用

HelloUTS nativepage 插件增加了UTSAndroidHookProxy 源码示例

开发者使用HBuilder X 3.96 之后版本，提交云端打包自定义基座后，观察日志即可体验

harmonyOS目前的架构为ets和js在同一环境下运行，不涉及此章节内容

UTS向uni-app传值，支持下列类型：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app向UTS环境传值，支持下列类型：

1 TS基本数据类型： number,string,boolean 等

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

需要注意的是，在声明为any类型的前提下, uni-app 环境中的 Object 在UTS环境中也会被转换为 UTSJSONObjct.

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更多UTSJSONObject的用法，详见

有些场景，我们需要参数对象包含对象数组，比如

示例源码如下，请查看 pre > code 标签中的内容

目前在uni-app 环境下，复杂参数的传递是存在一定的缺陷。我们不能将teacher 声明为具体的类型数组，需要声明为any数组：

示例源码如下，请查看 pre > code 标签中的内容

访问数组元素时，通过 UTSJSONObjct 包装访问

示例源码如下，请查看 pre > code 标签中的内容

特别注意： 在uni-app 环境下，在 index.uts 文件中 export 的 class 默认会对 js暴露，因此要建立起原生 class 和 js类型的映射关系，只有能正常建立起这种映射关系的类才能导出。除一些基本数据类型外的系统类例如 Activity、UIViewController等是无法 export 的。

HBuilder X 4.25起，UTS插件可以直接使用原生的kt、java、swift代码，即 UTS原生混编。

虽然uts插件由uts语法开发，但前端引用插件并不要求一定需要uts，普通js亦可引用uts插件。这也是uts插件同时支持uni-app和uni-app x的重要原因。

作为一个对象全部import进来，然后通过点运算符调用这个对象的方法或属性。

示例源码如下，请查看 pre > code 标签中的内容

需要特别注意的是，import UTS插件时，只能到插件的根目录，不能直接引入到最终的文件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

从可导出的选项里import 1个或多个（逗号分隔），然后直接使用导出的方法或属性。

示例源码如下，请查看 pre > code 标签中的内容

关于电量这个插件，插件市场已提供现成的插件，除了Android、iOS、鸿蒙，还同时支持了web和小程序，可以去下载体验。详见

更多开发示例，可以参考 Hello UTS 。

UTS插件除了允许在页面中使用之外，还支持被uni_modules目录下的其他插件使用。

uni_modules 下同时存在 uts-plugin-a 和 uts-plugin-b 两个插件，我们可以使用下面的代码在 uts-plugin-a中使用 uts-plugin-b中的方法

示例源码如下，请查看 pre > code 标签中的内容

插件中的调用代码和在页面中调用代码没有什么差异，只有两处需要特别注意：

1 开发者需要在 uts-plugin-a 的package.json文件中生声明对uts-plugin-b的依赖

示例源码如下，请查看 pre > code 标签中的内容

关于 package.json更多信息，参考 文档

2 UTS插件相互调用时，必须使用绝对路径，不能使用相对路径

示例源码如下，请查看 pre > code 标签中的内容

特别注意： iOS 平台下该使用该功能需要 HBuilder X 4.51+ 版本； 该功能在 uni-app 和 uni-app x 环境下均支持。

在 iOS 平台下，如果你的 uts 插件 需要被别的插件引用，但你的插件内没有依赖其他三方库，那么插件的开发和普通 uts 插件相同，没有特别的注意事项。 但是，如果你的 uts 插件要被别的 uts 插件依赖使用, 并且你的插件内依赖了其他三方库, 那么此时该插件的开发就要遵循特别的开发规范，该规范如下：

示例源码如下，请查看 pre > code 标签中的内容

由于写在 uts 中的代码（函数，class, 自定义type，interface，全局变量等），被编译成 swift 时都会被默认标记成 public，所以如果你所使用的三方库中的符号 必须要出现在上述场景中时(诸如 函数的参数或者返回值中，class 的属性中，或者继承自三方库中类的class, 实现三方库协议的class等等)，需要将相应的函数、class的属性、 或者 class 标记成 private, 或者 fileprivate。

具体的标记方式详见swift特有修饰符 。

uts虽然是原生代码，但同样具有真机运行功能

若HBuilderX中没有uts编译运行插件，在第一次运行时会自动下载。

普通uts代码可以直接使用标准基座真机运行。但与原生插件一样，涉及以下场景，需要自定义基座后方能生效:

总结来说，就是所有 涉及新增依赖/gradle配置/androidManifest.xml/资源 等标准基座不具备的能力时，需要自定义基座

uts插件编译需要XCode环境，因此在mac电脑安装了XCode工具时支持直接使用标准基座真机运行。

在windows电脑或者mac电脑没有安装XCode工具时，需要提交云端打包生成自定义基座后才能调用uts插件。

uts插件支持debug断点调试。可以在uts插件代码中打断点、查看上下文，与前端代码联调。

正常支持云端打包。但打包后uts编译为了纯原生二进制代码，不支持wgt热更新。

[plugin:vite:resolve] Failed toresolve entry for package "插件路径"

HBuilderX 的最低要求为3.6.0，低于此版本无法import uts插件，编译时将报错。

vue2项目使用 uts 插件的最低版本要求是HBuilderX 3.6.8，低于此版本，编译时将报错。

HBuilderX 3.7.7开始，不推荐使用 UTSCallback 定义函数类型，当需要定义函数类型时，应定义为更具体的类型，如：const callback:UTSCallback 应调整为const callback:()=>void 如果您使用的是插件市场三方uts插件，可以检查更新插件最新版本

iOS 平台异步 Api 的回调函数不支持返回值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

截至HBuilder 4.45, UTS支持将函数作为参数传递给UTS环境使用，但仅支持下面列出的使用方式：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

除此之外，UTS不支持其他函数参数的使用方式，比如：将函数作为 数组/集合/字典的成员进行传递

示例源码如下，请查看 pre > code 标签中的内容

android很多布局参数强制要求Float，但是ts中没有内置这种类型。可以使用下面的代码实现转换

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

目前 UTS 仅Android支持promise执行异步任务，iOS还不支持。类似场景可以使用setTimeOut。

示例源码如下，请查看 pre > code 标签中的内容

android中UI相关的api，很多会要求泛型，目前uts中可以使用下面的代码实现

示例源码如下，请查看 pre > code 标签中的内容

特别注意： iOS 环境目前不支持在 uts 插件中导出带泛型的类型。

函数参数支持设置默认值，比如下面testName

示例源码如下，请查看 pre > code 标签中的内容

UTS插件环境会被编译为原生语言环境，在android平台是kotlin.

uni-app x 运行到Android平台时，本身也是原生语言环境，即kotlin。同语言直接的调用是没有限制的，可以任意导出和使用 自定义对象/原生对象/类/方法。

但是在uni-app 环境和 uni-app x 的iOS 环境，只能导出UTS中声明的自定义对象/类/方法，不能包含原生对象、平台专有类型

这是因为 uni-app 和 uni-app x 的iOS 本质上是类浏览器的js环境中，UTS中声明的对象是经过特殊处理的，每一个对象都有一个在Js中对应的实例，这样才能正常使用。

其他的原生对象没有经过特殊处理，并不能在js环境中使用。

uts环境中访问JSON对象的属性，不能用user.age 而要用下标 user['age']

示例源码如下，请查看 pre > code 标签中的内容

如果想使用.操作符，需要参考uts的type

更多UTSJSONObject的用法，详见

UTSCallback 和 UTSJSONObject 是UTS内置专门用于UTS环境和前端交互的特定类型。

为了同时兼容 uni-app 和 uni-app x 环境，在uni环境与UTS环境交互时 ： 除了基本数据类型之外，涉及function的需要使用UTSCallback替代，涉及复杂对象object需要用UTSJSONObject 替代

UTS环境中，默认的数组写法[] / Array() 对应到 android平台的数据结构是 UTSArray

理论上来说 UTSArray确实更加灵活强大，但是部分android 平台api 明确要求了 Array格式的数据(比如请求权限)

类似场景下，我们就要使用 toTypedArray() 函数进行转换，以便将MutableList 转换为对应的Array

示例源码如下，请查看 pre > code 标签中的内容

另外还存在一种特殊情况，即开发者 在UTS中使用了 kotlin编写的依赖，这个时候情况稍微复杂些

与UTS中只有一种 数组结构相比，kotlin中的数组结构要多很多，比如 IntArray,Array,MutableList等,

1 UTS具备类型推导功能，调用第三方依赖是不需要声明类型

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

因为android中，每个UTS插件都对应一个gradle 子项目，所以类似的情况不能简单复用 自定义基座中的官方依赖。

需要： 不要勾选官方的依赖，然后在uts插件中，按照文档配置依赖

在 uni-app 平台，js环境与原生环境的交互都是经过js引擎桥接

js引擎除了 string,number,boolean 等基本数据结构外，仅支持JSONObject,JSONArray两种。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

前端领域里线程安全的解决思路 与java的不同。 他们提供了 async/await 等关键字来实现异步任务处理

如果业务代码中有需要多线程、异步任务，建议切换到 async/await 等 uts 语法

如果是要翻译原有的java代码到 UTS，可以选择打成AAR来处理。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX4.25版本以前 UTS插件导出方法的参数中存在回调函数时，在JS环境中调用会将回调函数 callback 一直保存在内存中，这时回调函数可以持续触发回调。这种策略会带来一个致命的问题， 当频繁调用这些导出方法时，每次调用都会创建回调函数 callback 对象，并一直保存在内存中，从而造成内存泄漏，可能引发应用闪退。

为了解决此问题，回调函数参数策略做了调整：

HBuilderX4.25版本及以后 UTS插件导出的方法中的回调函数参数触发一次后立即自动回收，避免内存泄漏，也就是默认情况下回调函数 callback 只能触发一次。这次调整可能带来向下兼容的问题，导致方法中的回调函数参数无法持续回调。 影响范围： HBuilderX4.25+版本 iOS 平台的 uni-app 和 uni-app x 项目, Android平台的 uni-app 项目，顶层方法或者自定义 class 中的静态方法或者实例方法

如果回调函数参数需支持可持续触发， 按以下方案进行适配：

将方法名称调整为以 on 开头，且仅有一个 callback 类型的参数，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX4.27版本新增适配方案 通过装饰器(注解) @UTSJS.keepAlive 声明方法中的回调函数参数一直存活（不自动回收），支持回调函数可持续触发回调，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果同时存在两个同名函数，仅参数个数/类型不同，在Uni-app 项目 android环境中会无法正确区分两个函数

DCloud提供了 Hello UTS示例，详见 。

更多uts插件见：https://ext.dcloud.net.cn/?cat1=8&type=UpdatedDate

**Examples:**

Example 1 (unknown):
```unknown
uni_modules
```

Example 2 (json):
```json
{
  "id": "uts-helloworld",
  "displayName": "uts插件示例",
  "version": "0.1",
  "description": "uts插件示例",
  "uni_modules": {

  }
}
```

Example 3 (json):
```json
{
  "id": "uts-helloworld",
  "displayName": "uts插件示例",
  "version": "0.1",
  "description": "uts插件示例",
  "uni_modules": {

  }
}
```

Example 4 (json):
```json
{
  "id": "uts-helloworld",
  "displayName": "uts插件示例",
  "version": "0.1",
  "description": "uts插件示例",
  "uni_modules": {

  }
}
```

---

## UDP 通信 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/UDP

**Contents:**
    - # UDP 通信
      - 本页导读

---

## 插屏广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-interstitial.html

**Contents:**
  - # 插屏广告
  - # 各广告渠道差异说明
  - # 组件语法
  - # API语法
    - # 广告创建
    - # 显示/隐藏
    - # 监听用户关闭广告
    - # 方法
      - 本页导读

插屏广告组件是由客户端原生的图片、文本、视频控件组成的；插屏广告与信息流或横幅广告相比展现尺寸更大，同样能够满足您对大量曝光和用户转化的需求。

注意：优选将展现模型预估收益最佳的插屏样式，全屏/半屏均有机会展示，该流量场景需同时支持全屏和半屏广告。不支持优选的广告渠道则使用半屏。

HBuilder 基座的测试广告位 adpid 为 1111111113

<ad-interstitial></ad-interstitial>

HBuilder 基座的测试广告位 adpid 为 1111111113，微信小程序暂不提供测试广告位

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni.createInterstitialAd(options)

options 为 object 类型，属性如下：

uni-ad 不支持在微信小程序上使用API接入，仅支持组件方式<ad-interstitial>，组件支持跨平台

插屏广告组件默认是隐藏的，因此可以提前创建，以提前初始化组件。开发者可以在页面的 onReady 事件回调中创建广告实例，并在该页面的生命周期内重复调用该广告实例。

插屏广告组件默认是隐藏的，开发者需要调用 InterstitialAd.show() 进行显示。如果广告拉取失败或触发频率限制，InterstitialAd.show() 方法会返回一个rejected Promise，开发者可自行监听错误信息

示例源码如下，请查看 pre > code 标签中的内容

用户可以主动关闭插屏广告。开发者不可控制插屏广告组件的隐藏。

如果广告被关闭，通过 InterstitialAd.onClose() 注册的回调函数会执行，回调函数没有参数传递。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Promise InterstitialAd.load()

Promise InterstitialAd.show()

InterstitialAd.destroy()

InterstitialAd.onLoad(function callback)

InterstitialAd.offLoad(function callback)

InterstitialAd.onError(function callback)

InterstitialAd.offError(function callback)

InterstitialAd.onClose(function callback)

InterstitialAd.offClose(function callback)

**Examples:**

Example 1 (unknown):
```unknown
注意：优选将展现模型预估收益最佳的插屏样式，全屏/半屏均有机会展示，该流量场景需同时支持全屏和半屏广告。不支持优选的广告渠道则使用半屏。
```

Example 2 (unknown):
```unknown
<ad-interstitial></ad-interstitial>
```

Example 3 (html):
```html
<template>
  <view>
    <ad-interstitial adpid="1111111113" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-interstitial>
  </view>
</template>
```

Example 4 (html):
```html
<template>
  <view>
    <ad-interstitial adpid="1111111113" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-interstitial>
  </view>
</template>
```

---

## NFC | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/nfc.html

**Contents:**
    - # NFC
      - 本页导读

仅微信小程序平台、App平台支持，各平台开发方式暂未统一，使用时需注意用条件编译 调用不同平台的代码。

---

## 监听设备方向变化 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/deviceMotion.html

**Contents:**
    - # 监听设备方向变化
      - 本页导读

在App平台，也可以通过onResize生命周期，监听窗体大小变化来实现此类需求。详见

---

## uni.getLocale() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/locale

**Contents:**
- # uni.getLocale()
  - # getLocale 兼容性
- # uni.setLocale(locale)
  - # setLocale 兼容性
- # uni.onLocaleChange(callback)
  - # onLocaleChange 兼容性
- # 注意事项
- # 语言回退规则
      - 本页导读

如果当前应用设置过语言，会获取到之前设置的语言，未设置时会返回根据系统语言类型自动选择的语言。

仅可设置为框架内置语言与自定义扩展的语言，遵循 BCP47 规范。

需要注意的是，语言的处理逻辑是建立在应用locale目录 配置了对应资源的前提下。 资源配置文档

如果应用的 locale目录下配置了对应的资源，那么语言的设置和获取是一致的

如果应用的 locale目录没有配置对应的资源，则会根据具体的平台规则进行回退。

举个例子，应用中仅配置了英文和中文资源，没有配置日语资源，但是通过系统设置修改语言为日文，此时调用 uni.getLocale() 在android平台上获取到的返回值不会是jp 而是en

**Examples:**

Example 1 (unknown):
```unknown
uni.getLocale()
```

---

## uni.createCameraContext() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/camera-context

**Contents:**
- # uni.createCameraContext()
- # cameraContext.takePhoto
- # cameraContext.setZoom
- # cameraContext.startRecord
- # cameraContext.stopRecord
      - 本页导读

创建并返回 camera 组件的上下文 cameraContext 对象。

本API为 camera 组件配套的js API，与 camera 组件的平台兼容性相同，可实现非全屏摄像头。App端可通过plus.camera 实现全屏摄像头。

cameraContext 对象的方法列表

takePhoto 的 Object 参数列表：

setZoom 的 Object 参数列表：

startRecord 的 Object 参数列表：

stopRecord 的 Object 参数列表：

**Examples:**

Example 1 (unknown):
```unknown
chooseVideo
```

Example 2 (unknown):
```unknown
entry/src/main/module.json5
```

Example 3 (unknown):
```unknown
uni.authorize
```

---

## uni.arrayBufferToBase64(arrayBuffer) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/arrayBufferToBase64

**Contents:**
- # uni.arrayBufferToBase64(arrayBuffer)
  - # arrayBufferToBase64 兼容性
      - 本页导读

将 ArrayBuffer 对象转成 Base64 字符串

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

Example 2 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

Example 3 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

Example 4 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

---

## uni.base64ToArrayBuffer(base64) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/base64ToArrayBuffer.html

**Contents:**
- # uni.base64ToArrayBuffer(base64)
  - # base64ToArrayBuffer 兼容性
      - 本页导读

将 Base64 字符串转成 ArrayBuffer 对象

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

Example 2 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

Example 3 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

Example 4 (javascript):
```javascript
const base64 = 'test'
const arrayBuffer = uni.base64ToArrayBuffer(base64)
```

---

## uni.createMediaContainer() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/media-container.html

**Contents:**
- # uni.createMediaContainer()
  - # MediaContainer.addTrack(track)
  - # MediaContainer.destroy()
  - # MediaContainer.export()
  - # MediaContainer.extractDataSource(object)
  - # MediaContainer.removeTrack(track)
- # MediaTrack
      - 本页导读

创建音视频处理容器，最终可将容器中的轨道合成一个视频 ，返回 MediaContainer 对象

将容器内的轨道合并并导出视频文件 ,返回 MediaTrack 对象

可通过 MediaContainer.extractDataSource 返回。

MediaTrack 音频或视频轨道，可以对轨道进行一些操作

**Examples:**

Example 1 (unknown):
```unknown
MediaContainer
```

Example 2 (unknown):
```unknown
MediaContainer.extractDataSource
```

---

## uni.getBatteryInfo(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/batteryInfo.html

**Contents:**
- # uni.getBatteryInfo(OBJECT)
  - # getBatteryInfo 兼容性
      - 本页导读

本 API 是 uni ext api ，需下载插件：getBatteryInfo

uni ext api 需 HBuilderX 3.6.8+

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.getBatteryInfo({
  success: (res) => {
    console.log(res)
  }
})
```

Example 2 (javascript):
```javascript
uni.getBatteryInfo({
  success: (res) => {
    console.log(res)
  }
})
```

Example 3 (javascript):
```javascript
uni.getBatteryInfo({
  success: (res) => {
    console.log(res)
  }
})
```

Example 4 (javascript):
```javascript
uni.getBatteryInfo({
  success: (res) => {
    console.log(res)
  }
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/quick-start.html

uni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务uni-appuni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务简体中文搜索文档K介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub工程化介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub概述Git/SVNcli 脚手架编译运行环境自动化测试快速开始APIHBuilderX自动化测试插件使用 CLI 运行uniapp自动化测试CLI项目运行自动化测试持续集成uniCloud Web控制台插件市场ask问答社区uni-aduni统计代码仓库：Gitee、GitHubuni-app的uni-im交流群：点击加入官方QQ交流群群35：713420817（2000人已满）群34：530305531（2000人已满）群33：498071674（2000人已满）群32：166188631（2000人已满）群31：567471669（2000人已满）群30：371046920（2000人已满）群29：202965481（2000人已满）群28：166188776（2000人已满）群27：811363410（2000人已满）群26：147867597（2000人已满）群25：165297000（2000人已满）群24：672494800（2000人已满）群23：599958679（2000人已满）群22：687186952（2000人已满）群21：717019120（2000人已满）群20：165796402（2000人已满）群19：165657124（2000人已满）群18：698592271（2000人已满）群17：951348804（2000人已满）群16：719211033（2000人已满）群15：516984120（2000人已满）群14：465953250（2000人已满）群13：699478442（2000人已满）群12：884860657（2000人已满）群11：296811328（2000人已满）群10：959059626（2000人已满）群9：775128777（2000人已满）群8：695442854（2000人已满）群7：942061423（2000人已满）群6：697264024（2000人已满）群5：731951419（2000人已满）群4：942702595（2000人已满）群3：773794803（2000人已满）群2：901474938（2000人已满）群1：531031261（2000人已满）关注微信公众号特性CLI测试插件测试工程目录说明测试用例文件规范测试用例文件编写示例测试配置文件jest.config.js注意事项测试示例展示全部#uni-app自动化测试uni-app提供了一批API，这些API可以操控uni-app应用，包括运行、跳转页面、触发点击等，并可以获取页面元素状态、进行截图，从而实现对uni-app项目进行自动化测试的目的。本功能使用到了业内常见的测试库如jest（MIT协议）。推荐使用方式：研发提交源码到版本库后，持续集成系统自动拉取源码，自动运行自动化测试。#特性开发者可以利用API做以下事情：控制跳转到指定页面获取页面数据获取页面元素状态触发元素绑定事件调用 uni 对象上任意接口平台差异说明AppH5微信小程序支付宝小程序百度小程序抖音小程序、飞书小程序QQ小程序快应用快手小程序京东小程序√(ios仅支持模拟器)√√xxxxxxx#CLI如果您想在终端命令行进行自动化测试、或使用持续集成进行测试。请使用uni-appCLI工程，CLI项目自动化测试教程使用HBuilderX cli调用uni-app自动化测试插件。文档#测试插件为了方便大家在HBuilderX内，进行uni-app自动化测试，开发了HBuilderX uni-app自动化测试插件。插件支持在HBuilderX内对uni-app普通项目、CLI项目进行自动化测试。插件简化了测试环境安装、测试用例创建、测试运行、测试设备选择等步骤。插件使用文档#测试工程目录说明如下所示，是一个标准的uni-app x项目测试工程目录介绍。.├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss示例源码如下，请查看 pre > code 标签中的内容.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss#测试用例文件规范文件名通常为 *.test.js，便于 Jest 自动识别*.test.js 测试文件一般放在被测试文件同级，强烈建议放置到跟页面同一级目录每个测试用例应相互独立，避免依赖其他测试的执行结果遵守 Jest 语法规范，用法如：test('描述', () => { ... }) 或 it('描述', () => { ... })uni测试框架API文档#测试用例文件编写示例以下代码是一个简单的uni-app页面测试用例，使用page.$获取.title选择器的文本，然后进行断言。describe('test title',()=>{letpage;beforeAll(async()=>{page=awaitprogram.currentPage();awaitpage.waitFor(3000);});it('check page title',async()=>{constel=awaitpage.$('.title');// page.$(selector: string) 选择器(id、class、元素选择器)consttitleText=awaitel.text();expect(titleText).toEqual('Hello');});});示例源码如下，请查看 pre > code 标签中的内容describe('test title', () => {
    let page;
    beforeAll(async () => {
        page = await program.currentPage();
        await page.waitFor(3000);
    });

    it('check page title', async () => {
        const el = await page.$('.title');   // page.$(selector: string) 选择器(id、class、元素选择器)
        const titleText = await el.text();
        expect(titleText).toEqual('Hello');
    });
});#测试配置文件#jest.config.js一个完整的jest.config.js文件，为测试配置文件，详细内容如下：module.exports={globalTeardown:'@dcloudio/uni-automator/dist/teardown.js',testEnvironment:'@dcloudio/uni-automator/dist/environment.js',testEnvironmentOptions:{compile:true,h5:{// 为了节省测试时间，可以指定一个 H5 的 url 地址，若不指定，每次运行测试，会先 npm run dev:h5url:"http://192.168.x.x:8080/h5/",options:{headless:false// 配置是否显示 puppeteer 测试窗口}},"app-plus":{// 需要安装 HBuilderXandroid:{appid:"",//自定义基座测试需配置manifest.json中的appidpackage:"",//自定义基座测试需配置Android包名executablePath:"HBuilderX/plugins/launcher/base/android_base.apk"// apk 目录或自定义调试基座包路径},ios:{id:"",// uuid 必须配置，目前仅支持模拟器，可以（xcrun simctl list）查看要使用的模拟器 uuidexecutablePath:"HBuilderX/plugins/launcher/base/Pandora_simulator.app"// ipa 目录}},"mp-weixin":{port:9420,// 默认 9420account:"",// 测试账号args:"",// 指定开发者工具参数cwd:"",// 指定开发者工具工作目录launch:true,// 是否主动拉起开发者工具teardown:"disconnect",// 可选值 "disconnect"|"close" 运行测试结束后，断开开发者工具或关闭开发者工具remote:false,// 是否真机自动化测试executablePath:"",// 开发者工具cli路径，默认会自动查找,  windows: C:/Program Files (x86)/Tencent/微信web开发者工具/cli.bat", mac: /Applications/wechatwebdevtools.app/Contents/MacOS/cli},"mp-baidu":{port:9430,// 默认9420// 其它配置项跟mp-weixin一样}},testTimeout:15000,reporters:['default'],watchPathIgnorePatterns:['/node_modules/','/dist/','/.git/'],moduleFileExtensions:['js','json'],rootDir:__dirname,testMatch:['<rootDir>/src/**/*test.[jt]s?(x)'],// 测试文件目录testPathIgnorePatterns:['/node_modules/']}示例源码如下，请查看 pre > code 标签中的内容module.exports = {
	globalTeardown: '@dcloudio/uni-automator/dist/teardown.js',
	testEnvironment: '@dcloudio/uni-automator/dist/environment.js',
	testEnvironmentOptions: {
		compile: true,
		h5: { // 为了节省测试时间，可以指定一个 H5 的 url 地址，若不指定，每次运行测试，会先 npm run dev:h5
			url: "http://192.168.x.x:8080/h5/",
			options: {
				headless: false // 配置是否显示 puppeteer 测试窗口
			}
		},
		"app-plus": { // 需要安装 HBuilderX
			android: {
				appid: "", //自定义基座测试需配置manifest.json中的appid
				package: "", //自定义基座测试需配置Android包名
				executablePath: "HBuilderX/plugins/launcher/base/android_base.apk" // apk 目录或自定义调试基座包路径
			},
			ios: {
				id: "", // uuid 必须配置，目前仅支持模拟器，可以（xcrun simctl list）查看要使用的模拟器 uuid
				executablePath: "HBuilderX/plugins/launcher/base/Pandora_simulator.app" // ipa 目录
			}
		},
		"mp-weixin": {
			port: 9420, // 默认 9420
			account: "", // 测试账号
			args: "", // 指定开发者工具参数
			cwd: "", // 指定开发者工具工作目录
			launch: true, // 是否主动拉起开发者工具
			teardown: "disconnect", // 可选值 "disconnect"|"close" 运行测试结束后，断开开发者工具或关闭开发者工具
			remote: false, // 是否真机自动化测试
			executablePath: "", // 开发者工具cli路径，默认会自动查找,  windows: C:/Program Files (x86)/Tencent/微信web开发者工具/cli.bat", mac: /Applications/wechatwebdevtools.app/Contents/MacOS/cli
		},
		"mp-baidu": {
			port: 9430, // 默认9420
            // 其它配置项跟mp-weixin一样
		}
	},
	testTimeout: 15000,
	reporters: [
		'default'
	],
	watchPathIgnorePatterns: ['/node_modules/', '/dist/', '/.git/'],
	moduleFileExtensions: ['js', 'json'],
	rootDir: __dirname,
	testMatch: ['<rootDir>/src/**/*test.[jt]s?(x)'], // 测试文件目录
	testPathIgnorePatterns: ['/node_modules/']
}#注意事项如果页面涉及到分包加载问题，reLaunch获取的页面路径可能会出现问题 ，解决方案如下 ：// 重新 reLaunch至首页，并获取 page 对象（其中 program 是 uni-automator 自动注入的全局对象）page=awaitprogram.reLaunch('/pages/extUI/calendar/calendar')// 微信小程序如果是分包页面，需要延迟大概 7s 以上，保证可以正确获取page对象awaitpage.waitFor(7000)page=awaitprogram.currentPage()示例源码如下，请查看 pre > code 标签中的内容// 重新 reLaunch至首页，并获取 page 对象（其中 program 是 uni-automator 自动注入的全局对象）
page = await program.reLaunch('/pages/extUI/calendar/calendar')
// 微信小程序如果是分包页面，需要延迟大概 7s 以上，保证可以正确获取page对象
await page.waitFor(7000)
page = await program.currentPage()微信小程序 element 不能跨组件选择元素，首先要先获取当前组件，再继续查找<uni-tag><viewclass="test"></view></uni-tag>示例源码如下，请查看 pre > code 标签中的内容<uni-tag>
  <view class="test"></view>
</uni-tag>// 错误，取不到元素awaitpage.$('.test')// 可以取到元素lettag=awaitpage.$('uni-tag')awaittag.$('.test')示例源码如下，请查看 pre > code 标签中的内容// 错误，取不到元素
await page.$('.test')

// 可以取到元素
let tag = await page.$('uni-tag')
await tag.$('.test')微信小程序暂不支持父子选择器百度小程序选择元素必须有事件的元素才能被选中，否则提示元素不存在分包中的页面，打开之后要延迟时间长一点，否则不能正确获取到页面信息App-android自定义基座测试需要在jest.config.js文件android节点下配置appid（manifest.json中的appid）、package（包名）、executablePath（自定义调试基座包路径）#测试示例GitHub：https://github.com/dcloudio/hello-uniapp#更新记录HBuilderX 4.13支持page.data获取defineExpose暴露的数据帮助我们改善此页面！上次更新:2026/1/8 11:26:36开发产品HBuilderXuni-appuni-app xuniClouduniMPsdk5+Runtimewap2appMUIuni-iduni-cdnuni-payuni-pushuni一键登录uni实人认证smsuni-starteruni-adminuni-upgrade-centeruni-imuni-aiuni-cmsuniCloud-mapuni-search运营产品uni-aduni统计uni发行uni安全专题开发者服务问答社区开发者后台技术文档uni-app文档uniCloud文档原生开发者支持文档HBuilder文档生态服务插件市场OAuth用户开放平台关于我们：DCloud官网案例需求墙许可协议加入我们赞助我们联系我们：商务合作：bd@dcloud.io广告合作：uniad@dcloud.ioDCloud.io数字天堂（北京）网络技术有限公司是HTML5中国产业联盟发起单位京公网安备：11010802035340号国家信息安全等级保护三级，证书编号：11010813802-20001本页导读特性CLI测试插件测试工程目录说明测试用例文件规范测试用例文件编写示例测试配置文件jest.config.js注意事项测试示例更新记录

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uts/buildin-object-api/number.html

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

## 账号相关 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/dev/faq/faq.html

**Contents:**
- # 账号相关
  - # 个人实名认证和企业实名认证，有什么区别？
  - # 如何修改实名认证信息？
  - # 如何注销账号？
  - # 如何修改登录账号？
  - # 员工离职后，无法联系，怎么修改登录账号？
- # 应用相关
  - # 如何修改appid
  - # 修改appid会引发哪些问题？
  - # uni-app项目如何修改小程序appid？

DCloud 账号支持邮箱和手机号两种登录方式，参考文档 修改邮箱/手机号

参考文档 修改 appid 将会引发的问题

发送邮件到fapiao@dcloud.io申请重开，邮件附上旧发票及新开票信息。申请重开时，账号及开票信息也必须符合开具发票文档中的相关要求，否则不予处理。

一般情况下在7个工作日内会进行处理。如遇节假日顺延。

**Examples:**

Example 1 (python):
```python
service@dcloud.io
```

Example 2 (python):
```python
service@dcloud.io
```

Example 3 (python):
```python
fapiao@dcloud.io
```

---

## uni.createCameraContext() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/camera-context.html

**Contents:**
- # uni.createCameraContext()
- # cameraContext.takePhoto
- # cameraContext.setZoom
- # cameraContext.startRecord
- # cameraContext.stopRecord
      - 本页导读

创建并返回 camera 组件的上下文 cameraContext 对象。

本API为 camera 组件配套的js API，与 camera 组件的平台兼容性相同，可实现非全屏摄像头。App端可通过plus.camera 实现全屏摄像头。

cameraContext 对象的方法列表

takePhoto 的 Object 参数列表：

setZoom 的 Object 参数列表：

startRecord 的 Object 参数列表：

stopRecord 的 Object 参数列表：

**Examples:**

Example 1 (unknown):
```unknown
chooseVideo
```

Example 2 (unknown):
```unknown
entry/src/main/module.json5
```

Example 3 (unknown):
```unknown
uni.authorize
```

---

## uni.vibrate(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/vibrate

**Contents:**
- # uni.vibrate(OBJECT)
- # uni.vibrateLong(OBJECT)
- # uni.vibrateShort(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.vibrate({
	success: function () {
		console.log('success');
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/quickstart-hx.html

**Contents:**
- # 创建uni-app
- # 运行uni-app
- # 发布uni-app
  - # 打包为原生App
  - # 发布为Web网站
  - # 发布为小程序
    - # 发布为微信小程序：
    - # 发布为百度小程序：
    - # 发布为支付宝小程序：
    - # 发布为抖音小程序：

uni-app支持通过 可视化界面、vue-cli命令行 两种方式快速创建项目。

可视化的方式比较简单，HBuilderX内置相关环境，开箱即用，无需配置nodejs。

HBuilderX是通用的前端开发工具，但为uni-app做了特别强化。

在点击工具栏里的文件 -> 新建 -> 项目（快捷键Ctrl+N）：

选择uni-app类型，输入工程名，选择模板，点击创建，即可成功创建。

uni-app自带的模板有 默认的空项目模板、Hello uni-app 官方组件和API示例，还有一个重要模板是 uni ui项目模板，日常开发推荐使用该模板，已内置大量常用组件。

开发者也可以使用cli方式创建项目，另见文档 。

差别是：HBuilderX创建的项目根目录就是源码，可直接编辑。uni-app的编译器在HBuilderX的插件目录下，跟随HBuilderX升级而一起升级。

如果开发者习惯于node模式的项目，对HBuilderX可视化方式感到困惑，可另行参考文档：## cli创建项目和HBuilderX可视化界面创建项目的区别

浏览器运行：进入hello-uniapp项目，点击工具栏的运行 -> 运行到浏览器 -> 选择浏览器，即可体验 uni-app 的 web 版。

运行App到手机或模拟器：使用电压足够的usb端口连接手机，设置中开启USB调试，手机上允许电脑设备调试手机，进入hello-uniapp项目，点击工具栏的运行 -> 运行App到手机或模拟器，即可在该设备里面体验uni-app。

在微信开发者工具里运行：进入hello-uniapp项目，点击工具栏的运行 -> 运行到小程序模拟器 -> 微信开发者工具，即可在微信开发者工具里面体验uni-app。

注意：如果是第一次使用，需要先配置小程序ide的相关路径，才能运行成功。如下图，需在输入框输入微信开发者工具的安装路径。

注意：微信开发者工具需要开启服务端口 在微信工具的设置->安全中。

在支付宝小程序开发者工具里运行：进入hello-uniapp项目，点击工具栏的运行 -> 运行到小程序模拟器 -> 支付宝小程序开发者工具，即可在支付宝小程序开发者工具里面体验uni-app。

在百度、抖音、QQ、快应用（分联盟和华为）、快手、飞书、360、京东等小程序开发工具里运行：内容同上，不再重复。

HBuilderX 还提供了快捷运行菜单，可以按数字快速选择要运行的设备：

在HBuilderX工具栏，点击发行，选择原生app-云端打包，如下图：

云端打包支持安心打包，保护用户隐私，不会上传代码和证书，通过差量包制作方式实现安心打包。详见：https://ask.dcloud.net.cn/article/37979

云打包也支持cli模式，通过HBuilderX的cli方式（不是uni-app的cli），可以调用命令行打包，方便持续集成。详见：https://hx.dcloud.net.cn/cli/pack

虽然安心打包已经满足需求，但如仍然希望自己使用 xcode 或 Android studio 进行离线打包，则在 HBuilderX 发行菜单里找到本地打包菜单，生成离线打包资源，然后参考离线打包文档操作：https://nativesupport.dcloud.net.cn/AppDocs/README 。

App打包时，注意如果涉及三方sdk，需进行申请并在manifest.json里配置，否则相关功能无法使用。

iOS App打包需要向Apple申请证书。

如果手动发行，则点击发行按钮后，会在项目的目录 unpackage/dist/build/mp-weixin 生成微信小程序项目代码。在微信小程序开发者工具中，导入生成的微信小程序项目，测试项目代码运行正常后，点击“上传”按钮，之后按照 “提交审核” => “发布” 小程序标准流程，逐步操作即可，详细查看：微信官方教程 。

如果在发行界面勾选了自动上传微信平台，则无需再打开微信工具手动操作，将直接上传到微信服务器提交审核。

发布的快捷键是Ctrl+u。同样可拉下快速发布菜单并按数字键选择。

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
unpackage/dist/build/mp-weixin
```

Example 3 (unknown):
```unknown
/unpackage/dist/build/mp-baidu
```

Example 4 (unknown):
```unknown
/unpackage/dist/build/mp-alipay
```

---

## uni.addPhoneContact(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/contact

**Contents:**
- # uni.addPhoneContact(OBJECT)
  - # addPhoneContact 兼容性
      - 本页导读

调用后，用户可以选择将该表单以“新增联系人”或“添加到已有联系人”的方式（APP端目前没有选择步骤，将直接写入），写入手机系统通讯录，完成手机通讯录联系人和联系方式的增加。

App平台提供了更多通讯录相关API，包括读取联系人，详见：https://www.html5plus.org/doc/zh_cn/contacts.html

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

Example 2 (javascript):
```javascript
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

Example 3 (javascript):
```javascript
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

Example 4 (css):
```css
uni.addPhoneContact({
	nickName: '昵称',
	lastName: '姓',
	firstName: '名',
	remark: '备注',
	mobilePhoneNumber: '114',
	weChatNumber: 'wx123',
	success: function () {
		console.log('success');
	},
	fail: function () {
		console.log('fail');
	}
});
```

---

## Worker | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/worker.html

**Contents:**
    - # Worker
      - 本页导读

---

## uni.getNetworkType(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/network

**Contents:**
- # uni.getNetworkType(OBJECT)
  - # getNetworkType 兼容性
- # uni.onNetworkStatusChange(CALLBACK)
  - # onNetworkStatusChange 兼容性
- # uni.offNetworkStatusChange(CALLBACK)
  - # offNetworkStatusChange 兼容性
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

监听网络状态变化。可使用uni.offNetworkStatusChange取消监听。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS Next
```

Example 2 (unknown):
```unknown
ohos.permission.GET_NETWORK_INFO
```

Example 3 (javascript):
```javascript
uni.getNetworkType({
	success: function (res) {
		console.log(res.networkType);
	}
});
```

Example 4 (javascript):
```javascript
uni.getNetworkType({
	success: function (res) {
		console.log(res.networkType);
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/ble.html

**Contents:**
- # uni.setBLEMTU(OBJECT)
- # uni.writeBLECharacteristicValue(OBJECT)
  - # 错误
  - # 注意
  - # 示例代码
- # uni.readBLECharacteristicValue(OBJECT)
  - # 错误
  - # 注意
  - # 示例代码
- # uni.onBLEConnectionStateChange(CALLBACK)

设置蓝牙最大传输单元。需在 uni.createBLEConnection调用成功后调用，mtu 设置范围 (22,512)。安卓5.1以上有效。

向低功耗蓝牙设备特征值中写入二进制数据。注意：必须设备的特征值支持 write 才可以成功调用。

示例源码如下，请查看 pre > code 标签中的内容

读取低功耗蓝牙设备的特征值的二进制数据值。注意：必须设备的特征值支持 read 才可以成功调用。

示例源码如下，请查看 pre > code 标签中的内容

监听低功耗蓝牙连接状态的改变事件。包括开发者主动连接或断开连接，设备丢失，连接异常断开等等

示例源码如下，请查看 pre > code 标签中的内容

监听低功耗蓝牙设备的特征值变化事件。必须先启用 notifyBLECharacteristicValueChange 接口才能接收到设备推送的 notification。

示例源码如下，请查看 pre > code 标签中的内容

启用低功耗蓝牙设备特征值变化时的 notify 功能，订阅特征值。注意：必须设备的特征值支持 notify 或者 indicate 才可以成功调用。 另外，必须先启用 notifyBLECharacteristicValueChange 才能监听到设备 characteristicValueChange 事件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取蓝牙设备某个服务中所有特征值(characteristic)。

|属性|类型|说明| |---|---|---|---| |characteristics|Array<Object>|设备服务列表|

res.characteristics 的结构

示例源码如下，请查看 pre > code 标签中的内容

若APP在之前已有搜索过某个蓝牙设备，并成功建立连接，可直接传入之前搜索获取的 deviceId 直接尝试连接该设备，无需进行搜索操作。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
notifyBLECharacteristicValueChange
```

Example 2 (unknown):
```unknown
writeBLECharacteristicValue
```

Example 3 (javascript):
```javascript
// 向蓝牙设备发送一个0x00的16进制数据
const buffer = new ArrayBuffer(1)
const dataView = new DataView(buffer)
dataView.setUint8(0, 0)
uni.writeBLECharacteristicValue({
  // 这里的 deviceId 需要在 getBluetoothDevices 或 onBluetoothDeviceFound 接口中获取
  deviceId,
  // 这里的 serviceId 需要在 getBLEDeviceServices 接口中获取
  serviceId,
  // 这里的 characteristicId 需要在 getBLEDeviceCharacteristics 接口中获取
  characteristicId,
  // 这里的value是ArrayBuffer类型
  value: buffer,
  success(res) {
    console.log('writeBLECharacteristicValue success', res.errMsg)
  }
})
```

Example 4 (javascript):
```javascript
// 向蓝牙设备发送一个0x00的16进制数据
const buffer = new ArrayBuffer(1)
const dataView = new DataView(buffer)
dataView.setUint8(0, 0)
uni.writeBLECharacteristicValue({
  // 这里的 deviceId 需要在 getBluetoothDevices 或 onBluetoothDeviceFound 接口中获取
  deviceId,
  // 这里的 serviceId 需要在 getBLEDeviceServices 接口中获取
  serviceId,
  // 这里的 characteristicId 需要在 getBLEDeviceCharacteristics 接口中获取
  characteristicId,
  // 这里的value是ArrayBuffer类型
  value: buffer,
  success(res) {
    console.log('writeBLECharacteristicValue success', res.errMsg)
  }
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/hbuilderx-extension/index.html

uni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务uni-appuni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务简体中文搜索文档K介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub工程化介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub概述Git/SVNcli 脚手架编译运行环境自动化测试快速开始APIHBuilderX自动化测试插件使用 CLI 运行uniapp自动化测试CLI项目运行自动化测试持续集成uniCloud Web控制台插件市场ask问答社区uni-aduni统计代码仓库：Gitee、GitHubuni-app的uni-im交流群：点击加入官方QQ交流群群35：713420817（2000人已满）群34：530305531（2000人已满）群33：498071674（2000人已满）群32：166188631（2000人已满）群31：567471669（2000人已满）群30：371046920（2000人已满）群29：202965481（2000人已满）群28：166188776（2000人已满）群27：811363410（2000人已满）群26：147867597（2000人已满）群25：165297000（2000人已满）群24：672494800（2000人已满）群23：599958679（2000人已满）群22：687186952（2000人已满）群21：717019120（2000人已满）群20：165796402（2000人已满）群19：165657124（2000人已满）群18：698592271（2000人已满）群17：951348804（2000人已满）群16：719211033（2000人已满）群15：516984120（2000人已满）群14：465953250（2000人已满）群13：699478442（2000人已满）群12：884860657（2000人已满）群11：296811328（2000人已满）群10：959059626（2000人已满）群9：775128777（2000人已满）群8：695442854（2000人已满）群7：942061423（2000人已满）群6：697264024（2000人已满）群5：731951419（2000人已满）群4：942702595（2000人已满）群3：773794803（2000人已满）群2：901474938（2000人已满）群1：531031261（2000人已满）关注微信公众号插件说明测试注意事项插件安装测试环境安装uni-app普通项目uniapp-cli项目创建测试用例测试运行测试平台说明选择测试平台展示全部#自动化测试插件#插件说明本插件，用于在HBuilderX内运行uni-app自动化测试，支持H5、微信小程序、Android、iOS、Harmony自动化测试。主要功能有：初始化测试环境（创建测试配置文件、以及安装测试所需的环境）运行测试 (运行项目下所有测试用例、运行某一个测试用例)新建测试用例 （uni-app pages页面，右键菜单【新建测试用例】）查看历史测试报告 （HBuilderX顶部运行菜单）#测试注意事项本插件支持uni-app普通项目和uniapp-cli项目。uniapp-cli项目，运行自动化测试，需要在当前项目下安装自动化测试依赖。Windows电脑不支持运行测试到ios手机。MacOSX电脑，仅支持运行测试到iOS模拟器，不支持ios真机，测试iOS模拟器，需要电脑装安装XCode。运行测试到H5，仅支持chrome浏览器，不支持其它浏览器。运行测试到Android手机，如果HBuilderX仅检测到一个android设备，直接运行测试到当前已连接设备。多个设备时，会弹窗要求选择手机。node: 当本机未安装node时，将使用HBuilderX内置node运行测试。反之，本机安装了node，则使用本机的node。运行测试到微信小程序，必须在manifest.json内，配置微信小程序 appid。如果微信开发者工具无法成功打开项目，首次请手动打开。#插件安装插件安装地址如下图所示，在插件市场，进入插件详情页，点击【导入插件】，会自动拉起本地安装的HBuilderX。特别注意：插件安装，依赖HBuilderX 终端插件。#测试环境安装插件依赖：H5、微信、ios、android自动化测试依赖puppeteer、adbkit、node-simctl、jest、playwright，运行插件时，如果未安装此依赖，将会弹窗自动安装。注意：本插件0.0.3版本及以下，node: 当本机未安装node时，将使用HBuilderX内置的node运行测试。反之，本机安装了node，则使用本机的node。注意：本插件0.0.4+版本，新增配置项 支持自定义设置使用何种node版本进行uni-app编译特别注意：uni-app普通项目，需要通过插件hbuilderx-for-uniapp-test来安装测试环境。uniapp-cli项目，只需在项目下安装相关测试依赖即可。详情#uni-app普通项目uni-app普通项目，初始化测试环境或运行测试时，如果未安装相关依赖，会自动安装。如下图所示，项目管理器，选中项目，右键菜单【初始化测试环境】注意：安装环境依赖时，如果检测到项目下不存在测试配置文件env.js和jest.config.js，则会自动创建测试配置文件。#uniapp-cli项目uniapp-cli项目，自动化测试运行，将使用项目下的依赖库。打开命令行，进入项目目录，输入如下命令进行安装:npminstall--savecross-env puppeteer adbkit node-simctl jest playwright @playwright/test示例源码如下，请查看 pre > code 标签中的内容npm install --save cross-env puppeteer adbkit node-simctl jest playwright @playwright/test#创建测试用例uni-app项目，pages页面，右键菜单，创建测试用例#测试运行创建测试用例之后，选中项目，右键菜单【运行uni-app自动化测试】，选择运行平台，即可开始运行测试。注意：如果要运行指定的测试用例，请在项目管理器选中要运行的用例，右键菜单【运行当前测试用例】#测试平台说明Windows电脑不支持运行测试到ios手机MacOSX电脑，仅支持运行测试到ios模拟器，不支持ios真机。运行测试到H5，仅支持chrome浏览器，不支持其它浏览器。运行测试到Android手机，如果HBuilderX仅检测到一个android设备，直接运行测试到当前已连接设备。多个设备时，会弹窗要求选择手机。#选择测试平台如下图所示，运行测试时，支持选择对应平台。#选择设备如果无法获取到设备信息，请参考#插件配置点击菜单【设置】【插件配置】，找到hbuilderx-for-uniapp-test项，即可看到设置项。如上图支持自定义测试报告路径。自动修改jest.config.js文件中的testMatch，默认为true。去掉勾选后，将不再自动修改testMatch。插件0.0.4+版本，新增配置项 支持自定义设置使用何种node版本进行uni-app编译。即您可以选择使用HBuilderX内置的Node、还是使用操作系统安装的Node进行uni-app编译。#如何编写测试用例uni-app自动化测试，使用了业内常见的jest测试库。uni-app项目，pages目录下，右键菜单【创建测试用例】，选择模板。测试用例文件名，必须为xxx.test.js测试用例编写，请遵循jest规范。#jest用例解析下面将使用一个最简单的示例，来讲解测试用例的组成。describe表示一组用例, decribe会形成一个作用域it测试函数test测试函数，类似itexpect匹配器。使用文档# 求和测试functionsum(a,b){returna+b;};describe("sum test",()=>{it('adds 1 + 2 to equal 3',()=>{expect(sum(1,2)).toBe(3);});test('adds 1 + 1 to equal 3',()=>{expect(sum(1,1)).toBe(3);});})示例源码如下，请查看 pre > code 标签中的内容# 求和测试
function sum(a, b) {
    return a + b;
};

describe("sum test", () => {
    it('adds 1 + 2 to equal 3', () => {
        expect(sum(1, 2)).toBe(3);
    });
    test('adds 1 + 1 to equal 3', () => {
        expect(sum(1, 1)).toBe(3);
    });
})#uni-app页面用例示例以uni-app【默认模板】index页面为例。编写测试用例，检查index.vue页面，标题是否为Hellodescribe('test title',()=>{letpage;beforeAll(async()=>{page=awaitprogram.currentPage();awaitpage.waitFor(3000);});it('check page title',async()=>{constel=awaitpage.$('.title');consttitleText=awaitel.text();expect(titleText).toEqual('Hello');});});示例源码如下，请查看 pre > code 标签中的内容describe('test title', () => {
    let page;
    beforeAll(async () => {
        page = await program.currentPage();
        await page.waitFor(3000);
    });

    it('check page title', async () => {
        const el = await page.$('.title');
        const titleText = await el.text();
        expect(titleText).toEqual('Hello');
    });
});扩展：如上测试代码中，使用了beforeAll函数，它用于在所有测试之前执行。了解jest更多钩子函数#Setup and Teardown通常在编写测试时，您需要在测试运行之前进行一些设置工作，并且在测试运行之后需要进行一些完成工作。可以使用Jest的钩子函数来解决这个问题.jest中有4个钩子函数beforeAll：所有测试之前执行afterAll：所有测试执行完之后beforeEach：每个测试实例之前执行afterEach：每个测试实例完成之后执行文档扩展:jest setup-teardown#钩子函数的执行顺序用下列代码，我们来查看一下函数执行顺序describe('test Run Sequence',()=>{beforeAll(()=>{console.log('1 - beforeAll');});afterAll(()=>{console.log('1 - afterAll');});beforeEach(()=>{console.log('1 - beforeEach');});afterEach(()=>{console.log('1 - afterEach');});test('test',()=>{console.log('1 - test')});});示例源码如下，请查看 pre > code 标签中的内容describe('test Run Sequence', () => {
    beforeAll(() => {
        console.log('1 - beforeAll');
    });
    afterAll(() => {
        console.log('1 - afterAll');
    });
    beforeEach(() => {
        console.log('1 - beforeEach');
    });
    afterEach(() => {
        console.log('1 - afterEach');
    });
    test('test', () => {
        console.log('1 - test')
    });
});运行结果test Run Sequence
    ✓test(4ms)console.log1-beforeAll

  console.log1-beforeEach

  console.log1-test

  console.log1-afterEach

  console.log1-afterAll

Test Suites:1passed,1totalTests:1passed,1totalSnapshots:0totalTime:0.454s示例源码如下，请查看 pre > code 标签中的内容test Run Sequence
    ✓ test (4 ms)

  console.log
    1 - beforeAll

  console.log
    1 - beforeEach

  console.log
    1 - test

  console.log
    1 - afterEach

  console.log
    1 - afterAll

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.454 s#内置Jest代码块为了更快速的编写测试用例，本插件内置了jest部分代码块prefix代码块describedescribe('', () => {});testtest('', () => {});tatest('', async () => {await});beforeAllbeforeAll(() => {});afterEachafterEach(() => {});afterAllafterAll(() => {});beforeAllbeforeAll(() => {});#env.js提醒：下面关于env.js的介绍，大部分情况下，自动化测试插件会自动修改，无需您手动调整。如果不确定，请勿修改。通常，测试项目下有个测试配置文件env.js，内容如下:module.exports={// is-custom-runtime = true，修改env.js时，将不会使用标准基座路径，替代env.js中已配置的android、ios基座路径。"is-custom-runtime":false,"UNI_TEST_CUSTOM_ENV":{// 自动化测试插件 1.9.0版本新增`UNI_TEST_CUSTOM_ENV`"xx":"xx"},"compile":true,"h5":{// 此处省略........},"mp-weixin":{// 此处省略........},"app-plus":{// 此处省略........}}示例源码如下，请查看 pre > code 标签中的内容module.exports = {
	// is-custom-runtime = true，修改env.js时，将不会使用标准基座路径，替代env.js中已配置的android、ios基座路径。
    "is-custom-runtime": false,
    "UNI_TEST_CUSTOM_ENV": {
		// 自动化测试插件 1.9.0版本新增`UNI_TEST_CUSTOM_ENV`
		"xx": "xx"
    },
    "compile": true,
    "h5": {
        // 此处省略........
    },
    "mp-weixin": {
		// 此处省略........
    },
    "app-plus": {
        // 此处省略........
    }
}#env.js UNI_TEST_CUSTOM_ENV提示：大部分场景下，您不会用到UNI_TEST_CUSTOM_ENV。修改请慎重。下面将对UNI_TEST_CUSTOM_ENV做介绍。自动化测试插件 1.9.0版本新增UNI_TEST_CUSTOM_ENV, 用于读取自定义环境变量，并传递给uniapp自动化测试框架命令行。后期会随时扩充新的key。{"UNI_TEST_CUSTOM_ENV":{// APPID 用于测试自定义基座"UNI_TEST_BASE_APPID":"__UNI__xxxxxxxx",// 基座包名 用于测试自定义基座"UNI_TEST_BASE_PACKAGE_NAME":"io.xxx.xxx"}}示例源码如下，请查看 pre > code 标签中的内容{
	"UNI_TEST_CUSTOM_ENV": {
		// APPID 用于测试自定义基座 
		"UNI_TEST_BASE_APPID": "__UNI__xxxxxxxx",
		// 基座包名 用于测试自定义基座
		"UNI_TEST_BASE_PACKAGE_NAME": "io.xxx.xxx"
	}
}#多个HBuilderX时，如何共用一个测试依赖？场景：电脑上安装了HBuilderX 正式版、Dev、Alpha版本，每个程序plugins目录都重新安装一遍测试依赖？答案：不需要。解决方案：进入HBuilderX安装目录，将plugins目录下的hbuilderx-for-uniapp-test-lib目录，拷贝到电脑其它目录。拷贝后，在命令行进入上面的拷贝目录下，执行npm install打开HBuilderX菜单【设置】【源码视图】，增加配置项:{
	"hbuilderx-for-uniapp-test.customTestEnvironmentDependencyDir" : "自定义的测试依赖node_modules路径，路径必须以node_modules结尾"
}示例源码如下，请查看 pre > code 标签中的内容{
	"hbuilderx-for-uniapp-test.customTestEnvironmentDependencyDir" : "自定义的测试依赖node_modules路径，路径必须以node_modules结尾"
}帮助我们改善此页面！上次更新:2026/1/8 11:26:36开发产品HBuilderXuni-appuni-app xuniClouduniMPsdk5+Runtimewap2appMUIuni-iduni-cdnuni-payuni-pushuni一键登录uni实人认证smsuni-starteruni-adminuni-upgrade-centeruni-imuni-aiuni-cmsuniCloud-mapuni-search运营产品uni-aduni统计uni发行uni安全专题开发者服务问答社区开发者后台技术文档uni-app文档uniCloud文档原生开发者支持文档HBuilder文档生态服务插件市场OAuth用户开放平台关于我们：DCloud官网案例需求墙许可协议加入我们赞助我们联系我们：商务合作：bd@dcloud.io广告合作：uniad@dcloud.ioDCloud.io数字天堂（北京）网络技术有限公司是HTML5中国产业联盟发起单位京公网安备：11010802035340号国家信息安全等级保护三级，证书编号：11010813802-20001本页导读插件说明测试注意事项插件安装测试环境安装uni-app普通项目uniapp-cli项目创建测试用例测试运行测试平台说明选择测试平台选择设备插件配置如何编写测试用例jest用例解析uni-app页面用例示例Setup and Teardown钩子函数的执行顺序内置Jest代码块env.jsenv.js UNITESTCUSTOM_ENV多个HBuilderX时，如何共用一个测试依赖？

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/clipboard

**Contents:**
- # uni.setClipboardData(OBJECT)
  - # setClipboardData 兼容性
- # uni.getClipboardData(OBJECT)
  - # getClipboardData 兼容性
  - # 注意
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

---

## uni.getLocale() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/locale.html

**Contents:**
- # uni.getLocale()
  - # getLocale 兼容性
- # uni.setLocale(locale)
  - # setLocale 兼容性
- # uni.onLocaleChange(callback)
  - # onLocaleChange 兼容性
- # 注意事项
- # 语言回退规则
      - 本页导读

如果当前应用设置过语言，会获取到之前设置的语言，未设置时会返回根据系统语言类型自动选择的语言。

仅可设置为框架内置语言与自定义扩展的语言，遵循 BCP47 规范。

需要注意的是，语言的处理逻辑是建立在应用locale目录 配置了对应资源的前提下。 资源配置文档

如果应用的 locale目录下配置了对应的资源，那么语言的设置和获取是一致的

如果应用的 locale目录没有配置对应的资源，则会根据具体的平台规则进行回退。

举个例子，应用中仅配置了英文和中文资源，没有配置日语资源，但是通过系统设置修改语言为日文，此时调用 uni.getLocale() 在android平台上获取到的返回值不会是jp 而是en

**Examples:**

Example 1 (unknown):
```unknown
uni.getLocale()
```

---

## uni.onGyroscopeChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/gyroscope.html

**Contents:**
- # uni.onGyroscopeChange(CALLBACK)
- # uni.startGyroscope(OBJECT)
- # uni.stopGyroscope(OBJECT)
      - 本页导读

支付宝小程序频率为 500ms/次，微信小程序频率根据 uni.startGyroscope 的 interval 参数设置。事件只有在调用 uni.startGyroscope 后才会开始监听，使用 uni.stopGyroscope 可以停止监听。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

Example 2 (html):
```html
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

Example 3 (html):
```html
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

Example 4 (vue):
```vue
<template>
    <view>
        <button @click="start">开始监听陀螺仪变化</button>
        <button @click="stop">停止监听陀螺仪变化</button>
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/unipush-v1.html

**Contents:**
- # uni-push介绍
- # 一、客户端集成
  - # 1.1 开通 uni-push 推送服务
  - # 1.2 开通离线厂商推送服务
  - # 1.3 集成验证
    - # 1.3.1 cid 获取
    - # 1.3.2 确认离线厂商是否可用
- # 二、服务端推送消息
  - # 2.1 开发者中心后台Web页面推送
  - # 2.2 个推服务端 api 推送

您正在浏览的是老版uni-push1.0的文档。推荐升级到uni-push2.0

从HBuilderX 2.0.3 起，uni-app、5+App、wap2app均支持uni-push 从HBuilderX 2.7.10开始，支持谷歌FCM，参考：如何使用FCM

uni-push 内部封装好了个推及主流厂商 SDK，开发者在使用前必须开通相关服务：点此查看如何开通uni-push推送服务 。

完成以上步骤后，ios 支持在线、离线推送；android 仅支持在线推送。

若需要支持主流 android 厂商客户端接收离线推送，您需要完成 ：android 多厂商配置 。

配置好厂商参数后请一定要提交云打包，并且使用“自有证书”打签名包；将云打包后的安装包安装到手机上，再获取cid 进行离线厂商推送测试，不可使用基座方式获取的 cid 进行离线厂商推送测试。

在应用安装后第一次运行时应该调用 5+ API 的 plus.push.getClientInfoAsync 方法获取客户端标识。

如果获取的 cid 为空，说明客户端向推送服务器注册还未完成，可以使用 setTimeout 延时重试。

示例源码如下，请查看 pre > code 标签中的内容

在【uni-push/1.0/消息推送】-【配置管理】-【故障排查】-【状态查询】中输入CID 查询，看是否会返回 devicetoken 。

说明当前未正常集成厂商，无法使用离线推送功能。

华为厂商平台更换应用包名或者证书时，需要同步更新云端的agconnect-services.json和包名等信息，否则将导致打包失败。

开发者可通过以下三种方式推送消息，选择其中一种即可。

若您在测试过程中遇到无法收到推送的情况，请先按照 uni-push 1.0常见问题 中的排查思路自助排查一下，例如常见问题：安卓离线收不到通知 。

登录 DCloud开发者中心 ，在左侧导航选择“uni-push”-“1.0（老版本）”-“消息推送”，打开消息推送页面。

当 CID 在线(即 app 在前台打开运行)时：

消息通过个推通道下发到客户端，具体到服务端 Rest-V2 代码中，即 push_message 中的 notification（通知） 或 transmission（透传） 内容传递给客户端。

当 CID 离线(即 app 在后台、锁屏、进程关闭)时：

有开启对应厂商离线功能的，消息将通过个推侧请求对应厂商侧的服务端，具体到服务端 Rest-V2 代码中，即 push_channel 中的通知内容传递给厂商，实际的消息是经由厂商服务器下发至客户端；若服务端 push_channel 不传值，则无法接收离线消息。

对于没有开启对应厂商功能的，消息将存在个推的离线库中，等待 CID 在线，再通过个推通道下发到客户端。

个推服务端接口文档可查看：服务端 RestAPI V2 ，支持以下 2 种方式调用，选择其中一种即可，推荐您使用 Http 请求。

服务端集成时首先需要获取 AppId、AppKey、MasterSecret 参数，登录 DCloud开发者中心 ，在“uni-push”-“1.0（老版本）”-“消息推送”下的“应用配置”页面中获取，如下图所示：

**Http 请求：**参数详情可查看：服务端 RestAPI V2

示例源码如下，请查看 pre > code 标签中的内容

个推服务端 SDK 的主要目标是提升开发者在服务端集成个推推送服务的开发效率。 开发者不需要进行复杂编程即可使用个推推送服务的各项常用功能，SDK 可以自动帮您满足调用过程中所需的鉴权、组装参数、发送HTTP请求等非功能性要求，目前仅支持 Java 和 PHP 语言。

在使用以下代码前请先查看 个推服务端 Java SDK ，配置使用最新版 SDK 。若您想查看详细的字段描述，或者想集成 PHP SDK 可查看：服务端 RestAPI V2 。

示例源码如下，请查看 pre > code 标签中的内容

鉴于各厂商SDK打开应用自定义页面有多种方式，且有些方式互不兼容，为了保持统一并且方便开发者，个推提供一种标准且唯一的打开App 内自定义页面方式，通过服务端 API 指定 intent 参数。

使用厂商推送下发推送消息必须设置 intent，该数据格式是Android原生Intent对象序列化由来。具体可参考 详情 。并且intent须符合以下格式，此格式时在个推定义额基础上二次封装，所以必须以此格式为准。不按此格式设置 intent 可能出现用户点击推送消息无法启动App 的问题，并且离线情况下click事件无法得到响应。 intent 数据格式如下：

示例源码如下，请查看 pre > code 标签中的内容

component=io.dcloud.HBuilder/io.dcloud.PandoraEntry，其中 io.dcloud.HBuilder 为 App 包名，需要替换为自己 App 的包名，与 App 云端打包界面设置的 Android 包名一致。

uni-push推送服务对透传消息的数据符合以下格式时做了特殊处理，会将如下格式的透传消息，直接在通知栏中展示通知。

示例源码如下，请查看 pre > code 标签中的内容

使用封装好的服务器端开发易用插件，详情可查看：uniPush的uniCloud版【V2】

uni-push 推送服务已经封装好 iOS&Android 平台的原生集成工作，开发者只需要调用 JS 代码处理推送消息的业务逻辑。

若您需要在客户端接收处理推送 uni-push 推送内容，请先阅读了解此对接指南开头的 “消息推送流程”，客户端回调处理可参考：在uni-app中使用uni-push 。

对于支持角标设置的机型，app 在线推送时可调用 5+ API plus.runtime.setBadgeNumber 设置或清零角标。

不同 ROM 接收推送消息对桌面图标的角标处理逻辑存在差别，安卓厂商离线角标支持情况如下：

oppo/魅族，部分手机系统上能设置角标圆点，没有数字角标的功能。

小米系统自带离线通知数字角标展示功能，默认+1处理，打开清零。

vivo高版本系统自带离线通知数字角标展示功能，默认+1处理，打开清零，低版本没有角标功能。

华为角标需服务端api进行字段设置，客户端需要手动设置角标数为0

add方式支持版本： EMUI版本8.0.0且推送服务应用版本 8.0.0及以上

服务端 rest-v2 设置示例，注意uni-push用户的class的值请固定使用'io.dcloud.PandoraEntry'

示例源码如下，请查看 pre > code 标签中的内容

根据接收到的推送消息处理桌面图标的角标，在uni-push后台的“iOS配置”项中可配置 badge 参数对角标进行设置，可取值：

默认（不设置badge参数）则角标数字不变，也可以在应用运行期调用5+ API plus.runtime.setBadgeNumber 动态设置角标数字。

如有其它疑问，可使用微信扫描下面二维码，进行技术咨询

**Examples:**

Example 1 (javascript):
```javascript
plus.push.getClientInfoAsync((info) => {
     let cid = info["clientid"];
});
```

Example 2 (javascript):
```javascript
plus.push.getClientInfoAsync((info) => {
     let cid = info["clientid"];
});
```

Example 3 (javascript):
```javascript
plus.push.getClientInfoAsync((info) => {
     let cid = info["clientid"];
});
```

Example 4 (javascript):
```javascript
plus.push.getClientInfoAsync((info) => {
     let cid = info["clientid"];
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/window/communication.html

**Contents:**
- # uni.$emit(eventName,OBJECT)
  - # $emit 兼容性
- # uni.$on(eventName,callback)
  - # $on 兼容性
- # uni.$once(eventName,callback)
  - # $once 兼容性
- # uni.$off(eventName, callback)
  - # $off 兼容性
      - 本页导读

自 HBuilderX 2.0.0 起支持，使用指南

触发全局的自定义事件，附加参数都会传给监听器回调函数。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件，事件由 uni.$emit 触发，回调函数会接收事件触发函数的传入参数。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件，事件由 uni.$emit 触发，但仅触发一次，在第一次触发之后移除该监听器。

示例源码如下，请查看 pre > code 标签中的内容

$emit、$on、$off常用于跨页面、跨组件通讯，这里为了方便演示放在同一个页面

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.$emit('update',{msg:'页面更新'})
```

Example 2 (javascript):
```javascript
uni.$emit('update',{msg:'页面更新'})
```

Example 3 (javascript):
```javascript
uni.$emit('update',{msg:'页面更新'})
```

Example 4 (css):
```css
uni.$emit('update',{msg:'页面更新'})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/video.html

**Contents:**
- # uni.chooseVideo(OBJECT)
  - # chooseVideo 兼容性
- # uni.chooseMedia(OBJECT)
  - # chooseMedia 兼容性
- # uni.saveVideoToPhotosAlbum(OBJECT)
  - # saveVideoToPhotosAlbum 兼容性
- # uni.getVideoInfo(OBJECT)
  - # getVideoInfo 兼容性
- # uni.compressVideo(OBJECT)
  - # compressVideo 兼容性

视频需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

拍摄视频或从手机相册中选视频，返回视频的临时文件路径。

若选择和上传非图像、视频文件，另行参考：https://uniapp.dcloud.io/api/media/file 。

示例源码如下，请查看 pre > code 标签中的内容

拍摄或从手机相册中选择图片或视频。注意在app平台，相册选择使用的是系统相册。系统相册选择不需要本地媒体访问权限，但上面的UI无法定制，不能自行添加类似“原图”的单选框，

若选择和上传非图像、视频文件，另行参考：https://uniapp.dcloud.io/api/media/file 。

OBJECT.sourceType 合法值

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

压缩视频接口。开发者可指定压缩质量 quality 进行压缩。当需要更精细的控制时，可指定 bitrate、fps、和 resolution，当 quality 传入时，这三个参数将被忽略。原视频的相关信息可通过 getVideoInfo 获取。

App端有很多插件支持视频压缩，详见插件市场

压缩完毕后如需上传到cdn，可使用uniCloud.uploadFile API，uniCloud提供了免费cdn给开发者使用，详见https://doc.dcloud.net.cn/uniCloud/storage?id=uploadfile

**Examples:**

Example 1 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

Example 2 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

Example 3 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

Example 4 (vue):
```vue
<template>
	<view>
		<text>hello</text>
		<button @tap="test">click me</button>
		<video :src="src"></video>
	</view>
</template>
export default {
	data() {
		return {
			src: ''
		}
	},
	methods: {
		test: function () {
			var self = this;
			uni.chooseVideo({
				sourceType: ['camera', 'album'],
				success: function (res) {
					self.src = res.tempFilePath;
				}
			});
		}
	}
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/app/geolocation.html

**Contents:**
  - # 背景
  - # 系统定位
    - # iOS平台
    - # Android平台
      - 本页导读

HBuilderX3.3.0开始独立出“系统定位”模块

从2021年初开始，高德、百度、腾讯等地图服务商更新了服务协议、开始实施商业授权机制，要求除公益App外所有使用地图相关功能（包括定位SDK、地图SDK、H5地图等）都需要获取地图服务商的商业授权。重点强调一下，免费应用同样需要商业授权，除非你的应用是公益类App，其它类型App都需要商业授权。

为了避免商业授权引起的问题，也可以只使用“系统定位”模块，“系统定位”在功能和机型适配上没有高德、百度等商业定位服务完善，需开发者根据实际情况选择。

系统定位调用的系统提供的定位服务，不同设备对定位功能支持的情况有所差异

由苹果公司提供定位服务，可以获取经纬度信息，也支持解析地址信息。即可以直接返回城市街道信息。

标准Android平台的定位服务是Google提供的，但需要手机内置GMS服务，连接Google服务器。国产手机大多不支持。

主流国内手机厂商均自行提供了定位服务，但小众品牌可能不支持，主流品牌中较老的机型也不支持。如下Android手机厂商都支持系统定位：

在国外通常都是使用Google的GMS提供定位服务。

注意：Android系统定位模块不支持位置解析服务，只可以获取经纬度信息，不支持解析地址信息。如需要根据经纬度获取城市街道信息，仍然需要请求高德、百度等商业服务

---

## uni.setNavigationBarTitle(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/navigationbar.html

**Contents:**
- # uni.setNavigationBarTitle(OBJECT)
  - # setNavigationBarTitle 兼容性
- # uni.setNavigationBarColor(OBJECT)
  - # setNavigationBarColor 兼容性
- # uni.showNavigationBarLoading(OBJECT)
  - # showNavigationBarLoading 兼容性
- # uni.hideNavigationBarLoading(OBJECT)
  - # hideNavigationBarLoading 兼容性
- # uni.hideHomeButton(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

设置页面导航条颜色。如果需要进入页面就设置颜色，请延迟执行，防止被框架内设置颜色逻辑覆盖

animation.timingFunc 有效值

示例源码如下，请查看 pre > code 标签中的内容

App 平台（不包括 HarmonyOS Next）调用此 API 时会在屏幕中间悬浮显示 loading

示例源码如下，请查看 pre > code 标签中的内容

App 平台（不包括 HarmonyOS Next）调用此 API 时会关闭屏幕中间悬浮显示的 loading

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

Example 2 (javascript):
```javascript
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

Example 3 (javascript):
```javascript
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

Example 4 (css):
```css
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

---

## CanvasContext | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/CanvasContext.html

**Contents:**
- # CanvasContext
- # CanvasContext.fillStyle string
- # CanvasContext.strokeStyle string
- # CanvasContext.shadowOffsetX number
- # CanvasContext.shadowOffsetY number
- # CanvasContext.shadowColor number
- # CanvasContext.shadowBlur number
- # CanvasContext.lineWidth number
- # CanvasContext.lineCap number
- # CanvasContext.lineJoin number

App-nvue下如需使用canvas，暂未封装为uni API，可参考文档 使用。

填充颜色。用法同 CanvasContext.setFillStyle()。

边框颜色。用法同 CanvasContext.setStrokeStyle()。

线条的宽度。用法同 CanvasContext.setLineWidth()。

线条的端点样式。用法同 CanvasContext.setLineCap()。

线条的交点样式。用法同 CanvasContext.setLineJoin()。

最大斜接长度。用法同 CanvasContext.setMiterLimit()。

当前字体样式的属性。符合 CSS font 语法 的 DOMString 字符串，至少需要提供字体大小和字体族名。默认值为 10px sans-serif。

全局画笔透明度。范围 0-1，0 表示完全透明，1 表示完全不透明。

在绘制新形状时应用的合成操作的类型。目前安卓版本只适用于 fill 填充块的合成，用于 stroke 线段的合成效果都是 source-over。

画一条弧线。创建一个圆可以用 arc() 方法指定起始弧度为0，终止弧度为 2 * Math.PI。用 stroke() 或者 fill() 方法来在 canvas 中画弧线。

示例源码如下，请查看 pre > code 标签中的内容

针对 arc(100, 75, 50, 0, 1.5 * Math.PI)的三个关键坐标如下：

示例源码如下，请查看 pre > code 标签中的内容

开始创建一个路径，需要调用fill或者stroke才会使用路径进行填充或描边。

Tip: 在最开始的时候相当于调用了一次 beginPath()。 Tip: 同一个路径内的多次setFillStyle()、setStrokeStyle()、setLineWidth()等设置，以最后一次设置为准。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

针对 moveTo(20, 20) bezierCurveTo(20, 100, 200, 100, 200, 20) 的三个关键坐标如下：

clearRect 并非画一个白色的矩形在地址区域，而是清空，为了有直观感受，对 canvas 加了一层背景色。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

从原始画布中剪切任意形状和尺寸。一旦剪切了某个区域，则所有之后的绘图都会被限制在被剪切的区域内（不能访问画布上的其他区域）。可以在使用 clip() 方法前通过使用 save() 方法对当前画布区域进行保存，并在以后的任意时间对其进行恢复（通过 restore() 方法）。

Tip: 用 setFillStroke() 设置矩形线条的颜色，如果没设置默认是黑色。

示例源码如下，请查看 pre > code 标签中的内容

Tip: 关闭路径会连接起点和终点。 Tip: 如果关闭路径后没有调用 fill() 或者 stroke() 并开启了新的路径，那之前的路径将不会被渲染。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

创建一个从圆心开始的渐变。返回的 CanvasGradient 对象，需要使用 CanvasGradient.addColorStop() 来指定渐变点，至少要两个。

示例源码如下，请查看 pre > code 标签中的内容

创建一个线性的渐变颜色。返回的 CanvasGradient 对象，需要使用 CanvasGradient.addColorStop() 来指定渐变点，至少要两个。

示例源码如下，请查看 pre > code 标签中的内容

对指定的图像创建模式的方法，可在指定的方向上重复元图像

示例源码如下，请查看 pre > code 标签中的内容

将之前在绘图上下文中的描述（路径、变形、样式）画到 canvas 中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对当前路径中的内容进行填充。默认的填充色为黑色。

Tip: 如果当前路径没有闭合，fill() 方法会将起点和终点进行连接，然后填充，详情见例一。

Tip: fill() 填充的的路径是从 beginPath() 开始计算，但是不会将 fillRect() 包含进去，详情见例二。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Tip: 用 setFillStyle() 设置矩形的填充色，如果没设置默认是黑色。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

增加一个新点，然后创建一条从上次指定点到目标点的线。

Tip: 用 stroke() 方法来画线条

示例源码如下，请查看 pre > code 标签中的内容

该方法在 HarmonyOS Next 设备上是异步，需要传入回调函数获取文本尺寸信息。

测量文本尺寸信息，目前仅返回文本宽度。同步接口。（App 端 2.8.12+ 支持）

返回 TextMetrics 对象，结构如下：

示例源码如下，请查看 pre > code 标签中的内容

把路径移动到画布中的指定点，不创建线条。用 stroke() 方法来画线条。

示例源码如下，请查看 pre > code 标签中的内容

创建二次贝塞尔曲线路径。曲线的起始点为路径中前一个点。

示例源码如下，请查看 pre > code 标签中的内容

针对 moveTo(20, 20) quadraticCurveTo(20, 100, 200, 20) 的三个关键坐标如下：

Tip: 用 fill() 或者 stroke() 方法将矩形真正的画到 canvas 中。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

以原点为中心，原点可以用 translate方法修改。顺时针旋转当前坐标轴。多次调用rotate，旋转的角度会叠加。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在调用scale方法后，之后创建的路径其横纵坐标会被缩放。多次调用scale，倍数会相乘。

示例源码如下，请查看 pre > code 标签中的内容

设置填充色，如果没有设置 fillStyle，默认颜色为 black。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

设置最大斜接长度，斜接长度指的是在两条线交汇处内角和外角之间的距离。 当 setLineJoin() 为 miter 时才有效。超过最大倾斜长度的，连接处将以 lineJoin 为 bevel 来显示。

示例源码如下，请查看 pre > code 标签中的内容

设置阴影样式。如果没有设置，offsetX 默认值为0， offsetY 默认值为0， blur 默认值为0，color 默认值为 black。

示例源码如下，请查看 pre > code 标签中的内容

设置边框颜色。如果没有设置 fillStyle，默认颜色为 black。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

Tip: stroke() 描绘的的路径是从 beginPath() 开始计算，但是不会将 strokeRect() 包含进去，详情见例二。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

画一个矩形(非填充)。用 setFillStroke() 设置边框颜色，如果没设置默认是黑色。

示例源码如下，请查看 pre > code 标签中的内容

给定的 (x, y) 位置绘制文本描边的方法

示例源码如下，请查看 pre > code 标签中的内容

对当前坐标系的原点(0, 0)进行变换，默认的坐标系原点为页面左上角。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
source-over
```

Example 2 (unknown):
```unknown
2 * Math.PI
```

Example 3 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Draw coordinates
ctx.arc(100, 75, 50, 0, 2 * Math.PI)
ctx.setFillStyle('#EEEEEE')
ctx.fill()

ctx.beginPath()
ctx.moveTo(40, 75)
ctx.lineTo(160, 75)
ctx.moveTo(100, 15)
ctx.lineTo(100, 135)
ctx.setStrokeStyle('#AAAAAA')
ctx.stroke()

ctx.setFontSize(12)
ctx.setFillStyle('black')
ctx.fillText('0', 165, 78)
ctx.fillText('0.5*PI', 83, 145)
ctx.fillText('1*PI', 15, 78)
ctx.fillText('1.5*PI', 83, 10)

// Draw points
ctx.beginPath()
ctx.arc(100, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('lightgreen')
ctx.fill()

ctx.beginPath()
ctx.arc(100, 25, 2, 0, 2 * Math.PI)
ctx.setFillStyle('blue')
ctx.fill()

ctx.beginPath()
ctx.arc(150, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('red')
ctx.fill()

// Draw arc
ctx.beginPath()
ctx.arc(100, 75, 50, 0, 1.5 * Math.PI)
ctx.setStrokeStyle('#333333')
ctx.stroke()

ctx.draw()
```

Example 4 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Draw coordinates
ctx.arc(100, 75, 50, 0, 2 * Math.PI)
ctx.setFillStyle('#EEEEEE')
ctx.fill()

ctx.beginPath()
ctx.moveTo(40, 75)
ctx.lineTo(160, 75)
ctx.moveTo(100, 15)
ctx.lineTo(100, 135)
ctx.setStrokeStyle('#AAAAAA')
ctx.stroke()

ctx.setFontSize(12)
ctx.setFillStyle('black')
ctx.fillText('0', 165, 78)
ctx.fillText('0.5*PI', 83, 145)
ctx.fillText('1*PI', 15, 78)
ctx.fillText('1.5*PI', 83, 10)

// Draw points
ctx.beginPath()
ctx.arc(100, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('lightgreen')
ctx.fill()

ctx.beginPath()
ctx.arc(100, 25, 2, 0, 2 * Math.PI)
ctx.setFillStyle('blue')
ctx.fill()

ctx.beginPath()
ctx.arc(150, 75, 2, 0, 2 * Math.PI)
ctx.setFillStyle('red')
ctx.fill()

// Draw arc
ctx.beginPath()
ctx.arc(100, 75, 50, 0, 1.5 * Math.PI)
ctx.setStrokeStyle('#333333')
ctx.stroke()

ctx.draw()
```

---

## editorContext | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/editor-context

**Contents:**
- # editorContext
- # editorContext.format(name, value)
- # editorContext.insertDivider(OBJECT)
- # editorContext.insertImage(OBJECT)
- # editorContext.insertText(OBJECT)
- # editorContext.setContents(OBJECT)
- # editorContext.getContents(OBJECT)
- # editorContext.clear(OBJECT)
- # editorContext.removeFormat(OBJECT)
- # editorContext.undo(OBJECT)

editor 组件对应的 editorContext 实例，可通过 uni.createSelectorQuery 获取。

示例源码如下，请查看 pre > code 标签中的内容

百度小程序 Editor 富文本编辑器动态库提供了 createEditorContext 的方法来获取。

示例源码如下，请查看 pre > code 标签中的内容

editorContext 通过 id 跟一个 <editor> 组件绑定，操作对应的 <editor> 组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对已经应用样式的选区设置会取消样式。css style 表示 css 中规定的允许值。

微信小程序平台地址为临时文件时，获取的编辑器html格式内容中 <img> 标签增加属性 data-local，delta 格式内容中图片 attributes 属性增加 data-local 字段，该值为传入的临时文件地址。 开发者可选择在提交阶段上传图片到服务器，获取到网络地址后进行替换。替换时对于html内容应替换掉 <img> 的 src 值，对于 delta 内容应替换掉 insert { image: abc } 值。

初始化编辑器内容，html和delta同时存在时仅delta生效

获取编辑器已选区域内的纯文本内容。当编辑器失焦或未选中一段区间时，返回内容为空。

**Examples:**

Example 1 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

Example 2 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

Example 3 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

Example 4 (csharp):
```csharp
onEditorReady() {
		uni.createSelectorQuery().select('#editor').context((res) => {
			this.editorCtx = res.context
		}).exec()
	}
```

---

## uni.requestVirtualPayment(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/virtualPayment

**Contents:**
- # uni.requestVirtualPayment(OBJECT)
  - # 代码示例
    - # 代币充值
    - # 道具直购
  - # 服务器相关
    - # uniCloud开发
    - # php、java等后端语言开发
      - 本页导读

微信规定上架短剧类目的小程序必须使用微信小程序虚拟支付，不可以使用原先的微信支付

如果服务端使用uniCloud ，那么官方提供了uniPay 云端统一支付服务，把App、微信小程序、支付宝小程序里的服务端支付开发进行了统一的封装。

前端统一的 uni.requestVirtualPayment 和云端统一的 uniPay 搭配，可以极大提升支付业务的开发效率，强烈推荐给开发者使用。uniPay 的文档另见：https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-app.html

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.requestVirtualPayment
```

Example 2 (javascript):
```javascript
// 仅作为示例，非真实参数信息。
uni.requestVirtualPayment({
	signData: {
		offerId: "", // 在米大师侧申请的应用 id, mp-支付基础配置中的offerid
		buyQuantity: 1, // 购买数量
		env: 0, // 环境配置, 0 米大师正式环境, 1 米大师沙箱环境, 默认为 0
		currencyType: "CNY", // 固定CNY
		outTradeNo: "test2024030101",
		attach: JSON.stringify({
			user_id: "001"
		})
	},
	mode: "short_series_coin",
	paySig: "支付签名",
	signature: '用户态签名',
	success: (res) => {
		console.log('success:' + JSON.stringify(res));
	},
	fail: (err) => {
		console.log('fail:' + JSON.stringify(err));
	},
	complete: (res) => {
		console.log('complete:' + JSON.stringify(res));
	}
});
```

Example 3 (javascript):
```javascript
// 仅作为示例，非真实参数信息。
uni.requestVirtualPayment({
	signData: {
		offerId: "", // 在米大师侧申请的应用 id, mp-支付基础配置中的offerid
		buyQuantity: 1, // 购买数量
		env: 0, // 环境配置, 0 米大师正式环境, 1 米大师沙箱环境, 默认为 0
		currencyType: "CNY", // 固定CNY
		outTradeNo: "test2024030101",
		attach: JSON.stringify({
			user_id: "001"
		})
	},
	mode: "short_series_coin",
	paySig: "支付签名",
	signature: '用户态签名',
	success: (res) => {
		console.log('success:' + JSON.stringify(res));
	},
	fail: (err) => {
		console.log('fail:' + JSON.stringify(err));
	},
	complete: (res) => {
		console.log('complete:' + JSON.stringify(res));
	}
});
```

Example 4 (javascript):
```javascript
// 仅作为示例，非真实参数信息。
uni.requestVirtualPayment({
	signData: {
		offerId: "", // 在米大师侧申请的应用 id, mp-支付基础配置中的offerid
		buyQuantity: 1, // 购买数量
		env: 0, // 环境配置, 0 米大师正式环境, 1 米大师沙箱环境, 默认为 0
		currencyType: "CNY", // 固定CNY
		outTradeNo: "test2024030101",
		attach: JSON.stringify({
			user_id: "001"
		})
	},
	mode: "short_series_coin",
	paySig: "支付签名",
	signature: '用户态签名',
	success: (res) => {
		console.log('success:' + JSON.stringify(res));
	},
	fail: (err) => {
		console.log('fail:' + JSON.stringify(err));
	},
	complete: (res) => {
		console.log('complete:' + JSON.stringify(res));
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/file

**Contents:**
- # uni.chooseFile(OBJECT)
  - # chooseFile 兼容性
- # wx.chooseMessageFile(OBJECT)
      - 本页导读

文件需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

本API主要用于选择非媒体文件，如果选择的文件是媒体文件，另有3个专用API：

注：文件的临时路径，在应用本次启动期间可以正常使用，如需持久保存，需在主动调用 uni.saveFile，在应用下次启动时才能访问得到。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
(HBuilder X2.9.9+)
```

Example 2 (unknown):
```unknown
(可使用wx.chooseMessageFile)
```

Example 3 (unknown):
```unknown
tempFilePaths
```

Example 4 (json):
```json
['.zip','.exe','.js']
```

---

## uni.setNavigationBarTitle(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/navigationbar

**Contents:**
- # uni.setNavigationBarTitle(OBJECT)
  - # setNavigationBarTitle 兼容性
- # uni.setNavigationBarColor(OBJECT)
  - # setNavigationBarColor 兼容性
- # uni.showNavigationBarLoading(OBJECT)
  - # showNavigationBarLoading 兼容性
- # uni.hideNavigationBarLoading(OBJECT)
  - # hideNavigationBarLoading 兼容性
- # uni.hideHomeButton(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

设置页面导航条颜色。如果需要进入页面就设置颜色，请延迟执行，防止被框架内设置颜色逻辑覆盖

animation.timingFunc 有效值

示例源码如下，请查看 pre > code 标签中的内容

App 平台（不包括 HarmonyOS Next）调用此 API 时会在屏幕中间悬浮显示 loading

示例源码如下，请查看 pre > code 标签中的内容

App 平台（不包括 HarmonyOS Next）调用此 API 时会关闭屏幕中间悬浮显示的 loading

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

Example 2 (javascript):
```javascript
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

Example 3 (javascript):
```javascript
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

Example 4 (css):
```css
uni.setNavigationBarTitle({
  title: "新的标题",
});
```

---

## uni.getFileSystemManager() @getfilesystemmanager | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/file/getFileSystemManager

**Contents:**
- # uni.getFileSystemManager()
  - # getFileSystemManager 兼容性
  - # 返回值
    - # FileSystemManager 的方法
    - # access(options: AccessOptions): void;
      - # access 兼容性
      - # 参数 HarmonyOS 兼容性
        - # FileSystemManagerFail 的属性值
    - # accessSync(path: string): void;
      - # accessSync 兼容性

accessSync FileSystemManager.access 的同步版本

appendFileSync FileSystemManager.appendFile 的同步版本

copyFileSync FileSystemManager.copyFile 的同步版本

isDirectory 判断当前文件是否一个目录

isFile 判断当前文件是否一个普通文件

fstatSync 同步获取文件的状态信息

ftruncate 对文件内容进行截断操作

ftruncateSync 同步对文件内容进行截断操作

getFileInfo 获取该本地临时文件 或 本地缓存文件 信息

getSavedFileList 获取该已保存的本地缓存文件列表

mkdirSync FileSystemManager.mkdir 的同步版本

openSync 同步打开文件，返回文件描述符

readFileSync FileSystemManager.readFile 的同步版本参数

readdirSync FileSystemManager.readdir 的同步版本

readZipEntry 读取压缩包内的文件

rmdirSync FileSystemManager.rmdir 的同步版本

rename 重命名文件。可以把文件从 oldPath 移动到 newPath

renameSync FileSystemManager.rename 的同步版本

removeSavedFile 删除该小程序下已保存的本地缓存文件

readCompressedFile 读取指定压缩类型的本地文件内容

readCompressedFileSync 同步读取指定压缩类型的本地文件内容

saveFile 保存临时文件到本地。此接口会移动临时文件，因此调用成功后，tempFilePath 将不可用。

saveFileSync FileSystemManager.saveFile 的同步版本。自 4.71 起，返回 unifile:// 协议的路径

statSync FileSystemManager.stat 的同步版本

truncateSync 对文件内容进行截断操作 (truncate 的同步版本)

unlinkSync FileSystemManager.unlink 的同步版本

writeFileSync FileSystemManager.writeFile 的同步版本

**Examples:**

Example 1 (yaml):
```yaml
unifile://cache/uni-store/
```

---

## uni.requestVirtualPayment(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/virtualPayment.html

**Contents:**
- # uni.requestVirtualPayment(OBJECT)
  - # 代码示例
    - # 代币充值
    - # 道具直购
  - # 服务器相关
    - # uniCloud开发
    - # php、java等后端语言开发
      - 本页导读

微信规定上架短剧类目的小程序必须使用微信小程序虚拟支付，不可以使用原先的微信支付

如果服务端使用uniCloud ，那么官方提供了uniPay 云端统一支付服务，把App、微信小程序、支付宝小程序里的服务端支付开发进行了统一的封装。

前端统一的 uni.requestVirtualPayment 和云端统一的 uniPay 搭配，可以极大提升支付业务的开发效率，强烈推荐给开发者使用。uniPay 的文档另见：https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-app.html

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.requestVirtualPayment
```

Example 2 (javascript):
```javascript
// 仅作为示例，非真实参数信息。
uni.requestVirtualPayment({
	signData: {
		offerId: "", // 在米大师侧申请的应用 id, mp-支付基础配置中的offerid
		buyQuantity: 1, // 购买数量
		env: 0, // 环境配置, 0 米大师正式环境, 1 米大师沙箱环境, 默认为 0
		currencyType: "CNY", // 固定CNY
		outTradeNo: "test2024030101",
		attach: JSON.stringify({
			user_id: "001"
		})
	},
	mode: "short_series_coin",
	paySig: "支付签名",
	signature: '用户态签名',
	success: (res) => {
		console.log('success:' + JSON.stringify(res));
	},
	fail: (err) => {
		console.log('fail:' + JSON.stringify(err));
	},
	complete: (res) => {
		console.log('complete:' + JSON.stringify(res));
	}
});
```

Example 3 (javascript):
```javascript
// 仅作为示例，非真实参数信息。
uni.requestVirtualPayment({
	signData: {
		offerId: "", // 在米大师侧申请的应用 id, mp-支付基础配置中的offerid
		buyQuantity: 1, // 购买数量
		env: 0, // 环境配置, 0 米大师正式环境, 1 米大师沙箱环境, 默认为 0
		currencyType: "CNY", // 固定CNY
		outTradeNo: "test2024030101",
		attach: JSON.stringify({
			user_id: "001"
		})
	},
	mode: "short_series_coin",
	paySig: "支付签名",
	signature: '用户态签名',
	success: (res) => {
		console.log('success:' + JSON.stringify(res));
	},
	fail: (err) => {
		console.log('fail:' + JSON.stringify(err));
	},
	complete: (res) => {
		console.log('complete:' + JSON.stringify(res));
	}
});
```

Example 4 (javascript):
```javascript
// 仅作为示例，非真实参数信息。
uni.requestVirtualPayment({
	signData: {
		offerId: "", // 在米大师侧申请的应用 id, mp-支付基础配置中的offerid
		buyQuantity: 1, // 购买数量
		env: 0, // 环境配置, 0 米大师正式环境, 1 米大师沙箱环境, 默认为 0
		currencyType: "CNY", // 固定CNY
		outTradeNo: "test2024030101",
		attach: JSON.stringify({
			user_id: "001"
		})
	},
	mode: "short_series_coin",
	paySig: "支付签名",
	signature: '用户态签名',
	success: (res) => {
		console.log('success:' + JSON.stringify(res));
	},
	fail: (err) => {
		console.log('fail:' + JSON.stringify(err));
	},
	complete: (res) => {
		console.log('complete:' + JSON.stringify(res));
	}
});
```

---

## uni.showToast(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/prompt.html

**Contents:**
- # uni.showToast(OBJECT)
  - # showToast 兼容性
- # uni.hideToast()
  - # hideToast 兼容性
- # uni.showLoading(OBJECT)
  - # showLoading 兼容性
- # uni.hideLoading()
  - # hideLoading 兼容性
- # uni.showModal(OBJECT)
  - # showModal 兼容性

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

显示 loading 提示框, 需主动调用 uni.hideLoading 才能关闭提示框。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

显示模态弹窗，可以只有一个确定按钮，也可以同时有确定和取消按钮。类似于一个API整合了 html 中：alert、confirm。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.showToast({
	title: '标题',
	duration: 2000
});
```

Example 2 (javascript):
```javascript
uni.showToast({
	title: '标题',
	duration: 2000
});
```

Example 3 (javascript):
```javascript
uni.showToast({
	title: '标题',
	duration: 2000
});
```

Example 4 (css):
```css
uni.showToast({
	title: '标题',
	duration: 2000
});
```

---

## uni.getExtConfig(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/get-extconfig.html

**Contents:**
- # uni.getExtConfig(OBJECT)
- # uni.getExtConfigSync()
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

uni.getExtConfig 的同步版本。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.canIUse
```

Example 2 (unknown):
```unknown
uni.getExtConfig
```

Example 3 (javascript):
```javascript
if (uni.getExtConfig) {
  uni.getExtConfig({
    success(res) {
      console.log(res.extConfig)
    }
  })
}
```

Example 4 (javascript):
```javascript
if (uni.getExtConfig) {
  uni.getExtConfig({
    success(res) {
      console.log(res.extConfig)
    }
  })
}
```

---

## uni.makePhoneCall(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/phone.html

**Contents:**
- # uni.makePhoneCall(OBJECT)
  - # makePhoneCall 兼容性
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

Example 2 (javascript):
```javascript
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

Example 3 (javascript):
```javascript
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

Example 4 (css):
```css
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

---

## uni.navigateToMiniProgram(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/open-miniprogram

**Contents:**
- # uni.navigateToMiniProgram(OBJECT)
- # uni.navigateBackMiniProgram(OBJECT)
- # uni.openEmbeddedMiniProgram(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

跳转回上一个小程序，只有当另一个小程序跳转到当前小程序时才会能调用成功。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序跳转小程序（半屏模式）（从微信础库 2.20.1 开始支持）

当小程序需要打开另一个小程序让用户进行快捷操作时，可将要打开的小程序以半屏的形态跳转。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

2022年3月18日后，使用过程有以下限制，若不符合以下所有条件将被自动切换为普通的小程序跳转小程序，不影响用户使用：

2022年3月18日前，使用过程有以下限制，若不符合以下所有条件将被自动切换为普通的小程序跳转小程序，不影响用户使用：

**Examples:**

Example 1 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

Example 2 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

Example 3 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

Example 4 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/window/communication

**Contents:**
- # uni.$emit(eventName,OBJECT)
  - # $emit 兼容性
- # uni.$on(eventName,callback)
  - # $on 兼容性
- # uni.$once(eventName,callback)
  - # $once 兼容性
- # uni.$off(eventName, callback)
  - # $off 兼容性
      - 本页导读

自 HBuilderX 2.0.0 起支持，使用指南

触发全局的自定义事件，附加参数都会传给监听器回调函数。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件，事件由 uni.$emit 触发，回调函数会接收事件触发函数的传入参数。

示例源码如下，请查看 pre > code 标签中的内容

监听全局的自定义事件，事件由 uni.$emit 触发，但仅触发一次，在第一次触发之后移除该监听器。

示例源码如下，请查看 pre > code 标签中的内容

$emit、$on、$off常用于跨页面、跨组件通讯，这里为了方便演示放在同一个页面

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.$emit('update',{msg:'页面更新'})
```

Example 2 (javascript):
```javascript
uni.$emit('update',{msg:'页面更新'})
```

Example 3 (javascript):
```javascript
uni.$emit('update',{msg:'页面更新'})
```

Example 4 (css):
```css
uni.$emit('update',{msg:'页面更新'})
```

---

## uni.chooseAddress(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/choose-address.html

**Contents:**
- # uni.chooseAddress(OBJECT)
      - 本页导读

获取用户收货地址。调起用户编辑收货地址原生界面，并在编辑完成后返回用户选择的地址，需要用户授权 scope.address。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

Example 2 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

Example 3 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

Example 4 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

---

## uni.openLocation(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/open-location

**Contents:**
- # uni.openLocation(OBJECT)
  - # openLocation 兼容性
- # 三方定位和地图服务收费说明
      - 本页导读

使用应用内置地图查看位置。openLocation会使用项目配置的地图服务商来展示地图，地图服务商支持情况参考：map组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

**Examples:**

Example 1 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

Example 2 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

Example 3 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

Example 4 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/native-plugin.html

**Contents:**
  - # uni.requireNativePlugin(PluginName)
  - # 内置原生插件
  - # 本地插件(非内置原生插件)
      - # 第一步：获取本地原生插件
      - # 第二步：配置本地原生插件
      - # 第三步：开发调试本地原生插件
      - # 第四步：打包发布
  - # 云端插件(非内置原生插件)
      - # 第一步：购买或下载uni-app原生插件
      - # 第二步：使用自定义基座打包uni原生插件 （注：请使用真机运行自定义基座）

uni-app在App侧的原生扩展插件，支持使用java、object-c等原生语言编写。

从HBuilderX 3.6起，新增支持了使用uts来开发原生插件。文档另见uts插件

为了和uts插件区别，之前的App原生插件，改名为App原生语言插件。

自 HBuilderX 1.4 版本起，uni-app 支持引入原生插件，使用方式如下：

示例源码如下，请查看 pre > code 标签中的内容

不管是vue文件还是nvue文件，都是这个API。

内置原生插件,uni-app已默认集成，支持直接在内置基座运行。

仅在nvue页面，支持引入BindingX，animation， DOM.addRule等。

在vue页面，支持引入clipboard，storage，stream，deviceInfo等。

使用方式：可通过uni.requireNativePlugin直接使用。

示例源码如下，请查看 pre > code 标签中的内容

非内置原生插件，分为 本地插件 和 云端插件 。集成原生插件后，需要提交云端打包或制作自定义基座运行才会生效。

本地插件，是uni-app项目nativeplugins目录(目录不存在则创建)下的原生插件。

可以登录uni原生插件市场 ，在免费的插件详情页中点击“下载for离线打包”下载原生插件（zip格式），解压到HBuilderX的uni-app项目下的“nativeplugins”目录（如不存在则创建），以下是“DCloud-RichAlert”插件举例，它的下载地址是：https://ext.dcloud.net.cn/plugin?id=36

原生插件开发完成后按指定格式压缩为zip包，参考uni-app原生插件格式说明文档 。 按上图的格式配置到uni-app项目下的“nativeplugins”目录。

在manifest.json -> App原生插件配置 -> 选择本地插件 -> 选择需要打包生效的插件 -> 保存后提交云端打包生效。

在vue页面或nvue页面引入这个原生插件。

使用uni.requireNativePlugin的api，参数为插件的id。

示例源码如下，请查看 pre > code 标签中的内容

使用自定义基座开发调试本地原生插件后，不可直接将自定义基座apk作为正式版发布。 应该重新提交云端打包（不能勾选“自定义基座”）生成正式版本。

云端插件，已经在插件市场绑定或购买的插件，无需下载插件到工程中，云打包时会直接合并打包原生插件到APP中。（试用插件只能在自定义基座中使用）

使用前需先登录uni原生插件市场 ，在插件详情页中购买，免费插件也可以在插件市场0元购。购买后才能够云端打包使用插件。

购买插件时请选择正确的appid，以及绑定正确包名

在manifest.json -> App原生插件配置 -> 选择云端插件 -> 选择需要打包的插件 -> 保存后提交云端打包生效。

在vue页面或nvue页面引入这个原生插件。

使用uni.requireNativePlugin的api，参数为插件的id。

1.在页面引入原生插件，uni.requireNativePlugin 使用后返回一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用自定义基座开发调试uni-app原生插件后，不可直接将自定义基座apk作为正式版发布。 应该重新提交云端打包（不能勾选“自定义基座”）生成正式版本。

1.可以在 插件市场 查看更多插件，如需开发uni原生插件请参考 uni原生插件开发文档 。 2.如果插件需要传递文件路径，则需要传手机文件的绝对路径，可使用 5+ IO模块 的相关 API 得到文件的绝对路径。

**Examples:**

Example 1 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 2 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 3 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 4 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

---

## 全屏视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-fullscreen-video.html

**Contents:**
  - # 全屏视频广告
  - # 组件语法
    - # 组件API调用示例
  - # API语法
    - # 方法
      - 本页导读

全屏视频广告是一个原生组件，层级比普通组件高。全屏视频广告每次创建都会返回一个全新的实例，默认是隐藏的，需要调用 FullScreenVideoAd.show() 将其显示。

如何开通参考激励视频广告 https://uniapp.dcloud.net.cn/api/a-d/rewarded-video

<ad-fullscreen-video adpid=""></ad-fullscreen-video>

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

除了使用组件的点击外，也可以使用API来启动全屏视频。

比如自定义一个点击位置，然后调用<ad-fullscreen-video>组件的方法来播放全屏视频。如下：

示例源码如下，请查看 pre > code 标签中的内容

uni.createFullScreenVideoAd(options)

options 为 object 类型，属性如下：

Promise FullScreenVideoAd.load()

Promise FullScreenVideoAd.show()

FullScreenVideoAd.destroy()

FullScreenVideoAd.onLoad(function callback)

FullScreenVideoAd.onError(function callback)

FullScreenVideoAd.onClose(function callback)

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
<ad-fullscreen-video adpid=""></ad-fullscreen-video>
```

Example 2 (html):
```html
<template>
  <view>
    <ad-fullscreen-video adpid="1507000611" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-fullscreen-video>
  </view>
</template>
```

Example 3 (html):
```html
<template>
  <view>
    <ad-fullscreen-video adpid="1507000611" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-fullscreen-video>
  </view>
</template>
```

Example 4 (html):
```html
<template>
  <view>
    <ad-fullscreen-video adpid="1507000611" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-fullscreen-video>
  </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-for-harmony.html

**Contents:**
- # uts for HarmonyOS
- # 了解 UTS 插件是什么
- # 掌握UTS语法及ArkTS语法
- # HarmonyOS 原生环境配置
- # ArkTS 与 UTS 差异重点介绍 (持续更新)
  - # 类型差异
    - # any类型
    - # 对象字面量
- # 配置uts插件依赖
- # 使用resources

鸿蒙系统有很多原生API，这些API通过ArkTS来调用。

由于uts可以编译为ArkTS，所以uts可以调用鸿蒙的所有原生API。

如需在uni-app中使用，就需要把鸿蒙的原生API封装为uts插件，然后在uni-app中使用。

这些uts插件，是同时兼容uni-app和uni-app x的。

uni-app的普通页面代码是编译为js，js无法直接调用鸿蒙原生API。而uts插件是编译为ets文件，所以可以调用鸿蒙原生API。（ArkTS的文件后缀为.ets）

uni-app x的页面和uts插件，都运行在ArkTS引擎下，不管在普通页面还是在uts插件中均可调用鸿蒙原生API。但普通页面目前会编译js文件，运行在arkts引擎下的js不能调用@kit的库，不能使用多线程能力。完善的ets能力，需要在uts插件中才能使用。

UTS 插件是 uni-app 扩展API的标准插件形式 详情

uts插件在编译到harmonyOS端时会被编译成ArkTS代码。因此编写代码时应注意遵循 uts规范 和 ets规范。

无论是uts还是ArkTS都是在ts的语法基础上进行扩展来的。建议先阅读如下文档

ArkTS内不能使用any类型，但是uts内any用处比较多，因此在编译为ArkTS时，any类型被转为了Object类型。

ArkTS不允许无类型的对象字面量，编写代码时应注意在需要类型时为对象字面量指定类型。如未指定类型，uts会将此对象字面量编译成as UTSJSONObject的形式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

鸿蒙的库管理工具是ohpm。类似于js的npm，Android的仓储。

鸿蒙的三方sdk封装文件为.har，类似于Android的.aar

uts插件的utssdk/app-harmony/config.json文件内可以配置依赖使用鸿蒙的三方库，配置方式如下：

示例源码如下，请查看 pre > code 标签中的内容

uts 插件内包含了一个resources目录，用于存放插件的资源文件，如图片、字体等，关于resources的更多信息请参考：鸿蒙资源分类与访问 。此目录位于utssdk/app-harmony/resources。

开发者可以在uts插件内配置module.json5文件，用于配置插件的一些信息，如模块名、支持的设备类型、请求的权限等。module.json5内配置权限请参考鸿蒙官方文档：声明权限

示例源码如下，请查看 pre > code 标签中的内容

对于一个名称为 uni-getBatteryInfo 的 uni_module，它的 moduleName 为uni_modules__uni_getbatteryinfo，packageName 为@uni_modules/uni-getbatteryinfo。

packageName（引用模块名）规则较为简单，给 uni_module 名称前加上@uni_modules前缀然后转为全小写。

moduleName（鸿蒙模块名）是在 packageName 的基础上生成的，移除@符号，将/替换为两个下划线，将-替换为一个下划线

uts插件编译到鸿蒙时会将整个插件编译为一个鸿蒙的module。如下文件会拷贝到鸿蒙module内的对应位置。其中module.json5文件可以配置依赖的权限等信息。

示例源码如下，请查看 pre > code 标签中的内容

uts插件内的ets文件会原样拷贝到产物内，如果需要开发arkui声明式界面可以在ets文件内编写，uts文件内引用。用法可参考文档：uts插件-实现NativeButton对象

getContext 该接口从API version 9开始支持，从API version 18开始废弃，建议使用UIContext中的getHostContext替代。

很多harmonyOS原生接口需要传入context作为参数。多数情况下可以直接调用harmonyOS全局方法getContext()获取。例如：

示例源码如下，请查看 pre > code 标签中的内容

在uniapp中适配鸿蒙的修改，可以使用如下的方式：

示例源码如下，请查看 pre > code 标签中的内容

在一些插件中，需要配置 overrides ，但是鸿蒙工程中，配置 overrides 只能在 根目录下的 oh-package 中生效，而 UTS 插件，打包之后由配置 config,json 之后的依赖是非根目录下的，因此不会生效

因此需要修改 harmony-configs/oh-package （oh-package 源文件可以在 unpackage/dist/dev/app-harmony 中找到源文件，把这个文件复制到harmony-configs 中）,在这个文件中，配置 overrides 才能够生效

**Examples:**

Example 1 (typescript):
```typescript
as UTSJSONObject
```

Example 2 (typescript):
```typescript
// 源码
const obj = {
  a: 1
}

// 编译结果
const obj = {
  a: 1
} as UTSJSONObject
```

Example 3 (typescript):
```typescript
// 源码
const obj = {
  a: 1
}

// 编译结果
const obj = {
  a: 1
} as UTSJSONObject
```

Example 4 (typescript):
```typescript
// 源码
const obj = {
  a: 1
}

// 编译结果
const obj = {
  a: 1
} as UTSJSONObject
```

---

## uni.saveFile(OBJECT) @savefile | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/file/file.html

**Contents:**
- # uni.saveFile(OBJECT)
  - # saveFile 兼容性
- # uni.getSavedFileList(OBJECT)
  - # getSavedFileList 兼容性
- # uni.getSavedFileInfo(OBJECT)
  - # getSavedFileInfo 兼容性
- # uni.removeSavedFile(OBJECT)
  - # removeSavedFile 兼容性
- # uni.getFileInfo(OBJECT)
  - # getFileInfo 兼容性

注意：saveFile 会把临时文件移动，因此调用成功后传入的 tempFilePath 将不可用

微信小程序已停止维护wx.saveFile(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序已停止维护wx.getSavedFileList(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

获取本地文件的文件信息。此接口只能用于获取已保存到本地的文件。

微信小程序已停止维护wx.getSavedFileInfo(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序已停止维护wx.removeSavedFile(Object object) 接口，建议使用FileSystemManager 对象中的方法。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序已停止维护wx.getFileInfo(Object object) 接口，建议使用FileSystemManager 对象中的方法。

新开页面打开文档，支持格式：doc, xls, ppt, pdf, docx, xlsx, pptx。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

Example 2 (javascript):
```javascript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

Example 3 (javascript):
```javascript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

Example 4 (gdscript):
```gdscript
uni.chooseImage({
  success: function (res) {
    var tempFilePaths = res.tempFilePaths;
    uni.saveFile({
      tempFilePath: tempFilePaths[0],
      success: function (res) {
        var savedFilePath = res.savedFilePath;
      }
    });
  }
});
```

---

## uni.getLocation(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/location.html

**Contents:**
- # uni.getLocation(OBJECT)
  - # getLocation 兼容性
  - # 鸿蒙位置设置指南
- # uni.chooseLocation(OBJECT)
  - # chooseLocation 兼容性
- # 三方定位和地图服务收费说明
- # unicloud-city-select 城市选择组件
      - 本页导读

Web平台本API之前调用了腾讯地图的gcj02坐标免费转换接口，该接口从2024年7月18日起被腾讯逐步下线，导致老版本中本API无法使用。请立即升级到 uni-app 4.24版。

如果运行在微信浏览器中，可以使用微信的jssdk的定位能力。这个是微信向腾讯地图申请的key，开发者无需配置自己的key。

地图厂商的商业授权较贵，如需购买，请点击获取优惠 。

示例源码如下，请查看 pre > code 标签中的内容

这里介绍鸿蒙位置权限如何配置。将鸿蒙应用正常运行启动。在 HBuilderX 工程中找到

编辑 module.json5，在 requestPermissions 中添加下面代码

示例源码如下，请查看 pre > code 标签中的内容

这里的定位和模糊定位务必同时存在，否则会被上架驳回。在 api 可在 isHighAccuracy 属性中切换。

这里的 reason 值为 $string: 开头，不可直接中文字符，需要使用资源引用。编辑刚才复制的 harmony-config 目录中的 string.json，添加下面代码并改写 value。

示例源码如下，请查看 pre > code 标签中的内容

这里使用也可以放入 zh_CN 目录中，zh_CN > base 目录，细节可参考《鸿蒙 资源分类与访问 》

打开地图选择位置。chooseLocation会使用项目配置的地图服务商来展示地图，地图服务商支持情况参考：map组件。

Web平台和App平台，本API之前调用了腾讯地图的gcj02坐标免费，该接口从2024年7月18日起被腾讯逐步下线，导致老版本中本API无法使用。请立即升级到 uni-app 4.24版。

地图厂商的商业授权较贵，如需购买，请点击获取优惠 。

出于安全考虑，安卓、iOS端manifest.json内配置的 腾讯位置服务 Key 仅用来展示地图，uni.chooseLocation所依赖的地点搜索、逆地址解析功能需要通过uniCloud云对象uni-map-co 来调用，开发者可以通过安全网络来保障服务端api不被他人盗用。

鸿蒙平台由于暂不支持安全网络，所以chooseLocation依然使用manifest.json内配置的key来调用地点搜索、逆地址解析。

默认情况下，uni.chooseLocation不会使用安全网络请求uni-map-co。如果需要使用安全网络请求uni-map-co，需按如下步骤操作：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

若想要实现城市选择功能，可以使用 unicloud-city-select 城市选择组件。

下载地址：https://ext.dcloud.net.cn/plugin?name=unicloud-city-select

文档地址：https://doc.dcloud.net.cn/uniCloud/unicloud-city-select.html

**Examples:**

Example 1 (unknown):
```unknown
uni-app 4.24版
```

Example 2 (unknown):
```unknown
uni.openLocation
```

Example 3 (javascript):
```javascript
uni.getLocation({
	type: 'wgs84',
	success: function (res) {
		console.log('当前位置的经度：' + res.longitude);
		console.log('当前位置的纬度：' + res.latitude);
	}
});
```

Example 4 (javascript):
```javascript
uni.getLocation({
	type: 'wgs84',
	success: function (res) {
		console.log('当前位置的经度：' + res.longitude);
		console.log('当前位置的纬度：' + res.latitude);
	}
});
```

---

## 短视频内容联盟广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/a-d/content-page

**Contents:**
  - # 短视频内容联盟广告
      - 本页导读

⼀个视频内容频道，支持上下滑动切换视频内容

内容联盟广告是一个原生全屏组件，大小不可控制

如果需要嵌入到页面控制大小请使用 短视频内容联盟组件

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/native-plugin

**Contents:**
  - # uni.requireNativePlugin(PluginName)
  - # 内置原生插件
  - # 本地插件(非内置原生插件)
      - # 第一步：获取本地原生插件
      - # 第二步：配置本地原生插件
      - # 第三步：开发调试本地原生插件
      - # 第四步：打包发布
  - # 云端插件(非内置原生插件)
      - # 第一步：购买或下载uni-app原生插件
      - # 第二步：使用自定义基座打包uni原生插件 （注：请使用真机运行自定义基座）

uni-app在App侧的原生扩展插件，支持使用java、object-c等原生语言编写。

从HBuilderX 3.6起，新增支持了使用uts来开发原生插件。文档另见uts插件

为了和uts插件区别，之前的App原生插件，改名为App原生语言插件。

自 HBuilderX 1.4 版本起，uni-app 支持引入原生插件，使用方式如下：

示例源码如下，请查看 pre > code 标签中的内容

不管是vue文件还是nvue文件，都是这个API。

内置原生插件,uni-app已默认集成，支持直接在内置基座运行。

仅在nvue页面，支持引入BindingX，animation， DOM.addRule等。

在vue页面，支持引入clipboard，storage，stream，deviceInfo等。

使用方式：可通过uni.requireNativePlugin直接使用。

示例源码如下，请查看 pre > code 标签中的内容

非内置原生插件，分为 本地插件 和 云端插件 。集成原生插件后，需要提交云端打包或制作自定义基座运行才会生效。

本地插件，是uni-app项目nativeplugins目录(目录不存在则创建)下的原生插件。

可以登录uni原生插件市场 ，在免费的插件详情页中点击“下载for离线打包”下载原生插件（zip格式），解压到HBuilderX的uni-app项目下的“nativeplugins”目录（如不存在则创建），以下是“DCloud-RichAlert”插件举例，它的下载地址是：https://ext.dcloud.net.cn/plugin?id=36

原生插件开发完成后按指定格式压缩为zip包，参考uni-app原生插件格式说明文档 。 按上图的格式配置到uni-app项目下的“nativeplugins”目录。

在manifest.json -> App原生插件配置 -> 选择本地插件 -> 选择需要打包生效的插件 -> 保存后提交云端打包生效。

在vue页面或nvue页面引入这个原生插件。

使用uni.requireNativePlugin的api，参数为插件的id。

示例源码如下，请查看 pre > code 标签中的内容

使用自定义基座开发调试本地原生插件后，不可直接将自定义基座apk作为正式版发布。 应该重新提交云端打包（不能勾选“自定义基座”）生成正式版本。

云端插件，已经在插件市场绑定或购买的插件，无需下载插件到工程中，云打包时会直接合并打包原生插件到APP中。（试用插件只能在自定义基座中使用）

使用前需先登录uni原生插件市场 ，在插件详情页中购买，免费插件也可以在插件市场0元购。购买后才能够云端打包使用插件。

购买插件时请选择正确的appid，以及绑定正确包名

在manifest.json -> App原生插件配置 -> 选择云端插件 -> 选择需要打包的插件 -> 保存后提交云端打包生效。

在vue页面或nvue页面引入这个原生插件。

使用uni.requireNativePlugin的api，参数为插件的id。

1.在页面引入原生插件，uni.requireNativePlugin 使用后返回一个对象：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用自定义基座开发调试uni-app原生插件后，不可直接将自定义基座apk作为正式版发布。 应该重新提交云端打包（不能勾选“自定义基座”）生成正式版本。

1.可以在 插件市场 查看更多插件，如需开发uni原生插件请参考 uni原生插件开发文档 。 2.如果插件需要传递文件路径，则需要传手机文件的绝对路径，可使用 5+ IO模块 的相关 API 得到文件的绝对路径。

**Examples:**

Example 1 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 2 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 3 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

Example 4 (javascript):
```javascript
const PluginName = uni.requireNativePlugin(PluginName); // PluginName 为原生插件名称
```

---

## uni.getAppAuthorizeSetting() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/getappauthorizesetting.html

**Contents:**
- # uni.getAppAuthorizeSetting()
  - # getAppAuthorizeSetting 兼容性
  - # 返回值
  - # 不推荐使用的返回参数，仅为兼容保留
      - 本页导读

App 端需要获取更多权限状态可参考插件: App权限判断和提示

|locationReducedAccuracy|boolean|模糊定位。true 表示模糊定位，false 表示精确定位 |App 端仅 iOS 支持|

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
"unsupported"
```

Example 2 (unknown):
```unknown
'authorized'
```

Example 3 (unknown):
```unknown
'not determined'
```

Example 4 (unknown):
```unknown
'config error'
```

---

## uni.onAccelerometerChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/accelerometer.html

**Contents:**
- # uni.onAccelerometerChange(CALLBACK)
  - # onAccelerometerChange 兼容性
- # uni.offAccelerometerChange(CALLBACK)
  - # offAccelerometerChange 兼容性
- # uni.startAccelerometer(OBJECT)
  - # startAccelerometer 兼容性
- # uni.stopAccelerometer(OBJECT)
  - # stopAccelerometer 兼容性
      - 本页导读

监听加速度数据，频率：5次/秒，接口调用后会自动开始监听，可使用 uni.offAccelerometer 取消监听。

示例源码如下，请查看 pre > code 标签中的内容

onAccelerometerChange 传入的监听函数。不传此参数则移除所有监听函数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.offAccelerometer
```

Example 2 (javascript):
```javascript
uni.onAccelerometerChange(function (res) {
	console.log(res.x);
	console.log(res.y);
	console.log(res.z);
});
```

Example 3 (javascript):
```javascript
uni.onAccelerometerChange(function (res) {
	console.log(res.x);
	console.log(res.y);
	console.log(res.z);
});
```

Example 4 (javascript):
```javascript
uni.onAccelerometerChange(function (res) {
	console.log(res.x);
	console.log(res.y);
	console.log(res.z);
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/bluetooth.html

**Contents:**
- # uni.openBluetoothAdapter(OBJECT)
  - # 错误
- # uni.startBluetoothDevicesDiscovery(OBJECT)
  - # 错误
- # uni.onBluetoothDeviceFound(CALLBACK)
- # uni.stopBluetoothDevicesDiscovery(OBJECT)
  - # 错误
- # uni.onBluetoothAdapterStateChange(CALLBACK)
- # uni.getConnectedBluetoothDevices(OBJECT)
  - # 错误

示例源码如下，请查看 pre > code 标签中的内容

开始搜寻附近的蓝牙外围设备。此操作比较耗费系统资源，请在搜索并连接到设备后调用 uni.stopBluetoothDevicesDiscovery 方法停止搜索。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

停止搜寻附近的蓝牙外围设备。若已经找到需要的蓝牙设备并不需要继续搜索时，建议调用该接口停止蓝牙搜索。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

根据 uuid 获取处于已连接状态的设备。

示例源码如下，请查看 pre > code 标签中的内容

获取在蓝牙模块生效期间所有已发现的蓝牙设备。包括已经和本机处于连接状态的设备。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

关闭蓝牙模块。调用该方法将断开所有已建立的连接并释放系统资源。建议在使用蓝牙流程后，与 uni.openBluetoothAdapter 成对调用。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.openBluetoothAdapter
```

Example 2 (unknown):
```unknown
uni.openBluetoothAdapter
```

Example 3 (unknown):
```unknown
uni.onBluetoothAdapterStateChange
```

Example 4 (javascript):
```javascript
uni.openBluetoothAdapter({
  success(res) {
    console.log(res)
  }
})
```

---

## uni.makePhoneCall(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/phone

**Contents:**
- # uni.makePhoneCall(OBJECT)
  - # makePhoneCall 兼容性
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

Example 2 (javascript):
```javascript
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

Example 3 (javascript):
```javascript
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

Example 4 (css):
```css
uni.makePhoneCall({
	phoneNumber: '114' //仅为示例
});
```

---

## uni.request(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/request

**Contents:**
- # uni.request(OBJECT)
  - # request 兼容性
  - # 返回值
    - # RequestTask 的方法
    - # abort(): void
      - # abort 兼容性
    - # onChunkReceived(listener: RequestTaskOnChunkReceivedCallback): number
      - # onChunkReceived 兼容性
      - # 参数 HarmonyOS 兼容性
      - # RequestTaskOnChunkReceivedListenerResult 的属性值

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。

注意：method有效值必须大写，每个平台支持的method有效值不同，详细见下表。

onChunkReceived 监听 Transfer-Encoding Chunk Received 事件。

offChunkReceived 移除 Transfer-Encoding Chunk Received 事件的监听函数。

onHeadersReceived 监听 HTTP Response Header 事件。

offHeadersReceived 移除 HTTP Response Header 事件的监听函数。

最终发送给服务器的数据是 String 类型，如果传入的 data 不是 String 类型，会被转换成 String。转换规则如下：

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 requestTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

通过 requestTask，可中断请求任务。

示例源码如下，请查看 pre > code 标签中的内容

certificate 参数说明 证书配置项

证书支持两种格式，文件格式和 Base64字符串格式

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
Array.<string>
```

Example 2 (json):
```json
{ name: 'name', age: 18 }
```

Example 3 (unknown):
```unknown
name=name&age=18
```

Example 4 (unknown):
```unknown
header['content-type']
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/clipboard.html

**Contents:**
- # uni.setClipboardData(OBJECT)
  - # setClipboardData 兼容性
- # uni.getClipboardData(OBJECT)
  - # getClipboardData 兼容性
  - # 注意
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.setClipboardData({
	data: 'hello',
	success: function () {
		console.log('success');
	}
});
```

---

## 生物认证说明 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/authentication

**Contents:**
- # 生物认证说明
- # uni.startSoterAuthentication(OBJECT)
  - # startSoterAuthentication 兼容性
- # uni.checkIsSupportSoterAuthentication(OBJECT)
  - # checkIsSupportSoterAuthentication 兼容性
- # uni.checkIsSoterEnrolledInDevice(OBJECT)
  - # checkIsSoterEnrolledInDevice 兼容性
  - # 代码示例
  - # 注意事项
      - 本页导读

生物认证，包含手机的指纹识别、faceid两部分。即通过人体身体特征来进行身份认证识别。

如需要专业的活体检测、人脸识别、金融级实人认证，需另见文档uni实人认证

OBJECT.requestAuthModes说明

此数据为设备TEE中，将传入的challenge和TEE内其他安全信息组成的数据进行组装而来的JSON，对下述字段的解释如下表。例子如下：

OBJECT.checkAuthMode合法值

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS Next
```

Example 2 (unknown):
```unknown
ohos.permission.ACCESS_BIOMETRIC
```

Example 3 (unknown):
```unknown
HarmonyOS Next
```

Example 4 (unknown):
```unknown
ohos.permission.ACCESS_BIOMETRIC
```

---

## uni.createOffscreenCanvas() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/createOffscreenCanvas.html

**Contents:**
- # uni.createOffscreenCanvas()
      - 本页导读

---

## uni.arrayBufferToBase64(arrayBuffer) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/arrayBufferToBase64.html

**Contents:**
- # uni.arrayBufferToBase64(arrayBuffer)
  - # arrayBufferToBase64 兼容性
      - 本页导读

将 ArrayBuffer 对象转成 Base64 字符串

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

Example 2 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

Example 3 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

Example 4 (javascript):
```javascript
const arrayBuffer = new Uint8Array([55, 55, 55])
const base64 = uni.arrayBufferToBase64(arrayBuffer)
```

---

## CanvasGradient.addColorStop(stop,color) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/CanvasGradient

**Contents:**
- # CanvasGradient.addColorStop(stop,color)
  - # 参数
      - 本页导读

小于最小 stop 的部分会按最小 stop 的 color 来渲染，大于最大 stop 的部分会按最大 stop 的 color 来渲染。

需要使用 addColorStop() 来指定渐变点，至少要两个。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
addColorStop()
```

Example 2 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Create circular gradient
const grd = ctx.createLinearGradient(30, 10, 120, 10)
grd.addColorStop(0, 'red')
grd.addColorStop(0.16, 'orange')
grd.addColorStop(0.33, 'yellow')
grd.addColorStop(0.5, 'green')
grd.addColorStop(0.66, 'cyan')
grd.addColorStop(0.83, 'blue')
grd.addColorStop(1, 'purple')

// Fill with gradient
ctx.setFillStyle(grd)
ctx.fillRect(10, 10, 150, 80)
ctx.draw()
```

Example 3 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Create circular gradient
const grd = ctx.createLinearGradient(30, 10, 120, 10)
grd.addColorStop(0, 'red')
grd.addColorStop(0.16, 'orange')
grd.addColorStop(0.33, 'yellow')
grd.addColorStop(0.5, 'green')
grd.addColorStop(0.66, 'cyan')
grd.addColorStop(0.83, 'blue')
grd.addColorStop(1, 'purple')

// Fill with gradient
ctx.setFillStyle(grd)
ctx.fillRect(10, 10, 150, 80)
ctx.draw()
```

Example 4 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Create circular gradient
const grd = ctx.createLinearGradient(30, 10, 120, 10)
grd.addColorStop(0, 'red')
grd.addColorStop(0.16, 'orange')
grd.addColorStop(0.33, 'yellow')
grd.addColorStop(0.5, 'green')
grd.addColorStop(0.66, 'cyan')
grd.addColorStop(0.83, 'blue')
grd.addColorStop(1, 'purple')

// Fill with gradient
ctx.setFillStyle(grd)
ctx.fillRect(10, 10, 150, 80)
ctx.draw()
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uts/buildin-object-api/array.html

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

## mDNS 服务 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/mDNS.html

**Contents:**
    - # mDNS 服务
      - 本页导读

---

## uni.getAppBaseInfo() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/getAppBaseInfo.html

**Contents:**
- # uni.getAppBaseInfo()
  - # getAppBaseInfo 兼容性
  - # 返回值
      - 本页导读

**Examples:**

Example 1 (unknown):
```unknown
manifest.json
```

Example 2 (unknown):
```unknown
manifest.json
```

Example 3 (unknown):
```unknown
manifest.json
```

Example 4 (unknown):
```unknown
manifest.json
```

---

## uni.uploadFile(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/network-file.html

**Contents:**
- # uni.uploadFile(OBJECT)
  - # uploadFile 兼容性
  - # 返回值
    - # UploadTask 的方法
    - # abort(): void,
      - # abort 兼容性
    - # onProgressUpdate(callback: UploadFileProgressUpdateCallback): void,
      - # onProgressUpdate 兼容性
      - # 参数 HarmonyOS 兼容性
      - # OnProgressUpdateResult 的属性值

将本地资源上传到开发者服务器，客户端发起一个 POST 请求，其中 content-type 为 multipart/form-data。 如页面通过 uni.chooseImage 等接口获取到一个本地资源的临时文件路径后，可通过此接口将本地资源上传到指定服务器。另外选择和上传非图像、视频文件参考：https://ask.dcloud.net.cn/article/35547 。

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。

推荐开发者上传到uniCloud，uniCloud提供了免费CDN和更好的易用性，包括安全的cdn直传。

files 参数是一个 file 对象的数组，file 对象的结构如下：

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 uploadTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

通过 uploadTask，可监听上传进度变化事件，以及取消上传任务。

onProgressUpdate 返回参数说明

onProgressUpdate 监听上传进度变化。

示例源码如下，请查看 pre > code 标签中的内容

下载文件资源到本地，客户端直接发起一个 HTTP GET 请求，返回文件的本地临时路径。

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。在h5上是跨域的，用户需要处理好跨域问题。

注：文件的临时路径，在应用本次启动期间可以正常使用，如需持久保存，需在主动调用 uni.saveFile，才能在应用下次启动时访问得到。

onProgressUpdate 监听下载进度变化。

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 downloadTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

通过 downloadTask，可监听下载进度变化事件，以及取消下载任务。

onProgressUpdate 返回参数说明

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
content-type
```

Example 2 (unknown):
```unknown
multipart/form-data
```

Example 3 (unknown):
```unknown
manifest.json
```

Example 4 (javascript):
```javascript
uni.chooseImage({
	success: (chooseImageRes) => {
		const tempFilePaths = chooseImageRes.tempFilePaths;
		uni.uploadFile({
			url: 'https://www.example.com/upload', //仅为示例，非真实的接口地址
			filePath: tempFilePaths[0],
			name: 'file',
			formData: {
				'user': 'test'
			},
			success: (uploadFileRes) => {
				console.log(uploadFileRes.data);
			}
		});
	}
});
```

---

## uni.request(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/request/request.html

**Contents:**
- # uni.request(OBJECT)
  - # request 兼容性
  - # 返回值
    - # RequestTask 的方法
    - # abort(): void
      - # abort 兼容性
    - # onChunkReceived(listener: RequestTaskOnChunkReceivedCallback): number
      - # onChunkReceived 兼容性
      - # 参数 HarmonyOS 兼容性
      - # RequestTaskOnChunkReceivedListenerResult 的属性值

在各个小程序平台运行时，网络相关的 API 在使用前需要配置域名白名单。

注意：method有效值必须大写，每个平台支持的method有效值不同，详细见下表。

onChunkReceived 监听 Transfer-Encoding Chunk Received 事件。

offChunkReceived 移除 Transfer-Encoding Chunk Received 事件的监听函数。

onHeadersReceived 监听 HTTP Response Header 事件。

offHeadersReceived 移除 HTTP Response Header 事件的监听函数。

最终发送给服务器的数据是 String 类型，如果传入的 data 不是 String 类型，会被转换成 String。转换规则如下：

示例源码如下，请查看 pre > code 标签中的内容

如果希望返回一个 requestTask 对象，需要至少传入 success / fail / complete 参数中的一个。例如：

示例源码如下，请查看 pre > code 标签中的内容

如果没有传入 success / fail / complete 参数，则会返回封装后的 Promise 对象：Promise 封装

通过 requestTask，可中断请求任务。

示例源码如下，请查看 pre > code 标签中的内容

certificate 参数说明 证书配置项

证书支持两种格式，文件格式和 Base64字符串格式

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
Array.<string>
```

Example 2 (json):
```json
{ name: 'name', age: 18 }
```

Example 3 (unknown):
```unknown
name=name&age=18
```

Example 4 (unknown):
```unknown
header['content-type']
```

---

## uni.getAccountInfoSync() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/getAccountInfoSync.html

**Contents:**
- # uni.getAccountInfoSync()
      - 本页导读

获取当前帐号信息，可以返回小程序的Appid。如果使用了微信小程序的云端插件，还可以返回当前插件Appid、版本号。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const accountInfo = uni.getAccountInfoSync();
console.log(accountInfo.miniProgram.appId); // 小程序 appId
console.log(accountInfo.plugin.appId); // 插件 appId
console.log(accountInfo.plugin.version); // 插件版本号， 'a.b.c' 这样的形式
```

Example 2 (javascript):
```javascript
const accountInfo = uni.getAccountInfoSync();
console.log(accountInfo.miniProgram.appId); // 小程序 appId
console.log(accountInfo.plugin.appId); // 插件 appId
console.log(accountInfo.plugin.version); // 插件版本号， 'a.b.c' 这样的形式
```

Example 3 (javascript):
```javascript
const accountInfo = uni.getAccountInfoSync();
console.log(accountInfo.miniProgram.appId); // 小程序 appId
console.log(accountInfo.plugin.appId); // 插件 appId
console.log(accountInfo.plugin.version); // 插件版本号， 'a.b.c' 这样的形式
```

Example 4 (javascript):
```javascript
const accountInfo = uni.getAccountInfoSync();
console.log(accountInfo.miniProgram.appId); // 小程序 appId
console.log(accountInfo.plugin.appId); // 插件 appId
console.log(accountInfo.plugin.version); // 插件版本号， 'a.b.c' 这样的形式
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-uni-api.html

**Contents:**
- # UTS中使用uni api
- # 示例
- # 注意事项
  - # 异步API中complete回调函数中的参数是any类型
- # 支持的API列表
  - # 网络
  - # 数据缓存
  - # 设备
  - # 界面
  - # 媒体

需HBuilderX 3.8.0 及以上版本

uts中经常要调用iOS和Android的api。uni对常用api进行了封装。在uni的api覆盖范围内，开发者可以简单的只调用uni的api实现对iOS、Android的能力调用。

目前uts插件代码中可以直接调用部分uni api，如uni.request、uni.showModel。未来会陆续实现所有uni api在uts中的完整调用。

示例源码如下，请查看 pre > code 标签中的内容

在uts中，由于不支持联合类型，complete回调函数的参数会当做any类型处理。 any类型对象不能直接使用“.”访问其属性，目前暂时可以使用JSON.stringify()转换为字符串处理，或者在success和fail回调中分别处理成功和失败的数据。 此问题仅在complete回调函数中存在，success和fail回调函数中可以使用“.”访问参数的属性。 如下示例：

示例源码如下，请查看 pre > code 标签中的内容

如果在complete回调函数中使用“.”访问属性，如下示例：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

目前仅支持以上列出的部分uni api的调用，uni ext api 实现的api（如uni.getBatteryInfo ）暂时还不支持在uts插件中调用

uni-app x 项目中使用的 uts插件 在 app 平台存在以下差异：

Android平台 uvue 页面 和 uts插件 都编译原生 kotlin 代码，因此 uts插件 可以调用所有的 uni API，不受限制。

iOS平台 uvue 页面 编译为 js 代码运行在 jscore 环境中，所有 uni API 都被封装为 js 层接口。uts插件则编译为原生 swfit 代码，在 swift 代码中无法直接调用 js 层接口，因此 uts插件 不能调用所有 uni API。 上一章节中列出的 uni API 实现时做了特殊处理，额外封装了对应的 swfit 层接口，支持在uts插件中调用。

**Examples:**

Example 1 (unknown):
```unknown
uni.request
```

Example 2 (unknown):
```unknown
uni.showModel
```

Example 3 (javascript):
```javascript
export function myToast() {
	uni.showToast({
		title: 'This is toast in uts with uni API!',
		success: function(){
			console.log('uni.showToast success!');
		},
		fail: (err) => {
			console.log('uni.showToast success: ', err);
		}
	});
}
```

Example 4 (javascript):
```javascript
export function myToast() {
	uni.showToast({
		title: 'This is toast in uts with uni API!',
		success: function(){
			console.log('uni.showToast success!');
		},
		fail: (err) => {
			console.log('uni.showToast success: ', err);
		}
	});
}
```

---

## uni.navigateTo(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/router.html

**Contents:**
- # uni.navigateTo(OBJECT)
  - # navigateTo 兼容性
- # uni.redirectTo(OBJECT)
  - # redirectTo 兼容性
- # uni.reLaunch(OBJECT)
  - # reLaunch 兼容性
- # uni.switchTab(OBJECT)
  - # switchTab 兼容性
- # uni.navigateBack(OBJECT)
  - # navigateBack 兼容性

保留当前页面，跳转到应用内的某个页面，使用uni.navigateBack可以返回到原页面。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

vue3 script setup 语法糖中调用 getOpenerEventChannel 示例：

示例源码如下，请查看 pre > code 标签中的内容

url有长度限制，太长的字符串会传递失败，可改用窗体通信 、全局变量 ，另外参数中出现空格等特殊字符时需要对参数进行编码，如下为使用encodeURIComponent对参数进行编码的示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意： 如果调用了 uni.preloadPage(OBJECT) 不会关闭，仅触发生命周期 onHide

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

跳转到 tabBar 页面，并关闭其他所有非 tabBar 页面。

注意： 如果调用了 uni.preloadPage(OBJECT) 不会关闭，仅触发生命周期 onHide

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

关闭当前页面，返回上一页面或多级页面。可通过 getCurrentPages() 获取当前的页面栈，决定需要返回几层。

示例源码如下，请查看 pre > code 标签中的内容

string eventName 事件名称

取消监听一个事件。给出第二个参数时，只取消给出的监听函数，否则取消所有监听函数

string eventName 事件名称

string eventName 事件名称

string eventName 事件名称

本API仅App支持。小程序自身不支持自定义动画。H5的窗体动画可使用常规单页动画处理方案，见H5下单页动画示例

窗口的显示/关闭动画效果，支持在 API、组件、pages.json 中配置，优先级为：API = 组件 > pages.json。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

pages.json 中配置的是窗口显示的动画

示例源码如下，请查看 pre > code 标签中的内容

显示动画与关闭动画，会有默认的对应规则。但是如果通过 API 或组件配置了窗口关闭的动画类型，则不会使用默认的类型。

**Examples:**

Example 1 (unknown):
```unknown
uni.navigateBack
```

Example 2 (javascript):
```javascript
//在起始页面跳转到test.vue页面并传递参数
uni.navigateTo({
	url: 'test?id=1&name=uniapp'
});
```

Example 3 (javascript):
```javascript
//在起始页面跳转到test.vue页面并传递参数
uni.navigateTo({
	url: 'test?id=1&name=uniapp'
});
```

Example 4 (javascript):
```javascript
//在起始页面跳转到test.vue页面并传递参数
uni.navigateTo({
	url: 'test?id=1&name=uniapp'
});
```

---

## uni.chooseAddress(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/choose-address

**Contents:**
- # uni.chooseAddress(OBJECT)
      - 本页导读

获取用户收货地址。调起用户编辑收货地址原生界面，并在编辑完成后返回用户选择的地址，需要用户授权 scope.address。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

Example 2 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

Example 3 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

Example 4 (javascript):
```javascript
uni.chooseAddress({
  success(res) {
    console.log(res.userName)
    console.log(res.postalCode)
    console.log(res.provinceName)
    console.log(res.cityName)
    console.log(res.countyName)
    console.log(res.detailInfo)
    console.log(res.nationalCode)
    console.log(res.telNumber)
  }
})
```

---

## API 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/index.html

**Contents:**
- # API 概述
- # 标准 js 和浏览器 js 的区别
- # 各端特色 API 调用
- # 补充说明
- # API Promise 化
  - # Vue 2 和 Vue 3 的 API Promise 化
- # API 列表
  - # 基础
  - # 网络
  - # 页面和路由

uni-app的 js API 由标准 ECMAScript 的 js API 和 uni 扩展 API 这两部分组成。

标准 ECMAScript 的 js 仅是最基础的 js。浏览器基于它扩展了 window、document、navigator 等对象。小程序也基于标准 js 扩展了各种 wx.xx、my.xx、swan.xx 的 API。node 也扩展了 fs 等模块。

uni-app 基于 ECMAScript 扩展了 uni 对象，并且 API 命名与小程序保持兼容。

uni-app的 js 代码，web 端运行于浏览器中。非 web 端（包含小程序和 App），Android 平台运行在 v8 引擎中，iOS 平台运行在 iOS 自带的 jscore 引擎中，都没有运行在浏览器或 webview 里。

非 web 端，虽然不支持 window、document、navigator 等浏览器的 js API，但也支持标准 ECMAScript。

请注意不要把浏览器里的 js 等价于标准 js。

所以 uni-app 的非web端，一样支持标准 js，支持 if、for 等语法，支持字符串、数字、时间、布尔值、数组、自定义对象等变量类型及各种处理方法。仅仅是不支持 window、document、navigator 等浏览器专用对象。

除了 uni-app 框架内置的跨端 API，各端自己的特色 API 也可通过条件编译 自由使用。

各端特色 API 规范参考各端的开发文档。其中 App 端的 JS API 参考html5plus.org ；uni-app 也支持通过扩展原生插件来丰富 App 端的开发能力，具体参考插件开发文档

各平台的 API 新增，不需要 uni-app 升级，开发者就可以直接使用。

各平台 API 独有的字段，如快手小程序 ks.pay 的 payType、paymentChannel 字段，开发者在调用 API 时正常传入即可，会透传至快手小程序的 API 上

具体 API Promise 化 的策略：

异步的方法，如果不传入 success、fail、complete 等 callback 参数，将以 Promise 返回数据。例如：uni.getImageInfo()

异步的方法，且有返回对象，如果希望获取返回对象，必须至少传入一项 success、fail、complete 等 callback 参数。例如：

示例源码如下，请查看 pre > code 标签中的内容

Vue 2 和 Vue 3 项目中 API Promise 化 返回格式不一致，以下为 不同点 和 返回格式互相转换

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

因文档同步原因，本页面列出的 API 可能不全。如在本文未找到相关 API，可以在左侧树中寻找或使用文档右上角的搜索功能。

**Examples:**

Example 1 (unknown):
```unknown
paymentChannel
```

Example 2 (unknown):
```unknown
getSystemInfoSync
```

Example 3 (unknown):
```unknown
uni.getImageInfo()
```

Example 4 (javascript):
```javascript
// 正常使用
 const task = uni.connectSocket({
  success(res){
   console.log(res)
  }
 })

 // Promise 化
 uni.connectSocket().then(res => {
   // 此处即为正常使用时 success 回调的 res
   // uni.connectSocket() 正常使用时是会返回 task 对象的，如果想获取 task ，则不要使用 Promise 化
   console.log(res)
 })
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/wifi.html

**Contents:**
- # uni.startWifi(OBJECT)
  - # startWifi 兼容性
- # uni.stopWifi(OBJECT)
  - # stopWifi 兼容性
- # uni.getConnectedWifi(OBJECT)
  - # getConnectedWifi 兼容性
- # uni.getWifiList(OBJECT)
  - # getWifiList 兼容性
- # uni.onGetWifiList(CALLBACK)
  - # onGetWifiList 兼容性

App平台由 uni ext api 实现，需下载插件：uni-WiFi

uni ext api 需 HBuilderX 3.6.8+

iOS平台获取Wi-Fi信息需要开启“Access WiFi information”能力登录苹果开发者网站，在“Certificates, Identifiers & Profiles”页面选择“Identifiers”中选择对应的App ID，确保开启“Access WiFi information”，保存后重新生成profile文件。

iOS平台iOS13及以上系统，获取当前连接的Wi-Fi信息需要先获取系统定位权限，因此在iOS13及以上系统使用此接口时，会触发定位权限申请的弹窗。

其它平台开发方式暂未统一，使用时需注意用条件编译 调用不同平台的代码。

抖音小程序的wifi API参考：规范详情

请求获取 Wi-Fi 列表。wifiList 数据会在 onGetWifiList 注册的回调中返回。

获取到 Wi-Fi 列表数据事件的监听函数

移除获取到 Wi-Fi 列表数据事件的监听函数。

onGetWifiList 传入的监听函数。不传此参数则移除所有监听函数。

连接 Wi-Fi。若已知 Wi-Fi 信息，可以直接利用该接口连接。

移除连接上 Wi-Fi 的事件的监听函数。

onWifiConnected 传入的监听函数。不传此参数则移除所有监听函数。

移除连接上 Wi-Fi 的事件的监听函数。

onWifiConnectedWithPartialInfo 传入的监听函数。不传此参数则移除所有监听函数。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/plugins/push.html

**Contents:**
- # 客户端API
- # uni.getPushClientId(OBJECT)
  - # getPushClientId 兼容性
- # uni.onPushMessage(callback)
  - # onPushMessage 兼容性
  - # 回调参数说明
- # uni.offPushMessage(callback)
  - # offPushMessage 兼容性
  - # Tips
- # uni.getChannelManager()

以下为uni-push2.0的api文档，业务介绍详情参考

uni-push有服务器API和客户端API。

注意：这是一个异步的方法，且仅支持uni-push2.0；

常见报错： getPushClientId:fail register fail: {\"errorCode\":1,\"errorMsg\":\"\"} 请检查：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取通知渠道管理器，Android 8系统以上才可以设置通知渠道。

示例源码如下，请查看 pre > code 标签中的内容

创建本地通知栏消息（HBuilderX 3.5.2起支持）

设置应用图标上显示的角标数字 注意：此api仅鸿蒙平台支持，iOS和Android平台请使用plus.runtime.setBadgeNumber详情参考

小程序平台的类似概念叫做模板消息，也有的平台改名为订阅消息。

以微信为例，开发者的服务器发送消息给微信的服务器，微信服务器会发送一条订阅消息，折叠到微信的消息列表中的服务通知里。它属于后台开发，和手机端无关。

如果使用uniCloud发送微信、支付宝订阅消息，参考：https://ext.dcloud.net.cn/plugin?id=1810

微信订阅消息文档：https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/subscribe-message.html

支付宝模板消息文档：https://docs.alipay.com/mini/introduce/message

百度模板消息文档：https://smartprogram.baidu.com/docs/develop/third/api/

抖音订阅消息文档：https://developer.open-douyin.com/docs/resource/zh-CN/mini-app/open-capacity/operation/subscribe-message/

QQ小程序订阅消息文档：https://q.qq.com/wiki/develop/miniprogram/frame/open_ability/open_message.html#%E8%AE%A2%E9%98%85%E6%B6%88%E6%81%AF

华为快应用推送文档：https://developer.huawei.com/consumer/cn/doc/development/quickApp-References/webview-api-hwpush

**Examples:**

Example 1 (yaml):
```yaml
getPushClientId:fail register fail: {\"errorCode\":1,\"errorMsg\":\"\"}
```

Example 2 (javascript):
```javascript
uni.getPushClientId({
		success: (res) => {
			console.log(res.cid);
		},
		fail(err) {
			console.log(err)
		}
	})
```

Example 3 (javascript):
```javascript
uni.getPushClientId({
		success: (res) => {
			console.log(res.cid);
		},
		fail(err) {
			console.log(err)
		}
	})
```

Example 4 (javascript):
```javascript
uni.getPushClientId({
		success: (res) => {
			console.log(res.cid);
		},
		fail(err) {
			console.log(err)
		}
	})
```

---

## API 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/

**Contents:**
- # API 概述
- # 标准 js 和浏览器 js 的区别
- # 各端特色 API 调用
- # 补充说明
- # API Promise 化
  - # Vue 2 和 Vue 3 的 API Promise 化
- # API 列表
  - # 基础
  - # 网络
  - # 页面和路由

uni-app的 js API 由标准 ECMAScript 的 js API 和 uni 扩展 API 这两部分组成。

标准 ECMAScript 的 js 仅是最基础的 js。浏览器基于它扩展了 window、document、navigator 等对象。小程序也基于标准 js 扩展了各种 wx.xx、my.xx、swan.xx 的 API。node 也扩展了 fs 等模块。

uni-app 基于 ECMAScript 扩展了 uni 对象，并且 API 命名与小程序保持兼容。

uni-app的 js 代码，web 端运行于浏览器中。非 web 端（包含小程序和 App），Android 平台运行在 v8 引擎中，iOS 平台运行在 iOS 自带的 jscore 引擎中，都没有运行在浏览器或 webview 里。

非 web 端，虽然不支持 window、document、navigator 等浏览器的 js API，但也支持标准 ECMAScript。

请注意不要把浏览器里的 js 等价于标准 js。

所以 uni-app 的非web端，一样支持标准 js，支持 if、for 等语法，支持字符串、数字、时间、布尔值、数组、自定义对象等变量类型及各种处理方法。仅仅是不支持 window、document、navigator 等浏览器专用对象。

除了 uni-app 框架内置的跨端 API，各端自己的特色 API 也可通过条件编译 自由使用。

各端特色 API 规范参考各端的开发文档。其中 App 端的 JS API 参考html5plus.org ；uni-app 也支持通过扩展原生插件来丰富 App 端的开发能力，具体参考插件开发文档

各平台的 API 新增，不需要 uni-app 升级，开发者就可以直接使用。

各平台 API 独有的字段，如快手小程序 ks.pay 的 payType、paymentChannel 字段，开发者在调用 API 时正常传入即可，会透传至快手小程序的 API 上

具体 API Promise 化 的策略：

异步的方法，如果不传入 success、fail、complete 等 callback 参数，将以 Promise 返回数据。例如：uni.getImageInfo()

异步的方法，且有返回对象，如果希望获取返回对象，必须至少传入一项 success、fail、complete 等 callback 参数。例如：

示例源码如下，请查看 pre > code 标签中的内容

Vue 2 和 Vue 3 项目中 API Promise 化 返回格式不一致，以下为 不同点 和 返回格式互相转换

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

因文档同步原因，本页面列出的 API 可能不全。如在本文未找到相关 API，可以在左侧树中寻找或使用文档右上角的搜索功能。

**Examples:**

Example 1 (unknown):
```unknown
paymentChannel
```

Example 2 (unknown):
```unknown
getSystemInfoSync
```

Example 3 (unknown):
```unknown
uni.getImageInfo()
```

Example 4 (javascript):
```javascript
// 正常使用
 const task = uni.connectSocket({
  success(res){
   console.log(res)
  }
 })

 // Promise 化
 uni.connectSocket().then(res => {
   // 此处即为正常使用时 success 回调的 res
   // uni.connectSocket() 正常使用时是会返回 task 对象的，如果想获取 task ，则不要使用 Promise 化
   console.log(res)
 })
```

---

## uni.setBackgroundColor(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/bgcolor

**Contents:**
- # uni.setBackgroundColor(OBJECT)
- # uni.setBackgroundTextStyle(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

动态设置下拉背景字体、loading 图的样式。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

Example 2 (javascript):
```javascript
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

Example 3 (javascript):
```javascript
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

Example 4 (css):
```css
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

---

## uni.navigateToMiniProgram(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/open-miniprogram.html

**Contents:**
- # uni.navigateToMiniProgram(OBJECT)
- # uni.navigateBackMiniProgram(OBJECT)
- # uni.openEmbeddedMiniProgram(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

跳转回上一个小程序，只有当另一个小程序跳转到当前小程序时才会能调用成功。

示例源码如下，请查看 pre > code 标签中的内容

微信小程序跳转小程序（半屏模式）（从微信础库 2.20.1 开始支持）

当小程序需要打开另一个小程序让用户进行快捷操作时，可将要打开的小程序以半屏的形态跳转。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

2022年3月18日后，使用过程有以下限制，若不符合以下所有条件将被自动切换为普通的小程序跳转小程序，不影响用户使用：

2022年3月18日前，使用过程有以下限制，若不符合以下所有条件将被自动切换为普通的小程序跳转小程序，不影响用户使用：

**Examples:**

Example 1 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

Example 2 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

Example 3 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

Example 4 (css):
```css
uni.navigateToMiniProgram({
  appId: '',
  path: 'pages/index/index?id=123',
  extraData: {
    'data1': 'test'
  },
  success(res) {
    // 打开成功
  }
})
```

---

## console | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/log

**Contents:**
  - # console
  - # debug
  - # log
  - # info
  - # warn
  - # error
      - 本页导读

注：App 端 debug 方法等同于 log 方法。

**Examples:**

Example 1 (javascript):
```javascript
console.log()
```

Example 2 (javascript):
```javascript
console.log(": " + );
```

---

## uni.openSetting(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/setting

**Contents:**
- # uni.openSetting(OBJECT)
- # uni.getSetting(OBJECT)
  - # 示例代码
      - 本页导读

调起客户端小程序设置界面，返回用户设置的操作结果。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

Example 2 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

Example 3 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

Example 4 (javascript):
```javascript
uni.openSetting({
  success(res) {
    console.log(res.authSetting)
  }
});
```

---

## uni.hideKeyboard() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/key.html

**Contents:**
- # uni.hideKeyboard()
  - # hideKeyboard 兼容性
- # uni.onKeyboardHeightChange(CALLBACK)
- # uni.offKeyboardHeightChange(CALLBACK)
- # uni.getSelectedTextRange(OBJECT)
      - 本页导读

隐藏已经显示的软键盘，如果软键盘没有显示则不做任何操作。

示例源码如下，请查看 pre > code 标签中的内容

onKeyboardHeightChange 传入的监听函数。不传此参数则移除所有监听函数。

示例源码如下，请查看 pre > code 标签中的内容

在input、textarea等focus之后，获取输入框的光标位置。注意：只有在focus的时候调用此接口才有效。目前仅支持 vue 页面，nvue 可以直接使用 weex 的 getSelectionRange 。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

Example 2 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

Example 3 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

Example 4 (javascript):
```javascript
uni.onKeyboardHeightChange(res => {
  console.log(res.height)
})
```

---

## uni.loadFontFace(Object object) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/font

**Contents:**
- # uni.loadFontFace(Object object)
  - # 平台差异说明
  - # loadFontFace 兼容性
  - # 参数说明
  - # 代码示例
  - # Tips
- # uni.rpx2px()
- # uni.upx2px()
      - 本页导读

app-nvue 不支持本 api，而是使用 Weex 提供的 DOM.addRule 加载自定义字体，详见 。

示例源码如下，请查看 pre > code 标签中的内容

uni-app x 中加载字体图标，详见 hello uni-app x 的 loadFontFace

将 rpx 单位值转换成 px。在 App 上暂不支持，可先使用 upx2px

示例源码如下，请查看 pre > code 标签中的内容

将 upx 单位值转换成 px。因 upx 已废弃，推荐使用 rpx。rpx 无需特殊 API 可直接使用。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

Example 2 (javascript):
```javascript
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

Example 3 (javascript):
```javascript
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

Example 4 (css):
```css
uni.loadFontFace({
  family: "Bitstream Vera Serif Bold",
  source: 'url("https://sungd.github.io/Pacifico.ttf")',
  success() {
    console.log("success");
  },
});
```

---

## 窗口样式相关的 API | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/adapt

**Contents:**
- # 窗口样式相关的 API
- # uni.getTopWindowStyle()
- # uni.getLeftWindowStyle()
- # uni.getRightWindowStyle()
- # uni.setTopWindowStyle(OBJECT)
- # uni.setLeftWindowStyle(OBJECT)
- # uni.setRightWindowStyle(OBJECT)
      - 本页导读

在web上，宽屏界面会出现topWindow、LeftWindow、RightWindow，相关概念详见宽屏适配指南

获取对应窗口的样式，返回一个 css 属性值对象; 设置对应窗口的样式，传入一个 css 属性值对象

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.getTopWindowStyle()
```

Example 2 (javascript):
```javascript
uni.getTopWindowStyle()
```

Example 3 (javascript):
```javascript
uni.getTopWindowStyle()
```

Example 4 (unknown):
```unknown
uni.getTopWindowStyle()
```

---

## uni.createAnimation(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/animation.html

**Contents:**
- # uni.createAnimation(OBJECT)
  - # animation
      - 本页导读

创建一个动画实例 animation。调用实例的方法来描述动画。最后通过动画实例的export方法导出动画数据传递给组件的animation属性。

示例源码如下，请查看 pre > code 标签中的内容

动画实例可以调用以下方法来描述动画，调用结束后会返回自身，支持链式调用的写法。

调用动画操作方法后要调用 step() 来表示一组动画完成，可以在一组动画中调用任意多个动画方法，一组动画中的所有动画会同时开始，一组动画完成后才会进行下一组动画。step 可以传入一个跟 uni.createAnimation() 一样的配置参数用于指定当前组动画的配置。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

Example 2 (javascript):
```javascript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

Example 3 (javascript):
```javascript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

Example 4 (gdscript):
```gdscript
var animation = uni.createAnimation({
  transformOrigin: "50% 50%",
  duration: 1000,
  timingFunction: "ease",
  delay: 0
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/quick-start

**Contents:**
- # uni-app自动化测试
- # 特性
- # CLI
- # 测试插件
- # 测试工程目录说明
    - # 测试用例文件规范
    - # 测试用例文件编写示例
- # 测试配置文件
    - # jest.config.js
- # 注意事项

uni-app提供了一批API，这些API可以操控uni-app应用，包括运行、跳转页面、触发点击等，并可以获取页面元素状态、进行截图，从而实现对uni-app项目进行自动化测试的目的。

本功能使用到了业内常见的测试库如jest （MIT协议）。

推荐使用方式：研发提交源码到版本库后，持续集成系统自动拉取源码，自动运行自动化测试。

如果您想在终端命令行进行自动化测试、或使用持续集成进行测试。

为了方便大家在HBuilderX内，进行uni-app自动化测试，开发了 HBuilderX uni-app自动化测试插件 。

插件支持在HBuilderX内对uni-app普通项目、CLI项目进行自动化测试。

插件简化了测试环境安装、测试用例创建、测试运行、测试设备选择等步骤。插件使用文档

如下所示，是一个标准的uni-app x项目测试工程目录介绍。

示例源码如下，请查看 pre > code 标签中的内容

以下代码是一个简单的uni-app页面测试用例，使用page.$获取.title选择器的文本，然后进行断言。

示例源码如下，请查看 pre > code 标签中的内容

一个完整的jest.config.js文件，为测试配置文件，详细内容如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

GitHub： https://github.com/dcloudio/hello-uniapp

**Examples:**

Example 1 (unknown):
```unknown
uni-app普通项目
```

Example 2 (shell):
```shell
.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss
```

Example 3 (shell):
```shell
.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss
```

Example 4 (shell):
```shell
.
├── App.uvue
├── env.js        // 此文件主要用于配置uni-app项目测试设备、测试基座路径等。当然你也可以把此文件的内容放置到jest.config.js testEnvironmentOptions节点下
├── index.html
├── jest.config.js  // 此文件允许你自定义和控制 Jest 的行为，比如指定测试文件的位置、配置测试环境、忽略某些目录等
├── main.uts
├── manifest.json
├── pages
│   └── index
│       ├── index.test.js  // 测试用例文件。通常跟页面在同一级目录
│       └── index.uvue
├── pages.json
├── static
│   └── logo.png
└── uni.scss
```

---

## uni.setBackgroundColor(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/bgcolor.html

**Contents:**
- # uni.setBackgroundColor(OBJECT)
- # uni.setBackgroundTextStyle(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

动态设置下拉背景字体、loading 图的样式。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

Example 2 (javascript):
```javascript
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

Example 3 (javascript):
```javascript
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

Example 4 (css):
```css
uni.setBackgroundColor({
    backgroundColor: '#ffffff',
    backgroundColorTop: '#222222',
    backgroundColorBottom: '#333333'
});
```

---

## 开发接入常见问题 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/faq/ad-dev-faq.html

**Contents:**
- # 开发接入常见问题
  - # 我的广告代码如何部署到应用上？
  - # 如果开屏广告同时开启 DCloud 快捷广告和渠道 SDK 广告，请求顺序是怎样的？
  - # 激励视频开启了服务器回调，没有收到回调请求？
  - # 激励视频开启了服务器回调，重复收到回调请求？
  - # 服务器在激励视频没有看完时就收到了服务器回调？
  - # 广告展示时报错，错误码-5002，无效的广告位标识adpid，请使用正确的adpid？
  - # 微信小程序广告常见问题
    - # vue3 setup写法报错
    - # 错误码-1002

请严格按照官方文档进行代码部署，否则广告可能无法正常展示！

所有请求顺序由算法动态调整，渠道收益高的优先展示。

如重复收到回调请求，请检查回调参数trans_id是否一致，如一致则表明广告渠道商未收到正确返回值触发广告回调重试机制。回调约定返回值

不同广告素材的奖励下发节点不同。部分广告只要达到奖励条件（如完成点击或互动），无需看完视频即可触发服务器回调。服务器收到激励视频回调即可给用户发放奖励。

vue3组合式写法，注意：页面名称不能和组件重名，ref名称不能和组件重名

广告单元（unit-id）不正确，广告单元长度异常。出现此错误可能是由于拼写错误，或误用了 API 语法（uni.createRewardedVideoAd）导致。

无合适的广告，广告不是每一次都会出现，这次没有出现可能是由于该用户不适合浏览广告，属于正常情况，且开发者需要针对这种情况做形态上的兼容。

JS请求域名不匹配，请检查JS请求域名是否正确，确保与在平台注册的域名一致。可先进行域名校验，成功后再进行广告请求

请求过于频繁或返回未曝光，且产生的收入低，触发平台出于成本考虑的填充限制。建议减少无效的重复请求，提升广告曝光率

设备信息对于广告投放平台非常重要，可以通过设备标识信息对用户及设备进行画像，分析用户的属性、行为等，从而大幅提升广告投放的精准度。 默认情况下，开通广告后应用首次启动会自动申请获取设备信息权限，用户可以拒绝授权，应用也可以继续运行，但广告平台也无法获取设备信息导致下发的广告跟用户匹配度不够高，甚至影响广告填充率。因此如果应用能够拥有获取设备信息权限，将会有助于提升广告收益。

在应用中可以强制设置必须授权获取设备信息权限才能运行，用户拒绝授权将会弹出提示框，配置方法： 打开manifest.json文件，切换到“源码视图”项

permissionPhoneState节点数据格式如下：

示例源码如下，请查看 pre > code 标签中的内容

request字段需设置为"always"，表示强制设置应用必须授权获取设备信息权限 prompt字段为用户拒绝获取设备信息权限时弹出提示框上的内容，建议根据应用功能修改为更为友好的提示信息

需提交云端打包才能生效，更多详情及离线打包配置请参考：https://ask.dcloud.net.cn/article/36549

IDFA是苹果官方提供用于追踪用户的广告标识符，与Android平台的设备信息类似，广告平台可以通过IDFA来分析用户的属性、行为来提升广告投放的精准度。 应用如果使用广告标识，将会有助于提升广告收益。

使用IDFA的配置方法参考：https://ask.dcloud.net.cn/article/36107

同样位置信息对于广告平台的用户的属性、行为分析也很重要，如果能够获取位置信息，也可以大幅提升广告投放的精准度，从而提升广告收益。 如果应用中已经使用了定位或地图功能，manifest.json中配置添加百度或高德地图模块则会自动添加定位权限，调用相关功能会自动弹出授权提示框。 如果应用中没有使用定位或地图功能，可以在manifest.json的“App模块权限配置”中配置定位权限：

在应用添加业务场景使用定位功能，并引导用户授权定位权限，可以调用以下5+ API进行定位

示例源码如下，请查看 pre > code 标签中的内容

调用定位API时会弹出系统位置授权框，如果用户拒绝权限将会触发失败回调，可以弹出警告提示某些业务功能无法使用来引导用户授权定位权限。

为了提升安全性，建议所有使用激励视频的开发者都要做激励视频服务器回调功能 ，除此之外还可用如下办法来加强安全保护（防止刷量）：

**Examples:**

Example 1 (unknown):
```unknown
uniAdCallback
```

Example 2 (unknown):
```unknown
<ad-rewarded-video>
```

Example 3 (json):
```json
"permissionPhoneState": {
        "request": "always",
        "prompt": "为保证您正常、安全地使用，需要获取设备识别码（部分手机提示为获取手机号码）使用权限，请允许。"
     }
```

Example 4 (json):
```json
"permissionPhoneState": {
        "request": "always",
        "prompt": "为保证您正常、安全地使用，需要获取设备识别码（部分手机提示为获取手机号码）使用权限，请允许。"
     }
```

---

## sport 运动 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/sport.html

**Contents:**
    - # sport 运动
      - 本页导读

此功能为计步器，用于获取手机用户的运动步数。

各平台开发方式暂未统一，使用时需注意用条件编译 调用不同平台的代码。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/image.html

**Contents:**
- # uni.chooseImage(OBJECT)
  - # chooseImage 兼容性
- # uni.previewImage(OBJECT)
  - # previewImage 兼容性
- # uni.closePreviewImage(OBJECT)
  - # closePreviewImage 兼容性
- # uni.getImageInfo(OBJECT)
  - # getImageInfo 兼容性
- # uni.saveImageToPhotosAlbum(OBJECT)
  - # saveImageToPhotosAlbum 兼容性

图片需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

App端如需要更丰富的相机拍照API（如直接调用前置摄像头），参考plus.camera

微信小程序从基础库 2.21.0 开始， wx.chooseImage 停止维护，请使用 uni.chooseMedia 代替。

注：文件的临时路径，在应用本次启动期间可以正常使用，如需持久保存，需在主动调用 uni.saveFile，在应用下次启动时才能访问得到。

示例源码如下，请查看 pre > code 标签中的内容

1.9.5+ 支持传图片在 urls 中的索引值

current 为当前显示图片的链接/索引值，不填或填写的值无效则为 urls 的第一张。App平台在 1.9.5至1.9.8之间，current为必填。不填会报错

注意，当 urls 中有重复的图片链接时：

一组图片 [A, B1, C, B2, D]，其中 B1 与 B2 的图片链接是一样的。

longPressActions 参数说明

示例源码如下，请查看 pre > code 标签中的内容

小程序下获取网络图片信息需先配置download域名白名单才能生效。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

Example 2 (javascript):
```javascript
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

Example 3 (javascript):
```javascript
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

Example 4 (css):
```css
uni.chooseImage({
	count: 6, //默认9
	sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
	sourceType: ['album'], //从相册选择
	success: function (res) {
		console.log(JSON.stringify(res.tempFilePaths));
	}
});
```

---

## CanvasGradient.addColorStop(stop,color) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/CanvasGradient.html

**Contents:**
- # CanvasGradient.addColorStop(stop,color)
  - # 参数
      - 本页导读

小于最小 stop 的部分会按最小 stop 的 color 来渲染，大于最大 stop 的部分会按最大 stop 的 color 来渲染。

需要使用 addColorStop() 来指定渐变点，至少要两个。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
addColorStop()
```

Example 2 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Create circular gradient
const grd = ctx.createLinearGradient(30, 10, 120, 10)
grd.addColorStop(0, 'red')
grd.addColorStop(0.16, 'orange')
grd.addColorStop(0.33, 'yellow')
grd.addColorStop(0.5, 'green')
grd.addColorStop(0.66, 'cyan')
grd.addColorStop(0.83, 'blue')
grd.addColorStop(1, 'purple')

// Fill with gradient
ctx.setFillStyle(grd)
ctx.fillRect(10, 10, 150, 80)
ctx.draw()
```

Example 3 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Create circular gradient
const grd = ctx.createLinearGradient(30, 10, 120, 10)
grd.addColorStop(0, 'red')
grd.addColorStop(0.16, 'orange')
grd.addColorStop(0.33, 'yellow')
grd.addColorStop(0.5, 'green')
grd.addColorStop(0.66, 'cyan')
grd.addColorStop(0.83, 'blue')
grd.addColorStop(1, 'purple')

// Fill with gradient
ctx.setFillStyle(grd)
ctx.fillRect(10, 10, 150, 80)
ctx.draw()
```

Example 4 (javascript):
```javascript
const ctx = uni.createCanvasContext('myCanvas')

// Create circular gradient
const grd = ctx.createLinearGradient(30, 10, 120, 10)
grd.addColorStop(0, 'red')
grd.addColorStop(0.16, 'orange')
grd.addColorStop(0.33, 'yellow')
grd.addColorStop(0.5, 'green')
grd.addColorStop(0.66, 'cyan')
grd.addColorStop(0.83, 'blue')
grd.addColorStop(1, 'purple')

// Fill with gradient
ctx.setFillStyle(grd)
ctx.fillRect(10, 10, 150, 80)
ctx.draw()
```

---

## uni.getNetworkType(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/network.html

**Contents:**
- # uni.getNetworkType(OBJECT)
  - # getNetworkType 兼容性
- # uni.onNetworkStatusChange(CALLBACK)
  - # onNetworkStatusChange 兼容性
- # uni.offNetworkStatusChange(CALLBACK)
  - # offNetworkStatusChange 兼容性
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

监听网络状态变化。可使用uni.offNetworkStatusChange取消监听。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HarmonyOS Next
```

Example 2 (unknown):
```unknown
ohos.permission.GET_NETWORK_INFO
```

Example 3 (javascript):
```javascript
uni.getNetworkType({
	success: function (res) {
		console.log(res.networkType);
	}
});
```

Example 4 (javascript):
```javascript
uni.getNetworkType({
	success: function (res) {
		console.log(res.networkType);
	}
});
```

---

## uni.navigateTo(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/router

**Contents:**
- # uni.navigateTo(OBJECT)
  - # navigateTo 兼容性
- # uni.redirectTo(OBJECT)
  - # redirectTo 兼容性
- # uni.reLaunch(OBJECT)
  - # reLaunch 兼容性
- # uni.switchTab(OBJECT)
  - # switchTab 兼容性
- # uni.navigateBack(OBJECT)
  - # navigateBack 兼容性

保留当前页面，跳转到应用内的某个页面，使用uni.navigateBack可以返回到原页面。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

vue3 script setup 语法糖中调用 getOpenerEventChannel 示例：

示例源码如下，请查看 pre > code 标签中的内容

url有长度限制，太长的字符串会传递失败，可改用窗体通信 、全局变量 ，另外参数中出现空格等特殊字符时需要对参数进行编码，如下为使用encodeURIComponent对参数进行编码的示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意： 如果调用了 uni.preloadPage(OBJECT) 不会关闭，仅触发生命周期 onHide

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

跳转到 tabBar 页面，并关闭其他所有非 tabBar 页面。

注意： 如果调用了 uni.preloadPage(OBJECT) 不会关闭，仅触发生命周期 onHide

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

关闭当前页面，返回上一页面或多级页面。可通过 getCurrentPages() 获取当前的页面栈，决定需要返回几层。

示例源码如下，请查看 pre > code 标签中的内容

string eventName 事件名称

取消监听一个事件。给出第二个参数时，只取消给出的监听函数，否则取消所有监听函数

string eventName 事件名称

string eventName 事件名称

string eventName 事件名称

本API仅App支持。小程序自身不支持自定义动画。H5的窗体动画可使用常规单页动画处理方案，见H5下单页动画示例

窗口的显示/关闭动画效果，支持在 API、组件、pages.json 中配置，优先级为：API = 组件 > pages.json。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

pages.json 中配置的是窗口显示的动画

示例源码如下，请查看 pre > code 标签中的内容

显示动画与关闭动画，会有默认的对应规则。但是如果通过 API 或组件配置了窗口关闭的动画类型，则不会使用默认的类型。

**Examples:**

Example 1 (unknown):
```unknown
uni.navigateBack
```

Example 2 (javascript):
```javascript
//在起始页面跳转到test.vue页面并传递参数
uni.navigateTo({
	url: 'test?id=1&name=uniapp'
});
```

Example 3 (javascript):
```javascript
//在起始页面跳转到test.vue页面并传递参数
uni.navigateTo({
	url: 'test?id=1&name=uniapp'
});
```

Example 4 (javascript):
```javascript
//在起始页面跳转到test.vue页面并传递参数
uni.navigateTo({
	url: 'test?id=1&name=uniapp'
});
```

---

## uni.setScreenBrightness(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/brightness.html

**Contents:**
  - # uni.setScreenBrightness(OBJECT)
  - # uni.getScreenBrightness(OBJECT)
  - # uni.setKeepScreenOn(OBJECT)
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

Tips: 避免 onshow() 里使用 setScreenBrightness() , 亮度变化会再次触发 onShow() 造成死循环

示例源码如下，请查看 pre > code 标签中的内容

设置是否保持常亮状态。仅在当前应用生效，离开应用后设置失效。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

Example 2 (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

Example 3 (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

Example 4 (css):
```css
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

---

## console | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/log.html

**Contents:**
  - # console
  - # debug
  - # log
  - # info
  - # warn
  - # error
      - 本页导读

注：App 端 debug 方法等同于 log 方法。

**Examples:**

Example 1 (javascript):
```javascript
console.log()
```

Example 2 (javascript):
```javascript
console.log(": " + );
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/worktile/auto/api.html

uni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务uni-appuni-appuni-app xuniCloudHBuilder Xuni 小程序 sdkuni-ad广告开发者服务简体中文搜索文档K介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub工程化介绍教程全局文件组件API插件AI专题工程化UTS其他规范其他规范App扩展规范 HTML5 Plus微信小程序支付宝小程序百度小程序抖音小程序飞书小程序钉钉小程序QQ小程序快手小程序京东小程序华为快应用360小程序Weex鸿蒙元服务小红书小程序GitHub概述Git/SVNcli 脚手架编译运行环境自动化测试快速开始APIHBuilderX自动化测试插件使用 CLI 运行uniapp自动化测试CLI项目运行自动化测试持续集成uniCloud Web控制台插件市场ask问答社区uni-aduni统计代码仓库：Gitee、GitHubuni-app的uni-im交流群：点击加入官方QQ交流群群35：713420817（2000人已满）群34：530305531（2000人已满）群33：498071674（2000人已满）群32：166188631（2000人已满）群31：567471669（2000人已满）群30：371046920（2000人已满）群29：202965481（2000人已满）群28：166188776（2000人已满）群27：811363410（2000人已满）群26：147867597（2000人已满）群25：165297000（2000人已满）群24：672494800（2000人已满）群23：599958679（2000人已满）群22：687186952（2000人已满）群21：717019120（2000人已满）群20：165796402（2000人已满）群19：165657124（2000人已满）群18：698592271（2000人已满）群17：951348804（2000人已满）群16：719211033（2000人已满）群15：516984120（2000人已满）群14：465953250（2000人已满）群13：699478442（2000人已满）群12：884860657（2000人已满）群11：296811328（2000人已满）群10：959059626（2000人已满）群9：775128777（2000人已满）群8：695442854（2000人已满）群7：942061423（2000人已满）群6：697264024（2000人已满）群5：731951419（2000人已满）群4：942702595（2000人已满）群3：773794803（2000人已满）群2：901474938（2000人已满）群1：531031261（2000人已满）关注微信公众号Uni 测试框架 APIprogram方法Page属性方法page.scrollTopElement属性方法展示全部#API#Uni 测试框架 API#programprogram 是uni-automator自动注入的全局对象#方法#program.pageStack获取页面堆栈。program.pageStack(): Promise<Page[]>#program.navigateTo保留当前页面，跳转到应用内的某个页面，同uni.navigateTo。program.navigateTo(url: string): Promise<Page>字段类型必填默认值说明urlstring是-需要跳转的应用内非 tabBar 的页面的路径示例代码：constpage=awaitprogram.navigateTo('/pages/index/index')console.log(page.path)// -> 'page/index/index'示例源码如下，请查看 pre > code 标签中的内容const page = await program.navigateTo('/pages/index/index')
  console.log(page.path)// -> 'page/index/index'#program.redirectTo关闭当前页面，跳转到应用内的某个页面，同uni.redirectTo。program.redirectTo(url: string): Promise<Page>字段类型必填默认值说明urlstring是-需要跳转的应用内非 tabBar 的页面的路径#program.navigateBack关闭当前页面，返回上一页面或多级页面，同uni.navigateBack。program.navigateBack(): Promise<Page>#program.reLaunch关闭所有页面，打开到应用内的某个页面，同uni.reLaunch。program.reLaunch(url: string): Promise<Page>字段类型必填默认值说明urlstring是-需要跳转的应用内页面路径#program.switchTab跳转到 tabBar 页面，并关闭其他所有非 tabBar 页面，同uni.switchTab。program.switchTab(url: string): Promise<Page>字段类型必填默认值说明urlstring是-需要跳转的 tabBar 页面的路径#program.currentPage获取当前页面。program.currentPage(): Promise<Page>#program.systemInfo获取系统信息，同uni.getSystemInfo。program.systemInfo(): Promise<Object>示例代码：constsystemInfo=awaitprogram.systemInfo()if(systemInfo.uniPlatform==='devtools'){// Do something}示例源码如下，请查看 pre > code 标签中的内容const systemInfo = await program.systemInfo()
	if (systemInfo.uniPlatform === 'devtools') {
		// Do something
	}#program.pageScrollTo将页面滚动到目标位置，同uni.pageScrollTo。program.pageScrollTo(scrollTop: number): Promise<void>字段类型必填默认值说明scrollTopnumber是-滚动到页面的目标位置，单位 px示例代码：constpage=awaitprogram.currentPage()awaitprogram.pageScrollTo(20)console.log(awaitpage.scrollTop())示例源码如下，请查看 pre > code 标签中的内容const page = await program.currentPage()
   await program.pageScrollTo(20)
   console.log(await page.scrollTop())#program.callUniMethod调用 uni 对象上的指定方法。program.callUniMethod(method: string, ...args: any[]): Promise<any>字段类型必填默认值说明methodstring是-需要调用的方法名...argsarray<any>否-方法参数调用异步方法时无需传入 success 及 fail 回调函数。示例代码：awaitprogram.callUniMethod('setStorage',{key:'test',data:'123456'})constdata=awaitprogram.callUniMethod('getStorageSync','test')console.log(data)// -> '123456'示例源码如下，请查看 pre > code 标签中的内容await program.callUniMethod('setStorage', {
	  key: 'test',
	  data: '123456'
	})
	const data = await program.callUniMethod('getStorageSync', 'test')
	console.log(data) // -> '123456'#program.screenshot对当前页面截图。微信小程序只有开发者工具模拟器支持，客户端无法使用。program.screenshot(options?: Object): Promise<string | void>字段类型必填默认值说明optionsObject否-截图选项如果不传 options，该方法返回图片数据的 base64 编码。options 字段定义如下：字段类型必填默认值说明pathstring是-图片保存路径it('screenshot',async()=>{awaitprogram.screenshot({path:"static/screenshot.png"// 默认项目根目录})});示例源码如下，请查看 pre > code 标签中的内容it('screenshot', async () => {
		await program.screenshot({
			path: "static/screenshot.png" // 默认项目根目录
		})
	});#program.mockUniMethod覆盖 uni 对象上指定方法的调用结果。利用该接口，你可以很方便地直接指定uni.chooseLocation等调用系统组件的返回结果。program.mockUniMethod(method: string, result: any): Promise<void>参数说明字段类型必填默认值说明methodstring是-需要覆盖的方法名resultany是-指定调用结果program.mockUniMethod(method: string, fn: Function | string, ...args: any[]): Promise<void>参数说明字段类型必填默认值说明methodstring是-需要覆盖的方法名fnFunction string是-处理返回函数...argsarray<any>否-传入参数fn 同 program.evaluate 的 appFunction 参数一样，无法使用闭包来引用外部变量。此外，你还可以在方法内使用 this.origin 来调用原始方法。示例代码：awaitprogram.mockUniMethod('showModal',{confirm:true,cancel:false})awaitprogram.mockUniMethod('getStorageSync',function(key,defVal){if(key==='name')return'redhoodsu'if(key==='sex')return'male'returndefVal},'unknown',)// 调用 uni.getStorageSync('name') 返回 'redhoodsu'// 更改 getSystemInfo 中的 platform 字段awaitprogram.mockUniMethod('getSystemInfo',function(obj,platform){returnnewPromise(resolve=>{// origin 指向原始方法this.origin({success(res){res.platform=platformresolve(res)},})})},'test',)示例源码如下，请查看 pre > code 标签中的内容await program.mockUniMethod('showModal', {
		confirm: true,
		cancel: false
	})

	await program.mockUniMethod(
		'getStorageSync',
		function(key, defVal) {
			if (key === 'name') return 'redhoodsu'
			if (key === 'sex') return 'male'
			return defVal
		},
		'unknown',
  )
  // 调用 uni.getStorageSync('name') 返回 'redhoodsu'

  // 更改 getSystemInfo 中的 platform 字段
	await program.mockUniMethod(
		'getSystemInfo',
		function(obj, platform) {
			return new Promise(resolve => {
				// origin 指向原始方法
				this.origin({
					success(res) {
						res.platform = platform
						resolve(res)
					},
				})
			})
		},
		'test',
	)#program.restoreUniMethod重置 uni 指定方法，消除 mockUniMethod 调用的影响。program.restoreUniMethod(method: string): Promise<void>字段类型必填默认值说明methodstring是-需要覆盖的方法名示例代码:console.log(awaitprogram.callUniMethod('getStorageSync','test'))// -> ''awaitprogram.mockUniMethod('getStorageSync','mockValue')console.log(awaitprogram.callUniMethod('getStorageSync','test'))// -> 'mockValue'awaitprogram.restoreUniMethod('getStorageSync')console.log(awaitprogram.callUniMethod('getStorageSync','test'))// -> ''示例源码如下，请查看 pre > code 标签中的内容console.log(await program.callUniMethod('getStorageSync', 'test')) // -> ''
	await program.mockUniMethod('getStorageSync', 'mockValue')
	console.log(await program.callUniMethod('getStorageSync', 'test')) // -> 'mockValue'
	await program.restoreUniMethod('getStorageSync')
	console.log(await program.callUniMethod('getStorageSync', 'test')) // -> ''#program.evaluate注入代码片段并返回执行结果。（仅微信小程序支持）program.evaluate(appFunction: Function | string, ...args: any[]): Promise<any>字段类型必填默认值说明appFunctionFunction string是-代码片段...argsarray<any>否-执行时传入参数appFunction 最终会被序列化传递到开发者工具，因此你无法在函数中利用闭包来引用外部变量。也就是说，传递 function () {} 函数事实上等同于传递其字符串。示例代码：letsystemInfo=awaitprogram.evaluate(()=>{returnnewPromise(resolve=>{uni.getSystemInfo({success(result){resolve(result)}})})})systemInfo=awaitprogram.evaluate(()=>{returnuni.getSystemInfoSync()})console.log(systemInfo)awaitprogram.evaluate(key=>{uni.setStorageSync(key,'test')},'test')consthasLogin=awaitprogram.evaluate(()=>getApp().globalData.hasLogin)console.log(hasLogin)示例源码如下，请查看 pre > code 标签中的内容let systemInfo = await program.evaluate(() => {
		return new Promise(resolve => {
			uni.getSystemInfo({
				success(result) {
					resolve(result)
				}
			})
		})
	})
	systemInfo = await program.evaluate(() => {
		return uni.getSystemInfoSync()
	})
	console.log(systemInfo)
	await program.evaluate(key => {
		uni.setStorageSync(key, 'test')
	}, 'test')
	const hasLogin = await program.evaluate(() => getApp().globalData.hasLogin)
	console.log(hasLogin)#program.testAccounts获取多账号调试中已添加的用户列表。（仅微信小程序支持）program.testAccounts(): Promise<Account[]>Account 字段定义如下：字段类型说明nickNamestring用户昵称openidstring账号 openid示例代码：consttestAccounts=awaitprogram.testAccounts()for(leti=0,len=testAccounts.length;i<len;i++){constminiProgram=awaitautomator.launch({projectPath:'path/to/project',account:testAccounts[i].openid})// 控制多个用户登录的不同小程序}示例源码如下，请查看 pre > code 标签中的内容const testAccounts = await program.testAccounts()
	for (let i = 0, len = testAccounts.length; i < len; i++) {
		const miniProgram = await automator.launch({
			projectPath: 'path/to/project',
			account: testAccounts[i].openid
		})
		// 控制多个用户登录的不同小程序
	}#program.exposeFunction在全局暴露方法，供小程序侧调用测试脚本中的方法（仅微信小程序支持）program.exposeFunction(name: string, bindingFunction: Function): Promise<void>字段类型必填默认值说明namestring是-全局方法名bindingFunctionFunction是-脚本方法你可以利用该方法来监听事件，不支持在小程序侧获取调用结果。示例代码：awaitprogram.exposeFunction('onAppShow',options=>{// Do something...})awaitprogram.evaluate(function(){uni.onAppShow(function(options){onAppShow(options)})})示例源码如下，请查看 pre > code 标签中的内容await program.exposeFunction('onAppShow', options => {
		// Do something... 
	})
	await program.evaluate(function() {
		uni.onAppShow(function(options) {
			onAppShow(options)
		})
	})#PagePage 模块提供了控制页面的方法。#属性#page.path页面路径。page.path: string#page.query页面参数。page.query: Object#方法#page.$获取页面元素。page.$(selector: string): Promise<Element>参数说明字段类型必填默认值说明selectorstring是-选择器(id、class、元素选择器)示例代码：constpage=awaitprogram.currentPage()constelement=awaitpage.$('.index-desc')console.log(element.tagName)// 'view'示例源码如下，请查看 pre > code 标签中的内容const page = await program.currentPage()
  const element = await page.$('.index-desc')
  console.log(element.tagName) // 'view'#page.$$获取页面元素数组。page.$$(selector: string): Promise<Element[]>参数说明字段类型必填默认值说明selectorstring是-选择器(id、class、元素选择器)该方法跟 $ 一样均无法选择自定义组件内的元素，请使用 element.$。示例代码：constpage=awaitprogram.currentPage()constelements=awaitpage.$$('.list-text')console.log(elements.length)示例源码如下，请查看 pre > code 标签中的内容const page = await program.currentPage()
  const elements = await page.$$('.list-text')
  console.log(elements.length)#page.waitFor等待直到指定条件成立。page.waitFor(condition: string | num

---

## uni.setEnableDebug(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/set-enable-debug.html

**Contents:**
- # uni.setEnableDebug(OBJECT)
  - # 示例代码
      - 本页导读

设置是否打开调试开关。此开关对正式版也能生效。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

Example 2 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

Example 3 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

Example 4 (css):
```css
// 打开调试
uni.setEnableDebug({
    enableDebug: true
})
// 关闭调试
uni.setEnableDebug({
    enableDebug: false
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uts/buildin-object-api/utsjsonobject.html

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

## uni.onAccelerometerChange(CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/accelerometer

**Contents:**
- # uni.onAccelerometerChange(CALLBACK)
  - # onAccelerometerChange 兼容性
- # uni.offAccelerometerChange(CALLBACK)
  - # offAccelerometerChange 兼容性
- # uni.startAccelerometer(OBJECT)
  - # startAccelerometer 兼容性
- # uni.stopAccelerometer(OBJECT)
  - # stopAccelerometer 兼容性
      - 本页导读

监听加速度数据，频率：5次/秒，接口调用后会自动开始监听，可使用 uni.offAccelerometer 取消监听。

示例源码如下，请查看 pre > code 标签中的内容

onAccelerometerChange 传入的监听函数。不传此参数则移除所有监听函数。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.offAccelerometer
```

Example 2 (javascript):
```javascript
uni.onAccelerometerChange(function (res) {
	console.log(res.x);
	console.log(res.y);
	console.log(res.z);
});
```

Example 3 (javascript):
```javascript
uni.onAccelerometerChange(function (res) {
	console.log(res.x);
	console.log(res.y);
	console.log(res.z);
});
```

Example 4 (javascript):
```javascript
uni.onAccelerometerChange(function (res) {
	console.log(res.x);
	console.log(res.y);
	console.log(res.z);
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uts/buildin-object-api/error.html

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

## uni.chooseInvoiceTitle(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/other/invoice-title

**Contents:**
- # uni.chooseInvoiceTitle(OBJECT)
      - 本页导读

选择用户的发票抬头，需要用户授权 scope.invoiceTitle。

在微信小程序中，当前小程序必须关联一个公众号，且这个公众号是完成了微信认证 的，才能调用 chooseInvoiceTitle。

|属性|类型|必填|说明| |:-|:-|:-|:-|:-| |success|function|否|接口调用成功的回调函数| |fail|function|否|接口调用失败的回调函数| |complete|function|否|接口调用结束的回调函数（调用成功、失败都会执行）|

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

Example 2 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

Example 3 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

Example 4 (javascript):
```javascript
uni.chooseInvoiceTitle({
    success(res) {
        console.log(res.type);
        console.log(res.title);
        console.log(res.taxNumber);
        console.log(res.companyAddress);
        console.log(res.telephone);
        console.log(res.bankName);
        console.log(res.bankAccount);
  }
})
```

---

## uni.onLocationChange(FUNCTION CALLBACK) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/location-change.html

**Contents:**
- # uni.onLocationChange(FUNCTION CALLBACK)
  - # onLocationChange 兼容性
- # uni.offLocationChange(FUNCTION CALLBACK)
  - # offLocationChange 兼容性
- # uni.onLocationChangeError(FUNCTION CALLBACK)
  - # onLocationChangeError 兼容性
- # uni.offLocationChangeError(FUNCTION CALLBACK)
  - # offLocationChangeError 兼容性
- # uni.startLocationUpdate(OBJECT)
  - # startLocationUpdate 兼容性

监听实时地理位置变化事件，需结合 uni.startLocationUpdate 或 uni.startLocationUpdateBackground 使用。

Web平台本API之前调用了腾讯地图的gcj02坐标免费转换接口，该接口从2024年7月18日起被腾讯逐步下线，导致老版本中本API无法使用。请立即升级到 uni-app 4.24版。

如果运行在微信浏览器中，可以使用微信的jssdk的定位能力。这个是微信向腾讯地图申请的key，开发者无需配置自己的key。

地图厂商的商业授权较贵，如需购买，请点击获取优惠 。

示例源码如下，请查看 pre > code 标签中的内容

注意：App端及H5端callback参数为必填。

注意：App端及H5端callback参数为必填。

示例源码如下，请查看 pre > code 标签中的内容

关闭监听实时位置变化，前后台都停止消息接收。

开始监听实时地理位置信息变化事件，应用进入前后台时均接收实时地理位置信息。

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

**Examples:**

Example 1 (unknown):
```unknown
uni.startLocationUpdate
```

Example 2 (unknown):
```unknown
uni.startLocationUpdateBackground
```

Example 3 (unknown):
```unknown
uni.stopLocationUpdate
```

Example 4 (unknown):
```unknown
HarmonyOS Next平台
```

---

## uni.createInnerAudioContext() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/audio-context

**Contents:**
- # uni.createInnerAudioContext()
  - # createInnerAudioContext 兼容性
      - 本页导读

创建并返回内部 audio 上下文 innerAudioContext 对象。

innerAudioContext 对象的属性列表

innerAudioContext 对象的方法列表

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
innerAudioContext
```

Example 2 (unknown):
```unknown
uni.createInnerAudioContext()
```

Example 3 (javascript):
```javascript
const innerAudioContext = uni.createInnerAudioContext();
innerAudioContext.autoplay = true;
innerAudioContext.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
innerAudioContext.onPlay(() => {
  console.log('开始播放');
});
innerAudioContext.onError((res) => {
  console.log(res.errMsg);
  console.log(res.errCode);
});


**当出现-99错误时** 可以按照下面思路进行排查：

```javascript
// 多次会调用播放新的文件时，提前销毁实例，可避免-99错误
if (innerAudioContext) {
  try {
    innerAudioContext.pause();
    innerAudioContext.destroy()
    innerAudioContext = null
  } catch (e) {
    //TODO handle the exception
  }
}
```

Example 4 (javascript):
```javascript
const innerAudioContext = uni.createInnerAudioContext();
innerAudioContext.autoplay = true;
innerAudioContext.src = 'https://web-ext-storage.dcloud.net.cn/doc/uniapp/ForElise.mp3';
innerAudioContext.onPlay(() => {
  console.log('开始播放');
});
innerAudioContext.onError((res) => {
  console.log(res.errMsg);
  console.log(res.errCode);
});


**当出现-99错误时** 可以按照下面思路进行排查：

```javascript
// 多次会调用播放新的文件时，提前销毁实例，可避免-99错误
if (innerAudioContext) {
  try {
    innerAudioContext.pause();
    innerAudioContext.destroy()
    innerAudioContext = null
  } catch (e) {
    //TODO handle the exception
  }
}
```

---

## uni.openLocation(OBJECT) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/open-location.html

**Contents:**
- # uni.openLocation(OBJECT)
  - # openLocation 兼容性
- # 三方定位和地图服务收费说明
      - 本页导读

使用应用内置地图查看位置。openLocation会使用项目配置的地图服务商来展示地图，地图服务商支持情况参考：map组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

**Examples:**

Example 1 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

Example 2 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

Example 3 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

Example 4 (javascript):
```javascript
uni.getLocation({
	type: 'gcj02', //返回可以用于uni.openLocation的经纬度
	success: function (res) {
		const latitude = res.latitude;
		const longitude = res.longitude;
		uni.openLocation({
			latitude: latitude,
			longitude: longitude,
			success: function () {
				console.log('success');
			}
		});
	}
});
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/system/ibeacon.html

**Contents:**
- # uni.onBeaconServiceChange(CALLBACK)
- # uni.onBeaconUpdate(CALLBACK)
- # uni.getBeacons(OBJECT)
  - # 错误
- # uni.startBeaconDiscovery(OBJECT)
  - # 错误
  - # 示例代码
- # uni.stopBeaconDiscovery(OBJECT)
  - # 错误
- # IBeaconInfo

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

Example 2 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

Example 3 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

Example 4 (unknown):
```unknown
uni.startBeaconDiscovery({
  success(res) { }
})
```

---

## 插屏广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/a-d/interstitial.html

**Contents:**
  - # 插屏广告
      - 本页导读

---

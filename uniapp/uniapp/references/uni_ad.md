# Uniapp - Uni Ad

**Pages:** 20

---

## 视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-video.html

**Contents:**
- # 视频广告
  - # 简介
  - # 广告事件监听
      - 本页导读

开发者可以使用 ad 组件创建视频广告，ad 广告组件在创建后会自动拉取广告数据并显示。

视频广告在创建后会自动拉取广告。开发者可以通过 ad 组件的 load 和 error 事件监听广告拉取成功或失败。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

Example 2 (html):
```html
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

Example 3 (html):
```html
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

Example 4 (vue):
```vue
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

---

## uni-ad支持微信小程序广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-weixin.html

**Contents:**
- # uni-ad支持微信小程序广告
- # uni-ad的开发者使用流程
- # 不同广告类型的开发文档
- # adpid和unit-id详解
- # 微信小程序插件申请
  - # 方案一
  - # 方案二
      - 本页导读

uni-ad的申请门槛较低，对初创者更友好；微信申请流量主需要小程序日活过千

uni-ad可以一套代码全端变现，包括app、web、微信小程序；wx广告仅支持微信小程序

两者均支持banner/信息流、激励视频、插屏。wx广告多支持一个开屏广告

有高有低，不同小程序cpm不同，需要开发者测试比较

相比微信自带流量主广告，uni-ad开发者可以申请相对更短的结算周期和垫资服务。具体扫码加企业微信咨询。

uni-ad内置了安全防护策略，减少广告被刷风险

3.6.8+ 支持激励视频服务器安全回调，详情

服务器回调用于业务系统判断是否提供奖励给观看广告的用户。配置服务器回调后，当用户成功看完广告时，uniCloud 服务器会访问配置的云函数，通知用户完成观看激励视频。 相对来讲服务器回调将更加安全

uni-ad由开发者在DCloud网站uniad.dcloud.net.cn 申请，开发者与DCloud开票结算；而wx广告在微信小程序后台申请，开发者与微信开票结算

两者在开发时，都使用相同的组件，比如<ad>组件、<ad-rewarded-video>组件，但uni-ad的组件属性是adpid（广告位id的缩写），微信小程序的组件属性是unit-id。

注意：微信小程序平台暂不提供测试广告位，开发期间也可以预览广告效果，以真机效果运行为准

详细开发文档地址：https://uniapp.dcloud.net.cn/uni-ad/ad-component.html

详细开发文档地址：https://uniapp.dcloud.net.cn/uni-ad/ad-rewarded-video.html

详细开发文档地址：https://uniapp.dcloud.net.cn/uni-ad/ad-interstitial.html

<ad>（banner/信息流）、<ad-rewarded-video>（激励视频）、<ad-interstitial>（插屏）是uni-app框架的内置的3个广告组件。

其中<ad>组件同时支持uni-ad广告和wx广告，而其他2个广告组件仅支持uni-ad广告。开发wx广告的激励视频和插屏需要通过js api而不是组件方式。

在<ad>组件上可以同时写adpid和unit-id，区别如下：

adpid和unit-id可以同时设置。adpid优先级高于unit-id，如果没有开通uni-ad或网络失败则切换为wx广告，这个过程会有3秒的间隔

例子： 如果想在微信上仅使用微信的广告，App 或 Web 使用 uni-ad 可使用条件编译，如下

示例源码如下，请查看 pre > code 标签中的内容

在 HBuilderX 运行到微信开发者工具，在微信的开发者工具调试控制台会输出申请插件的链接，点击后弹出申请确认框，然后点击 确定 按钮

登陆微信公众平台 https://mp.weixin.qq.com/ ，点击左侧栏底部[小程序名称] -> 账号设置，然后找到顶部页签 第三方设置，向下滚动屏幕到 插件管理, 点击 添加插件 按钮，搜索 uniAD并添加

**Examples:**

Example 1 (unknown):
```unknown
<ad-rewarded-video>
```

Example 2 (jsx):
```jsx
<ad adpid=""></ad>
```

Example 3 (unknown):
```unknown
<ad-rewarded-video>
```

Example 4 (unknown):
```unknown
<ad-interstitial>
```

---

## 财务结算常见问题 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/faq/payment-faq.html

**Contents:**
- # 财务结算常见问题
  - # 最低多少收益可以进行提现？
  - # 我的收益什么时候可以开始结算？
  - # 我的申请提现按钮为什么不能点？
  - # 点击提现后我该怎么办？
  - # 已申请提现并上传电子发票/开通云账户，多久可以到账？
  - # 如何设置云账户？
  - # 支持电子发票吗？在那上传电子发票？
      - 本页导读

上月收益10号左右出预估账单，16号左右出确认账单，开发者可以申请提现，上传完电子发票后，每月4,19号开始审核打款。

上月账单确认完成后，在账单记录页面勾选账单列表左侧小方框后点击提现按钮

每月 2 个结算日（4 号和 19 号，节假日顺延）。收到发票后最近结算日打款，未结算费用自动转下月。

---

## 沉浸视频流广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-draw.html

**Contents:**
- # 沉浸视频流广告
  - # 简介
  - # 适用场景
      - 本页导读

沉浸视频流广告为媒体提供了竖屏视频信息流广告样式，适合在全屏的竖屏视频中使用。支持app-nvue页面使用。

类抖音的竖版视频流，来电秀、直播间等全屏观看的视频。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

沉浸视频流广告不是激励视频广告，激励视频广告另见：https://uniapp.dcloud.io/uni-ad/ad-rewarded-video

**Examples:**

Example 1 (html):
```html
<template>
  <!-- 仅nvue页面支持 -->
  <!-- 必须指定ad-draw的宽度和高度，否则大小全屏 -->
  <view class="container">
    <ad-draw class="ad-draw" adpid="1507000690"></ad-draw>
  </view>
</template>

<script>
  export default {
    data() {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style>
  .container {
    flex: 1;
  }

  .ad-draw {
    flex: 1;
    width: 750rpx;
  }
</style>
```

Example 2 (html):
```html
<template>
  <!-- 仅nvue页面支持 -->
  <!-- 必须指定ad-draw的宽度和高度，否则大小全屏 -->
  <view class="container">
    <ad-draw class="ad-draw" adpid="1507000690"></ad-draw>
  </view>
</template>

<script>
  export default {
    data() {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style>
  .container {
    flex: 1;
  }

  .ad-draw {
    flex: 1;
    width: 750rpx;
  }
</style>
```

Example 3 (html):
```html
<template>
  <!-- 仅nvue页面支持 -->
  <!-- 必须指定ad-draw的宽度和高度，否则大小全屏 -->
  <view class="container">
    <ad-draw class="ad-draw" adpid="1507000690"></ad-draw>
  </view>
</template>

<script>
  export default {
    data() {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style>
  .container {
    flex: 1;
  }

  .ad-draw {
    flex: 1;
    width: 750rpx;
  }
</style>
```

Example 4 (vue):
```vue
<template>
  <!-- 仅nvue页面支持 -->
  <!-- 必须指定ad-draw的宽度和高度，否则大小全屏 -->
  <view class="container">
    <ad-draw class="ad-draw" adpid="1507000690"></ad-draw>
  </view>
</template>

<script>
  export default {
    data() {
      return {
      }
    },
    methods: {
    }
  }
</script>

<style>
  .container {
    flex: 1;
  }

  .ad-draw {
    flex: 1;
    width: 750rpx;
  }
</style>
```

---

## app各广告渠道差异 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-channel-diff.html

**Contents:**
- # app各广告渠道差异
  - # app广告各渠道开通差异
  - # 广告渠道支持的应用商店列表
  - # app广告支持的广告位类型
  - # 渠道优先级说明
      - 本页导读

注意：如应用未上架可以开通快手、章鱼、泛连、华夏乐游渠道，但广告可能会因为填充率不高而无法显示广告。

iOS应用商店地址统一为：https://apps.apple.com/cn/...

**Examples:**

Example 1 (yaml):
```yaml
https://apps.apple.com/cn/...
```

---

## 开屏广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-splash.html

**Contents:**
- # 开屏广告
  - # 简介
      - 本页导读

开屏广告是一种在应用启动时且在应用主界面显示之前需要被展示的广告

---

## Grid 广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-grid.html

**Contents:**
- # Grid 广告
  - # 简介
  - # 广告事件监听
      - 本页导读

开发者可以使用 ad 组件创建 Grid 广告组件，Grid 广告组件在创建后会自动拉取广告数据并显示。

Grid 广告在创建后会自动拉取广告。开发者可以通过 ad 组件的 load 和 error 事件监听广告拉取成功或失败，可以通过 close 事件监听广告被关闭。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

Example 2 (html):
```html
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

Example 3 (html):
```html
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

Example 4 (vue):
```vue
<template>
  <view class="adContainer">
    <ad adpid="xxxx" @load="adLoad" @error="adError"></ad>
  </view>
</template>
```

---

## uniMP激励视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/unimp.html

**Contents:**
- # uniMP激励视频广告
- # 简介
- # 开通流程
- # 5+ App
- # Q&A
- # 打包注意事项
      - 本页导读

为了给开发者提供更高价格的广告，uni-ad 推出了高阶游戏广告预算。目前这种广告主预算只支持激励视频广告位

利用 uni-ad 多层调度策略动态调整渠道，在设备无广告时自动调整为其他广告渠道以增加广告填充率

uniMP激励视频广告 支持已上架微信开放平台的应用和未上架的应用:

激励视频广告位必须开启服务器回调 ，且回调测试请求响应正确的格式。

返回 JSON 对象，且包含 isValid: true

示例源码如下，请查看 pre > code 标签中的内容

5+ App 支持 uniMP激励视频广告，开通流程和 uni-app 一致，同时也需要开启服务器回调，开通服务器回调时填写业务服务器HTTP地址即可

Q: 为什么通过uni-ad接入跳转微信而不是开发者自行接入

A: uni-ad 多层调度策略动态调整渠道，在检测微信无广告时自动在一定时间整为其他广告渠道，不在跳转到微信，提示用户体验及增加广告填充率

注意：3.7.12 之前的版本首次开启此功能需要整包更新，3.7.12之后版本支持WGT热更新

**Examples:**

Example 1 (unknown):
```unknown
uniMP激励视频广告
```

Example 2 (yaml):
```yaml
isValid: true
```

Example 3 (json):
```json
{
  "isValid": true
}
```

Example 4 (json):
```json
{
  "isValid": true
}
```

---

## uni-ad微信小程序广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-weixin-dcloud.html

**Contents:**
- # uni-ad微信小程序广告
  - # 简介
  - # 微信小程序广告开通指南
    - # 创建小程序应用
  - # 开通广告
  - # 广告代码集成
  - # 广告报表查看
- # uni-ad微信小程序流量主代运营广告
  - # 简介
  - # 开通流程

uni-ad的微信小程序广告目前支持uni-app，以及原生开发的小程序进行变现。广告形式有：Banner，视频广告，插屏，激励视频，格子广告，互动红包（仅支持企业用户）。 各广告形式的代码开发文档如下：

视频广告 （HBX3.7.0+版本） 大横幅展示，品牌广告主预算，收益比信息流广告高

激励视频广告 激励视频是收益最高的广告形式，建议小程序一定要开启

uni-ad微信小程序由于升级，目前暂不支持个人微信小程序的申请。升级期间企业和个体工商户类型微信小程序不受影响。

整体流程：创建小程序应用 -> 开通广告 -> 资质审核 -> 广告代码集成 -> 查看报表

进入 uni-ad 广告联盟后台（https://uniad.dcloud.net.cn ） ，使用DCloud开发者账号登陆广告联盟管理后台，点击左侧菜单栏【广告设置】，点击页面上面的“创建应用”按钮，如页面已存在相关应用则不需要重复创建

如果你的小程序是uni-app开发，请选择“uni-app应用”。如果是原生小程序开发，请选择“原生应用”。输入小程序的实际名称，点击“创建应用”

创建好后，在列表中选择一个小程序应用，点击最后的按钮“应用详情”

打开页面后，进入到微信小程序广告Tab页面，点击“申请微信小程序广告”

输入微信小程序APPID、微信小程序名称，最后点击“确认开通”。

当您的微信小程序是审核通过状态，广告才可正常展示。届时您可以开始根据广告的开发文档进行调试。

微信小程序广告的数据报表请登录uni-ad后台，左侧菜单栏的【数据收益】进行查看，微信小程序广告数据放在小程序广告数据Tab页面，可单独查看。

DCloud是微信官方核准的广告代运营服务商，代运营是微信给开发者和服务商之间搭建的合作方案。

开发者可以通过代运营的方式将微信小程序流量主广告的变现委托给uni-ad。这样uni-ad可以聚合微信流量主及uni-ad的其他广告源，进行综合比价，给予开发者更高的变现收益。

同时uni-ad还会提供模板、激励视频防刷等易用性、安全性方面的增值服务，帮助开发者更好的做变现。

如果您之前未开通微信流量主，通过本流程授权代运营后，uni-ad也会帮您开通微信流量主，然后和uni-ad的其他广告进行整体聚合比价。

代运营授权完成后uni-ad系统会自动检测该小程序是否已开通微信流量主广告。如未开通且符合条件，uni-ad会自动开通微信流量主广告，如果检测不通过，uni-ad会提示错误原因。

开发者通过HBuilder X 4.82+ (Alpha版本) 重新发布微信小程序

然后授权uni-ad流量主代运营后，uni-ad会针对以上广告位创建流量主广告位，名称为：uni-ad-[广告位名称]，开发者如已使用以上广告位adpid，则不需要修改对应代码，重新发布小程序即可。

如遇到任何问题请联系uni-ad运营或邮件uniad@dcloud.io解决，谢谢。

**Examples:**

Example 1 (unknown):
```unknown
HBuilder X 4.82+ (Alpha版本)
```

Example 2 (unknown):
```unknown
HBuilder X 4.82+ (Alpha版本)
```

Example 3 (unknown):
```unknown
uni-ad-[广告位名称]
```

---

## uni统计2.0 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-stat-v2.html

**Contents:**
- # uni统计2.0
- # demo体验
- # 产品特色
- # uni 统计老版升级建议
- # 环境要求
- # 使用教程
  - # 前端采集配置
    - # 小程序域名白名单
    - # 调试模式
  - # 后台报表配置

uni统计2 是开源、全端、云端一体、更适合uni-app的统计平台。

体验系统：https://hellouniadmin.dcloud.net.cn/

注：uni统计内置在uni-admin 中，体验系统的数据会定期重置。

无需开发，在manifest的 uni统计 中打勾并发行，在uniCloud 服务空间部署uni-admin ，即可查看报表。

同时开发者也可以自定义打点数据、自定义展现报表。

全端流量统计，一张报表可查看所有端（iOS、Android、Web 及各家小程序）的运营数据。

无需在各端接不同的sdk、无需在不同报表看数据。目前市面已知唯一一个一张报表看遍业务全景的方案。

代码全部开源。采集什么数据可以自定义；跑批频率可以自定义（搞活动时实时统计都可以做到）；展示报表可以自定义。

使用传统saas类统计产品，所有数据都上报给统计服务厂商。

uni统计2.0基于uniCloud实现，云函数、统计数据全部托管在开发者自己的服务空间（阿里云或腾讯云自选）中，开发者对自己的统计数据拥有完整的控制权。

传统App统计平台，都没有js错误统计。开发者无法了解到自己的js代码在哪些设备上会报错。

uni统计的错误信息更全面，包括 js前端错误和 App 原生层的崩溃。

因为uni-app是编译后运行，传统web和小程序的统计平台，其js报错无法回溯到uni-app的编译前源码，报错看不懂。

uni统计支持sourcemap，可直观了解到底哪行代码写的有问题。详见

6. 更适合uni-app和uniCloud

uni统计深入uni-app和uniCloud框架底层，提供了众多其他统计平台无法提供的功能：

uni统计的开源且基于uni-admin 的插件规范提供了插件机制，会有更多插件作者提供各种丰富的统计插件（如电商统计、内容统计等）。见插件市场

DCloud非常重视数据驱动开发者业务的增长，近期联合专业的大数据服务商神策和阿拉丁共同完善Uni统计2.0的产品模块和生态建设。 如果你对数据分析有任何需求，欢迎您填写需求调研问卷，我们会根据您的宝贵建议，在原有Uni统计产品的基础上，完成迭代更新。

对于使用uni统计1.0的开发者，推荐尽快升级到uni统计2.0。uni统计1.0将不再更新维护。

在业务App项目的 manifest.json 里，选择 uni统计配置 项，根据需求，选择开通 uni统计 ，勾选 2.0 开启新版统计。

上述可视化操作，其实对应manifest源码视图的 uniStatistics 节点。如下文档对manifest规范进行详述。如不关心规范细节，可以不阅读本小节，继续看下一节《小程序域名白名单》。

uniStatistics 下的 enable 字段设置为 true|false，来开启关闭 uni统计

设置 version 属性为 "2" 来开启新版统计

示例源码如下，请查看 pre > code 标签中的内容

uniStatistics 支持分平台设置，比如仅开启微信小程序平台的 uni统计，则在 manifest.json mp-weixin节点下设置 uniStatistics ->enable 即可，如下：

示例源码如下，请查看 pre > code 标签中的内容

由于各家小程序对可访问的域名要配置白名单，否则无法联网。所以需要发布小程序时需要在各厂商的小程序管理后台配置域名白名单。

部署uni统计时可以选择使用uniCloud的阿里云版或腾讯云版，不同云厂商对应的域名不同（文章后面章节会有服务空间相关配置）

根据选择的uniCloud云厂商，配置相应的域名到小程序的域名白名单配置里即可。

将 manifest.json -> uniStatistics 下的 debug 字段设置为 true|false ，来开启关闭 uni统计调试模式

在调试模式下，会将上报数据的关键信息打印到控制台，方便观察采集信息是否正确 ，多用在自定义扩展的时候

示例源码如下，请查看 pre > code 标签中的内容

uni统计2.0的后台统计报表是uni-admin 的内置插件。

uni-admin 是一个开源管理后台。也就是使用uni统计2.0，需要安装这个后台系统，在里面找到uni统计的菜单并使用。

目前安装uni-admin的方式分为两种：一键部署 和 手动安装。

一键部署uni-admin仅需要前往插件市场 搜索找到uni-admin插件后，选择进入uni-admin插件详情页 并点击在线体验/部署按钮，选择部署在我的服务空间，然后选择需要部署uni-admin项目的服务空间后耐心等待系统自动部署完成即可。

手动安装uni-admin则请参考uni-admin 文档，完成如下操作：

如您需要统计的业务之前已经使用了uni-admin，可以升级uni-admin。对项目下的package.json点右键，选择「从插件市场更新」。

更新时注意合并pages.json，确保新页面都注册成功。否则运行起来后，点击左侧菜单会报找不到xxx文件。

db_init.json初始化数据库时，老项目的菜单表opendb-admin-menus，已经有数据了，此时key冲突的数据无法插入，需要手工合并。

uni统计2.0中定时任务云函数（uni-stat-cron）的默认触发周期为每小时触发一次（即：每隔1小时，系统会自动触发一次uni-stat-cron云函数）。

你可以根据需要修改定时任务云函数（uni-stat-cron）的触发周期到分钟级(即每隔n分钟触发一次)，但要注意触发周期修改后，需要确保定时任务配置项中设置的分钟数是否会被触发，比如你的配置项中设置的是每小时的第10分钟触发（表达式：* * * 10），而定时触发器设置的为每20分钟触发1次（0 1/20 * * * * *），那这个配置项将永远不会触发。

示例源码如下，请查看 pre > code 标签中的内容

开启redis缓存后可以降低数据库查询压力，提升uni统计性能，可按需决定是否开启。

开启redis缓存前，需要先确认是否已在布署uni统计的服务空间内购买redis服务，如果没有购买则需要先购买redis服务。

配置uni-stat-receiver的redis拓展库

配置uni-stat-cron的redis拓展库

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了让用户端App采集到的数据，可以被uni-admin中的云函数正确接收并统计，需保证用户端项目和admin项目，关联同样的服务空间。

此功能只支持 web平台、App平台、微信小程序平台

为方便开发者使用 sourceMap 文件定位代码问题，增加在统计中使用 sourceMap 错误解析功能。

线上运行端在各种用户环境下可能会有报错，需要开发者统计和分析。但三方统计系统（如友盟、阿拉丁、百度），对运行端的报错采集，提示的是uni-app编译器编译后的代码报错的行数，相当于乱码，无法告知开发者是uni-app的vue或js的哪一行代码报错。

uni统计的sourceMap功能可以解决这一问题，在统计后台可以清晰的看到报错的环境和准确的报错代码，是uni-app编译前的vue或js的具体信息。

在 HBuiderX 中生成 sourceMap 文件

web 平台在发行-> 网站时，勾选 生成 sourceMap 选项。

App 平台在发行 -> 原生App-云打包时，勾选 生成 sourceMap 选项。

微信小程序平台在发行 -> 小程序-微信时，勾选 生成 sourceMap 选项。

cli 项目生成 sourceMap 文件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

项目编译完成后，可在 /unpackage/dist/build/.sourcemap 中查看到生成的各平台的 sourceMap 文件。

由于微信小程序平台上传发布后，会再压缩打包一次，所以需要额外一个步骤：

注意：2.3.4+ 的版本同时支持阿里云和腾讯云空间。

将 uni-admin 项目运行到浏览器中，在 uni 统计 / 错误统计 / js报错 页面，错误信息列表表格的右上角有 上传 sourceMap 按钮。点击后展示如下：

点击 选择文件并上传 按钮，弹出 选择文件夹 框后，请选中编译的对应该平台版本的 sourceMap。如：项目根目录/unpackage/dist/build/.sourcemap/h5，选中 h5 目录后点击上传。如果中途上传失败，在不刷新页面的情况下，重新选择文件夹上传可以跳过已上传文件。

uni-admin 2.3.4 之前的版本

注意：2.3.4 之前的版本只支持腾讯云空间，不支持阿里云空间。

在 uni-admin 项目/admin.config.js 中配置 uni-stat 相关信息：

将 uni-admin 项目运行到浏览器中，在 uni 统计 / 错误统计 / js报错 页面，错误信息列表表格的右上角有 上传 sourceMap 按钮。点击后展示如下：

点击 选择文件并上传 按钮，弹出 选择文件夹 框后，请选中编译的对应该平台版本的 sourceMap。如：项目根目录/unpackage/dist/build/.sourcemap/h5，选中 h5 目录后点击上传。如果中途上传失败，在不刷新页面的情况下，重新选择文件夹上传可以跳过已上传文件。

文件夹内容会上传至 云存储/__UNI__/uni-stat/sourcemap/应用 appId/平台（如：web、mp-weixin、ios）/版本/ 目录下

在 uni 统计 / 错误统计 / js报错 页面，错误信息列表表格中，点击表格行中右侧 详情按钮 即可在弹窗中查看解析后错误信息。

数据上报间隔默认是 10s 上报一次 ，在上报间隔内，会将每次上报节点的数据加入统计数据队列，10s后会在下一个上报节点，统一对数据队列进行一定的处理进行上报。

为节约服务端资源，前端采集到的数据按固定周期上报。所以上报请求不是时实发生的。

HBuilderX 3.5.4或更高版本 可以根据自己的业务需求调整上报周期 ，在 uni统计配置 -> 前端数据上报周期 中修改即可 ，为节约服务端资源，建议填写范围为 5-20 之间。

除了以上两种情况 ，其他情况都不会发生数据上报,包括 App 真机运行时（含自定义基座），崩溃和错误数据

访问开始即启动程序，访问结束结分为：进入后台超过5min、在前台无任何操作超过30min、新的来源程序

应用进入后台时，在 SDK 中是应用的 onHide 生命周期触发

页面跳转时上报，在 SDK 中是页面的 onHide 生命周期触发

为了突出目标，仅注释出 uni 统计相关的文件夹及文件，其余与普通 uni-app 项目相同。新增页面可参考 uni-stat 中相似页面。

示例源码如下，请查看 pre > code 标签中的内容

注意：uni统计公共模块依赖于 uniCloud配置中心（uni-config-center）

示例源码如下，请查看 pre > code 标签中的内容

uni统计配置项存放于uniCloud配置中心（uni-config-center）下的 uni-stat/config.json文件中，用户可根据自身系统需要自定义各配置项的值。

注意：修改uni统计配置项后需要重新上传公共模块uni-config-center后才会生效。

cron 参数用于配置定时任务触发时间，一般无需修改此项。

目前定时任务类型有（以下括号内的内容表示开启分钟级统计后定时任务的触发时间）：

retention-device：设备留存数据统计，统计维度包括：

retention-user：用户留存数据统计，统计维度包括：

active-device：活跃设备数据归档，统计维度包括：

active-user：活跃用户数据归档，统计维度包括：

page-detail：页面内容统计，统计维度包括：

pay-result：支付数据结果统计，统计维度包括：

errorCheck参数用于在规定时间内限制相同的错误日志写入数据库，防止有高频错误产生时造成大量的数据库写入操作，可按需开启或关闭。

cleanLog参数用于配置定时清理过期的日志，减少数据库数据的存储量，提升uni统计性能。

uni统计提供了基础的数据报表，如不能达到预期的数据采集，可以在客户端通过 uni.report(eventKey,param) 自由上报数据 ，并通过 uni-admin 增加页面 ，自行统计数据。

这里列出 uni.report(eventKey,param) 的基本用法，完整API查看：详情

uni.report(eventKey,param) 有两个参数。

示例源码如下，请查看 pre > code 标签中的内容

在 uni-admin 中新增页面，使用 uniCloud API 获取所有 uni-report 上报的原始数据，数据存放于 uni-stat-event-logs 表中。

示例源码如下，请查看 pre > code 标签中的内容

不管是新上报的数据，还是opendb 的数据、或者开发者自己的业务数据库里的数据，都可以自己编写报表进行统计分析。

与普通uni-app页面一样，新建页面，编写代码。

在uni-admin中注册左侧菜单时，需要参考文档：uni-admin 左侧窗口-菜单栏

uni-admin1.9.0版本开始（对应HBuilderX 3.5.1），uni统计和uni升级中心复用相同的应用版本表（即opendb-app-versions表） ，废弃原来的uni-stat-app-versions表。

如果你已启用uni统计2.0，但使用的是老版本的uni-admin，则需注意版本表的迁移升级，否则基于版本的统计数据可能不准确。

示例源码如下，请查看 pre > code 标签中的内容

uni-admin2.4.0 版本开始，新增了内容统计，可以通过设置页面规则进行内容统计。内容统计模块默认处于关闭状态，开启内容统计后会增加大量的数据库读写次数，请按需开启。开启内容统计的方式，可参考公共模块配置项说明。

如果升级uni-admin后，你的uni统计没有出现内容统计的菜单，则点击菜单管理里的【更新内置菜单】按钮即可（需uni-admin版本>=2.4.0）

uni-admin2.4.24 版本开始，新增了对App-Harmony（即鸿蒙App）平台的统计。

若您部署过uni-admin2.4.24之前的版本，需要先将uni-admin升级到2.4.24之后的版本。

在uni-admin项目中添加App-Harmony服务平台

如果您在uni-admin项目中，无法找到App-Harmony平台，您需要在HBuilderX中，找到uni-admin项目根目录/uniCloud/database/JQL查询.jql文件，添加以下jql语句并运行。

示例源码如下，请查看 pre > code 标签中的内容

升级HBuilderX至4.33+，重新打包、发布您要统计的应用

uni-admin项目更新后，即可正常接收和统计App-Harmony平台的相关数据。此外，您还需要升级uni统计2.0的前端采集SDK，采集数据才能正常上报，即需要将HBuilderX版本升级至4.33+后，重新打包发布您要统计的应用。

uni-admin2.4.25 版本开始，新增了对鸿蒙元服务平台的统计。

若您部署过uni-admin2.4.25之前的版本，需要先将uni-admin升级到2.4.25之后的版本，升级uni-admin项目的方法，可参考上方升级到2.4.24+ 含鸿蒙平台的版本中的说明。

在uni-admin项目中添加鸿蒙元服务平台

如果您在uni-admin项目中，无法找到鸿蒙元服务平台，您需要在HBuilderX中，找到uni-admin项目根目录/uniCloud/database/JQL查询.jql文件，添加以下jql语句并运行。

示例源码如下，请查看 pre > code 标签中的内容

升级HBuilderX至4.33+，重新打包、发布您要统计的应用

uni-admin项目更新后，即可正常接收和统计鸿蒙元服务平台的相关数据。此外，您还需要升级uni统计2.0的前端采集SDK，采集数据才能正常上报，即需要将HBuilderX版本升级至4.33+后，重新打包发布您要统计的应用。

近期，uniCloud阿里云版开始正式商用，部分开发者对基于uniCloud的uni统计等云端一体业务，开始纠结，不清楚这些业务预计会花费多少钱，不清楚相比传统服务器而言，何种方案性价比更好。

本文尝试算细账、算总账，以阿里云按量计费 为例，详细预测uni统计在不同用户规模下的资源消耗及对应费用，帮助大家明智选择，无忧开发。

接下来，我们对不同资源，分别进行费用评估。

启用uni统计后，你的每一个在线用户默认每10秒会请求一次uni-stat-receiver云函数（如果你的日活在1万以上，可以改成60秒，可以减少费用。时间间隔可在manifest.json内设置，如果用户一直停留在一个页面，那么此时不会重复上报）

我们按照uniCloud官网 列出的按量计费规则，计算一下云函数的资源消耗。

云函数/云对象费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，若有100个日活用户，其uni统计的uni-stat-receiver云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

即：你的App日活为100，使用uni统计商业版后，uni-stat-receiver云函数每天大概消耗0.0032元。

据此，可计算其每月的费用为：0.0032 * 30 ≈ 0.1，即日活为100时，每月uni-stat-receiver云函数只需0.1元。

同理，我们可推导出日活为1000、10000、10万的App，其uni-stat-receiver云函数每月费用如下表：

uni统计还有一个云函数uni-stat-cron，它是定时数据跑批任务，用来将上报的数据进行统计，生成统计报表。

其uni统计的uni-stat-cron云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

即：你的App日活为100，使用uni统计商业版后，uni-stat-receiver云函数每天大概消耗0.0014元。

据此，可计算其每月的费用为：0.0014 * 30 ≈ 0.04，即日活为100时，每月uni-stat-receiver云函数只需0.04元。

同理，我们可推导出日活为1000、10000、10万的App，其uni-stat-receiver云函数每月费用如下表：

由于uni-stat-cron云函数不管多少日活，每日均只运行24次，故日活对其费用的影响很小（只影响了每次运行的时长）。

按照uniCloud官网 介绍，云数据库费用 = 容量费用 + 读操作次数费用 + 写操作次数费用，其中：

uni统计会产生大量的日志数据，但默认会有自动清除历史日志的策略，如：会话日志31天前的数据会被删除。

由于uni统计涉及数据库的情况非常复杂，我们通过对官方统计示例项目的实际运行数据得出以下结果：

日活为100的应用，uni统计数据库资源用量如下：

因为数据源只保留31天，故稳定运行后，数据量容量一直会保持在31天的量。故下方公式中云数据库容量需要乘31

示例源码如下，请查看 pre > code 标签中的内容

即：如果你的uni统计业务日活为100，使用阿里云商业版云服务空间后，对应数据库每天大概消耗0.0141元。 据此，可计算其每月的费用为：0.0141 * 30 ≈ 0.42，即日活为100时每月云数据库只需0.42元。

redis只影响数据库的读操作，通过官方统计示例项目使用redis的前后对比可知redis大概可以减少2/3的数据库读操作次数（等于减少2/3的数据库读次数费用）。

由此可见，当日活低于10万时，redis减少的费用还不太明显。但当日活大于10万时，redis的作用越来越明显。

uni统计需要和uni-admin配合使用，uni-admin需要部署在前端网页托管中。uni-admin主要是管理员使用，使用频次较少，流量也较低。

按照uniCloud官网 介绍，前端网页托管费用 = 容量费 + 流量费。

uni-admin编译后为4.7M，按照官网每GB每天0.0043元的规则，uni-admin的月度容量费为：4.7 / 1024 * 0.0043 * 30 = 0.00059，不到1分钱，可忽略。

管理员登录uni-admin，到uni统计管理页面浏览统计数据，所需流量不超过3M，即使每月发布2次更新，流量费预估为：3 / 1024 * 0.18 * 2 = 0.00105，也不到1分钱，也可忽略。

细项对比完了，我们来合并看看，使用uni统计，每月到底需要花多少钱。

使用uni统计，免费获取、一键安装，你将获得：

全端流量统计，一张报表可查看所有端（iOS、Android、Web 及各家小程序）的运营数据。

无需在各端接不同的sdk、无需在不同报表看数据。目前市面已知唯一一个一张报表看遍业务全景的方案。

代码全部开源。采集什么数据可以自定义；跑批频率可以自定义（搞活动时实时统计都可以做到）；展示报表可以自定义。

使用传统saas类统计产品，所有数据都上报给统计服务厂商。

uni统计2.0基于uniCloud实现，云函数、统计数据全部托管在开发者自己的服务空间（阿里云或腾讯云自选）中，开发者对自己的统计数据拥有完整的控制权。

传统App统计平台，都没有js错误统计。开发者无法了解到自己的js代码在哪些设备上会报错。

uni统计的错误信息更全面，包括 js前端错误和 App 原生层的崩溃。

因为uni-app是编译后运行，传统web和小程序的统计平台，其js报错无法回溯到uni-app的编译前源码，报错看不懂。

uni统计支持sourcemap，可直观了解到底哪行代码写的有问题。详见

再次说回uni统计，通过上面的费用测算可得知，以日活1万来说，每个日活产生的一年的费用大概是6分钱到7分钱之间，这个费用已经是比较便宜的了。

目前市面上的统计如友盟统计也是收费的，在日活达到1万时，每年费用需要3109元/年（且这还只是web统计的费用，APP统计另算费用）。同时它还不是源码版本，代码不开源，无法随意定制。

而uni统计是全平台统计、代码开源、随意定制，这是三方统计平台做不到的。

再看回刚才的计算表，以日活1万来说，uni统计每年费用只需53.31*12=639.72元/年。

不重复制造轮子，聚焦业务，快速验证模式，实现商业增长，才应该是聪明工程师的追求。

因为uni统计2.0的统计数据最小颗粒度为小时数据（即每小时统计上一个小时的数据），所以，在上报数据后一个小时左右，方可在uni-admin管理后台看到统计数据。若想在测试阶段快速看到统计数据，可在uni-admin项目下创建一个云函数，并在HBuilderX中右键关联uni-stat公共模块，然后复制下方示例代码至测试云函数中，按需修改任务类型、运行时间、批次类型等参数后，在HBuilderX中右键云函数目录，选择本地运行云函数即可。

示例源码如下，请查看 pre > code 标签中的内容

在HBuilderX中找到需要统计的项目，点击根目录下的mainifest.json文件，然后点击源码视图，找到最外层的uniStatistics节点（注意是最外层的uniStatistics节点，不是各平台节点下的uniStatistics节点！），并在此节点添加uniCloud配置项。配置项中有关服务空间的配置信息，可登录uniCloud控制台 ，点击服务空间详情查看。

示例源码如下，请查看 pre > code 标签中的内容

答：与定时任务配置配置有关，默认统计首页、今日概况等数据为1小时后可见，其余数据为次日可见，测试期间可通过上方在开发阶段快速生成统计数据栏目中所述方法，手动触发统计任务，提前生成统计数据。想要详细了解各类型数据统计时间请参考定时任务配置说明。

答：一般情况下是不需要自行配置的，但如果定时任务云函数（uni-stat-cron）出现运行超时的情况时，就要考虑去开启分钟级定时任务了。

答：参考uni-admin 给系统创建多个登录账户并设置不同的权限

答：总设备数计算公式为：总设备数 = 原设备数 + 新设备数，而判断一个设备是否为新设备的依据是在客户端SDK中是否已储存该设备上次访问某一应用的时间，未存储则认为是该应用的新设备(即lvts=0时为新设备，lvts>0时为老设备)。 因此如果之前某一设备已经访问过某一应用，就算此时清除数据库中的数据，由于已经在客户端SDK中储存该设备上次访问应用的时间（即此时lvts > 0），所以该设备也不会再被认为是该应用的新设备从而不会再被计算进该应用的总设备数中而只会计算进活跃设备数中，此时可能就会出现总设备数小于活跃设备数的情况。

业务App 和 admin 是2个工程。业务App是采集端，admin是报表端；这两个项目均包含uni-config-center；如果这两个项目关联（复用）相同的服务空间时，很容易出现uni-config-center的互相覆盖问题；此时建议单点维护，方案有2种：

去权限管理，添加一个权限id为：READ_UNI_STAT 的权限

去角色管理，添加一个角色id为：READ_UNI_STAT 的角色

去用户管理，赋予子账号角色 READ_UNI_STAT 角色

示例源码如下，请查看 pre > code 标签中的内容

第三步：前往菜单管理，对每一个uni统计的页面（包含子页面）设置下权限 READ_UNI_STAT（菜单只有拥有对应权限才会显示）

答：此问题通常与数据收集任务 (uni-stat-cron 云函数) 执行失败有关。请按以下步骤进行排查：

答：uni统计能够产出注册用户统计数据的前提是，开通uni统计的应用与uni-admin项目关联了同一个服务空间，且用户模块使用了uni-id用户体系 ，如果你应用的用户存储在非uniCloud业务，或者没有使用uni-id用户体系 ，uni统计将无法自动统计注册用户数据。

答：因为本地调试时，默认连接的是本地云函数（即当前项目下的云函数），而接收上报数据的云函数uni-stat-receiver，存在于uni-admin项目中，不在当前项目下，所以会出现此错误，因此在本地调试时，需要在HBuilderX下方控制台选择连接云端云函数。

答：同上方常见问题10一样，一般都是因为在本地调试时，未在HBuilderX下方控制台选择连接云端云函数导致。

不掌握如下文档，很难对 uni统计2.0 吃透和做二次开发

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
uniStatistics
```

Example 4 (unknown):
```unknown
uniStatistics
```

---

## 广告开通常见问题 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/faq/ad-open-faq.html

**Contents:**
- # 广告开通常见问题
  - # 如何快速开通 uni-ad 广告联盟？
  - # DCloud 快捷广告与渠道 SDK 广告有什么区别？
  - # 为什么某个广告渠道一直在审核中？
  - # 应用没有上架应用市场能开通那些广告？
  - # 与 uni-ad 广告联盟合作是否需要合同？
  - # 我想关闭开屏广告，但经常会自动开启怎么办？
  - # 华为应用市场要求应用内广告需要增加下载二次确认
  - # 激励视频广告每日请求是否有限制？
  - # app 首次下载打开无开屏广告，偶尔也无开屏广告？

审核时间一般为 1-3 个工作日（节假日顺延）。若超时未通过，可能是材料填写不正确（如包名、详情页等），请查阅后台和邮件。如无反馈请联系运营或邮件 uniad@dcloud.io。

采用线上合同（开通即同意），详情见 uni-ad 首页。如需线下合同请联系运营或邮件 uniad@dcloud.io。

打包时不要勾选 DCloud 快捷广告，如已勾选，登录uni-ad 后台，在应用详情内关闭所有渠道的开屏广告。

"点击立即下载"为默认设置。如影响上架，建议后台关闭广告位，上架后再打开。需增加下载二次确认请联系运营，处理时间 3-5 个工作日。

一个用户每日反复观看激励视频，来领取奖励，会造成广告cpm下降、填充不足等问题。因为广告商不愿意给这个用户再投放广告了。所以一般需要限制用户每日观看激励视频的次数，如15次左右。

首次打开无开屏广告正常，偶尔无广告为填充问题。建议同时开通多个广告渠道提升填充率。

appid和包名一一对应，提交广告渠道审核后不允许变更包名，如因填写错误导致需要变更请通过uni-im 联系uni-ad商务/运营处理。

可以。只要这些三方广告sdk不与uni-ad冲突，比如它们提供了独立于uni-ad的其他广告源，开发者可以接入。

广告平台是根据广告主的意向分配广告的，在筛选数据时载体App的属性只是一个数据项，主要还是看这个设备的imei在广告平台本身的画像。 比如你的app是教育类app，但某个手机设备使用你的app时，广告平台可能发现这个设备是一个年轻女性用户，就可能匹配时尚电商的广告。 单一匹配教育类相关的广告主，很可能会轮空广告位，无法保障变现效果最大化。 uni-ad后台也提供了一定的广告源自助控制界面，比如可以过滤掉成人保健、美容医疗等广告。

其实不影响审核，带着广告上线App Store是合规的。当然也可以登录uni-ad广告联盟后台去关闭或停用广告位，这是实时的，不需要审核的。只有停止广告合作协议，才需要审核。

不需要。只有终止广告联盟进行清算，才需要人工审核，其他操作均可在uni-ad后台自助完成。 部分开发者疑惑为什么开通广告不审核，关闭广告审核。这是误解，实际情况是，开通和终止广告联盟，都需要审核。但开通联盟后，开关广告是不需要审核的。另外，大部分抱怨此问题的开发者其实根本没开通广告联盟，此时根本不需要申请终止广告联盟。

使用DCloud快捷广告，是即开即赚钱的。但渠道SDK广告不是这样。 使用渠道SDK广告后，需要打包时带上优量汇、穿山甲、快手、百度、Sigmob的原生sdk，否则渠道SDK广告不生效。也就是开发者开通渠道SDK广告，需要把带着sdk的新包，通过整包更新方式铺给用户。在用户没有全面升级到新包前，只有部分用户能为你赚钱。 推荐的方式是，尽早把渠道SDK广告所需的sdk打包进去，先把新包铺量铺下去，可以先不展示任何广告位。然后再开通和调优广告位。这样可以更早赚到更多钱。

激励视频曝光即该广告视频开始播放，但不是播放完毕，播放完毕是客户端提供了回调事件给开发者的代码，同时广告渠道服务器。 一般建议开发者在收到播放完毕的回调事件后再给予用户激励。 激励视频的点击，是指该视频广告里宣传的内容，被点击了，一般会打开一个网页或下载一个应用。

uni-ad的渠道SDK广告，必须在打包时打上对应的sdk才能使用，不会误开。DCloud快捷广告如果误开，参考这篇文章解决 http://ask.dcloud.net.cn/article/13324 遇到appid管理失误又无法联系到appid的所有者进行变更时，请向service@dcloud.io求助。

这个需要向三方广告平台提出修改应用下载提示权限。请用开发者帐号的邮箱将应用名称和APP ID邮件发送到uniad@dcloud.io，我们会协助开发者进行处理。1-3个工作日。开发者也可选择上架前在uni-ad后台临时关闭广告，审核通过后再启用。

在oppo应用市场上架的应用，https://app.cdo.oppomobile.com/home/detail?app_id=30334505 链接的等号后面加上应用在OPPO应用市场上架时获取的APPid即可。其他应用商店地址获取请参考获取应用商店地址

该功能需联系商务/运营申请开通。激励视频开启服务器回调，在服务器回调参数 里会增加cpm字段，表示千次展示收益，单位为分，除以1000则为本次观看收益。

提升应用日活到1000+以后，状态会自动变更新审核驳回，重新申请即可。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/interactive.html

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

## uni-ad广告变现 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/

**Contents:**
  - # uni-ad广告变现
  - # uni-ad的广告源
  - # uni-ad支持平台
    - # App平台
    - # 微信小程序
    - # Web/H5
  - # uni-ad优势总结
  - # 开通配置广告步骤
  - # 实时竞价 Bidding
  - # 瀑布流

uni-app 支持接入uni-ad广告联盟，开发者可实现一次开发，多端变现。

uni-ad 支持开屏、信息流、激励视频、视频流、悬浮红包、推送等丰富的广告形式；

uni-ad 聚合了全网所有主流广告源，国内包括腾讯优量汇、字节穿山甲、快手、百度、华为、Sigmob、倍孜、章鱼、泛连、聚力、华夏乐游等十几家广告源以及自有广告客户，国外包括Google、海外穿山甲pangle、unity、liftoff、inmobi、ironsource、mintegral等广告源，通过强大的议价能力、精准的数据质量、优秀的比价算法，为开发者提供了更高的广告出价。

uni-ad 利用现有十几亿活跃用户数据以及多年的技术沉淀来不断升级广告优化策略，通过更有效的匹配、更好的竞价策略、更好的分层算法，让开发者获取更高的广告收益。

uni-ad无开通门槛、提前结算、插件丰富。详见

HBuilder 3.6.7+ 或原生广告 SDK 5.0.0+版本 uni-ad 开屏、信息流、激励视频、插屏广告支持实时竞价功能。 支持多家广告（腾讯优量汇广告联盟、快手广告联盟、百度百青藤广告联盟等）参与实时竞价，展示高价格 eCPM 广告，可有效提升填充，释放运营人力，最大化流量价值。 目前系统已自动开启 Bidding 配置，无需开发者配置。

瀑布流功能，1个广告位id可配置多个渠道广告位，自动切换广告位，提高广告填充率。 如需瀑布流的配置请通过uni-im 联系uni-ad商务/运营，或发邮件至uniad@dcloud.io

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/unipush-v2

**Contents:**
- # uni-push介绍
- # 概述
- # 为什么选择uni-push 2.0
- # uni-push 2.0 使用uniCloud产生的费用说明
- # 快速上手
  - # 第一步：开通
  - # 第二步：配置
  - # 第三步：客户端操作
    - # 名词解释
      - # 离线推送

本文为uni-push 2.0（需要HBuilderX 3.5.1 及其以上版本支持）的介绍，如果旧项目需要使用老版本的uni-push 1.0，另见：uni-push 1.0

uni-push 2.0是DCloud推出的、全端的、云端一体的统一推送服务。

客户端方面，uni-push 2.0支持App、web、小程序。

服务端方面，uni-push 2.0支持uniCloud云端一体，无需再编写复杂代码轻松完成push。 （uni-push1.0仅支持使用传统服务器开发语言如php，未和客户端有效协同，流程比uni-push2.0繁琐）

uni-push还自带一个web控制台。不写代码也可以在web页面发推送。uni-push1.0的web控制台在dev.dcloud.net.cn 。uni-push2.0的web控制台是开源的，属于uni-admin插件详见 。

如果你的项目由于特殊原因不能通过uniCloud的云函数使用uni-push2.0，你希望直接通过调用个推服务器推送消息。在这种情况下：

请注意，直接调用个推服务器进行推送可能需要更多的配置和操作步骤，具体请参考调用个推服务器的相关文档。

由于手机厂商众多，他们各自都有不同的推送服务，包括Apple、google（仅能在海外使用）、华为、小米、oppo、vivo、魅族，以及还有一些没有专业推送服务的中小手机品牌。他们对App后台耗电都有查杀机制，除了微信等大应用，普通应用很难常驻后台。

如果开发者把上述每个平台的客户端和服务器的SDK都对接一遍，还自己处理没有push服务的中小品牌手机，那过于困难了。所以业内有专业的推送服务厂商把各种手机厂商的通道封装成一套统一的API，如个推（属于上市公司每日互动）；同时这些三方专业推送厂商还提供了高速socket通道。当应用在线时，也可以直接通过socket下发消息。否则开发者需要写很多判断代码、搭建socket服务器、处理在线时和离线时各种差异。

DCloud与个推（A股上市公司每日互动）深度合作，为uni-app的开发者提供了比传统方案便利甚多的统一推送方案uni-push 2.0，利用云端一体的优势，同时提供基于uniCloud的push服务器和基于uni-app的push客户端，两者高效协同，极大的简化了push的使用。

注：uni-push的服务器稳定性是由阿里云serverless、腾讯云serverless、个推来保障的，都是日活过亿的上市公司，无需顾虑稳定性。

如下图所示： 首先开发者的uniCloud应用服务器向uni-push服务器发送push消息，然后

在uni-starter 里，还提供了app push权限判断、申请、开关设置，搭配使用可以大量降低开发工作量。

注意：app申请创建通知栏消息、web申请弹出通知，均会由操作系统或浏览器自动弹窗询问用户是否同意。小程序下需要手机用户主动发起订阅行为，才能送达消息。

uni-push即降低了开发成本，又提高了push送达率，还支持全平台，并且免费，是当前推送的最佳解决方案。

uni-push 2.0本身并不收费，实际使用中需要依赖uniCloud云服务，而uniCloud价格很实惠：

一次消息推送 = 1次云函数请求 + 最高3次数据库查询（最常用的基于user_id推送仅需一次查询，详情参考：推送接口查库详解

即：最高(1 * 0.0133 + 3 * 0.015)/10000 = 0.00000583元/每次（注：给你的应用的所有注册用户群发消息算一次）

详细的计费参考：阿里云版uniCloud按量计费文档

仅APP端支持，当应用被用户关闭，或者运行到后台时，手机厂商为了省电或释放内存，会终止App后台联网。

消息将通过不会离线的手机厂商通道，下发到手机系统推送服务模块；

此时客户端会自动创建通知栏消息，展示在系统消息中心（如图所示）但客户端监听不到消息内容；当用户点击通知栏消息后，会将APP唤醒此时APP才能监听到消息内容。

当应用在线时，不会创建“通知栏消息”，此时客户端会立即监听到消息内容。

如果你希望当应用在线时，也通过“通知栏消息”来提醒用户；可以通过以下两种方式实现：

以上两种方案各有优劣，方案一更加灵活；比如：客服功能，客户端接收到聊天消息时，应用如果已经打开聊天对话页面，就直接将监听到的推送内容，渲染到页面。如果应用未打开聊天页，则调用api创建“通知栏消息”提醒用户；此时你还可以执行一些其他逻辑，比如将tabBar的消息中心加红点等。方案二比较简便，客户端无需额外编写代码，自动创建通知栏消息；但仅适用于不关心客户端行为就创建“通知栏消息”的场景，如广告营销内容的推送等。

个推的客户端类型是仅根据使用的sdk类型来判断的，分为两类：

标准基座不包含uni-push模块，如果需要使用此模块，应当在提交云打包时，项目代码中包含uni-push相关客户端api。点此 了解uni-app x的摇树机制

所以在开发调试时，需要先写一段包含uni-push相关客户端api代码，再打一个自定义基座。

示例源码如下，请查看 pre > code 标签中的内容

注意：此时由于运行的标准基座中，不包含uni-push模块，如果运行会报错，不用着急继续往下操作

接下来即可使用 uni-push 相关客户端 api

鸿蒙平台需要主动添加 APP_TRACKING_CONSENT 权限配置详见 鸿蒙支持 uniPush 推送吗，如何配置?。

操作步骤打开manifest.json - App模块配置 - 中勾选uni-push 2.0 - 重新编译项目

鸿蒙平台需要主动添加 APP_TRACKING_CONSENT 权限配置详见 鸿蒙支持 uniPush 推送吗，如何配置?。

其他小程序启用方式参考微信小程序，这里不一一列举

在manifest.json中配置完之后，需要重新编译项目，即：点击如图重新运行按钮

uni-push在web和小程序端就是个websocket；各家小程序平台，均要求在小程序管理后台配置小程序应用的联网服务器域名，否则无法联网。

根据下表，在小程序管理后台设置socket合法域名。下表的域名均为个推自有域名，并非DCloud所属域名。

监听推送消息的代码，需要在收到推送消息之前被执行。所以应当写在应用一启动就会触发的应用生命周期 onLaunch中。

示例源码如下，请查看 pre > code 标签中的内容

先跟着示例代码简单体验，详细的uni.onPushMessage API介绍：uni-app 框架详情参考，uni-app x 框架详情参考

假如我要给“张三”打电话，那就需要知道对方的电话标识，即电话号码是多少。 同理，要给某个客户端推送消息，也需要知道该设备的客户端推送标识。

先跟着示例代码简单体验，详细的uni.getPushClientId API介绍：uni-app 框架详情参考，uni-app x 框架详情参考 代码示例：

示例源码如下，请查看 pre > code 标签中的内容

消息推送属于敏感操作，只能直接或间接由服务端触发。传统的三方push服务，需要开发者在服务端配置密钥或证书，根据服务器端文档签名获取token，再向相关URL接口发起网络请求......

而uni-push2.0，开发者无需关心证书、签名、服务器端文档，使用简单。云函数通过 uni-push服务端sdk，即uni-cloud-push的API即可直接执行uni-push所有操作。

uni-push的服务端sdk的体积不小，没有内置在云函数中。在需要操作uni-push的云函数里，开发者需手动配置uni-cloud-push扩展库。 （uniCloud扩展库，是uniCloud自带API中不常用且包体积较大的部分，被独立为扩展库，可以由开发者自行选择是否使用该扩展库）

下面是一个开启了uni-cloud-push扩展库的云函数的package.json示例，注意不可有注释，以下文件内容中的注释仅为说明，如果拷贝此文件，切记去除注释

示例源码如下，请查看 pre > code 标签中的内容

注意：扩展库依赖3张opendb表：opendb-tempdata,opendb-device,uni-id-device。公测版uniCloud，执行扩展库会自动创建。如果你使用的是uniCloud正式版需要自己创建这3张表。

云函数中调用uni-cloud-push扩展库的sendMessage方法，向客户端推送消息

示例源码如下，请查看 pre > code 标签中的内容

在云函数文件目录右键（或按快捷键ctrl + r）-> 运行-本地云函数，此时你的客户端将收到推送消息（应用关闭时为通知栏消息，在线时代码监听到推送消息）

先跟着示例代码简单体验一下，详细的uniPush.sendMessage API介绍详情参考

如果按步骤操作完毕，此时你运行起来的uni-app客户端就会打印出“收到推送消息：xxxx”。如遇异常，可以重新运行一遍。

上一节，演示了基于“客户端推送标识”的消息推送，仅为方便理解和体验；在业务开发中，通常是指定消息的接收人，而不是某个设备。

如果项目使用uni-id-pages 或 uni-id-pages-x ，即可直接指定基于uni-id的user_id、user_tag，并可筛选设备的平台、登录信息是否有效等，执行推送消息。

uni-id-pages/uni-id-pages-x 已经内置了：在登录账号、退出账号、切换账号、token续期、注销账号5个时机，管理uni-id-device表、opendb-device表与user_id、push_clientid、platform、os_name等字段的映射关系。详情参考

以上内置逻辑，在uni-id-pages下，会自动判断是否启用push模块自动执行；但uni-id-pages-x下，需手动在:/uni_modules/uni-id-pages-x/init.uts导入 autoReportPushClientId 模块。

此外uni-push 2.0 还提供了uni-admin中的web控制台uni-push-admin 。包含消息推送、推送统计等功能，而且是开源的，可自定义。如图：

使用有其他疑问，欢迎扫码加入 uni-push2.0 微信交流群讨论：

**Examples:**

Example 1 (unknown):
```unknown
uni-push 2.0
```

Example 2 (unknown):
```unknown
uni-push 1.0
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

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/dev/account/real-name-verification.html

**Contents:**
- # 账号归属区别
- # 验证邮箱和手机号
- # 提交实名认证
- # 注意事项
  - # 个人实名认证
  - # 企业实名认证
  - # 其它
- # 常见问题
      - 本页导读

开发者在使用 DCloud 部分服务（uniCloud、uni-ad等）时会要求开发者先进行实名认证，本文将引导开发者完成实名认证。

实名认证直接影响账号和资源（包括该账号创建的 appid，广告收入，ASK 社区账号等）的归属，如果企业用户使用个人信息进行实名认证，后续出现人员变动或账号纠纷时，可能会影响企业用户的业务，甚至造成经济损失。在进行实名认证之前，请务必确认您在平台购买和使用的资源是属于个人还是企业。

在实名认证之前需要先完成邮箱和手机号验证。查看如何验证邮箱和手机号？

邮箱和手机号完成验证后，在开发者中心账户页面 ，点击“去实名认证”，提交实名认证信息，提交后等待审核即可。

**Examples:**

Example 1 (python):
```python
verify@dcloud.io
```

---

## 数据收益常见问题 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/faq/income-faq.html

**Contents:**
- # 数据收益常见问题
  - # 广告收益的高低与什么有关？
  - # 广告收益和日活大约什么关系，1万日活的app一个月大约能赚多少钱？
  - # 为什么看不到昨日的广告收益？
  - # 我的广告有展示，但无收益是怎么回事？
  - # 应用广告收益低的原因？换框架开发能提高收益吗？
  - # 有广告代理说 uni-ad 分成高，接入广告会出 bug，是真的吗？
  - # 广告的计费模式是什么样的，cpm、cpc、cpd、cpa、cps？
  - # uni-ad 广告有收费标准吗？多少钱一条？
  - # 预估收益和提现金额不一致？

我们把应用分2类来看，一类是普通App，加些广告变现；一类是围绕广告设计的App，尤其是充分运用激励视频的网赚类App。

注意必须开渠道SDK广告，DCloud快捷广告的收益达不到上述数字。

如果App的次留在30%以上，可以考虑买量。联系uniad@dcloud.io可以进行流量采购，成为uni-ad的广告主。

多方广告渠道每日系统汇总数据，有些渠道有延时，建议下午 4:30 后查看。如已同步完毕，系统会有提示。

广告收益取决于用户质量，与开发框架无关。建议：

如排查后仍无提升请联系运营或邮件：uniad@dcloud.io

由于是广告平台，广告主投放什么样的模式都是有的。但App的广告，使用cpc点击计费的不多，大部分是cpm。 但即便是cpm，它的单价不是恒定的，最终是看广告的效果。 开发者切不可自行刷曝光、刷点击，刷广告会被直接停用账户，收益不会结算。 尤其是使用渠道SDK广告的应用，优量汇、穿山甲、快手的反作弊能力非常强大，由于原生sdk直接进入手机，甄别作弊能力远超过h5网页，开发者切不可拿着网页里刷流量那套玩法在app里搞。 给广告主提供实打实的广告效果，才是共赢的良好模型。

由于可能存在以上差异，预估收益报表仅作为日常数据表现的参考，在正式结算开票时，请以结算单金额为准，不要使用预估收益金额提前开票，以免因金额不准确影响结算。

**Examples:**

Example 1 (unknown):
```unknown
hello uni-app
```

---

## app广告开通指南 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-open.html

**Contents:**
- # app广告开通指南
  - # 前言
  - # 创建应用
  - # 开通广告
    - # 1. 实名认证
    - # 2. 财务信息审核
    - # 3. 开通DCloud快捷广告
    - # 4. 开通渠道SDK广告
    - # 5. 广告管理及新增广告位
      - 本页导读

uni-ad支持个人和企业申请广告。 uni-ad支持APP，H5和微信小程序广告。 uni-adAPP端已支持国内主流广告渠道，包括：优量汇，快手，穿山甲，百度，华为，Sigmob，倍孜，章鱼，聚力，泛连，华夏乐游。从HBX3.8.12开始已支持海外广告，包括：谷歌Admob，海外穿山甲，华为。我们利用现有12亿活跃用户数据以及多年的技术沉淀来不断升级广告优化策略，确保开发者广告收益的最大化。 uni-ad的App端支持所有DCloud框架开发的APP，包括uni-app的App端及5+App、wap2app，uniCloud项目，都可以使用里面的各种广告（开屏、信息流、激励视频...） uni-ad支持原生应用的广告接入，点击查看 。

根据我们的经验：开发者在用原生应用接入广告时通常比uni-app应用接入广告要更费时（uni-app接入广告会比原生节省一半时间），这是由于原生代码相比uni-app的代码繁琐导致部署与调试效率下降。我们建议原生开发者在接入前先咨询uni-im交流群：点击加入

uni-ad支持Cocos应用程序的广告接入，具体接入方式请咨询uni-im交流群：点击加入

以下是uni-ad所有广告形式的开发文档： APP端 开屏广告 - 无需开发，在uni-ad后台 开通即可生效 信息流广告/原生广告 插屏广告 全屏视频广告 激励视频广告 Draw视频广告 短视频内容联盟广告

微信小程序端 （开通指南 ） 信息流广告/原生广告 插屏广告 激励视频广告 格子广告

应用创建不能在uni-ad系统进行，只能在HBuilderX中或开发者web控制台 新建应用。

应用创建后可以在manifest.json里查看到Appid。

如果你在HBuilder中开发过App，那么一定已经有过Appid。

如果你使用uni-app开发过H5或小程序，还没有开发App，那么很可能你的项目缺少Appid，需要把你的项目拖到HBuilderX中，打开项目下的manifest文件，获取AppID。

创建应用之后 ，进入 uni-ad 广告联盟后台（https://uniad.dcloud.net.cn） ，使用 创建应用的DCloud 账号登陆广告联盟管理后台

点击左侧 广告设置，在右侧应用列表找到需要开通的应用，点击 应用详情，进入广告开通页面。

如果当前账号没有进行实名认证，需要点击账户管理并进行实名认证，才能继续使用广告联盟。

如果当前账号没有进行财务信息审核，需要财务信息并进行财务信息审核，才能继续使用广告联盟。

如果没有完成实名认证、财务信息审核，在HBuilderX的打包界面勾上广告也是没效果的。

uni-ad分DCloud快捷广告和渠道SDK广告。 DCloud快捷广告的特点是：

渠道SDK广告需要集成三方SDK，如腾讯优量汇、字节跳动穿山甲、快手广告（无上架要求，但需提供软著）、百度、Sigmob广告（无上架要求，无需软著）。审核门槛较高，广告收益更高。

开通渠道SDK广告，需要选择对应的广告平台右侧点击申请开通按钮。 填写基础信息、设备信息、平台资质信息相关信息后，点击确认开通。

开通广告并审核通过后，在应用列表点击应用详情，进行广告管理

1. 开屏广告设置 点击开启开屏广告，可以选择是否在应用中展示开屏广告。开屏广告无需开发，直接云端开启关闭。但注意如需使用渠道SDK开屏广告，如优量汇开屏，需确保App里包含优量汇的sdk。在manifest里或打包界面里，要选择相应的SDK。

应用内广告是需要编程的，它用于信息流/原生广告 、激励视频 、插屏广告 等广告场景。信息流可以模拟插屏的广告形式具体参考：信息流文档中的“使用 ad/ad-draw 模拟插屏广告效果”部分。

填写广告位名称（此名称仅用于开发者自己的识别和报表展现），选择广告类型，点击新增

开屏广告 不需要单独申请，也不需要开发者进行编码。开发者的应用通过审核后，同时uni-ad开启了开屏广告，系统就会自动打开开屏广告。

信息流广告又名原生广告 在应用内列表页不影响用户浏览体验时出现，uni-ad支持四种信息流广告形式模板，两种素材类型（图片和视频）的选择。在创建信息流广告后还可以自定义样式。 全屏视频广告 在应用中可以在游戏闯关结束或者场景切换时让用户进行观看。另外激励视频广告填充不足时也用全屏视频广告来代替。该广告位类型已下架，使用插屏-全屏广告代替 激励视频广告 用于一些特定的激励场景，该广告类型强制用户观看后（15秒或者30秒）给予一定的奖励，请在创建广告位名称时做好标注，如：激励视频-登录、游戏复活，激励任务。有助于区分场景填充广告 Draw视频广告 是短视频类应用在滑动若干个视频后出现的一种竖屏全屏式的沉浸式体验广告 短视频内容联盟广告 是⼀个视频内容频道，支持上下滑动切换视频内容，在滑动视频后穿插视频广告。这种形式会丰富开发者的应用内容，同时增加了额外的广告收益。如果需要嵌入到页面控制大小请使用短视频内容联盟组件 插屏广告 是由客户端原生的图片、文本、视频控件组成的弹窗式广告；插屏广告与信息流相比展现尺寸更大，同样能够满足大量曝光和用户转化的需求,可以选择插屏-全屏，插屏-半屏，插屏-优选

3. 使用广告位ID（adpid） 新建广告位后，会生成对应的广告位ID，即adpid，需等待广告位审核通过。不同平台广告位的审核速度不一样。

拿到广告位ID，根据对应广告位类型开发文档，编写代码，将广告放置到合适的界面。

注意需确保App里包含优量汇、穿山甲、快手、百度、Sigmob等广告sdk。在manifest里或打包界面进行选择。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/dev/app/add-member.html

**Contents:**
- # 使用场景举例
- # 操作步骤
- # 注意事项
      - 本页导读

开发者在使用 DCloud 平台进行开发时，可能会遇到团队协作的场景，开发者可以通过添加项目成员来完成团队成员的管理。

开发者通过 HBuilderX 进行云端打包时，会校验当前 appid 的用户权限，只有当前用户为该 appid 的所有者或项目成员时，才可以继续提交打包。

1、使用 DCloud 账号登录开发者中心 ，在添加项目成员之前需要当前账号先完成开发者实名认证，如何进行实名认证请参考文档《DCloud 开发者实名认证流程》。

2、如果已经完成实名认证，登录后，点击“应用列表”，会看到如下页面，该页面显示了当前用户创建的所有应用。

3、点击要操作的应用的应用名称，进入应用管理页面，点击上方导航中的“成员管理”，进入成员管理页面。如下图所示：

4、按照下图所示，输入正确的开发者邮箱后，即可完成授权用户添加操作。如需删除授权用户，在授权用户列表中将对应授权用户删除即可。

---

## 广告错误码 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-error-code.html

**Contents:**
- # 广告错误码
  - # app平台错误码
  - # -5002错误可能的原因
  - # -5005详细说明
    - # 可能的原因
    - # 正确解决方案
    - # 不治本的绕过型方案
  - # 广告商详细错误码
      - 本页导读

-5005即广告没有填充，尤其是激励视频较为常见。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

提示：-5005 时，包含二级错误码，可在下面广告商错误码中找到具体原因

**Examples:**

Example 1 (html):
```html
<!-- pages/index/index.nvue -->
<template>
	<view class="content">
		<ad-rewarded-video adpid="1507000689" :loadnext="true" v-slot:default="{loading, error}" @error="onaderror">
			<button :disabled="loading" :loading="loading">显示广告</button>
			<view v-if="error">{{error}}</view>
		</ad-rewarded-video>
	</view>
</template>
<script>
	export default {
		data() {
			return {}
		},
		methods: {
			onaderror(e) {
				// 广告加载失败
				console.log("onaderror: ", e.detail);
				if (e.detail.errCode == -5005) {
					uni.navigateTo({
						url: '/pages/adVideo/adVideo',
						events: {
							// 为指定事件添加一个监听器，获取被打开页面传送到当前页面的数据
							onVideoClosed: function(data) {
								console.log(data);
							}
						}
					})
				}
			}
		}
	}
</script>
```

Example 2 (html):
```html
<!-- pages/index/index.nvue -->
<template>
	<view class="content">
		<ad-rewarded-video adpid="1507000689" :loadnext="true" v-slot:default="{loading, error}" @error="onaderror">
			<button :disabled="loading" :loading="loading">显示广告</button>
			<view v-if="error">{{error}}</view>
		</ad-rewarded-video>
	</view>
</template>
<script>
	export default {
		data() {
			return {}
		},
		methods: {
			onaderror(e) {
				// 广告加载失败
				console.log("onaderror: ", e.detail);
				if (e.detail.errCode == -5005) {
					uni.navigateTo({
						url: '/pages/adVideo/adVideo',
						events: {
							// 为指定事件添加一个监听器，获取被打开页面传送到当前页面的数据
							onVideoClosed: function(data) {
								console.log(data);
							}
						}
					})
				}
			}
		}
	}
</script>
```

Example 3 (html):
```html
<!-- pages/index/index.nvue -->
<template>
	<view class="content">
		<ad-rewarded-video adpid="1507000689" :loadnext="true" v-slot:default="{loading, error}" @error="onaderror">
			<button :disabled="loading" :loading="loading">显示广告</button>
			<view v-if="error">{{error}}</view>
		</ad-rewarded-video>
	</view>
</template>
<script>
	export default {
		data() {
			return {}
		},
		methods: {
			onaderror(e) {
				// 广告加载失败
				console.log("onaderror: ", e.detail);
				if (e.detail.errCode == -5005) {
					uni.navigateTo({
						url: '/pages/adVideo/adVideo',
						events: {
							// 为指定事件添加一个监听器，获取被打开页面传送到当前页面的数据
							onVideoClosed: function(data) {
								console.log(data);
							}
						}
					})
				}
			}
		}
	}
</script>
```

Example 4 (vue):
```vue
<!-- pages/index/index.nvue -->
<template>
	<view class="content">
		<ad-rewarded-video adpid="1507000689" :loadnext="true" v-slot:default="{loading, error}" @error="onaderror">
			<button :disabled="loading" :loading="loading">显示广告</button>
			<view v-if="error">{{error}}</view>
		</ad-rewarded-video>
	</view>
</template>
<script>
	export default {
		data() {
			return {}
		},
		methods: {
			onaderror(e) {
				// 广告加载失败
				console.log("onaderror: ", e.detail);
				if (e.detail.errCode == -5005) {
					uni.navigateTo({
						url: '/pages/adVideo/adVideo',
						events: {
							// 为指定事件添加一个监听器，获取被打开页面传送到当前页面的数据
							onVideoClosed: function(data) {
								console.log(data);
							}
						}
					})
				}
			}
		}
	}
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/unipush-v2.html

**Contents:**
- # uni-push介绍
- # 概述
- # 为什么选择uni-push 2.0
- # uni-push 2.0 使用uniCloud产生的费用说明
- # 快速上手
  - # 第一步：开通
  - # 第二步：配置
  - # 第三步：客户端操作
    - # 名词解释
      - # 离线推送

本文为uni-push 2.0（需要HBuilderX 3.5.1 及其以上版本支持）的介绍，如果旧项目需要使用老版本的uni-push 1.0，另见：uni-push 1.0

uni-push 2.0是DCloud推出的、全端的、云端一体的统一推送服务。

客户端方面，uni-push 2.0支持App、web、小程序。

服务端方面，uni-push 2.0支持uniCloud云端一体，无需再编写复杂代码轻松完成push。 （uni-push1.0仅支持使用传统服务器开发语言如php，未和客户端有效协同，流程比uni-push2.0繁琐）

uni-push还自带一个web控制台。不写代码也可以在web页面发推送。uni-push1.0的web控制台在dev.dcloud.net.cn 。uni-push2.0的web控制台是开源的，属于uni-admin插件详见 。

如果你的项目由于特殊原因不能通过uniCloud的云函数使用uni-push2.0，你希望直接通过调用个推服务器推送消息。在这种情况下：

请注意，直接调用个推服务器进行推送可能需要更多的配置和操作步骤，具体请参考调用个推服务器的相关文档。

由于手机厂商众多，他们各自都有不同的推送服务，包括Apple、google（仅能在海外使用）、华为、小米、oppo、vivo、魅族，以及还有一些没有专业推送服务的中小手机品牌。他们对App后台耗电都有查杀机制，除了微信等大应用，普通应用很难常驻后台。

如果开发者把上述每个平台的客户端和服务器的SDK都对接一遍，还自己处理没有push服务的中小品牌手机，那过于困难了。所以业内有专业的推送服务厂商把各种手机厂商的通道封装成一套统一的API，如个推（属于上市公司每日互动）；同时这些三方专业推送厂商还提供了高速socket通道。当应用在线时，也可以直接通过socket下发消息。否则开发者需要写很多判断代码、搭建socket服务器、处理在线时和离线时各种差异。

DCloud与个推（A股上市公司每日互动）深度合作，为uni-app的开发者提供了比传统方案便利甚多的统一推送方案uni-push 2.0，利用云端一体的优势，同时提供基于uniCloud的push服务器和基于uni-app的push客户端，两者高效协同，极大的简化了push的使用。

注：uni-push的服务器稳定性是由阿里云serverless、腾讯云serverless、个推来保障的，都是日活过亿的上市公司，无需顾虑稳定性。

如下图所示： 首先开发者的uniCloud应用服务器向uni-push服务器发送push消息，然后

在uni-starter 里，还提供了app push权限判断、申请、开关设置，搭配使用可以大量降低开发工作量。

注意：app申请创建通知栏消息、web申请弹出通知，均会由操作系统或浏览器自动弹窗询问用户是否同意。小程序下需要手机用户主动发起订阅行为，才能送达消息。

uni-push即降低了开发成本，又提高了push送达率，还支持全平台，并且免费，是当前推送的最佳解决方案。

uni-push 2.0本身并不收费，实际使用中需要依赖uniCloud云服务，而uniCloud价格很实惠：

一次消息推送 = 1次云函数请求 + 最高3次数据库查询（最常用的基于user_id推送仅需一次查询，详情参考：推送接口查库详解

即：最高(1 * 0.0133 + 3 * 0.015)/10000 = 0.00000583元/每次（注：给你的应用的所有注册用户群发消息算一次）

详细的计费参考：阿里云版uniCloud按量计费文档

仅APP端支持，当应用被用户关闭，或者运行到后台时，手机厂商为了省电或释放内存，会终止App后台联网。

消息将通过不会离线的手机厂商通道，下发到手机系统推送服务模块；

此时客户端会自动创建通知栏消息，展示在系统消息中心（如图所示）但客户端监听不到消息内容；当用户点击通知栏消息后，会将APP唤醒此时APP才能监听到消息内容。

当应用在线时，不会创建“通知栏消息”，此时客户端会立即监听到消息内容。

如果你希望当应用在线时，也通过“通知栏消息”来提醒用户；可以通过以下两种方式实现：

以上两种方案各有优劣，方案一更加灵活；比如：客服功能，客户端接收到聊天消息时，应用如果已经打开聊天对话页面，就直接将监听到的推送内容，渲染到页面。如果应用未打开聊天页，则调用api创建“通知栏消息”提醒用户；此时你还可以执行一些其他逻辑，比如将tabBar的消息中心加红点等。方案二比较简便，客户端无需额外编写代码，自动创建通知栏消息；但仅适用于不关心客户端行为就创建“通知栏消息”的场景，如广告营销内容的推送等。

个推的客户端类型是仅根据使用的sdk类型来判断的，分为两类：

标准基座不包含uni-push模块，如果需要使用此模块，应当在提交云打包时，项目代码中包含uni-push相关客户端api。点此 了解uni-app x的摇树机制

所以在开发调试时，需要先写一段包含uni-push相关客户端api代码，再打一个自定义基座。

示例源码如下，请查看 pre > code 标签中的内容

注意：此时由于运行的标准基座中，不包含uni-push模块，如果运行会报错，不用着急继续往下操作

接下来即可使用 uni-push 相关客户端 api

鸿蒙平台需要主动添加 APP_TRACKING_CONSENT 权限配置详见 鸿蒙支持 uniPush 推送吗，如何配置?。

操作步骤打开manifest.json - App模块配置 - 中勾选uni-push 2.0 - 重新编译项目

鸿蒙平台需要主动添加 APP_TRACKING_CONSENT 权限配置详见 鸿蒙支持 uniPush 推送吗，如何配置?。

其他小程序启用方式参考微信小程序，这里不一一列举

在manifest.json中配置完之后，需要重新编译项目，即：点击如图重新运行按钮

uni-push在web和小程序端就是个websocket；各家小程序平台，均要求在小程序管理后台配置小程序应用的联网服务器域名，否则无法联网。

根据下表，在小程序管理后台设置socket合法域名。下表的域名均为个推自有域名，并非DCloud所属域名。

监听推送消息的代码，需要在收到推送消息之前被执行。所以应当写在应用一启动就会触发的应用生命周期 onLaunch中。

示例源码如下，请查看 pre > code 标签中的内容

先跟着示例代码简单体验，详细的uni.onPushMessage API介绍：uni-app 框架详情参考，uni-app x 框架详情参考

假如我要给“张三”打电话，那就需要知道对方的电话标识，即电话号码是多少。 同理，要给某个客户端推送消息，也需要知道该设备的客户端推送标识。

先跟着示例代码简单体验，详细的uni.getPushClientId API介绍：uni-app 框架详情参考，uni-app x 框架详情参考 代码示例：

示例源码如下，请查看 pre > code 标签中的内容

消息推送属于敏感操作，只能直接或间接由服务端触发。传统的三方push服务，需要开发者在服务端配置密钥或证书，根据服务器端文档签名获取token，再向相关URL接口发起网络请求......

而uni-push2.0，开发者无需关心证书、签名、服务器端文档，使用简单。云函数通过 uni-push服务端sdk，即uni-cloud-push的API即可直接执行uni-push所有操作。

uni-push的服务端sdk的体积不小，没有内置在云函数中。在需要操作uni-push的云函数里，开发者需手动配置uni-cloud-push扩展库。 （uniCloud扩展库，是uniCloud自带API中不常用且包体积较大的部分，被独立为扩展库，可以由开发者自行选择是否使用该扩展库）

下面是一个开启了uni-cloud-push扩展库的云函数的package.json示例，注意不可有注释，以下文件内容中的注释仅为说明，如果拷贝此文件，切记去除注释

示例源码如下，请查看 pre > code 标签中的内容

注意：扩展库依赖3张opendb表：opendb-tempdata,opendb-device,uni-id-device。公测版uniCloud，执行扩展库会自动创建。如果你使用的是uniCloud正式版需要自己创建这3张表。

云函数中调用uni-cloud-push扩展库的sendMessage方法，向客户端推送消息

示例源码如下，请查看 pre > code 标签中的内容

在云函数文件目录右键（或按快捷键ctrl + r）-> 运行-本地云函数，此时你的客户端将收到推送消息（应用关闭时为通知栏消息，在线时代码监听到推送消息）

先跟着示例代码简单体验一下，详细的uniPush.sendMessage API介绍详情参考

如果按步骤操作完毕，此时你运行起来的uni-app客户端就会打印出“收到推送消息：xxxx”。如遇异常，可以重新运行一遍。

上一节，演示了基于“客户端推送标识”的消息推送，仅为方便理解和体验；在业务开发中，通常是指定消息的接收人，而不是某个设备。

如果项目使用uni-id-pages 或 uni-id-pages-x ，即可直接指定基于uni-id的user_id、user_tag，并可筛选设备的平台、登录信息是否有效等，执行推送消息。

uni-id-pages/uni-id-pages-x 已经内置了：在登录账号、退出账号、切换账号、token续期、注销账号5个时机，管理uni-id-device表、opendb-device表与user_id、push_clientid、platform、os_name等字段的映射关系。详情参考

以上内置逻辑，在uni-id-pages下，会自动判断是否启用push模块自动执行；但uni-id-pages-x下，需手动在:/uni_modules/uni-id-pages-x/init.uts导入 autoReportPushClientId 模块。

此外uni-push 2.0 还提供了uni-admin中的web控制台uni-push-admin 。包含消息推送、推送统计等功能，而且是开源的，可自定义。如图：

使用有其他疑问，欢迎扫码加入 uni-push2.0 微信交流群讨论：

**Examples:**

Example 1 (unknown):
```unknown
uni-push 2.0
```

Example 2 (unknown):
```unknown
uni-push 1.0
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

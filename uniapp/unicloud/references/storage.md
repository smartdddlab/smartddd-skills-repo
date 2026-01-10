# Unicloud - Storage

**Pages:** 14

---

## uni-cdn | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cdn/intro.html

**Contents:**
- # uni-cdn
- # 产品优势
- # 业务开通
- # 使用方式

CDN一直是各种App、小程序的费用消耗大头。单个开发者，因用量有限，很难直接从云厂商拿到低价折扣。

DCloud聚合所有DCloud开发者资源，跟业内云厂商合作，拿到了极具性价比的CDN资源，这就是uni-cdn。

uni-cdn的最大优势就是价格便宜，相比业内主流的云厂商官方报价：

uni-cdn基于uniCloud扩展存储封装而来，开通方式参考uniCloud扩展存储 - 开通指南。

如果你已经使用了uniCloud，或已经有一个服务空间，则在该空间下开通云存储-扩展存储，即可使用uni-cdn。

如果你的后端尚未使用uniCloud，你可以开通一个免费的阿里云、支付宝小程云的服务空间，然后在该免费空间下开通扩展存储，即可使用uni-cdn。

不管你的业务后端是否已使用uniCloud，你都可以基于uniCloud web控制台 ，对CDN文件进行上传、下载、获取连接等操作。

如果你已开始使用uniCloud，则你可以基于uniCloud API对文件进行上传、删除等管理操作，详见：开发指南

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage/

云存储提供稳定、安全、低成本、简单易用的云端存储服务，支持任意数量和形式的非结构化数据存储，例如图片、文档、音频、视频、文件等。

开发者使用uniCloud的云存储，无需再像传统模式那样单独去购买存储空间、CDN映射、流量采购等；

uniCloud的云存储分为内置存储和扩展存储：

---

## 服务空间故障切换 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/failover.html

**Contents:**
- # 服务空间故障切换
- # 前置准备
  - # 1. 准备备用服务空间
  - # 2. 开通扩展数据库
  - # 3. 开通扩展存储
  - # 4. 项目发行配置
- # 控制台操作
  - # 配置服务接入点
  - # 切换到备用空间
  - # 切换到主空间

服务空间故障切换是uniCloud跨云灾备方案的核心能力，当主服务空间发生故障时，可以切换到备用服务空间，确保业务连续性。

关于跨云灾备的完整方案介绍，请参考：uniCloud跨云灾备方案

使用故障切换功能前，需要完成以下准备工作：

统一使用uni扩展数据库，确保主备空间访问同一份数据，避免数据不一致问题。

关于uni扩展数据库的介绍，请参考：uni扩展数据库

如何开通uni扩展数据库，请参考：开通uni扩展数据库

开通扩展数据库后，需要授权主空间和备用空间访问数据库，具体操作请参考：扩展数据库跨空间授权

故障切换的配置文件存储在CDN上，需要在主空间开通uni扩展存储服务。

如使用了云存储功能，建议将云存储切换到扩展存储。

关于uni扩展存储的介绍，请参考：uni扩展存储

如何开通uni扩展存储，请参考：开通uni扩展存储

要在服务空间相关联的项目中使用故障切换功能，必须在uniCloud控制台-故障切换中配置"服务接入点"后，重新关联服务空间并重新发行项目生效。

本地调试时需要重新关联服务空间并切换到云端才会生效。

故障切换功能在uniCloud控制台服务空间详情页面的左侧"故障切换"菜单中进行配置和管理。

服务接入点是接入故障切换功能的基础，本质上是绑定扩展存储中的CDN域名。

如果未开通扩展存储服务，请按照提示开通扩展存储并绑定CDN域名。

如果已开通扩展存储，请选择对应的CDN域名作为服务接入点，点击保存。

保存服务节点后，在HBuilderX中重新关联服务空间并重新发行项目时会将故障切换功能集成到客户端SDK中。

当主空间发生故障时，切换服务空间状态为"故障"

选择备用服务空间后，点击“应用”按钮，系统将主空间云函数、公共模块、Schema迁移至备用空间。

当主空间恢复正常后，切换服务空间状态为"正常"

选择服务空间状态为"正常"，点击“应用”按钮，系统将备用空间云函数、公共模块、Schema迁移回主空间。

监听故障切换事件。当故障切换状态发生变化时触发。

注意：当hasStatusChanged为true时，表示配置发生了变化，需要提示用户重启应用使新配置生效。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当检测到配置变化时，强制用户重启应用以确保切换生效。

示例源码如下，请查看 pre > code 标签中的内容

让用户选择是否立即重启，适用于非紧急切换场景。

示例源码如下，请查看 pre > code 标签中的内容

仅记录状态变化，不打扰用户。用户下次自然重启应用时会自动使用新配置。

示例源码如下，请查看 pre > code 标签中的内容

故障切换采用下次启动生效的机制，确保应用运行的稳定性：

重要：当检测到配置变化时，当前运行的应用仍使用原来的服务空间。必须重启应用（App重启或H5刷新页面）后，新的配置才会生效。

故障切换配置文件存储在CDN上，路径为 .unicloud/failover-cfg.json，格式如下：

示例源码如下，请查看 pre > code 标签中的内容

重启生效：故障切换配置变化后，必须重启应用（App重启或H5刷新页面）才能生效。当前运行的应用会继续使用原来的服务空间，直到下次启动

发行要求：故障切换功能仅在HBuilderX发行后的应用中生效，运行到浏览器或模拟器时不会加载故障切换配置

本地缓存：SDK会将配置缓存到本地存储，应用启动时优先使用缓存配置。即使CDN不可访问也能使用最近一次的配置

首次启动：首次安装的应用没有缓存配置，会使用项目发行时配置的默认服务空间（主空间）

刷新间隔：合理设置interval参数，避免频繁请求CDN造成不必要的流量消耗

云函数同步：确保主备空间的云函数、云对象代码保持一致，避免切换后出现功能异常

数据一致性：使用uni扩展数据库确保主备空间访问同一份数据，避免数据不一致问题

**Examples:**

Example 1 (javascript):
```javascript
// 在 App.vue 的 onLaunch 中监听
uniCloud.onFailover(function(event) {
  console.log('故障切换事件触发')
  console.log('最新配置状态:', event.isEnabled ? '需要使用备用空间' : '使用主空间')
  console.log('状态是否变化:', event.hasStatusChanged)

  if (event.hasStatusChanged) {
    // 配置发生变化，必须重启应用才能使新配置生效
    uni.showModal({
      title: '服务状态变更',
      content: event.isEnabled ? '检测到服务故障，需要重启应用切换到备用服务' : '服务已恢复正常，需要重启应用切换回主服务',
      confirmText: '立即重启',
      cancelText: '稍后',
      success: (res) => {
        if (res.confirm) {
          // 重启应用使新配置生效
          // #ifdef APP-PLUS
          plus.runtime.restart()
          // #endif
          // #ifdef H5
          location.reload()
          // #endif
        }
      }
    })
  }
})
```

Example 2 (javascript):
```javascript
// 在 App.vue 的 onLaunch 中监听
uniCloud.onFailover(function(event) {
  console.log('故障切换事件触发')
  console.log('最新配置状态:', event.isEnabled ? '需要使用备用空间' : '使用主空间')
  console.log('状态是否变化:', event.hasStatusChanged)

  if (event.hasStatusChanged) {
    // 配置发生变化，必须重启应用才能使新配置生效
    uni.showModal({
      title: '服务状态变更',
      content: event.isEnabled ? '检测到服务故障，需要重启应用切换到备用服务' : '服务已恢复正常，需要重启应用切换回主服务',
      confirmText: '立即重启',
      cancelText: '稍后',
      success: (res) => {
        if (res.confirm) {
          // 重启应用使新配置生效
          // #ifdef APP-PLUS
          plus.runtime.restart()
          // #endif
          // #ifdef H5
          location.reload()
          // #endif
        }
      }
    })
  }
})
```

Example 3 (javascript):
```javascript
// 在 App.vue 的 onLaunch 中监听
uniCloud.onFailover(function(event) {
  console.log('故障切换事件触发')
  console.log('最新配置状态:', event.isEnabled ? '需要使用备用空间' : '使用主空间')
  console.log('状态是否变化:', event.hasStatusChanged)

  if (event.hasStatusChanged) {
    // 配置发生变化，必须重启应用才能使新配置生效
    uni.showModal({
      title: '服务状态变更',
      content: event.isEnabled ? '检测到服务故障，需要重启应用切换到备用服务' : '服务已恢复正常，需要重启应用切换回主服务',
      confirmText: '立即重启',
      cancelText: '稍后',
      success: (res) => {
        if (res.confirm) {
          // 重启应用使新配置生效
          // #ifdef APP-PLUS
          plus.runtime.restart()
          // #endif
          // #ifdef H5
          location.reload()
          // #endif
        }
      }
    })
  }
})
```

Example 4 (javascript):
```javascript
// 在 App.vue 的 onLaunch 中监听
uniCloud.onFailover(function(event) {
  console.log('故障切换事件触发')
  console.log('最新配置状态:', event.isEnabled ? '需要使用备用空间' : '使用主空间')
  console.log('状态是否变化:', event.hasStatusChanged)

  if (event.hasStatusChanged) {
    // 配置发生变化，必须重启应用才能使新配置生效
    uni.showModal({
      title: '服务状态变更',
      content: event.isEnabled ? '检测到服务故障，需要重启应用切换到备用服务' : '服务已恢复正常，需要重启应用切换回主服务',
      confirmText: '立即重启',
      cancelText: '稍后',
      success: (res) => {
        if (res.confirm) {
          // 重启应用使新配置生效
          // #ifdef APP-PLUS
          plus.runtime.restart()
          // #endif
          // #ifdef H5
          location.reload()
          // #endif
        }
      }
    })
  }
})
```

---

## 安全相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/security.html

**Contents:**
- # 安全相关问题
  - # 关于DDoS
  - # 等级保护认证

对于针对ip地址进行的流量攻击是无法到达云函数的，云厂商的网关会拦截此类攻击流量。如果攻击者模拟真实请求，此时可以通过云函数IP防刷功能，进行一定程度的防护。云厂商也正在提供网关层面的防刷机制。

如何处理针对云存储的流量攻击，参考：阿里云云存储安全策略

---

## 开发相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/dev.html

**Contents:**
- # 开发相关问题
  - # uniCloud只支持uni-app，怎么开发web界面？
  - # uniCloud内如何使用formdata
  - # 高并发下简单的防止超卖
  - # 使用腾讯云报未登录Cloudbase
  - # 如何使用promise/async/await
  - # 使用uniCloud.init初始化阿里云正式版服务空间报“InvalidSpaceId.NotFound”

uni-app可以开发web界面，详见：uni-app宽屏适配指南

如果是需要pc版admin的话，uniCloud提供了uniCloud admin

nodejs本身不支持formdata，但是可以通过手动拼装formdata的方式来进行支持，参考

结合uniCloud.httpclient.request使用的示例

示例源码如下，请查看 pre > code 标签中的内容

uniCloud阿里云现已支持redis，开通并使用redis请参考:redis开通和使用，如何使用redis防止超卖请参考：redis高并发抢购（推荐使用）。如下方式针对无redis场景比较不灵活（不推荐使用）

高并发时很多用户同时对一条数据读写，很容易造成数据混乱，表现在秒杀抢购等场景就是超卖。以秒杀为例，开发者可以从扣除库存这步入手对超卖进行很大程度的限制，下面是一个简单的示例（注意以下代码未使用事务）

示例源码如下，请查看 pre > code 标签中的内容

腾讯云会在本地storage存储一些信息，请不要在应用使用过程中使用clearStorage等接口直接删除storage。

uniCloud客户端callFunction及数据库相关接口会返回Promise类型结果，请参考以下写法使用：

示例源码如下，请查看 pre > code 标签中的内容

商用版如果使用uniCloud.init需要自行传递endpoint参数，参考：uniCloud.init

**Examples:**

Example 1 (javascript):
```javascript
const FormData = require('form-data');
let form = new FormData();
form.append('my_field', 'my value');
form.append('my_buffer', new Buffer(10));

form.append('img', new Buffer(10), {
  filename: `${Date.now()}.png`,
  contentType: 'image/png'
})

uniCloud.httpclient.request('https://example.com',{
  content: form.getBuffer(),
  headers: form.getHeaders()
})
```

Example 2 (javascript):
```javascript
const FormData = require('form-data');
let form = new FormData();
form.append('my_field', 'my value');
form.append('my_buffer', new Buffer(10));

form.append('img', new Buffer(10), {
  filename: `${Date.now()}.png`,
  contentType: 'image/png'
})

uniCloud.httpclient.request('https://example.com',{
  content: form.getBuffer(),
  headers: form.getHeaders()
})
```

Example 3 (javascript):
```javascript
const FormData = require('form-data');
let form = new FormData();
form.append('my_field', 'my value');
form.append('my_buffer', new Buffer(10));

form.append('img', new Buffer(10), {
  filename: `${Date.now()}.png`,
  contentType: 'image/png'
})

uniCloud.httpclient.request('https://example.com',{
  content: form.getBuffer(),
  headers: form.getHeaders()
})
```

Example 4 (javascript):
```javascript
const FormData = require('form-data');
let form = new FormData();
form.append('my_field', 'my value');
form.append('my_buffer', new Buffer(10));

form.append('img', new Buffer(10), {
  filename: `${Date.now()}.png`,
  contentType: 'image/png'
})

uniCloud.httpclient.request('https://example.com',{
  content: form.getBuffer(),
  headers: form.getHeaders()
})
```

---

## CDN安全策略 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage/cdn-security-policy.html

**Contents:**
- # CDN安全策略
- # 简介
- # 功能对比
- # Referer防盗链
  - # 如何配置Referer防盗链
  - # 各平台小程序默认Referer
  - # App中Referer防盗链
- # UA黑/白名单
  - # 如何配置UA黑/白名单
  - # 注意事项

本功能仅阿里云、支付宝云服务空间支持。配置路径：进入uniCloud控制台 --> 服务空间详情 --> 云存储 --> 空间内置存储-->参数配置

云存储及前端网页托管上传的文件在对外分发后，只需知道文件的http链接，公网上是可以随意访问的。这可能会造成CDN流量被刷、有价值的图片视频被盗链，导致资金损失。

为提升CDN资源的访问安全性，系统支持配置Referer防盗链、IP黑/白名单、UA黑/白名单来实现对访客身份的识别和过滤，从而限制访问CDN资源的用户。

注意： 阿里云的访问报表功能有开通门槛：当前账号下所有服务空间昨日 CDN 流量大于 1MB 时，可申请开通报表。访问报表存在一天延迟，开通当天的数据将在次日生成。 其中，CDN流量包含云存储及绑定自定义域名的前端网页托管。 而支付宝云对此功能无使用限制，无需满足流量条件，即可直接查看访问报表。访问报表同样存在一天延迟。

Referer防盗链，是基于HTTP请求头中Referer字段来设置访问控制规则，实现对访客的身份识别和过滤，防止资源被非法盗用。

配置Referer黑白名单后，CDN会根据配置的规则识别请求身份，允许或拒绝访问请求。允许访问请求，CDN会返回资源链接；拒绝访问请求，CDN会返回403响应码。

访问Referer防盗链项，点击编辑按钮来配置规则。您可根据业务需求，设置Referer黑名单或白名单。

例如，你的web网站地址为 abc.com，那么可以设定白名单为 abc.com，那么除了这个网站，其他来源请求都会被禁止访问cdn。

如果您的应用是小程序，可将小程序平台默认Referer配置到白名单规则中，以允许访问资源。

注意：如果您启用了白名单，又没有填写上述网址，那么这些小程序将无法访问您的cdn。

App中请求cdn时的referer为空。也不支持指定。如果已设置黑/白名单则在App中无法访问资源。

如需支持App访问，请务必开启高级配置中的允许通过浏览器地址栏直接访问资源URL，即允许空Referer访问CDN资源。

此时空Referer及命中黑/白名单规则的请求可正常访问资源。

在App中，如需指定某App才能访问cdn，不是通过referer，而是通过userAgent，具体见下一节。

User-Agent是HTTP请求头的一部分，包含用户访问时所使用的操作系统及版本、浏览器类型及版本等标识信息。

配置UA黑/白名单后，用户请求资源时，CDN将获取用户请求时HTTP请求头中的User-Agent字段，同配置中的黑/白名单进行匹配来实现对访客身份的识别和过滤，保证只从您允许的客户端UA才能访问cdn。

访问UA黑/白名单项，点击编辑按钮来配置规则。

uni-app的app端，有默认UA，也可以自定义UA。

如需指定某个特殊UA才能访问cdn，需在manifest.json中配置。详见App的默认UA和自定义UA教程

通过识别客户端IP来过滤用户请求，拦截特定IP的访问或者仅允许特定IP的访问，可以用来解决恶意IP盗刷、攻击等问题。

访问IP黑/白名单项，点击编辑按钮来配置规则。

通过访问报表功能，您可以查询云存储及前端网页托管的访问统计数据；通过分析数据，便于了解业务运行状况。

访问报表统计并展示了用户访问最多的Referer、URL和IP三项数据，您可以根据报表数据及业务需求来配置相应的访问控制规则以提高CDN的安全性。

因为http头其实是可以伪造的，所以使用referer和ua没有那么绝对的安全。

ip虽然是不可伪造的，但面对海量用户无法配置ip白名单。

一般在配置referer和ua后，需继续通过查看报表，发现可疑的ip并禁封。

另外，CDN节点处理恶意访问请求的过程中需要消耗CPU处理资源，CDN节点响应恶意请求4xx状态码的过程中需要消耗流量带宽资源，因此命中安全策略被拒绝的请求仍会产生请求数及响应4xx状态码产生的CDN流量费用。

这是行业现状，也是业内cdn通行的安全防护措施。uniCloud已将阿里云cdn的所有安全策略均透传出来。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage?id=chooseanduploadfile

云存储提供稳定、安全、低成本、简单易用的云端存储服务，支持任意数量和形式的非结构化数据存储，例如图片、文档、音频、视频、文件等。

开发者使用uniCloud的云存储，无需再像传统模式那样单独去购买存储空间、CDN映射、流量采购等；

uniCloud的云存储分为内置存储和扩展存储：

---

## 费用说明 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-storage/price.html

**Contents:**
- # 费用说明
  - # CDN费用
  - # 存储费用
  - # 图片处理费用
  - # 音视频处理费用
  - # 文件处理费用
  - # 机器智能审核-图片视频鉴黄费用

uniCloud扩展存储费用由存储费用和CDN费用两部分组成，其中CDN费用相比业内价格，有巨大优势。

uniCloud扩展存储CDN费用，按从CDN节点流出的下行流量（单位GB）阶梯计费，当月按账户维度进行阶梯累进（以自然月为一个累计周期）。

如果你的CDN每月消耗量大于200TB，欢迎联系 bd@dcloud.io 进行定制。

对比serverless厂商提供的内置云存储，uniCloud扩展存储CDN流量费用至少便宜33%，有明显的价格优势：

对比传统云厂商提供的CDN产品，uniCloud扩展存储CDN流量也有明显的价格优势：

比云厂商的按量计费便宜，仅为传统按量的1/3：

大多数业务运营中，费用大头是CDN费用，存储费用比重并不大，但DCloud依然帮开发者争取到了业内极具性价比的存储价格，如下是和uniCloud各云厂商内置存储的价格对比：

不同编码方式，音视频转码（包含普通转码、锐智转码、倍速转码、音视频拼接等）定价如下：

特别提醒：如果同时检测多个资源项，则费用是叠加计算的

---

## 业务开通@open | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-storage/service.html

**Contents:**
- # 业务开通
- # 业务充值
  - # 充值保证金
  - # 充值余额
- # 服务协议

扩展存储是延迟计费的，使用前需要先充值200元保证金，用于欠费的担保。保证金是账号级的、可在不同业务间复用，若你在使用其他uniCloud服务时 ，已充值保证金，则无需重复充值。

在uniCloud web控制台前往【费用中心】-【按量余额充值】充值保证金（若保证金账户余额≥200元则无需充值）

在uniCloud web控制台前往【费用中心】-【按量余额充值】充值扩展存储余额

七牛云提供了服务等级协议（SLA），以七牛云官网标准协议为准。

存储服务等级协议：https://www.qiniu.com/agreements/sla/kodo

CDN服务等级协议：https://www.qiniu.com/agreements/sla/fusion

七牛云用户协议：https://www.qiniu.com/agreements/user-agreement

隐私政策：https://www.qiniu.com/agreements/privacy-right

如果您购买了七牛云版的uniCloud扩展存储的，且七牛云未满足其承诺的服务标准，则可以索赔。

DCloud将负责为您协调七牛云的赔偿。赔偿标准和相关规定见上述服务等级协议。

---

## uni扩展存储 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ext-storage/intro.html

**Contents:**
- # uni扩展存储
- # 产品优势
  - # 价格更便宜
  - # 功能更强大
- # 常见问题

因阿里云、腾讯云等serverless厂商未针对uniCloud服务空间提供CDN流量包的销售，uniCloud内置云存储的CDN费用，常被开发者吐槽。

为帮助开发者降低费用，DCloud联合业内其它主流CDN厂商，单独提供了价格更便宜、功能更强大的uniCloud扩展存储。

uniCloud扩展存储相比uniCloud内置云存储，最大的优势就是：价格更便宜、功能更强大。

uniCloud扩展存储CDN费用采用阶梯计价模式，起步价是0.12元/GB，起步就比uniCloud内置云存储的按量计费便宜1/3。随着每月消耗CDN流量的增加，uniCloud扩展存储的价格可比uniCloud内置云存储便宜50%以上。

uniCloud扩展存储同样比传统云厂商的CDN便宜，即使你目前的后端业务未使用uniCloud，也可以基于性价比考虑，将对象存储及CDN先迁移到uniCloud扩展存储。

如果你需要存储类似身份证照片等敏感文件时，uniCloud内置存储就有点不太友好。腾讯云虽支持文件权限，但易用性欠缺；阿里云直接不支持私有存储。

uniCloud扩展存储支持文件级别的权限设置，可以精准设置具体文件的公开、私有访问权限，详见修改文件状态。

扩展存储不支持当前端托管使用，只适合当云存储使用

是的，因为扩展存储是延迟计费，可能会出现账户欠费的情况，因此需要缴纳保证金，如果之前开通其他uniCloud服务、且已缴纳过保证金，则无需再缴纳保证金。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage?id=cloudgettempfileurl

云存储提供稳定、安全、低成本、简单易用的云端存储服务，支持任意数量和形式的非结构化数据存储，例如图片、文档、音频、视频、文件等。

开发者使用uniCloud的云存储，无需再像传统模式那样单独去购买存储空间、CDN映射、流量采购等；

uniCloud的云存储分为内置存储和扩展存储：

---

## 云存储相关问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq/storage.html

**Contents:**
- # 云存储相关问题
  - # 云存储文件无法访问，图片、apk等文件无法下载 || 控制台获取文件报错 Access Denied
  - # 空间过期停服或账号欠费停服，续费或充值后服务恢复，但云存储仍无法访问
  - # 如何查询云存储哪些文件访问较多，消耗流量较大？
  - # 还没有使用，就多了几次读写次数
  - # 云存储的CDN费用感觉有点贵，有没有更好的方案？

前往服务空间详情查看cdn相关资源用量是否超上限，可通过以下方案解决：

停服恢复后，云存储cdn访问恢复大约需要10分钟左右

可开启“cdn安全策略”，开启后支持查看前一日topUrl、topIp、topReferer，文档：https://doc.dcloud.net.cn/uniCloud/storage/cdn-security-policy.html

云存储的读写次数，并不一定是针对文件的，以下操作也会被计算读写次数：

为帮助开发者降低费用，DCloud联合业内其它主流CDN厂商，单独提供了价格更便宜、功能更强大的uniCloud扩展存储，详见文档 。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage

云存储提供稳定、安全、低成本、简单易用的云端存储服务，支持任意数量和形式的非结构化数据存储，例如图片、文档、音频、视频、文件等。

开发者使用uniCloud的云存储，无需再像传统模式那样单独去购买存储空间、CDN映射、流量采购等；

uniCloud的云存储分为内置存储和扩展存储：

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/storage?id=clouduploadfile

云存储提供稳定、安全、低成本、简单易用的云端存储服务，支持任意数量和形式的非结构化数据存储，例如图片、文档、音频、视频、文件等。

开发者使用uniCloud的云存储，无需再像传统模式那样单独去购买存储空间、CDN映射、流量采购等；

uniCloud的云存储分为内置存储和扩展存储：

---

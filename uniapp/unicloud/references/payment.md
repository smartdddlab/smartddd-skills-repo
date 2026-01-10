# Unicloud - Payment

**Pages:** 8

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-pay-common.html

**Contents:**
- # 简介
- # 引入 unipay
- # 初始化
  - # 微信支付V3
  - # 微信支付v2
  - # 支付宝支付
  - # 苹果内购支付
  - # 微信小程序虚拟支付
  - # 华为支付
- # Api 列表

本文档为uni-pay 1.x版本文档。适用于老项目。 新项目请另行查阅 uni-pay 2.x 版本文档。

unipay为uniCloud开发者提供了简单、易用、统一的支付能力封装。让开发者无需研究支付宝、微信等支付平台的后端开发、无需为它们编写不同代码，拿来即用，屏蔽差异。

uni-app前端已经封装的全端支付 api uni.requestPayment，现在服务端也封装好了unipay for uniCloud，从此开发者可以极快的完成前后一体的支付业务。

目前已封装 App 端（微信支付和支付宝支付）、微信小程序、支付宝小程序的支付能力。

unipay是开源 sdk，可放心使用。本插件还包含示例工程，配置自己在微信和支付宝申请的相关配置后即可运行。

为了更好的体验支付流程可以在插件市场导入unipay的示例项目快速体验，插件市场 unipay 。gitee仓库 unipay公共模块 。

插件市场还有基于uniPay再次封装的模板，前端支付、管理端订单管理均已写好，拿去就用，见：BaseCloud - 统一下单支付业务模块

开发者可以自行选择是从插件市场导入还是从 npm 安装，引入方式略有不同，请看下面示例

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.getOrderInfo

此接口支持直接传微信和支付宝官方文档上的参数，如微信的 support_fapiao 参数，转成驼峰 supportFapiao 即可

示例源码如下，请查看 pre > code 标签中的内容

微信支付tradeType为MWEB时需要传递以下格式的sceneInfo

示例源码如下，请查看 pre > code 标签中的内容

uni-pay 已内置以上业务类型常量字段，开发者可以直接使用

示例源码如下，请查看 pre > code 标签中的内容

tradeType为NATIVE时直接将orderInfo.codeUrl转为二维码使用对应的客户端扫码支付即可

tradeType为MWEB时直接跳转到orderInfo.mwebUrl进行支付即可

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.orderQuery, 根据商户订单号或者平台订单号查询订单信息，主要用于未接收到支付通知时可以使用此接口进行支付结果验证

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.closeOrder，用于交易创建后，用户在一定时间内未进行支付，可调用该接口直接将未付款的交易进行关闭，避免重复支付。

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.cancelOrder，此接口仅支付宝支持，支付交易返回失败或支付系统超时，调用该接口撤销交易。如果此订单用户支付失败，支付宝系统会将此订单关闭；如果用户支付成功，支付宝系统会将此订单资金退还给用户。 注意：只有发生支付系统超时或者支付结果未知时可调用撤销，其他正常支付的单如需实现相同功能请调用申请退款 API。提交支付交易后调用【查询订单 API】，没有明确的支付结果再调用【撤销订单 API】。

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.refund,当交易发生之后一段时间内，由于买家或者卖家的原因需要退款时，卖家可以通过退款接口将支付款退还给买家。

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.refundQuery，提交退款申请后，通过调用该接口查询退款状态。

refundRoyaltysItem 说明

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.downloadBill，商户可以通过该接口下载历史交易清单。仅微信支付支持

当日所有订单 交易时间,公众账号 ID,商户号,子商户号,设备号,微信订单号,商户订单号,用户标识,交易类型,交易状态,付款银行,货币种类,总金额,代金券或立减优惠金额,微信退款单号,商户退款单号,退款金额, 代金券或立减优惠退款金额，退款类型，退款状态,商品名称,商户数据包,手续费,费率

当日成功支付的订单 交易时间,公众账号 ID,商户号,子商户号,设备号,微信订单号,商户订单号,用户标识,交易类型,交易状态,付款银行,货币种类,总金额, 代金券或立减优惠金额,商品名称,商户数据包,手续费,费率

当日退款的订单 交易时间,公众账号 ID,商户号,子商户号,设备号,微信订单号,商户订单号,用户标识,交易类型,交易状态,付款银行,货币种类,总金额, 代金券或立减优惠金额,退款申请时间,退款成功时间,微信退款单号,商户退款单号,退款金额, 代金券或立减优惠退款金额,退款类型,退款状态,商品名称,商户数据包,手续费,费率

从第二行起，为数据记录，各参数以逗号分隔，参数前增加`符号，为标准键盘 1 左边键的字符，字段顺序与表头一致。

倒数第二行为订单统计标题，最后一行为统计数据

总交易单数，总交易额，总退款金额，总代金券或立减优惠退款金额，手续费总金额

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.downloadFundflow,商户可以通过该接口下载自 2017 年 6 月 1 日起的历史资金流水账单。仅微信支持

记账时间,微信支付业务单号,资金流水单号,业务名称,业务类型,收支类型,收支金额（元）,账户结余（元）,资金变更提交申请人,备注,业务凭证号

从第二行起，为资金流水数据，各参数以逗号分隔，参数前增加`符号，为标准键盘 1 左边键的字符，字段顺序与表头一致

资金流水总笔数,收入笔数,收入金额,支出笔数,支出金额

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：支付宝在非全量退款时也会发送通知到支付时设置的notify_url

unipayIns.verifyPaymentNotify，用于在使用云函数 Url 化的云函数内检验并处理支付结果。

示例源码如下，请查看 pre > code 标签中的内容

注意：支付宝在非全量退款时才会发送通知，通知地址为支付时设置的notify_url

uni-pay 1.0.17版本起新增对支付宝退款结果通知的支持

unipayIns.verifyRefundNotify，用于在使用云函数 Url 化的云函数内检验并处理支付结果。

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.checkNotifyType，用于在使用云函数 Url 化的云函数内检验当前通知的类型。由于支付宝支付在非全量退款时会调用支付时设置的notify_url，可以使用此接口在调用校验通知之前判断通知类型

示例源码如下，请查看 pre > code 标签中的内容

unipayIns.verifyReceipt, 校验iap支付凭证返回交易信息。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// 插件市场导入
const unipay = require('uni-pay')

// npm安装
const unipay = require('@dcloudio/unipay')
```

Example 2 (javascript):
```javascript
// 插件市场导入
const unipay = require('uni-pay')

// npm安装
const unipay = require('@dcloudio/unipay')
```

Example 3 (javascript):
```javascript
// 插件市场导入
const unipay = require('uni-pay')

// npm安装
const unipay = require('@dcloudio/unipay')
```

Example 4 (javascript):
```javascript
// 插件市场导入
const unipay = require('uni-pay')

// npm安装
const unipay = require('@dcloudio/unipay')
```

---

## 定时触发 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/trigger.html

**Contents:**
- # 定时触发
  - # 字段规则
  - # Cron 表达式
  - # 通配符
  - # 辅助工具
  - # 示例
  - # 云函数、云对象入参说明
  - # 云对象使用定时触发

如果云函数需要定时/定期执行，即定时触发，您可以使用云函数定时触发器。已配置定时触发器的云函数，会在相应时间点被自动触发，函数的返回结果不会返回给调用方。

使用定时触发可以执行一些跑批任务，支付宝小程序定时触发最大超时时间为3小时，阿里云可以在使用定时触发时将云函数最高超时时间设置为600秒，腾讯云定时触发最大超时时间为900秒。

在uniCloud web控制台点击需要添加触发器的云函数详情，创建云函数触发器，格式如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在package.json内配置定时触发时统一了云厂商的写法，请参考：云函数package.json

Cron 表达式有七个必需字段，按空格分隔。其中，每个字段都有相应的取值范围：

下面列举一些 Cron 表达式和相关含义：

使用定时触发器调用云函数时云函数会收到特定的参数。两个平台的参数如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

2023年7月14日起阿里云入参对齐腾讯云，保留上述triggerName和triggerTime（不再推荐使用这两个属性），增加Time、TriggerName、Type。

2023年7月14日起_timing方法可以获取定时触发参数

配置完成后会定时触发云对象内置特殊方法_timing

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (json):
```json
// 参数是触发器数组，目前仅支持一个触发器，即数组只能填写一个，不可添加多个
// 实际添加时请务必去除注释
[
  {
    // name: 触发器的名字，规则见下方说明
    "name": "myTrigger",
    // type: 触发器类型，目前仅支持 timer （即定时触发器）
    "type": "timer",
    // config: 触发器配置，在定时触发器下，config 格式为 cron 表达式，规则见下方说明
    "config": "0 0 2 1 * * *"
  }
]
```

Example 2 (json):
```json
// 参数是触发器数组，目前仅支持一个触发器，即数组只能填写一个，不可添加多个
// 实际添加时请务必去除注释
[
  {
    // name: 触发器的名字，规则见下方说明
    "name": "myTrigger",
    // type: 触发器类型，目前仅支持 timer （即定时触发器）
    "type": "timer",
    // config: 触发器配置，在定时触发器下，config 格式为 cron 表达式，规则见下方说明
    "config": "0 0 2 1 * * *"
  }
]
```

Example 3 (json):
```json
// 参数是触发器数组，目前仅支持一个触发器，即数组只能填写一个，不可添加多个
// 实际添加时请务必去除注释
[
  {
    // name: 触发器的名字，规则见下方说明
    "name": "myTrigger",
    // type: 触发器类型，目前仅支持 timer （即定时触发器）
    "type": "timer",
    // config: 触发器配置，在定时触发器下，config 格式为 cron 表达式，规则见下方说明
    "config": "0 0 2 1 * * *"
  }
]
```

Example 4 (json):
```json
// 参数是触发器数组，目前仅支持一个触发器，即数组只能填写一个，不可添加多个
// 实际添加时请务必去除注释
[
  {
    // name: 触发器的名字，规则见下方说明
    "name": "myTrigger",
    // type: 触发器类型，目前仅支持 timer （即定时触发器）
    "type": "timer",
    // config: 触发器配置，在定时触发器下，config 格式为 cron 表达式，规则见下方说明
    "config": "0 0 2 1 * * *"
  }
]
```

---

## 开通@open | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/redis-buy.html

**Contents:**
- # 开通
- # 规格说明
  - # 阿里云
  - # 腾讯云
  - # 支付宝云
- # 费用说明
  - # 续费
  - # 升配
  - # 降配
- # 在云函数中使用

2021年11月18日，已支持腾讯云和阿里云 2023年10月24日，已支持支付宝云

目前可以在uniCloud web控制台购买redis服务，所购买的实例由云厂商提供，并非由DCloud提供，DCloud只提供购买入口

在uniCloud web控制台redis详情页面点击续费按钮可以对redis实例进行续费操作。

实例到期后的第1~7天，实例状态为被禁用，无法被访问。如需继续使用，您需要及时为实例续费

实例处于被禁用状态后，以您执行续费操作的时间为起点计算包年包月时长，例如您的实例在2021年04月10日到期，在2021年04月15日执行手动续费1个月的操作，那么实例的到期时间即为2021年5月15日。

在uniCloud web控制台redis详情页面点击变配按钮可以对redis实例进行升配操作。升级配置需要按照剩余时间补足差额

升级实例配置所需费用 =（升级后实例每天的价格 - 升级前实例每天的价格）× 服务到期的剩余天数，具体费用以web控制台显示为准

在uniCloud web控制台redis详情页面点击变配按钮可以对redis实例进行降配操作。

如何在云函数中使用redis，请参考扩展能力Redis

为什么刚开通的redis实例就用了几十MB内存

redis基础服务会占用一定的内存，大小在32MB-64MB之间

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-pay.html

---

## uni-pay-x | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-pay/uni-app-x.html

**Contents:**
- # uni-pay-x
- # 简介
- # uni-pay-x组成
  - # uni-pay-x的uni_modules
  - # uni-pay-x的uni-config-center配置
  - # uni-pay的opendb数据表
- # 示例项目运行教程
- # uni-pay的config-center配置
  - # 完整支付配置示例
  - # 支付回调配置

uni-pay-x 是 uni-pay 的 uni-app x 版

本文档适用于客户端为 uni-app x 的版本，需 HBuilderX 4.02 及以上版本。若客户端为 uni-app 则请访问：uni-pay 文档

支付，重要的变现手段，但开发复杂。在不同端，对接微信支付、支付宝等渠道，前端后端都要写不少代码。

涉及金额可不是小事，生成业务订单、获取收银台、发起支付、支付状态查询、支付异步回调、失败处理、发起退款、退款状态查询、支付统计...众多环节，代码量多，出错率高。

为什么不能有一个开源的、高质量的项目？即可以避免大家重复开发，又可以安心使用，不担心自己从头写产生Bug。

开发者在项目中引入 uni-pay-x 后，微信支付、支付宝支付等功能无需自己再开发。由于源码的开放性和层次结构清晰，有二次开发需求也很方便调整。

插件市场地址：https://ext.dcloud.net.cn/plugin?name=uni-pay-x

支付统计（内置于uni-admin的支付统计中）

uni-pay-x云端一体模板，包含前端页面、云对象、云端公共模块、uni-config-center配置、opendb数据表等内容。以及内置于uni-admin的支付统计报表。

uni-pay-x的uni_modules 中包含了前端页面、云对象和公共模块，目录结构如下：

示例源码如下，请查看 pre > code 标签中的内容

支付配置不在插件目录中，统一存放在 uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.js 查看支付配置介绍

支付插件需要创建以下表后才能正常运行，可以右键 database 目录，初始化数据库功能来创建表。

在对接自己的项目之前，建议先跑通示例项目，能跑通示例项目，代表你的配置和证书一定是正确的，然后再将uni-pay-x集成到你自己的项目中。

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

在对接自己的项目之前，建议先跑通示例项目，能跑通示例项目，代表你的配置和证书一定是正确的，然后再将uni-pay集成到你自己的项目中。

示例源码如下，请查看 pre > code 标签中的内容

打开你需要进行支付的页面，一般是业务订单提交之后的页面来展现收银台。

注意：vue3下ref不可以等于组件名，因此这里 ref="payRef" 而不能是 ref="uniPay"

示例源码如下，请查看 pre > code 标签中的内容

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

示例源码如下，请查看 pre > code 标签中的内容

方式调用，详情调用方式参考下方的【前端完整示例代码】

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

收银台页面源码在 /uni_modules/uni-pay-x/pages/pay-desk/pay-desk 中

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

苹果虚拟支付：In-App Purchase，是指苹果 App Store 的应用内购买，是苹果为 App 内购买虚拟商品或服务提供的一套交易系统。

适用范围：在 App 内需要付费使用的产品功能或虚拟商品/服务，如游戏道具、电子书、音乐、视频、订阅会员、App的高级功能等需要使用 IAP，而在 App 内购买实体商品（如淘宝购买手机）或者不在 App 内使用的虚拟商品（如充话费）或服务（如滴滴叫车）则不适用于 IAP。

简而言之，苹果规定：适用范围内的虚拟商品或服务，必须使用 IAP 进行购买支付，不允许使用支付宝、微信支付等其它第三方支付方式（包括Apple Pay），也不允许以任何方式（包括跳出App、提示文案等）引导用户通过应用外部渠道购买。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

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

微信小程序支付除了配置uni-pay的支付配置外，还需要配置 manifest.json 内的 微信小程序appid

APP支付除了配置uni-pay的支付配置外，还需要打包时添加支付模块，如下图所示。

同时，还需要打自定义基座（包名需要和开放平台下填写的一致），且你在开放平台下的这个应用必须通过审核才可以。（比如微信开放平台下的APP应用显示通过审核才可以）

示例源码如下，请查看 pre > code 标签中的内容

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
│    └─uni-pay-x
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
│        │    └─uni-pay
│        │        └─uni-pay.vue                       uni-pay收银台弹窗组件
│        │    └─uni-pay-popup
│        │        └─uni-pay-popup.vue                 弹窗子组件
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        │    └─pay-desk
│        │        └─pay-desk.js                       收银台页面
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 2 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay-x
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
│        │    └─uni-pay
│        │        └─uni-pay.vue                       uni-pay收银台弹窗组件
│        │    └─uni-pay-popup
│        │        └─uni-pay-popup.vue                 弹窗子组件
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        │    └─pay-desk
│        │        └─pay-desk.js                       收银台页面
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 3 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay-x
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
│        │    └─uni-pay
│        │        └─uni-pay.vue                       uni-pay收银台弹窗组件
│        │    └─uni-pay-popup
│        │        └─uni-pay-popup.vue                 弹窗子组件
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        │    └─pay-desk
│        │        └─pay-desk.js                       收银台页面
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

Example 4 (markdown):
```markdown
├─uni_modules                                         存放[uni_module](https://uniapp.dcloud.net.cn/plugin/uni_modules.html)规范的插件。
│    ├─其他module
│    └─uni-pay-x
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
│        │    └─uni-pay
│        │        └─uni-pay.vue                       uni-pay收银台弹窗组件
│        │    └─uni-pay-popup
│        │        └─uni-pay-popup.vue                 弹窗子组件
│        ├─js_sdk                                     js sdk目录
│        │    └─js_sdk.js
│        ├─pages                                      页面目录
│        │    └─success
│        │        └─success.js                        支付成功结果页
│        │    └─pay-desk
│        │        └─pay-desk.js                       收银台页面
│        ├─static                                     静态资源目录
│        ├─changelog.md                               更新日志
│        ├─package.json                               包管理文件
│        └─readme.md                                  插件自述文件
```

---

## uniCloud基础问题 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/faq.html

**Contents:**
- # uniCloud基础问题
  - # uniCloud和微信小程序云开发、支付宝云开发有何区别？
  - # uniCloud稳定吗？DCloud服务器异常会影响我的线上业务吗？
  - # 云开发是nodejs+改良版MongoDB组合，对比php+mysql的传统组合怎么样？
  - # 支持websocket吗？
  - # uniCloud访问速度感觉不如传统服务器？
  - # 发布H5时还得自己找个服务器部署前端网页，可以不用自己再找服务器吗？
  - # 腾讯、阿里的serverless有什么大案例？
  - # 港澳台及境外用户访问比较慢怎么办
  - # 发生故障时如何判断故障点

微信、支付宝、百度的小程序，均提供了云开发。但它们都仅支持自家小程序，无法在其他端使用。

uniCloud和微信小程序云开发、支付宝云开发使用相同的基础建设平台，微信小程序云开发背后是腾讯云的TCB团队，支付宝云开发背后是阿里小程序云团队。uniCloud是DCloud和阿里小程序云团队、腾讯云的TCB团队直接展开深层次合作，在他们底层资源的基础上进行二次封装，提供的跨端云开发方案。

简单来说，uniCloud和微信小程序云开发、支付宝云开发一样稳定健壮，但有更多优势：

如果你已经使用过微信小程序云开发，想进一步了解对比差异或如何从微信小程序云迁移到uniCloud，详见

uniCloud是 DCloud 和阿里云、腾讯云等成熟云厂商合作推出的云服务产品，阿里云、腾讯云等提供云端基础资源，DCloud提供API设计、前端框架、IDE工具支持、管理控制台、插件生态等服务，开发者的云函数直接托管在阿里云等服务商的serverless平台。

用户终端上的应用在运行时，直连云服务商serverless平台，不会经过DCloud服务器，开发者无需担心因DCloud服务器负载而影响自己业务的问题。

阿里云和腾讯云都有商业级SLA。如果真出问题，他们会负责赔偿。

nodejs的性能优于php，MongoDB的性能也优于mysql。

对于前端而言，MongoDB这种类json的文档数据库更加易用，且有更高的灵活性。 操作MongoDB仍然使用js的方法。

MongoDB非常灵活，可以对大数据量的表随便增加字段。而mysql的表数据量一旦变大，每增加一个字段，数据库的体积和性能都会造成负面影响。

MongoDB的字段可以嵌套，表达tree型的数据非常方便，扩展起来随心所欲。

对于希望增加数据冗余以提高性能的开发者而言，nosql数据库则是利器。

当然，对于喜欢传统数据库的开发者而言，仍然可以按传统方式设计数据库表结构。

MongoDB的功能要比mysql强大很多。sql太简单的了，一段sql语句其实就是一个字符串，写不了复杂的逻辑。

而MongoDB有非常多的js api，各种聚合运算符，它是可编程的，而不是仅靠一段字符串sql语句来表达。

举个例子，商品数据表中有4个字段：浏览量、收藏量、购买量、评价。需要生成一个近期热门商品列表，4个字段各占25%的权重，加权后排序。这种需求sql是无法直接实现的。而MongoDB里可以一个查询直接返回排序好的结果。

SQL的模糊查询也很弱，like只有前后%，导致很多开发者不得不再使用ElastciSearch这些三方数据库。虽然后期版本的mysql也支持有限正则。但MongoDB的正则查询还是超过开发者预期的强大。

MongoDB虽然强大，但易用性不佳，尤其是聚合运算写起来非常复杂。

uniCloud在MongoDB的基础上改良，进一步提供了DB Schema和JQL。

DB Schema是一个json文件，可以对数据进行描述、约定字段值域、控制操作权限、描述字段之间的关系，让数据库管理更高效，并且大幅降低了服务端的代码开发工作量。详见

JQL是一套操作uniCloud数据库的方法，它更符合js开发者的习惯，并且极大的降低了学习成本和代码量。 比如联表查询、tree查询，都变的非常简单。像tree查询是以往只有oracle才有的功能。JQL文档详见

曾经DCloud官方也推进过阿里云和腾讯云提供serverless的mysql。但经过对MongoDB的深入研究和改良，DCloud已经放弃了难用的mysql。推荐开发者了解uniCloud的云数据库，用起来更强大和方便。

在云函数请求三方服务器时支持任意方式请求，包括http、websocket（需要使用nodejs原始的写法或三方包，后续uniCloud会支持websocket相关接口）等。下面说明的是针对云函数和客户端之间的通讯的说明

有开发者在一台单机上安装php或java，连接同电脑的mysql。然后与uniCloud比较速度，认为uniCloud偏慢。这里需要澄清如下差异：

原因2. 代码和数据库不在一台服务器 在一台单机上安装php或java，同时安装数据库，访问速度确实快。但在使用云数据库时，即数据库是单独的服务器，和运行代码不在一台服务器上时，就会略微造成些延迟。但商业应用的数据库肯定都是独立服务器。

原因3. 拦截器 后端开发的请求一般都有路由管理框架或拦截器，每个请求都要拦截，校验权限。使用这类框架肯定会增加耗时。

clientDB就是这种情况，因为clientDB内部有权限校验系统，某些权限的验证还需要数据库查询。

所以虽然clientDB的速度慢一些，但实际上开发者在自己写了路由拦截和权限管理的框架后，速度也一样会下降。

从uni-id 3.0起，用户的角色权限缓存在token里，不再查库。clientDB的速度比之前提升了100毫秒左右。如果还未升级，请尽快升级 。同时注意如果用了uniCloud admin，也要配套升级。如果自己在云函数里编写过相关业务逻辑，请务必阅读升级注意事项。

查询表的索引要正确配置，需要在where里查询的字段都建议配上索引，否则查询会很慢。

但注意索引不能太多，否则增删改数据时又会变慢，精准很重要。推荐详细阅读索引文档

uniCloud支持前端网页托管 ，选择阿里云作为云厂商时完全免费！

如果是因为微信js sdk等服务要求配置固定ip白名单，那么腾讯云收费空间已经支持固定ip，详见

港澳台及海外/国外用户需要使用全球加速（海外加速）。uniCloud服务商为阿里云时支持配置全球加速，步骤如下：

当你的系统出问题时，如何判断是DCloud还是阿里云或腾讯云的问题？

首先再次声明，DCloud的服务仅限于开发阶段。发行部署后，应用的访问不经过DCloud的服务器。

当然还有一种情况报错，其实是客户端的问题，包括浏览器的跨域问题，或者小程序的域名白名单问题，导致客户端无法连接uniCloud。这需要通过配置来解决，参考文档：小程序和浏览器的域名访问配置

如果测试系统不正常，那就说明这家云厂商的服务出故障了。

这几个系统是完全独立的，如果这几个系统都故障了，那就是云厂商都故障了，而不是DCloud服务故障了。再次声明，发布后的服务，不连接DCloud的服务器。

当遇到uniCloud故障时，在uniCloud的IM群或论坛里反馈即可。因为云厂商其实都有拨测系统，他们也会及时知道故障并解决的。

operation exceeded time limit、云数据库执行时间超限错误

此错误一般由数据库操作超时引发，具体如何优化请参考：性能优化

使用事务时出现WriteConflict错误

事务的执行会锁行，同时执行的不同事务在操作同一行数据是会存在冲突导致写入失败。尽量优化流程，避免事务互相冲突

可能出现的错误信息有：请求云函数超时、Response timeout for 10000ms, POST https://api.next.bspapp.com/server -1

此问题一般是数据库长时间未访问，mongoDB WiredTiger存储引擎在内存中淘汰了表和索引，导致数据库请求超时引发云函数报错。

**腾讯云报SIGN_PARAM_INVALID signature is expired**错误

此问题一般出现在腾讯云云函数本地调试时，一般由当前开发用机器系统时间错误引起

腾讯云报access token disabled for ANONYMOUS login错误

服务空间从来没有上传过云函数，上传一个云函数即可。

2024年12月之后新建的腾讯云空间，如果上传函数后仍报该错误，请使用HBuilderX 4.41及以上版本重新编译并发布前端页面来解决。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/ip-filter.html

**Contents:**
- # 基于Redis（阿里&腾讯云）
  - # 启用IP防刷功能
    - # 生效范围
  - # IP黑名单
    - # IP网段规则
    - # 黑名单用到的Redis key
    - # 注意事项
  - # IP访问频率控制
    - # IP访问频率控制用到的Redis key
    - # 注意事项

IP防刷功能旨在阻止某些ip的访问和防范短时间内大量相同ip请求导致云函数或数据库无法及时响应。

虽然uniCloud是serverless，云函数很难被打垮。但

不管是开发者被ddos攻击，还是因为发放奖励、促销或激励视频广告导致被刷单、刷激励，都应该开通ip防刷功能。

阿里云、腾讯云未提供网关层面的IP防刷功能，所以需要开通Redis来采用基于Redis的方案。该方案是在云函数中执行IP防刷功能相关的逻辑，因此在拒绝IP请求时也会消耗最小计费单元（配置的内存*100ms）的GBs。

支付宝云提供的是网关层面的IP防刷功能，不需要依赖Redis，命中防刷规则的请求会自动被网关拦截不会进入云函数执行逻辑，因此不会消耗GBs，被拒的请求在云函数内也查不到请求日志。

仅本地调试时需HBuilderX 3.5.4+。云端无版本限制，在uniCloud web控制台打开ip防刷即可 基于Redis方案适用于阿里云、腾讯云服务空间

在完成上2步的服务空间中，在如下范围内支持ip防刷：

需要redis的原因是被拉黑的IP需要存在redis内，其key为：unicloud:ip-black-list:set。 如果这些信息存在MongoDB中其实没有防刷的意义，而redis作为内存数据库，访问速度极快且不按照访问次数计费，是最佳方案。

IP黑名单是用来完全阻止设定的IP或IP网段（cidr规范）访问云函数或clientDB的功能。

被封禁IP访问云函数及clientDB时会收到错误响应，错误码为：ACCESS_DENIED，错误信息为：Access denied

示例源码如下，请查看 pre > code 标签中的内容

通常书写IPv4地址时会将IPv4地址写成由点分割的四段数字，每段取值范围为0-255。IP网段则是由IP加掩码位数组成的字符串，用于表示一个IP区间。

以192.168.12.1/20为例，要计算其表示的IP区间可以先将四段IP转为二进制（每段不足8位的往前补0）11000000.10101000.00001100.00000001，掩码位数20则表示经过此规则转化后的IP只要前20位和192.168.12.1转换后相同则此IP在192.168.12.1/20这个IP网段内。即IP区间为11000000.10101000.00000000.00000000(192.168.0.0) - 11000000.10101000.00001111.11111111(192.168.15.255)

开发者配置的黑名单会以Set类型存储在redis内，其key为：unicloud:ip-black-list:set

IP访问频率控制用于限制单个IP访问云函数的频率。如图所示，开发者可以配置${duration}秒内请求超过${limit}次，则将会临时封禁${blockTime}秒。

就客户端体验来说这个配置表示，任意连续duration秒内访问均不可超过limit次，否则将会临时封禁blockTime秒。对于有相关开发经验的开发者来说应该很容易看出这就是一个漏桶算法的实现。

访问频率过高的用户及由于访问频率过高被临时封禁的用户访问云函数及clientDB时会收到错误响应，错误码为：OPERATION_TOO_FREQUENT，错误信息为：Operation is too frequent, please try again later

示例源码如下，请查看 pre > code 标签中的内容

开发者配置的duration、limit、blockTime三个参数以hash类型存储在redis内，key为：unicloud:ip-freq-config:hash。

示例源码如下，请查看 pre > code 标签中的内容

IP频率控制信息的以hash类型存储在redis内，key为：unicloud:ip-info:${ip}:hash其中${ip}表示客户端的ip

示例源码如下，请查看 pre > code 标签中的内容

临时封禁信息以string类型存储在redis内，key为：unicloud:ip-blocked:${ip}:string其中${ip}表示客户端的ip

在uniCloud web控制台左侧导航开启ip防刷：uniCloud web控制台 ，IP防刷配置项修改大约需要3分钟生效。

IP访问频率控制用于限制单个IP访问云函数的频率，可实现 x 秒内请求超过 y 次，则超限制的请求会被临时封禁 z 秒。

x取值范围：60-86400（秒），y取值范围：100-99999999（次），z取值范围：60-259200（秒）。

被封禁IP访问云函数及clientDB时会收到http状态码为500的错误响应，错误码为：50050，错误信息为：防刷限流异常-触发黑名单规则，内容如下：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
// 云函数
const res = await uniCloud.callFunction({
  name: 'test',
  data: {}
})
// res.result = {
//   errCode: 'ACCESS_DENIED',
//   errMsg: 'Access denied'
// }

// 对于云对象而言，上述返回结果符合响应体规范因为会转化为错误抛出
const obj = uniCloud.importObject('obj')
try {
  const res = await obj.test()
} catch (e) {
  // e.errCode = 'ACCESS_DENIED'
  // e.errMsg = 'Access denied'
}
```

Example 2 (javascript):
```javascript
// 云函数
const res = await uniCloud.callFunction({
  name: 'test',
  data: {}
})
// res.result = {
//   errCode: 'ACCESS_DENIED',
//   errMsg: 'Access denied'
// }

// 对于云对象而言，上述返回结果符合响应体规范因为会转化为错误抛出
const obj = uniCloud.importObject('obj')
try {
  const res = await obj.test()
} catch (e) {
  // e.errCode = 'ACCESS_DENIED'
  // e.errMsg = 'Access denied'
}
```

Example 3 (javascript):
```javascript
// 云函数
const res = await uniCloud.callFunction({
  name: 'test',
  data: {}
})
// res.result = {
//   errCode: 'ACCESS_DENIED',
//   errMsg: 'Access denied'
// }

// 对于云对象而言，上述返回结果符合响应体规范因为会转化为错误抛出
const obj = uniCloud.importObject('obj')
try {
  const res = await obj.test()
} catch (e) {
  // e.errCode = 'ACCESS_DENIED'
  // e.errMsg = 'Access denied'
}
```

Example 4 (javascript):
```javascript
// 云函数
const res = await uniCloud.callFunction({
  name: 'test',
  data: {}
})
// res.result = {
//   errCode: 'ACCESS_DENIED',
//   errMsg: 'Access denied'
// }

// 对于云对象而言，上述返回结果符合响应体规范因为会转化为错误抛出
const obj = uniCloud.importObject('obj')
try {
  const res = await obj.test()
} catch (e) {
  // e.errCode = 'ACCESS_DENIED'
  // e.errMsg = 'Access denied'
}
```

---

## App升级中心 uni-upgrade-center | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/upgrade-center.html

**Contents:**
- # App升级中心 uni-upgrade-center
  - # 概述
  - # 为什么需要升级中心？
  - # uni-upgrade-center Admin 管理后台
    - # 使用教程
  - # uni-upgrade-center-app 前台检测更新
    - # 目录结构
    - # 在 uni-app 中使用升级中心
    - # 在 uni-app x 中使用升级中心 0.7.0+
    - # 在 HarmonyOS Next 中使用升级中心 0.9.1+ HBuilderX 4.32+

App升级中心 uni-upgrade-center，提供了 App 的版本更新服务。包括

如果需要初次发布，而不是升级，另见产品 uni-portal 统一发布页

开源、免费。uniCloud阿里云版和支付宝云版都有免费空间。

云端基于 uniCloud 实现。后台管理是 uni-admin 框架的插件。

关于应用转让后升级中心（uni-upgrade-center）的使用问题 详情

为了一套代码同时兼容uni-app和uni-app x，升级中心原本的 js 文件改为了 ts 文件。如果开发者的项目下未使用ts，那么需要增加ts编译。HBuilderX项目会自动加载ts编译器，cli项目则需要自己手动配置。

每个App开发者都要开发升级功能，这是巨大的社会资料浪费。DCloud推出 uni-upgrade-center，让应用开发更轻松、高效，让开发者专注于自己的业务。

升级中心分为两个部分：uni-upgrade-center Admin管理后台 和 uni-upgrade-center-app前台检测更新 。

负责发布新版和管理历史版本的上下线。提供了如下功能：

云储存安装包CDN加速，使安装包下载的更快、更稳定

应用管理，对 App 的信息记录和应用版本管理

版本管理，可以发布新版，也可方便直观的对当前 App 历史版本以及线上发行版本进行查看、编辑和删除操作

版本发布信息管理，包括 更新标题，更新内容，版本号，静默更新，强制更新，灵活上线发行 的设置和修改

原生 App 安装包，发布 Apk 更新，用于 App 的整包更新，可设置是否强制更新

wgt 资源包，发布 wgt 更新，用于 App 的热更新，可设置是否强制更新，静默更新（uni-app x的app-Android由于编译为纯原生，没有wgt包，无法热更新）

App 管理列表及 App 版本记录列表搜索

新建项目：打开HBuilderX -> 文件 -> 新建 -> 项目 -> uni-app 选择 uniCloud admin模板，键入一个名字，确定

鼠标右键 uniCloud 文件夹 选择关联云服务空间和运行云服务空间初始化向导

运行 uni-admin 到浏览器，在左侧菜单 系统管理 -> 应用管理 中新增应用后，即可在 App升级中心 发布该应用的版本 详情

添加应用后，即可在应用管理列表中跳转至版本管理页面：

版本号：请填写以.分隔字符串，例如：0.0.1。在构建应用安装包时，manifest.json 中的 应用版本名称 也要是该格式。

uni-upgrade-center 云函数 - 检查应用更新：

根据传参，先检测传参是否完整，appid appVersion wgtVersion 必传，is_uniapp_x 选传，默认 false

先从数据库取出所有该平台（会从上下文读取平台信息）的所有线上发行更新

再从所有线上发行更新中取出版本最大的一版。如果可以，尽量先检测wgt的线上发行版更新

使用上一步取出的版本包的版本号 和传参 appVersion、wgtVersion 来检测是否有更新。必须同时大于这两项，因为上一次可能是wgt热更新，否则返回暂无更新

如果库中 wgt包 版本大于传参 appVersion，但是不满足 min_uni_version < appVersion，则不会使用wgt更新，会接着判断库中 app包version 是否大于 appVersion

\uni_modules\uni-upgrade-center\pages\mixin\version_add_detail_mixin.js

将 data 中的 enableiOSWgt 属性设置为 true 即可

除了管理端，升级中心还包括客户端。负责前台检查升级更新，弹出提示框，下载和安装新版。

基于uni-upgrade-center一站式检查更新，统一整包与 wgt 资源包更新

自行根据传参完成校验，判断此次更新使用哪种方式

弹框、下载、安装、是否强制重启等逻辑已集成

下载完成如被用户取消升级，自动缓存安装包，下次进入判断是否符合安装条件，判断通过会复用已下载的包进行安装；判断不通过则自动清除（uni-app x 的 app-Android 端暂不支持安装包缓存功能：下载到临时保存目录，在 App 下次启动时自动清除）

在插件市场打开本插件页面，在右侧点击使用 HBuilderX 导入插件，选择要导入的项目点击确定 插件地址

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将@/uni_modules/uni-upgrade-center-app/utils/check-update 使用 import 导入到需要用到的地方调用一下即可（一般在首页调用或设置页面检查更新按钮调用）：

示例源码如下，请查看 pre > code 标签中的内容

在需要调用的 页面 中（一般在首页加载完成后调用或设置页面检查更新按钮调用）执行 checkUpdate 方法，比如在 onReady 生命周期中（ 注： 因为是组件所以一定要保证组件加载完毕），以下为完整使用示例：

示例源码如下，请查看 pre > code 标签中的内容

升级弹框可自行编写，也可以使用uni.showModal，或使用现有的升级弹框样式，如果不满足UI需求请自行替换 static 目录下的资源文件。在utils/check-update.ts中都有实例。

注意 使用wgt更新，打包前请务必将 manifest.json 中的版本名称修改为更高版本。（请使用类似 1.0.0 以 . 分隔的多段式格式）

在插件市场打开本插件页面，在右侧点击使用 HBuilderX 导入插件，选择要导入的项目点击确定 插件地址

如果是uni-app，需在pages.json中添加页面路径。注：请不要设置为pages.json中第一项

示例源码如下，请查看 pre > code 标签中的内容

在 script 标签内顶部引入 checkUpdate 方法

示例源码如下，请查看 pre > code 标签中的内容

在需要调用的 页面 中（一般在首页加载完成后调用或设置页面检查更新按钮调用）执行 checkUpdate 方法，比如在 onReady 生命周期中（ 注： 因为是组件所以一定要保证组件加载完毕），以下为完整使用示例：

示例源码如下，请查看 pre > code 标签中的内容

当你打开调用升级中心组件的页面就会检查更新，如有更新就出弹窗。也可以在其他页面或者组件中使用

注意 在 uni-app x 的 app-Android 端没有 wgt 更新，也不会检测到 wgt 包的更新

步骤 1 - 5 可以参考 uni-app 的使用指引，然后接下来的步骤为：

在需要使用的地方引入 js 和组件，一般为首页：

示例源码如下，请查看 pre > code 标签中的内容

在 components 中声明组件，并新建方法来供 template 调用（也可以在 onLoad 生命周期中调用）：

示例源码如下，请查看 pre > code 标签中的内容

在 template 中使用 button 组件来触发升级检测：

示例源码如下，请查看 pre > code 标签中的内容

如果是静默更新（wgt 更新特有），则不会打开更新弹框，只在后台下载后安装，下次启动应用生效

如果是 iOS，则会直接打开AppStore的链接

会将检查更新云函数返回的结果保存在localStorage中，并跳转进入upgrade-popup.vue打开更新弹框

此处版本与 gitee 的 tag 和 uni-upgrade-center-app 的版本相对应

使用升级中心，涉及uniCloud的付费问题，那么相比于自己搭服务器，使用uniCloud的费用到底合不合适。这里帮开发者算下账。

以阿里云按量计费 为例，预测下uni-upgrade-center在不同用户规模下的资源消耗及对应费用，帮助大家明智选择。

uni-upgrade-center升级中心涉及费用的部分主要分为：

接下来，我们对不同资源，分别进行费用评估。

启用uni-upgrade-center升级中心后，你的App每次启动，会请求一次uni-upgrade-center云函数。

我们按照uniCloud官网列出的按量计费 规则，可以得出如下云函数资源消耗计算公式：

云函数费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，你的App若有100个日活用户，其升级中心云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

即：你的App日活为100，使用uni-upgrade-center商业版后，对应云函数每天大概消耗0.00081896元。

据此，可计算其每月的费用为：0.00081896 * 30 = 0.0245688，即每月只需2分钱；

同理，我们可推导出日活为1000、10000、10万的App，其升级中心云函数每月费用如下表：

日活1000的App，云函数月度消耗才两毛五（0.25元），真是毛毛雨了。

按照uniCloud官网 介绍，云数据库费用 = 容量费用 + 读操作次数费用 + 写操作次数费用，其中：

我们以hello uni-app为例，opendb-app-versions数据表中共存储30条升级记录，容量大小为8K。 据此可计算出opendb-app-versions表的日存储费用为：8/1024/1024 * 0.07 = 0.000000534

容量计费单位是G，故需先将8K折算成M，再折算成G，故上述公式中连续除了两个1024

1月按30天算，则月存储费用为0.000000534 * 30 = 0.000016，还不到1分钱，可忽略。

注意：数据库容量仅跟发布版本多少有关系，跟日活用户无关。

在uni升级中心业务中，云函数uni-upgrade-center每次执行，仅调用一次数据库读取（读取一次opendb-app-versions表），故数据库的读操作次数等同于云函数的调用次数，前文有过公式，云函数调用次数 = App日活 * 每日活用户平均每天启动App次数，每日活用户平均每天启动App次数我们假设为2次。

我们即可推算，如果一个App的日活为100，则uni升级中心每日云数据库读操作次数费用计算如下：

示例源码如下，请查看 pre > code 标签中的内容

1月按30天算，则每月云数据库读操作次数费用为0.0003 * 30 = 0.009，还不到1分钱。

同理，我们可推导出日活为1000、10000的App，其uni升级中心每月云数据库读操作次数费用为9分钱、9毛钱。

uni-upgrade-center升级中心，写数据库操作很少；管理员仅在每次发布新版时，通过uni-admin向opendb-app-versions表插入一条新版本信息；用户端App每次启动检查升级，无需数据表的写入操作，故写操作次数可忽略为0；

因为容量费和写操作次数费用均可忽略为0，根据公式：

示例源码如下，请查看 pre > code 标签中的内容

可推导，uni升级中心的云数据库计费主要是读操作次数计费，因此我们进一步得出如下预测：

按照uniCloud官网 介绍，云存储费用 = 容量费 + 下载操作次数计费点 + 上传操作次数计费点 + CDN流量费。

如果您的应用每次均上架到apple store或安卓各应用商店，升级时从应用商店下载安装，则云存储费用为0，因为使用的是应用商店的存储和CDN下载流量，本计费点测评章节可直接跳过。

uni-upgrade-center 支持设置应用新版安装包下载地址为应用商店地址，这样就可以使用应用商店的存储和CDN，不消耗uniCloud的云存储资源。

现阶段，iOS平台均需上架apple store，我们可以忽略iOS平台的云存储消耗。

如果您的安卓apk安装包及wgt差量升级包全部托管在uniCloud云存储中，我们也可以算算这笔账。

容量费主要是存储费用，我们可以定期将过期版本删除，从而节省容量费。

假设我们在云存储中保留最近5个版本的文件，apk/wgt全部保留，大小假设分别为：40M、10M。

如前所言，ipa需上架apple store，不使用云存储，测评可忽略。

则每天容量费用为：5 * (40+10)/1024 * 0.0043 = 0.0010498

据此，可计算其每月30天的容量费用为：0.0010498 * 30 = 0.031494，即只需3分钱；

注意：云存储容量仅跟保留的历史升级包多少有关系，跟日活用户无关。

下载操作次数计费点：仅触发文件下载时会触发，若无新版本下载，则不会触发。

假设你的App日活为100、月活为1500，每月发一次版本；月活用户中，50%会选择升级到新版本，我们可计算下载次数为：1500*50% = 750次。

而云存储的下载操作次数计费规则为：每万次0.01元，即每万次下载1分钱，750次下载远还不到1分钱，故下载操作计费点可直接忽略。

每次App发版，仅需管理员上传一次新的资源包，用户App端检查升级时，不涉及上传操作，故上传操作次数计费点亦可忽略。

CDN流量费：我们假设50%概率启用wgt资源包升级（升级包为10M），50%概率为整包升级；而整包升级中，20%为苹果用户（使用apple store流量），80%为安卓用户（升级包为40M）。

则按照如上数据模型，日活为100的App，假期其月活为1500，而月活用户中，50%会选择升级到新版本，即750人选择升级，不同升级包消耗CDN流量如下：

即：日活为100的App，月度CDN流量为：3.662 + 0 + 11.719 = 15.381G，对应费用则为：15.381 * 0.18 = 2.76858 （元）

同理，我们可推导出日活为1000的App，其升级中心云存储每月的CDN费用为27.6858元。

如果你不用uni-upgrade-center，选择如阿里云的传统OSS + CDN 方案，同样按量计费的情况下，1PB流量以内，传统CDN都没有价格优势；传统CDN每GB的起步价为0.24元，而uniCloud云存储CDN每GB的费用为0.18元。

1PB流量是什么概念？我们以每个安卓安装包为40M为例，需要 1 * 1024 * 1024 * 1024 / 40 = 26843546，即需要2600万人次安装包下载才能达到1PB流量，你可以评估一下你的App何时可以达到这个量级。

具体解释一下：1PB = 1024TB，1TB = 1024G，1G = 1024M，故上面公式连乘3个1024

也有人说了，购买阿里云CDN资源包可以更便宜。确实，购买大额资源包会更便宜，但这个方案有两个缺点：

综合来看，uniCloud云存储相比传统云厂商的OSS + CDN 方案：

uni-upgrade-center需要和uni-admin配合使用，uni-admin需要部署在前端网页托管中。uni-admin主要是管理员使用，使用频次较少，流量也较低。

按照uniCloud官网 介绍，前端网页托管费用 = 容量费 + 流量费。

uni-admin编译后为4.7M，按照官网每GB每天0.0043元的规则，uni-admin的月度容量费为：4.7 / 1024 * 0.0043 * 30 = 0.00059，不到1分钱，可忽略。

管理员登录uni-admin，到升级中心管理页面浏览并发布新版，所需流量不超过3M，即使每月发布2次更新，流量费预估为：3 / 1024 * 0.18 * 2 = 0.00105，也不到1分钱，也可忽略。

细项对比完了，我们来合并看看，使用uniCloud升级中心，到底需要花多少钱，相比传统自己研发升级逻辑、搭建升级中心，哪些地方都需要花钱，差异点在哪里？

不管是开发者自研的升级方案，还是uni-upgrade-center，存储+CDN的费用都是必需的，前文也将传统OSS+CDN和uniCloud云存储的性价比进行了对比，均按量计费的模式下，uniCloud更具性价比；以资源包方式购买传统CDN模式下，各有优劣。

既然两个方案，都绕不开云存储，那我们暂时抛开云存储对比，将其他各项按照日活用户规模罗列一下，看看uni-upgrade-center在其他维度所需费用。

使用uni-upgrade-center，免费获取、一键安装，你将获得：

如上功能，如果你使用传统模式自研，需要前后端配合开发，后端使用php/java做接口，前端发起Ajax请求，处理服务端的各种响应和错误码，处理升级弹窗提醒，这些功能做完善至少需要4个工作日。

假设工程师月薪18K，社保等综合管理成本是薪资的1.4倍，则4个工作日的综合成本为：18*1000*1.4/22 * 4 = 4582元。

再次说回uni-upgrade-center，相比传统方式自研升级中心，存储+CDN的钱都是要花的，我们忽略它。

其它云函数、云数据库等，虽然看起来是额外增加的费用，但实际上你使用传统php/java自研升级逻辑，除了自研人力费用，后期也是需要消耗CPU、内存、带宽资源的，只是这些费用合并到虚拟机的整体租用成本中，你无法拆出来计算罢了。

再看回刚才的计算表，以1000日活用户来说，云函数、云数据库每月才多了0.34元，每年才多了4块钱（不考虑云存储CDN的情况下），一年多花4块钱，可以省掉自研的4500多元人工费用，可以让工程师将更多精力投入核心业务中。这5块钱的买卖，不划算吗？它不香吗？

不重复制造轮子，聚焦业务，快速验证模式，实现商业增长，才应该是聪明工程师的追求。

admin 角色或 READ_OPENDB_APP_VERSIONS、CREATE_OPENDB_APP_VERSIONS、UPDATE_OPENDB_APP_VERSIONS、DELETE_OPENDB_APP_VERSIONS、READ_OPENDB_APP_LIST、CREATE_OPENDB_APP_LIST、UPDATE_OPENDB_APP_LIST 权限

原因是因为标准基座获取到的 appId 是固定的，而不是 manifest 中配置的。建议使用自定义基座测试

**Examples:**

Example 1 (unknown):
```unknown
┌─uniCloud                            云空间目录，在 uni-upgrade-center-app 组件中为空，占位使用
│─components(0.9.0 版本起删除，请使用 `pages/uni-app-x/upgrade-popup.vue`)
│  └─uni-upgrade-center-app(0.9.0 版本起删除，请使用 `pages/uni-app-x/upgrade-popup.vue`)
│     └─uni-upgrade-center-app.uvue(0.9.0 版本起删除，请使用 `pages/uni-app-x/upgrade-popup.vue`)
├─pages                               页面文件存放的目录
│  ├─uni-app-x
│  │  └─upgrade-popup.vue              uni-app x 项目中要使用到的升级中心弹窗页面，如果需要自定义弹窗样式，可以修改此页面，使用请看dialogPage
│  └─upgrade-popup.vue                uni-app 项目中要使用到的升级中心页面，如果需要自定义样式，可以修改此页面
├─static                              存放升级中心引用的静态资源（图片）的目录，如需自定义样式，可以替换此目录下的图片
├─utils                               存放升级中心引用的工具函数的目录
│  ├─call-check-version.ts            升级中心请求云端函数方法，调用 uni-upgrade-center 云函数，获取 App 版本信息
│  ├─check-update.ts                  调用升级中心方法，检查更新，并根据结果判断是否显示更新弹框
│  └─check-update-nvue.js             由于 uni-app 项目 `nvue` 页面不支持 ts ，因此调用检查更新函数在这里导出
├─changelog.md                        uni-upgrade-center-app 更新日志
├─package.json                        uni-upgrade-center-app 插件信息日志
└─readme.md                           uni-upgrade-center-app 说明文档
```

Example 2 (unknown):
```unknown
┌─uniCloud                            云空间目录，在 uni-upgrade-center-app 组件中为空，占位使用
│─components(0.9.0 版本起删除，请使用 `pages/uni-app-x/upgrade-popup.vue`)
│  └─uni-upgrade-center-app(0.9.0 版本起删除，请使用 `pages/uni-app-x/upgrade-popup.vue`)
│     └─uni-upgrade-center-app.uvue(0.9.0 版本起删除，请使用 `pages/uni-app-x/upgrade-popup.vue`)
├─pages                               页面文件存放的目录
│  ├─uni-app-x
│  │  └─upgrade-popup.vue              uni-app x 项目中要使用到的升级中心弹窗页面，如果需要自定义弹窗样式，可以修改此页面，使用请看dialogPage
│  └─upgrade-popup.vue                uni-app 项目中要使用到的升级中心页面，如果需要自定义样式，可以修改此页面
├─static                              存放升级中心引用的静态资源（图片）的目录，如需自定义样式，可以替换此目录下的图片
├─utils                               存放升级中心引用的工具函数的目录
│  ├─call-check-version.ts            升级中心请求云端函数方法，调用 uni-upgrade-center 云函数，获取 App 版本信息
│  ├─check-update.ts                  调用升级中心方法，检查更新，并根据结果判断是否显示更新弹框
│  └─check-update-nvue.js             由于 uni-app 项目 `nvue` 页面不支持 ts ，因此调用检查更新函数在这里导出
├─changelog.md                        uni-upgrade-center-app 更新日志
├─package.json                        uni-upgrade-center-app 插件信息日志
└─readme.md                           uni-upgrade-center-app 说明文档
```

Example 3 (json):
```json
"pages": [
		// ……其他页面配置
		{
			"path": "uni_modules/uni-upgrade-center-app/pages/upgrade-popup",
			"style": {
				"disableScroll": true,
				"app-plus": {
					"backgroundColorTop": "transparent",
					"background": "transparent",
					"titleNView": false,
					"scrollIndicator": false,
					"popGesture": "none",
					"animationType": "fade-in",
					"animationDuration": 200

				}
			}
		}
	]
```

Example 4 (json):
```json
"pages": [
		// ……其他页面配置
		{
			"path": "uni_modules/uni-upgrade-center-app/pages/upgrade-popup",
			"style": {
				"disableScroll": true,
				"app-plus": {
					"backgroundColorTop": "transparent",
					"background": "transparent",
					"titleNView": false,
					"scrollIndicator": false,
					"popGesture": "none",
					"animationType": "fade-in",
					"animationDuration": 200

				}
			}
		}
	]
```

---

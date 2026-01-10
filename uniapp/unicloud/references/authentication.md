# Unicloud - Authentication

**Pages:** 27

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cloud-push/api.html

**Contents:**
- # 客户端API 详情参考
- # 服务端API
  - # 推送消息
    - # 推送目标选择
    - # 接口形式
    - # 入参说明
      - # getui_big_data_tag 说明
      - # platform 说明
      - # settings 说明
      - # strategy 厂商下发策略选择

需要HBuilderX 3.5.1 及其以上版本支持

为了更好的服务欢迎： 加入uni-push2.0 交流群

uni-push有服务器API和客户端API。

以下为uni-cloud-push扩展库的api文档；关于uni-cloud-push扩展库的详细介绍，以及如何在需要操作uni-push的云函数里，手动配置uni-cloud-push扩展库详情参考

发送push可以基于如下维度选择目标设备：

注意：user_id、user_tag、device_id、push_clientid、getui_custom_tag、getui_big_data_tag、getui_alias不可多选。全为空表示向所有启动过应用的设备推送。

如果用户处于未登录状态，你可以基于device_id向用户推送消息，但是推送服务器底层只识别push_clientid，需要通过查数据库获得push_clientid。而device_id与push_clientid的映射关系不由uni-push提供，而是由uni统计 模块内置的功能实现。如果你不使用uni统计，则需要在应用启动时调用getPushClientId 获取push_clientid，获取成功后（应用未在manifest中启用uni-push2.0则会获取失败）调用服务端云对象的某个方法（参数：push_clientid）执行向opendb-device表写入或更新（存在时）：设备信息 和push_clientid。

同理基于user_id向用户推送消息，需要user_id与push_clientid的映射关系，可以直接使用uni-id-pages 插件内置的功能实现。如果你不使用uni-id-pages需要在App.vue调用uniCloud.onRefreshToken 监听token发生变化（即：用户登录和token续期时），调用服务端云对象的某个方法（参数：push_clientid）操作uni-id-device表，记录device_id 与 user_id（防客户端伪造，需校验token）的映射关系；完整字段包含user_id、device_id、token_expired、push_clientid、appid。同时再向opendb-device表写入或更新（存在时）：设备信息 和push_clientid。

注意： 客户端上报的信息在理论上存在被篡改可能，基于device_id向用户推送消息有被窃听的风险（营销类消息不用太关心这个）。 例如：张三使用李四的device_id+张三的push_clientid。上报数据；服务器会认为李四的push_clientid更新了，从而将李四的device_id与push_clientid的映射关系，指向张三的push_clientid;张三从而窃听到，其他人发给李四的消息。 而基于user_id或者user_tag推送消息，是基于uni-id-device表，在新增/更新操作时：会校验当前用户的user_id，不会被其他用户篡改，即没有被他人窃听消息的风险。

可以向设定的（单个、群组、全体）设备，即时或定时推送消息。支持设置：通知栏消息内容、控制响铃，震动，浮动，闪灯；手机桌面应用右上角的角标等。

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.31 内置的uni-push-cloud扩展库存在options参数丢失的问题，不能连接本地云函数调试，只能连接云端云函数才能正常使用；下个版本会修复此问题。

注意此功能需要单独申请开通，若有需要，请点击右侧“技术咨询”了解详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对正处于推送状态，或者未接收的消息停止下发（只支持批量推和群推任务）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

该接口支持在推送完定时任务之后，查看定时任务状态，定时任务是否发送成功。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用来删除还未下发的任务，删除后定时任务不再触发(距离下发还有一分钟的任务，将无法删除，后续可以调用停止任务接口。)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

调用此接口可以查询某任务下某cid的具体实时推送路径情况

使用该接口需要申请权限，若有需要，请点击右侧“技术咨询”了解详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

开发者可对设备设定别名与标签，推送时可直接根据别名、标签进行推送，方便对设备的管理。 别名是开发者根据自身需求为每个设备设定的标识，建议对不同设备设定不同别名，保证可通过别名来唯一确认某特定设备。

例子：可将用户的邮箱、昵称、手机号等设为别名，即可通过邮箱、昵称、手机号指定目标设备下发推送。

一个cid只能绑定一个别名，若已绑定过别名的cid再次绑定新别名，则前一个别名会自动解绑，并绑定新别名。

一个cid只能绑定一个别名，若已绑定过别名的cid再次绑定新别名，则前一个别名会自动解绑，并绑定新别名。

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

开发者可对设备设定别名与标签，推送时可直接根据别名、标签进行推送，方便对设备的管理。 标签是设备的一种属性，每个设备（通过CID来标识 ）可以打上100个标签。 例子：“喜爱足球”，“喜爱动漫”

一个设备绑定一批标签，此操作为覆盖操作，会删除历史绑定的标签；

此接口对单个cid有频控限制，每天只能修改一次，最多设置100个标签；单个标签长度最大为32字符，标签总长度最大为512个字符，申请修改请点击右侧“技术咨询”了解详情 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口有频次控制(每分钟最多100次，每天最多10000次)，申请修改请点击右侧“技术咨询”了解详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口有频次控制(每分钟最多100次，每天最多10000次)，申请修改请点击右侧“技术咨询”了解详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此接口有频次控制(每分钟最多100次，每天最多10000次)，申请修改请点击右侧“技术咨询”了解详情

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

黑名单设备无法收到推送消息。当使用群发全推时，有时需要调节某些设备不发，此时需要按push_clientid进行黑名单控制。

将单个或多个设备加入黑名单，对于黑名单设备在推送过程中会被过滤掉。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

将单个push_clientid或多个push_clientid设备移出黑名单，对于黑名单设备在推送过程中会被过滤掉的，不会给黑名单设备推送消息

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意：该状态为：offline离线时，消息可通过：同设备下其他集成个推SDK的在线应用通道完成推送（iOS不支持，Android受限于手机rom的节点设置策略）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询与你的应用同设备（手机）下的所有集成了个推SDK的应用在线状态

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过cid通知个推服务器当前iOS设备的角标情况。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询推送数据，可查询消息可下发数、下发数，接收数、展示数、点击数等结果。支持单个taskId查询和多个taskId查询。

此接口调用，仅可以查询toList或toApp的推送结果数据；不能查询toSingle的推送结果数据。

示例源码如下，请查看 pre > code 标签中的内容

content-type:application/json;charset=utf-8

示例源码如下，请查看 pre > code 标签中的内容

根据任务组名查询推送结果，返回结果包括消息可下发数、下发数，接收数、展示数、点击数。

此接口调用，仅可以查询toList或toApp的推送结果数据；不能查询toSingle的推送结果数据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

获取推送实时结果，可查询消息下发数，接收数、展示数、点击数和消息折损详情等结果。支持单个taskId查询和多个taskId查询。

注意：该接口需要开通权限，如需开通，请联系对应的商务同学开通

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

折损详情分类如下，2-14是折损大类说明，大类说明下面的7001-8999是细分的折损原因，total代表各细分原因总和

调用此接口可以获取某个应用单日的推送数据(推送数据包括：下发数，接收数、展示数、点击数)(目前只支持查询非当天的数据)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了接口返回统一，所以用special和general返回表示特殊消息和普通消息

调用此接口可以获取某个应用单日的设备数据(设备数据包括：新增设备数，累计注册设备总数，在线峰值，日联网设备数)(目前只支持查询非当天的数据)

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

查询当前时间一天内的在线设备数(10分钟一个点，1个小时六个点)

示例源码如下，请查看 pre > code 标签中的内容

content-type:application/json;charset=utf-8

示例源码如下，请查看 pre > code 标签中的内容

以下参数格式为每个接口返回的数据的通用格式。

uni-cloud-push 扩展库的errCode码以uni-cloud-push-error-开头，如：uni-cloud-push-error-10005，以下省略为10005

**Examples:**

Example 1 (csharp):
```csharp
await uniPush.sendMessage(OBJECT)
```

Example 2 (csharp):
```csharp
await uniPush.sendMessage(OBJECT)
```

Example 3 (csharp):
```csharp
await uniPush.sendMessage(OBJECT)
```

Example 4 (csharp):
```csharp
await uniPush.sendMessage(OBJECT)
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=bind-mobile

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=isolate-config

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=errcode

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=modifysecret

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=qq

文档已迁移至：uni-id/summary

---

## uni-id-pages-x | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/app-x.html

**Contents:**
- # uni-id-pages-x
- # 目录结构
- # 前端页面
  - # 创建并配置uni-id的配置文件
  - # 初始化
  - # 配置
    - # 调试模式
    - # 登录方式
      - # 配置示例
    - # 隐私政策

uni-id-pages-x 是 uni-id-pages 的uni-app x 版

uni-id-pages-x，是uni-id体系的一部分。

它基于uni-id-common提供了一批现成的、开源的、登录注册账户管理相关的前端页面和云端云对象。

它是一个云端一体页面组的uni_modules ，含前端页面和后端云对象（uni-id-co）。

开发者在项目中引入uni-id-pages-x，账户管理的功能无需自己再开发。由于源码的开放性和层次结构清晰，有二次开发需求也很方便调整。

下载地址：https://ext.dcloud.net.cn/plugin?name=uni-id-pages-x

需要在App.uvue中初始化uni-id-pages-x的init.uts文件

示例源码如下，请查看 pre > code 标签中的内容

路径：/uni_modules/uni-id-pages-x/config.uts

示例源码如下，请查看 pre > code 标签中的内容

debug模式下，启动应用会自动发起一次网络请求（调用uni-id-co的getSupportedLoginType）。

检查：uni-id-pages-x客户端配置的登录方式，是否未在uniCloud服务端配置正确，否则抛出异常。

示例源码如下，请查看 pre > code 标签中的内容

如上示例配置，表示启用：账号密码登录、验证码登录。

示例源码如下，请查看 pre > code 标签中的内容

则表示启用：一键登录、验证码登录、账号密码登录。

平台差异性配置:如果你希望在不同的平台有不同的登录方式，直接使用条件编译 即可。如下配置，即表示仅在APP端启用短信验证码登录

示例源码如下，请查看 pre > code 标签中的内容

以上配置仅开启前端登录入口，实现功能还需：开通对应登录方式服务，获得服务密钥，并在服务端uni-id模块的配置文件中完成配置。详情查看：登录服务开通与配置

要上架到国内应用商店必须提供《隐私政策和用户使用协议》，参考模版：隐私权政策模板.zip

推荐使用：HBuilderX编辑器，以markdown文档格式编辑《隐私政策和用户使用协议》，通过在文档中鼠标右键一键分享 上传到前端网页托管获得链接

路径: /uni_modules/uni-id-pages-x/pages/login/login

执行uni.navigateTo打开登录页面，会默认使用配置中loginTypes值的第一项为登录方式。 例如loginTypes：["smsCode","univerify","username"]会以smsCode，即短信验证码为默认登录方式

支持通过传递参数type，指定登录方式。例如：指定用户名密码登录，使用如下代码即可

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX3.99+ 可以配套使用uniIdRouter；当用户未登录，但访问了需强制登录的页面，或接口提示token无效或过期（响应体以TOKEN_INVALID开头）时均需要打开登录页面。

**Examples:**

Example 1 (julia):
```julia
├─uni_modules                                         存放uni_module规范的插件。
│    ├─其他module
│    └─uni-id-pages-x
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        └─uni-id-co                         集成调用uni-id方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能，不建议修改此目录下文件
│        │            │  ├─third-party                三方平台接口
│        │            │  └─utils                      基础功能
│        │            ├─middleware                    中间件
│        │            └─module                        分模块存放的云对象方法
│		     ├── README.md                                插件自述文件
│		     ├── changelog.md                             更变日志
│		     ├── common                                   公共文件目录
│		     │   ├── common.scss                          通用样式
│		     │   └── common.uts                           通用脚本
│		     ├── components                               组件目录
│		     │   ├── cloud-image                          uniCloud云存储图片解析组件
│		     │   ├── my-input                             uni-id-pages x自定义的输入宽组件
│		     │   ├── uni-id-pages-x-agreements            隐私政策协议授权组件
│		     │   ├── uni-id-pages-x-avatar                头像组件（展示、设置头像）
│		     │   ├── uni-id-pages-x-fab-login             悬浮的登录组件（固定在页面便于切换登录方式）
│		     │   ├── uni-id-pages-x-icon                  图标组件
│		     │   ├── uni-id-pages-x-loginByPwd            密码登录组件
│		     │   ├── uni-id-pages-x-loginBySmsCode        短信验证码登录组件
│		     │   ├── uni-id-pages-x-popup-dialog          弹窗对话框组件
│		     │   └── uni-id-pages-x-smsCode               发送短信验证码组件
│		     ├── config.uts                               【重要】配置文件
│		     ├── package.json                             包描述文件
│		     ├── pages                                    页面目录
│		     │   ├── common                               公共页面
│		     │   │   └── webview                          网页查看页面（用于实现应用内浏览《用户协议和隐私协议》的URL链接页面）
│		     │   ├── login                                登录页面
│		     │   ├── register                             注册页面
│		     │   ├── retrieve                             找回密码页面
│		     │   └── userinfo                             用户信息页面
│		     │       ├── bindMobile                       绑定手机号码页面
│		     │       ├── deactivate                       注销账号页面
│		     │       ├── realNameAuth                     实名认证页面
│		     │       └─ setNickname                       设置昵称页面
│		     ├── static                                   静态资源目录
│		     │   ├── app-plus                             App专用资源目录
│		     │   ├── fonts                                字体资源目录
│		     │   └── login                                登录方式图标资源目录
│		     ├── store.uts                                状态管理文件
```

Example 2 (julia):
```julia
├─uni_modules                                         存放uni_module规范的插件。
│    ├─其他module
│    └─uni-id-pages-x
│        ├─uniCloud
│        │    └─cloudfunctions                        云函数目录
│        │        └─uni-id-co                         集成调用uni-id方法的云对象
│        │            ├─common                        公用逻辑
│        │            ├─config                        配置
│        │            │  └─permission.js              调用接口所需的权限配置
│        │            ├─lang                          国际化目录
│        │            ├─lib                           基础功能，不建议修改此目录下文件
│        │            │  ├─third-party                三方平台接口
│        │            │  └─utils                      基础功能
│        │            ├─middleware                    中间件
│        │            └─module                        分模块存放的云对象方法
│		     ├── README.md                                插件自述文件
│		     ├── changelog.md                             更变日志
│		     ├── common                                   公共文件目录
│		     │   ├── common.scss                          通用样式
│		     │   └── common.uts                           通用脚本
│		     ├── components                               组件目录
│		     │   ├── cloud-image                          uniCloud云存储图片解析组件
│		     │   ├── my-input                             uni-id-pages x自定义的输入宽组件
│		     │   ├── uni-id-pages-x-agreements            隐私政策协议授权组件
│		     │   ├── uni-id-pages-x-avatar                头像组件（展示、设置头像）
│		     │   ├── uni-id-pages-x-fab-login             悬浮的登录组件（固定在页面便于切换登录方式）
│		     │   ├── uni-id-pages-x-icon                  图标组件
│		     │   ├── uni-id-pages-x-loginByPwd            密码登录组件
│		     │   ├── uni-id-pages-x-loginBySmsCode        短信验证码登录组件
│		     │   ├── uni-id-pages-x-popup-dialog          弹窗对话框组件
│		     │   └── uni-id-pages-x-smsCode               发送短信验证码组件
│		     ├── config.uts                               【重要】配置文件
│		     ├── package.json                             包描述文件
│		     ├── pages                                    页面目录
│		     │   ├── common                               公共页面
│		     │   │   └── webview                          网页查看页面（用于实现应用内浏览《用户协议和隐私协议》的URL链接页面）
│		     │   ├── login                                登录页面
│		     │   ├── register                             注册页面
│		     │   ├── retrieve                             找回密码页面
│		     │   └── userinfo                             用户信息页面
│		     │       ├── bindMobile                       绑定手机号码页面
│		     │       ├── deactivate                       注销账号页面
│		     │       ├── realNameAuth                     实名认证页面
│		     │       └─ setNickname                       设置昵称页面
│		     ├── static                                   静态资源目录
│		     │   ├── app-plus                             App专用资源目录
│		     │   ├── fonts                                字体资源目录
│		     │   └── login                                登录方式图标资源目录
│		     ├── store.uts                                状态管理文件
```

Example 3 (vue):
```vue
<script>
	import uniIdPageInit from '@/uni_modules/uni-id-pages-x/init.uts';
	export default {
    onLaunch: function(){
      console.log('App Launch')
      uniIdPageInit()
    },
    onShow: function() {
      console.log('App Show')
    },
      onHide: function() {
      console.log('App Hide')
    }
  }
</script>
```

Example 4 (vue):
```vue
<script>
	import uniIdPageInit from '@/uni_modules/uni-id-pages-x/init.uts';
	export default {
    onLaunch: function(){
      console.log('App Launch')
      uniIdPageInit()
    },
    onShow: function() {
      console.log('App Show')
    },
      onHide: function() {
      console.log('App Hide')
    }
  }
</script>
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=loginbyapple

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=makeup-dcloud-appid

文档已迁移至：uni-id/summary

---

## 一键登录@univerify | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/univerify.html

**Contents:**
- # 一键登录
- # 重要调整
  - # 云函数使用一键登录扩展库
- # 客户端
- # 云函数
  - # uni-app项目
  - # 5+项目
  - # 自有服务器调用
  - # 一键登录费用说明

univerify 是DCloud 推出的一键登录产品，通过与运营商深度合作，实现APP用户无需输入帐号密码，即可使用本机手机号码自动登录的能力。

univerify是替代短信验证登录的下一代登录验证方式，能消除现有短信验证模式等待时间长、操作繁琐和容易泄露的痛点。

注意：一键登录必须是手机使用流量的前提下才能获取到手机号码，用Wi-Fi联网时无法获取到手机号码，同时如果是双卡手机，获取到的手机号码是默认移动数据的那个手机卡的号码。

自HBuilderX 3.4.0起，一键登录相关功能移至扩展库uni-cloud-verify内。在一段时间内无论开发者是否使用扩展库云函数都可以正常使用uniCloud.getPhoneNumber。HBuilderX 3.4.0及之后的版本上传云函数时如果没有指定使用uni-cloud-verify扩展库的云函数将无法调用uniCloud.getPhoneNumber接口。

在云函数的package.json内添加uni-cloud-verify的引用即可为云函数启用此扩展，无需做其他调整，完整的package.json示例如下：

示例源码如下，请查看 pre > code 标签中的内容

客户端如何使用一键登录请参考此文档：univerify 使用指南

自HBuilderX 3.4.0起云函数需启用uni-cloud-verify之后才可以调用getPhoneNumber接口，详细说明见：云函数使用一键登录扩展库

示例源码如下，请查看 pre > code 标签中的内容

使用上面结果中的openid和access_token即可在云函数内调用接口获取手机号

示例源码如下，请查看 pre > code 标签中的内容

如果开发uni-app项目可以使用callFunction的方式调用云函数

示例源码如下，请查看 pre > code 标签中的内容

5+项目不可使用callFunction请求云函数，这时候可以使用云函数URL化让5+项目通过http请求的方式访问云函数

示例源码如下，请查看 pre > code 标签中的内容

写法类似上面5+项目的云函数url化的方式，但是不同的是需要云函数返回手机号给自己服务器，这样就需要确保数据安全。

下面以一个简单的例子演示如何使用签名验证请求是否合法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

实际使用中需要依赖uniCloud云服务，这方面费用如下：在使用阿里云正式版后，每次一键登陆请求大约需要消耗uniCloud费用0.0000139元，几乎可以忽略不计。也可以粗略认为每次使用一键登陆的成本为0.0200139元/次。费用计算规则如下：

一键登录业务涉及费用的部分主要是云函数/云对象的使用量、调用次数、和出网流量(如：使用自定义的云函数/云对象来获取手机号)。 接下来，我们对不同资源，分别进行费用评估。

我们按照uniCloud官网列出的按量计费 规则，可以简单得出如下公式：

云函数/云对象费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，其一键登录业务云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

结论：如果你的一键登录业务平均每天获取手机号次数为10000次，使用阿里云正式版云服务空间后，对应云函数每天大概消耗0.139元，对比之前的一键登录费用，平均每次调用多花0.0000139元，几乎可忽略不计。

很明显一键登陆是比短信验证码更便宜的用户身份验证方式。

**Examples:**

Example 1 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 2 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 3 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 4 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

---

## 一键登录@univerify | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/univerify

**Contents:**
- # 一键登录
- # 重要调整
  - # 云函数使用一键登录扩展库
- # 客户端
- # 云函数
  - # uni-app项目
  - # 5+项目
  - # 自有服务器调用
  - # 一键登录费用说明

univerify 是DCloud 推出的一键登录产品，通过与运营商深度合作，实现APP用户无需输入帐号密码，即可使用本机手机号码自动登录的能力。

univerify是替代短信验证登录的下一代登录验证方式，能消除现有短信验证模式等待时间长、操作繁琐和容易泄露的痛点。

注意：一键登录必须是手机使用流量的前提下才能获取到手机号码，用Wi-Fi联网时无法获取到手机号码，同时如果是双卡手机，获取到的手机号码是默认移动数据的那个手机卡的号码。

自HBuilderX 3.4.0起，一键登录相关功能移至扩展库uni-cloud-verify内。在一段时间内无论开发者是否使用扩展库云函数都可以正常使用uniCloud.getPhoneNumber。HBuilderX 3.4.0及之后的版本上传云函数时如果没有指定使用uni-cloud-verify扩展库的云函数将无法调用uniCloud.getPhoneNumber接口。

在云函数的package.json内添加uni-cloud-verify的引用即可为云函数启用此扩展，无需做其他调整，完整的package.json示例如下：

示例源码如下，请查看 pre > code 标签中的内容

客户端如何使用一键登录请参考此文档：univerify 使用指南

自HBuilderX 3.4.0起云函数需启用uni-cloud-verify之后才可以调用getPhoneNumber接口，详细说明见：云函数使用一键登录扩展库

示例源码如下，请查看 pre > code 标签中的内容

使用上面结果中的openid和access_token即可在云函数内调用接口获取手机号

示例源码如下，请查看 pre > code 标签中的内容

如果开发uni-app项目可以使用callFunction的方式调用云函数

示例源码如下，请查看 pre > code 标签中的内容

5+项目不可使用callFunction请求云函数，这时候可以使用云函数URL化让5+项目通过http请求的方式访问云函数

示例源码如下，请查看 pre > code 标签中的内容

写法类似上面5+项目的云函数url化的方式，但是不同的是需要云函数返回手机号给自己服务器，这样就需要确保数据安全。

下面以一个简单的例子演示如何使用签名验证请求是否合法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

实际使用中需要依赖uniCloud云服务，这方面费用如下：在使用阿里云正式版后，每次一键登陆请求大约需要消耗uniCloud费用0.0000139元，几乎可以忽略不计。也可以粗略认为每次使用一键登陆的成本为0.0200139元/次。费用计算规则如下：

一键登录业务涉及费用的部分主要是云函数/云对象的使用量、调用次数、和出网流量(如：使用自定义的云函数/云对象来获取手机号)。 接下来，我们对不同资源，分别进行费用评估。

我们按照uniCloud官网列出的按量计费 规则，可以简单得出如下公式：

云函数/云对象费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，其一键登录业务云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

结论：如果你的一键登录业务平均每天获取手机号次数为10000次，使用阿里云正式版云服务空间后，对应云函数每天大概消耗0.139元，对比之前的一键登录费用，平均每次调用多花0.0000139元，几乎可忽略不计。

很明显一键登陆是比短信验证码更便宜的用户身份验证方式。

**Examples:**

Example 1 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 2 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 3 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 4 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=custom-i8n

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=rbac

文档已迁移至：uni-id/summary

---

## uniCloud客户端sdk | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/client-sdk?id=add-interceptor

**Contents:**
- # uniCloud客户端sdk
- # API
  - # 获取当前用户信息getCurrentUserInfo
  - # 新增拦截器
  - # 移除拦截器
  - # 拦截云对象请求
  - # 监听云端响应
  - # 移除云端响应的监听
  - # 监听需要登录事件
  - # 移除需要登录事件的监听

适用于uni-app-x的uniCloud客户端api文档请参考：uniCloud客户端API

uniCloud分为客户端和云端两部分，有些接口名称相同，参数也相近，在此列举客户端sdk内可以使用的接口/属性，避免混淆

解析客户端token获取用户信息。常用于在前端判断当前登录的用户状态和用户权限，比如根据不同的权限显示隐藏某些按钮。

用法：uniCloud.getCurrentUserInfo()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.addInterceptor(String apiName, Object interceptor)

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.removeInterceptor(String apiName, Object interceptor)

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.interceptObject(Object interceptor)

invoke拦截器内将会收到以下形式的参数

示例源码如下，请查看 pre > code 标签中的内容

success拦截器内将会收到以下形式的参数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

complete拦截器内将会收到success或fail拦截器相同的参数，具体以云函数是否执行成功为准

用于监听云函数、云对象、clientDB的请求响应

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以通过判断content内是否有真值的errCode判断是失败还是成功的响应

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于监听客户端需要登录事件，此接口需要搭配uniIdRouter使用，参考：uniIdRouter

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于监听客户端token刷新事件，包括云对象返回newToken时自动更新token及clientDB自动更新token，注意uni-id-co登录返回的token也会触发此事件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于设置自定义clientInfo字段，此字段会在云函数调用时传递给云函数。**设置的自定义clientInfo无法覆盖默认的clientInfo，只能为clientInfo新增字段，无法修改字段。**调用此接口后，所有的云函数、云对象、clientDB请求都会在clientInfo内携带此字段。

示例源码如下，请查看 pre > code 标签中的内容

用法：uniCloud.config.provider

访问此属性会返回tencent、aliyun、alipay分别代表腾讯云、阿里云、支付宝云

客户端请求云端时（包括请求云函数、云对象、clientDB、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

**Examples:**

Example 1 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 2 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 3 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 4 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

---

## uni直播控制台操作指南 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-live/service.html

**Contents:**
- # uni直播控制台操作指南
- # 业务开通
- # 业务充值
  - # 充值保证金
  - # 充值余额
- # 直播设置
  - # 域名设置
    - # 添加推流域名
    - # 推流域名配置
      - # 时间戳防盗链

uni直播是延迟计费的，使用前需要先充值200元保证金，用于欠费的担保。保证金是账号级的、可在不同业务间复用，若你在使用其他uniCloud服务时 ，已充值保证金，则无需重复充值。

在uniCloud web控制台前往【费用中心】-【按量余额充值】充值保证金（若保证金账户余额≥200元则无需充值）

在uni直播控制台前往【账户信息】-点击【充值】按钮充值余额。

在使用uni直播服务前，必须先添加至少一个推流域名和一个拉流域名，并配置域名解析。 一个域名只能设置为一种类型，不能同时作为推流域名和拉流域名。

点击绑定推流域名卡片后的绑定域名按钮，打开绑定推流域名弹窗。

点击确定绑定按钮，绑定域名，绑定成功后会在列表中看到推流域名的CNAME，在域名服务商处添加CNAME解析。

开启时间戳防盗链可以对推流地址进行请求鉴权，减少恶意推流，保护用户资产。

点击顶部防盗链设置选项卡，开启时间戳防盗链

开通uni直播服务时，直播存储功能默认开启，同时会创建直播专用的存储空间。

直播存储中会保存直播TS切片，截图文件及回放.m3u8或者.mp4文件。

直播TS切片文件不会一直保存，保存时间由存储过期天数控制，过期文件会自动清理。

直播截图功能默认不开启，开启后在直播过程中会按照设置的截图间隔生成截图文件。

截图文件仅支持 JPG 和 PNG 格式图片。

空间授权只有在使用云函数调用uni直播扩展库时才需要配置。

在云函数中使用uni直播扩展库时，需要授权服务空间允许访问uni直播服务，否则无法在云函数中使用uni直播扩展库。

开启后，推流开始、结束时发送通知请求到指定的 URL 地址

uni直播流管理提供直播流的创建、删除、封禁流等功能，同时支持推拉流地址生成。

数据-直播记录：可查询直播流的历史直播记录。

数据-流数据：查询推流的帧率和码率等信息。

封禁直播流：在遇到鉴权推流地址暴露、用户恶意推流等情况的时候，可以对直播进行封禁操作。

删除直播流：只有在直播流离线时才可删除直播流。

uni直播支持自动创建推流及拉流地址，无需提前创建直播流。 只要添加了推流域名和拉流域名，并且完成域名解析、鉴权（可选）等操作。 即可快速生成推流地址和拉流地址。

直播过程中会生成直播TS切片文件，截图文件和回放文件，这些文件会保存在直播存储中。

在播放回放时，需要提前在直播设置-录制设置中，绑定回放域名。

直播开始后会自动录制直播流，并在直播结束生成回放文件，格式为 .m3u8。

在直播存储中以目录形式展示，目录名为直播流名称。每个直播流目录下保存每一次直播的回放文件。

回放文件的名称格式为：[直播开始时间]-[直播结束时间].m3u8。

uni直播控制台提供了回放的预览功能，点击回放文件后面的预览按钮，即可在新窗口中预览回放。

默认不启用直播截图，如需启用请在直播设置-录制设置中开启截图功能。

在直播存储中以目录形式展示，目录名为直播流名称。每个直播流目录下保存该直播流的所有截图文件。

回放文件的名称格式为：[截图时间毫秒时间戳].[格式]。

播放回放时，需要在域名设置中绑定回放域名。

用量统计服务提供了推流域名和拉流域名消耗的流量查询及峰值带宽查询。

用量统计支持按照域名和直播流名称以及时间范围查询。

查询一段时间内的推流记录，最大支持查询最近30天内的直播记录。

直播记录支持按照域名和直播流名称以及时间范围查询。

查询某个直播流在推流过程中的数据，支持查询播放带宽、播放次数、推流码率及音视频帧率。

七牛云提供了服务等级协议（SLA），以七牛云官网标准协议为准。

七牛直播云服务等级协议（SLA）：https://www.qiniu.com/agreements/sla/pili

七牛云用户协议：https://www.qiniu.com/agreements/user-agreement

隐私政策：https://www.qiniu.com/agreements/privacy-right

如果您购买了七牛云版的uni直播的，且七牛云未满足其承诺的服务标准，则可以索赔。

DCloud将负责为您协调七牛云的赔偿。赔偿标准和相关规定见上述服务等级协议。

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=univerify

文档已迁移至：uni-id/summary

---

## uniCloud客户端sdk | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/client-sdk.html

**Contents:**
- # uniCloud客户端sdk
- # API
  - # 获取当前用户信息getCurrentUserInfo
  - # 新增拦截器
  - # 移除拦截器
  - # 拦截云对象请求
  - # 监听云端响应
  - # 移除云端响应的监听
  - # 监听需要登录事件
  - # 移除需要登录事件的监听

适用于uni-app-x的uniCloud客户端api文档请参考：uniCloud客户端API

uniCloud分为客户端和云端两部分，有些接口名称相同，参数也相近，在此列举客户端sdk内可以使用的接口/属性，避免混淆

解析客户端token获取用户信息。常用于在前端判断当前登录的用户状态和用户权限，比如根据不同的权限显示隐藏某些按钮。

用法：uniCloud.getCurrentUserInfo()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.addInterceptor(String apiName, Object interceptor)

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.removeInterceptor(String apiName, Object interceptor)

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.interceptObject(Object interceptor)

invoke拦截器内将会收到以下形式的参数

示例源码如下，请查看 pre > code 标签中的内容

success拦截器内将会收到以下形式的参数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

complete拦截器内将会收到success或fail拦截器相同的参数，具体以云函数是否执行成功为准

用于监听云函数、云对象、clientDB的请求响应

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以通过判断content内是否有真值的errCode判断是失败还是成功的响应

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于监听客户端需要登录事件，此接口需要搭配uniIdRouter使用，参考：uniIdRouter

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于监听客户端token刷新事件，包括云对象返回newToken时自动更新token及clientDB自动更新token，注意uni-id-co登录返回的token也会触发此事件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于设置自定义clientInfo字段，此字段会在云函数调用时传递给云函数。**设置的自定义clientInfo无法覆盖默认的clientInfo，只能为clientInfo新增字段，无法修改字段。**调用此接口后，所有的云函数、云对象、clientDB请求都会在clientInfo内携带此字段。

示例源码如下，请查看 pre > code 标签中的内容

用法：uniCloud.config.provider

访问此属性会返回tencent、aliyun、alipay分别代表腾讯云、阿里云、支付宝云

客户端请求云端时（包括请求云函数、云对象、clientDB、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

**Examples:**

Example 1 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 2 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 3 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 4 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

---

## 背景 | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/space/balance-merge.html

**Contents:**
- # 背景
- # 服务空间按量余额合并规则
  - # 新用户
  - # 存量用户
- # 如何确认服务空间使用的余额类型
- # 注意事项

uniCloud自发布上线至2024年以来，已接入了三家云厂商。由于各家云厂商账户、财务等体系及对接上线时间的不同，最初设计时各家云厂商的按量余额均独立存在。

随着业务发展，很多用户开始同时使用多家云厂商服务空间，余额也需要分别进行充值。为了更加方便的统一管理，uniCloud提供了按量余额合并功能。

此功能视每个用户账号开通及使用情况不同而不同，每个用户可合并的云厂商按量余额也有差异，具体需以合并时的提示为准。

自2024-07-23日起，新开通uniCloud服务空间的用户，将自动合并各厂商按量余额为服务空间通用按量余额，原阿里云按量余额、腾讯云按量余额、支付宝云按量余额充值入口将不再展示，后续无论使用哪个云厂商的按量计费类型的服务空间，都只需从服务空间通用按量余额充值入口充值，服务空间按量资源产生的费用，也将统一从服务空间通用按量余额中扣除。

如下图所示，历史存量用户在进入按量余额充值界面后会自动弹窗提示合并按量余额提醒，点击弹窗中的确认合并按钮，会自动将弹窗提示中符合条件的云厂商按量余额，合并到服务空间通用按量余额中。

由于历史原因，部分腾讯云或支付宝云服务空间用户的实际账户（用户自动在云厂商开通的账户），挂靠在腾讯云或支付宝云等云厂商下，无法通过DCloud统一账户代扣，因此存在部分用户的腾讯云或支付宝云按量余额无法合并的情况。此时选择合并云厂商按量余额后，除服务空间通用按量余额充值入口外，账户下依旧存在原腾讯云或支付宝云按量余额的充值入口。后续如使用未合并按量余额的云厂商的服务空间，产生的服务空间按量资源费用，依旧从云厂商按量余额中扣取。

如下方示例图片中展示的账户，仅能合并阿里云按量余额和腾讯云按量余额，合并后依旧存在支付宝云按量余额充值入口。此时用户使用阿里云和腾讯云服务空间的按量计费资源，只需从服务空间通用按量余额充值入口充值即可。但如果已使用或将来使用支付宝云服务空的按量计费资源，依旧需要从支付宝云按量余额充值入口充值。

存量用户我们会分批开放按量余额合并功能，如果您的账号未看到如上相关提示，请耐心等待，我们将在一定时间内全量开放上线。

在服务空间下单购买及服务空间详情中会显示按量余额类型，分为服务空间通用按量或云厂商按量余额。可根据余额类型来判断该空间具体使用的是哪个按量余额，然后根据情况进行充值

在费用中心，也可看到按量余额支持的具体云厂商

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id-pages.html

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=cachepermissionintoken

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=isolate-user

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id

文档已迁移至：uni-id/summary

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id/redirect.html

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id?id=encrypt-password

文档已迁移至：uni-id/summary

---

## uniCloud客户端sdk | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/client-sdk?id=client-getcurrentuserinfo

**Contents:**
- # uniCloud客户端sdk
- # API
  - # 获取当前用户信息getCurrentUserInfo
  - # 新增拦截器
  - # 移除拦截器
  - # 拦截云对象请求
  - # 监听云端响应
  - # 移除云端响应的监听
  - # 监听需要登录事件
  - # 移除需要登录事件的监听

适用于uni-app-x的uniCloud客户端api文档请参考：uniCloud客户端API

uniCloud分为客户端和云端两部分，有些接口名称相同，参数也相近，在此列举客户端sdk内可以使用的接口/属性，避免混淆

解析客户端token获取用户信息。常用于在前端判断当前登录的用户状态和用户权限，比如根据不同的权限显示隐藏某些按钮。

用法：uniCloud.getCurrentUserInfo()

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.addInterceptor(String apiName, Object interceptor)

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.removeInterceptor(String apiName, Object interceptor)

示例源码如下，请查看 pre > code 标签中的内容

接口形式：uniCloud.interceptObject(Object interceptor)

invoke拦截器内将会收到以下形式的参数

示例源码如下，请查看 pre > code 标签中的内容

success拦截器内将会收到以下形式的参数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

complete拦截器内将会收到success或fail拦截器相同的参数，具体以云函数是否执行成功为准

用于监听云函数、云对象、clientDB的请求响应

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

可以通过判断content内是否有真值的errCode判断是失败还是成功的响应

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于监听客户端需要登录事件，此接口需要搭配uniIdRouter使用，参考：uniIdRouter

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于监听客户端token刷新事件，包括云对象返回newToken时自动更新token及clientDB自动更新token，注意uni-id-co登录返回的token也会触发此事件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

用于设置自定义clientInfo字段，此字段会在云函数调用时传递给云函数。**设置的自定义clientInfo无法覆盖默认的clientInfo，只能为clientInfo新增字段，无法修改字段。**调用此接口后，所有的云函数、云对象、clientDB请求都会在clientInfo内携带此字段。

示例源码如下，请查看 pre > code 标签中的内容

用法：uniCloud.config.provider

访问此属性会返回tencent、aliyun、alipay分别代表腾讯云、阿里云、支付宝云

客户端请求云端时（包括请求云函数、云对象、clientDB、云存储等）可能存在抛出错误的场景，此时会抛出uniCloud标准的错误对象（以下记为uniCloudError），uniCloudError包含以下属性

另外uniCloudError对象上还有code属性和message属性，两者均不推荐使用。

**Examples:**

Example 1 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 2 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 3 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

Example 4 (json):
```json
{
  uid: null,
  role: [],
  permission: [],
  tokenExpired: 0
}
```

---

## 一键登录@univerify | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/univerify?id=extension

**Contents:**
- # 一键登录
- # 重要调整
  - # 云函数使用一键登录扩展库
- # 客户端
- # 云函数
  - # uni-app项目
  - # 5+项目
  - # 自有服务器调用
  - # 一键登录费用说明

univerify 是DCloud 推出的一键登录产品，通过与运营商深度合作，实现APP用户无需输入帐号密码，即可使用本机手机号码自动登录的能力。

univerify是替代短信验证登录的下一代登录验证方式，能消除现有短信验证模式等待时间长、操作繁琐和容易泄露的痛点。

注意：一键登录必须是手机使用流量的前提下才能获取到手机号码，用Wi-Fi联网时无法获取到手机号码，同时如果是双卡手机，获取到的手机号码是默认移动数据的那个手机卡的号码。

自HBuilderX 3.4.0起，一键登录相关功能移至扩展库uni-cloud-verify内。在一段时间内无论开发者是否使用扩展库云函数都可以正常使用uniCloud.getPhoneNumber。HBuilderX 3.4.0及之后的版本上传云函数时如果没有指定使用uni-cloud-verify扩展库的云函数将无法调用uniCloud.getPhoneNumber接口。

在云函数的package.json内添加uni-cloud-verify的引用即可为云函数启用此扩展，无需做其他调整，完整的package.json示例如下：

示例源码如下，请查看 pre > code 标签中的内容

客户端如何使用一键登录请参考此文档：univerify 使用指南

自HBuilderX 3.4.0起云函数需启用uni-cloud-verify之后才可以调用getPhoneNumber接口，详细说明见：云函数使用一键登录扩展库

示例源码如下，请查看 pre > code 标签中的内容

使用上面结果中的openid和access_token即可在云函数内调用接口获取手机号

示例源码如下，请查看 pre > code 标签中的内容

如果开发uni-app项目可以使用callFunction的方式调用云函数

示例源码如下，请查看 pre > code 标签中的内容

5+项目不可使用callFunction请求云函数，这时候可以使用云函数URL化让5+项目通过http请求的方式访问云函数

示例源码如下，请查看 pre > code 标签中的内容

写法类似上面5+项目的云函数url化的方式，但是不同的是需要云函数返回手机号给自己服务器，这样就需要确保数据安全。

下面以一个简单的例子演示如何使用签名验证请求是否合法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

实际使用中需要依赖uniCloud云服务，这方面费用如下：在使用阿里云正式版后，每次一键登陆请求大约需要消耗uniCloud费用0.0000139元，几乎可以忽略不计。也可以粗略认为每次使用一键登陆的成本为0.0200139元/次。费用计算规则如下：

一键登录业务涉及费用的部分主要是云函数/云对象的使用量、调用次数、和出网流量(如：使用自定义的云函数/云对象来获取手机号)。 接下来，我们对不同资源，分别进行费用评估。

我们按照uniCloud官网列出的按量计费 规则，可以简单得出如下公式：

云函数/云对象费用 = 资源使用量 * 0.000110592 + 调用次数 * 0.0133 / 10000 + 出网流量 * 0.8

按照如上公式，其一键登录业务云函数每天的费用为：

示例源码如下，请查看 pre > code 标签中的内容

结论：如果你的一键登录业务平均每天获取手机号次数为10000次，使用阿里云正式版云服务空间后，对应云函数每天大概消耗0.139元，对比之前的一键登录费用，平均每次调用多花0.0000139元，几乎可忽略不计。

很明显一键登陆是比短信验证码更便宜的用户身份验证方式。

**Examples:**

Example 1 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 2 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 3 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

Example 4 (json):
```json
{
	"name": "univerify",
	"extensions": {
		"uni-cloud-verify": {} // 启用一键登录扩展，值为空对象即可
	}
}
```

---

## uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-id.html

文档已迁移至：uni-id/summary

---

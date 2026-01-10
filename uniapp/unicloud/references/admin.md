# Unicloud - Admin

**Pages:** 4

---

## uni-portal 统一发布页@uni-portal | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-portal.html

**Contents:**
- # uni-portal 统一发布页
  - # 获取 iOS ABM 包 uni-admin 2.4.4+

App/小程序/网站做好后，如何告知你的用户？

你需要为自己的业务制作一个名片，名片上统一展现：App 的下载地址、小程序二维码、H5访问链接等，也就是“统一发布页”。

而你自己从头开发这么一个发行平台，需要考虑的事情太多了：

别急，有了uni-portal统一发布页，一切迎刃而解，10分钟内搞定所有。

眼见为实，uni-app官方示例的发布页就是基于uni-portal制作的，快速体验hello uni-app发布页 。

uni-portal目前已内置在uni-admin项目中。

管理员在uni-admin的“应用管理”模块，创建应用并完善相关应用信息（如apk下载地址、小程序二维码）后，点击“发布页管理”，即可生成该应用的发布页。

uni-portal 统一发布页面是响应式的，兼容PC宽屏和手机窄屏。

uni-portal统一发布页同时会识别当前浏览器环境，在微信等特殊浏览器上，自动提示“点击右上角菜单，在浏览器中打开”，效果如下：

以下图片都以 hello-uniapp x 发布页为例

重新生成的发布页在使用 iPhone 访问的时候，会出现 获取 ABM 应用 按钮：

如果点击确定，则会跳转至在 应用管理 中配置的 获取 ABM 应用登录链接 进行登录，如在 hello-uniapp x 中：

登录完成后需要携带参数重定向到处理页面（示例 ）

如 hello-uniapp x 发布页：登录后会携带 oauthToken 重定向到处理页面，校验 oauthToken 后使用云对象去 opendb-ios-redeem-code 表（在示例中有 schema）中换取 ABM 兑换码，跳转至 AppStore 消费兑换码，自动下载安装 App

---

## uni-admin 框架（原名 uniCloud admin） | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/admin

**Contents:**
- # uni-admin 框架（原名 uniCloud admin）
- # 简介
- # 看视频，15分钟掌握uni-admin
- # uni-admin 功能
- # 使用说明
  - # 一键部署
  - # 手动部署
    - # 创建
    - # 运行
- # 目录结构

uni-admin 框架，是基于 uni-app 和 uniCloud 的应用后台管理的开源框架。

对于uniCloud的开发者而言，其后台管理系统应该使用本框架。

官方搭建了uni-admin演示站点 ，你登录后即可快速体验uni-admin。

uni-admin 是开源的，遵循 MIT 协议，你可以从Github 或码云 获取源码，也可以从DCloud插件市场 快捷下载。

问题交流与反馈，请加入：uni-admin交流群

uni-admin有预置功能、插件生态和数据表管理的代码生成工具。

有这套组合，管理端系统的开发变的前所未有的简单、高效、低成本。

uni-admin 同时支持 PC 端 和移动端。基础模块是全端可用的，但注意有的插件不是全端的。

uni-admin是完整开源的一个uni-app项目，任何熟悉uni-app的工程师都可以自行开发扩展功能。

如果需要修改皮肤颜色，可以在 uni-admin 项目根目录的 uni.scss 文件中进行修改：

在 uni.scss 文件的 $themes 属性中新增一个键值 blue 的配置：

修改项目根目录的 admin.config.js 文件，添加以下内容，注意：value 的值需要与 $themes 中新增主题的键值保持一致：

uni-admin的一键部署，会自动上传云函数、创建数据库，并将前端页面编译上传到前端网页托管中，帮你一键生成网站并自动部署uni统计；如果你需要在HBuilderX中修改定制代码，后续可再选择手动部署方式导入项目源码到HBuilderX。

如需要部署在阿里云空间，则请使用手动部署方式

当你需要使用uni-admin来开发时，需要使用手动部署方式导入源码到HBX中进行开发。

HBuilderX 3.0+版本新建 uni-app 项目，选择 uni-admin 项目模板，如下图

创建完成后，可以跟随云服务空间初始化向导初始化项目，创建并绑定云服务空间

在上传云对象XXX(以uni-id-co为例)的时候报错：云对象uni-id-co上传失败。失败原因：npm install执行失败...

浏览器联网失败，报 request：fail，需要去云服务空间的跨域配置配置跨域域名，需带端口。详见

如从未接触过uniCloud，是无法直接上手uni-admin的，建议先通读下uniCloud文档的概念介绍和快速上手章节。详见

示例源码如下，请查看 pre > code 标签中的内容

首次使用，可以通过登录页面底部链接创建一个超级管理员（仅允许创建一次），该接口会判断系统里如果有 admin 角色的用户，就不再允许添加新的超级管理员。

注意：注册完毕后，建议从登录页面移除该链接

登录后我们会看到如下窗体, 窗体分为三个部分，topWindow 顶部窗口（导航栏），leftwindow 左侧窗口（菜单栏），右侧的内容主窗体

顶部窗口默认在左侧展示系统 Logo、右侧显示导航链接，效果如上图。展示内容可通过项目根目录下的admin.config.js文件进行配置，如下为示例：

示例源码如下，请查看 pre > code 标签中的内容

顶部导航栏的样式，可通过项目根目录下的uni.scss进行自定义，如下：

示例源码如下，请查看 pre > code 标签中的内容

左侧窗口内主要是菜单，菜单包含静态菜单和动态菜单，支持无限层级嵌套，但建议层级不要超过三级

用户登录时，会根据用户的 角色 去查找其拥有的 权限 ，再根据 权限 去查找对应的 菜单

通过 admin.config.js 配置侧边栏内容，所有用户都能看到静态菜单。

示例源码如下，请查看 pre > code 标签中的内容

在左侧导航菜单中，找到系统管理 -> 菜单管理，可视化的维护菜单。

菜单数据存储在云数据库的 opendb-admin-menus 表中。该表字段说明如下：

调整菜单颜色时，只需设置菜单背景色 $menu-bg-color，自行搭配文字前景色即可

示例源码如下，请查看 pre > code 标签中的内容

右侧窗口是内容主窗体，和 uni-app 保持一致，用户登录后看到的第一个页面，默认是 pages 数组中第一项表示应用启动页。

如果想将自己开发的页面调到登录后首页，可在 page.json 调整。

在进入应用管理后可看到如下界面，点击右上角 新增 按钮可新增一个应用

本页面信息，在应用发布、app升级模块中，都会关联使用，请认真填写

在manifest.json -> 源码视图中添加以下配置：

示例源码如下，请查看 pre > code 标签中的内容

自uni-admin 1.9.3+版本开始，uni-portal作为uni-admin的内置插件，内置在uni-admin项目中。

uni-admin管理员通过“应用管理”模块中填写的应用信息（如apk下载地址、小程序二维码）后，可快捷生成应用发布页。

更多uni-portal的介绍，详见：uni-portal

自uni-admin 1.9.3+版本开始，uni-upgrade-center作为uni-admin的内置插件，内置在uni-admin项目中。

uni-admin管理员通过“应用管理”模块中填写的应用信息（如apk下载地址、小程序二维码）后，可通过列操作进入升级中心进行版本管理。

更多uni-portal的介绍，详见：uni-upgrade-center

uni统计2.0 是开源、全端、云端一体、更适合uni-app的统计平台，下图为概览图和简介，详见统计文档

全端流量统计，一张报表可查看所有端（iOS、Android、Web 及各家小程序）的运营数据。

无需在各端接不同的sdk、无需在不同报表看数据。目前市面已知唯一一个一张报表看遍业务全景的方案。

无论前端采集数据的SDK、云端接收数据的云函数、云端跑批统计的云函数、展示统计结果的报表，所有这些代码全部开源。

前端自定义打点，后端自定义统计维度，自由定制报表，一切都可以灵活定制。

使用传统saas类统计产品，所有数据都上报给统计服务厂商。

uni统计2.0基于uniCloud实现，云函数、统计数据全部托管在开发者自己的服务空间（阿里云或腾讯云自选）中，开发者对自己的统计数据拥有完整的控制权。

传统统计平台，都没有js错误统计。开发者无法了解到自己的js代码在哪些设备上会报错。

uni统计的错误信息更全面，包括 js前端错误和 App 原生层的崩溃。辅助开发者把应用做的更好。

6. 更适合uni-app和uniCloud

uni统计深入uni-app和uniCloud框架底层，提供了众多其他统计平台无法提供的功能：

uni统计开源且基于uni-admin的插件规范提供了插件机制，会有更多插件作者提供各种丰富的统计插件（如电商统计、内容统计等）。见插件市场

如有客户关怀、会员服务、电商活动、新品上线等场景需要给用户发送短信时，无需开发，在uni-admin控制台选择用户/标签即可向用户群发短信，省时高效。 同时支持动态替换短信模板变量，使短信更加个性化。

如您首次使用请登录uniCloud控制台 开通并充值

在uniCloud控制台-短信服务-签名配置 添加短信签名

在uniCloud控制台-短信服务-模板配置 内申请自定义模板

例如：【测试】亲爱的${username}, 祝您生日快乐！感谢您长期以来对xx商城的信任与支持，会员生日月畅享购物双倍积分，期待您的光临！

在短信模板页面-点击”导出模板“按钮，导出短信模板。

步骤四：通过uni-admin控制台发送短信

如您未部署过uni-admin，请在插件市场中安装uni-admin

配置完成后，登录uni-admin控制台，打开用户管理页面，请按照图示步骤上传短信模板（步骤三导出的短信模板）： 短信模板上传成功后，短信模板即可显示，如下：

选择要接收短信的用户，如下： 或者如果已经对用户进行了分组，可以在标签管理中选择标签后发送短信，如下：

目前短信支持固定文本发送与关联数据表字段发送，以下介绍两种方式如何发送

选择短信模板，如果没有出现变量模板配置就是固定文本模式，如下： 可以在发送前点击预览，可以预览发送的第一条短信，用来检查短信内容是否正确，如下： 确认短信内容无误后，点击提交即可发送短信，发送短信之后可以在uniCloud控制台-短信服务-发送记录 查看发送记录。

选择短信模板，如果出现变量模板配置就是数据表查询模式，如下： 如上，短信变量字段为”username“，配置替换字段为uni-id-users表中username字段，在发送短信时会替换掉短信变量。

短信变量支持固定值和数据表查询两种方式；固定值如：各位同事，数据表查询如：{uni-id-users.username}；请注意，若使用数据表查询方式，目前仅支持查询 uni-id-users 表；并注意确保数据库中查询字段值不为空，否则短信将发送失败。

在发送之前可以点击预览，查看第一条短信的内容，确保变量模板配置正确，如下，username将替换为“张三”：

确认短信内容无误后，点击提交即可发送短信，发送短信之后可以在uniCloud控制台-短信服务-发送记录 查看发送记录。

如有任何问题可在论坛发帖 咨询或加uniCloud短信服务交流QQ群(695645208)咨询

uni-admin 框架基于 uni-id，复用 uni-id 的用户、角色、权限系统，详见uni-id 。

需要注意的是，admin 框架的动态菜单同样依赖 uni-id 的权限表（uni-id-permissions）。

菜单表(opendb-admin-menus)定义如下：

admin 提供了两个内置方法，方便在页面中鉴定登录用户权限和角色:

示例源码如下，请查看 pre > code 标签中的内容

下面以增加一个普通成员的角色为例，该角色的用户登录admin系统后只能看用户表数据，不能改动数据。

admin 框架内置了一套 icon 图标，在静态功能演示-图标菜单中，点击图标即可复制图标的 class 定义。

选中样式后，在新建菜单页面的表单中输入样式名称。没有样式的菜单项将没有图标。

当然，你也可以使用三方 icon 库。以使用 elementUI 的图标为例，在 app.vue 中导入图标库的样式文件：

示例源码如下，请查看 pre > code 标签中的内容

在标签上使用图标的 class 名称即可：el-icon-s-tools

新增页面可以自己开发页面，也可以从插件市场下载插件。页面如需添加菜单，参见上文的菜单管理。

注意：在使用 uni-cloud-router 时，controller 下的文件夹和文件，不要命名相同，例如：app/room 这个写法目前分辨不了 app 是文件 app.js，还是文件夹 app

admin 中开发页面，和 uni-app 开发 vue 页面是一致的。

---------------------------------- 分割线 ----------------------------------------

我们不仅是插件的使用者，也可以是插件的开发者，那么如何开发一款 uni-admin 插件呢？

对于 admin 插件来说，可以项目中开发完成功能，再将这项功能剥离成一个插件。其他开发者使用插件的过程，就是将插件还原成项目中的一项功能。

admin 插件包含云函数、前端页面，它必须基于 uni-id 的账户和权限体系，它不限制云函数的开发方式，可以自己写普通云函数、可以用任何单路由云函数框架、也可以用 clientDB。

admin插件不能是整体工程，不能包含manifest。它更类似于页面模板。

示例源码如下，请查看 pre > code 标签中的内容

%pluginId%-menu.json 配置

本文件用于插件注册 uni-admin左侧的动态菜单。

pluginId 为你上传插件市场时填的插件id（插件市场每个插件都有一个唯一id）。

假使你的插件id为“xxx-yyy”，那么在插件的根目录放置 xxx-yyy-menu.json ，按下文格式配置内容。（uni_module下不需要pluginId，直接就是menu.json）

示例源码如下，请查看 pre > code 标签中的内容

包含%pluginId%-menu.json的插件导入项目后，运行起来uni-admin，菜单管理模块会自动读取这个json文件中的菜单配置，生成【待添加菜单】，配置与 admin【管理动态菜单】同理。插件作者可以在界面上可视化的点击确认添加，即可把菜单加入到他的项目下。

虽然也可以通过database目录来进行菜单初始化，但不建议这么操作。很容易发生和用户的数据库的冲突。仍然推荐使用%pluginId%-menu.json方式。

关于uni-admin和uni-cloud-router公共模块 uni-admin自带了一个单路由框架，uni-cloud-router，然后自带了一个uni-admin云函数使用了这个uni-cloud-router。但插件作者的插件，不能写在uni-admin的目录下。插件的云函数，要有插件id前缀，如果你想把你的插件的所有云函数合并成一个云函数，可以新建一个你自己的云函数，在里面引用uni-cloud-router公共模块。

使用schema2code生成admin页面

大多数的 admin 插件的表单页面是可以用uniCloud自带的schema2code工具自动生成的，可以直接生成数据库的增删改查的完整页面。所以在 uni-admin 中制作一个插件非常简单。

首先在数据库中配好DB Schema ，然后使用 uniCloud web 控制台提供的schema2code生成代码工具，即可快速的生成数据的展示、新建、修改、删除的页面代码，并且自带表单校验。详见：schema2code

为防止和用户工程的文件冲突，插件的页面应该有插件的前缀，比如 pages/xxx-page。自带的数据库schema文件也推荐带上前缀。

以下为已存在的 uni-admin 插件列表，可以参考：https://ext.dcloud.net.cn/?cat1=7&cat2=74&orderBy=UpdatedDate

插件上传等更多信息，参考 DCloud 插件开发指南汇总 及其中的 admin 插件部分，插件作者可以按此文档提交插件，在插件市场的上传发布页面选择uniCloud 分类的 Admin 插件 。

uni-admin 支持所有三方的 Vue UI 库，包括 elementUI 等非 uni-app 的 UI 库，但注意这些 for h5 的 ui 库只能在浏览器中使用，无法适配 App 和小程序，按如下操作。

示例源码如下，请查看 pre > code 标签中的内容

用户登录逻辑：登录时系统检测没有菜单会提示“暂无权限登录”，需要给新账号绑定角色，角色有菜单方可登录

请查看 /uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/ 目录下是否有这些目录和文件，如果没有，请先尝试下载 uni-config-center 模块

确保下载后的目录是下图这样的，如果下载后还是没有，则需要下载最新版uni-admin，然后从下载的项目中复制过来

最后再重新上传 uni-config-center 模块

注意：uni-id 配置文件为标准的 json 文件，里面不可以写注释。

**Examples:**

Example 1 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 2 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 3 (unknown):
```unknown
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 4 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

---

## uni-admin 框架（原名 uniCloud admin） | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/admin.html

**Contents:**
- # uni-admin 框架（原名 uniCloud admin）
- # 简介
- # 看视频，15分钟掌握uni-admin
- # uni-admin 功能
- # 使用说明
  - # 一键部署
  - # 手动部署
    - # 创建
    - # 运行
- # 目录结构

uni-admin 框架，是基于 uni-app 和 uniCloud 的应用后台管理的开源框架。

对于uniCloud的开发者而言，其后台管理系统应该使用本框架。

官方搭建了uni-admin演示站点 ，你登录后即可快速体验uni-admin。

uni-admin 是开源的，遵循 MIT 协议，你可以从Github 或码云 获取源码，也可以从DCloud插件市场 快捷下载。

问题交流与反馈，请加入：uni-admin交流群

uni-admin有预置功能、插件生态和数据表管理的代码生成工具。

有这套组合，管理端系统的开发变的前所未有的简单、高效、低成本。

uni-admin 同时支持 PC 端 和移动端。基础模块是全端可用的，但注意有的插件不是全端的。

uni-admin是完整开源的一个uni-app项目，任何熟悉uni-app的工程师都可以自行开发扩展功能。

如果需要修改皮肤颜色，可以在 uni-admin 项目根目录的 uni.scss 文件中进行修改：

在 uni.scss 文件的 $themes 属性中新增一个键值 blue 的配置：

修改项目根目录的 admin.config.js 文件，添加以下内容，注意：value 的值需要与 $themes 中新增主题的键值保持一致：

uni-admin的一键部署，会自动上传云函数、创建数据库，并将前端页面编译上传到前端网页托管中，帮你一键生成网站并自动部署uni统计；如果你需要在HBuilderX中修改定制代码，后续可再选择手动部署方式导入项目源码到HBuilderX。

如需要部署在阿里云空间，则请使用手动部署方式

当你需要使用uni-admin来开发时，需要使用手动部署方式导入源码到HBX中进行开发。

HBuilderX 3.0+版本新建 uni-app 项目，选择 uni-admin 项目模板，如下图

创建完成后，可以跟随云服务空间初始化向导初始化项目，创建并绑定云服务空间

在上传云对象XXX(以uni-id-co为例)的时候报错：云对象uni-id-co上传失败。失败原因：npm install执行失败...

浏览器联网失败，报 request：fail，需要去云服务空间的跨域配置配置跨域域名，需带端口。详见

如从未接触过uniCloud，是无法直接上手uni-admin的，建议先通读下uniCloud文档的概念介绍和快速上手章节。详见

示例源码如下，请查看 pre > code 标签中的内容

首次使用，可以通过登录页面底部链接创建一个超级管理员（仅允许创建一次），该接口会判断系统里如果有 admin 角色的用户，就不再允许添加新的超级管理员。

注意：注册完毕后，建议从登录页面移除该链接

登录后我们会看到如下窗体, 窗体分为三个部分，topWindow 顶部窗口（导航栏），leftwindow 左侧窗口（菜单栏），右侧的内容主窗体

顶部窗口默认在左侧展示系统 Logo、右侧显示导航链接，效果如上图。展示内容可通过项目根目录下的admin.config.js文件进行配置，如下为示例：

示例源码如下，请查看 pre > code 标签中的内容

顶部导航栏的样式，可通过项目根目录下的uni.scss进行自定义，如下：

示例源码如下，请查看 pre > code 标签中的内容

左侧窗口内主要是菜单，菜单包含静态菜单和动态菜单，支持无限层级嵌套，但建议层级不要超过三级

用户登录时，会根据用户的 角色 去查找其拥有的 权限 ，再根据 权限 去查找对应的 菜单

通过 admin.config.js 配置侧边栏内容，所有用户都能看到静态菜单。

示例源码如下，请查看 pre > code 标签中的内容

在左侧导航菜单中，找到系统管理 -> 菜单管理，可视化的维护菜单。

菜单数据存储在云数据库的 opendb-admin-menus 表中。该表字段说明如下：

调整菜单颜色时，只需设置菜单背景色 $menu-bg-color，自行搭配文字前景色即可

示例源码如下，请查看 pre > code 标签中的内容

右侧窗口是内容主窗体，和 uni-app 保持一致，用户登录后看到的第一个页面，默认是 pages 数组中第一项表示应用启动页。

如果想将自己开发的页面调到登录后首页，可在 page.json 调整。

在进入应用管理后可看到如下界面，点击右上角 新增 按钮可新增一个应用

本页面信息，在应用发布、app升级模块中，都会关联使用，请认真填写

在manifest.json -> 源码视图中添加以下配置：

示例源码如下，请查看 pre > code 标签中的内容

自uni-admin 1.9.3+版本开始，uni-portal作为uni-admin的内置插件，内置在uni-admin项目中。

uni-admin管理员通过“应用管理”模块中填写的应用信息（如apk下载地址、小程序二维码）后，可快捷生成应用发布页。

更多uni-portal的介绍，详见：uni-portal

自uni-admin 1.9.3+版本开始，uni-upgrade-center作为uni-admin的内置插件，内置在uni-admin项目中。

uni-admin管理员通过“应用管理”模块中填写的应用信息（如apk下载地址、小程序二维码）后，可通过列操作进入升级中心进行版本管理。

更多uni-portal的介绍，详见：uni-upgrade-center

uni统计2.0 是开源、全端、云端一体、更适合uni-app的统计平台，下图为概览图和简介，详见统计文档

全端流量统计，一张报表可查看所有端（iOS、Android、Web 及各家小程序）的运营数据。

无需在各端接不同的sdk、无需在不同报表看数据。目前市面已知唯一一个一张报表看遍业务全景的方案。

无论前端采集数据的SDK、云端接收数据的云函数、云端跑批统计的云函数、展示统计结果的报表，所有这些代码全部开源。

前端自定义打点，后端自定义统计维度，自由定制报表，一切都可以灵活定制。

使用传统saas类统计产品，所有数据都上报给统计服务厂商。

uni统计2.0基于uniCloud实现，云函数、统计数据全部托管在开发者自己的服务空间（阿里云或腾讯云自选）中，开发者对自己的统计数据拥有完整的控制权。

传统统计平台，都没有js错误统计。开发者无法了解到自己的js代码在哪些设备上会报错。

uni统计的错误信息更全面，包括 js前端错误和 App 原生层的崩溃。辅助开发者把应用做的更好。

6. 更适合uni-app和uniCloud

uni统计深入uni-app和uniCloud框架底层，提供了众多其他统计平台无法提供的功能：

uni统计开源且基于uni-admin的插件规范提供了插件机制，会有更多插件作者提供各种丰富的统计插件（如电商统计、内容统计等）。见插件市场

如有客户关怀、会员服务、电商活动、新品上线等场景需要给用户发送短信时，无需开发，在uni-admin控制台选择用户/标签即可向用户群发短信，省时高效。 同时支持动态替换短信模板变量，使短信更加个性化。

如您首次使用请登录uniCloud控制台 开通并充值

在uniCloud控制台-短信服务-签名配置 添加短信签名

在uniCloud控制台-短信服务-模板配置 内申请自定义模板

例如：【测试】亲爱的${username}, 祝您生日快乐！感谢您长期以来对xx商城的信任与支持，会员生日月畅享购物双倍积分，期待您的光临！

在短信模板页面-点击”导出模板“按钮，导出短信模板。

步骤四：通过uni-admin控制台发送短信

如您未部署过uni-admin，请在插件市场中安装uni-admin

配置完成后，登录uni-admin控制台，打开用户管理页面，请按照图示步骤上传短信模板（步骤三导出的短信模板）： 短信模板上传成功后，短信模板即可显示，如下：

选择要接收短信的用户，如下： 或者如果已经对用户进行了分组，可以在标签管理中选择标签后发送短信，如下：

目前短信支持固定文本发送与关联数据表字段发送，以下介绍两种方式如何发送

选择短信模板，如果没有出现变量模板配置就是固定文本模式，如下： 可以在发送前点击预览，可以预览发送的第一条短信，用来检查短信内容是否正确，如下： 确认短信内容无误后，点击提交即可发送短信，发送短信之后可以在uniCloud控制台-短信服务-发送记录 查看发送记录。

选择短信模板，如果出现变量模板配置就是数据表查询模式，如下： 如上，短信变量字段为”username“，配置替换字段为uni-id-users表中username字段，在发送短信时会替换掉短信变量。

短信变量支持固定值和数据表查询两种方式；固定值如：各位同事，数据表查询如：{uni-id-users.username}；请注意，若使用数据表查询方式，目前仅支持查询 uni-id-users 表；并注意确保数据库中查询字段值不为空，否则短信将发送失败。

在发送之前可以点击预览，查看第一条短信的内容，确保变量模板配置正确，如下，username将替换为“张三”：

确认短信内容无误后，点击提交即可发送短信，发送短信之后可以在uniCloud控制台-短信服务-发送记录 查看发送记录。

如有任何问题可在论坛发帖 咨询或加uniCloud短信服务交流QQ群(695645208)咨询

uni-admin 框架基于 uni-id，复用 uni-id 的用户、角色、权限系统，详见uni-id 。

需要注意的是，admin 框架的动态菜单同样依赖 uni-id 的权限表（uni-id-permissions）。

菜单表(opendb-admin-menus)定义如下：

admin 提供了两个内置方法，方便在页面中鉴定登录用户权限和角色:

示例源码如下，请查看 pre > code 标签中的内容

下面以增加一个普通成员的角色为例，该角色的用户登录admin系统后只能看用户表数据，不能改动数据。

admin 框架内置了一套 icon 图标，在静态功能演示-图标菜单中，点击图标即可复制图标的 class 定义。

选中样式后，在新建菜单页面的表单中输入样式名称。没有样式的菜单项将没有图标。

当然，你也可以使用三方 icon 库。以使用 elementUI 的图标为例，在 app.vue 中导入图标库的样式文件：

示例源码如下，请查看 pre > code 标签中的内容

在标签上使用图标的 class 名称即可：el-icon-s-tools

新增页面可以自己开发页面，也可以从插件市场下载插件。页面如需添加菜单，参见上文的菜单管理。

注意：在使用 uni-cloud-router 时，controller 下的文件夹和文件，不要命名相同，例如：app/room 这个写法目前分辨不了 app 是文件 app.js，还是文件夹 app

admin 中开发页面，和 uni-app 开发 vue 页面是一致的。

---------------------------------- 分割线 ----------------------------------------

我们不仅是插件的使用者，也可以是插件的开发者，那么如何开发一款 uni-admin 插件呢？

对于 admin 插件来说，可以项目中开发完成功能，再将这项功能剥离成一个插件。其他开发者使用插件的过程，就是将插件还原成项目中的一项功能。

admin 插件包含云函数、前端页面，它必须基于 uni-id 的账户和权限体系，它不限制云函数的开发方式，可以自己写普通云函数、可以用任何单路由云函数框架、也可以用 clientDB。

admin插件不能是整体工程，不能包含manifest。它更类似于页面模板。

示例源码如下，请查看 pre > code 标签中的内容

%pluginId%-menu.json 配置

本文件用于插件注册 uni-admin左侧的动态菜单。

pluginId 为你上传插件市场时填的插件id（插件市场每个插件都有一个唯一id）。

假使你的插件id为“xxx-yyy”，那么在插件的根目录放置 xxx-yyy-menu.json ，按下文格式配置内容。（uni_module下不需要pluginId，直接就是menu.json）

示例源码如下，请查看 pre > code 标签中的内容

包含%pluginId%-menu.json的插件导入项目后，运行起来uni-admin，菜单管理模块会自动读取这个json文件中的菜单配置，生成【待添加菜单】，配置与 admin【管理动态菜单】同理。插件作者可以在界面上可视化的点击确认添加，即可把菜单加入到他的项目下。

虽然也可以通过database目录来进行菜单初始化，但不建议这么操作。很容易发生和用户的数据库的冲突。仍然推荐使用%pluginId%-menu.json方式。

关于uni-admin和uni-cloud-router公共模块 uni-admin自带了一个单路由框架，uni-cloud-router，然后自带了一个uni-admin云函数使用了这个uni-cloud-router。但插件作者的插件，不能写在uni-admin的目录下。插件的云函数，要有插件id前缀，如果你想把你的插件的所有云函数合并成一个云函数，可以新建一个你自己的云函数，在里面引用uni-cloud-router公共模块。

使用schema2code生成admin页面

大多数的 admin 插件的表单页面是可以用uniCloud自带的schema2code工具自动生成的，可以直接生成数据库的增删改查的完整页面。所以在 uni-admin 中制作一个插件非常简单。

首先在数据库中配好DB Schema ，然后使用 uniCloud web 控制台提供的schema2code生成代码工具，即可快速的生成数据的展示、新建、修改、删除的页面代码，并且自带表单校验。详见：schema2code

为防止和用户工程的文件冲突，插件的页面应该有插件的前缀，比如 pages/xxx-page。自带的数据库schema文件也推荐带上前缀。

以下为已存在的 uni-admin 插件列表，可以参考：https://ext.dcloud.net.cn/?cat1=7&cat2=74&orderBy=UpdatedDate

插件上传等更多信息，参考 DCloud 插件开发指南汇总 及其中的 admin 插件部分，插件作者可以按此文档提交插件，在插件市场的上传发布页面选择uniCloud 分类的 Admin 插件 。

uni-admin 支持所有三方的 Vue UI 库，包括 elementUI 等非 uni-app 的 UI 库，但注意这些 for h5 的 ui 库只能在浏览器中使用，无法适配 App 和小程序，按如下操作。

示例源码如下，请查看 pre > code 标签中的内容

用户登录逻辑：登录时系统检测没有菜单会提示“暂无权限登录”，需要给新账号绑定角色，角色有菜单方可登录

请查看 /uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/ 目录下是否有这些目录和文件，如果没有，请先尝试下载 uni-config-center 模块

确保下载后的目录是下图这样的，如果下载后还是没有，则需要下载最新版uni-admin，然后从下载的项目中复制过来

最后再重新上传 uni-config-center 模块

注意：uni-id 配置文件为标准的 json 文件，里面不可以写注释。

**Examples:**

Example 1 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 2 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 3 (unknown):
```unknown
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 4 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

---

## uni-admin 框架（原名 uniCloud admin） | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/admin?id=mutiladmin

**Contents:**
- # uni-admin 框架（原名 uniCloud admin）
- # 简介
- # 看视频，15分钟掌握uni-admin
- # uni-admin 功能
- # 使用说明
  - # 一键部署
  - # 手动部署
    - # 创建
    - # 运行
- # 目录结构

uni-admin 框架，是基于 uni-app 和 uniCloud 的应用后台管理的开源框架。

对于uniCloud的开发者而言，其后台管理系统应该使用本框架。

官方搭建了uni-admin演示站点 ，你登录后即可快速体验uni-admin。

uni-admin 是开源的，遵循 MIT 协议，你可以从Github 或码云 获取源码，也可以从DCloud插件市场 快捷下载。

问题交流与反馈，请加入：uni-admin交流群

uni-admin有预置功能、插件生态和数据表管理的代码生成工具。

有这套组合，管理端系统的开发变的前所未有的简单、高效、低成本。

uni-admin 同时支持 PC 端 和移动端。基础模块是全端可用的，但注意有的插件不是全端的。

uni-admin是完整开源的一个uni-app项目，任何熟悉uni-app的工程师都可以自行开发扩展功能。

如果需要修改皮肤颜色，可以在 uni-admin 项目根目录的 uni.scss 文件中进行修改：

在 uni.scss 文件的 $themes 属性中新增一个键值 blue 的配置：

修改项目根目录的 admin.config.js 文件，添加以下内容，注意：value 的值需要与 $themes 中新增主题的键值保持一致：

uni-admin的一键部署，会自动上传云函数、创建数据库，并将前端页面编译上传到前端网页托管中，帮你一键生成网站并自动部署uni统计；如果你需要在HBuilderX中修改定制代码，后续可再选择手动部署方式导入项目源码到HBuilderX。

如需要部署在阿里云空间，则请使用手动部署方式

当你需要使用uni-admin来开发时，需要使用手动部署方式导入源码到HBX中进行开发。

HBuilderX 3.0+版本新建 uni-app 项目，选择 uni-admin 项目模板，如下图

创建完成后，可以跟随云服务空间初始化向导初始化项目，创建并绑定云服务空间

在上传云对象XXX(以uni-id-co为例)的时候报错：云对象uni-id-co上传失败。失败原因：npm install执行失败...

浏览器联网失败，报 request：fail，需要去云服务空间的跨域配置配置跨域域名，需带端口。详见

如从未接触过uniCloud，是无法直接上手uni-admin的，建议先通读下uniCloud文档的概念介绍和快速上手章节。详见

示例源码如下，请查看 pre > code 标签中的内容

首次使用，可以通过登录页面底部链接创建一个超级管理员（仅允许创建一次），该接口会判断系统里如果有 admin 角色的用户，就不再允许添加新的超级管理员。

注意：注册完毕后，建议从登录页面移除该链接

登录后我们会看到如下窗体, 窗体分为三个部分，topWindow 顶部窗口（导航栏），leftwindow 左侧窗口（菜单栏），右侧的内容主窗体

顶部窗口默认在左侧展示系统 Logo、右侧显示导航链接，效果如上图。展示内容可通过项目根目录下的admin.config.js文件进行配置，如下为示例：

示例源码如下，请查看 pre > code 标签中的内容

顶部导航栏的样式，可通过项目根目录下的uni.scss进行自定义，如下：

示例源码如下，请查看 pre > code 标签中的内容

左侧窗口内主要是菜单，菜单包含静态菜单和动态菜单，支持无限层级嵌套，但建议层级不要超过三级

用户登录时，会根据用户的 角色 去查找其拥有的 权限 ，再根据 权限 去查找对应的 菜单

通过 admin.config.js 配置侧边栏内容，所有用户都能看到静态菜单。

示例源码如下，请查看 pre > code 标签中的内容

在左侧导航菜单中，找到系统管理 -> 菜单管理，可视化的维护菜单。

菜单数据存储在云数据库的 opendb-admin-menus 表中。该表字段说明如下：

调整菜单颜色时，只需设置菜单背景色 $menu-bg-color，自行搭配文字前景色即可

示例源码如下，请查看 pre > code 标签中的内容

右侧窗口是内容主窗体，和 uni-app 保持一致，用户登录后看到的第一个页面，默认是 pages 数组中第一项表示应用启动页。

如果想将自己开发的页面调到登录后首页，可在 page.json 调整。

在进入应用管理后可看到如下界面，点击右上角 新增 按钮可新增一个应用

本页面信息，在应用发布、app升级模块中，都会关联使用，请认真填写

在manifest.json -> 源码视图中添加以下配置：

示例源码如下，请查看 pre > code 标签中的内容

自uni-admin 1.9.3+版本开始，uni-portal作为uni-admin的内置插件，内置在uni-admin项目中。

uni-admin管理员通过“应用管理”模块中填写的应用信息（如apk下载地址、小程序二维码）后，可快捷生成应用发布页。

更多uni-portal的介绍，详见：uni-portal

自uni-admin 1.9.3+版本开始，uni-upgrade-center作为uni-admin的内置插件，内置在uni-admin项目中。

uni-admin管理员通过“应用管理”模块中填写的应用信息（如apk下载地址、小程序二维码）后，可通过列操作进入升级中心进行版本管理。

更多uni-portal的介绍，详见：uni-upgrade-center

uni统计2.0 是开源、全端、云端一体、更适合uni-app的统计平台，下图为概览图和简介，详见统计文档

全端流量统计，一张报表可查看所有端（iOS、Android、Web 及各家小程序）的运营数据。

无需在各端接不同的sdk、无需在不同报表看数据。目前市面已知唯一一个一张报表看遍业务全景的方案。

无论前端采集数据的SDK、云端接收数据的云函数、云端跑批统计的云函数、展示统计结果的报表，所有这些代码全部开源。

前端自定义打点，后端自定义统计维度，自由定制报表，一切都可以灵活定制。

使用传统saas类统计产品，所有数据都上报给统计服务厂商。

uni统计2.0基于uniCloud实现，云函数、统计数据全部托管在开发者自己的服务空间（阿里云或腾讯云自选）中，开发者对自己的统计数据拥有完整的控制权。

传统统计平台，都没有js错误统计。开发者无法了解到自己的js代码在哪些设备上会报错。

uni统计的错误信息更全面，包括 js前端错误和 App 原生层的崩溃。辅助开发者把应用做的更好。

6. 更适合uni-app和uniCloud

uni统计深入uni-app和uniCloud框架底层，提供了众多其他统计平台无法提供的功能：

uni统计开源且基于uni-admin的插件规范提供了插件机制，会有更多插件作者提供各种丰富的统计插件（如电商统计、内容统计等）。见插件市场

如有客户关怀、会员服务、电商活动、新品上线等场景需要给用户发送短信时，无需开发，在uni-admin控制台选择用户/标签即可向用户群发短信，省时高效。 同时支持动态替换短信模板变量，使短信更加个性化。

如您首次使用请登录uniCloud控制台 开通并充值

在uniCloud控制台-短信服务-签名配置 添加短信签名

在uniCloud控制台-短信服务-模板配置 内申请自定义模板

例如：【测试】亲爱的${username}, 祝您生日快乐！感谢您长期以来对xx商城的信任与支持，会员生日月畅享购物双倍积分，期待您的光临！

在短信模板页面-点击”导出模板“按钮，导出短信模板。

步骤四：通过uni-admin控制台发送短信

如您未部署过uni-admin，请在插件市场中安装uni-admin

配置完成后，登录uni-admin控制台，打开用户管理页面，请按照图示步骤上传短信模板（步骤三导出的短信模板）： 短信模板上传成功后，短信模板即可显示，如下：

选择要接收短信的用户，如下： 或者如果已经对用户进行了分组，可以在标签管理中选择标签后发送短信，如下：

目前短信支持固定文本发送与关联数据表字段发送，以下介绍两种方式如何发送

选择短信模板，如果没有出现变量模板配置就是固定文本模式，如下： 可以在发送前点击预览，可以预览发送的第一条短信，用来检查短信内容是否正确，如下： 确认短信内容无误后，点击提交即可发送短信，发送短信之后可以在uniCloud控制台-短信服务-发送记录 查看发送记录。

选择短信模板，如果出现变量模板配置就是数据表查询模式，如下： 如上，短信变量字段为”username“，配置替换字段为uni-id-users表中username字段，在发送短信时会替换掉短信变量。

短信变量支持固定值和数据表查询两种方式；固定值如：各位同事，数据表查询如：{uni-id-users.username}；请注意，若使用数据表查询方式，目前仅支持查询 uni-id-users 表；并注意确保数据库中查询字段值不为空，否则短信将发送失败。

在发送之前可以点击预览，查看第一条短信的内容，确保变量模板配置正确，如下，username将替换为“张三”：

确认短信内容无误后，点击提交即可发送短信，发送短信之后可以在uniCloud控制台-短信服务-发送记录 查看发送记录。

如有任何问题可在论坛发帖 咨询或加uniCloud短信服务交流QQ群(695645208)咨询

uni-admin 框架基于 uni-id，复用 uni-id 的用户、角色、权限系统，详见uni-id 。

需要注意的是，admin 框架的动态菜单同样依赖 uni-id 的权限表（uni-id-permissions）。

菜单表(opendb-admin-menus)定义如下：

admin 提供了两个内置方法，方便在页面中鉴定登录用户权限和角色:

示例源码如下，请查看 pre > code 标签中的内容

下面以增加一个普通成员的角色为例，该角色的用户登录admin系统后只能看用户表数据，不能改动数据。

admin 框架内置了一套 icon 图标，在静态功能演示-图标菜单中，点击图标即可复制图标的 class 定义。

选中样式后，在新建菜单页面的表单中输入样式名称。没有样式的菜单项将没有图标。

当然，你也可以使用三方 icon 库。以使用 elementUI 的图标为例，在 app.vue 中导入图标库的样式文件：

示例源码如下，请查看 pre > code 标签中的内容

在标签上使用图标的 class 名称即可：el-icon-s-tools

新增页面可以自己开发页面，也可以从插件市场下载插件。页面如需添加菜单，参见上文的菜单管理。

注意：在使用 uni-cloud-router 时，controller 下的文件夹和文件，不要命名相同，例如：app/room 这个写法目前分辨不了 app 是文件 app.js，还是文件夹 app

admin 中开发页面，和 uni-app 开发 vue 页面是一致的。

---------------------------------- 分割线 ----------------------------------------

我们不仅是插件的使用者，也可以是插件的开发者，那么如何开发一款 uni-admin 插件呢？

对于 admin 插件来说，可以项目中开发完成功能，再将这项功能剥离成一个插件。其他开发者使用插件的过程，就是将插件还原成项目中的一项功能。

admin 插件包含云函数、前端页面，它必须基于 uni-id 的账户和权限体系，它不限制云函数的开发方式，可以自己写普通云函数、可以用任何单路由云函数框架、也可以用 clientDB。

admin插件不能是整体工程，不能包含manifest。它更类似于页面模板。

示例源码如下，请查看 pre > code 标签中的内容

%pluginId%-menu.json 配置

本文件用于插件注册 uni-admin左侧的动态菜单。

pluginId 为你上传插件市场时填的插件id（插件市场每个插件都有一个唯一id）。

假使你的插件id为“xxx-yyy”，那么在插件的根目录放置 xxx-yyy-menu.json ，按下文格式配置内容。（uni_module下不需要pluginId，直接就是menu.json）

示例源码如下，请查看 pre > code 标签中的内容

包含%pluginId%-menu.json的插件导入项目后，运行起来uni-admin，菜单管理模块会自动读取这个json文件中的菜单配置，生成【待添加菜单】，配置与 admin【管理动态菜单】同理。插件作者可以在界面上可视化的点击确认添加，即可把菜单加入到他的项目下。

虽然也可以通过database目录来进行菜单初始化，但不建议这么操作。很容易发生和用户的数据库的冲突。仍然推荐使用%pluginId%-menu.json方式。

关于uni-admin和uni-cloud-router公共模块 uni-admin自带了一个单路由框架，uni-cloud-router，然后自带了一个uni-admin云函数使用了这个uni-cloud-router。但插件作者的插件，不能写在uni-admin的目录下。插件的云函数，要有插件id前缀，如果你想把你的插件的所有云函数合并成一个云函数，可以新建一个你自己的云函数，在里面引用uni-cloud-router公共模块。

使用schema2code生成admin页面

大多数的 admin 插件的表单页面是可以用uniCloud自带的schema2code工具自动生成的，可以直接生成数据库的增删改查的完整页面。所以在 uni-admin 中制作一个插件非常简单。

首先在数据库中配好DB Schema ，然后使用 uniCloud web 控制台提供的schema2code生成代码工具，即可快速的生成数据的展示、新建、修改、删除的页面代码，并且自带表单校验。详见：schema2code

为防止和用户工程的文件冲突，插件的页面应该有插件的前缀，比如 pages/xxx-page。自带的数据库schema文件也推荐带上前缀。

以下为已存在的 uni-admin 插件列表，可以参考：https://ext.dcloud.net.cn/?cat1=7&cat2=74&orderBy=UpdatedDate

插件上传等更多信息，参考 DCloud 插件开发指南汇总 及其中的 admin 插件部分，插件作者可以按此文档提交插件，在插件市场的上传发布页面选择uniCloud 分类的 Admin 插件 。

uni-admin 支持所有三方的 Vue UI 库，包括 elementUI 等非 uni-app 的 UI 库，但注意这些 for h5 的 ui 库只能在浏览器中使用，无法适配 App 和小程序，按如下操作。

示例源码如下，请查看 pre > code 标签中的内容

用户登录逻辑：登录时系统检测没有菜单会提示“暂无权限登录”，需要给新账号绑定角色，角色有菜单方可登录

请查看 /uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/ 目录下是否有这些目录和文件，如果没有，请先尝试下载 uni-config-center 模块

确保下载后的目录是下图这样的，如果下载后还是没有，则需要下载最新版uni-admin，然后从下载的项目中复制过来

最后再重新上传 uni-config-center 模块

注意：uni-id 配置文件为标准的 json 文件，里面不可以写注释。

**Examples:**

Example 1 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 2 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 3 (unknown):
```unknown
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

Example 4 (bash):
```bash
┌── uniCloud                            # 云端文件
│   │── cloudfunctions                  # 云函数相关文件
│   └── database                        # 数据库相关文件
├── common
│   │── admin-icons.css                 # admin-icons 图标样式
│   │── theme.scss                      # 换肤功能样式
│   │── uni.css                         # 公共样式
│   └── uni-icons.css                   # icon样式
├── components                          # 自定义组件
├── i18n                                # 国际化语言包目录
├── js_sdk                              # js sdk目录
├── pages                               # 页面
│   │── demo                            # demo相关的页面
│   │── error                           # 404页面
│   │── index                           # 首页
│   │── system                          # 系统管理
│   │   │── app                         # 应用管理
│   │   │── menu                        # 菜单管理
│   │   │── permission                  # 权限管理
│   │   │── role                        # 角色管理
│   │   │── safety                      # 安全审计
│   │   │── tag                         # 标签管理
│   │   └── user                        # 用户管理
│   └── uni-stat                        # uni统计
│       │── channel                     # 渠道（app）
│       │   │── channel.vue             # 页面（下同）
│       │   └── fieldsMap.js            # 字段配置（下同）
│       │── device                      # 设备统计
│       │   │── activity                # 渠道/场景分析
│       │   │   │── activity.vue
│       │   │   └── fieldsMap.js
│       │   │── comparison              # 平台对比
│       │   │   │── comparison.vue
│       │   │   └── fieldsMap.js
│       │   │── overview                # 今日概览
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   │── retention               # 留存
│       │   │   │── retention.vue
│       │   │   └── fieldsMap.js
│       │   │── stickiness              # 粘性
│       │   │   │── stickiness.vue
│       │   │   └── fieldsMap.js
│       │   └── trend                   # 趋势分析
│       │       │── trend.vue
│       │       └── fieldsMap.js
│       │── error                       # 错误分析
│       │   │── error.vue
│       │   └── fieldsMap.js
│       │── page-content                # 内容统计
│       │   │── page-content.vue
│       │   └── fieldsMap.js
│       │── event                       # 事件分析
│       │   │── event.vue
│       │   └── fieldsMap.js
│       │── page-ent                    # 入口页
│       │   │── page-ent.vue
│       │   └── fieldsMap.js
│       │── page-res                    # 受访页
│       │   │── page-res.vue
│       │   └── fieldsMap.js
│       │── page-rule                   # 页面规则
│       │   └── page-rule.vue
│       │── pay-order                   # 支付统计
│       │   │── funnel                  # 支付/漏斗分析
│       │   │   │── funnel.vue
│       │   │   └── fieldsMap.js
│       │   │── list                    # 支付/订单明细
│       │   │   │── list.vue
│       │   │── overview                # 支付/订单概况
│       │   │   │── overview.vue
│       │   │   └── fieldsMap.js
│       │   └── ranking                 # 支付/用户价值排行
│       │       └── ranking.vue
│       │── scene                       # 场景值（小程序）
│       │   │── scene.vue
│       │   └── fieldsMap.js
│       └── user                        # 用户统计
│           │── activity                # 渠道/场景分析
│           │   │── activity.vue
│           │   └── fieldsMap.js
│           │── comparison              # 平台对比
│           │   │── comparison.vue
│           │   └── fieldsMap.js
│           │── overview                # 今日概览
│           │   │── overview.vue
│           │   └── fieldsMap.js
│           │── retention               # 留存
│           │   │── retention.vue
│           │   └── fieldsMap.js
│           │── stickiness              # 粘性
│           │   │── stickiness.vue
│           │   └── fieldsMap.js
│           └── trend                   # 趋势分析
│               │── trend.vue
│               └── fieldsMap.js
├── static
├── store                               # vuex
├── uni_modules                         # uni_modules 插件目录
├── windows
│   │── component                       # 项目中使用的组件
│   │── leftWindow.vue                  # 左侧窗口（菜单栏）
│   └── topWindow.vue                   # 顶部窗口（导航栏）
├── admin.config.js                     # 系统配置（配置导航，菜单等）
├── App.vue
├── changelog.md                        # 更新日志
├── main.js
├── mainfest.json
├── package.json
├── pages.json                          # 页面配置
├── postcss.config.js                   # postcss 配置（浏览器兼容性）
├── uni.scss
└── vue.config.js                       # vue配置文件
```

---

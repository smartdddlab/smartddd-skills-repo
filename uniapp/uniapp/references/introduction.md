# Uniapp - Introduction

**Pages:** 20

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-for-ios

**Contents:**
- # uts for iOS
- # 1 了解 UTS 插件是什么
- # 2 掌握UTS语法
  - # 2.1 对于掌握 swift 语言者
  - # 2.2 对于仅掌握objective-c语言者
  - # 2.3 数据类型差异
    - # 举例一： Int、Float、Double 和 Number
- # 3 iOS 原生环境配置
  - # 3.1 配置 Info.plist
  - # 3.2 配置 entitlements

本文旨在帮助 iOS 开发者，快速上手 UTS。

需要阅读者具备 iOS 原生应用开发经验。

UTS 插件是 uni-app 新型插件形式 详情

对于 iOS 开发者来说，我们需要了解的是：

因为 UTS 语法与 swift 较类似，建议快速阅读后，在实践中掌握 UTS 语法。uts语法介绍。

尽管开发 UTS 插件，并不要求一定掌握 swift，但是鉴于 UTS 目前在 iOS 平台上，会编译为 swift 源码，掌握 swift 语言，方便排查问题和复杂功能实现。

因此建议学习一下 swift 语法，推荐阅读

UTS 和 swift 在数据类型上基本保持了一致，但是在部分场景下，还是会有差异，在此特别说明

数据类型以 UTS 内置的类型为准， 各原生平台都会对其自动适配。

当具体平台的 api 参数无法使用 UTS 类型兼容时，允许以对方明确要求的数据类型为准。

UTS 中不存在 Int、Float、Double 类型开发者在开发过程中应该使用 Number 类型覆盖 iOS 平台上使用 Int、Float、Double 的场景

但是当开发中需要重写系统方法或实现第三方依赖库的协议方法（delegate 方法）时，比如 API 明确要求参数为 Int 时，则需要写原生的类型 Int

下面以一个协议方法为例，需要实现一个三方依赖库中定义的协议方法

示例源码如下，请查看 pre > code 标签中的内容

我们在 UTS 中需要实现上面三方库中的协议方法时，由于参数和返回值类型都要求是 Int 类型，为了适应这种情况，UTS 允许开发者使用原生平台的数据类型 Int，来满足原生 API 对数据类型的要求：

示例源码如下，请查看 pre > code 标签中的内容

注意：UTS 中使用 implements 关键字表示遵循某个协议，下文会有详细说明

对于 iOS 项目来说，除了源码之外，还会涉及依赖，资源，工程配置等常见问题

本章节将会介绍，UTS插件开发环境中如何配置这些属性

当插件需要在原生工程 Info.plist 中添加配置项时，需要在插件的 app-ios 目录中创建 Info.plist 文件

以 hello uts 中的 uts-tencentgeolocation 腾讯定位插件中的配置文件为例:

示例文件在 hello uts 中的位置：

~/uni_modules/uts-tencentgeolocation/utssdk/app-ios/Info.plist

此示例表示需要在 Info.plist 中配置 APIKey 及开启后台定位权限

示例源码如下，请查看 pre > code 标签中的内容

Info.plist 格式及配置规则与 iOS 工程中是一致的，云端打包时会将配置信息合并到原生工程的 Info.plist 中

HBuilder X 3.6.11+ 版本支持

当插件需要开启 capabilities 中的相关服务时，需要在插件的 app-ios 目录中创建 UTS.entitlements 文件

比如需要在 capabilities 中勾选 Access WiFi Information 项，对应的 UTS.entitlements 的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

UTS.entitlements 格式及配置规则与 iOS 工程中是一致的，云端打包时会将配置信息合并到原生工程的 entitlements 配置文件中

如果您的插件需要依赖资源文件比如图片，音频等，可将资源文件放到插件目录下 ~/utssdk/app-ios/Resources/路径中

云端打包时会将此目录下的所有文件添加到应用 main bundle 中，建议只保存 uts 插件内置的资源文件。

uts 插件支持依赖三方库，目前支持 framework、xcframework、.a库

需要将依赖的framework或者xcframework文件存放到插件目录下 ~/utssdk/app-ios/Frameworks/路径中

云端打包时会将此目录中所有的依赖库添加到工程中，建议只存放与插件相关的依赖库

以 hello uts 中的 uts-tencentgeolocation 腾讯定位插件为例，本插件需要依赖腾讯定位库 TencentLBS.framework，则将依赖库存放到 ~/uni_modules/uts-tencentgeolocation/utssdk/app-ios/Framework/TencentLBS.framework 位置即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

有些第三方的 SDK 使用 OC 语言开发，且产物 .framework 文件里不包含 Moudules 文件夹。这就造成该 SDK 不支持 use module 模式，不能直接在 Swift 文件中导入。 这样的 SDK 不能直接被 uts 插件引用，需要做以下处理：

如果你有 SDK 的源码，那么有以下几种方法可以生成 Modules。 以名称为 TestSDK 的 framework 为例：

通过创建和 SDK 的 target 同名的头文件方式：

通过自定义 Module Map 的方式：

示例源码如下，请查看 pre > code 标签中的内容

如果使用的是第三方非开源的 SDK, 那么可以使用下面的方式来生成 Modules: 以 TestSDK 为例：

注意： 实践时要将 TestSDK 改成你要操作的 SDK 名称，.h 文件也要改成你要暴露的头文件名字。

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

DCloudUTSFoundation 为框架内置库，所有 uts 插件都会依赖此基础库

DCloudUTSFoundation 会封装一些常用方法便于开发者直接调用

使用时需要在 uts 文件中先导入 UTSiOS 类，所有方法都通过 UTSiOS 类调用

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

获取当前 app 显示的 UIViewController 实例

以 hello uts 中的 uts-alert 为例：

示例文件在 hello uts 中的位置：

~/uni_modules/uts-alert/utssdk/app-ios/index.uts

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

插架资源路径请传该资源在工程目录下的绝对路径

示例源码如下，请查看 pre > code 标签中的内容

至此我们认为你已经掌握了UTS语法，掌握了基本的 swift 语法，掌握了 UTS 对于 iOS 资源的支持。

但是对于一个熟悉 iOS 开发的 swift 语言者来说，有很多常用的习惯发生了改变，我们会在这个章节特别指出，便于开发者加深认识。

swift 中用 let 来声明常量，用 var 来声明变量

示例源码如下，请查看 pre > code 标签中的内容

uts中用 const 来声明常量，用 let 来声明变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uts 中可选类型的定义为 类型 | null

示例源码如下，请查看 pre > code 标签中的内容

swift 中调用构造方法创建实例对象时不需要使用 new 关键字

示例源码如下，请查看 pre > code 标签中的内容

uts 中调用构造方法实例化对象时需要在构造方法前加上 new 关键字

示例源码如下，请查看 pre > code 标签中的内容

在 swift 中参数名称使用 : 连接参数值，在 uts 中需要使用 = 连接

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

枚举在 swift 中可以忽略枚举类型直接简写 .枚举值 ，在 uts 中不支持简写，需要完整的写出 枚举类型.枚举值 上面的示例中 swift 中最后一个参数 preferredStyle 的值可以简写为

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

枚举在 swift 中可以定义关联类型，可在关联值中传递信息，但是在 ts 中没有这种语法，所以目前 uts 还暂不支持此种用法。

示例源码如下，请查看 pre > code 标签中的内容

如果遇到上述类型的枚举，且在三方库中无法改动的，可以在 Swift 文件中进行调用，然后把 该 Swift 文件打包在 framework 中供 uts 插件使用； 如果上述类型的枚举定义在有源码的 swift 中时，可以将其定义成不包含关联值的枚举，然后使用合适的数据结构来表示关联值携带的信息。

swift 中定义子类继承父类时需要在子类名称后加上父类名称，中间以冒号:分隔

示例源码如下，请查看 pre > code 标签中的内容

uts 中需要使用extends关键字代替冒号:

示例源码如下，请查看 pre > code 标签中的内容

swift 中要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号:分隔。遵循多个协议时，各协议之间用逗号,分隔：

示例源码如下，请查看 pre > code 标签中的内容

uts 中需要使用implements关键字代替冒号 :

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 uts 中不支持这种语法可使用下面方式代替

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uts 中不支持简写语法，需要完整的写出闭包函数

示例源码如下，请查看 pre > code 标签中的内容

原生中有些方法的闭包参数是逃逸闭包，此时就要在闭包前面添加 @escaping 标记：

示例源码如下，请查看 pre > code 标签中的内容

uts 中调用原生中涉及 target-action 的方法时，比如给UIButton添加点击事件方法、注册通知中心事件方法时注意事项，

示例文件在 hello uts 中的位置：

~/uni_modules/uts-screenshot-listener/utssdk/app-ios/index.uts

示例源码如下，请查看 pre > code 标签中的内容

swift 中的 Dictionary 类型，在 uts 中使用 Map 类型代替

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

当覆写系统方法，或实现三方SDK的协议方法时，一些方法可能会存在参数标签的情况

以 hello uts 中腾讯定位为例，监听位置变化时需要实现协议方法：

tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didUpdate location: TencentLBSLocation)

此方法第二个参数存在 didUpdate 参数标签

示例源码如下，请查看 pre > code 标签中的内容

uts 中需要用注解语法 @argumentLabel("didUpdate") 来表示参数标签

示例源码如下，请查看 pre > code 标签中的内容

示例文件在 hello uts 中的位置：

~/uni_modules/uts-tencentgeolocation/utssdk/app-ios/index.uts

只写参数名称的参数，编译后会在参数前默认增加 _ 来忽略参数标签（如上面的示例，第一个参数 manager，这种方式能兼容绝大多数方法，尤其是Swift 调用 OC 方法），但是有些参数没有参数标签，默认添加 _ 的行为会和原生方法定义不一致，这种情况需要定义一个空的参数标签来解决 @argumentLabel("didUpdate")

以高德定位 SDK 的代理方法为例：第三个参数 reGeocode 只有参数名称，没有参数标签

示例源码如下，请查看 pre > code 标签中的内容

uts 实现此方法时，需要给 reGeocode 参数添加一个空的参数标签

示例源码如下，请查看 pre > code 标签中的内容

swift 标记某个函数或者方法是异步的，你可以在它的声明中的参数列表后边加上 async 关键字

示例源码如下，请查看 pre > code 标签中的内容

uts 中定义异步方法是在方法最前面加上 async 关键字

示例源码如下，请查看 pre > code 标签中的内容

需要注意：使用 async 定义异步方法只有 iOS 13+ 版本才支持，低版本调用会报错

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了满足Swift上述语法，UTS使用特殊语法来支持，以上三种写法分别对应为：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 4.06+ 版本支持

swift 中有一些特有的属性、方法、类的修饰符如 open, fileprivate, internal, weak, optional 等，这些修饰符在 ts 中没有对应的替代者，但是在原生语法场景下又是必须的。 为了支持这些修饰符，我们提供了 UTSiOS.keyword("xxx") 的语法糖。你可以在符合 swift 语法要求的场景下，使用诸如 UTSiOS.keyword("private") 这样的语法来修饰对应的属性、方法、类等。 我们对具体的修饰符没有做特别的限制，swfit 中的合法修饰符都能通过这个语法糖来使用，但是请记住一个重要的前提：你所使用的修饰符，需要满足 swift 语法所要求的场景。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在Swift操作指针，需要用到&操作符隐式转换得到UnsafePointer类型，UTS中提供了UTSiOS.getPointer()来表示&符号。

示例源码如下，请查看 pre > code 标签中的内容

其中UTSiOS.getPointer(digest)编译后会变成&digest

参考 Hello UTS 项目中的 uts-alert 插件

~/uni_modules/uts-alert/utssdk/app-ios/index.uts

示例源码如下，请查看 pre > code 标签中的内容

参考Hello UTS项目中的 uts-toast 插件

~/uni_modules/uts-toast/utssdk/app-ios/index.uts

由于在uts插件环境，无法默认推断出类型，所以需要显示类型，以uni.request()为例：

示例源码如下，请查看 pre > code 标签中的内容

在 uts 插件中通过 export 导出给 js 用的 class, 创建出的 class 实例会被一直保存在内存中，如果不主动销毁，可能会造成 内存泄漏的问题。我们在 UTSiOS 类型上提供了 destroyInstance() 的静态方法来实现销毁原生对象的功能。开发者需要在使用这个对象的页面的 unmounted() 时机将对象销毁。

HBuilder X 4.25+ 版本支持

在 uts 插件中定义 class Test，并将其 export：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 uvue 页面 unmounted 时销毁对象：

示例源码如下，请查看 pre > code 标签中的内容

在 uts 插件或者组件中，如果自定义的 class 中定义了闭包类型的属性，而闭包内部又使用了 class 的其他属性或者 class 自身， 就会造成对象循序引用，导致内存泄漏。为避免产生循环引用我们需要在闭包内使用 "[weak self]" 标记。

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，自定义类 Test 中持有一个 callback 的闭包属性，而 callback 闭包实现中有引用了 this.name，这就导致了循环引用。 因此在 callback 闭包体的最开头部分使用了 "[weak self]" 标记，避免产生循环引用。

使用 "[weak self]" 标记以后，this 就变成了可为空的值，访问标记后的 this 的任何属性和方法都要使用可选链或者做非空断言。

判断是否需要加 "[weak self]" 标记的标准是：callback 是否被 this 持有，闭包内是否访问了 this，如果满足这两条就需要加。

在iOS 16.0及以上，Shortcuts需要集成Apple AppIntents.framework, 实现AppShortcutsProvider子类YourAppShortcutsProvider，App Intents 会在app编译阶段通过自动分析YourAppShortcutsProvider中的appShortcuts值，自动将其 “抽取成元数据（representation）并嵌入到 App 包里”，系统在运行时读取这份元数据来知道你的意图与快捷方式，而不是运行时去反射源代码，所以目前仅仅通过uts插件无法实现shortcuts功能，需要通过离线打包的形式（原生工程实现AppShortcutsProvider源码）+uts插件（hook声明周期）配合实现该功能

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请通过uts和swift混编的形式，或者使用uts实现下属app内捐赠NSUserActivity逻辑，就可以在该hook app生命周期代理方法中捕获自定义的shortcuts活动

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 目前写iOS uts 插件时部分语法提示会有缺失、参数类型不准确的问题，例如：

特别注意 如果在使用真机运行编译uts插件时报 swift 版本不兼容的错误，请先检查自己的 XCode 版本，确保安装XCode 版本应大于或者等于打包机的 XCode版本； 如果在使用真机运行编译uts插件时报 XCode 版本应大于 13.2.1的错误，这是说明本地安装的 XCode版本过低，请忽略 13.2.1这个版本限制，直接将本地 XCode升级到大于或者等于打包机的版本，后续我们会优化提示。

**Examples:**

Example 1 (unknown):
```unknown
objective-c
```

Example 2 (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

Example 3 (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

Example 4 (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

---

## 什么是datacom | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/datacom

**Contents:**
- # 什么是datacom
- # 什么是datacom组件规范
- # datacom对于开发者的好处
- # datacom组件规范
  - # 数据结构规范
  - # 数据绑定规范
  - # 组件属性规范
    - # 分步查询属性规范
    - # 弹出类属性规范
- # datacom的局限

datacom，全称是data components，数据驱动的组件。

这种组件也是vue组件，是一种子类，是基础组件的再封装。

相比于普通的vue组件，datacom组件的特点是，给它绑定一个data，data中包含一组候选数据，即可自动渲染出结果。

比如 uni-data-checkbox 组件，给它绑定一个data，即可直接生成一组选择框。

示例源码如下，请查看 pre > code 标签中的内容

而使用基础组件的写法，代码量则要增加很多，如下：

示例源码如下，请查看 pre > code 标签中的内容

显然，datacom组件不是只有一个<uni-data-checkbox>，radio、check、select、picker、segement、tree...还有很多组件都可以成为datacom组件，变成类似<uni-data-picker>。

那么“datacom组件规范”，就定义了什么是datacom组件，以及它们的互联互通标准。

所有开发者，都可以在 DCloud插件市场 提交符合datacom组件规范的组件。在插件市场组件分类下可以找到所有已上传的datacom组件，详见

datacom组件，对服务器数据规范、前端组件的数据输入和输出规范，做了定义。它提升了产业的标准化程度、细化了分工，提升了效率。

且不论产业影响，对开发者个人而言，显而易见的好处也很多：

举个例子，假使我们想实现一个城市选择的业务。

datacom组件接受的数据结构，包含了“数组”和“树”两种数据结构规范。

data数据是一组可循环的数据集合。数组中每条数据如下基本key：

如果熟悉html的<select>标签的话，其<option>标签的属性也是value、text、selected。

除了这些基本key，开发者也可以自由扩展key。比如电影票、机票、火车票的选座，都需要扩展额外的信息：行、列、单元格类型（座位或过道）等。

完整的 JSON Schema 定义详见：https://gitee.com/dcloud/datacom/blob/master/array.schema.json

示例源码如下，请查看 pre > code 标签中的内容

组件示例：uni-data-checkbox

示例源码如下，请查看 pre > code 标签中的内容

data数据是可遍历嵌套的数据集合。数组中每条数据如下基本key：

完整的 JSON Schema 定义详见：https://gitee.com/dcloud/datacom/blob/master/tree.schema.json

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

datacom组件 的data，可以来自页面本地，即localdata；也可以直接指定uniCloud的云数据库查询结果，即指定collection表名、field字段名、where条件，这些写法与unicloud-db组件的写法相同，如果localdata和collection同时存在，优先使用localdata。

localdata的示例上文已经举例，下面来看下直接指定uniCloud云数据库查询的写法。

示例源码如下，请查看 pre > code 标签中的内容

collection表名、field字段名、where条件的写法，详见clientDB组件文档

当然，支持绑定uniCloud数据，对于datacom组件规范来说，是可选的。

更为常见的场景，是在整个页面组件外围套一个clientDB组件，一次性查库，把查询结果的data分拆赋值给不同的datacom组件。

datacom组件规范还要求支持绑定 value，且支持双向绑定，即：支持v-model指令。这同时也是为了uni-forms的表单校验。

当datacom组件的data来自uniCloud的云数据库或cdn等云端，且数据量较大时，我们通常可以选择分步查询来优化用户体验，如以下场景：

datacom组件为分步查询云端数据，设计了以下组件属性、事件：

datacom组件为弹出类组件，设计了以下组件属性、事件：

选择类组件很多，基本逻辑都是在指定的数据范围内，选择其中的一个或多个。

这里列一下常见的选择类组件，以及它们按不同维度的分类，有助于更透彻的理解它们的本质

欢迎开发者们开发这些datacom组件。插件市场提供了datacom组件专区 ，给予更高的显示权重。

版本要求：HBuilderX 3.1.0+

开发一个支持localdata的datacom组件相对容易，但要开发支持云端数据的datacom组件，实现对collection、field、where等属性的解析，工作量还是不小的。

为此官方提供了一个mixin混入库，开发者在自己的datacom组件中混入uniCloud.mixinDatacom，即可方便的让自己的组件支持本地和云端的数据绑定，快速完成datacom组件。

mixin是vue的技术，不熟悉的可以点此了解vue官网的mixin文档

uniCloud.mixinDatacom 的props

与标准的datacom组件相同，除了localdata外，其他都是uniCloud-db组件的标准属性。

uniCloud.mixinDatacom 的data

uniCloud.mixinDatacom methods

使用 uniCloud.mixinDatacom 开发 datacom 组件需要以下步骤

使用 uniCloud.mixinDatacom 开发 datacom 组件的优势

例如要开发一个datacom组件，名为uni-data-jql：

示例源码如下，请查看 pre > code 标签中的内容

需要多写些代码处理各种状态。如果mixinDatacomEasyGet的封装无法灵活满足你的需求，可以使用这种方式。

示例源码如下，请查看 pre > code 标签中的内容

做好这个uni-data-jql组件后，就可以在页面中使用了：

示例源码如下，请查看 pre > code 标签中的内容

为方便开发者理解mixinDatacom的工作原理，这里贴出mixinDatacom的源码：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
data components
```

Example 2 (html):
```html
<template>
    <!-- 传入符合 datacom 规范的数据，即可渲染出一组 checkbox -->
    <!-- 使用 v-model 双向绑定 checkbox 的选中值 -->
    <uni-data-checkbox v-model="value" :localdata="options" multiple></uni-data-checkbox>
</template>
<script>
  export default {
    data() {
      return {
        value: ['sh'],
        options: [
          {value: 'bj',text: '北京'},
          {value: 'sh',text: '上海'},
          {value: 'gz',text: '广州'}
        ],
      };
    },
  };
</script>
```

Example 3 (html):
```html
<template>
    <!-- 传入符合 datacom 规范的数据，即可渲染出一组 checkbox -->
    <!-- 使用 v-model 双向绑定 checkbox 的选中值 -->
    <uni-data-checkbox v-model="value" :localdata="options" multiple></uni-data-checkbox>
</template>
<script>
  export default {
    data() {
      return {
        value: ['sh'],
        options: [
          {value: 'bj',text: '北京'},
          {value: 'sh',text: '上海'},
          {value: 'gz',text: '广州'}
        ],
      };
    },
  };
</script>
```

Example 4 (html):
```html
<template>
    <!-- 传入符合 datacom 规范的数据，即可渲染出一组 checkbox -->
    <!-- 使用 v-model 双向绑定 checkbox 的选中值 -->
    <uni-data-checkbox v-model="value" :localdata="options" multiple></uni-data-checkbox>
</template>
<script>
  export default {
    data() {
      return {
        value: ['sh'],
        options: [
          {value: 'bj',text: '北京'},
          {value: 'sh',text: '上海'},
          {value: 'gz',text: '广州'}
        ],
      };
    },
  };
</script>
```

---

## 介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-basics

**Contents:**
- # 介绍
- # vue的优势
- # 白话uni-app
  - # 文件类型变化
  - # 文件内代码架构的变化
  - # 外部文件引用方式变化
  - # 组件/标签的变化
  - # js的变化
- # 在 uni-app 中使用vue的差异
- # 模板语法

已经了解 Vue2，只想了解 Vue3 新功能可以参阅vue3新功能 ！

已经有 Vue2 项目，需要适配 Vue3 的可参阅vue2 项目迁移 vue3 ！

Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。

Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统，只关注视图层，易于上手。所有东西都是响应式的。

本文大部分内容来源于vue3中文文档官网 ，但结合 uni-app 做了部分调整，以更有利于开发者快速上手。感谢Vue团队！

在传统开发中，用原生的 JavaScript DOM 操作函数对 DOM 进行频繁操作的时候，浏览器要不停的渲染新的 DOM 树，导致页面看起来非常卡顿。

vue 是单页面应用，使页面局部刷新，不用每次跳转页面都要请求所有数据和 DOM ，这样大大加快了访问速度和提升用户体验。

如果你了解html、js，那么本章节将让你快速了解uni-app和它们的差异。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在hello uni-app的 common 目录有一个工具类 util.js ，可以在hello uni-app中搜索这个例子查看。hello uni-app示例代码可从 github 获取。

示例源码如下，请查看 pre > code 标签中的内容

而在这个 util.js 里，要把之前的 function 封装为模块（module）的方法并导出（exports）。只有被导出的方法和属性才能被外部调用，不导出的属于模块内部函数和变量。这是es6的模块规范。

示例源码如下，请查看 pre > code 标签中的内容

当然还有一些高级的用法，比如在导出时可以重命名

示例源码如下，请查看 pre > code 标签中的内容

css外部文件导入。全局样式，在根目录下的 app.vue 里写入，每个页面都会加载 app.vue 里的样式。

示例源码如下，请查看 pre > code 标签中的内容

另外，vue支持组件导入，可以更方便的封装一个包括界面、js、样式的库。详见

以前是html标签，比如 <div> ，现在是小程序组件，比如 <view> 。

那么标签和组件有什么区别，不都是用尖括号包围起来一段英文吗？

uni-app 参考小程序规范，提供了一批内置组件 。

示例源码如下，请查看 pre > code 标签中的内容

现在script里默认有export default，在里面写data、事件和method

示例源码如下，请查看 pre > code 标签中的内容

在上述例子中，传统写法的定义的变量globalvar和函数globalfun，可以在export default { }里使用，但无法在模板里直接绑定和调用。模板里只能绑定data里的变量、调用methods里的方法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app 在发布到H5时支持所有vue的语法；发布到App和小程序时，由于平台限制，无法实现全部vue语法，但 uni-app 仍是对vue语法支持度最高的跨端框架。

相比Web平台， Vue.js 在 uni-app 中使用差异主要集中在两个方面：

uni-app 项目支持 vue 3.0介绍，及升级指南

uni-app 项目对 vue 3.0 的支持版本情况如下：

Vue.js 使用了基于 HTML 的模板语法，允许开发者声明式地将 DOM 绑定至底层组件实例的数据。 所有 Vue.js 的模板都是合法的 HTML，所以能被遵循规范的浏览器和 HTML 解析器解析。

在底层的实现上，Vue 将模板编译成虚拟 DOM 渲染函数。结合响应性系统，Vue 能够智能地计算出最少需要重新渲染多少组件，并把 DOM 操作次数减到最少。

示例源码如下，请查看 pre > code 标签中的内容

里的内容将会被替代为对应数据对象上msg的值。无论何时，绑定的数据对象上msg发生了改变，插值处的内容都会更新。

迄今为止，在我们的模板中，我们一直都只绑定简单的 property 键值。但实际上，对于所有的数据绑定，Vue.js 都提供了完全的 JavaScript 表达式支持。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这些表达式会在所属 Vue 实例的数据作用域下作为 JavaScript 被解析。有个限制就是，每个绑定都只能包含单个表达式，所以下面的例子都不会生效。

示例源码如下，请查看 pre > code 标签中的内容

模板表达式都被放在沙盒中，只能访问全局变量的一个白名单：

你不应该在模板表达式中试图访问用户定义的全局变量。

动态地绑定一个或多个属性，v-bind缩写为‘ : ’，可以用于响应式地更新 HTML attribute：

示例源码如下，请查看 pre > code 标签中的内容

在这里 src 是参数，告知 v-bind 指令将该元素的 src attribute 与表达式 imgUrl 的值绑定。

如果 isButtonDisabled 的值是 null 或 undefined，则 disabled attribute 甚至不会被包含在渲染出来的 button 元素中。

v-on 指令，它用于监听 DOM 事件。v-on缩写为‘ @ ’，下文简称为 @事件

示例源码如下，请查看 pre > code 标签中的内容

只渲染元素和组件一次。随后的重新渲染，元素/组件及其所有的子节点将被视为静态内容并跳过。

和前端框架中的理解不同，客户端里要实现复用的逻辑，会标记模板节点的状态，添加了 v-once 能保证节点只渲染一次，但是并不一定能优化渲染性能，反而可能会拖慢客户端复用节点时的比对效率。

示例源码如下，请查看 pre > code 标签中的内容

跨端的富文本处理方案详见：https://ask.dcloud.net.cn/article/35772

示例源码如下，请查看 pre > code 标签中的内容

data 选项已标准化为只接受返回一个初始数据对象的函数（注意函数内返回的数据对象不要直接引用函数外的对象）；否则页面关闭时，数据不会自动销毁，再次打开该页面时，会显示上次数据。

示例源码如下，请查看 pre > code 标签中的内容

我们可以传给 :class (v-bind:class 的简写) 一个对象，实现动态地切换 class。

也可以在对象中传入更多字段来动态切换多个 class。此外，v-bind:class 指令也可以与普通的 class 共存。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当 isActive 或者 hasError 变化时，class 列表将相应地更新。例如，如果 hasError 的值为 true ，class 列表将变为 static active text-danger。

可以把一个数组传给 v-bind:class，以应用一个 class 列表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果你想根据条件切换列表中的 class，可以使用三元表达式：

示例源码如下，请查看 pre > code 标签中的内容

这样写将始终添加 errorClass，但是只有在 isActive 为 truthy 时才添加 activeClass。

在 JavaScript 中，truthy（真值）指的是在布尔值上下文中，转换后的值为真的值。所有值都是真值，除非它们被定义为 假值（即除 false、0、""、null、undefined 和 NaN 以外皆为真值）。

不过，当有多个条件 class 时这样写有些繁琐。所以在数组语法中也可以使用对象语法：

示例源码如下，请查看 pre > code 标签中的内容

注意：以:style=""这样的方式设置px像素值，其值为实际像素，不会被编译器转换。

此外还可以用计算属性 computed 方法生成 class 或者 style 字符串，插入到页面中，举例说明：

示例源码如下，请查看 pre > code 标签中的内容

:style 的对象语法十分直观——看着非常像 CSS，但其实是一个 JavaScript 对象。CSS property 名可以用驼峰式 (camelCase) 或短横线分隔 (kebab-case，记得用引号括起来) 来命名：

示例源码如下，请查看 pre > code 标签中的内容

直接绑定到一个样式对象通常更好，这会让模板更清晰：

示例源码如下，请查看 pre > code 标签中的内容

同样的，对象语法常常结合返回对象的计算属性使用。

:style 的数组语法可以将多个样式对象应用到同一个元素上：

示例源码如下，请查看 pre > code 标签中的内容

在 :style 中使用需要 (浏览器引擎前缀) vendor prefixesa 的 CSS property 时，如 transform，Vue 将自动侦测并添加相应的前缀。

可以为 style 绑定中的 property 提供一个包含多个值的数组，常用于提供多个带前缀的值，例如：

示例源码如下，请查看 pre > code 标签中的内容

这样写只会渲染数组中最后一个被浏览器支持的值。在本例中，如果浏览器支持不带浏览器前缀的 flexbox，那么就只会渲染 display: flex。

v-if 指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回 truthy 值的时候被渲染。 使用 v-else 指令来表示 v-if 的“else 块”。 v-else 元素必须紧跟在带 v-if 或者 v-else-if 的元素的后面，否则它将不会被识别。

在 JavaScript 中，truthy（真值）指的是在布尔值上下文中，转换后的值为真的值。所有值都是真值，除非它们被定义为 假值（即除 false、0、""、null、undefined 和 NaN 以外皆为真值）。

示例源码如下，请查看 pre > code 标签中的内容

v-else-if，顾名思义，充当 v-if 的“else-if 块”，可以连续使用：

示例源码如下，请查看 pre > code 标签中的内容

类似于 v-else ，v-else-if 也必须紧跟在带 v-if 或者 v-else-if 的元素之后。

因为 v-if 是一个指令，所以必须将它添加到一个元素上。但是如果想切换多个元素呢？

此时可以把一个 template 元素当做不可见的包裹元素，并在上面使用 v-if。最终的渲染结果将不包含 template 元素。

示例源码如下，请查看 pre > code 标签中的内容

另一个用于根据条件展示元素的选项是 v-show 指令。用法大致一样：

示例源码如下，请查看 pre > code 标签中的内容

不同的是带有 v-show 的元素始终会被渲染并保留在 DOM 中。v-show 只是简单地切换元素的 CSS 属性的 display 。

注意，v-show 不支持 template 元素，也不支持 v-else。nvue 页面不支持 v-show。

v-if 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。

v-if 也是惰性的：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。

相比之下，v-show 就简单得多——不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换，来控制元素的显示和隐藏。

v-for 指令可以实现基于一个数组来渲染一个列表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你也可以用 v-for 来遍历一个对象的 property。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在遍历对象时，会按 Object.keys() 的结果遍历，但是不能保证它在不同 JavaScript 引擎下的结果都一致。

类似于 v-if，你也可以利用带有 v-for 的 template 来循环渲染一段包含多个元素的内容。比如：

示例源码如下，请查看 pre > code 标签中的内容

当 Vue 正在更新使用 v-for 渲染的元素列表时，它默认使用“就地更新”的策略。如果数据项的顺序被改变，Vue 将不会移动 DOM 元素来匹配数据项的顺序，而是就地更新每个元素，并且确保它们在每个索引位置正确渲染。

这个默认的模式是高效的，但是只适用于不依赖子组件状态或临时 DOM 状态 (例如：表单输入值) 的列表渲染输出。

为了给 Vue 一个提示，以便它能跟踪每个节点的身份，从而重用和重新排序现有元素，你需要为每项提供一个唯一 key attribute：

示例源码如下，请查看 pre > code 标签中的内容

建议尽可能在使用 v-for 时提供 key attribute，除非遍历输出的 DOM 内容非常简单，或者是刻意依赖默认行为以获取性能上的提升。

不要使用对象或数组之类的非基本类型值作为 v-for 的 key。请用字符串或数值类型的值。

如不提供 :key，会报一个 warning， 如果明确知道该列表是静态，或者不必关注其顺序，可以选择忽略。

示例源码如下，请查看 pre > code 标签中的内容

在Vue3中，key 则应该被设置在 <template> 标签上

示例源码如下，请查看 pre > code 标签中的内容

类似地，当使用 <template v-for> 时存在使用 v-if 的子节点，key 应改为设置在 <template> 标签上。

示例源码如下，请查看 pre > code 标签中的内容

在自定义组件上，你可以像在任何普通元素上一样使用 v-for 。

示例源码如下，请查看 pre > code 标签中的内容

当在组件上使用 v-for 时，key是必须的。

不推荐在同一元素上使用 v-if 和 v-for

当它们处于同一节点，v-if 的优先级比 v-for 更高，这意味着 v-if 将没有权限访问 v-for 里的变量：

示例源码如下，请查看 pre > code 标签中的内容

可以把 v-for 移动到 template 标签中来修正：

示例源码如下，请查看 pre > code 标签中的内容

我们可以使用 v-on 指令 (通常缩写为 @ 符号，下文简称为：@事件) 来监听 DOM 事件，并在触发事件时执行一些 JavaScript。

用法为 v-on:click="methodName" 或使用快捷方式 @click="methodName" （uni-app里一般都使用@缩写方式）

指令的值，字符串里直接写js。比如下面的counter += 1就是一段js。

示例源码如下，请查看 pre > code 标签中的内容

然而许多事件处理逻辑会更为复杂，所以直接把 JavaScript 代码写在组件属性值里是不可行的。因此@事件还可以接收一个需要调用的方法名称。

示例源码如下，请查看 pre > code 标签中的内容

除了直接绑定到一个方法，也可以在内联 JavaScript 语句中调用方法：

示例源码如下，请查看 pre > code 标签中的内容

有时也需要在内联语句处理器中访问原始的 DOM 事件。可以用特殊变量 $event 把它传入方法：

示例源码如下，请查看 pre > code 标签中的内容

事件处理程序中可以有多个方法，这些方法由逗号运算符分隔：

示例源码如下，请查看 pre > code 标签中的内容

修饰符 (modifier) 是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。例如，.prevent 修饰符告诉 @事件对于触发的事件调用 event.preventDefault()：

示例源码如下，请查看 pre > code 标签中的内容

使用修饰符时，顺序很重要；相应的代码会以同样的顺序产生。因此，用 @click.prevent.self 会阻止所有的点击，而 @click.self.prevent 只会阻止对元素自身的点击。

示例源码如下，请查看 pre > code 标签中的内容

扫一眼 template 模板便能轻松定位在 JavaScript 代码里对应的方法。

因为你无须在 JavaScript 里手动绑定事件，你的 ViewModel 代码可以是非常纯粹的逻辑，和 DOM 完全解耦，更易于测试。

当一个 ViewModel 被销毁时，所有的事件处理器都会自动被删除。你无须担心如何清理它们。

示例源码如下，请查看 pre > code 标签中的内容

你可以用 v-model 指令在表单 input、textarea 及 select 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 v-model 本质上不过是语法糖。它负责监听用户的输入事件以更新数据，并对一些极端场景进行一些特殊处理。

v-model 会忽略所有表单元素的 value、checked、selected attribute 的初始值而总是将 Vue 实例的数据作为数据来源。你应该通过 JavaScript 在组件的 data 选项中声明初始值。

在下面的示例中，输入框通过v-model绑定了message，用户在输入框里输入内容时，这个内容会实时赋值给message。当然在代码里为message赋值也会实时同步到界面上input里。这就是双向绑定。

示例源码如下，请查看 pre > code 标签中的内容

建议开发过程中直接使用 uni-app：表单组件 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

每一个计算属性都包含一个 getter 函数和一个 setter函数 ，默认是利用 getter 函数来读取。所有 getter 和 setter 函数的 this 上下文自动地绑定为 Vue 实例。

模板内的表达式非常便利，但是设计它们的初衷是用于简单运算的。在模板中放入太多的逻辑会让模板过重且难以维护。例如，有一个嵌套数组对象：

示例源码如下，请查看 pre > code 标签中的内容

我们想根据 author 是否已经有一些书来显示不同的消息，可以使用模板内的表达式

示例源码如下，请查看 pre > code 标签中的内容

此时，模板不再是简单的和声明性的。你必须先看一下它，然后才能意识到它执行的计算取决于 author.books。如果要在模板中多次包含此计算，则问题会变得更糟。

所以，对于任何包含响应式数据的复杂逻辑，你都应该使用计算属性。

示例源码如下，请查看 pre > code 标签中的内容

这里声明了一个计算属性 publishedBooksMessage。

尝试更改应用程序 data 中 books 数组的值，你将看到 publishedBooksMessage 如何相应地更改。

你可以像普通属性一样将数据绑定到模板中的计算属性。Vue 知道 publishedBookMessage 依赖于 author.books，因此当 author.books 发生改变时，所有依赖 publishedBookMessage 绑定也会更新。而且最妙的是我们已经声明的方式创建了这个依赖关系：计算属性的 getter 函数没有副作用，这使得更易于测试和理解。

计算属性还可以依赖多个 Vue 实例的数据，只要其中任一数据变化，计算属性就会重新执行，视图也会更新。

计算属性默认只有 getter，不过在需要时你也可以提供一个 setter， 当手动修改计算属性的值时，就会触发 setter 函数，执行一些自定义的操作。

示例源码如下，请查看 pre > code 标签中的内容

现在再运行 fullName = 'John Doe' 时，setter 会被调用，firstName 和 lastName 也会相应地被更新。

我们可以通过在表达式中调用方法来达到同样的效果：

示例源码如下，请查看 pre > code 标签中的内容

我们可以将同一函数定义为一个方法而不是一个计算属性。两种方式的最终结果确实是完全相同的。然而，不同的是计算属性是基于它们的反应依赖关系缓存的。

计算属性只在相关响应式依赖发生改变时它们才会重新求值。这就意味着只要 author.books 还没有发生改变，多次访问 publishedBookMessage 计算属性会立即返回之前的计算结果，而不必再次执行函数。

这也同样意味着下面的计算属性将不再更新，因为 Date.now () 不是响应式依赖：

示例源码如下，请查看 pre > code 标签中的内容

相比之下，每当触发重新渲染时，调用方法将总会再次执行函数。

假设我们有一个性能开销比较大的计算属性 list，它需要遍历一个巨大的数组并做大量的计算。然后我们可能有其他的计算属性依赖于 list。如果没有缓存，我们将不可避免的多次执行 list 的 getter！如果你不希望有缓存，请用 method 来替代。

虽然计算属性在大多数情况下更合适，但有时也需要一个自定义的侦听器。这就是为什么 Vue 通过 watch 选项提供了一个更通用的方法，来响应数据的变化。当需要在数据变化时执行异步或开销较大的操作时，这个方式是最有用的。

当你有一些数据需要随着其它数据变动而变动时，就可以使用Watch来监听他们之间的变化。

一个对象，键是需要观察的表达式，值是对应回调函数。值也可以是方法名，或者包含选项的对象。 Vue 实例将会在实例化时调用 $watch() ，遍历 watch 对象的每一个 property 。

示例源码如下，请查看 pre > code 标签中的内容

以上示例有个问题，就是页面刚加载时，因为没有变化，所以不会执行。下面用immediate来解决。

在选项参数中指定 immediate: true 将立即以表达式的当前值触发回调：

watch方法默认就是handler，而当immediate:true时，就会先执行handler方法。

示例源码如下，请查看 pre > code 标签中的内容

为了发现对象内部值的变化，可以在选项参数中指定 deep: true 。深度监听一个对象整体的变化（即监听对象所有属性值的变化），注意监听数组的变更不需要这么做。

示例源码如下，请查看 pre > code 标签中的内容

如果不想监听 obj 中其他值，只想监听 obj.a 的值的变化，可以写成字符串形式监听。

示例源码如下，请查看 pre > code 标签中的内容

Vue 提供了一种更通用的方式来观察和响应 Vue 实例上的数据变动：侦听属性。当你有一些数据需要随着其它数据变动而变动时，你很容易滥用 watch 。然而，通常更好的做法是使用计算属性而不是命令式的 watch 回调。

示例源码如下，请查看 pre > code 标签中的内容

上面代码是命令式且重复的。将它与计算属性的版本进行比较：

示例源码如下，请查看 pre > code 标签中的内容

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

## uni-app选型评估23问 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/select.html

**Contents:**
    - # uni-app选型评估23问
      - 本页导读

uni-app是当今主流的开发框架，DCloud有900万开发者，uni统计手机端月活10亿，华为、阿里、腾讯、抖音、美团、京东、快手、vivo都在用，案例参考uni-app 应用案例

uni-app 是免费并且属于Apache2.0开源协议的产品。DCloud官方承诺无论HBuilderX、uni-app，面向全球程序员永久免费。大家可以放心使用。

DCloud的盈利方式在帮助开发者进行流量变现（uni-ad）和提供有价值的云服务（uniCloud）上，而不在开发工具收费上。

uni-app在跨平台的过程中，不牺牲平台特色，不限制平台的能力使用。

应用开发中，90%的常规开发，比如界面组件、联网等api，uni-app封装为可跨多端的API。

而各个端的特色功能，uni-app引入条件编译 。可以优雅的在一个项目里调用不同平台的特色能力。比如push，微信小程序里不支持，但可以在App里使用，还有很多原生sdk，在App时难免涉及，这些都可以正常的在uni-app框架下使用。

下图是uni-app产品功能框架图，uni-app在保持uni规范跨平台的前提下，还可实现每个平台特有的平台能力(如微信小程序平台，可继续调用微信卡劵等微信特有业务API)。

在做小程序时，小程序所有的api都可以使用；而输出到App时，原生渲染引擎、原生sdk集成和混写都支持，使得原生的所有api都可以使用。

同时注意，条件编译不同于代码里if逻辑判断。条件编译块里的代码或指定的文件，只有在特定平台才会被编译进去，不会把不能用的其他平台代码混在一个包里。如果大量使用if判断，会增大体积和影响性能，而条件编译则没有这些问题，减少包体积，减少互相的干扰。

使用uni-app开发的微信小程序，因为智能的处理的数据的diff，比大多人手写的原生小程序的性能还好。详细数据评测参考：https://juejin.im/post/5ca1736af265da30ae314248

uni-app打包成App后，支持webview渲染和weex原生渲染这2种引擎，可以任由开发者切换使用。

由于有丰富的插件市场，以及支持所有小程序SDK在App端的使用，使得uni-app拥有更庞大的应用生态。

是的，单独开发小程序，也应该使用uni-app。它比其他小程序框架或原生小程序开发更有优势。原因如下：

uni-app是更好的跨平台开发框架，开发一次iOS、Android都有了。体验好、开发效率高。

uni-app在App端，基于能力层/渲染层分离的架构设计（见下图），渲染层是webview和weex二选一，能力调用都是共同的plus api，比如蓝牙、扫码等能力；也就是weex被内置到uni-app中，并且被强化了。

过去weex有个很大的问题是api太少，开发时必须iOS、Android原生和前端3拨团队协作开发，实际上react native也如此，因为他们的核心只是高性能渲染器。

uni-app提供了大量的扩展api解决了这个问题，并且发展了成熟多样的插件生态，大多数App的开发不再需要原生介入了，从而把跨平台开发省成本这个核心目的落地了。

uni-app在App侧可以使用丰富的小程序sdk，如网易云信、环信、七牛等众多sdk厂商均原厂维护其小程序sdk版本，而这些sdk均可直接用于uni-app并发布为iOS、Android的App。

uni-app的插件市场里有非常多的ui库、组件、模板，可以大幅提升开发效率。

相比纯原生开发，uni-app体验可商用，也不会限制功能调用，但开发效率和开发成本更优于原生开发。

如果你已经有了原生App，那么可以局部使用uni-app，内嵌uni小程序SDK，把部分栏目小程序化，或者直接打造自己的小程序平台。

uni-app是多端写在一个项目统一升级维护，还是每个端不同的项目，只复用部分代码

uni-app是多端写在一个基础项目下，差异使用条件编译来管理。

这有个巨大的好处是一套工程代码，升级时可多端同时更新。

如果把不同端的项目分开，那么维护升级时非常麻烦，无法方便同步升级。

uni-app 学习成本高吗？基于什么技术栈？

uni-app简单来说是 vue的语法 + 小程序的api。

它遵循Vue.js语法规范，组件和API遵循微信小程序命名，这些都属于通用技术栈，学习它们是前端必备技能，uni-app没有太多额外学习成本。

有一定 Vue.js 和微信小程序开发经验的开发者可快速上手 uni-app 。

没学过vue的同学，也不用掌握vue的全部，只需了解vue基础语法、虚拟dom、数据绑定、组件、vuex，其他如路由、loader 不用学，cli、node.js、webpack也不需要学。

官方有入门培训视频，且还有众多培训渠道加入uni-app生态，可参考培训教程资源汇总 。

uni-app 开发体验如何？支持现代前端开发流程吗？

uni-app 积极拥抱社区现有的现代开发流程，包括但不限于：

uni-app 生态开放性如何？能否直接利用现有前端社区资源？

uni-app 支持的手机版本最低到多少？

uni-app在2018年夏天推出，目前版本成熟，生态资源丰富，是当今主流的开发框架，案例众多，手机端引擎月活已经突破10亿！

加入uni-app的群就知道，几十个QQ/微信群每天数万条聊天记录，非常活跃。论坛里每天数百个帖子。

插件市场内容也非常丰富，各种轮子方便可用。https://ext.dcloud.net.cn/ ，并且很多轮子的uni-app版，性能功能都强于微信小程序版。

基于uni-app的三方培训也很多。腾讯课堂官方亲自为uni-app制作了课程，各大培训网站均有uni-app的培训课程。

DCloud从2013年开始做HBuilder，目前900万前端开发者在使用DCloud的开发工具，HBuilder百度指数超过sublime、webstorm等全球知名工具。是中国唯一一家成功的开发工具厂商。

DCloud是明星创业公司，融资已经过了C轮，且均为知名VC或战略投资人。

DCloud是HTML5中国产业联盟的发起单位和秘书单位。该联盟隶属于工信部信通院标准所。

DCloud产品中使用的HTML5Plus规范，为联盟的标准规范而非私有api。

DCloud的产品技术一直引领业内，2015年就上线业内第一个"小程序"：DCloud流应用。随后DCloud广泛推动业内各大公司上线"小程序"，普及该技术广泛应用。

阿里小程序IDE官方内嵌uni-app、腾讯课堂官方录制uni-app培训视频、华为腾讯阿里抖音京东等众多一线公司使用uni-app，uni-app没有让他们失望，也不会让你失望。

App打包必须上传DCloud云端吗？代码会泄露吗？

DCloud是一家正规公司，已通过等保三级认证（证书编号：11010813802-20001），珍惜自己的名誉。之所以提供云打包，是方便不熟悉原生的前端工程师直接生成App安装包。包括让没有mac电脑的工程师也可以打出iOS的包。

DCloud提供哪些技术支持？碰到框架bug影响业务怎么办？

uni-app 是DCloud全力打造的重点产品，不是非专业公司的KPI项目。不会因为某些负责人的流动导致框架烂尾。 uni-app 的github上的dev分支是频繁更新的，可随时修复bug。并且作为开源产品，开发者也可以修改源码。 uni-app 的app引擎，支持原生扩展，只要你会原生扩展，就不怕app引擎有限制，大不了自己补一个原生插件进去。 uni-app 开发小程序，无需依赖微信等平台升级。它们升级后，uni-app是可以直接使用的，不需要等待uni-app升级才能使用微信的新功能。

开发者碰到问题，可以通过如下途径进行反馈交流：

另外，如果您确实需要商业化的保障才安心，也可以申请付费技术支持。参考

大型互联网公司发布的开源框架，是不是更有影响力？

大型互联网公司在自用某个项目时，解决了某个问题，把它剥离出来开源，这个是众多大公司开源项目的来源和初衷。

而之所以把内部自用的框架开源出来，基本是为了在技术圈塑造形象和威望。对团队而言，有助于招聘；对负责人个人而言，有助于晋升和提升名气。

这类开源项目被戏称为KPI项目，往往逃不开4个魔咒：

而DCloud这家公司就是为开发者而生的，优秀的人才和资源全部是为开发者服务的，产品立项之初广泛调研不同开发者的需求，产品发布后持续迭代，让开发者们使用的更便利。

---

## 什么是符号表 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/app-ios-dsym.html

**Contents:**
    - # 什么是符号表
    - # 什么是dsym文件
    - # dsym文件的用途
    - # HBuilderX中云端打包配置生成符号表文件
    - # 注意事项
      - 本页导读

符号表是内存地址与源码文件名、函数名称、行号的映射表。符号表通常包括以下信息：

示例源码如下，请查看 pre > code 标签中的内容

应用正式发布后二进制代码中不再包含源码信息，应用发生异常（Crash）时可以捕获异常发生时的堆栈信息，但这些信息使用内存地址表示，这时候可以通过符号表进行解析还原成源码堆栈信息，从而方便开发者定位并解决异常问题。

iOS平台中，dSYM文件是指具有调试信息的目标文件，存储着源码文件名、函数名、行号等信息，与可执行文件中的函数内存地址一一对应。 XCode中发布生成xcarchive文件默认包含dysm文件，通常为：xxxx.app.dSYM，其中xxxx为应用程序的包名，如下所示：

当应用发布上线后，无法在XCode中直观看到应用崩溃的错误，这时需要分析 crash report 文件，iOS设备中会有日志文件保存每个应用崩溃时的函数内存地址，通过 XCode 的 Organizer 可以将 iOS 设备中的 DeviceLog 导出成 crash 文件，这时就可以通过函数内存地址在 dsym 文件中查找到对应的函数名称和源码文件名。

多数统计平台都会捕获应用崩溃错误时的函数内存地址并提交到统计服务器，为了更好的分析崩溃日志，也需要 dysm 文件来查找到崩溃的函数名称和源码文件名称。 因此统计平台也需要开发者上传 dsym 文件。

HBuilderX3.5.0+版本生成iOS符号表 dsym 文件配置项调整到原生App-云打包窗口

在HBuilderX中菜单项 “发行” -> “原生App-云打包” 界面勾选“生成iOS符号表（dsym）文件”：

HBuilderX 从 3.2.23 至 3.4.18 版本 在项目的 manifest.json 可视化界面中配置生成iOS符号表 dsym 文件

在HBuilderX中打开项目的manifest.json文件，在“App常用其它设置”界面中的勾选“生成iOS符号表（dsym）文件”：

云端打包成功后会在HBuilderX控制台输出 dsym 文件下载地址：

**Examples:**

Example 1 (typescript):
```typescript
<内存起始地址><内存结束地址><源码函数名称>[<源码文件名称:源码行号>]
```

Example 2 (typescript):
```typescript
<内存起始地址><内存结束地址><源码函数名称>[<源码文件名称:源码行号>]
```

Example 3 (typescript):
```typescript
<内存起始地址><内存结束地址><源码函数名称>[<源码文件名称:源码行号>]
```

Example 4 (typescript):
```typescript
<内存起始地址><内存结束地址><源码函数名称>[<源码文件名称:源码行号>]
```

---

## nvue介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-outline.html

**Contents:**
- # nvue介绍
- # 适用场景
- # 纯原生渲染模式
- # 编译模式
- # 快速上手
  - # 1.新建 nvue 页面
  - # 2.开发 nvue 页面
  - # 3.调试 nvue 页面
- # render-whole
- # nvue开发与vue开发的常见区别

uni-app App 端内置了一个基于 weex 改进的原生渲染引擎，提供了原生渲染能力。

在 App 端，如果使用 vue 页面，则使用 webview 渲染；如果使用 nvue 页面(native vue 的缩写)，则使用原生渲染。一个 App 中可以同时使用两种页面，比如首页使用 nvue，二级页使用 vue 页面，hello uni-app 示例就是如此。

虽然 nvue 也可以多端编译，输出 H5 和小程序，但 nvue 的 css 写法受限，所以如果你不开发 App，那么不需要使用 nvue。

以往的 weex ，有个很大的问题是它只是一个高性能的渲染器，没有足够的 API 能力（比如各种 push sdk 集成、蓝牙等能力调用），使得开发时非常依赖原生工程师协作，开发者本来想节约成本，结果需要前端、iOS、Android 3 拨人开发，适得其反。 nvue 解决了这个问题，让前端工程师可以直接开发完整 App，并提供丰富的插件生态和云打包。这些组合方案，帮助开发者切实的提高效率、降低成本。

同时uni-app扩展了 weex 原生渲染引擎的很多排版能力，修复了很多 bug。比如

nvue 的组件和 API 写法与 vue 页面一致，其内置组件还比 vue 页面内置组件增加了更多，详见 。

如果你熟悉 weex 或 react native 开发，那么 nvue 是你的更优选择，能切实提升你的开发效率，降低成本。

如果你是 web 前端，不熟悉原生排版，那么建议你仍然以使用 vue 页面为主，在 App 端某些 vue 页面表现不佳的场景下使用 nvue 作为强化补充。这些场景如下：

但注意，在某些场景下，nvue 不如 vue 页面，如下：

uni-app 在 App 端，支持 vue 页面和 nvue 页面混搭、互相跳转。也支持纯 nvue 原生渲染。

启用纯原生渲染模式，可以减少 App 端的包体积、减少使用时的内存占用。因为 webview 渲染模式的相关模块将被移除。

在 manifest.json 源码视图的"app-plus"下配置"renderer":"native"，即代表 App 端启用纯原生渲染模式。此时 pages.json 注册的 vue 页面将被忽略，vue 组件也将被原生渲染引擎来渲染。

如果不指定该值，默认是不启动纯原生渲染的。

示例源码如下，请查看 pre > code 标签中的内容

weex 编译模式和 uni-app 编译模式

如你之前是 weex 开发者，可以继续查阅本章节，否则可以跳过看下一节快速上手。

weex 的组件和 JS API，与 uni-app 不同。uni-app 与微信小程序相同。

考虑到 weex 用户的迁移，uni-app 也支持 weex 的代码写法。在 manifest.json 中可以配置使用weex 编译模式或uni-app 编译模式。选择 weex 编译模式时将不支持 uni-app 的组件和 jsapi，需要开发者参考 weex 官方文档的写法来写代码。 比如 weex 编译模式用<div>。uni-app 编译模式则使用<view>。

一般情况建议使用uni-app模式，除非历史 weex 代码较多，需要逐步过渡。同时注意 weex 编译模式的切换是项目级的，不支持同项目下某个 nvue 页面使用 weex 模式，另一个 nvue 页面使用 uni-app 模式。

在 manifest.json 中修改 2 种编译模式，manifest.json -> app-plus -> nvueCompiler 切换编译模式。

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json 配置文件中，HBuilderX2.4 之前版本，默认值为 weex 模式，HBuilderX2.4+版本默认值改为 uni-app 模式。

weex 编译模式不支持 onNavigationBarButtonTap 生命周期函数的写法。在 nvue 中监听原生标题栏按钮点击事件，详见：uni.onNavigationBarButtonTap 。

weex 编译模式不支持 onShow 生命周期，但熟悉 5+的话，可利用监听 webview 的addEventListener show 事件实现 onShow 效果。

nvue 的页面跳转，与 weex 不同，仍然遵循 uni-app 的路由模型。vue 页面和 nvue 页面之间不管怎么跳转，都遵循这个模型。包括 nvue 页面跳向 nvue 页面。每个页面都需要在 pages.json 中注册，调用 uni-app 的 路由 API 进行跳转。

原生开发没有页面滚动的概念，页面内容高过屏幕高度时，内容并不会自动滚动；只有将页面内容放在list、waterfall、scroll-view/scroller这几个组件下内容才可滚动。这不符合前端开发的习惯，所以在 nvue 编译为 uni-app模式时，uni-app框架会给 nvue 页面外层自动嵌套一个 scroller，从而实现页面内容的自动滚动。

示例源码如下，请查看 pre > code 标签中的内容

weex 编译模式下支持使用 weex ui ，例子详见 。但相比 uni-app 插件市场及官方uni ui 而言，weex 语法的组件生态还是比较欠缺的。

HBuilderX 3.1.0+ 开始支持新的样式编译模式

示例源码如下，请查看 pre > code 标签中的内容

在 HBuilderX 的 uni-app 项目中，新建页面，弹出界面右上角可以选择是建立vue页面还是nvue页面，或者 2 个同时建。

不管是 vue 页面还是 nvue 页面，都需要在pages.json中注册。如果在 HBuilderX 中新建页面是会自动注册的，如果使用其他编辑器，则需要自行在 pages.json 里注册。

如果一个页面路由下同时有 vue 页面和 nvue 页面，即出现同名的 vue 和 nvue 文件。那么在 App 端，会仅使用 nvue 页面，同名的 vue 文件将不会被编译到 App 端。而在非 App 端，会优先使用 vue 页面。

如果不同名，只有 nvue 页面，则在非 app 端，只有 uni-app 编译模式的 nvue 文件才会编译。

nvue 页面结构同 vue, 由 template、style、script 构成。

HBuilderX 内置了 weex 调试工具的强化版，包括审查界面元素、看 log、debug 打断点，详见

在 HBuilder X 3.1.0 起版本，nvue 新增 render-whole属性，类型Boolean。

默认启用render-whole为true的组件列表

示例源码如下，请查看 pre > code 标签中的内容

此演示在 Android 5.1 版本手机上的效果，高版本手机效果没有这么明显

基于原生引擎的渲染，虽然还是前端技术栈，但和web开发肯定是有区别的。

iOS 平台默认情况下滚动容器组件（如list、waterfall组件）内容不足时，由于没有撑满容器的可视区域会导致无法上下滚动，此时无法操作下拉刷新功能，无法触发refresh组件的@refresh、@pullingdown事件。 此时可在容器组件中配置alwaysScrollableVertical属性值为true来设置支持上下滚动，支持下拉刷新操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
recycle-list
```

Example 2 (unknown):
```unknown
scroll-view
```

Example 3 (unknown):
```unknown
scroll-view
```

Example 4 (unknown):
```unknown
swiper-list
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-for-android.html

**Contents:**
- # uts for Android
- # 1 了解UTS插件是什么
- # 2 掌握UTS语法
  - # 2.1 对于掌握kotlin语言者
  - # 2.2 对于仅掌握java语言者
  - # 2.3 数据类型差异
    - # 举例一： Int 和Number
    - # 举例二：MutableList
    - # 举例三：String[]
  - # 2.4 线程环境差异

本文旨在帮助Android开发者快速上手UTS。

需要阅读者具备Android原生应用开发经验。

HBuilder X 4.81 统一升级为 Kotlin 2.2.0 版本 注意事项

UTS插件是uni-app新型插件形式，拥有跨平台，高效率，易调试等优点。详情

对于Android开发者来说，我们需要了解的是：

因为UTS语法与kotlin很类似，建议快速阅读后，在实践中掌握这UTS语法。uts语法介绍。

与js相比，uts的语法和java更加类似。但是依然存在较大的差异，需要详细阅读2.3语法部分。

尽管开发UTS插件，并不要求一定掌握kotlin，但是鉴于UTS目前在android平台上，会编译为kotlin源码。学会kotlin语言，方便排查问题和复杂功能实现。

kotlin https://kotlinlang.org/

kotlin for android https://developer.android.com/kotlin

虽然 UTS 和 koltin 在数据类型上基本保持了一致，但是在部分场景下，还是会有差异，在此特别说明

数据类型以UTS 内置的类型为准， 各原生平台都会对其自动适配。

但是 UTS本身是跨平台语言，当具体平台的api 有明确要求时，需要以对方明确要求的数据类型为准。

默认情况下UTS 开发者可以使用 Number 覆盖android 平台上使用 Int的场景。

但是当开发者重写 Service 组件onStartCommand 方法时，Android API要求 明确要求后两个参数 必须为Int

示例源码如下，请查看 pre > code 标签中的内容

标准的TS环境中，只有Number类型而没有Int类型

为了适应这种情况，UTS 允许开发者使用原生平台的数据类型Int，来满足原生API对数据类型的要求：

示例源码如下，请查看 pre > code 标签中的内容

MutableList是android平台 特有的数据类型，一般场景下，可以使用UTS中内置类型 Array 替代

但是在 调用onAppActivityRequestPermissionsResult 函数监听权限申请结果时，明确要求使用此类型的参数

示例源码如下，请查看 pre > code 标签中的内容

标准的TS环境中，没有MutableList类型，与之相近的数据类型是 Array

为了适应这种情况，UTS 允许开发者使用原生平台的数据类型MutableList，来满足原生平台API对数据类型的要求：

示例源码如下，请查看 pre > code 标签中的内容

部分三方sdk 使用java开发，要求继承/实现的方法参数为 string[]类型，这种情况比较特殊，需要将kotlin.Array先进行别名声明，再继续使用

示例源码如下，请查看 pre > code 标签中的内容

UTS语言本身没有线程的概念。 但在具体的运行平台上会有线程环境差异：

uni-app 平台：默认代码执行在 WeexJSBridgeThread

uni-app x 平台：默认代码执行在 main线程

Android系统对线程操作存在较多的限制， UTS内置了UTSAndroid.getDispatcher方法 用来屏蔽大多数底层细节，一般来说开发者只需要关心两种特殊情况：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对于Android项目来说，除了源码之外，还会涉及依赖，资源，配置等常见问题

本章节将会介绍，UTS插件开发环境中如何配置这些属性

以hello UTS中的native-page插件中的配置文件为例:

文件位置： ~\uni_modules\uts-nativepage\utssdk\app-android\AndroidManifest.xml

AndroidManifest.xml示例：

示例源码如下，请查看 pre > code 标签中的内容

UTS插件中的 AndroidManifest.xml 与 android 中的 AndroidManifest.xml 规则完全一致。

每一个UTS插件对应android项目中的一个 lib module.

与你在android studio中手动输入包名不同的是，如果你没有手动包名，HX会按照下面的规则默认生成一个：

示例源码如下，请查看 pre > code 标签中的内容

~\uni_modules\uts-nativepage\utssdk\app-android\res

除了这里列出的layout、values目录外，还支持anim等所有android标准资源目录

需要注意的是：如果res资源中使用了 android appcompat库内置的资源，需要在config.json中添加下面的配置：

示例源码如下，请查看 pre > code 标签中的内容

以hello UTS中的uts-advance插件为例。

示例源码如下，请查看 pre > code 标签中的内容

~\uni_modules\uts-advance\utssdk\app-android\assets

远端插件可以通过配置 config.json添加依赖 ，下面是一个config.json示例

示例源码如下，请查看 pre > code 标签中的内容

截止 HBuilder X 4.23 版本内置了以下依赖

开发者在使用列表中的依赖时，需要注意两点：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

关于 config.json 的更多写法，可以参考文档

参考 hello uts 将jar/aar 添加到 utssdk/app-android/libs 目录下即可使用

HBuilderX 4.26版本之前, 推荐开发者将so封装为AAR，或者分别集成so和jar文件，自定义基座后再进行调试

HBuilderX 4.26版本之后，开发者可以使用混编 kotlin代码的方式，只需要集成so文件后打包自定义基座就可以让so文件参与本地调试，省去了封装AAR和jar的环节。参考hello uts

uni-app x / uni-app 均支持打包时手动指定资源位置 说明文档

例如 接入Firebase 时需要将google-services.json文件放在 app 目录下，则可以通过如下的配置来实现：

示例源码如下，请查看 pre > code 标签中的内容

部分场景下，开发者可能需要将本地依赖，上传到远程仓库，避免wgt提交资源过大超出打包限制。

这种情况，推荐开发者上传到 jitpack.io 这也是目前android 原生开发主流的远程仓库。 使用文档

截止 HBuilderX 4.15 版本：

uni-app x 项目： 本地Android sdk 版本为34

uni-app 项目： 本地Android sdk 版本为31

开发者在使用系统api时，需要注意版本兼容性

在UTS语言中，所有的Android原生API都可以调用

对于Android开发中高频使用的application/activity等系统能力、uni-app/uni-app x 运行时框架信息等，UTS通过内置对象UTSAndroid 进行了封装，以便开发者调用

下面列出了常见API的使用示例，完整的 UTSAndroid API文档

示例源码如下，请查看 pre > code 标签中的内容

用法说明：获取当前应用Application上下文，对应android平台 Context.getApplicationContext 函数实现

Android开发场景中，调用应用级别的资源/能力，需要使用此上下文。更多用法，参考Android官方文档

示例源码如下，请查看 pre > code 标签中的内容

** 与Application的转换 **

UTSAndroid.getAppContext() 默认返回的是 实现了 Context抽象类的Application 对象

部分场景，明确需要 Application 对象，那么直接强制类型转换即可

示例源码如下，请查看 pre > code 标签中的内容

获取当前插件所属的activity实例，对应android平台 getActivity 函数实现

Android开发场景中，调用活动的级别的资源/能力，需要使用此上下文。更多用法，参考Android官方文档

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.8.2版本之后支持

系统权限管理使用了 https://github.com/getActivity/XXPermissions 工具库

如果开发者使用了相同依赖，可能打包冲突。需要修改为 complileOnly 或者 修改为本章节内置API

请求系统权限,对应的两个参数： 1 请求的权限列表 2 请求结果回调

示例源码如下，请查看 pre > code 标签中的内容

除了本章节列出的函数外，android环境下 application 其他上下文方法都可以通过 getAppContext()!.xxx()的方式实现

示例源码如下，请查看 pre > code 标签中的内容

activity 其他上下文方法都可以通过 getUniActivity()!.xxx()的方式实现

比如获取当前activity的顶层View容器

示例源码如下，请查看 pre > code 标签中的内容

UTS内置了隐私状态管理API，以支持开发者管理用户隐私协议状态配置的需求：

获取用户当前是否已同意隐私协议isPrivacyAgree

更新用户对隐私协议的状态setprivacyagree

重置隐私协议状态resetPrivacyAgree

通过上面的章节的阅读,至此我们认为你已经掌握了UTS语法，掌握了基本的Kotlin语法，掌握了UTS对于android资源的支持。

但是对于一个熟悉android开发的kotlin语言者来说，有很多常用的习惯发生了改变，我们会在这个章节特别指出，便于开发者加深认识。

kotlin中 可变变量修饰为 var、val。 区别在于 val 不可变，var可变。

uts中对应var的变量类型为 var/let

推荐使用let 因为只会在作用域内生效，需要慎用var，因为它具备有更大的作用范围

方法定义 kotlin里的方法只有一种定义方式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

kotlin中的: 继承操作符，需要用extends取代

示例源码如下，请查看 pre > code 标签中的内容

kotlin中的非空断言是!!，ts中是一个!

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

有一种特殊场景，我们需要定义一些可为空的函数变量，比如下面的 success,fail：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这样的调用方式在kotlin中是非法的，属于TS中的特有语法，需要特别注意。

在Kotlin/java中允许一个函数有多个构造器，但是UTS中是不被允许的

android开发中场景的 intent跳转需要传入 目标界面的class对象，目前UTS中仅支持一种写法

示例源码如下，请查看 pre > code 标签中的内容

某些场景下开发者需要获得 指定double数据类型的数据

示例源码如下，请查看 pre > code 标签中的内容

但是Android原生环境中，数据类型的精度是向下兼容的，如果想要获得一个double类型，必须要有一个double类型参与运算：

示例源码如下，请查看 pre > code 标签中的内容

下面的内容不会影响功能使用，但是在UTS环境中，有合适的解决办法

kotlin 或者java 中java.lang.*是被特殊处理的，可以直接使用而不需要引入。

示例源码如下，请查看 pre > code 标签中的内容

UTS环境中，lang包没有被特殊对待，需要手动引入。

示例源码如下，请查看 pre > code 标签中的内容

kotlin 中 支持通过()的方式，快速实现无参构造器的声明

示例源码如下，请查看 pre > code 标签中的内容

UTS环境中，不建议这样做（虽然目前这样做不会影响编译），建议使用手动声明无参构造

示例源码如下，请查看 pre > code 标签中的内容

参考Hello UTS项目中的uts-nativepage插件

参考Hello UTS项目中的uts-nativepage插件

示例源码如下，请查看 pre > code 标签中的内容

完整示例参考Hello UTS项目中的uts-nativepage插件

如果只是想要简单的开启一个异步任务，建议使用：

示例源码如下，请查看 pre > code 标签中的内容

在java平台中，二进制操作一般采用字节数组实现。

UTS在android平台编译后的语言为Kotlin,对应的语法对象是ByteArray.

示例源码如下，请查看 pre > code 标签中的内容

UTS插件支持使用android的原生资源，比如动画，布局，字符串等。 详细说明

如果提示 R资源无法找到:unresolved reference R

1 需要排查资源是否符合android原生格式

2 检查R资源引入的包名是否正确，参考hello uts nativepage插件

示例源码如下，请查看 pre > code 标签中的内容

以HelloUTS nativepage插件 部分代码为例：

示例源码如下，请查看 pre > code 标签中的内容

如果要同时实现多个接口，采用的也是 implements 和 , 分隔来实现

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

kotlin编译产出的AAR，会将访问方法修改为私有，不能以下面的方法访问

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

调用原生过时的API插件编译时产生警告，可以使用@Suppress("DEPRECATION")添加注解到使用的方法上忽略警告，例：

示例源码如下，请查看 pre > code 标签中的内容

如果在UTS中声明一个包含泛型声明的方法，可能会出现泛型丢失，原因是因为普通的kotlin 方法没有实现泛型的传递

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了解决这种情况，我们可以在UTS中 添加android方法注解，来告诉编译器生成正确的代码：

示例源码如下，请查看 pre > code 标签中的内容

注意：不要在inline方法中创建局部function，比如request的success回调、Promise的回调，原因是kotlin语言的限制（inline方法展开到内联位置，也会把局部方法展开过去，这是不允许的），由此把使用局部function的逻辑封装到非内联的方法中，绕过此限制。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

此示例中，网络请求泛型为string在4.25版本以下会导致错误，此问题已在4.25进行修复 issue

示例源码如下，请查看 pre > code 标签中的内容

uts中的 Void 对应 kotlin语言中的 Unit,当报错：预期为 Unit 时，实际上是期望Void

目前uts的class实例不支持在vue2的data中定义。发生此类错误时，排查是否在data函数中定义了uts导出的class实例，如果定义了，移除该定义即可。

排查导入的三方库包名中是否包含了kotlin的关键字，比如:

示例源码如下，请查看 pre > code 标签中的内容

当以type 结构体为参数时，其内部boolean字段 默认值为false，不支持指定。

比如xml布局文件中暂时只支持 linearlayout等官方标签，不支持 appcompat等三方库标签。这个问题后续会被处理

UTS插件本地调试尚不支持直接使用so文件，需要将so文件和调用代码封装为AAR 或者分别集成 so和jar文件

在 4.81 版本之前，UTS 使用 Kotlin 1.8.10/1.9.20 版本。 HBuilder X 4.81 统一升级为 Kotlin 2.2.0 版本，主要带来以下优化：

本次升级对 UTS 开发者的影响主要体现在以下三个方面：

包括 UTS 插件使用者与 uvue 开发者：

理论上本次升级对这类开发者无感知差异，UTS 编译器已屏蔽底层 Kotlin 升级带来的语法细节。若发现升级后出现编译错误，请及时反馈。

若项目中包含 Kotlin 或 Java 编写的原生代码（如通过 source 引入的代码或本地依赖），需注意以下语法兼容性变化（参考 HBuidlerX 4.25 混编说明 ）：

以下列举常见的语法更新，完整内容参考 K2编译器更新说明 以及kotlin语法更新说明

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

+平台类型（如 Java 的 String!）空检测更严格：

示例源码如下，请查看 pre > code 标签中的内容

对应离线打包的开发者来说，除了需要关注上文中提到的kotlin语法变化之外，还需要同步升级 kotlin/gradle 相关配置：

更完整的升级后所需要的依赖配置 参考 离线打包SDK

HBuilderX4.81版本已适配支持 16KB 内存页面大小

uni-app 项目：https://uniapp.dcloud.net.cn/tutorial/android-16kb.html uni-app x 项目：https://doc.dcloud.net.cn/uni-app-x/tutorial/android-16kb.html

**Examples:**

Example 1 (unknown):
```unknown
onStartCommand
```

Example 2 (kotlin):
```kotlin
override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
   return super.onStartCommand(intent, flags, startId);
}
```

Example 3 (kotlin):
```kotlin
override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
   return super.onStartCommand(intent, flags, startId);
}
```

Example 4 (kotlin):
```kotlin
override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
   return super.onStartCommand(intent, flags, startId);
}
```

---

## 什么是编译器 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/compiler.html

**Contents:**
    - # 什么是编译器
      - 本页导读

uni-app能实现一套代码、多端运行，核心是通过编译器 + 运行时实现的：

uni-app项目根据所依赖的Vue版本不同，编译器的实现也不同：

uni-app项目根据创建方式的不同，编译器在使用上也有差异：

---

## 什么是跨域 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/CORS.html

**Contents:**
- # 什么是跨域
- # 如果前端要callfunction连接unicloud云函数
- # 如果前端要连接传统后台服务器
- # 部署时的跨域解决方案
- # 调试时的跨域解决方案
  - # 方案1 使用HBuilderX内置浏览器
  - # 方案2 配置webpack-dev-server代理
  - # 方案3 给浏览器安装跨域插件，禁止浏览器报跨域
    - # Chrome插件名称：Allow-Control-Allow-Origin: *
    - # 安装方式：

跨域是浏览器的专用概念，指js代码访问自己来源站点之外的站点。比如A站点网页中的js代码，请求了B站点的数据，就是跨域。 A和B要想被认为是同域，则必须有相同的协议（比如http和https就不行）、相同域名、和相同端口号（port）。

如果你是做App、小程序等非H5平台，是不涉及跨域问题的。 稍微例外的是iOS的wkWebview，在5+App，或uni-app的web-view组件及renderjs中，由于WKWebview限制也会产生跨域，这方面另见专题文章：https://ask.dcloud.net.cn/article/36348 。uni-app在App的普通js代码不运行在Webview下，不存在跨域问题。

由于uni-app是标准的前后端分离模式，开发h5应用时如果前端代码和后端接口没有部署在同域服务器，就会被浏览器报跨域。

在h5页面里callfunction会跨域，此时需在unicloud的web控制台配置域名白名单，被加白的域名可以跨域callfunction。详见：https://doc.dcloud.net.cn/uniCloud/quickstart?id=useinh5

另外运行期间在HBuilderX的内置浏览器里是不存在跨域的。

分部署时的跨域方案和调试时的跨域方案，具体见下：

例如：前端页面部署在uniCloud的前端页面托管里，但是需要访问自己服务器的接口，这时候需要在服务端允许前端页面托管的域名跨域访问。不同的服务端框架允许跨域的配置不一样，这里不再一一列举仅以eggjs为例。

示例源码如下，请查看 pre > code 标签中的内容

（2）在plugin.js中设置开启cors

示例源码如下，请查看 pre > code 标签中的内容

（3）在config.default.js中配置

示例源码如下，请查看 pre > code 标签中的内容

前端工程师调试时，运行起来的前端代码在uni-app自带的web服务器中，而不是部署在后台业务服务器上，此时就会遇到跨域。 除了协调后端配置允许跨域，其实也可以自己解决跨域问题。共3种方案可选。

这个内置浏览器经过官方处理，不存在跨域问题，简单易用，推荐使用。（需HBuilderX 2.6以上） 在打开页面后，点HBuilderX右上角的预览，即可打开内部浏览器。或者在运行菜单里选择运行到内置浏览器也可以。

下面是一篇比uni官网文档更详细的配置指南，这里就直接贴地址了：https://juejin.im/post/5e43b2645188254902765766

本插件并非万能，请仔细阅读与学习浏览器安全策略相关知识，不懂这些知识在评论里瞎喷的，官方不会回复。

当我们使用谷歌浏览器调试ajax请求的时候可能会遇到这两个问题：

最常见的就是关于跨域资源共享的问题，也就是我们通常说的跨域。当我们本地服务器预览页面，使用ajax访问远程服务器的内容时就会请求失败，比如：本地预览的地址是：http://localhost:8080/，访问的接口地址是http://dcloud.io/api。

如果仅仅是为了本地预览，可以使用Chrome浏览器插件来协助调试。 !!! 本插件只能解决简单请求的跨域调试（点击搜索什么是简单请求 ）。对于非简单请求的OPTION预检（点击搜索什么是预检请求 ）以及线上服务器也有跨域需求的用户，可以服务端配合解决 。

使用谷歌浏览器直接打开插件地址https://chrome.google.com/webstore/detail/allow-control-allow-origi/nlfbmbojpeacfghkpbjhddihlkkiljbi 安装即可

国内用户如果无法在线安装，可在本页面底部下载附件，离线安装

firefox跨域插件(注意firefox的css兼容问题)

HBuilderX 2.3.0版在某些情况下会报跨域，请升级2.3.1+解决

**Examples:**

Example 1 (shell):
```shell
npm i egg-cors --save
```

Example 2 (shell):
```shell
npm i egg-cors --save
```

Example 3 (shell):
```shell
npm i egg-cors --save
```

Example 4 (unknown):
```unknown
npm i egg-cors --save
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/unipush.html

**Contents:**
- # 概述
  - # 什么是push（推送服务）？
  - # 产品介绍
  - # 应用场景
  - # 技术架构
  - # 名词解释
  - # 消息推送流程
- # 产品版本
- # 注意事项
  - # 推送通道选择逻辑

uni-push 是 DCloud 联合个推公司推出的集成型统一推送服务，是所有uni-app开发者首选的推送服务。在介绍uni-push 之前，我们先来了解一下什么是push（推送服务）。

push（推送服务），是指服务器主动向客户端发送消息的技术。无需客户端持续轮询服务器，即可获得即时数据。

手机的通知栏、小程序的订阅消息都是一种push，由手机操作系统或微信在底层提供了push通道，屏蔽了轮询的各种弊端。你的应用可以被关闭，只要手机有网，操作系统提供的push通道即是实时在线的。

提醒：web浏览器的webnotification其实是一个本地通知栏功能，浏览器厂商没有提供push通道。

当客户端在线时，push通过socket协议实现。当客户端离线时，服务器找不到客户端，开发者无法自己实现推送，只能依托手机操作系统、小程序底层提供的离线消息推送，调用指定的手机厂商或小程序厂商的服务器接口来发送消息。

所以一个push系统需要3部分协作：开发者的业务服务器 + 专业push服务器 + 开发者的客户端应用。

uni-push 是 DCloud 联合个推公司推出的集成型统一推送服务，内建了苹果、华为、小米、OPPO、VIVO、魅族、谷歌 FCM 等手机厂商的系统级推送和个推等第三方推送。

国内Android的Push是一个混乱的世界，因为 Google 的 Push 服务 FCM 被墙，所以一些国内的安卓手机厂商各自做了自己的推送，比如华为、小米、OPPO、VIVO、魅族等，但还有很多国产手机厂商没有提供官方推送方案。三方独立公司如个推，则提供了独立的 push 方案。 在没有 uni-push 以前，如果只使用三方 push，会在很多国产手机上因为节电设置而无法保活 push 进程，导致无法推送。 而如果每个安卓手机的官方 Push SDK 都集成开发一遍，这么多平台，工作量会非常巨大，管理维护也很麻烦。

uni-push 解决了这个难题，开发者只需要开发一次。系统会自动在不同手机上选择最可靠的推送通道发送 push 消息，保障送达率。

uni-push 即降低了开发成本、又提高了 push 送达率，并且免费，是当前推送的最佳解决方案。

用户消息通知 当 APP 用户相关状态或者系统功能状态变化时（如用户订单通知、交易提醒、物流通知、升级提醒、社交互动提醒等），可对用户进行及时告知，或者促使用户完成特定操作。

离线语音播报 它也是一种用户消息推送，实现原理其实是自定义通知提醒铃声

营销促活通知 在日常营销推广、促销活动等场景下（如双11大促、产品上新、重要资讯等），APP可对目标用户进行定向通知栏消息+应用内消息推送，吸引用户参与活动，提升日活。

基于uniCloud的IM、聊天、客服、棋牌游戏交互等 例如：DCloud基于uni-push 2.0开发并开源了uni-im，详情：https://doc.dcloud.net.cn/uniCloud/uni-im.html 另外棋牌游戏等，需要客户端被动接收消息的需求都可以用uni-push实现。

uni-push 当前有2个版本，分别是uni-push 1.0和uni-push 2.0。uni-push 2.0是DCloud推出的、全端的(App、小程序、Web)、云端一体的统一推送服务，推荐开发者优先选择uni-push 2.0。

Android平台 APP在线（个推推送通道可用） 推送通知和透传消息都使用个推的推送通道下发推送消息。 APP离线（个推推送通道不可用） 推送通知，使用个推离线推送通道，离线消息会存储在消息离线库，离线时间内APP在线后下发推送消息。 透传消息，如果符合厂商推送的厂商手机（配置了手机厂商推送参数并且在对应厂商的手机上），则使用厂商推送通道下发推送消息；否则使用个推的离线推送通道，离线消息会存储在消息离线库，离线时间内APP在线后下发推送消息。

iOS平台 推送通知，uni-push后台管理界面中不支持下发此类型，个推提供的服务端API支持下发推送通知（设置APN参数则通过苹果的APNS通道，否则使用个推通道）。 透传消息，设置APN参数则通过苹果的APNS通道下发推送消息，没有设置APN参数则使用个推的推送通道下发。

在华为手机上必须安装“华为移动服务”才能使用华为的厂商推送通道，首先确保手机上已经安装“华为移动服务”应用。 如果在华为手机应用退出后无法接收到推送消息，需要确保：

HBuilderX 3.0.7 之后，华为除了配置原有的厂商信息之外，需要新增配置agconnect-services.json文件。

该文件，需要从华为开发者后台--项目设置界面下载

需要在VIVO应用商店上线才能申请VIVO的厂商推送 注意事项：

需要在OPPO应用商店上线才能申请OPPO的厂商推送

需Android手机已经安装GMS，且手机网络可以连通谷歌FCM推送服务器。 详细教程另见：如何使用FCM。

如果应用在线可以接收到推送消息，离线时使用厂商通道无法接收到推送消息，可参考**uni-push厂商通道常见问题https://ask.dcloud.net.cn/article/36611 **

有了uni-push，开发者不应该再使用其他push方案了。但我们发现很多开发者有误解，导致还在错误使用其他推送。

“uni-push的专业性，和专业的个推、极光等服务可相比吗？”

uni-push 是由个推将其本来收费的 push 产品，免费提供给了DCloud的开发者。它与个推vip push的只有3个区别：

“uni-push好麻烦，我就喜欢个推、极光这种简单sdk，不想去各个rom厂商去申请一圈”

uni-push不建立在申请手机厂商授权的基础上，如果你不申请那些，使用起来和用普通的push是一样的。但是要特别注意，推送行业的现状就是：不集成rom厂商的推送，就无法在App离线时发送push。按照普通push模式使用，后果就是在华为、小米、OPPO、VIVO、魅族上发不了离线消息。

“uni-push的送达率高吗？是否可以付费来提升送达率，个推是有付费提升送达率的方法的”

前文已经做过相关说明，个推的付费提升送达率的产品就是vip push，而uni-push就是个推的vip Push。DCloud通过谈判免费给DCloud的开发者使用了。

uni-push可以完整替代socket吗？

能部分替代。uni-push客户端接收消息的通讯协议属于websocket；但业务服务端向uni-push服务发送消息用的是http通讯协议，会有1-2秒的延时。需要超低延迟的应用场景，如多人交互远程画板不合适。但对于普通的im消息、聊天、通知都没有问题。

5+app和wap2app支持uni-push吗？

HBuilderX 2.0.3起，5+app和wap2app可以使用uni-push 1.0，暂不支持使用uni-push 2.0。5+app和wap2app升级uni-push不需要改动app前端代码，只需要在HBuilderX中打开manifest.json的“模块配置”页，在“Push(消息推送)”下勾选“uniPush”，并点击“配置”，在后台开通uni-push服务，配置好厂商推送参数重新提交云端打包即可。后端服务器需要参考uni-push 1.0文档中的第二步对接个推推送服务。

uni-app x项目如何使用uni-push？

uni-app x项目只支持uni-push 2.0，开发文档参考：https://doc.dcloud.net.cn/uni-app-x/api/uni-push.html

iOS平台如何实现应用启动后不立即弹出“发送通知”系统授权框？

参考：https://ask.dcloud.net.cn/article/36955

为什么Android应用进入后台后（App未销毁），点击通知消息无法拉起App？

检查设备是否有禁止后台弹出界面，路径>>设置-应用管理-测试应用-权限管理-后台弹出界面，(一般是小米、oppo、vivo设备)。

参考文档，uni-push支持谷歌推送FCM配置指南

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

## uni-ui 介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-ui.html

**Contents:**
- # uni-ui 介绍
- # uni-ui产品特点
  - # 1、高性能
  - # 2、全端
  - # 3、风格扩展
  - # 4、与uniCloud协作
  - # 5、与uni统计自动集成实现免打点
  - # 6、uni-ui符合全套DCloud组件规范
      - 本页导读

uni-ui 是DCloud提供的一个跨端ui库，它是基于vue组件的、flex布局的、无dom的跨全端ui框架。

uni-ui 不包括内置组件，它是内置组件的补充。

目前为止，在小程序和混合app领域，uni-ui是性能的标杆。

虽然uni-app支持小程序自定义组件，所有小程序的ui库都可以用。但小程序自定义组件的ui库都需要使用setData手动更新数据，在大数据量时、或高频更新数据时，很容易产生性能问题。

而uni-ui属于vue组件，uni-app引擎底层自动diff更新数据。当然其实插件市场里众多vue组件都具备这个特点。

非H5，不管是小程序还是App，不管是app的webview渲染还是原生渲染，全都是逻辑层和视图层分离的。这里就有一个逻辑层和视图层通讯的折损问题。 比如在视图层拖动一个可跟手的组件，由于通讯的损耗，用js监听很难做到实时跟手。

这时就需要使用css动画以及平台底层提供的wxs、bindingx等技术。不过这些技术都比较复杂，所以uni-ui里做了封装，在需要跟手式操作的ui组件，比如swiperaction列表项左滑菜单，就在底层使用了这些技术，实现了高性能的交互体验

很多ui组件是会一直动的，比如轮播图、跑马灯。即便这个窗体被新窗体挡住，它在背景层仍然在消耗着硬件资源。在Android的webview版本为chrome66以上，背景操作ui会引发很严重的性能问题，造成前台界面明显卡顿。

而uni-ui的组件，会自动判断自己的显示状态，在组件不再可见时，不会再消耗硬件资源。

uni-ui的组件都是多端自适应的，底层会抹平很多小程序平台的差异或bug。

比如导航栏navbar组件，会自动处理不同端的状态栏； 比如swiperaction组件，在app和微信小程序上会使用交互体验更好的wxs技术，但在不支持wxs的其他小程序端会使用js模拟类似效果。

uni-ui还支持pc等宽屏设备，可以通过PC浏览器访问https://hellouniapp.dcloud.net.cn/pages/extUI/badge/badge 体验

uni-ui的默认风格是中型的，与uni-app基础组件风格一致。但它支持uni.scss ，可以方便的扩展和切换应用的风格。

UI 是一种需求非常发散的产品，DCloud官方也无意用uni-ui压制第三方 UI 插件的空间，但官方有义务在性能和跨端方面提供一个开源的标杆给大家。

我们欢迎更多优秀的 UI 组件出现，也欢迎更多人贡献uni-ui的主题风格，满足更多用户的需求。

uni-ui里很多组件与uniCloud打通，可大幅提升开发效率

uni统计是优秀的多端统计平台，见 tongji.dcloud.net.cn 。

除了一张报表看全端，它的另一个重要特点是免打点，也成为无侵入式埋点。

比如使用uni-ui的navbar标题栏、收藏、购物车等组件，均可实现自动打点，统计页面标题等各种行为数据。

当然你也可以关闭uni统计，这不是强制的。

包括 easycom、uni_module、datacom，全部遵循。

---

## 介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue3-basics.html

**Contents:**
- # 介绍
- # vue的优势
- # 白话uni-app
  - # 文件类型变化
  - # 文件内代码架构的变化
  - # 外部文件引用方式变化
  - # 组件/标签的变化
  - # js的变化
- # 在 uni-app 中使用vue的差异
- # 模板语法

已经了解 Vue2，只想了解 Vue3 新功能可以参阅vue3新功能 ！

已经有 Vue2 项目，需要适配 Vue3 的可参阅vue2 项目迁移 vue3 ！

Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。与其它大型框架不同的是，Vue 被设计为可以自底向上逐层应用。

Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统，只关注视图层，易于上手。所有东西都是响应式的。

本文大部分内容来源于vue3中文文档官网 ，但结合 uni-app 做了部分调整，以更有利于开发者快速上手。感谢Vue团队！

在传统开发中，用原生的 JavaScript DOM 操作函数对 DOM 进行频繁操作的时候，浏览器要不停的渲染新的 DOM 树，导致页面看起来非常卡顿。

vue 是单页面应用，使页面局部刷新，不用每次跳转页面都要请求所有数据和 DOM ，这样大大加快了访问速度和提升用户体验。

如果你了解html、js，那么本章节将让你快速了解uni-app和它们的差异。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在hello uni-app的 common 目录有一个工具类 util.js ，可以在hello uni-app中搜索这个例子查看。hello uni-app示例代码可从 github 获取。

示例源码如下，请查看 pre > code 标签中的内容

而在这个 util.js 里，要把之前的 function 封装为模块（module）的方法并导出（exports）。只有被导出的方法和属性才能被外部调用，不导出的属于模块内部函数和变量。这是es6的模块规范。

示例源码如下，请查看 pre > code 标签中的内容

当然还有一些高级的用法，比如在导出时可以重命名

示例源码如下，请查看 pre > code 标签中的内容

css外部文件导入。全局样式，在根目录下的 app.vue 里写入，每个页面都会加载 app.vue 里的样式。

示例源码如下，请查看 pre > code 标签中的内容

另外，vue支持组件导入，可以更方便的封装一个包括界面、js、样式的库。详见

以前是html标签，比如 <div> ，现在是小程序组件，比如 <view> 。

那么标签和组件有什么区别，不都是用尖括号包围起来一段英文吗？

uni-app 参考小程序规范，提供了一批内置组件 。

示例源码如下，请查看 pre > code 标签中的内容

现在script里默认有export default，在里面写data、事件和method

示例源码如下，请查看 pre > code 标签中的内容

在上述例子中，传统写法的定义的变量globalvar和函数globalfun，可以在export default { }里使用，但无法在模板里直接绑定和调用。模板里只能绑定data里的变量、调用methods里的方法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app 在发布到H5时支持所有vue的语法；发布到App和小程序时，由于平台限制，无法实现全部vue语法，但 uni-app 仍是对vue语法支持度最高的跨端框架。

相比Web平台， Vue.js 在 uni-app 中使用差异主要集中在两个方面：

uni-app 项目支持 vue 3.0介绍，及升级指南

uni-app 项目对 vue 3.0 的支持版本情况如下：

Vue.js 使用了基于 HTML 的模板语法，允许开发者声明式地将 DOM 绑定至底层组件实例的数据。 所有 Vue.js 的模板都是合法的 HTML，所以能被遵循规范的浏览器和 HTML 解析器解析。

在底层的实现上，Vue 将模板编译成虚拟 DOM 渲染函数。结合响应性系统，Vue 能够智能地计算出最少需要重新渲染多少组件，并把 DOM 操作次数减到最少。

示例源码如下，请查看 pre > code 标签中的内容

里的内容将会被替代为对应数据对象上msg的值。无论何时，绑定的数据对象上msg发生了改变，插值处的内容都会更新。

迄今为止，在我们的模板中，我们一直都只绑定简单的 property 键值。但实际上，对于所有的数据绑定，Vue.js 都提供了完全的 JavaScript 表达式支持。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这些表达式会在所属 Vue 实例的数据作用域下作为 JavaScript 被解析。有个限制就是，每个绑定都只能包含单个表达式，所以下面的例子都不会生效。

示例源码如下，请查看 pre > code 标签中的内容

模板表达式都被放在沙盒中，只能访问全局变量的一个白名单：

你不应该在模板表达式中试图访问用户定义的全局变量。

动态地绑定一个或多个属性，v-bind缩写为‘ : ’，可以用于响应式地更新 HTML attribute：

示例源码如下，请查看 pre > code 标签中的内容

在这里 src 是参数，告知 v-bind 指令将该元素的 src attribute 与表达式 imgUrl 的值绑定。

如果 isButtonDisabled 的值是 null 或 undefined，则 disabled attribute 甚至不会被包含在渲染出来的 button 元素中。

v-on 指令，它用于监听 DOM 事件。v-on缩写为‘ @ ’，下文简称为 @事件

示例源码如下，请查看 pre > code 标签中的内容

只渲染元素和组件一次。随后的重新渲染，元素/组件及其所有的子节点将被视为静态内容并跳过。

和前端框架中的理解不同，客户端里要实现复用的逻辑，会标记模板节点的状态，添加了 v-once 能保证节点只渲染一次，但是并不一定能优化渲染性能，反而可能会拖慢客户端复用节点时的比对效率。

示例源码如下，请查看 pre > code 标签中的内容

跨端的富文本处理方案详见：https://ask.dcloud.net.cn/article/35772

示例源码如下，请查看 pre > code 标签中的内容

data 选项已标准化为只接受返回一个初始数据对象的函数（注意函数内返回的数据对象不要直接引用函数外的对象）；否则页面关闭时，数据不会自动销毁，再次打开该页面时，会显示上次数据。

示例源码如下，请查看 pre > code 标签中的内容

我们可以传给 :class (v-bind:class 的简写) 一个对象，实现动态地切换 class。

也可以在对象中传入更多字段来动态切换多个 class。此外，v-bind:class 指令也可以与普通的 class 共存。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当 isActive 或者 hasError 变化时，class 列表将相应地更新。例如，如果 hasError 的值为 true ，class 列表将变为 static active text-danger。

可以把一个数组传给 v-bind:class，以应用一个 class 列表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果你想根据条件切换列表中的 class，可以使用三元表达式：

示例源码如下，请查看 pre > code 标签中的内容

这样写将始终添加 errorClass，但是只有在 isActive 为 truthy 时才添加 activeClass。

在 JavaScript 中，truthy（真值）指的是在布尔值上下文中，转换后的值为真的值。所有值都是真值，除非它们被定义为 假值（即除 false、0、""、null、undefined 和 NaN 以外皆为真值）。

不过，当有多个条件 class 时这样写有些繁琐。所以在数组语法中也可以使用对象语法：

示例源码如下，请查看 pre > code 标签中的内容

注意：以:style=""这样的方式设置px像素值，其值为实际像素，不会被编译器转换。

此外还可以用计算属性 computed 方法生成 class 或者 style 字符串，插入到页面中，举例说明：

示例源码如下，请查看 pre > code 标签中的内容

:style 的对象语法十分直观——看着非常像 CSS，但其实是一个 JavaScript 对象。CSS property 名可以用驼峰式 (camelCase) 或短横线分隔 (kebab-case，记得用引号括起来) 来命名：

示例源码如下，请查看 pre > code 标签中的内容

直接绑定到一个样式对象通常更好，这会让模板更清晰：

示例源码如下，请查看 pre > code 标签中的内容

同样的，对象语法常常结合返回对象的计算属性使用。

:style 的数组语法可以将多个样式对象应用到同一个元素上：

示例源码如下，请查看 pre > code 标签中的内容

在 :style 中使用需要 (浏览器引擎前缀) vendor prefixesa 的 CSS property 时，如 transform，Vue 将自动侦测并添加相应的前缀。

可以为 style 绑定中的 property 提供一个包含多个值的数组，常用于提供多个带前缀的值，例如：

示例源码如下，请查看 pre > code 标签中的内容

这样写只会渲染数组中最后一个被浏览器支持的值。在本例中，如果浏览器支持不带浏览器前缀的 flexbox，那么就只会渲染 display: flex。

v-if 指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回 truthy 值的时候被渲染。 使用 v-else 指令来表示 v-if 的“else 块”。 v-else 元素必须紧跟在带 v-if 或者 v-else-if 的元素的后面，否则它将不会被识别。

在 JavaScript 中，truthy（真值）指的是在布尔值上下文中，转换后的值为真的值。所有值都是真值，除非它们被定义为 假值（即除 false、0、""、null、undefined 和 NaN 以外皆为真值）。

示例源码如下，请查看 pre > code 标签中的内容

v-else-if，顾名思义，充当 v-if 的“else-if 块”，可以连续使用：

示例源码如下，请查看 pre > code 标签中的内容

类似于 v-else ，v-else-if 也必须紧跟在带 v-if 或者 v-else-if 的元素之后。

因为 v-if 是一个指令，所以必须将它添加到一个元素上。但是如果想切换多个元素呢？

此时可以把一个 template 元素当做不可见的包裹元素，并在上面使用 v-if。最终的渲染结果将不包含 template 元素。

示例源码如下，请查看 pre > code 标签中的内容

另一个用于根据条件展示元素的选项是 v-show 指令。用法大致一样：

示例源码如下，请查看 pre > code 标签中的内容

不同的是带有 v-show 的元素始终会被渲染并保留在 DOM 中。v-show 只是简单地切换元素的 CSS 属性的 display 。

注意，v-show 不支持 template 元素，也不支持 v-else。nvue 页面不支持 v-show。

v-if 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。

v-if 也是惰性的：如果在初始渲染时条件为假，则什么也不做——直到条件第一次变为真时，才会开始渲染条件块。

相比之下，v-show 就简单得多——不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换，来控制元素的显示和隐藏。

v-for 指令可以实现基于一个数组来渲染一个列表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你也可以用 v-for 来遍历一个对象的 property。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在遍历对象时，会按 Object.keys() 的结果遍历，但是不能保证它在不同 JavaScript 引擎下的结果都一致。

类似于 v-if，你也可以利用带有 v-for 的 template 来循环渲染一段包含多个元素的内容。比如：

示例源码如下，请查看 pre > code 标签中的内容

当 Vue 正在更新使用 v-for 渲染的元素列表时，它默认使用“就地更新”的策略。如果数据项的顺序被改变，Vue 将不会移动 DOM 元素来匹配数据项的顺序，而是就地更新每个元素，并且确保它们在每个索引位置正确渲染。

这个默认的模式是高效的，但是只适用于不依赖子组件状态或临时 DOM 状态 (例如：表单输入值) 的列表渲染输出。

为了给 Vue 一个提示，以便它能跟踪每个节点的身份，从而重用和重新排序现有元素，你需要为每项提供一个唯一 key attribute：

示例源码如下，请查看 pre > code 标签中的内容

建议尽可能在使用 v-for 时提供 key attribute，除非遍历输出的 DOM 内容非常简单，或者是刻意依赖默认行为以获取性能上的提升。

不要使用对象或数组之类的非基本类型值作为 v-for 的 key。请用字符串或数值类型的值。

如不提供 :key，会报一个 warning， 如果明确知道该列表是静态，或者不必关注其顺序，可以选择忽略。

示例源码如下，请查看 pre > code 标签中的内容

在Vue3中，key 则应该被设置在 <template> 标签上

示例源码如下，请查看 pre > code 标签中的内容

类似地，当使用 <template v-for> 时存在使用 v-if 的子节点，key 应改为设置在 <template> 标签上。

示例源码如下，请查看 pre > code 标签中的内容

在自定义组件上，你可以像在任何普通元素上一样使用 v-for 。

示例源码如下，请查看 pre > code 标签中的内容

当在组件上使用 v-for 时，key是必须的。

不推荐在同一元素上使用 v-if 和 v-for

当它们处于同一节点，v-if 的优先级比 v-for 更高，这意味着 v-if 将没有权限访问 v-for 里的变量：

示例源码如下，请查看 pre > code 标签中的内容

可以把 v-for 移动到 template 标签中来修正：

示例源码如下，请查看 pre > code 标签中的内容

我们可以使用 v-on 指令 (通常缩写为 @ 符号，下文简称为：@事件) 来监听 DOM 事件，并在触发事件时执行一些 JavaScript。

用法为 v-on:click="methodName" 或使用快捷方式 @click="methodName" （uni-app里一般都使用@缩写方式）

指令的值，字符串里直接写js。比如下面的counter += 1就是一段js。

示例源码如下，请查看 pre > code 标签中的内容

然而许多事件处理逻辑会更为复杂，所以直接把 JavaScript 代码写在组件属性值里是不可行的。因此@事件还可以接收一个需要调用的方法名称。

示例源码如下，请查看 pre > code 标签中的内容

除了直接绑定到一个方法，也可以在内联 JavaScript 语句中调用方法：

示例源码如下，请查看 pre > code 标签中的内容

有时也需要在内联语句处理器中访问原始的 DOM 事件。可以用特殊变量 $event 把它传入方法：

示例源码如下，请查看 pre > code 标签中的内容

事件处理程序中可以有多个方法，这些方法由逗号运算符分隔：

示例源码如下，请查看 pre > code 标签中的内容

修饰符 (modifier) 是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。例如，.prevent 修饰符告诉 @事件对于触发的事件调用 event.preventDefault()：

示例源码如下，请查看 pre > code 标签中的内容

使用修饰符时，顺序很重要；相应的代码会以同样的顺序产生。因此，用 @click.prevent.self 会阻止所有的点击，而 @click.self.prevent 只会阻止对元素自身的点击。

示例源码如下，请查看 pre > code 标签中的内容

扫一眼 template 模板便能轻松定位在 JavaScript 代码里对应的方法。

因为你无须在 JavaScript 里手动绑定事件，你的 ViewModel 代码可以是非常纯粹的逻辑，和 DOM 完全解耦，更易于测试。

当一个 ViewModel 被销毁时，所有的事件处理器都会自动被删除。你无须担心如何清理它们。

示例源码如下，请查看 pre > code 标签中的内容

你可以用 v-model 指令在表单 input、textarea 及 select 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 v-model 本质上不过是语法糖。它负责监听用户的输入事件以更新数据，并对一些极端场景进行一些特殊处理。

v-model 会忽略所有表单元素的 value、checked、selected attribute 的初始值而总是将 Vue 实例的数据作为数据来源。你应该通过 JavaScript 在组件的 data 选项中声明初始值。

在下面的示例中，输入框通过v-model绑定了message，用户在输入框里输入内容时，这个内容会实时赋值给message。当然在代码里为message赋值也会实时同步到界面上input里。这就是双向绑定。

示例源码如下，请查看 pre > code 标签中的内容

建议开发过程中直接使用 uni-app：表单组件 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

每一个计算属性都包含一个 getter 函数和一个 setter函数 ，默认是利用 getter 函数来读取。所有 getter 和 setter 函数的 this 上下文自动地绑定为 Vue 实例。

模板内的表达式非常便利，但是设计它们的初衷是用于简单运算的。在模板中放入太多的逻辑会让模板过重且难以维护。例如，有一个嵌套数组对象：

示例源码如下，请查看 pre > code 标签中的内容

我们想根据 author 是否已经有一些书来显示不同的消息，可以使用模板内的表达式

示例源码如下，请查看 pre > code 标签中的内容

此时，模板不再是简单的和声明性的。你必须先看一下它，然后才能意识到它执行的计算取决于 author.books。如果要在模板中多次包含此计算，则问题会变得更糟。

所以，对于任何包含响应式数据的复杂逻辑，你都应该使用计算属性。

示例源码如下，请查看 pre > code 标签中的内容

这里声明了一个计算属性 publishedBooksMessage。

尝试更改应用程序 data 中 books 数组的值，你将看到 publishedBooksMessage 如何相应地更改。

你可以像普通属性一样将数据绑定到模板中的计算属性。Vue 知道 publishedBookMessage 依赖于 author.books，因此当 author.books 发生改变时，所有依赖 publishedBookMessage 绑定也会更新。而且最妙的是我们已经声明的方式创建了这个依赖关系：计算属性的 getter 函数没有副作用，这使得更易于测试和理解。

计算属性还可以依赖多个 Vue 实例的数据，只要其中任一数据变化，计算属性就会重新执行，视图也会更新。

计算属性默认只有 getter，不过在需要时你也可以提供一个 setter， 当手动修改计算属性的值时，就会触发 setter 函数，执行一些自定义的操作。

示例源码如下，请查看 pre > code 标签中的内容

现在再运行 fullName = 'John Doe' 时，setter 会被调用，firstName 和 lastName 也会相应地被更新。

我们可以通过在表达式中调用方法来达到同样的效果：

示例源码如下，请查看 pre > code 标签中的内容

我们可以将同一函数定义为一个方法而不是一个计算属性。两种方式的最终结果确实是完全相同的。然而，不同的是计算属性是基于它们的反应依赖关系缓存的。

计算属性只在相关响应式依赖发生改变时它们才会重新求值。这就意味着只要 author.books 还没有发生改变，多次访问 publishedBookMessage 计算属性会立即返回之前的计算结果，而不必再次执行函数。

这也同样意味着下面的计算属性将不再更新，因为 Date.now () 不是响应式依赖：

示例源码如下，请查看 pre > code 标签中的内容

相比之下，每当触发重新渲染时，调用方法将总会再次执行函数。

假设我们有一个性能开销比较大的计算属性 list，它需要遍历一个巨大的数组并做大量的计算。然后我们可能有其他的计算属性依赖于 list。如果没有缓存，我们将不可避免的多次执行 list 的 getter！如果你不希望有缓存，请用 method 来替代。

虽然计算属性在大多数情况下更合适，但有时也需要一个自定义的侦听器。这就是为什么 Vue 通过 watch 选项提供了一个更通用的方法，来响应数据的变化。当需要在数据变化时执行异步或开销较大的操作时，这个方式是最有用的。

当你有一些数据需要随着其它数据变动而变动时，就可以使用Watch来监听他们之间的变化。

一个对象，键是需要观察的表达式，值是对应回调函数。值也可以是方法名，或者包含选项的对象。 Vue 实例将会在实例化时调用 $watch() ，遍历 watch 对象的每一个 property 。

示例源码如下，请查看 pre > code 标签中的内容

以上示例有个问题，就是页面刚加载时，因为没有变化，所以不会执行。下面用immediate来解决。

在选项参数中指定 immediate: true 将立即以表达式的当前值触发回调：

watch方法默认就是handler，而当immediate:true时，就会先执行handler方法。

示例源码如下，请查看 pre > code 标签中的内容

为了发现对象内部值的变化，可以在选项参数中指定 deep: true 。深度监听一个对象整体的变化（即监听对象所有属性值的变化），注意监听数组的变更不需要这么做。

示例源码如下，请查看 pre > code 标签中的内容

如果不想监听 obj 中其他值，只想监听 obj.a 的值的变化，可以写成字符串形式监听。

示例源码如下，请查看 pre > code 标签中的内容

Vue 提供了一种更通用的方式来观察和响应 Vue 实例上的数据变动：侦听属性。当你有一些数据需要随着其它数据变动而变动时，你很容易滥用 watch 。然而，通常更好的做法是使用计算属性而不是命令式的 watch 回调。

示例源码如下，请查看 pre > code 标签中的内容

上面代码是命令式且重复的。将它与计算属性的版本进行比较：

示例源码如下，请查看 pre > code 标签中的内容

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

## 介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-basics.html

**Contents:**
- # 介绍
- # vue相比传统js的开发优势
  - # 文件类型变化
  - # 文件内代码架构的变化
  - # 外部文件引用方式变化
  - # 组件/标签的变化
  - # js的变化
- # 在 uni-app 中使用差异
- # 模板语法
  - # 插值

Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。Vue 被设计为可以自底向上逐层应用。

Vue.js 使用了基于 HTML 的模板语法，允许开发者声明式地将 DOM 绑定至底层 Vue 实例的数据。所有 Vue.js 的模板都是合法的 HTML，所以能被遵循规范的浏览器和 HTML 解析器解析。

在底层的实现上，Vue 将模板编译成虚拟 DOM 渲染函数。结合响应系统，Vue 能够智能地计算出最少需要重新渲染多少组件，并把 DOM 操作次数减到最少。

Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统，只关注视图层，易于上手。所有东西都是响应式的。

我们提供了免费视频教程，在看此文档同时建议结合 vue入门视频教程 ，帮助你更加快速掌握。

本文大部分内容来源于vue官网，但结合 uni-app 做了部分调整，以更有利于开发者快速上手。感谢Vue团队！

在传统开发中，用原生的 JavaScript DOM 操作函数对 DOM 进行频繁操作的时候，浏览器要不停的渲染新的 DOM 树，导致页面看起来非常卡顿。

vue 是单页面应用，使页面局部刷新，不用每次跳转页面都要请求所有数据和 DOM ，这样大大加快了访问速度和提升用户体验。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

js要require进来，变成了对象。 在hello uni-app的 common 目录有一个工具类 util.js ，可以在hello uni-app中搜索这个例子查看。hello uni-app示例代码可从 github 获取。

示例源码如下，请查看 pre > code 标签中的内容

而在这个 util.js 里，要把之前的 function 封装为对象的方法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

css外部文件导入。全局样式，在根目录下的 app.vue 里写入，每个页面都会加载 app.vue 里的样式。

示例源码如下，请查看 pre > code 标签中的内容

另外，vue支持组件导入，可以更方便的封装一个包括界面、js、样式的库。详见

以前是html标签，比如 <div> ，现在是小程序组件，比如 <view> 。

那么标签和组件有什么区别，不都是用尖括号包围起来一段英文吗？

uni-app 参考小程序规范，提供了一批内置组件 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app 在发布到H5时支持所有vue的语法；发布到App和小程序时，由于平台限制，无法实现全部vue语法，但 uni-app 仍是对vue语法支持度最高的跨端框架。

相比Web平台， Vue.js 在 uni-app 中使用差异主要集中在两个方面：

示例源码如下，请查看 pre > code 标签中的内容

里的内容将会被替代为对应数据对象上msg的值。无论何时，绑定的数据对象上msg发生了改变，插值处的内容都会更新。

迄今为止，在我们的模板中，我们一直都只绑定简单的 property 键值。但实际上，对于所有的数据绑定，Vue.js 都提供了完全的 JavaScript 表达式支持。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这些表达式会在所属 Vue 实例的数据作用域下作为 JavaScript 被解析。有个限制就是，每个绑定都只能包含单个表达式，所以下面的例子都不会生效。

示例源码如下，请查看 pre > code 标签中的内容

模板表达式都被放在沙盒中，只能访问全局变量的一个白名单：

你不应该在模板表达式中试图访问用户定义的全局变量。

动态地绑定一个或多个属性，或一个组件 prop 到表达式。

示例源码如下，请查看 pre > code 标签中的内容

如果 isButtonDisabled 的值是 null 、undefined 或 false ，则 disabled 甚至不会被包含在渲染出来的 button 元素中。

v-on 指令，它用于监听 DOM 事件。v-on缩写为‘ @ ’，下文简称为 @事件

示例源码如下，请查看 pre > code 标签中的内容

只渲染元素和组件一次。随后的重新渲染，元素/组件及其所有的子节点将被视为静态内容并跳过。

和前端框架中的理解不同，客户端里要实现复用的逻辑，会标记模板节点的状态，添加了 v-once 能保证节点只渲染一次，但是并不一定能优化渲染性能，反而可能会拖慢客户端复用节点时的比对效率。

示例源码如下，请查看 pre > code 标签中的内容

跨端的富文本处理方案详见：https://ask.dcloud.net.cn/article/35772

示例源码如下，请查看 pre > code 标签中的内容

data 必须声明为返回一个初始数据对象的函数（注意函数内返回的数据对象不要直接引用函数外的对象）；否则页面关闭时，数据不会自动销毁，再次打开该页面时，会显示上次数据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

data数据在template中有2种绑定方式：

示例源码如下，请查看 pre > code 标签中的内容

data数据在script中引用，通过this.的方式。如果在某些methods中this被指向了其他内容，则需要提前把this赋值给另一个变量，比如let that = this。

示例源码如下，请查看 pre > code 标签中的内容

为节约性能，我们将 Class 与 Style 的表达式通过 compiler 硬编码到 uni-app 中，支持语法和转换效果见下：

可以传给 v-bind:class 一个对象，实现动态地切换 class。

也可以在对象中传入更多字段来动态切换多个 class。此外，v-bind:class 指令也可以与普通的 class 共存。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当 isActive 或者 hasError 变化时，class 列表将相应地更新。例如，如果 hasError 的值为 true ，class 列表将变为 static active text-danger。

可以把一个数组传给 v-bind:class，以应用一个 class 列表。

示例源码如下，请查看 pre > code 标签中的内容

注意：以:style=""这样的方式设置px像素值，其值为实际像素，不会被编译器转换。

此外还可以用 computed 方法生成 class 或者 style 字符串，插入到页面中，举例说明：

示例源码如下，请查看 pre > code 标签中的内容

小程序端不支持 classObject 和 styleObject 语法。

示例源码如下，请查看 pre > code 标签中的内容

v-if 指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回 truthy 值的时候被渲染。 使用 v-else 指令来表示 v-if 的“else 块”。

在 JavaScript 中，truthy（真值）指的是在布尔值上下文中，转换后的值为真的值。所有值都是真值，除非它们被定义为 假值（即除 false、0、""、null、undefined 和 NaN 以外皆为真值）。

示例源码如下，请查看 pre > code 标签中的内容

v-else-if，顾名思义，充当 v-if 的“else-if 块”，可以连续使用：

示例源码如下，请查看 pre > code 标签中的内容

类似于 v-else ，v-else-if 也必须紧跟在带 v-if 或者 v-else-if 的元素之后。

因为 v-if 是一个指令，所以必须将它添加到一个元素上。但是如果想切换多个元素呢？此时可以把一个 template 元素当做不可见的包裹元素，并在上面使用 v-if。最终的渲染结果将不包含 template 元素。

示例源码如下，请查看 pre > code 标签中的内容

v-show 是一个根据条件展示元素选项的指令 。用法大致和 v-if 一样：

示例源码如下，请查看 pre > code 标签中的内容

不同的是带有 v-show 的元素始终会被渲染并保留在 DOM 中。v-show 只是简单地切换元素的 CSS 属性的 display 。

注意，v-show 不支持 template 元素，也不支持 v-else。nvue 页面不支持 v-show。

v-if 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。

v-if 也是惰性的：如果在初始渲染时条件为假，则什么也不做，直到条件第一次变为真时，才会开始渲染条件块。

相比之下，v-show 就简单得多，不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换，来控制元素的显示和隐藏。

v-for 指令可以实现基于一个数组来渲染一个列表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你也可以用 v-for 来遍历一个对象的 property。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似于 v-if，你也可以利用带有 v-for 的 template 来循环渲染一段包含多个元素的内容。比如：

示例源码如下，请查看 pre > code 标签中的内容

当 Vue 正在更新使用 v-for 渲染的元素列表时，它默认使用“就地更新”的策略。如果数据项的顺序被改变，Vue 将不会移动 DOM 元素来匹配数据项的顺序，而是就地更新每个元素，并且确保它们在每个索引位置正确渲染。

如果列表中项目的位置会动态改变或者有新的项目添加到列表中，并且希望列表中的项目保持自己的特征和状态（如 input 中的输入内容，switch 的选中状态），需要使用 :key 来指定列表中项目的唯一的标识符。

当数据改变触发渲染层重新渲染的时候，会校正带有 key 的组件，框架会确保他们被重新排序，而不是重新创建，以确保使组件保持自身的状态，并且提高列表渲染时的效率。

如不提供 :key，会报一个 warning， 如果明确知道该列表是静态，或者不必关注其顺序，可以选择忽略。

示例源码如下，请查看 pre > code 标签中的内容

在自定义组件上，你可以像在任何普通元素上一样使用 v-for 。

示例源码如下，请查看 pre > code 标签中的内容

当在组件上使用 v-for 时，key是必须的。

可以用@事件监听 DOM 事件，并在触发时运行一些 JavaScript 代码。

示例源码如下，请查看 pre > code 标签中的内容

然而许多事件处理逻辑会更为复杂，所以直接把 JavaScript 代码写在@事件中是不可行的。因此@事件还可以接收一个需要调用的方法名称。

示例源码如下，请查看 pre > code 标签中的内容

除了直接绑定到一个方法，也可以在内联 JavaScript 语句中调用方法：

示例源码如下，请查看 pre > code 标签中的内容

有时也需要在内联语句处理器中访问原始的 DOM 事件。可以用特殊变量 $event 把它传入方法：

示例源码如下，请查看 pre > code 标签中的内容

修饰符 (modifier) 是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。例如，.prevent 修饰符告诉 @事件对于触发的事件调用 event.preventDefault()：

示例源码如下，请查看 pre > code 标签中的内容

使用修饰符时，顺序很重要；相应的代码会以同样的顺序产生。因此，用 @click.prevent.self 会阻止所有的点击，而 @click.self.prevent 只会阻止对元素自身的点击。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你可以用 v-model 指令在表单 input、textarea 及 select 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 v-model 本质上不过是语法糖。它负责监听用户的输入事件以更新数据，并对一些极端场景进行一些特殊处理。

v-model 会忽略所有表单元素的 value、checked、selected attribute 的初始值而总是将 Vue 实例的数据作为数据来源。你应该通过 JavaScript 在组件的 data 选项中声明初始值。

示例源码如下，请查看 pre > code 标签中的内容

建议开发过程中直接使用 uni-app：表单组件 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

每一个计算属性都包含一个 getter 和一个 setter ，默认是利用 getter 来读取。所有 getter 和 setter 的 this 上下文自动地绑定为 Vue 实例。

在模板中绑定表达式是非常便利的，但是它们实际上只用于简单的操作。在模板中放入太多的逻辑会让模板过重且难以维护。例如：

示例源码如下，请查看 pre > code 标签中的内容

这里是想要显示变量 message 的翻转字符串。当你想要在模板中多包含此处的翻转字符串时，就会更加难以处理。

所以，对于任何复杂逻辑，你都应当使用计算属性。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你可以像绑定普通 property 一样在模板中绑定计算属性。

Vue 知道 reversedMessage 依赖于 message，因此当 message 发生改变时，所有依赖 reversedMessage 的绑定也会更新。而且最妙的是我们已经以声明的方式创建了这种依赖关系：计算属性的 getter 函数是没有副作用 (side effect) 的，这使它更易于测试和理解。

计算属性还可以依赖多个 Vue 实例的数据，只要其中任一数据变化，计算属性就会重新执行，视图也会更新。

在你需要时也可以提供一个 setter 函数， 当手动修改计算属性的值时，就会触发 setter 函数，执行一些自定义的操作。

示例源码如下，请查看 pre > code 标签中的内容

现在再运行 fullName = 'John Doe' 时，setter 会被调用，firstName 和 lastName 也会相应地被更新。

我们可以通过在表达式中调用方法来达到同样的效果：

示例源码如下，请查看 pre > code 标签中的内容

可以将同一函数定义为一个方法而不是一个计算属性。两种方式的最终结果确实是完全相同的。然而，不同的是计算属性是基于它们的响应式依赖进行缓存的。

只在相关响应式依赖发生改变时它们才会重新求值。这就意味着只要 message 还没有发生改变，多次访问 reversedMessage 计算属性会立即返回之前的计算结果，而不必再次执行函数。

这也同样意味着下面的计算属性将不再更新，因为 Date.now() 不是响应式依赖：

示例源码如下，请查看 pre > code 标签中的内容

相比之下，每当触发重新渲染时，调用方法将总会再次执行函数。

我们为什么需要缓存？假设我们有一个性能开销比较大的计算属性 A，它需要遍历一个巨大的数组并做大量的计算。然后我们可能有其他的计算属性依赖于 A。如果没有缓存，我们将不可避免的多次执行 A 的 getter！如果你不希望有缓存，请用方法来替代。

Vue 提供了一种更通用的方式来观察和响应 Vue 实例上的数据变动：侦听属性。当你有一些数据需要随着其它数据变动而变动时，你很容易滥用 watch 。然而，通常更好的做法是使用计算属性而不是命令式的 watch 回调。

示例源码如下，请查看 pre > code 标签中的内容

上面代码是命令式且重复的。将它与计算属性的版本进行比较：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一个对象，键是需要观察的表达式，值是对应回调函数。值也可以是方法名，或者包含选项的对象。Vue 实例将会在实例化时调用 $watch() ，遍历 watch 对象的每一个 property 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

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

## 介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/vue-basics

**Contents:**
- # 介绍
- # vue相比传统js的开发优势
  - # 文件类型变化
  - # 文件内代码架构的变化
  - # 外部文件引用方式变化
  - # 组件/标签的变化
  - # js的变化
- # 在 uni-app 中使用差异
- # 模板语法
  - # 插值

Vue (读音 /vjuː/，类似于 view) 是一套用于构建用户界面的渐进式框架。Vue 被设计为可以自底向上逐层应用。

Vue.js 使用了基于 HTML 的模板语法，允许开发者声明式地将 DOM 绑定至底层 Vue 实例的数据。所有 Vue.js 的模板都是合法的 HTML，所以能被遵循规范的浏览器和 HTML 解析器解析。

在底层的实现上，Vue 将模板编译成虚拟 DOM 渲染函数。结合响应系统，Vue 能够智能地计算出最少需要重新渲染多少组件，并把 DOM 操作次数减到最少。

Vue.js 的核心是一个允许采用简洁的模板语法来声明式地将数据渲染进 DOM 的系统，只关注视图层，易于上手。所有东西都是响应式的。

我们提供了免费视频教程，在看此文档同时建议结合 vue入门视频教程 ，帮助你更加快速掌握。

本文大部分内容来源于vue官网，但结合 uni-app 做了部分调整，以更有利于开发者快速上手。感谢Vue团队！

在传统开发中，用原生的 JavaScript DOM 操作函数对 DOM 进行频繁操作的时候，浏览器要不停的渲染新的 DOM 树，导致页面看起来非常卡顿。

vue 是单页面应用，使页面局部刷新，不用每次跳转页面都要请求所有数据和 DOM ，这样大大加快了访问速度和提升用户体验。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

js要require进来，变成了对象。 在hello uni-app的 common 目录有一个工具类 util.js ，可以在hello uni-app中搜索这个例子查看。hello uni-app示例代码可从 github 获取。

示例源码如下，请查看 pre > code 标签中的内容

而在这个 util.js 里，要把之前的 function 封装为对象的方法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

css外部文件导入。全局样式，在根目录下的 app.vue 里写入，每个页面都会加载 app.vue 里的样式。

示例源码如下，请查看 pre > code 标签中的内容

另外，vue支持组件导入，可以更方便的封装一个包括界面、js、样式的库。详见

以前是html标签，比如 <div> ，现在是小程序组件，比如 <view> 。

那么标签和组件有什么区别，不都是用尖括号包围起来一段英文吗？

uni-app 参考小程序规范，提供了一批内置组件 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-app 在发布到H5时支持所有vue的语法；发布到App和小程序时，由于平台限制，无法实现全部vue语法，但 uni-app 仍是对vue语法支持度最高的跨端框架。

相比Web平台， Vue.js 在 uni-app 中使用差异主要集中在两个方面：

示例源码如下，请查看 pre > code 标签中的内容

里的内容将会被替代为对应数据对象上msg的值。无论何时，绑定的数据对象上msg发生了改变，插值处的内容都会更新。

迄今为止，在我们的模板中，我们一直都只绑定简单的 property 键值。但实际上，对于所有的数据绑定，Vue.js 都提供了完全的 JavaScript 表达式支持。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

这些表达式会在所属 Vue 实例的数据作用域下作为 JavaScript 被解析。有个限制就是，每个绑定都只能包含单个表达式，所以下面的例子都不会生效。

示例源码如下，请查看 pre > code 标签中的内容

模板表达式都被放在沙盒中，只能访问全局变量的一个白名单：

你不应该在模板表达式中试图访问用户定义的全局变量。

动态地绑定一个或多个属性，或一个组件 prop 到表达式。

示例源码如下，请查看 pre > code 标签中的内容

如果 isButtonDisabled 的值是 null 、undefined 或 false ，则 disabled 甚至不会被包含在渲染出来的 button 元素中。

v-on 指令，它用于监听 DOM 事件。v-on缩写为‘ @ ’，下文简称为 @事件

示例源码如下，请查看 pre > code 标签中的内容

只渲染元素和组件一次。随后的重新渲染，元素/组件及其所有的子节点将被视为静态内容并跳过。

和前端框架中的理解不同，客户端里要实现复用的逻辑，会标记模板节点的状态，添加了 v-once 能保证节点只渲染一次，但是并不一定能优化渲染性能，反而可能会拖慢客户端复用节点时的比对效率。

示例源码如下，请查看 pre > code 标签中的内容

跨端的富文本处理方案详见：https://ask.dcloud.net.cn/article/35772

示例源码如下，请查看 pre > code 标签中的内容

data 必须声明为返回一个初始数据对象的函数（注意函数内返回的数据对象不要直接引用函数外的对象）；否则页面关闭时，数据不会自动销毁，再次打开该页面时，会显示上次数据。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

data数据在template中有2种绑定方式：

示例源码如下，请查看 pre > code 标签中的内容

data数据在script中引用，通过this.的方式。如果在某些methods中this被指向了其他内容，则需要提前把this赋值给另一个变量，比如let that = this。

示例源码如下，请查看 pre > code 标签中的内容

为节约性能，我们将 Class 与 Style 的表达式通过 compiler 硬编码到 uni-app 中，支持语法和转换效果见下：

可以传给 v-bind:class 一个对象，实现动态地切换 class。

也可以在对象中传入更多字段来动态切换多个 class。此外，v-bind:class 指令也可以与普通的 class 共存。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当 isActive 或者 hasError 变化时，class 列表将相应地更新。例如，如果 hasError 的值为 true ，class 列表将变为 static active text-danger。

可以把一个数组传给 v-bind:class，以应用一个 class 列表。

示例源码如下，请查看 pre > code 标签中的内容

注意：以:style=""这样的方式设置px像素值，其值为实际像素，不会被编译器转换。

此外还可以用 computed 方法生成 class 或者 style 字符串，插入到页面中，举例说明：

示例源码如下，请查看 pre > code 标签中的内容

小程序端不支持 classObject 和 styleObject 语法。

示例源码如下，请查看 pre > code 标签中的内容

v-if 指令用于条件性地渲染一块内容。这块内容只会在指令的表达式返回 truthy 值的时候被渲染。 使用 v-else 指令来表示 v-if 的“else 块”。

在 JavaScript 中，truthy（真值）指的是在布尔值上下文中，转换后的值为真的值。所有值都是真值，除非它们被定义为 假值（即除 false、0、""、null、undefined 和 NaN 以外皆为真值）。

示例源码如下，请查看 pre > code 标签中的内容

v-else-if，顾名思义，充当 v-if 的“else-if 块”，可以连续使用：

示例源码如下，请查看 pre > code 标签中的内容

类似于 v-else ，v-else-if 也必须紧跟在带 v-if 或者 v-else-if 的元素之后。

因为 v-if 是一个指令，所以必须将它添加到一个元素上。但是如果想切换多个元素呢？此时可以把一个 template 元素当做不可见的包裹元素，并在上面使用 v-if。最终的渲染结果将不包含 template 元素。

示例源码如下，请查看 pre > code 标签中的内容

v-show 是一个根据条件展示元素选项的指令 。用法大致和 v-if 一样：

示例源码如下，请查看 pre > code 标签中的内容

不同的是带有 v-show 的元素始终会被渲染并保留在 DOM 中。v-show 只是简单地切换元素的 CSS 属性的 display 。

注意，v-show 不支持 template 元素，也不支持 v-else。nvue 页面不支持 v-show。

v-if 是“真正”的条件渲染，因为它会确保在切换过程中条件块内的事件监听器和子组件适当地被销毁和重建。

v-if 也是惰性的：如果在初始渲染时条件为假，则什么也不做，直到条件第一次变为真时，才会开始渲染条件块。

相比之下，v-show 就简单得多，不管初始条件是什么，元素总是会被渲染，并且只是简单地基于 CSS 进行切换，来控制元素的显示和隐藏。

v-for 指令可以实现基于一个数组来渲染一个列表。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你也可以用 v-for 来遍历一个对象的 property。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

类似于 v-if，你也可以利用带有 v-for 的 template 来循环渲染一段包含多个元素的内容。比如：

示例源码如下，请查看 pre > code 标签中的内容

当 Vue 正在更新使用 v-for 渲染的元素列表时，它默认使用“就地更新”的策略。如果数据项的顺序被改变，Vue 将不会移动 DOM 元素来匹配数据项的顺序，而是就地更新每个元素，并且确保它们在每个索引位置正确渲染。

如果列表中项目的位置会动态改变或者有新的项目添加到列表中，并且希望列表中的项目保持自己的特征和状态（如 input 中的输入内容，switch 的选中状态），需要使用 :key 来指定列表中项目的唯一的标识符。

当数据改变触发渲染层重新渲染的时候，会校正带有 key 的组件，框架会确保他们被重新排序，而不是重新创建，以确保使组件保持自身的状态，并且提高列表渲染时的效率。

如不提供 :key，会报一个 warning， 如果明确知道该列表是静态，或者不必关注其顺序，可以选择忽略。

示例源码如下，请查看 pre > code 标签中的内容

在自定义组件上，你可以像在任何普通元素上一样使用 v-for 。

示例源码如下，请查看 pre > code 标签中的内容

当在组件上使用 v-for 时，key是必须的。

可以用@事件监听 DOM 事件，并在触发时运行一些 JavaScript 代码。

示例源码如下，请查看 pre > code 标签中的内容

然而许多事件处理逻辑会更为复杂，所以直接把 JavaScript 代码写在@事件中是不可行的。因此@事件还可以接收一个需要调用的方法名称。

示例源码如下，请查看 pre > code 标签中的内容

除了直接绑定到一个方法，也可以在内联 JavaScript 语句中调用方法：

示例源码如下，请查看 pre > code 标签中的内容

有时也需要在内联语句处理器中访问原始的 DOM 事件。可以用特殊变量 $event 把它传入方法：

示例源码如下，请查看 pre > code 标签中的内容

修饰符 (modifier) 是以半角句号 . 指明的特殊后缀，用于指出一个指令应该以特殊方式绑定。例如，.prevent 修饰符告诉 @事件对于触发的事件调用 event.preventDefault()：

示例源码如下，请查看 pre > code 标签中的内容

使用修饰符时，顺序很重要；相应的代码会以同样的顺序产生。因此，用 @click.prevent.self 会阻止所有的点击，而 @click.self.prevent 只会阻止对元素自身的点击。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你可以用 v-model 指令在表单 input、textarea 及 select 元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素。尽管有些神奇，但 v-model 本质上不过是语法糖。它负责监听用户的输入事件以更新数据，并对一些极端场景进行一些特殊处理。

v-model 会忽略所有表单元素的 value、checked、selected attribute 的初始值而总是将 Vue 实例的数据作为数据来源。你应该通过 JavaScript 在组件的 data 选项中声明初始值。

示例源码如下，请查看 pre > code 标签中的内容

建议开发过程中直接使用 uni-app：表单组件 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

每一个计算属性都包含一个 getter 和一个 setter ，默认是利用 getter 来读取。所有 getter 和 setter 的 this 上下文自动地绑定为 Vue 实例。

在模板中绑定表达式是非常便利的，但是它们实际上只用于简单的操作。在模板中放入太多的逻辑会让模板过重且难以维护。例如：

示例源码如下，请查看 pre > code 标签中的内容

这里是想要显示变量 message 的翻转字符串。当你想要在模板中多包含此处的翻转字符串时，就会更加难以处理。

所以，对于任何复杂逻辑，你都应当使用计算属性。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你可以像绑定普通 property 一样在模板中绑定计算属性。

Vue 知道 reversedMessage 依赖于 message，因此当 message 发生改变时，所有依赖 reversedMessage 的绑定也会更新。而且最妙的是我们已经以声明的方式创建了这种依赖关系：计算属性的 getter 函数是没有副作用 (side effect) 的，这使它更易于测试和理解。

计算属性还可以依赖多个 Vue 实例的数据，只要其中任一数据变化，计算属性就会重新执行，视图也会更新。

在你需要时也可以提供一个 setter 函数， 当手动修改计算属性的值时，就会触发 setter 函数，执行一些自定义的操作。

示例源码如下，请查看 pre > code 标签中的内容

现在再运行 fullName = 'John Doe' 时，setter 会被调用，firstName 和 lastName 也会相应地被更新。

我们可以通过在表达式中调用方法来达到同样的效果：

示例源码如下，请查看 pre > code 标签中的内容

可以将同一函数定义为一个方法而不是一个计算属性。两种方式的最终结果确实是完全相同的。然而，不同的是计算属性是基于它们的响应式依赖进行缓存的。

只在相关响应式依赖发生改变时它们才会重新求值。这就意味着只要 message 还没有发生改变，多次访问 reversedMessage 计算属性会立即返回之前的计算结果，而不必再次执行函数。

这也同样意味着下面的计算属性将不再更新，因为 Date.now() 不是响应式依赖：

示例源码如下，请查看 pre > code 标签中的内容

相比之下，每当触发重新渲染时，调用方法将总会再次执行函数。

我们为什么需要缓存？假设我们有一个性能开销比较大的计算属性 A，它需要遍历一个巨大的数组并做大量的计算。然后我们可能有其他的计算属性依赖于 A。如果没有缓存，我们将不可避免的多次执行 A 的 getter！如果你不希望有缓存，请用方法来替代。

Vue 提供了一种更通用的方式来观察和响应 Vue 实例上的数据变动：侦听属性。当你有一些数据需要随着其它数据变动而变动时，你很容易滥用 watch 。然而，通常更好的做法是使用计算属性而不是命令式的 watch 回调。

示例源码如下，请查看 pre > code 标签中的内容

上面代码是命令式且重复的。将它与计算属性的版本进行比较：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一个对象，键是需要观察的表达式，值是对应回调函数。值也可以是方法名，或者包含选项的对象。Vue 实例将会在实例化时调用 $watch() ，遍历 watch 对象的每一个 property 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

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

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-for-ios.html

**Contents:**
- # uts for iOS
- # 1 了解 UTS 插件是什么
- # 2 掌握UTS语法
  - # 2.1 对于掌握 swift 语言者
  - # 2.2 对于仅掌握objective-c语言者
  - # 2.3 数据类型差异
    - # 举例一： Int、Float、Double 和 Number
- # 3 iOS 原生环境配置
  - # 3.1 配置 Info.plist
  - # 3.2 配置 entitlements

本文旨在帮助 iOS 开发者，快速上手 UTS。

需要阅读者具备 iOS 原生应用开发经验。

UTS 插件是 uni-app 新型插件形式 详情

对于 iOS 开发者来说，我们需要了解的是：

因为 UTS 语法与 swift 较类似，建议快速阅读后，在实践中掌握 UTS 语法。uts语法介绍。

尽管开发 UTS 插件，并不要求一定掌握 swift，但是鉴于 UTS 目前在 iOS 平台上，会编译为 swift 源码，掌握 swift 语言，方便排查问题和复杂功能实现。

因此建议学习一下 swift 语法，推荐阅读

UTS 和 swift 在数据类型上基本保持了一致，但是在部分场景下，还是会有差异，在此特别说明

数据类型以 UTS 内置的类型为准， 各原生平台都会对其自动适配。

当具体平台的 api 参数无法使用 UTS 类型兼容时，允许以对方明确要求的数据类型为准。

UTS 中不存在 Int、Float、Double 类型开发者在开发过程中应该使用 Number 类型覆盖 iOS 平台上使用 Int、Float、Double 的场景

但是当开发中需要重写系统方法或实现第三方依赖库的协议方法（delegate 方法）时，比如 API 明确要求参数为 Int 时，则需要写原生的类型 Int

下面以一个协议方法为例，需要实现一个三方依赖库中定义的协议方法

示例源码如下，请查看 pre > code 标签中的内容

我们在 UTS 中需要实现上面三方库中的协议方法时，由于参数和返回值类型都要求是 Int 类型，为了适应这种情况，UTS 允许开发者使用原生平台的数据类型 Int，来满足原生 API 对数据类型的要求：

示例源码如下，请查看 pre > code 标签中的内容

注意：UTS 中使用 implements 关键字表示遵循某个协议，下文会有详细说明

对于 iOS 项目来说，除了源码之外，还会涉及依赖，资源，工程配置等常见问题

本章节将会介绍，UTS插件开发环境中如何配置这些属性

当插件需要在原生工程 Info.plist 中添加配置项时，需要在插件的 app-ios 目录中创建 Info.plist 文件

以 hello uts 中的 uts-tencentgeolocation 腾讯定位插件中的配置文件为例:

示例文件在 hello uts 中的位置：

~/uni_modules/uts-tencentgeolocation/utssdk/app-ios/Info.plist

此示例表示需要在 Info.plist 中配置 APIKey 及开启后台定位权限

示例源码如下，请查看 pre > code 标签中的内容

Info.plist 格式及配置规则与 iOS 工程中是一致的，云端打包时会将配置信息合并到原生工程的 Info.plist 中

HBuilder X 3.6.11+ 版本支持

当插件需要开启 capabilities 中的相关服务时，需要在插件的 app-ios 目录中创建 UTS.entitlements 文件

比如需要在 capabilities 中勾选 Access WiFi Information 项，对应的 UTS.entitlements 的配置示例：

示例源码如下，请查看 pre > code 标签中的内容

UTS.entitlements 格式及配置规则与 iOS 工程中是一致的，云端打包时会将配置信息合并到原生工程的 entitlements 配置文件中

如果您的插件需要依赖资源文件比如图片，音频等，可将资源文件放到插件目录下 ~/utssdk/app-ios/Resources/路径中

云端打包时会将此目录下的所有文件添加到应用 main bundle 中，建议只保存 uts 插件内置的资源文件。

uts 插件支持依赖三方库，目前支持 framework、xcframework、.a库

需要将依赖的framework或者xcframework文件存放到插件目录下 ~/utssdk/app-ios/Frameworks/路径中

云端打包时会将此目录中所有的依赖库添加到工程中，建议只存放与插件相关的依赖库

以 hello uts 中的 uts-tencentgeolocation 腾讯定位插件为例，本插件需要依赖腾讯定位库 TencentLBS.framework，则将依赖库存放到 ~/uni_modules/uts-tencentgeolocation/utssdk/app-ios/Framework/TencentLBS.framework 位置即可

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

有些第三方的 SDK 使用 OC 语言开发，且产物 .framework 文件里不包含 Moudules 文件夹。这就造成该 SDK 不支持 use module 模式，不能直接在 Swift 文件中导入。 这样的 SDK 不能直接被 uts 插件引用，需要做以下处理：

如果你有 SDK 的源码，那么有以下几种方法可以生成 Modules。 以名称为 TestSDK 的 framework 为例：

通过创建和 SDK 的 target 同名的头文件方式：

通过自定义 Module Map 的方式：

示例源码如下，请查看 pre > code 标签中的内容

如果使用的是第三方非开源的 SDK, 那么可以使用下面的方式来生成 Modules: 以 TestSDK 为例：

注意： 实践时要将 TestSDK 改成你要操作的 SDK 名称，.h 文件也要改成你要暴露的头文件名字。

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

DCloudUTSFoundation 为框架内置库，所有 uts 插件都会依赖此基础库

DCloudUTSFoundation 会封装一些常用方法便于开发者直接调用

使用时需要在 uts 文件中先导入 UTSiOS 类，所有方法都通过 UTSiOS 类调用

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

获取当前 app 显示的 UIViewController 实例

以 hello uts 中的 uts-alert 为例：

示例文件在 hello uts 中的位置：

~/uni_modules/uts-alert/utssdk/app-ios/index.uts

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

插架资源路径请传该资源在工程目录下的绝对路径

示例源码如下，请查看 pre > code 标签中的内容

至此我们认为你已经掌握了UTS语法，掌握了基本的 swift 语法，掌握了 UTS 对于 iOS 资源的支持。

但是对于一个熟悉 iOS 开发的 swift 语言者来说，有很多常用的习惯发生了改变，我们会在这个章节特别指出，便于开发者加深认识。

swift 中用 let 来声明常量，用 var 来声明变量

示例源码如下，请查看 pre > code 标签中的内容

uts中用 const 来声明常量，用 let 来声明变量

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uts 中可选类型的定义为 类型 | null

示例源码如下，请查看 pre > code 标签中的内容

swift 中调用构造方法创建实例对象时不需要使用 new 关键字

示例源码如下，请查看 pre > code 标签中的内容

uts 中调用构造方法实例化对象时需要在构造方法前加上 new 关键字

示例源码如下，请查看 pre > code 标签中的内容

在 swift 中参数名称使用 : 连接参数值，在 uts 中需要使用 = 连接

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

枚举在 swift 中可以忽略枚举类型直接简写 .枚举值 ，在 uts 中不支持简写，需要完整的写出 枚举类型.枚举值 上面的示例中 swift 中最后一个参数 preferredStyle 的值可以简写为

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

枚举在 swift 中可以定义关联类型，可在关联值中传递信息，但是在 ts 中没有这种语法，所以目前 uts 还暂不支持此种用法。

示例源码如下，请查看 pre > code 标签中的内容

如果遇到上述类型的枚举，且在三方库中无法改动的，可以在 Swift 文件中进行调用，然后把 该 Swift 文件打包在 framework 中供 uts 插件使用； 如果上述类型的枚举定义在有源码的 swift 中时，可以将其定义成不包含关联值的枚举，然后使用合适的数据结构来表示关联值携带的信息。

swift 中定义子类继承父类时需要在子类名称后加上父类名称，中间以冒号:分隔

示例源码如下，请查看 pre > code 标签中的内容

uts 中需要使用extends关键字代替冒号:

示例源码如下，请查看 pre > code 标签中的内容

swift 中要让自定义类型遵循某个协议，在定义类型时，需要在类型名称后加上协议名称，中间以冒号:分隔。遵循多个协议时，各协议之间用逗号,分隔：

示例源码如下，请查看 pre > code 标签中的内容

uts 中需要使用implements关键字代替冒号 :

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 uts 中不支持这种语法可使用下面方式代替

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uts 中不支持简写语法，需要完整的写出闭包函数

示例源码如下，请查看 pre > code 标签中的内容

原生中有些方法的闭包参数是逃逸闭包，此时就要在闭包前面添加 @escaping 标记：

示例源码如下，请查看 pre > code 标签中的内容

uts 中调用原生中涉及 target-action 的方法时，比如给UIButton添加点击事件方法、注册通知中心事件方法时注意事项，

示例文件在 hello uts 中的位置：

~/uni_modules/uts-screenshot-listener/utssdk/app-ios/index.uts

示例源码如下，请查看 pre > code 标签中的内容

swift 中的 Dictionary 类型，在 uts 中使用 Map 类型代替

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 3.6.11+ 版本支持

当覆写系统方法，或实现三方SDK的协议方法时，一些方法可能会存在参数标签的情况

以 hello uts 中腾讯定位为例，监听位置变化时需要实现协议方法：

tencentLBSLocationManager(_ manager: TencentLBSLocationManager, didUpdate location: TencentLBSLocation)

此方法第二个参数存在 didUpdate 参数标签

示例源码如下，请查看 pre > code 标签中的内容

uts 中需要用注解语法 @argumentLabel("didUpdate") 来表示参数标签

示例源码如下，请查看 pre > code 标签中的内容

示例文件在 hello uts 中的位置：

~/uni_modules/uts-tencentgeolocation/utssdk/app-ios/index.uts

只写参数名称的参数，编译后会在参数前默认增加 _ 来忽略参数标签（如上面的示例，第一个参数 manager，这种方式能兼容绝大多数方法，尤其是Swift 调用 OC 方法），但是有些参数没有参数标签，默认添加 _ 的行为会和原生方法定义不一致，这种情况需要定义一个空的参数标签来解决 @argumentLabel("didUpdate")

以高德定位 SDK 的代理方法为例：第三个参数 reGeocode 只有参数名称，没有参数标签

示例源码如下，请查看 pre > code 标签中的内容

uts 实现此方法时，需要给 reGeocode 参数添加一个空的参数标签

示例源码如下，请查看 pre > code 标签中的内容

swift 标记某个函数或者方法是异步的，你可以在它的声明中的参数列表后边加上 async 关键字

示例源码如下，请查看 pre > code 标签中的内容

uts 中定义异步方法是在方法最前面加上 async 关键字

示例源码如下，请查看 pre > code 标签中的内容

需要注意：使用 async 定义异步方法只有 iOS 13+ 版本才支持，低版本调用会报错

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

为了满足Swift上述语法，UTS使用特殊语法来支持，以上三种写法分别对应为：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HBuilder X 4.06+ 版本支持

swift 中有一些特有的属性、方法、类的修饰符如 open, fileprivate, internal, weak, optional 等，这些修饰符在 ts 中没有对应的替代者，但是在原生语法场景下又是必须的。 为了支持这些修饰符，我们提供了 UTSiOS.keyword("xxx") 的语法糖。你可以在符合 swift 语法要求的场景下，使用诸如 UTSiOS.keyword("private") 这样的语法来修饰对应的属性、方法、类等。 我们对具体的修饰符没有做特别的限制，swfit 中的合法修饰符都能通过这个语法糖来使用，但是请记住一个重要的前提：你所使用的修饰符，需要满足 swift 语法所要求的场景。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在Swift操作指针，需要用到&操作符隐式转换得到UnsafePointer类型，UTS中提供了UTSiOS.getPointer()来表示&符号。

示例源码如下，请查看 pre > code 标签中的内容

其中UTSiOS.getPointer(digest)编译后会变成&digest

参考 Hello UTS 项目中的 uts-alert 插件

~/uni_modules/uts-alert/utssdk/app-ios/index.uts

示例源码如下，请查看 pre > code 标签中的内容

参考Hello UTS项目中的 uts-toast 插件

~/uni_modules/uts-toast/utssdk/app-ios/index.uts

由于在uts插件环境，无法默认推断出类型，所以需要显示类型，以uni.request()为例：

示例源码如下，请查看 pre > code 标签中的内容

在 uts 插件中通过 export 导出给 js 用的 class, 创建出的 class 实例会被一直保存在内存中，如果不主动销毁，可能会造成 内存泄漏的问题。我们在 UTSiOS 类型上提供了 destroyInstance() 的静态方法来实现销毁原生对象的功能。开发者需要在使用这个对象的页面的 unmounted() 时机将对象销毁。

HBuilder X 4.25+ 版本支持

在 uts 插件中定义 class Test，并将其 export：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在 uvue 页面 unmounted 时销毁对象：

示例源码如下，请查看 pre > code 标签中的内容

在 uts 插件或者组件中，如果自定义的 class 中定义了闭包类型的属性，而闭包内部又使用了 class 的其他属性或者 class 自身， 就会造成对象循序引用，导致内存泄漏。为避免产生循环引用我们需要在闭包内使用 "[weak self]" 标记。

示例源码如下，请查看 pre > code 标签中的内容

上述示例中，自定义类 Test 中持有一个 callback 的闭包属性，而 callback 闭包实现中有引用了 this.name，这就导致了循环引用。 因此在 callback 闭包体的最开头部分使用了 "[weak self]" 标记，避免产生循环引用。

使用 "[weak self]" 标记以后，this 就变成了可为空的值，访问标记后的 this 的任何属性和方法都要使用可选链或者做非空断言。

判断是否需要加 "[weak self]" 标记的标准是：callback 是否被 this 持有，闭包内是否访问了 this，如果满足这两条就需要加。

在iOS 16.0及以上，Shortcuts需要集成Apple AppIntents.framework, 实现AppShortcutsProvider子类YourAppShortcutsProvider，App Intents 会在app编译阶段通过自动分析YourAppShortcutsProvider中的appShortcuts值，自动将其 “抽取成元数据（representation）并嵌入到 App 包里”，系统在运行时读取这份元数据来知道你的意图与快捷方式，而不是运行时去反射源代码，所以目前仅仅通过uts插件无法实现shortcuts功能，需要通过离线打包的形式（原生工程实现AppShortcutsProvider源码）+uts插件（hook声明周期）配合实现该功能

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

请通过uts和swift混编的形式，或者使用uts实现下属app内捐赠NSUserActivity逻辑，就可以在该hook app生命周期代理方法中捕获自定义的shortcuts活动

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 目前写iOS uts 插件时部分语法提示会有缺失、参数类型不准确的问题，例如：

特别注意 如果在使用真机运行编译uts插件时报 swift 版本不兼容的错误，请先检查自己的 XCode 版本，确保安装XCode 版本应大于或者等于打包机的 XCode版本； 如果在使用真机运行编译uts插件时报 XCode 版本应大于 13.2.1的错误，这是说明本地安装的 XCode版本过低，请忽略 13.2.1这个版本限制，直接将本地 XCode升级到大于或者等于打包机的版本，后续我们会优化提示。

**Examples:**

Example 1 (unknown):
```unknown
objective-c
```

Example 2 (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

Example 3 (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

Example 4 (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/resource.html

**Contents:**
    - # 如果你熟悉h5，但不熟悉vue和小程序
    - # 如果你熟悉小程序，但不熟悉vue
    - # 三方培训机构视频
    - # uni-app相关书籍
    - # uniCloud的学习资料
    - # 关于各端的管理规则需要耐心学习
    - # uni-app的底层框架实现原理及优化策略（高级）
      - 本页导读

建议第一步，看完uni-app官网 的首页介绍。

建议第二步，通过快速上手 ，亲身体验下uni-app。

参考三方总结https://segmentfault.com/a/1190000015684864

目前各大视频学习网站都有不少uni-app的学习资源：

北京大学出版社：uni-app跨平台开发与应用，从入门到实践

清华大学出版社：Vue.js核心技术解析与uni-app跨平台实战开发

中国铁道出版社：移动应用开发——基于UNI-APP框架

中国水利水电出版社：保姆级uni-app多端跨平台开发从入门到企业级实战

如果你是线下培训机构，想开课合作，联系bd@dcloud.io

欢迎更多人分享学习经验，可转载到社区 ，优秀的文章我们会收录在本文中。

掌握uniCloud，进阶全栈，详见：https://uniapp.dcloud.io/uniCloud/learning

uni-app并不难学，但我们注意到很多新人在适应各个平台的规则限制时比较急躁。

每个端，有每个端的管理规则，这不是uni-app在技术层面上可以抹平的：

遇事耐心，不急不躁，虽然这不是成功的唯一要素，但它是你技术路上长远走下去的基础。

通过评测对比 ，我们知道uni-app的性能比其他小程序开发框架好，但底层原理是什么？ 这篇视频就是讲解uni-app框架底层的实现思路和优化策略：《uni-app框架如何实现高性能》

---

## 什么是 uni ext api | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/extapi.html

**Contents:**
- # 什么是 uni ext api
- # 注意事项
- # 如何开发uni ext api
  - # 创建一个符合规则的uni_modules插件（通常是utssdk类型），如uni-getbatteryinfo
  - # 配置package.json
- # 如何使用uni ext api
      - 本页导读

uni ext api，是一种需要下载uni_modules 插件才能使用的、uni.开头的js API。

它是uni对象的方法，但不预置在uni-app的runtime中，需要单独下载对应的uni_modules。

uni.getBatteryInfo，这个API就是一个ext api，需要下载插件才能使用。详见

uni对象的api，如uni.navigateTo，之前都是内置在uni-app的runtime中的，跟随uni-app/HBuilder的升级而变化。

随着各家小程序和uni-app的演进，uni-app的api越来越多，而很多api又不常用，这会增加uni-app的runtime体积，尤其是在web和app平台。

比如很多小程序都内置有getBatteryInfo获取电量的API，在uni-app中理应拉齐各端实现，但在uni-app的web和app上内置它并不合适。

所以推出了uni ext api，这些API以uni_modules的方式出现，从插件市场单独下载。但导入到工程后，仍使用uni.getBatteryInfo方式来调用。

为此，在这些uni_modules的package.json中提供了一种特殊的注册方式，允许插件向uni对象自动挂载api。（只有DCloud官方插件，以uni-开头的插件，才能使用此机制）

在过去，uni-app的web和小程序端，是github的独立项目，由DCloud的js团队维护。而uni-app的app端，是另2个独立项目，由DCloud的原生团队维护。 每次新加一个api，需要各个团队在不同的工程里开发，尤其是app端，需要先在原生项目里开发，然后在前端项目里封装。还需要再另一个语法提示工程中编写代码提示。

有了uts后，uni-app的实现机制将被重构，大幅的简化。

每个api，都使用uts这门统一的语言来开发，不再使用不同的技术语言。作为一个独立的uni_modules，独立的工程，有独立的版本。

仍然以uni.getBatteryInfo电量为例，开发这个api，不再需要在庞大复杂的uni-app的若干个项目里编码，也不需要再关心功能间关联和耦合。

只需要在uni-getBatteryInfo这个uni_modules下开发，目录结构如下。

这个目录清晰的列出了这个插件要做的所有事情：在不同的目录下编写uts或js代码、在d.ts里写语法提示。

示例源码如下，请查看 pre > code 标签中的内容

这种模式，还给开发者带来若干好处，比如开放性和灵活性。

现在，在uts的支持下，普通前端也可以review这些api的实现，发现其中的问题和提出改进方案。

现在，ext api的uni_modules脱离HBuilder独立升级，快速解决开发者的问题。并且开发者可以自己修本地工程中ext api的bug。让问题得以更快速的解决。

很多uni的内置api，比如uni.showWaiting，实现的比较简单，在web端，常见的waiting都有更丰富的样式、使用更多的图片资源。

uni-app的runtime不适合内置很多waiting样式和资源，而使用三方插件，又需要按三方插件的写法调用，之前工程里写好的uni.showWaiting的代码不得不重改。

有了ext api，可以实现一个uni-showwaiting的uni_modules，在web端提供更丰富的效果，并且开源，可自由裁剪和增补。

导入这个uni_modules后，之前的uni.showWaiting的api的功能就被复写。

综上，背景1、2、3的问题，都将使用uni ext api来解决。uni-app很多新增的、不常用的api将采用ext api方式。

在uts的发展路线上，uni-app自身也将使用uts实现；使用uts将可以开发完整的uni-app。

目前所有的ext api，在未来的uts版的uni-app，其内置的uni对象的api中，均会得到复用。也就是说ext api将大幅推进下一代uni-app（纯uts版）的上线速度。

欢迎广大开发者参与到uni ext api的开源共建中来。

参与共建的开发者需要在DCloud官方插件的开源项目中提pr，由官方审核后再发布新版uni_modules。

也只有uni-开头的插件，才能在package.json中编写注册声明，挂载方法到uni对象上。

只有uni的内置api才跟随HBuilder升级。请记得内置api和ext api的区别。

注意： 插件ID格式为：uni-API名称全小写

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

所有 uni ext api 均需要提供 utssdk/interface.uts 文件

所有对外暴露的方法，类型均需要在 interface.uts 中定义

在具体平台实现中，通过引用 interface.uts 中的定义的方法，类型来约束实现

声明对象字面量时，必须指定具体类型，如：const res:GetBatteryInfoSuccess = { level:10,.. }

如 uni.getBatteryInfo(options)，则 options 类型命名为：type GetBatteryInfoOptions = {}

如 uni.getBatteryInfo() 的 success,fail 回调结果类型为：type GetBatteryInfoSuccess = {} 和 type GetBatteryInfoFail = {}

如 uni.onUserCaptureScreen 的 callback 回调结果类型为：type OnUserCaptureScreenCallbackResult = {}

HBuilderX3.96及以下使用uni ext api后，云打包同时勾选android和iOS会导致打出来的包不能正确包含uni ext api插件，解决方案：升级至3.97+或android和iOS单独打包

在插件市场 查找uni ext api插件，导入HBuilderX中的项目即可直接使用。

如：uni-getbatteryinfo ，导入后，即可直接使用uni.getBatteryInfo

**Examples:**

Example 1 (unknown):
```unknown
uni_modules
```

Example 2 (unknown):
```unknown
getBatteryInfo
```

Example 3 (unknown):
```unknown
uni ext api
```

Example 4 (unknown):
```unknown
uni_modules
```

---

## 什么是datacom | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/datacom.html

**Contents:**
- # 什么是datacom
- # 什么是datacom组件规范
- # datacom对于开发者的好处
- # datacom组件规范
  - # 数据结构规范
  - # 数据绑定规范
  - # 组件属性规范
    - # 分步查询属性规范
    - # 弹出类属性规范
- # datacom的局限

datacom，全称是data components，数据驱动的组件。

这种组件也是vue组件，是一种子类，是基础组件的再封装。

相比于普通的vue组件，datacom组件的特点是，给它绑定一个data，data中包含一组候选数据，即可自动渲染出结果。

比如 uni-data-checkbox 组件，给它绑定一个data，即可直接生成一组选择框。

示例源码如下，请查看 pre > code 标签中的内容

而使用基础组件的写法，代码量则要增加很多，如下：

示例源码如下，请查看 pre > code 标签中的内容

显然，datacom组件不是只有一个<uni-data-checkbox>，radio、check、select、picker、segement、tree...还有很多组件都可以成为datacom组件，变成类似<uni-data-picker>。

那么“datacom组件规范”，就定义了什么是datacom组件，以及它们的互联互通标准。

所有开发者，都可以在 DCloud插件市场 提交符合datacom组件规范的组件。在插件市场组件分类下可以找到所有已上传的datacom组件，详见

datacom组件，对服务器数据规范、前端组件的数据输入和输出规范，做了定义。它提升了产业的标准化程度、细化了分工，提升了效率。

且不论产业影响，对开发者个人而言，显而易见的好处也很多：

举个例子，假使我们想实现一个城市选择的业务。

datacom组件接受的数据结构，包含了“数组”和“树”两种数据结构规范。

data数据是一组可循环的数据集合。数组中每条数据如下基本key：

如果熟悉html的<select>标签的话，其<option>标签的属性也是value、text、selected。

除了这些基本key，开发者也可以自由扩展key。比如电影票、机票、火车票的选座，都需要扩展额外的信息：行、列、单元格类型（座位或过道）等。

完整的 JSON Schema 定义详见：https://gitee.com/dcloud/datacom/blob/master/array.schema.json

示例源码如下，请查看 pre > code 标签中的内容

组件示例：uni-data-checkbox

示例源码如下，请查看 pre > code 标签中的内容

data数据是可遍历嵌套的数据集合。数组中每条数据如下基本key：

完整的 JSON Schema 定义详见：https://gitee.com/dcloud/datacom/blob/master/tree.schema.json

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

datacom组件 的data，可以来自页面本地，即localdata；也可以直接指定uniCloud的云数据库查询结果，即指定collection表名、field字段名、where条件，这些写法与unicloud-db组件的写法相同，如果localdata和collection同时存在，优先使用localdata。

localdata的示例上文已经举例，下面来看下直接指定uniCloud云数据库查询的写法。

示例源码如下，请查看 pre > code 标签中的内容

collection表名、field字段名、where条件的写法，详见clientDB组件文档

当然，支持绑定uniCloud数据，对于datacom组件规范来说，是可选的。

更为常见的场景，是在整个页面组件外围套一个clientDB组件，一次性查库，把查询结果的data分拆赋值给不同的datacom组件。

datacom组件规范还要求支持绑定 value，且支持双向绑定，即：支持v-model指令。这同时也是为了uni-forms的表单校验。

当datacom组件的data来自uniCloud的云数据库或cdn等云端，且数据量较大时，我们通常可以选择分步查询来优化用户体验，如以下场景：

datacom组件为分步查询云端数据，设计了以下组件属性、事件：

datacom组件为弹出类组件，设计了以下组件属性、事件：

选择类组件很多，基本逻辑都是在指定的数据范围内，选择其中的一个或多个。

这里列一下常见的选择类组件，以及它们按不同维度的分类，有助于更透彻的理解它们的本质

欢迎开发者们开发这些datacom组件。插件市场提供了datacom组件专区 ，给予更高的显示权重。

版本要求：HBuilderX 3.1.0+

开发一个支持localdata的datacom组件相对容易，但要开发支持云端数据的datacom组件，实现对collection、field、where等属性的解析，工作量还是不小的。

为此官方提供了一个mixin混入库，开发者在自己的datacom组件中混入uniCloud.mixinDatacom，即可方便的让自己的组件支持本地和云端的数据绑定，快速完成datacom组件。

mixin是vue的技术，不熟悉的可以点此了解vue官网的mixin文档

uniCloud.mixinDatacom 的props

与标准的datacom组件相同，除了localdata外，其他都是uniCloud-db组件的标准属性。

uniCloud.mixinDatacom 的data

uniCloud.mixinDatacom methods

使用 uniCloud.mixinDatacom 开发 datacom 组件需要以下步骤

使用 uniCloud.mixinDatacom 开发 datacom 组件的优势

例如要开发一个datacom组件，名为uni-data-jql：

示例源码如下，请查看 pre > code 标签中的内容

需要多写些代码处理各种状态。如果mixinDatacomEasyGet的封装无法灵活满足你的需求，可以使用这种方式。

示例源码如下，请查看 pre > code 标签中的内容

做好这个uni-data-jql组件后，就可以在页面中使用了：

示例源码如下，请查看 pre > code 标签中的内容

为方便开发者理解mixinDatacom的工作原理，这里贴出mixinDatacom的源码：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
data components
```

Example 2 (html):
```html
<template>
    <!-- 传入符合 datacom 规范的数据，即可渲染出一组 checkbox -->
    <!-- 使用 v-model 双向绑定 checkbox 的选中值 -->
    <uni-data-checkbox v-model="value" :localdata="options" multiple></uni-data-checkbox>
</template>
<script>
  export default {
    data() {
      return {
        value: ['sh'],
        options: [
          {value: 'bj',text: '北京'},
          {value: 'sh',text: '上海'},
          {value: 'gz',text: '广州'}
        ],
      };
    },
  };
</script>
```

Example 3 (html):
```html
<template>
    <!-- 传入符合 datacom 规范的数据，即可渲染出一组 checkbox -->
    <!-- 使用 v-model 双向绑定 checkbox 的选中值 -->
    <uni-data-checkbox v-model="value" :localdata="options" multiple></uni-data-checkbox>
</template>
<script>
  export default {
    data() {
      return {
        value: ['sh'],
        options: [
          {value: 'bj',text: '北京'},
          {value: 'sh',text: '上海'},
          {value: 'gz',text: '广州'}
        ],
      };
    },
  };
</script>
```

Example 4 (html):
```html
<template>
    <!-- 传入符合 datacom 规范的数据，即可渲染出一组 checkbox -->
    <!-- 使用 v-model 双向绑定 checkbox 的选中值 -->
    <uni-data-checkbox v-model="value" :localdata="options" multiple></uni-data-checkbox>
</template>
<script>
  export default {
    data() {
      return {
        value: ['sh'],
        options: [
          {value: 'bj',text: '北京'},
          {value: 'sh',text: '上海'},
          {value: 'gz',text: '广州'}
        ],
      };
    },
  };
</script>
```

---

## 概述 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/unipush

**Contents:**
- # 概述
  - # 什么是push（推送服务）？
  - # 产品介绍
  - # 应用场景
  - # 技术架构
  - # 名词解释
  - # 消息推送流程
- # 产品版本
- # 注意事项
  - # 推送通道选择逻辑

uni-push 是 DCloud 联合个推公司推出的集成型统一推送服务，是所有uni-app开发者首选的推送服务。在介绍uni-push 之前，我们先来了解一下什么是push（推送服务）。

push（推送服务），是指服务器主动向客户端发送消息的技术。无需客户端持续轮询服务器，即可获得即时数据。

手机的通知栏、小程序的订阅消息都是一种push，由手机操作系统或微信在底层提供了push通道，屏蔽了轮询的各种弊端。你的应用可以被关闭，只要手机有网，操作系统提供的push通道即是实时在线的。

提醒：web浏览器的webnotification其实是一个本地通知栏功能，浏览器厂商没有提供push通道。

当客户端在线时，push通过socket协议实现。当客户端离线时，服务器找不到客户端，开发者无法自己实现推送，只能依托手机操作系统、小程序底层提供的离线消息推送，调用指定的手机厂商或小程序厂商的服务器接口来发送消息。

所以一个push系统需要3部分协作：开发者的业务服务器 + 专业push服务器 + 开发者的客户端应用。

uni-push 是 DCloud 联合个推公司推出的集成型统一推送服务，内建了苹果、华为、小米、OPPO、VIVO、魅族、谷歌 FCM 等手机厂商的系统级推送和个推等第三方推送。

国内Android的Push是一个混乱的世界，因为 Google 的 Push 服务 FCM 被墙，所以一些国内的安卓手机厂商各自做了自己的推送，比如华为、小米、OPPO、VIVO、魅族等，但还有很多国产手机厂商没有提供官方推送方案。三方独立公司如个推，则提供了独立的 push 方案。 在没有 uni-push 以前，如果只使用三方 push，会在很多国产手机上因为节电设置而无法保活 push 进程，导致无法推送。 而如果每个安卓手机的官方 Push SDK 都集成开发一遍，这么多平台，工作量会非常巨大，管理维护也很麻烦。

uni-push 解决了这个难题，开发者只需要开发一次。系统会自动在不同手机上选择最可靠的推送通道发送 push 消息，保障送达率。

uni-push 即降低了开发成本、又提高了 push 送达率，并且免费，是当前推送的最佳解决方案。

用户消息通知 当 APP 用户相关状态或者系统功能状态变化时（如用户订单通知、交易提醒、物流通知、升级提醒、社交互动提醒等），可对用户进行及时告知，或者促使用户完成特定操作。

离线语音播报 它也是一种用户消息推送，实现原理其实是自定义通知提醒铃声

营销促活通知 在日常营销推广、促销活动等场景下（如双11大促、产品上新、重要资讯等），APP可对目标用户进行定向通知栏消息+应用内消息推送，吸引用户参与活动，提升日活。

基于uniCloud的IM、聊天、客服、棋牌游戏交互等 例如：DCloud基于uni-push 2.0开发并开源了uni-im，详情：https://doc.dcloud.net.cn/uniCloud/uni-im.html 另外棋牌游戏等，需要客户端被动接收消息的需求都可以用uni-push实现。

uni-push 当前有2个版本，分别是uni-push 1.0和uni-push 2.0。uni-push 2.0是DCloud推出的、全端的(App、小程序、Web)、云端一体的统一推送服务，推荐开发者优先选择uni-push 2.0。

Android平台 APP在线（个推推送通道可用） 推送通知和透传消息都使用个推的推送通道下发推送消息。 APP离线（个推推送通道不可用） 推送通知，使用个推离线推送通道，离线消息会存储在消息离线库，离线时间内APP在线后下发推送消息。 透传消息，如果符合厂商推送的厂商手机（配置了手机厂商推送参数并且在对应厂商的手机上），则使用厂商推送通道下发推送消息；否则使用个推的离线推送通道，离线消息会存储在消息离线库，离线时间内APP在线后下发推送消息。

iOS平台 推送通知，uni-push后台管理界面中不支持下发此类型，个推提供的服务端API支持下发推送通知（设置APN参数则通过苹果的APNS通道，否则使用个推通道）。 透传消息，设置APN参数则通过苹果的APNS通道下发推送消息，没有设置APN参数则使用个推的推送通道下发。

在华为手机上必须安装“华为移动服务”才能使用华为的厂商推送通道，首先确保手机上已经安装“华为移动服务”应用。 如果在华为手机应用退出后无法接收到推送消息，需要确保：

HBuilderX 3.0.7 之后，华为除了配置原有的厂商信息之外，需要新增配置agconnect-services.json文件。

该文件，需要从华为开发者后台--项目设置界面下载

需要在VIVO应用商店上线才能申请VIVO的厂商推送 注意事项：

需要在OPPO应用商店上线才能申请OPPO的厂商推送

需Android手机已经安装GMS，且手机网络可以连通谷歌FCM推送服务器。 详细教程另见：如何使用FCM。

如果应用在线可以接收到推送消息，离线时使用厂商通道无法接收到推送消息，可参考**uni-push厂商通道常见问题https://ask.dcloud.net.cn/article/36611 **

有了uni-push，开发者不应该再使用其他push方案了。但我们发现很多开发者有误解，导致还在错误使用其他推送。

“uni-push的专业性，和专业的个推、极光等服务可相比吗？”

uni-push 是由个推将其本来收费的 push 产品，免费提供给了DCloud的开发者。它与个推vip push的只有3个区别：

“uni-push好麻烦，我就喜欢个推、极光这种简单sdk，不想去各个rom厂商去申请一圈”

uni-push不建立在申请手机厂商授权的基础上，如果你不申请那些，使用起来和用普通的push是一样的。但是要特别注意，推送行业的现状就是：不集成rom厂商的推送，就无法在App离线时发送push。按照普通push模式使用，后果就是在华为、小米、OPPO、VIVO、魅族上发不了离线消息。

“uni-push的送达率高吗？是否可以付费来提升送达率，个推是有付费提升送达率的方法的”

前文已经做过相关说明，个推的付费提升送达率的产品就是vip push，而uni-push就是个推的vip Push。DCloud通过谈判免费给DCloud的开发者使用了。

uni-push可以完整替代socket吗？

能部分替代。uni-push客户端接收消息的通讯协议属于websocket；但业务服务端向uni-push服务发送消息用的是http通讯协议，会有1-2秒的延时。需要超低延迟的应用场景，如多人交互远程画板不合适。但对于普通的im消息、聊天、通知都没有问题。

5+app和wap2app支持uni-push吗？

HBuilderX 2.0.3起，5+app和wap2app可以使用uni-push 1.0，暂不支持使用uni-push 2.0。5+app和wap2app升级uni-push不需要改动app前端代码，只需要在HBuilderX中打开manifest.json的“模块配置”页，在“Push(消息推送)”下勾选“uniPush”，并点击“配置”，在后台开通uni-push服务，配置好厂商推送参数重新提交云端打包即可。后端服务器需要参考uni-push 1.0文档中的第二步对接个推推送服务。

uni-app x项目如何使用uni-push？

uni-app x项目只支持uni-push 2.0，开发文档参考：https://doc.dcloud.net.cn/uni-app-x/api/uni-push.html

iOS平台如何实现应用启动后不立即弹出“发送通知”系统授权框？

参考：https://ask.dcloud.net.cn/article/36955

为什么Android应用进入后台后（App未销毁），点击通知消息无法拉起App？

检查设备是否有禁止后台弹出界面，路径>>设置-应用管理-测试应用-权限管理-后台弹出界面，(一般是小米、oppo、vivo设备)。

参考文档，uni-push支持谷歌推送FCM配置指南

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

## nvue介绍 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/tutorial/nvue-outline

**Contents:**
- # nvue介绍
- # 适用场景
- # 纯原生渲染模式
- # 编译模式
- # 快速上手
  - # 1.新建 nvue 页面
  - # 2.开发 nvue 页面
  - # 3.调试 nvue 页面
- # render-whole
- # nvue开发与vue开发的常见区别

uni-app App 端内置了一个基于 weex 改进的原生渲染引擎，提供了原生渲染能力。

在 App 端，如果使用 vue 页面，则使用 webview 渲染；如果使用 nvue 页面(native vue 的缩写)，则使用原生渲染。一个 App 中可以同时使用两种页面，比如首页使用 nvue，二级页使用 vue 页面，hello uni-app 示例就是如此。

虽然 nvue 也可以多端编译，输出 H5 和小程序，但 nvue 的 css 写法受限，所以如果你不开发 App，那么不需要使用 nvue。

以往的 weex ，有个很大的问题是它只是一个高性能的渲染器，没有足够的 API 能力（比如各种 push sdk 集成、蓝牙等能力调用），使得开发时非常依赖原生工程师协作，开发者本来想节约成本，结果需要前端、iOS、Android 3 拨人开发，适得其反。 nvue 解决了这个问题，让前端工程师可以直接开发完整 App，并提供丰富的插件生态和云打包。这些组合方案，帮助开发者切实的提高效率、降低成本。

同时uni-app扩展了 weex 原生渲染引擎的很多排版能力，修复了很多 bug。比如

nvue 的组件和 API 写法与 vue 页面一致，其内置组件还比 vue 页面内置组件增加了更多，详见 。

如果你熟悉 weex 或 react native 开发，那么 nvue 是你的更优选择，能切实提升你的开发效率，降低成本。

如果你是 web 前端，不熟悉原生排版，那么建议你仍然以使用 vue 页面为主，在 App 端某些 vue 页面表现不佳的场景下使用 nvue 作为强化补充。这些场景如下：

但注意，在某些场景下，nvue 不如 vue 页面，如下：

uni-app 在 App 端，支持 vue 页面和 nvue 页面混搭、互相跳转。也支持纯 nvue 原生渲染。

启用纯原生渲染模式，可以减少 App 端的包体积、减少使用时的内存占用。因为 webview 渲染模式的相关模块将被移除。

在 manifest.json 源码视图的"app-plus"下配置"renderer":"native"，即代表 App 端启用纯原生渲染模式。此时 pages.json 注册的 vue 页面将被忽略，vue 组件也将被原生渲染引擎来渲染。

如果不指定该值，默认是不启动纯原生渲染的。

示例源码如下，请查看 pre > code 标签中的内容

weex 编译模式和 uni-app 编译模式

如你之前是 weex 开发者，可以继续查阅本章节，否则可以跳过看下一节快速上手。

weex 的组件和 JS API，与 uni-app 不同。uni-app 与微信小程序相同。

考虑到 weex 用户的迁移，uni-app 也支持 weex 的代码写法。在 manifest.json 中可以配置使用weex 编译模式或uni-app 编译模式。选择 weex 编译模式时将不支持 uni-app 的组件和 jsapi，需要开发者参考 weex 官方文档的写法来写代码。 比如 weex 编译模式用<div>。uni-app 编译模式则使用<view>。

一般情况建议使用uni-app模式，除非历史 weex 代码较多，需要逐步过渡。同时注意 weex 编译模式的切换是项目级的，不支持同项目下某个 nvue 页面使用 weex 模式，另一个 nvue 页面使用 uni-app 模式。

在 manifest.json 中修改 2 种编译模式，manifest.json -> app-plus -> nvueCompiler 切换编译模式。

示例源码如下，请查看 pre > code 标签中的内容

在 manifest.json 配置文件中，HBuilderX2.4 之前版本，默认值为 weex 模式，HBuilderX2.4+版本默认值改为 uni-app 模式。

weex 编译模式不支持 onNavigationBarButtonTap 生命周期函数的写法。在 nvue 中监听原生标题栏按钮点击事件，详见：uni.onNavigationBarButtonTap 。

weex 编译模式不支持 onShow 生命周期，但熟悉 5+的话，可利用监听 webview 的addEventListener show 事件实现 onShow 效果。

nvue 的页面跳转，与 weex 不同，仍然遵循 uni-app 的路由模型。vue 页面和 nvue 页面之间不管怎么跳转，都遵循这个模型。包括 nvue 页面跳向 nvue 页面。每个页面都需要在 pages.json 中注册，调用 uni-app 的 路由 API 进行跳转。

原生开发没有页面滚动的概念，页面内容高过屏幕高度时，内容并不会自动滚动；只有将页面内容放在list、waterfall、scroll-view/scroller这几个组件下内容才可滚动。这不符合前端开发的习惯，所以在 nvue 编译为 uni-app模式时，uni-app框架会给 nvue 页面外层自动嵌套一个 scroller，从而实现页面内容的自动滚动。

示例源码如下，请查看 pre > code 标签中的内容

weex 编译模式下支持使用 weex ui ，例子详见 。但相比 uni-app 插件市场及官方uni ui 而言，weex 语法的组件生态还是比较欠缺的。

HBuilderX 3.1.0+ 开始支持新的样式编译模式

示例源码如下，请查看 pre > code 标签中的内容

在 HBuilderX 的 uni-app 项目中，新建页面，弹出界面右上角可以选择是建立vue页面还是nvue页面，或者 2 个同时建。

不管是 vue 页面还是 nvue 页面，都需要在pages.json中注册。如果在 HBuilderX 中新建页面是会自动注册的，如果使用其他编辑器，则需要自行在 pages.json 里注册。

如果一个页面路由下同时有 vue 页面和 nvue 页面，即出现同名的 vue 和 nvue 文件。那么在 App 端，会仅使用 nvue 页面，同名的 vue 文件将不会被编译到 App 端。而在非 App 端，会优先使用 vue 页面。

如果不同名，只有 nvue 页面，则在非 app 端，只有 uni-app 编译模式的 nvue 文件才会编译。

nvue 页面结构同 vue, 由 template、style、script 构成。

HBuilderX 内置了 weex 调试工具的强化版，包括审查界面元素、看 log、debug 打断点，详见

在 HBuilder X 3.1.0 起版本，nvue 新增 render-whole属性，类型Boolean。

默认启用render-whole为true的组件列表

示例源码如下，请查看 pre > code 标签中的内容

此演示在 Android 5.1 版本手机上的效果，高版本手机效果没有这么明显

基于原生引擎的渲染，虽然还是前端技术栈，但和web开发肯定是有区别的。

iOS 平台默认情况下滚动容器组件（如list、waterfall组件）内容不足时，由于没有撑满容器的可视区域会导致无法上下滚动，此时无法操作下拉刷新功能，无法触发refresh组件的@refresh、@pullingdown事件。 此时可在容器组件中配置alwaysScrollableVertical属性值为true来设置支持上下滚动，支持下拉刷新操作。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
recycle-list
```

Example 2 (unknown):
```unknown
scroll-view
```

Example 3 (unknown):
```unknown
scroll-view
```

Example 4 (unknown):
```unknown
swiper-list
```

---

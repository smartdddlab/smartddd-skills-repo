# Uniapp - Component

**Pages:** 152

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-section.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Section Props
  - # Section Events
  - # Section Slots
- # 示例
      - 本页导读

标题栏组件，主要用于文章、列表详情等标题展示。

示例源码如下，请查看 pre > code 标签中的内容

直接拷贝示例代码，无法运行 ，示例依赖了 uni-scss 组件。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-section class="mb-10" title="基础用法" sub-title="副标题"></uni-section>

<uni-section class="mb-10" title="竖线装饰" sub-title="副标题" type="line"></uni-section>

<uni-section class="mb-10" title="装饰器插槽" sub-title="副标题">
  <template v-slot:decoration>
    <view class="decoration"></view>
  </template>
</uni-section>

<uni-section class="mb-10" title="默认插槽" sub-title="副标题">默认插槽内容</uni-section>

<uni-section class="mb-10" title="主标题">
  <template v-slot:right>
    right slot
  </template>
</uni-section>
```

Example 2 (html):
```html
<uni-section class="mb-10" title="基础用法" sub-title="副标题"></uni-section>

<uni-section class="mb-10" title="竖线装饰" sub-title="副标题" type="line"></uni-section>

<uni-section class="mb-10" title="装饰器插槽" sub-title="副标题">
  <template v-slot:decoration>
    <view class="decoration"></view>
  </template>
</uni-section>

<uni-section class="mb-10" title="默认插槽" sub-title="副标题">默认插槽内容</uni-section>

<uni-section class="mb-10" title="主标题">
  <template v-slot:right>
    right slot
  </template>
</uni-section>
```

Example 3 (html):
```html
<uni-section class="mb-10" title="基础用法" sub-title="副标题"></uni-section>

<uni-section class="mb-10" title="竖线装饰" sub-title="副标题" type="line"></uni-section>

<uni-section class="mb-10" title="装饰器插槽" sub-title="副标题">
  <template v-slot:decoration>
    <view class="decoration"></view>
  </template>
</uni-section>

<uni-section class="mb-10" title="默认插槽" sub-title="副标题">默认插槽内容</uni-section>

<uni-section class="mb-10" title="主标题">
  <template v-slot:right>
    right slot
  </template>
</uni-section>
```

Example 4 (jsx):
```jsx
<uni-section class="mb-10" title="基础用法" sub-title="副标题"></uni-section>

<uni-section class="mb-10" title="竖线装饰" sub-title="副标题" type="line"></uni-section>

<uni-section class="mb-10" title="装饰器插槽" sub-title="副标题">
  <template v-slot:decoration>
    <view class="decoration"></view>
  </template>
</uni-section>

<uni-section class="mb-10" title="默认插槽" sub-title="副标题">默认插槽内容</uni-section>

<uni-section class="mb-10" title="主标题">
  <template v-slot:right>
    right slot
  </template>
</uni-section>
```

---

## 插屏广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-interstitial.html

**Contents:**
  - # 插屏广告
      - 本页导读

插屏广告组件是由客户端原生的图片、文本、视频控件组成的；插屏广告与信息流或横幅广告相比展现尺寸更大，同样能够满足您对大量曝光和用户转化的需求。

---

## rich-text | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/rich-text.html

**Contents:**
- # rich-text
      - # nodes
      - # 受信任的HTML节点及属性
      - 本页导读

支持默认事件，包括：click、touchstart、touchmove、touchcancel、touchend、longpress。

nodes 值为 HTML String 时，在组件内部将自动解析为节点列表，推荐直接使用 Array 类型避免内部转换导致的性能下降。App-nvue 和支付宝小程序不支持 HTML String 方式，仅支持直接使用节点列表即 Array 类型，如要使用 HTML String，则需自己将 HTML String 转化为 nodes 数组，可使用 html-parser 转换。

节点列表内的节点现支持两种类型，通过 type 来区分，分别是元素节点和文本节点，默认是元素节点，在富文本区域里显示的 HTML 节点。

全局支持 class 和 style 属性，不支持 id 属性。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
event.detail={node}
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view class="content">
		<page-head :title="title"></page-head>
		<view class="uni-padding-wrap">
			<view class="uni-title uni-common-mt">
				数组类型
				<text>\nnodes属性为Array</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20rpx;">
				<rich-text :nodes="nodes"></rich-text>
			</view>
			<view class="uni-title uni-common-mt">
				字符串类型
				<text>\nnodes属性为String</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20rpx;">
				<rich-text :nodes="strings"></rich-text>
			</view>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view class="content">
		<page-head :title="title"></page-head>
		<view class="uni-padding-wrap">
			<view class="uni-title uni-common-mt">
				数组类型
				<text>\nnodes属性为Array</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20rpx;">
				<rich-text :nodes="nodes"></rich-text>
			</view>
			<view class="uni-title uni-common-mt">
				字符串类型
				<text>\nnodes属性为String</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20rpx;">
				<rich-text :nodes="strings"></rich-text>
			</view>
		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view class="content">
		<page-head :title="title"></page-head>
		<view class="uni-padding-wrap">
			<view class="uni-title uni-common-mt">
				数组类型
				<text>\nnodes属性为Array</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20rpx;">
				<rich-text :nodes="nodes"></rich-text>
			</view>
			<view class="uni-title uni-common-mt">
				字符串类型
				<text>\nnodes属性为String</text>
			</view>
			<view class="uni-common-mt" style="background:#FFF; padding:20rpx;">
				<rich-text :nodes="strings"></rich-text>
			</view>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-data-select.html

**Contents:**
- # 介绍
  - # 安装方式
  - # 基本用法
  - # 多选
  - # 云端数据示例
- # API
  - # DataSelect Props
    - # 使用云端数据时的属性（DataCom Props）
    - # Localdata Options
  - # DataSelect Events

在 uniCloud 开发中，DB Schema中配置了 enum 枚举等类型后，在 web 控制台的自动生成表单 功能中，会自动生成uni-data-select组件并绑定好 data

注意事项 为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

本组件符合easycom 规范，HBuilderX 2.5.5起，只需将本组件导入项目，在页面template中即可直接使用，无需在页面中import和注册components。

如需通过npm方式使用uni-ui组件，另行文档：https://ext.dcloud.net.cn/plugin?id=55

设置 localdata 属性后，组件会通过数据渲染出对应的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

新增于 uni-data-select 1.1.0

设置 multiple 属性，组件展示出多选框

需要注意 :multiple="true" 时（多选） ， v-model 的值是 Array 类型

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

更多 DataCom 支持的属性参考（包括：设置返回20个的默认大小）更多

localdata 属性的格式为数组，数组内每项是对象，需要严格遵循如下格式

通过插槽扩展 需要注意的是当使用插槽时，内置样式将会失效，只保留排版样式，此时的样式需要开发者自己实现 uni-data-select 提供了三个插槽: selected,empty,option

注意此示例代码用到了其它uniui组件,运行请到下方示例中查看

示例源码如下，请查看 pre > code 标签中的内容

直接拷贝示例代码，无法运行 ，示例依赖了 uni-card uni-section uni-scss 等多个组件。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uDataSelect
```

Example 2 (sql):
```sql
uni-data-select 1.1.0 版本
```

Example 3 (unknown):
```unknown
uni-data-select
```

Example 4 (unknown):
```unknown
manifest.json > app-plus
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-file-picker.html

**Contents:**
- # 介绍
  - # 基础用法
  - # 选择指定后缀图片，且限制选择个数
  - # 手动上传
  - # 单选图片且点击再次选择
  - # 自定义样式
  - # 使用插槽
- # API
  - # FilePicker Props
  - # value 格式

文件选择上传组件，可以选择图片、视频等任意文件并上传到当前绑定的服务空间

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

配置 file-mediatype 属性为 image，限定只选择图片

配置 file-extname 属性为 'png,jpg'，限定只选择 png和jpg后缀的图片

配置 limit 属性为 1 ，则最多选择一张图片

配置 mode 属性为 grid ，可以使用九宫格样式选择图片

示例源码如下，请查看 pre > code 标签中的内容

配置 auto-upload 属性为 false ，可以停止自动上传，通过ref调用upload方法自行选择上传时机

示例源码如下，请查看 pre > code 标签中的内容

配置 disable-preview 属性为 true，禁用点击预览图片功能

配置 del-icon 属性为 false，隐藏删除按钮

配置 return-type 属性为 object，设置 value 类型 ，如需绑定 array类型 ，则设置limit:1，可达到一样的效果

示例源码如下，请查看 pre > code 标签中的内容

配置 image-styles 属性，可以自定义mode:image时的回显样式

配置 list-styles 属性，可以自定义mode:video|| mode:all时的回显样式

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**注意**：如果绑定的是腾讯云的服务空间 ，tempFilePaths 将返回 fileID

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uFilePicker
```

Example 2 (unknown):
```unknown
wx.chooseMessageFile()
```

Example 3 (html):
```html
<uni-file-picker 
	v-model="imageValue" 
	fileMediatype="image" 
	mode="grid" 
	@select="select" 
	@progress="progress" 
	@success="success" 
	@fail="fail" 
/>
<script>
	export default {
		data() {
			return {
				imageValue:[]
			}
		},
		methods:{
			// 获取上传状态
			select(e){
				console.log('选择文件：',e)
			},
			// 获取上传进度
			progress(e){
				console.log('上传进度：',e)
			},
			
			// 上传成功
			success(e){
				console.log('上传成功')
			},
			
			// 上传失败
			fail(e){
				console.log('上传失败：',e)
			}
		}
	}
</script>
```

Example 4 (html):
```html
<uni-file-picker 
	v-model="imageValue" 
	fileMediatype="image" 
	mode="grid" 
	@select="select" 
	@progress="progress" 
	@success="success" 
	@fail="fail" 
/>
<script>
	export default {
		data() {
			return {
				imageValue:[]
			}
		},
		methods:{
			// 获取上传状态
			select(e){
				console.log('选择文件：',e)
			},
			// 获取上传进度
			progress(e){
				console.log('上传进度：',e)
			},
			
			// 上传成功
			success(e){
				console.log('上传成功')
			},
			
			// 上传失败
			fail(e){
				console.log('上传失败：',e)
			}
		}
	}
</script>
```

---

## uni.createCanvasContext(canvasId, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/createCanvasContext

**Contents:**
- # uni.createCanvasContext(canvasId, componentInstance)
  - # createCanvasContext 兼容性
  - # 定义
  - # 参数
  - # 返回值
      - 本页导读

创建 canvas 绘图上下文（指定 canvasId）。在自定义组件下，第二个参数传入组件实例this，以操作组件内 <canvas/> 组件

Tip: 需要指定 canvasId，该绘图上下文只作用于对应的 <canvas/>

---

## uniMP激励视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uni-ad-unimp.html

**Contents:**
- # uniMP激励视频广告
- # 简介
      - 本页导读

为了给开发者提供更高价格的广告，uni-ad 推出了高阶游戏广告预算。目前这种广告主预算只支持激励视频广告位

利用 uni-ad 多层调度策略动态调整渠道，在设备无广告时自动调整为其他广告渠道以增加广告填充率

---

## audio | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/audio

**Contents:**
- # audio
      - 本页导读

注意： 微信小程序平台自基础库 1.6.0 版本开始，不再维护 audio 组件，推荐使用API方式而不是组件方式来播放音频。API见 uni.createInnerAudioContext 替代。

如果需要带ui的样式，可以自己做，也可以在插件市场搜索相关插件

本组件在vue3项目中废弃，只可以在vue2项目中使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

Example 2 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

Example 3 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

Example 4 (typescript):
```typescript
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-countdown.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Countdown Props
  - # Countdown Events
  - # Countdown Methods
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 一般用法 -->
<uni-countdown :day="1" :hour="1" :minute="12" :second="40"></uni-countdown>

<!-- 不显示天数 -->
<uni-countdown :show-day="false" :hour="12" :minute="12" :second="12"></uni-countdown>

<!-- 修改颜色 -->
<uni-countdown color="#FFFFFF" background-color="#00B26A" border-color="#00B26A" :day="1" :hour="2" :minute="30" :second="0"></uni-countdown>
```

Example 2 (html):
```html
<!-- 一般用法 -->
<uni-countdown :day="1" :hour="1" :minute="12" :second="40"></uni-countdown>

<!-- 不显示天数 -->
<uni-countdown :show-day="false" :hour="12" :minute="12" :second="12"></uni-countdown>

<!-- 修改颜色 -->
<uni-countdown color="#FFFFFF" background-color="#00B26A" border-color="#00B26A" :day="1" :hour="2" :minute="30" :second="0"></uni-countdown>
```

Example 3 (html):
```html
<!-- 一般用法 -->
<uni-countdown :day="1" :hour="1" :minute="12" :second="40"></uni-countdown>

<!-- 不显示天数 -->
<uni-countdown :show-day="false" :hour="12" :minute="12" :second="12"></uni-countdown>

<!-- 修改颜色 -->
<uni-countdown color="#FFFFFF" background-color="#00B26A" border-color="#00B26A" :day="1" :hour="2" :minute="30" :second="0"></uni-countdown>
```

Example 4 (typescript):
```typescript
<!-- 一般用法 -->
<uni-countdown :day="1" :hour="1" :minute="12" :second="40"></uni-countdown>

<!-- 不显示天数 -->
<uni-countdown :show-day="false" :hour="12" :minute="12" :second="12"></uni-countdown>

<!-- 修改颜色 -->
<uni-countdown color="#FFFFFF" background-color="#00B26A" border-color="#00B26A" :day="1" :hour="2" :minute="30" :second="0"></uni-countdown>
```

---

## recycle-list | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/recycle-list.html

**Contents:**
- # recycle-list
    - # 子组件
    - # cell-slot
    - # 属性和文本的绑定
    - # <slot>不可用
    - # v-once 不会优化渲染性能
    - # 样式功能的限制
    - # 双向绑定
    - # 子组件的限制
    - # 示例

<recycle-list> 是一个新的列表容器，具有回收和复用的能力，可以大幅优化内存占用和渲染性能。它的性能比list组件更高，但写法受限制。它除了会释放不可见区域的渲染资源，在非渲染的数据结构上也有更多优化。

此组件自HBuilderX 2.2.6+起支持。

<recycle-list> 只能使用 <cell-slot> 作为其直接子节点，使用其他节点无效。

<cell-slot> 代表的是列表每一项的模板，它只用来描述模板的结构，并不对应实际的节点。<cell-slot> 的个数只表示模板的种类数，真实列表项的个数是由数据决定的。

示例源码如下，请查看 pre > code 标签中的内容

注意：Android 平台目前仅支持放到 template 根节点，后续修复此问题

在 <recycle-list> 中使用的子组件也将被视为模板，在开发组件时给 <template> 标签添加 recyclable 属性，才可以用在 <recycle-list> 中。

示例源码如下，请查看 pre > code 标签中的内容

添加了 recyclable 属性并不会影响组件本身的功能，它仍然可以用在其他正常的组件里。

绑定属性或者文本时，仅支持表达式，不支持函数调用，也不支持使用 filter，可以参考 Implementation.md#支持的表达式。

示例源码如下，请查看 pre > code 标签中的内容

针对这种场景，推荐使用 computed 属性来实现。 因为模板的取值是由客户端实现的，而函数的定义在前端（filter 可以认为是在模板里调用函数的语法糖），如果每次取值都走一次通信的话，会大幅降低渲染性能。

<cell-slot> 的功能和 <slot> 有部分重叠，而且更为激进，在概念上有冲突，存在很多边界情况无法完全支持。不要在 <cell-slot> 及其子组件里使用 <slot>。

和前端框架中的理解不同，客户端里要实现复用的逻辑，会标记模板节点的状态，添加了 v-once 能保证节点只渲染一次，但是并不一定能优化渲染性能，反而可能会拖慢客户端复用节点时的比对效率。

计划支持。目前版本里还不支持绑定样式类名（v-bind:class），原因和进展可以参考 #14。

计划支持。v-model 还未调通，暂时不要使用。

没有 Virtual DOM！ 使用在 <recycle-list> 中的组件没有 Virtual DOM！与 Virtual DOM 相关的功能也不支持。在开发过程中尽量只处理数据，不要操作生成后的节点。

vm.$refs 里的值可能是数组、子组件的实例、DOM 元素，在前端里比较常用，如果不支持，对 Weex 里的 dom 模块和 animation 模块的功能也有影响。

目前正在讨论技术方案，部分接口可能会重新设计，或者是在 vm 上透出专为 <recycle-list> 设计的接口。

组件的属性 目前子组件的属性不支持函数。（正在讨论实现方案）

示例源码如下，请查看 pre > code 标签中的内容

因为子组件的属性值需要在前端和客户端之间传递，所以仅支持可序列化的值。item.xxx 的类型可以是对象、数组、字符串、数字、布尔值等，不支持函数。

生命周期的行为差异 由于列表的渲染存在回收机制，节点渲染与否也与用户的滚动行为有关，组件的生命周期行为会有一些不一致。

可回收长列表不会立即渲染所有节点，只有即将滚动到可视区域（以及可滚动的安全区域）内时才开始渲染，组件生命周期的语义没变，但是会延迟触发。

假设有 100 条数据，一条数据了对应一个组件。渲染首屏时只能展示 8 条数据的节点，那就只有前 8 个组件被创建了，也只有前 8 个组件的生命周期被触发。

组件的 beforeCreate 和 created 也只有在组件即将创建和创建完成时才会触发 同理，组件的 beforeMount 和 mounted 也只有页面真正渲染到了该组件，在即将挂载和已经挂载时才会触发 组件的自定义事件 计划支持。vm.$on, vm.$once, vm.$emit, vm.$off 等功能还未完全调通，接口可用，但是行为可能有些差异（参数丢失），暂时不要使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果将模板合并成一个，也可以省略 switch 和 case，将例子进一步简化：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
<recycle-list>
```

Example 2 (unknown):
```unknown
<recycle-list>
```

Example 3 (unknown):
```unknown
<cell-slot>
```

Example 4 (unknown):
```unknown
<cell-slot>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-segmented-control.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # SegmentedControl Props
  - # SegmentedControl Events
- # 示例
      - 本页导读

组件名：uni-segmented-control

代码块： uSegmentedControl

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uSegmentedControl
```

Example 2 (html):
```html
<template>
    <view>
        <uni-segmented-control :current="current" :values="items" @clickItem="onClickItem" styleType="button" activeColor="#4cd964"></uni-segmented-control>
        <view class="content">
            <view v-show="current === 0">
                选项卡1的内容
            </view>
            <view v-show="current === 1">
                选项卡2的内容
            </view>
            <view v-show="current === 2">
                选项卡3的内容
            </view>
        </view>
    </view>
</template>
<script>
export default {
  data() {
    return {
        ...
        items: ['选项1', '选项2', '选项3'],
        current: 0
    };
  },
  
  methods: {
    ...
    onClickItem(e) {
      if (this.current != e.currentIndex) {
        this.current = e.currentIndex;
      }
    }
  }
};
</script>
```

Example 3 (html):
```html
<template>
    <view>
        <uni-segmented-control :current="current" :values="items" @clickItem="onClickItem" styleType="button" activeColor="#4cd964"></uni-segmented-control>
        <view class="content">
            <view v-show="current === 0">
                选项卡1的内容
            </view>
            <view v-show="current === 1">
                选项卡2的内容
            </view>
            <view v-show="current === 2">
                选项卡3的内容
            </view>
        </view>
    </view>
</template>
<script>
export default {
  data() {
    return {
        ...
        items: ['选项1', '选项2', '选项3'],
        current: 0
    };
  },
  
  methods: {
    ...
    onClickItem(e) {
      if (this.current != e.currentIndex) {
        this.current = e.currentIndex;
      }
    }
  }
};
</script>
```

Example 4 (html):
```html
<template>
    <view>
        <uni-segmented-control :current="current" :values="items" @clickItem="onClickItem" styleType="button" activeColor="#4cd964"></uni-segmented-control>
        <view class="content">
            <view v-show="current === 0">
                选项卡1的内容
            </view>
            <view v-show="current === 1">
                选项卡2的内容
            </view>
            <view v-show="current === 2">
                选项卡3的内容
            </view>
        </view>
    </view>
</template>
<script>
export default {
  data() {
    return {
        ...
        items: ['选项1', '选项2', '选项3'],
        current: 0
    };
  },
  
  methods: {
    ...
    onClickItem(e) {
      if (this.current != e.currentIndex) {
        this.current = e.currentIndex;
      }
    }
  }
};
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/matter.html

**Contents:**
  - # H5正常但App异常的可能性
  - # H5正常但小程序异常的可能性
  - # 小程序正常但App异常的可能性
  - # 小程序或App正常，但H5异常的可能性
  - # App正常，小程序、H5异常的可能性
  - # 使用 Vue.js 的注意
  - # 区别于传统 web 开发的注意
  - # H5 开发注意
  - # 小程序开发注意
    - # 文件命名

每个端有每个端的特点，有的能被抹平，有的不可能被抹平。

注意：跨端，不是把web的习惯迁移到全平台。而是按照uni的写法，然后全平台使用。

body的元素选择器请改为page，同样，div和ul和li等改为view、span和font改为text、a改为navigator、img改为image...

非H5端默认并未启用 scoped，如需要隔离组件样式可以在 style 标签增加 scoped 属性，H5端为了隔离页面间的样式默认启用了 scoped

vue页面在App端，默认是被系统的webview渲染的（不是手机自带浏览器，是rom的webview），在较老的手机上，比如Android4.4、5.0或iOS8，很多css是不支持的，所以不要使用太新的css，会导致界面异常。

注意这不意味着不能使用flex，Android4.4也支持flex，只是不要使用太新的css。

可以找Android4.4手机或使用pc模拟器实际测试下，大多数国产Android模拟器都是4.4或5.0。

从 uni-app 2.5.3 起，Android端支持引入腾讯x5浏览器内核，可以抹平低端Android的浏览器兼容性问题，详见x5使用指南

小程序不存在浏览器兼容问题，它自带了一个很大的Webview。所以如果你的H5和小程序界面正常，而Android低端机App界面异常，且App没有使用x5引擎，那基本就可以判定是因为css兼容性。

app端nvue页面，不存在浏览器兼容问题，它自带一个统一的原生渲染引擎，不依赖webview。

Android4.4对应的webview是chrome37。各端浏览器内核的详情查阅，参考：关于手机webview内核、默认浏览器、各家小程序的渲染层浏览器的区别和兼容性

如果你的代码没有直接使用这些，那很可能是引入的三方库使用了这些。如果是后者，去插件市场 搜索替代方案。要知道非H5端的js是运行在一个独立的js core或v8下，并不是运行在浏览器里。

从HBuilderX 2.6起，App端新增了renderjs，这是一种运行在视图层的js，vue页面通过renderjs可以操作浏览器对象，进而可以让基于浏览器的库直接在uni-app的App端运行，诸如echart、threejs，详见：renderjs

vue页面在App端的渲染引擎默认是系统webview（不是手机自带浏览器，是rom的webview），在较老的手机上，比如Android4.4、5.0或iOS8，一些新出的css语法是不支持的。注意这不意味着不能使用flex，Android4.4也支持flex，只是不要使用太新的css。可以找Android4.4手机或使用pc模拟器实际测试下，大多数国产Android模拟器都是4.4或5.0。

小程序不存在浏览器兼容问题，它内置了几十M自己的定制webview。所以如果你的H5和小程序界面正常，而App界面异常，大多是因为css兼容性。

uni-app 基于Vue 2.0实现，开发者需注意Vue 1.0 -> 2.0 的使用差异，详见从 Vue 1.x 迁移

data 属性必须声明为返回一个初始数据对象的函数；否则页面关闭时，数据不会自动销毁，再次打开该页面时，会显示上次数据

示例源码如下，请查看 pre > code 标签中的内容

在微信小程序端，uni-app 将数据绑定功能委托给Vue，开发者需按Vue 2.0的写法实现数据绑定，不支持微信小程序的数据绑定写法，故如下写法不支持：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

你之前可能习惯自由的web开发，但目前各家小程序都有很多限制。 当然限制是为了在框架层更好的优化用户体验，所以小程序的体验要优于web。 并且这些限制只是写法的限制，并不影响功能。 如果你做过微信小程序开发，对这些限制应该已经很了解了。如果没有做过小程序，请仔细阅读本节。

示例源码如下，请查看 pre > code 标签中的内容

H5 版 uni-app 全支持 vue 语法，所以可能造成部分写法在 H5 端生效，在小程序或 App 端不生效。

H5 校验了更严格的 vue 语法，有些写法不规范会报警，比如： data 后面写对象会报警，必须写 function；不能修改 props 的值；组件最外层 template 节点下不允许包含多个节点等。

编译为 H5 版后生成的是单页应用（SPA）。

如果遇到跨域造成js无法联网，注意网络请求（request、uploadFile、downloadFile等）在浏览器存在跨域限制，解决方案有详见：https://ask.dcloud.net.cn/article/35267

APP 和小程序的导航栏和 tabbar 均是原生控件，元素区域坐标是不包含原生导航栏和 tabbar 的；而 H5 里导航栏和 tabbar 是 div 模拟实现的，所以元素坐标会包含导航栏和tabbar的高度。为了优雅的解决多端高度定位问题，uni-app 新增了2个css变量：--window-top 和 --window-bottom，这代表了页面的内容区域距离顶部和底部的距离。举个实例，如果你想在原生tabbar 上方悬浮一个菜单，之前写 bottom:0。这样的写法编译到 h5 后，这个菜单会和 tabbar 重叠，位于屏幕底部。而改为使用 bottom:var(--window-bottom)，则不管在 app 下还是在h5下，这个菜单都是悬浮在 tabbar 上浮的。这就避免了写条件编译代码。当然仍然也可以使用 H5 的条件编译处理界面的不同。

CSS 內使用 vh 单位的时候注意 100vh 包含导航栏，使用时需要减去导航栏和 tabBar 高度，部分浏览器还包含浏览器操作栏高度，使用时请注意。

正常支持 rpx，px 是真实物理像素。暂不支持通过设 manifest.json 的 "transformPx" : true，把 px 当动态单位使用。

使用罗盘、地理位置、加速计等相关接口需要使用 https 协议，本地预览（localhost）可以使用 http 协议。

PC 端 Chrome 浏览器模拟器设备测试的时候，获取位置 API 需要连接谷歌服务器。

vue2组件内（页面除外）不支持 onLoad、onShow 等页面生命周期， vue3请使用组合式api监听

为避免和内置组件冲突，自定义组件请加上前缀（但不能是 u 和 uni）。比如可使用的自定义组件名称：my-view、m-input、we-icon，例如不可使用的自定义组件名称：u-view、uni-input，如果已有项目使用了可能造成冲突的名称，请修改名称，另外微信小程序下自定义组件名称不能以 wx 开头。

vue3 开发阶段不会自动处理语法兼容问题，如果在低版本浏览器上运行，需要自行处理，可参考详情 。

vue3 项目，页面或组件目录下，不能使用与 vue、nvue 同名的 js、ts 文件。 小程序端 vue 文件会被编译为同名的 js、json、wxml、wxss 文件，如果存在同名 js、ts 文件，会导致冲突。

各家小程序的浏览器内核不同，可能会造成css兼容性问题，更多细节参考：https://ask.dcloud.net.cn/article/1318

微信（可以使用virtualHost配置）/QQ/百度/抖音这四家小程序，自定义组件在渲染时会比App/H5端多一级节点，在写样式时需要注意：

支付宝小程序默认启用了virtualHost配置不会插入节点，一般不存在如上问题。

小程序工具提示vendor.js过大，已经跳过es6向es5转换。这个转换问题本身不用理会，因为vendor.js已经是es5的了。

示例源码如下，请查看 pre > code 标签中的内容

sign放到项目根目录，编译后自动拷贝到 .quickapp/sign，每次编译完成时会删除.quickapp，避免证书丢失

**Examples:**

Example 1 (unknown):
```unknown
url(//alicdn.net)
```

Example 2 (unknown):
```unknown
url(https://alicdn.net)
```

Example 3 (javascript):
```javascript
//正确用法，使用函数返回对象
data() {
	return {
		title: 'Hello'
	}
}
//错误写法，会导致再次打开页面时，显示上次数据
data: {
	title: 'Hello'
}
```

Example 4 (javascript):
```javascript
//正确用法，使用函数返回对象
data() {
	return {
		title: 'Hello'
	}
}
//错误写法，会导致再次打开页面时，显示上次数据
data: {
	title: 'Hello'
}
```

---

## official-account | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/official-account

**Contents:**
  - # official-account
      - 本页导读

微信公众号关注组件。当用户扫小程序码打开小程序时，开发者可在小程序内配置公众号关注组件，方便用户快捷关注公众号，可嵌套在原生组件内。

支付宝平台另提供了lifestyle组件，可关注支付宝生活号，规范详情

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/view.html

**Contents:**
- # view
      - 本页导读

所有的视图组件，包括view、swiper等，本身不显示任何可视化元素。它们的用途都是为了包裹其他真正显示的组件。

它类似于传统html中的div，用于包裹各种元素内容。

如果使用nvue ，则需注意，包裹文字应该使用<text>组件。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可快速体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

Example 2 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

Example 3 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

---

## match-media | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/match-media

**Contents:**
- # match-media
      - 本页导读

类似于网页开发中使用媒体查询来适配大屏小屏，match-media是一个可适配不同屏幕的基本视图组件。可以指定一组 media query 媒体查询规则，满足查询条件时，这个组件才会被展示。

例如在match-media组件中放置一个侧边栏，媒体查询规则设置为宽屏才显示，就可以实现在PC宽屏显示该侧边栏，而在手机窄屏中不显示侧边栏的效果。

注意：支付宝小程序、qq小程序、百度小程序、抖音小程序，暂不支持监听屏幕动态改变，即只执行一次媒体查询。

以下示例代码，推荐使用HBuilderX，新建uni-app项目，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

Example 2 (html):
```html
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

Example 3 (html):
```html
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

Example 4 (typescript):
```typescript
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-rate.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Rate Props
  - # Rate Events
- # 示例
      - 本页导读

代码块： uRate 关联组件：uni-icons

评分组件，多用于购买商品后，对商品进行评价等场景

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的使用说明，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 基本用法 -->
<!-- 需要在 script 中绑定 value 变量 -->
<uni-rate v-model="value" @change="onChange"/>

<!-- 不支持滑动手势选择评分 -->
<uni-rate :touchable="false" :value="5"/>
<!-- 设置尺寸大小 -->
<uni-rate :size="18" :value="5"/>

<!-- 设置评分数 -->
<uni-rate :max="10" :value="5" />
	
<!-- 设置星星间隔 -->
<uni-rate :value="4" :margin="20" />	

<!-- 设置颜色 -->
<uni-rate :value="3" color="#bbb" active-color="red" />

<!-- 选择半星 -->
<uni-rate allow-half :value="3.5" />

<!-- 只读状态 -->
<uni-rate :readonly="true" :value="2" />

<!-- 禁用状态 -->
<uni-rate :disabled="true" disabledColor="#ccc" :value="3" />

<!-- 未选中的星星为镂空状态 -->
<uni-rate :value="3" :is-fill="false" />
```

Example 2 (html):
```html
<!-- 基本用法 -->
<!-- 需要在 script 中绑定 value 变量 -->
<uni-rate v-model="value" @change="onChange"/>

<!-- 不支持滑动手势选择评分 -->
<uni-rate :touchable="false" :value="5"/>
<!-- 设置尺寸大小 -->
<uni-rate :size="18" :value="5"/>

<!-- 设置评分数 -->
<uni-rate :max="10" :value="5" />
	
<!-- 设置星星间隔 -->
<uni-rate :value="4" :margin="20" />	

<!-- 设置颜色 -->
<uni-rate :value="3" color="#bbb" active-color="red" />

<!-- 选择半星 -->
<uni-rate allow-half :value="3.5" />

<!-- 只读状态 -->
<uni-rate :readonly="true" :value="2" />

<!-- 禁用状态 -->
<uni-rate :disabled="true" disabledColor="#ccc" :value="3" />

<!-- 未选中的星星为镂空状态 -->
<uni-rate :value="3" :is-fill="false" />
```

Example 3 (html):
```html
<!-- 基本用法 -->
<!-- 需要在 script 中绑定 value 变量 -->
<uni-rate v-model="value" @change="onChange"/>

<!-- 不支持滑动手势选择评分 -->
<uni-rate :touchable="false" :value="5"/>
<!-- 设置尺寸大小 -->
<uni-rate :size="18" :value="5"/>

<!-- 设置评分数 -->
<uni-rate :max="10" :value="5" />
	
<!-- 设置星星间隔 -->
<uni-rate :value="4" :margin="20" />	

<!-- 设置颜色 -->
<uni-rate :value="3" color="#bbb" active-color="red" />

<!-- 选择半星 -->
<uni-rate allow-half :value="3.5" />

<!-- 只读状态 -->
<uni-rate :readonly="true" :value="2" />

<!-- 禁用状态 -->
<uni-rate :disabled="true" disabledColor="#ccc" :value="3" />

<!-- 未选中的星星为镂空状态 -->
<uni-rate :value="3" :is-fill="false" />
```

Example 4 (typescript):
```typescript
<!-- 基本用法 -->
<!-- 需要在 script 中绑定 value 变量 -->
<uni-rate v-model="value" @change="onChange"/>

<!-- 不支持滑动手势选择评分 -->
<uni-rate :touchable="false" :value="5"/>
<!-- 设置尺寸大小 -->
<uni-rate :size="18" :value="5"/>

<!-- 设置评分数 -->
<uni-rate :max="10" :value="5" />
	
<!-- 设置星星间隔 -->
<uni-rate :value="4" :margin="20" />	

<!-- 设置颜色 -->
<uni-rate :value="3" color="#bbb" active-color="red" />

<!-- 选择半星 -->
<uni-rate allow-half :value="3.5" />

<!-- 只读状态 -->
<uni-rate :readonly="true" :value="2" />

<!-- 禁用状态 -->
<uni-rate :disabled="true" disabledColor="#ccc" :value="3" />

<!-- 未选中的星星为镂空状态 -->
<uni-rate :value="3" :is-fill="false" />
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-title.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 标题统计
- # API
  - # Title Props
- # 示例
      - 本页导读

章节标题，通常用于记录页面标题，使用当前组件，uni-app 如果开启统计，将会自动统计页面标题 。

示例源码如下，请查看 pre > code 标签中的内容

title 组件可以与 uni统计集合使用，只要开启uni统计，即可自动采集标题

在使用 align 属性时，在非 nvue 页面下不生效，或者组件宽度不对，请在组件外层设置一个元素的 display为block 即可解决问题。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-title title="上报统计数据"></uni-title>
<uni-title type="h1" title="h1 一级标题 "></uni-title>
<uni-title type="h1" title="h1 一级标题" color="#027fff"></uni-title>
<uni-title type="h2" title="h2 居中" align="center"></uni-title>
```

Example 2 (html):
```html
<uni-title title="上报统计数据"></uni-title>
<uni-title type="h1" title="h1 一级标题 "></uni-title>
<uni-title type="h1" title="h1 一级标题" color="#027fff"></uni-title>
<uni-title type="h2" title="h2 居中" align="center"></uni-title>
```

Example 3 (html):
```html
<uni-title title="上报统计数据"></uni-title>
<uni-title type="h1" title="h1 一级标题 "></uni-title>
<uni-title type="h1" title="h1 一级标题" color="#027fff"></uni-title>
<uni-title type="h2" title="h2 居中" align="center"></uni-title>
```

Example 4 (unknown):
```unknown
<uni-title title="上报统计数据"></uni-title>
<uni-title type="h1" title="h1 一级标题 "></uni-title>
<uni-title type="h1" title="h1 一级标题" color="#027fff"></uni-title>
<uni-title type="h2" title="h2 居中" align="center"></uni-title>
```

---

## uni.canvasPutImageData(OBJECT, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/canvasPutImageData

**Contents:**
- # uni.canvasPutImageData(OBJECT, componentInstance)
  - # canvasGetImageData 兼容性
      - 本页导读

将像素数据绘制到画布的方法，在自定义组件下，第二个参数传入自定义组件实例 this，以操作组件内 <canvas> 组件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

Example 2 (javascript):
```javascript
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

Example 3 (javascript):
```javascript
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

Example 4 (css):
```css
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

---

## cover-image | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/cover-image.html

**Contents:**
- # cover-image
      - 本页导读

覆盖在原生组件上的图片视图。可覆盖的原生组件同cover-view，支持嵌套在cover-view里。

app-vue上可覆盖的原生组件：<video>、<map>

注意：nvue的cover-view不在上述限制中，它仅支持且全部支持nvue的所有css。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
cover-image
```

Example 2 (unknown):
```unknown
cover-image
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view class="page">
		<video class="video" id="demoVideo" :controls="false" :enable-progress-gesture="false" :show-center-play-btn="true" src="https://img.cdn.aliyun.dcloud.net.cn/guide/uniapp/%E7%AC%AC1%E8%AE%B2%EF%BC%88uni-app%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D%EF%BC%89-%20DCloud%E5%AE%98%E6%96%B9%E8%A7%86%E9%A2%91%E6%95%99%E7%A8%8B@20181126-lite.m4v">
			<cover-view class="controls-title">简单的自定义 controls</cover-view>
			<cover-image class="controls-play img" @click="play" src="/static/play.png"></cover-image>
			<cover-image class="controls-pause img" @click="pause" src="/static/pause.png"></cover-image>
		</video>
	</view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view class="page">
		<video class="video" id="demoVideo" :controls="false" :enable-progress-gesture="false" :show-center-play-btn="true" src="https://img.cdn.aliyun.dcloud.net.cn/guide/uniapp/%E7%AC%AC1%E8%AE%B2%EF%BC%88uni-app%E4%BA%A7%E5%93%81%E4%BB%8B%E7%BB%8D%EF%BC%89-%20DCloud%E5%AE%98%E6%96%B9%E8%A7%86%E9%A2%91%E6%95%99%E7%A8%8B@20181126-lite.m4v">
			<cover-view class="controls-title">简单的自定义 controls</cover-view>
			<cover-image class="controls-play img" @click="play" src="/static/play.png"></cover-image>
			<cover-image class="controls-pause img" @click="pause" src="/static/pause.png"></cover-image>
		</video>
	</view>
</template>
```

---

## canvas | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/canvas.html

**Contents:**
- # canvas
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关 api：uni.createCanvasContext

canvas的常用用途有图表和图片处理，在uni-app插件市场有大量基于canvas的插件，可搜索 图表 、 头像裁剪 、 海报 、 二维码 。

HBuilderX 2.2.5 开始 nvue 页面支持 Canvas，支持 W3C WebGL API WebGL 1.0

示例工程地址：NvueCanvasDemo

在App端，从性能来讲，由于通讯阻塞的问题，nvue的canvas性能不可能达到使用renderjs的vue页面的canvas。在App端，推荐使用vue的canvas。

**Examples:**

Example 1 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

Example 2 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

Example 3 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

Example 4 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-pagination.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Pagination Props
  - # Pagination Events
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uPagination
```

Example 2 (html):
```html
<uni-pagination title="标题文字" total="20"></uni-pagination>
<uni-pagination title="标题文字" show-icon="true" total="50" current="2"></uni-pagination>
```

Example 3 (html):
```html
<uni-pagination title="标题文字" total="20"></uni-pagination>
<uni-pagination title="标题文字" show-icon="true" total="50" current="2"></uni-pagination>
```

Example 4 (html):
```html
<uni-pagination title="标题文字" total="20"></uni-pagination>
<uni-pagination title="标题文字" show-icon="true" total="50" current="2"></uni-pagination>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-card.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 卡片标题+额外信息
  - # 双标题卡片 + 略缩图
  - # 通栏卡片
  - # 卡片封面图 + 操作栏
- # API
  - # Card Props
  - # Card Events
  - # Card Slots

卡片组件通用来显示完整独立的一段信息，同时让用户理解他的作用。例如一篇文章的预览图、作者信息、时间等，卡片通常是更复杂和更详细信息的入口点。

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

使用 extra 属性设置卡片标题额外信息

示例源码如下，请查看 pre > code 标签中的内容

使用 sub-title 属性设置卡片副标题

使用 thumbnail 属性设置卡片标题左略缩图

示例源码如下，请查看 pre > code 标签中的内容

使用 is-full 属性设置卡片通栏 ，通栏没有外边距，左右会贴合父元素

示例源码如下，请查看 pre > code 标签中的内容

使用 cover 属性设置卡片封面图,或者使用 cover 插槽设置卡片封面图

使用 actions 插槽设置卡片操作栏内容，示例样式排版和事件需要自己实现

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-card>
	<text>这是一个基础卡片示例，内容较少，此示例展示了一个没有任何属性不带阴影的卡片。</text>
</uni-card>
```

Example 2 (html):
```html
<uni-card>
	<text>这是一个基础卡片示例，内容较少，此示例展示了一个没有任何属性不带阴影的卡片。</text>
</uni-card>
```

Example 3 (html):
```html
<uni-card>
	<text>这是一个基础卡片示例，内容较少，此示例展示了一个没有任何属性不带阴影的卡片。</text>
</uni-card>
```

Example 4 (typescript):
```typescript
<uni-card>
	<text>这是一个基础卡片示例，内容较少，此示例展示了一个没有任何属性不带阴影的卡片。</text>
</uni-card>
```

---

## uni-icons 图标 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-icons.html

**Contents:**
- # uni-icons 图标
- # 介绍
  - # 基本用法
- # 图标示例
- # API
  - # Icons Props
  - # Icons Events
- # 通过 fontFamily 自定义图标
- # 通过 customPrefix 自定义图标 （即将废弃）
  - # 获取图标

组件名：uni-icons（已支持 uni-app x）

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

nvue 页面暂时不支持自定义图标，如需在 nvue 中使用 ，请自行引入字体文件

uni-icons 已经收录了日常开发中常用的图标 ，但是因为体积问题 ，不可能一直无限添加新图标 ，所以uni-icons 也提供了扩展的方法。

使用 custom-prefix 和 type 属性自定义图标

示例源码如下，请查看 pre > code 标签中的内容

以下所有说明都是基于阿里图标库 进行扩展，其他图标库同理，明白原理即可方便扩展

访问 阿里图标库 ，搜索图标并加入购物车：

点击页面右上角购物车图标 ，点击添加至项目，如没有项目，需要点击下图第二步的图标添加一个项目目录，如已经有项目则可以略过第二步，选择项目后点击确定：

确定后进入项目，点击项目设置 ，对图标库进行一些设置：

项目名称和项目描述根据自己需求填写， fontClass 是图标的前缀 ，需要传入组件type属性，fontFamily 是图标集名称，需要传入组件custom-prefix 属性，字体格式可以只勾选 ttf:

下载解压后，需要用到的文件暂时有两个 iconfont.css、iconfont.ttf:

将 iconfont.ttf、iconfont.css 放到项目根目录 static 下。

打开 iconfont.css ,修改 @font-face 如下,注意 src 字体文件的引用路径是否正确：

示例源码如下，请查看 pre > code 标签中的内容

通过上述操作 ，现在就获得一个可以自定义的图标库，

在项目根目录的 App.vue 中，引入上述的 iconfont.css，注意自己存放的路径，且通过 @import 引入的外部样式，需要写在 style 标签有效内容中的最前面

示例源码如下，请查看 pre > code 标签中的内容

使用 custom-prefix 和 type 属性自定义图标

示例源码如下，请查看 pre > code 标签中的内容

注意：因为本质上还是使用的字体，所以多色图标还是不支持的。

**Examples:**

Example 1 (html):
```html
<uni-icons type="contact" size="30"></uni-icons>
```

Example 2 (html):
```html
<uni-icons type="contact" size="30"></uni-icons>
```

Example 3 (html):
```html
<uni-icons type="contact" size="30"></uni-icons>
```

Example 4 (unknown):
```unknown
<uni-icons type="contact" size="30"></uni-icons>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/video.html

**Contents:**
- # video
      - # direction 的合法值
      - # object-fit 的合法值
      - # play-btn-position 的合法值
      - 本页导读

视频需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

<video> 默认宽度 300px、高度 225px，可通过 css 设置宽高。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关api：uni.createVideoContext

App平台video组件使用ijkplayer库实现：https://github.com/bilibili/ijkplayer ；

ijkplayer作为一个开源库，比腾讯视频等商业sdk仍有差距。如无法在开源库上满足需求，可在插件市场寻找商业sdk插件：腾讯视频 、阿里云视频

video全屏后，如何自行绘制界面？比如加个标题、加个分享按钮

如何实现抖音、映客等全屏视频垂直滑动切换效果？

<video/> 组件在非H5端是原生组件，层级高于普通前端组件，覆盖其需要使用cover-view 组件或plus.nativeObj.view、subNVue。微信基础库 2.4.0+和抖音小程序 已支持 video 组件的同层渲染，也就是video在非全屏时，可以被前端元素通过调节z-index来遮挡，但video全屏时，仍需要cover-view覆盖。

除微信基础库 2.4.0+ 和 抖音小程序 和 app-nvue 2.1.5+，其他情况下非H5的video不能放入scroll-view和swiper。注意参考 原生组件使用限制。

你也可以尝试换个设计思路，如：列表中的视频组件是通过图片与icon模拟的，点击后播放全屏播放视频的方案。详情【video组件会覆盖页面其他非原生组件的设计替代方案示例】

App平台：使用 <video/> 组件，打包 App 时必须勾选 manifest.json->App 模块权限配置->VideoPlayer 模块。此模块体积较大，非默认内置。

App平台：如果使用的视频路径为本地路径，需要配置资源为释放模式：在 manifest.json 文件内 app-plus 节点下新增 runmode 配置，设置值为liberate。

App平台：如果想使用非原生的video，即原来普通的html5自带video。有2种方案：

App平台：app-vue即使选择了使用x5内核，也不会使用x5的video播放，仍然使用uni-app的App引擎自带的原生视频播放。

App平台：3.6.14 以及 手机系统 iOS16 以上video全屏 需要配置应用支持横屏： 在 manifest.json 文件内 app-plus 节点下新增 screenOrientation 配置，设置值为["portrait-primary","portrait-secondary","landscape-primary","landscape-secondary"]。

H5平台： 在部分浏览器中会强制调用原生播放器播放（如：微信内置浏览器、UC浏览器等），在 x5 内核的浏览器中支持配置同层播放器 。

HBuilderX内置浏览器，使用video标签暂时存在问题，请先使用其他外部浏览器。

**Examples:**

Example 1 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

Example 2 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

Example 3 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

Example 4 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-swipe-action.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # SwipeAction Methods
  - # SwipeAcitonItem Props
    - # LeftOptions & RightOptions Options
  - # SwipeAcitonItem Events
  - # SwipeAcitonItem Slots
  - # Q&A
- # 示例

代码块： uSwipeAction、uSwipeActionItem

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

** Q：动态加载数据，组件滑动失效是怎么回事**

** Q：运行到 nvue 下没有样式**

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uSwipeAction
```

Example 2 (unknown):
```unknown
uSwipeActionItem
```

Example 3 (unknown):
```unknown
uni-swipe-action
```

Example 4 (unknown):
```unknown
uni-swipe-action-item
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-drawer.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Drawer Props
  - # Drawer Events
  - # Drawer Methods
- # 示例
      - 本页导读

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<button @click="showDrawer" type="primary">右侧弹出 显示Drawer</button>
		<uni-drawer ref="showRight" mode="right" :mask-click="false">
			<scroll-view style="height: 100%;" scroll-y="true">
				<button @click="closeDrawer" type="primary">关闭Drawer</button>
				<view v-for="item in 60" :key="item">可滚动内容 {{ item }}</view>
			</scroll-view>
		</uni-drawer>
	</view>
</template>

<script>
	export default {
		methods: {
			showDrawer() {
				this.$refs.showRight.open();
			},
			closeDrawer() {
				this.$refs.showRight.close();
			}

		}
	}
</script>
```

Example 2 (html):
```html
<template>
	<view>
		<button @click="showDrawer" type="primary">右侧弹出 显示Drawer</button>
		<uni-drawer ref="showRight" mode="right" :mask-click="false">
			<scroll-view style="height: 100%;" scroll-y="true">
				<button @click="closeDrawer" type="primary">关闭Drawer</button>
				<view v-for="item in 60" :key="item">可滚动内容 {{ item }}</view>
			</scroll-view>
		</uni-drawer>
	</view>
</template>

<script>
	export default {
		methods: {
			showDrawer() {
				this.$refs.showRight.open();
			},
			closeDrawer() {
				this.$refs.showRight.close();
			}

		}
	}
</script>
```

Example 3 (html):
```html
<template>
	<view>
		<button @click="showDrawer" type="primary">右侧弹出 显示Drawer</button>
		<uni-drawer ref="showRight" mode="right" :mask-click="false">
			<scroll-view style="height: 100%;" scroll-y="true">
				<button @click="closeDrawer" type="primary">关闭Drawer</button>
				<view v-for="item in 60" :key="item">可滚动内容 {{ item }}</view>
			</scroll-view>
		</uni-drawer>
	</view>
</template>

<script>
	export default {
		methods: {
			showDrawer() {
				this.$refs.showRight.open();
			},
			closeDrawer() {
				this.$refs.showRight.close();
			}

		}
	}
</script>
```

Example 4 (vue):
```vue
<template>
	<view>
		<button @click="showDrawer" type="primary">右侧弹出 显示Drawer</button>
		<uni-drawer ref="showRight" mode="right" :mask-click="false">
			<scroll-view style="height: 100%;" scroll-y="true">
				<button @click="closeDrawer" type="primary">关闭Drawer</button>
				<view v-for="item in 60" :key="item">可滚动内容 {{ item }}</view>
			</scroll-view>
		</uni-drawer>
	</view>
</template>

<script>
	export default {
		methods: {
			showDrawer() {
				this.$refs.showRight.open();
			},
			closeDrawer() {
				this.$refs.showRight.close();
			}

		}
	}
</script>
```

---

## 视频贴片广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-video-component.html

**Contents:**
- # 视频贴片广告
  - # 简介
  - # 适用场景
      - 本页导读

应用内展示的广告组件，可用于banner、信息流或视频贴片。

视频贴片广告展现场景非常灵活，可以当做普通信息流使用，也可以搭配video标签，做贴片广告使用。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

api的方式(仅App平台支持)，不推荐使用这种调用方式，调用比较复杂，且不跨平台，开发者还需要手动处理缓存逻辑

示例源码如下，请查看 pre > code 标签中的内容

激励视频广告 文档地址：https://uniapp.dcloud.io/uni-ad/ad-rewarded-video

全屏视频广告 文档地址：https://uniapp.dcloud.io/uni-ad/ad-fullscreen-video

插屏广告 文档地址：https://uniapp.dcloud.io/uni-ad/ad-interstitial

**Examples:**

Example 1 (unknown):
```unknown
vue3 H5暂不支持
```

Example 2 (html):
```html
<!-- #ifdef MP-WEIXIN -->
<ad unit-id=""></ad>
<!-- #endif -->
<!-- #ifndef MP-WEIXIN -->
<ad adpid=""></ad>
<!-- #endif -->
```

Example 3 (html):
```html
<!-- #ifdef MP-WEIXIN -->
<ad unit-id=""></ad>
<!-- #endif -->
<!-- #ifndef MP-WEIXIN -->
<ad adpid=""></ad>
<!-- #endif -->
```

Example 4 (html):
```html
<!-- #ifdef MP-WEIXIN -->
<ad unit-id=""></ad>
<!-- #endif -->
<!-- #ifndef MP-WEIXIN -->
<ad adpid=""></ad>
<!-- #endif -->
```

---

## editor 组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/editor.html

**Contents:**
- # editor 组件
- # 平台差异说明
- # 属性说明
- # HTML 标签和 style 内联样式支持情况
  - # 支持的标签
  - # 支持的内联样式
- # H5 使用最佳实践
  - # 方案一：自行托管 CDN 资源
  - # 方案二：从 npm 中处理资源
- # 注意事项

富文本编辑器，可以对图片、文字格式进行编辑和混排。

在web开发时，可以使用contenteditable来实现内容编辑。但这是一个dom API，在非H5平台无法使用。于是微信小程序和uni-app的App-vue提供了editor组件来实现这个功能，并且在uni-app的H5平台也提供了兼容。从技术本质来讲，这个组件仍然运行在视图层webview中，利用的也是浏览器的contenteditable功能。

编辑器导出内容支持带标签的 html和纯文本的 text，编辑器内部采用 delta 格式进行存储。

通过setContents接口设置内容时，解析插入的 html 可能会由于一些非法标签导致解析错误，建议开发者在应用内使用时通过 delta 进行插入。

富文本组件内部引入了一些基本的样式使得内容可以正确的展示，开发时可以进行覆盖。需要注意的是，在其它组件或环境中使用富文本组件导出的html时，需要额外引入这段样式 ，并维护<ql-container><ql-editor></ql-editor></ql-container>的结构，参考：使用 editor 组件导出的 html 。

编辑器内支持部分 HTML 标签和内联样式，不支持class和id

不满足的标签会被忽略，<div>会被转行为<p>储存。

内联样式仅能设置在行内元素或块级元素上，不能同时设置。例如 font-size` 归类为行内元素属性，在 p 标签上设置是无效的。

近期部分用户反馈访问 unpkg 失败，导致 editor 组件初始化异常。这里提供代码块，方便用户修改。

分别下载quill.min.js 、image-resize.min.js ，放入 static 目录中。

在 index.html(Vue 3)，或者 public/index.html(Vue2) 中在 head 之间添加 js

示例源码如下，请查看 pre > code 标签中的内容

这样 editor 组件就可以正常使用了，代码逻辑中检测到有相关 window.Quill 变量，就不会从远程获取资源。

方案一的解决思路是在 window 上进行挂载，同样，我们可以在项目入口 main.js 或者 App.vue中引用相关依赖即可。

示例源码如下，请查看 pre > code 标签中的内容

在组件页面或者 main.ts 入口逻辑中，使用下面方案，注入依赖：

示例源码如下，请查看 pre > code 标签中的内容

相比方案一，方案二好处是依赖清晰，引用透明。如果你熟悉 npm 生态和构建流程，推荐方案二。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一个完整的内容管理系统 Content Management System 比较复杂，DCloud已提供好了现成的 uni-cms，开源、免费、全端可用、功能完善，包括管理端和用户端。还内置了 AI 生成文章和广告变现功能。详见：https://doc.dcloud.net.cn/uniCloud/uni-cms.html

**Examples:**

Example 1 (unknown):
```unknown
contenteditable
```

Example 2 (unknown):
```unknown
contenteditable
```

Example 3 (unknown):
```unknown
setContents
```

Example 4 (unknown):
```unknown
<ql-container><ql-editor></ql-editor></ql-container>
```

---

## slider | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/slider.html

**Contents:**
- # slider
      - 本页导读

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">设置step</view>
			<view>
				<slider value="60" @change="sliderChange" step="5" />
			</view>

			<view class="uni-title">显示当前value</view>
			<view>
				<slider value="50" @change="sliderChange" show-value />
			</view>

			<view class="uni-title">设置最小/最大值</view>
			<view>
				<slider value="100" @change="sliderChange" min="50" max="200" show-value />
			</view>

			<view class="uni-title">不同颜色和大小的滑块</view>
			<view>
				<slider value="50" @change="sliderChange" activeColor="#FFCC33" backgroundColor="#000000" block-color="#8A6DE9" block-size="20" />
			</view>
        </view>
    </view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        sliderChange(e) {
            console.log('value 发生变化：' + e.detail.value)
        }
    }
}
</script>
```

Example 2 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">设置step</view>
			<view>
				<slider value="60" @change="sliderChange" step="5" />
			</view>

			<view class="uni-title">显示当前value</view>
			<view>
				<slider value="50" @change="sliderChange" show-value />
			</view>

			<view class="uni-title">设置最小/最大值</view>
			<view>
				<slider value="100" @change="sliderChange" min="50" max="200" show-value />
			</view>

			<view class="uni-title">不同颜色和大小的滑块</view>
			<view>
				<slider value="50" @change="sliderChange" activeColor="#FFCC33" backgroundColor="#000000" block-color="#8A6DE9" block-size="20" />
			</view>
        </view>
    </view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        sliderChange(e) {
            console.log('value 发生变化：' + e.detail.value)
        }
    }
}
</script>
```

Example 3 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">设置step</view>
			<view>
				<slider value="60" @change="sliderChange" step="5" />
			</view>

			<view class="uni-title">显示当前value</view>
			<view>
				<slider value="50" @change="sliderChange" show-value />
			</view>

			<view class="uni-title">设置最小/最大值</view>
			<view>
				<slider value="100" @change="sliderChange" min="50" max="200" show-value />
			</view>

			<view class="uni-title">不同颜色和大小的滑块</view>
			<view>
				<slider value="50" @change="sliderChange" activeColor="#FFCC33" backgroundColor="#000000" block-color="#8A6DE9" block-size="20" />
			</view>
        </view>
    </view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        sliderChange(e) {
            console.log('value 发生变化：' + e.detail.value)
        }
    }
}
</script>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">设置step</view>
			<view>
				<slider value="60" @change="sliderChange" step="5" />
			</view>

			<view class="uni-title">显示当前value</view>
			<view>
				<slider value="50" @change="sliderChange" show-value />
			</view>

			<view class="uni-title">设置最小/最大值</view>
			<view>
				<slider value="100" @change="sliderChange" min="50" max="200" show-value />
			</view>

			<view class="uni-title">不同颜色和大小的滑块</view>
			<view>
				<slider value="50" @change="sliderChange" activeColor="#FFCC33" backgroundColor="#000000" block-color="#8A6DE9" block-size="20" />
			</view>
        </view>
    </view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        sliderChange(e) {
            console.log('value 发生变化：' + e.detail.value)
        }
    }
}
</script>
```

---

## live-player | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/live-player

**Contents:**
- # live-player
      - 本页导读

推荐uni直播，官方内置，使用简单，且价格便宜，更具高性价比！详情 。

使用live-player 组件需注意：如果发布到小程序，需要先通过各家小程序的审核。指定类目的小程序才能使用（微信小程序类目 、百度小程序类目 ），审核通过后在各家小程序管理后台自助开通该组件权限。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

Example 2 (html):
```html
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

Example 3 (html):
```html
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

Example 4 (python):
```python
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

---

## button | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/button.html

**Contents:**
- # button
- # size 有效值
- # type 有效值
- # form-type 有效值
- # contact-type有效值
- # open-type 有效值
  - # feedback
  - # launchApp
- # button样式修改
- # button点击

button组件也支持style中通过css定义文字大小。见下

button组件也支持style中通过css定义颜色。见下

open-type 为 feedback时：

button组件属性中的size和type，属于预置样式，方便开发者使用。开发者也可以通过style和class来自定义样式。

button虽然可以内嵌text组件，但不建议通过text组件来修改button样式，因为会导致hover-class不生效。尤其是uvue中样式不继承。建议直接在button组件的style或class属性编写样式。

style和class的优先级，高于size和type属性。

示例源码如下，请查看 pre > code 标签中的内容

button 组件的点击遵循 vue 标准的 @click事件。

button 组件没有 url 属性，如果要跳转页面，可以在@click中编写，也可以在button组件外面套一层 navigator 组件。举例，如需跳转到about页面，可按如下几种代码写法执行：

示例源码如下，请查看 pre > code 标签中的内容

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

事件务必使用vue语法，比如下面的获取手机号示例

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
button-hover
```

Example 2 (json):
```json
{background-color: rgba(0, 0, 0, 0.1); opacity: 0.7;}
```

Example 3 (unknown):
```unknown
open-type="launchApp"
```

Example 4 (html):
```html
<template>
	<button size="default" type="default"
	style="color:#ffffff;backgroundColor:#1AAD19;borderColor:#1AAD19"
	hover-class="is-hover">按钮</button>
</template>
<style>
.is-hover {
	color: rgba(255, 255, 255, 0.6);
	background-color: #179b16;
	border-color: #179b16;
  }
</style>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-dateformat.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Dateformat Props
    - # Threshold Options
    - # Format Options
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

格式化组件会对时间进行用户友好转化，threshold就是用来控制转化的时间阈值的。

以[60000, 3600000]为例，将传入时间与当前时间差的绝对值记为delta（单位毫秒）

如果不想转化为“马上|刚刚”可以传入:threshold = "[0,3600000]"。默认值[0,0]既不会转换为“马上|刚刚”也不会转化为“xx分钟前|xx分钟后”

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uDateformat
```

Example 2 (html):
```html
<!-- 一般用法 -->
<uni-dateformat date="2020/10/20 20:20:20"></uni-dateformat>

<!-- 不显示刚刚/马上/xx分钟前 -->
<uni-dateformat date="2020/10/20 20:20:20" :threshold="[0,0]"></uni-dateformat>
```

Example 3 (html):
```html
<!-- 一般用法 -->
<uni-dateformat date="2020/10/20 20:20:20"></uni-dateformat>

<!-- 不显示刚刚/马上/xx分钟前 -->
<uni-dateformat date="2020/10/20 20:20:20" :threshold="[0,0]"></uni-dateformat>
```

Example 4 (html):
```html
<!-- 一般用法 -->
<uni-dateformat date="2020/10/20 20:20:20"></uni-dateformat>

<!-- 不显示刚刚/马上/xx分钟前 -->
<uni-dateformat date="2020/10/20 20:20:20" :threshold="[0,0]"></uni-dateformat>
```

---

## switch | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/switch.html

**Contents:**
- # switch
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例代码说明：以上示例代码从hello uni-app示例中复制，涉及的css样式在hello uni-app的app.vue和uni.css中

预览H5效果：使用浏览器的手机模式访问https://hellouniapp.dcloud.net.cn/pages/component/switch/switch

**Examples:**

Example 1 (vue):
```vue
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">默认样式</view>
			<view>
				<switch checked @change="switch1Change" />
				<switch @change="switch2Change" />
			</view>
			<view class="uni-title">不同颜色和尺寸的switch</view>
			<view>
				<switch checked color="#FFCC33" style="transform:scale(0.7)"/>
				<switch color="#FFCC33" style="transform:scale(0.7)"/>
			</view>
			<view class="uni-title">推荐展示样式</view>
		</view>
		<view class="uni-list">
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">开启中</view>
				<switch checked />
			</view>
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">关闭</view>
				<switch />
			</view>
		</view>
	</view>
</template>
```

Example 2 (vue):
```vue
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">默认样式</view>
			<view>
				<switch checked @change="switch1Change" />
				<switch @change="switch2Change" />
			</view>
			<view class="uni-title">不同颜色和尺寸的switch</view>
			<view>
				<switch checked color="#FFCC33" style="transform:scale(0.7)"/>
				<switch color="#FFCC33" style="transform:scale(0.7)"/>
			</view>
			<view class="uni-title">推荐展示样式</view>
		</view>
		<view class="uni-list">
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">开启中</view>
				<switch checked />
			</view>
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">关闭</view>
				<switch />
			</view>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">默认样式</view>
			<view>
				<switch checked @change="switch1Change" />
				<switch @change="switch2Change" />
			</view>
			<view class="uni-title">不同颜色和尺寸的switch</view>
			<view>
				<switch checked color="#FFCC33" style="transform:scale(0.7)"/>
				<switch color="#FFCC33" style="transform:scale(0.7)"/>
			</view>
			<view class="uni-title">推荐展示样式</view>
		</view>
		<view class="uni-list">
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">开启中</view>
				<switch checked />
			</view>
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">关闭</view>
				<switch />
			</view>
		</view>
	</view>
</template>
```

Example 4 (jsx):
```jsx
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title">默认样式</view>
			<view>
				<switch checked @change="switch1Change" />
				<switch @change="switch2Change" />
			</view>
			<view class="uni-title">不同颜色和尺寸的switch</view>
			<view>
				<switch checked color="#FFCC33" style="transform:scale(0.7)"/>
				<switch color="#FFCC33" style="transform:scale(0.7)"/>
			</view>
			<view class="uni-title">推荐展示样式</view>
		</view>
		<view class="uni-list">
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">开启中</view>
				<switch checked />
			</view>
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">关闭</view>
				<switch />
			</view>
		</view>
	</view>
</template>
```

---

## movable-area | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/movable-area.html

**Contents:**
- # movable-area
      - 本页导读

由于app和小程序的架构是逻辑层与视图层分离，使用js监听拖动时会引发逻辑层和视图层的频繁通讯，影响性能。为了方便高性能的实现拖动，平台特封装了movable-area组件。

movable-area指代可拖动的范围，在其中内嵌movable-view组件用于指示可拖动的区域。

即手指/鼠标按住movable-view拖动或双指缩放，但拖不出movable-area规定的范围。

当然也可以不拖动，而使用代码来触发movable-view在movable-area里的移动缩放。

movable-view的规范另见movable-view。

注意：movable-area 必须设置 width 和 height 属性，不设置默认为 10px

**Examples:**

Example 1 (unknown):
```unknown
movable-area
```

Example 2 (unknown):
```unknown
movable-area
```

Example 3 (unknown):
```unknown
movable-view
```

Example 4 (unknown):
```unknown
movable-view
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-tooltip.html

**Contents:**
- # 介绍
  - # 安装方式
  - # 基本用法
- # API
  - # Tooltip Props
  - # Tooltip Slots
- # 示例
      - 本页导读

常用于展示鼠标 hover 时的提示信息。

本组件符合easycom 规范，HBuilderX 2.5.5起，只需将本组件导入项目，在页面template中即可直接使用，无需在页面中import和注册components。

如需通过npm方式使用uni-ui组件，另见文档：https://ext.dcloud.net.cn/plugin?id=55

示例源码如下，请查看 pre > code 标签中的内容

直接拷贝示例代码，无法运行 ，示例依赖了 uni-card uni-section uni-scss 等多个组件。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
HBuilderX 2.5.5
```

Example 2 (html):
```html
<uni-tooltip :content="tooltip显示的内容" placement="left">
  <button>被包裹的组件</button>
</uni-tooltip>
```

Example 3 (html):
```html
<uni-tooltip :content="tooltip显示的内容" placement="left">
  <button>被包裹的组件</button>
</uni-tooltip>
```

Example 4 (html):
```html
<uni-tooltip :content="tooltip显示的内容" placement="left">
  <button>被包裹的组件</button>
</uni-tooltip>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-grid.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 不带边框并矩形显示
- # API
  - # Grid Props
  - # Grid Events
  - # GridItem Props
- # 示例
      - 本页导读

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (php):
```php
详情 --> 项目配置 --> 启用 component2 编译
```

Example 2 (html):
```html
<uni-grid :column="3">
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
</uni-grid>
```

Example 3 (html):
```html
<uni-grid :column="3">
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
</uni-grid>
```

Example 4 (html):
```html
<uni-grid :column="3">
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
	<uni-grid-item>
		<text class="text">文本</text>
	</uni-grid-item>
</uni-grid>
```

---

## uni.canvasGetImageData(OBJECT, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/canvasGetImageData

**Contents:**
- # uni.canvasGetImageData(OBJECT, componentInstance)
  - # canvasGetImageData 兼容性
      - 本页导读

返回一个数组，用来描述 canvas 区域隐含的像素数据，在自定义组件下，第二个参数传入自定义组件实例 this，以操作组件内 <canvas> 组件。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

Example 2 (javascript):
```javascript
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

Example 3 (javascript):
```javascript
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

Example 4 (css):
```css
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

---

## uni.createVideoContext(videoId, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/video-context

**Contents:**
- # uni.createVideoContext(videoId, componentInstance)
  - # createVideoContext 兼容性
      - 本页导读

创建并返回 video 上下文 videoContext 对象。在自定义组件下，第二个参数传入组件实例this，以操作组件内 <video> 组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (jsx):
```jsx
<video id="video1" ref="video1"></video>
```

Example 2 (bash):
```bash
this.$refs.video1
```

Example 3 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section">
				<video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/wap2appvsnative.mp4" @error="videoErrorCallback" :danmu-list="danmuList"
				    enable-danmu danmu-btn controls>
                                </video>

				<view class="uni-list">
					<view class="uni-list-cell">
						<view>
							<view class="uni-label">弹幕内容</view>
						</view>
						<view class="uni-list-cell-db">
							<input @blur="bindInputBlur" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
						</view>
					</view>
				</view>
				<view class="btn-area">
					<button @tap="bindSendDanmu" class="page-body-button" formType="submit">发送弹幕</button>
				</view>
			</view>
		</view>
	</view>
</template>
```

Example 4 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section">
				<video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/wap2appvsnative.mp4" @error="videoErrorCallback" :danmu-list="danmuList"
				    enable-danmu danmu-btn controls>
                                </video>

				<view class="uni-list">
					<view class="uni-list-cell">
						<view>
							<view class="uni-label">弹幕内容</view>
						</view>
						<view class="uni-list-cell-db">
							<input @blur="bindInputBlur" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
						</view>
					</view>
				</view>
				<view class="btn-area">
					<button @tap="bindSendDanmu" class="page-body-button" formType="submit">发送弹幕</button>
				</view>
			</view>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-component.html

**Contents:**
- # uts插件 - 组件开发
- # uts组件开发模式
- # uni-app兼容模式组件介绍
      - 本页导读

uts插件的组件开发，简称uts组件，是uts插件的一个分支。uts插件提供了原生API的扩展，而uts组件提供了原生UI组件的开发模式。

组件是一种独立、可复用的UI单元，用于单独封装和承担一定的代码逻辑。

比如<video>是组件；uni.showModal 或 uni.createRewardedVideoAd 虽然有UI，但属于API。

组件一般适用于封装非全屏的场景，即在页面中内嵌一个区域。如果需要你需要封装的UI是全屏界面，也可以通过API来弹出全屏的activity或view controller，但弹出这种原生窗体后，需要注意和UniPage的页面栈的关系。uts通过API方式开发原生页面的示例：uts开发原生页面示例

当然uts组件是多端的，一个uts组件作为一个uni_modules，可同时支持app-Android、app-iOS、app-Harmony、web、以及各家小程序组件。

app平台如何将原生UI扩展成一个组件，嵌入在页面中？有以下开发模式：

一般来讲，我们推荐开发者使用标准模式。这种模式就是写一个标准的vue组件，没有学习和认知门槛。

因为uni-app下只有nvue页面才能放置原生扩展的组件，而nvue已经不再维护，我们推荐开发者在uni-app上使用web组件。除非你的组件无法使用web实现，可以接受在uni-app的app-nvue中使用，且不需要鸿蒙支持，才使用uni-app兼容模式。

uni-app 项目不支持 native-view 组件，因此无法使用标准模式开发uts组件。

为了让原生开发的ui组件可以在页面上作为一个组件来嵌入，DCloud参考vue规范定义了一个特殊组件规范，部分实现了vue组件规范、且又扩充了一些规范（如生命周期NVBeforeLoad、NVLoad、NVLoaded、NVLayouted、NVBeforeUnload、NVUnloaded等）。

uni-app兼容模式的好处是即可以在uni-app的nvue页面使用，也可以在uni-app x的uvue页面使用。

如果您的插件仅服务uni-app x，那么没必要使用uni-app兼容模式。

如果您确定需要使用uni-app兼容模式来开发uts组件，那么需要了解这种模式的开发规范，详情参考uts组件 - uni-app兼容模式组件开发。

**Examples:**

Example 1 (unknown):
```unknown
uni.showModal
```

Example 2 (unknown):
```unknown
uni.createRewardedVideoAd
```

Example 3 (unknown):
```unknown
uni_modules
```

Example 4 (unknown):
```unknown
uni-app兼容模式
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-transition.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 样式覆盖
  - # 自定义动画
- # API
  - # Transition Props
    - # mode-class 内置过渡动画类型说明
  - # Transition Events
  - # Transition Methons
  - # init(OBJECT:config)

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

注意：nvue 不支持 custom-class 属性 ，需要使用 styles 属性进行兼容

使用 custom-class 属性绑定样式，可以自定义 uni-transition 的样式

示例源码如下，请查看 pre > code 标签中的内容

如果使用 styles 注意带’-‘连接符的属性需要使用小驼峰写法如：backgroundColor:red

示例源码如下，请查看 pre > code 标签中的内容

当内置动画类型不能满足需求的时候 ，可以使用 step() 和 run() 自定义动画,入参以及具体用法参考下方属性说明

示例源码如下，请查看 pre > code 标签中的内容

格式为 ：'fade' 或者 ['fade','slide-top']

组合使用时，同一种类型相反的过渡动画如（slide-top、slide-bottom）同时使用时，只有最后一个生效

手动设置动画配置，需要在页面渲染完毕后调用

示例源码如下，请查看 pre > code 标签中的内容

调用 step() 来表示一组动画完成，step 第一个参数可以传入任意多个动画方法，一组动画中的所有动画会同时开始，一组动画完成后才会进行下一组动画。step 第二个参数可以传入一个跟 uni.createAnimation() 一样的配置参数用于指定当前组动画的配置。

示例源码如下，请查看 pre > code 标签中的内容

在执行 step() 后，需要调用 run() 来运行动画 ，否则动画会一直等待

run() 方法可以传入一个 callback 函数 ，会在所有动画执行完毕后回调

示例源码如下，请查看 pre > code 标签中的内容

动画配置 ， init() 与 step() 第二个参数配置相同 ，如果配置step() 第二个参数，将会覆盖 init() 的配置

示例源码如下，请查看 pre > code 标签中的内容

如果同一个动画方法有多个值，多个值使用数组分隔

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uTransition
```

Example 2 (html):
```html
<template>
	<view>
		<button type="primary" @click="open">fade</button>
		<uni-transition mode-class="fade" :styles="{'width':'100px','height':'100px','backgroundColor':'red'}" :show="show" @change="change" />
	</view>
</template>

<script>
export default {
	data() {
		return {
			show: false,
		}
	},
	onLoad() {},
	methods: {
		open(mode) {
			this.show = !this.show
		},
		change() {
			console.log('触发动画')
		}
	}
}
</script>
```

Example 3 (html):
```html
<template>
	<view>
		<button type="primary" @click="open">fade</button>
		<uni-transition mode-class="fade" :styles="{'width':'100px','height':'100px','backgroundColor':'red'}" :show="show" @change="change" />
	</view>
</template>

<script>
export default {
	data() {
		return {
			show: false,
		}
	},
	onLoad() {},
	methods: {
		open(mode) {
			this.show = !this.show
		},
		change() {
			console.log('触发动画')
		}
	}
}
</script>
```

Example 4 (html):
```html
<template>
	<view>
		<button type="primary" @click="open">fade</button>
		<uni-transition mode-class="fade" :styles="{'width':'100px','height':'100px','backgroundColor':'red'}" :show="show" @change="change" />
	</view>
</template>

<script>
export default {
	data() {
		return {
			show: false,
		}
	},
	onLoad() {},
	methods: {
		open(mode) {
			this.show = !this.show
		},
		change() {
			console.log('触发动画')
		}
	}
}
</script>
```

---

## image | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/image.html

**Contents:**
- # image
- # 图片格式说明：
- # mode 有效值
- # 示例
      - 本页导读

图片需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

mode 有 14 种模式，其中 5 种是缩放模式，9 种是裁剪模式。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

scaleToFill：不保持纵横比缩放图片，使图片完全适应

aspectFit：保持纵横比缩放图片，使图片的长边能完全显示出来

aspectFill：保持纵横比缩放图片，只保证图片的短边能完全显示出来

bottom：不缩放图片，只显示图片的底部区域

center：不缩放图片，只显示图片的中间区域

left：不缩放图片，只显示图片的左边区域

right：不缩放图片，只显示图片的右边边区域

top left：不缩放图片，只显示图片的左上边区域

top right：不缩放图片，只显示图片的右上边区域

bottom left：不缩放图片，只显示图片的左下边区域

bottom right：不缩放图片，只显示图片的右下边区域

**Examples:**

Example 1 (unknown):
```unknown
app-nvue平台，暂时默认为屏幕宽度、高度 240px；
```

Example 2 (csharp):
```csharp
image{will-change: transform}
```

Example 3 (vue):
```vue
<template>
    <view class="page">
        <view class="image-list">
            <view class="image-item" v-for="(item,index) in array" :key="index">
                <view class="image-content">
                    <image style="width: 200px; height: 200px; background-color: #eeeeee;" :mode="item.mode" :src="src"
                        @error="imageError"></image>
                </view>
                <view class="image-title">{{item.text}}</view>
            </view>
        </view>
    </view>
</template>
```

Example 4 (vue):
```vue
<template>
    <view class="page">
        <view class="image-list">
            <view class="image-item" v-for="(item,index) in array" :key="index">
                <view class="image-content">
                    <image style="width: 200px; height: 200px; background-color: #eeeeee;" :mode="item.mode" :src="src"
                        @error="imageError"></image>
                </view>
                <view class="image-title">{{item.text}}</view>
            </view>
        </view>
    </view>
</template>
```

---

## web-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/web-view

**Contents:**
- # web-view
  - # uni.postMessage(OBJECT)
  - # uni.getEnv(CALLBACK)
- # App端web-view的扩展
  - # web-view组件的层级问题解决
  - # web-view组件的浏览器内核说明
  - # UniAppJSBridgeReady 的使用
  - # nvue webview通信示例
  - # HarmonyOS 使用问题
  - # FAQ

web-view 是一个 web 浏览器组件，可以用来承载网页的容器，会自动铺满整个页面（nvue 使用需要手动指定宽高）。

各小程序平台，web-view 加载的 url 需要在后台配置域名白名单，包括内部再次 iframe 内嵌的其他 url 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

<web-view> 加载的网页中支持调用部分 uni 接口：

网页向应用发送消息，在 <web-view> 的 message 事件回调 event.detail.data 中接收消息。

在 <web-view> 加载的 HTML 中，添加以下代码：

示例源码如下，请查看 pre > code 标签中的内容

App端的webview是非常强大的，可以更灵活的控制和拥有更丰富的API。

每个vue页面，其实都是一个webview，而vue页面里的web-view组件，其实是webview里的一个子webview。这个子webview被append到父webview上。

通过以下方法，可以获得这个web-view组件对应的js对象，然后参考https://www.html5plus.org/doc/zh_cn/webview.html#plus.webview.WebviewObject ，可以进一步重设这个web-view组件的样式，比如调整大小

示例源码如下，请查看 pre > code 标签中的内容

甚至可以不用web-view组件，直接js创建一个子webview来加载html。比如不希望远程网页使用plus的API，不管是因为安全原因还是因为back监听冲突，可以使用如下代码：

示例源码如下，请查看 pre > code 标签中的内容

如果想设置web-view组件可双指缩放，可参考如下代码：

示例源码如下，请查看 pre > code 标签中的内容

web-view组件在App和小程序中层级较高，如需要在vue页面中写代码为web-view组件覆盖内容，小程序端无解，只能由web-view的组件自己弹出div。App端有如下若干方案：

uni.webView.navigateTo 示例，注意uni sdk放到body下面

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HarmonyOS 不支持 plus，但可以直接使用行内样式或者 class 控制显示效果。如果需要使用 back、evalJS 等方法，请使用 uni.createWebviewContext

Q：web-view 的页面怎么和应用内的页面交互？ A：调用 uni 相关的 API，就可以实现页面切换及发送消息。参考：在 web-view 加载的 HTML 中调用 uni 的 API

Q：web-view 加载的 HTML 中，能够调用 5+ 的能力么？ A：加载的 HTML 中是有 5+ 环境的，在 plusready 后调用即可。参考：一个简单实用的 plusready 方法

Q: web-view 加载 uni-app H5，内部跳转冲突如何解决 A：使用 uni.webView.navigateTo...

**Examples:**

Example 1 (unknown):
```unknown
postMessage
```

Example 2 (unknown):
```unknown
postMessage
```

Example 3 (unknown):
```unknown
update-title
```

Example 4 (html):
```html
<template>
	<view>
		<web-view :webview-styles="webviewStyles" src="https://uniapp.dcloud.io/static/web-view.html"></web-view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				webviewStyles: {
					progress: {
						color: '#FF3333'
					}
				}
			}
		}
	}
</script>

<style>

</style>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-swiper-dot.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # SwiperDot Props
    - # dotsStyles Options
- # 示例
      - 本页导读

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
swiper-item
```

Example 2 (html):
```html
<uni-swiper-dot :info="info" :current="current" field="content" :mode="mode">
	<swiper class="swiper-box" @change="change">
		<swiper-item v-for="(item ,index) in info" :key="index">
			<view class="swiper-item">
				{{item.content}}
			</view>
		</swiper-item>
	</swiper>
</uni-swiper-dot>
```

Example 3 (html):
```html
<uni-swiper-dot :info="info" :current="current" field="content" :mode="mode">
	<swiper class="swiper-box" @change="change">
		<swiper-item v-for="(item ,index) in info" :key="index">
			<view class="swiper-item">
				{{item.content}}
			</view>
		</swiper-item>
	</swiper>
</uni-swiper-dot>
```

Example 4 (html):
```html
<uni-swiper-dot :info="info" :current="current" field="content" :mode="mode">
	<swiper class="swiper-box" @change="change">
		<swiper-item v-for="(item ,index) in info" :key="index">
			<view class="swiper-item">
				{{item.content}}
			</view>
		</swiper-item>
	</swiper>
</uni-swiper-dot>
```

---

## Barcode | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/barcode.html

**Contents:**
    - # Barcode
      - # start(object)
        - # Object object
      - # cancel()
      - # setFlash(boolean)
        - # Boolean boolean
      - # 事件
      - # marked
        - # 返回参数说明
      - # error

属性说明 设置Barcode扫码控件的属性，如扫码框、扫码条的颜色等。

条码识别成功事件 {event.detail}

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

Example 2 (html):
```html
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

Example 3 (html):
```html
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

Example 4 (vue):
```vue
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

---

## swiper | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/swiper.html

**Contents:**
- # swiper
    - # easing-function
    - # swiper-item
      - 本页导读

一般用于左右滑动或上下滑动，比如banner轮播图。

注意滑动切换和滚动的区别，滑动切换是一屏一屏的切换。swiper下的每个swiper-item是一个滑动切换区域，不能停留在2个滑动区域之间。

change 事件返回 detail 中包含一个 source 字段，表示导致变更的原因，可能值如下：

仅可放置在 <swiper> 组件中，宽高自动设置为100%。注意：宽高100%是相对于其父组件，不是相对于子组件，不能被子组件自动撑开。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (python):
```python
@animationfinish
```

Example 2 (unknown):
```unknown
<scroll-view>
```

Example 3 (unknown):
```unknown
<swiper-item>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-margin-wrap">
			<swiper class="swiper" circular :indicator-dots="indicatorDots" :autoplay="autoplay" :interval="interval"
				:duration="duration">
				<swiper-item>
					<view class="swiper-item uni-bg-red">A</view>
				</swiper-item>
				<swiper-item>
					<view class="swiper-item uni-bg-green">B</view>
				</swiper-item>
				<swiper-item>
					<view class="swiper-item uni-bg-blue">C</view>
				</swiper-item>
			</swiper>
		</view>

		<view class="swiper-list">
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">指示点</view>
				<switch :checked="indicatorDots" @change="changeIndicatorDots" />
			</view>
			<view class="uni-list-cell uni-list-cell-pd">
				<view class="uni-list-cell-db">自动播放</view>
				<switch :checked="autoplay" @change="changeAutoplay" />
			</view>
		</view>

		<view class="uni-padding-wrap">
			<view class="uni-common-mt">
				<text>幻灯片切换时长(ms)</text>
				<text class="info">{{duration}}</text>
			</view>
			<slider @change="durationChange" :value="duration" min="500" max="2000" />
			<view class="uni-common-mt">
				<text>自动播放间隔时长(ms)</text>
				<text class="info">{{interval}}</text>
			</view>
			<slider @change="intervalChange" :value="interval" min="2000" max="10000" />
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-load-more.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # LoadMore Props
    - # Status Options
    - # IconType Options
  - # LoadMore Events
- # 示例
      - 本页导读

用于列表中，做滚动加载使用，展示 loading 的各种状态。

示例源码如下，请查看 pre > code 标签中的内容

iconType为snow时，在APP-NVUE平台不可设置大小，在非APP-NVUE平台不可设置颜色

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-load-more status="more"></uni-load-more>
```

Example 2 (html):
```html
<uni-load-more status="more"></uni-load-more>
```

Example 3 (html):
```html
<uni-load-more status="more"></uni-load-more>
```

Example 4 (unknown):
```unknown
<uni-load-more status="more"></uni-load-more>
```

---

## cell | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/cell.html

**Contents:**
- # cell
    - # 子组件
    - # 属性
    - # 样式
    - # 事件
      - 本页导读

app端nvue专用组件。它的重要价值在于告诉原生引擎，哪些部分是可重用的。

<cell> Cell 必须以一级子组件的形式存在于 list recycler waterfall 中。

Cell 支持添加任意类型的组件作为自己的子组件，但是请不要再内部添加滚动容器了。

keep-scroll-position boolean, 它控制插入单元格后是否保持最后一个滑动位置。

insert-animation string, cell 的插入动画。当前只支持 none 和 default。

delete-animation string, cell 的删除动画。当前只支持 none 和 default。

recycle boolean, 默认值 true。这个属性控制这个 Cell 的 view 和子 views 是否在列表滚动时进行回收，在 iOS 上通常必须指定为 true （因为默认为 true，所以一般不需要写这个属性），如果设置为 false，列表滚动时，页面会占用非常高的内存。Android上默认是true，设置为false可以防止Image和Text上数据重新绑定。

render-reverse-position boolean, 默认值 false。定义开始渲染的位置，需搭配list的属性render-reverse共同使用，单独配置不起作用。HBuilderX3.6.9+支持。

**Examples:**

Example 1 (unknown):
```unknown
list recycler waterfall
```

Example 2 (unknown):
```unknown
render-reverse
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-row.html

**Contents:**
- # 介绍
  - # 平台差异说明
  - # uni-row
  - # uni-col
  - # 基本用法
  - # 分栏偏移
  - # 响应式布局
  - # 使用到的 CSS
- # API
  - # Row Props

流式栅格系统，随着屏幕或视口分为 24 份，可以迅速简便地创建布局。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-row class="demo-uni-row">
	<uni-col>
		<view class="demo-uni-col dark_deep"></view>
	</uni-col>
</uni-row>

<uni-row class="demo-uni-row">
	<uni-col :span="12">
		<view class="demo-uni-col dark"></view>
	</uni-col>
	<uni-col :span="12">
		<view class="demo-uni-col light"></view>
	</uni-col>
</uni-row>
```

Example 2 (html):
```html
<uni-row class="demo-uni-row">
	<uni-col>
		<view class="demo-uni-col dark_deep"></view>
	</uni-col>
</uni-row>

<uni-row class="demo-uni-row">
	<uni-col :span="12">
		<view class="demo-uni-col dark"></view>
	</uni-col>
	<uni-col :span="12">
		<view class="demo-uni-col light"></view>
	</uni-col>
</uni-row>
```

Example 3 (html):
```html
<uni-row class="demo-uni-row">
	<uni-col>
		<view class="demo-uni-col dark_deep"></view>
	</uni-col>
</uni-row>

<uni-row class="demo-uni-row">
	<uni-col :span="12">
		<view class="demo-uni-col dark"></view>
	</uni-col>
	<uni-col :span="12">
		<view class="demo-uni-col light"></view>
	</uni-col>
</uni-row>
```

Example 4 (jsx):
```jsx
<uni-row class="demo-uni-row">
	<uni-col>
		<view class="demo-uni-col dark_deep"></view>
	</uni-col>
</uni-row>

<uni-row class="demo-uni-row">
	<uni-col :span="12">
		<view class="demo-uni-col dark"></view>
	</uni-col>
	<uni-col :span="12">
		<view class="demo-uni-col light"></view>
	</uni-col>
</uni-row>
```

---

## icon | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/icon.html

**Contents:**
- # icon
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

Example 2 (html):
```html
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

Example 3 (html):
```html
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

Example 4 (typescript):
```typescript
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-list.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 多行内容显示
  - # 右侧显示角标、switch
  - # 左侧显示略缩图、图标
  - # 开启点击反馈和右侧箭头
  - # 聊天列表示例
- # API
  - # List Props
  - # ListItem Props

代码块： uList、uListItem 关联组件：uni-list-item、uni-badge、uni-icons、uni-list-chat

List 列表组件，包含基本列表样式、可扩展插槽机制、长列表性能优化、多端兼容。

在vue页面里，它默认使用页面级滚动。在app-nvue页面里，它默认使用原生list组件滚动。这样的长列表，在滚动出屏幕外后，系统会回收不可见区域的渲染内存资源，不会造成滚动越长手机越卡的问题。

uni-list组件是父容器，里面的核心是uni-list-item子组件，它代表列表中的一个可重复行，子组件可以无限循环。

uni-list-item有很多风格，uni-list-item组件通过内置的属性，满足一些常用的场景。当内置属性不满足需求时，可以通过扩展插槽来自定义列表内容。

内置属性可以覆盖的场景包括：导航列表、设置列表、小图标列表、通信录列表、聊天记录列表。

涉及很多大图或丰富内容的列表，比如类今日头条的新闻列表、类淘宝的电商列表，需要通过扩展插槽实现。

uni-list不包含下拉刷新和上拉翻页。上拉翻页另见组件：uni-load-more

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过插槽扩展 需要注意的是当使用插槽时，内置样式将会失效，只保留排版样式，此时的样式需要开发者自己实现 如果 uni-list-item 组件内置属性样式无法满足需求，可以使用插槽来自定义uni-list-item里的内容。 uni-list-item提供了3个可扩展的插槽：header、body、footer

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-list-item
```

Example 2 (unknown):
```unknown
uni-list-chat
```

Example 3 (unknown):
```unknown
'uni-icons'
```

Example 4 (unknown):
```unknown
uni-list-item
```

---

## progress | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/progress.html

**Contents:**
- # progress
      - 本页导读

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="progress-box">
				<progress :percent="pgList[0]" show-info stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[1]" stroke-width="3" />
				<uni-icons type="close" class="progress-cancel" color="#dd524d"></uni-icons>
			</view>
			<view class="progress-box">
				<progress :percent="pgList[2]" stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[3]" activeColor="#10AEFF" stroke-width="3" />
			</view>
			<view class="progress-control">
				<button type="primary" @click="setProgress">设置进度</button>
				<button type="warn" @click="clearProgress">清除进度</button>
			</view>
		</view>
	</view>
</template>
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="progress-box">
				<progress :percent="pgList[0]" show-info stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[1]" stroke-width="3" />
				<uni-icons type="close" class="progress-cancel" color="#dd524d"></uni-icons>
			</view>
			<view class="progress-box">
				<progress :percent="pgList[2]" stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[3]" activeColor="#10AEFF" stroke-width="3" />
			</view>
			<view class="progress-control">
				<button type="primary" @click="setProgress">设置进度</button>
				<button type="warn" @click="clearProgress">清除进度</button>
			</view>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="progress-box">
				<progress :percent="pgList[0]" show-info stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[1]" stroke-width="3" />
				<uni-icons type="close" class="progress-cancel" color="#dd524d"></uni-icons>
			</view>
			<view class="progress-box">
				<progress :percent="pgList[2]" stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[3]" activeColor="#10AEFF" stroke-width="3" />
			</view>
			<view class="progress-control">
				<button type="primary" @click="setProgress">设置进度</button>
				<button type="warn" @click="clearProgress">清除进度</button>
			</view>
		</view>
	</view>
</template>
```

Example 4 (typescript):
```typescript
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="progress-box">
				<progress :percent="pgList[0]" show-info stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[1]" stroke-width="3" />
				<uni-icons type="close" class="progress-cancel" color="#dd524d"></uni-icons>
			</view>
			<view class="progress-box">
				<progress :percent="pgList[2]" stroke-width="3" />
			</view>
			<view class="progress-box">
				<progress :percent="pgList[3]" activeColor="#10AEFF" stroke-width="3" />
			</view>
			<view class="progress-control">
				<button type="primary" @click="setProgress">设置进度</button>
				<button type="warn" @click="clearProgress">清除进度</button>
			</view>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-data-checkbox.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 多选框
  - # 设置最大最小值
  - # 设置禁用
  - # 自定义选中颜色
  - # 更多模式
- # API
  - # DataCheckbox Props
    - # Localdata Options

组件名：uni-data-checkbox

本组件是基于uni-app基础组件checkbox的封装。本组件要解决问题包括：

在uniCloud开发中，DB Schema中配置了enum枚举等类型后，在web控制台的自动生成表单 功能中，会自动生成uni-data-checkbox组件并绑定好data

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

设置 localdata 属性后，组件会通过数据渲染出对应的内容，默认显示的是单选框

需要注意 :multiple="false" 时（单选） ， value/v-model 的值是 String|Number 类型

示例源码如下，请查看 pre > code 标签中的内容

设置 multiple 属性，组件显示为多选框

需要注意 :multiple="true" 时（多选） ， value/v-model 的值是 Array 类型

示例源码如下，请查看 pre > code 标签中的内容

设置 :multiple="true" 时（多选） ，可以设置 min、max 属性

如果选中个数小于 min 属性设置的值，那么选中内容将不可取消，只有当选中个数大于等于 min且小于 max 时，才可取消选中

如果选中个数大于等于 max 属性设置的值，那么其他未选中内容将不可选

示例源码如下，请查看 pre > code 标签中的内容

如果需要禁用某项，需要在 localdata 属性的数据源中添加 disable 属性，而不是在组件中添加 disable 属性

示例源码如下，请查看 pre > code 标签中的内容

设置 selectedColor 属性，可以修改组件选中后的图标及边框颜色

设置 selectedTextColor 属性，可以修改组件选中后的文字颜色，如不填写默认同 selectedColor 属性 ，mode 属性为 tag 时，默认为白色

示例源码如下，请查看 pre > code 标签中的内容

设置 mode 属性，可以设置更多显示样式，目前内置样式有四种 default/list/button/tag

如果需要禁用某项，需要在 localdata 属性的数据源中添加 disable 属性，而不是在组件中添加 disable 属性

示例源码如下，请查看 pre > code 标签中的内容

localdata 属性的格式为数组，数组内每项是对象，需要严格遵循如下格式

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uDataCheckbox
```

Example 2 (unknown):
```unknown
uni-data-checkbox
```

Example 3 (unknown):
```unknown
manifest.json > app-plus
```

Example 4 (json):
```json
"nvueStyleCompiler" : "uni-app"
```

---

## textarea | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/textarea

**Contents:**
- # textarea
    - # inputmode 有效值
      - 本页导读

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

nvue下键盘右下角按钮点击仅触发换行；如想监听该按钮事件可以参考，示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

新增于 uni-app 3.7.0+ inputmode是html规范后期更新的内容。各家小程序还未支持此属性。

在符合条件的高版本webview里，uni-app的web和app-vue平台中可使用本属性。

富文本编辑的解决方案 在输入框里图文混排内容，在web上该功能依赖document，而小程序和app的正常页面又没有document。

**Examples:**

Example 1 (unknown):
```unknown
compositionstart、compositionend、compositionupdate
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-title uni-common-pl">输入区域高度自适应，不会出现滚动条</view>
		<view class="uni-textarea">
			<textarea @blur="bindTextAreaBlur" auto-height />
			</view>
			<view class="uni-title uni-common-pl">占位符字体是红色的textarea</view>
			<view class="uni-textarea">
				<textarea placeholder-style="color:#F76260" placeholder="占位符字体是红色的"/>
			</view>
		</view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        bindTextAreaBlur: function (e) {
            console.log(e.detail.value)
        }
    }
}
</script>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-title uni-common-pl">输入区域高度自适应，不会出现滚动条</view>
		<view class="uni-textarea">
			<textarea @blur="bindTextAreaBlur" auto-height />
			</view>
			<view class="uni-title uni-common-pl">占位符字体是红色的textarea</view>
			<view class="uni-textarea">
				<textarea placeholder-style="color:#F76260" placeholder="占位符字体是红色的"/>
			</view>
		</view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        bindTextAreaBlur: function (e) {
            console.log(e.detail.value)
        }
    }
}
</script>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-title uni-common-pl">输入区域高度自适应，不会出现滚动条</view>
		<view class="uni-textarea">
			<textarea @blur="bindTextAreaBlur" auto-height />
			</view>
			<view class="uni-title uni-common-pl">占位符字体是红色的textarea</view>
			<view class="uni-textarea">
				<textarea placeholder-style="color:#F76260" placeholder="占位符字体是红色的"/>
			</view>
		</view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        bindTextAreaBlur: function (e) {
            console.log(e.detail.value)
        }
    }
}
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/view

**Contents:**
- # view
      - 本页导读

所有的视图组件，包括view、swiper等，本身不显示任何可视化元素。它们的用途都是为了包裹其他真正显示的组件。

它类似于传统html中的div，用于包裹各种元素内容。

如果使用nvue ，则需注意，包裹文字应该使用<text>组件。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可快速体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

Example 2 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

Example 3 (html):
```html
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view class="uni-title uni-common-mt">
                flex-direction: row
                <text>\n横向布局</text>
            </view>
            <view class="uni-flex uni-row">
                <view class="flex-item uni-bg-red">A</view>
                <view class="flex-item uni-bg-green">B</view>
                <view class="flex-item uni-bg-blue">C</view>
            </view>
            <view class="uni-title uni-common-mt">
                flex-direction: column
                <text>\n纵向布局</text>
            </view>
            <view class="uni-flex uni-column">
                <view class="flex-item flex-item-V uni-bg-red">A</view>
                <view class="flex-item flex-item-V uni-bg-green">B</view>
                <view class="flex-item flex-item-V uni-bg-blue">C</view>
            </view>
        </view>
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-badge.html

**Contents:**
- # 介绍
  - # 基本用法
- # 属性/方法
  - # Badge Props
  - # Badge Events
- # 示例
      - 本页导读

数字角标一般和其它控件（列表、9宫格等）配合使用，用于进行数量提示，默认为实心灰色背景。

示例源码如下，请查看 pre > code 标签中的内容

直接拷贝示例代码，无法运行 ，示例依赖了 uni-card uni-section uni-scss 等多个组件。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-badge size="small" :text="100" absolute="rightBottom" type="primary">
	<button type="default">右下</button>
</uni-badge>

<uni-badge text="1"></uni-badge>

<uni-badge text="2" type="purple" @click="bindClick"></uni-badge>

<uni-badge text="3" type="primary" :inverted="true"></uni-badge>
```

Example 2 (html):
```html
<uni-badge size="small" :text="100" absolute="rightBottom" type="primary">
	<button type="default">右下</button>
</uni-badge>

<uni-badge text="1"></uni-badge>

<uni-badge text="2" type="purple" @click="bindClick"></uni-badge>

<uni-badge text="3" type="primary" :inverted="true"></uni-badge>
```

Example 3 (html):
```html
<uni-badge size="small" :text="100" absolute="rightBottom" type="primary">
	<button type="default">右下</button>
</uni-badge>

<uni-badge text="1"></uni-badge>

<uni-badge text="2" type="purple" @click="bindClick"></uni-badge>

<uni-badge text="3" type="primary" :inverted="true"></uni-badge>
```

Example 4 (jsx):
```jsx
<uni-badge size="small" :text="100" absolute="rightBottom" type="primary">
	<button type="default">右下</button>
</uni-badge>

<uni-badge text="1"></uni-badge>

<uni-badge text="2" type="purple" @click="bindClick"></uni-badge>

<uni-badge text="3" type="primary" :inverted="true"></uni-badge>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/color.html

**Contents:**
  - # 主色
  - # 辅助色
  - # 中性色
  - # 边框颜色
  - # 常规色
  - # 阴影
      - 本页导读

uni-ui为了避免视觉传达差异，使用一套特定的调色板来规定颜色，为你所搭建的产品提供一致的外观视觉感受。

uni-ui的主色使用了令人安静并放松的蓝色。

我们通过uni-scss提供了对应的颜色变量名

示例源码如下，请查看 pre > code 标签中的内容

除了主色外的场景色，需要在不同的场景中使用,不同颜色代表不同的场景，如：绿色代表成功、红色代表错误、黄色代表警告。

我们通过uni-scss提供了对应的颜色变量名

示例源码如下，请查看 pre > code 标签中的内容

中性色用于文本、背景和边框颜色。通过运用不同的中性色，来表现层次结构。

我们通过uni-scss提供了对应的颜色变量名

示例源码如下，请查看 pre > code 标签中的内容

我们通过uni-scss提供了对应的颜色变量名

示例源码如下，请查看 pre > code 标签中的内容

我们通过uni-scss提供了对应的颜色变量名

示例源码如下，请查看 pre > code 标签中的内容

我们通过uni-scss提供了对应的颜色变量名

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (css):
```css
$uni-primary: #2979ff;
$uni-primary-disable:#94bcff;
$uni-primary-light: #d4e4ff;
```

Example 2 (css):
```css
$uni-primary: #2979ff;
$uni-primary-disable:#94bcff;
$uni-primary-light: #d4e4ff;
```

Example 3 (css):
```css
$uni-primary: #2979ff;
$uni-primary-disable:#94bcff;
$uni-primary-light: #d4e4ff;
```

Example 4 (bash):
```bash
$uni-primary: #2979ff;
$uni-primary-disable:#94bcff;
$uni-primary-light: #d4e4ff;
```

---

## form | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/form.html

**Contents:**
- # form
      - 本页导读

表单，将组件内的用户输入的<switch> <input> <checkbox> <slider> <radio> <picker> 提交。

当点击 <form> 表单中 formType 为 submit 的 <button> 组件时，会将表单组件中的 value 值进行提交，需要在表单组件中加上 name 来作为 key。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

小程序端在form内的自定义组件内有input表单控件时，或者用普通标签实现表单控件，例如评分等，无法在form的submit事件内获取组件内表单控件值，此时可以使用behaviors。

对于 form 组件，目前可以自动识别下列内置 behaviors:

目前仅支持 微信小程序、QQ小程序、百度小程序、h5。

使自定义组件有类似于表单控件的行为。 form 组件可以识别这些自定义组件，并在 submit 事件中返回组件的字段名及其对应字段值。这将为它添加以下两个属性。

h5 vue3 暂不支持使用 behaviors 扩展表单组件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/intersection-observer

**Contents:**
- # uni.createIntersectionObserver([this], [options])
  - # createIntersectionObserver 兼容性
- # IntersectionObserver 对象的方法列表
  - # 返回值
    - # IntersectionObserver 的方法
    - # relativeTo(selector: string, margins?: any): IntersectionObserver;
      - # relativeTo 兼容性
      - # 参数 HarmonyOS 兼容性
      - # 返回值
    - # relativeToViewport(margins?: any): IntersectionObserver;

节点布局交叉状态 API 可用于监听两个或多个组件节点在布局位置上的相交状态。这一组API常常可以用于推断某些节点是否可以被用户看见、有多大比例可以被用户看见。

创建并返回一个 IntersectionObserver 对象实例。

自定义组件实例。支付宝小程序不支持此参数，传入仅为抹平写法差异

margins 参数： 用来扩展（或收缩）参照节点布局区域的边界。

下面的示例代码中，如果目标节点 ".test" 进入 ".scroll" 区域以下 100px 时，就会触发回调函数。

示例源码如下，请查看 pre > code 标签中的内容

observe 回调函数 result 包含的字段

relativeTo 使用选择器指定一个节点，作为参照区域之一

relativeToViewport 指定页面显示区域作为参照区域之一

observe 指定目标节点并开始监听相交状态变化情况

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
IntersectionObserver
```

Example 2 (unknown):
```unknown
targetSelector
```

Example 3 (javascript):
```javascript
uni.createIntersectionObserver(this).relativeTo('.scroll',{bottom: 100}).observe('.test', (res) => {
  console.log(res);
})
```

Example 4 (javascript):
```javascript
uni.createIntersectionObserver(this).relativeTo('.scroll',{bottom: 100}).observe('.test', (res) => {
  console.log(res);
})
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/uts-component-compatible.html

**Contents:**
- # uts插件 - uni-app兼容模式组件（原“组件插件”）开发
- # 前置条件
- # UTS组件结构解析
  - # UTS组件目录结构
  - # index.vue源码结构
  - # 生命周期
  - # 内置对象和函数
  - # 通用事件
- # 简单View的示例
  - # 创建插件

HBuilderX3.6.18 及以上版本支持，app-harmony平台不支持此类型插件

本文重点在于讲述如何在app-android和app-ios上，将一个原生UI封装为兼容uni-app项目的UTS组件，供使用者在nvue/uvue页面template中以组件的方式调用。

继续阅读文档前，开发者需要了解以下前置条件：

如上所示，UTS组件的目录结构与UTS插件基本相同

唯一的差别在于，UTS组件入口文件有两个:

用户如果在开发组件的同时，存在一些与组件无关的能力需要对外暴露，可以在index.uts中进行实现

大多数情况下，我们只需要开发一个index.vue 即可，如果存在多个组件，可以新建多个 xxx.vue文件

关于 index.vue 源码如何编写，我们会在下一个章节介绍

下面是一个组件源码 index.vue 完整示例：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

index.vue 要素可以分为以下几类：

name：组件的使用标签，可以省略，若省略则默认为组件名称

emits：组件允许的消息事件名称，如果没有组件消息，不需要配置

props：需要由组件的使用者提供，比如一个Image组件，会需要一个path属性作为图像路径来源

watch：属性的监听实现，用来监听属性数据更新。

data：组件内部数据定义，用于组件内部逻辑处理，不对外暴露

methods：组件方法定义，可以通过与expose组合使用，区分对内方法和对外方法

expose：与methods 字段配合使用，用以区分组件对内方法和对外方法

组件需要重点处理 内存创建/销毁，View载体创建/销毁 过程中的资源管理，具体参考生命周期章节

为了方便组件开发者，UTS组件内置了部分变量与函数，具体参考内置对象与函数章节

组件开发者需要重点关注组件的生命周期，以便进行资源的初始化和回收

除上述生命周期外，还存在下列可选周期函数：

NVMeasure 用于告诉排版系统，组件自身需要的宽高，具体的调用时机由排版系统决定。

一般情况下，组件的宽高应该是由终端系统的排版引擎决定，组件开发者不需要实现此函数。

但是部分场景下，组件开发者需要自己维护宽高，则需要开发者重写此函数

NVUpdateStyles 用来监听组件的外部style 变化，通常用来写响应外部的css样式变化从而动态更新组件内部状态场景

示例源码如下，请查看 pre > code 标签中的内容

HBuilderX 4.0版本起支持，仅uni-app x App-Android平台支持

当UTS组件在list-view组件中使用时，由于复用机制，UTS组件可能表现异常（UI、事件回调等），因此，组件开发者需要在此函数中进行相应的逻辑处理。

比如我们使用UTS组件封装了一个Android原生的EditText控件（输入框），代码如下

示例源码如下，请查看 pre > code 标签中的内容

然后我们在list-view组件中使用该UTS组件，当我们在第一个输入框中随机输入几个字符后，开始滚动列表，会发现之前输入的字符又出现在下面某个list-item中，这就是一个典型的由于复用机制导致的UI状态异常问题。此时我们就需要在NVRecycler()函数中处理该问题，代码如下

示例源码如下，请查看 pre > code 标签中的内容

为了方便组件开发者使用，UTS 组件内部内置了下列对象：

UTSAndroid.getUniActivity()/UTSAndroid.getAppContext() 在组件内不建议使用，请使用$androidContext来替代

uniapp-x 中 ios 端事件参数类型需要使用 UniEvent 接收

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

对于UTS组件来说，除了通过 $emit/emits 函数来自定义组件事件外，UTS组件还内置了下列通用事件：

示例源码如下，请查看 pre > code 标签中的内容

本章节以 一个极简的组件开发为例，介绍说明UTS组件开发流程

在HBuilder X 中选中Uni-App项目下 uni_modules目录,右键选择新建uni_modules插件

打开index.vue，键入下面的组件源码:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面的代码，我们自定义了一个 名为 "uts-hello-view" 的UTS 组件，该组件对外提供了一个包含按钮的简单UI实现，并且对外暴露了一个名为 buttontext字符串属性，用来构建按钮上的文案

接下来，我们介绍在uni-app项目中如何使用它

注意：UTS组件默认全局注册，无需使用者手动配置

我们在uni-app项目中新建 helloView.nvue 页面，

直接使用uts-hello-view标签，并且定义buttontext文本内容即可看到效果。

点击组件内置按钮，可以在控制台看到组件内部实现的日志输出

点击调用组件的方法按钮，可以看到组件内置方法被调用

示例源码如下，请查看 pre > code 标签中的内容

在当前示例中，不涉及第三方依赖，使用标准基座直接运行即可

本章节以lottie动画组件为例，介绍包含三方SDK的UTS组件开发过程

在HBuilder X 中选中Uni-App项目下 uni_modules目录,右键选择新建uni_modules插件

打开 ~/uni_modules/uts-animation-view/utssdk/app-android/config.json

示例源码如下，请查看 pre > code 标签中的内容

UTS组件建议使用远程依赖的方式集成，如果需要以AAR的形式添加SDK，可以添加到

~/uni_modules/uts-animation-view/utssdk/app-android/libs目录

依赖的配置原则与UTS插件一致 UTS插件依赖说明

iOS 平台需要将三方依赖库放到 组件目录下 app-ios/Frameworks 中

打开index.vue，键入下面的组件源码:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

上面的代码我们实现了一个支持lottie动画播放的 UTS组件，标签名称为 uts-animation-view

在uni-app项目中新建 lottie/index.nvue 页面

引用自定义 uts-animation-view 组件，并编写测试用例

示例源码如下，请查看 pre > code 标签中的内容

以上，我们完成了 uts-animation-view组件的集成和使用工作

在当前例子中，因为配置了额外的第三方依赖，需要自定义基座方能使用

组件一般有两种场景，第一种是： 单标签组件

示例源码如下，请查看 pre > code 标签中的内容

我们上面介绍的 uts-hello-view或者uts-animation-view都是这种类型

示例源码如下，请查看 pre > code 标签中的内容

UTS组件作为容器组件与普通View组件遵循完全相同的规范，

唯一的区别在于 当组件布局中包含 <slot> 标签时，编译器会自动将其转换为容器组件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如上，我们即可到了一个最简的UTS容器组件

UTS容器组件的使用与Vue等常见的前端容器组件一致。唯一要注意的是，目前UTS容器组件还不支持 具名插槽。

示例源码如下，请查看 pre > code 标签中的内容

UTS 组件同样支持对应用程序生命周期函数的监听，方式和 UTS 插件中的完全一致。具体使用方法详见

开发者可以使用Hello UTS 快速体验UTS 组件开发

Lottie动画示例,对应的源码实现：~/uni_modules/uts-animation-view

uts-animation-view动画示例,对应的源码实现：~/uni_modules/uts-animation-view

uts兼容模式组件 不支持touch click tap等事件

nvue因weex引擎限制，不支持同步方法返回值，需要修改为callback形式返回结果给nvue环境

示例源码如下，请查看 pre > code 标签中的内容

如果不通过style 指定组件宽高，会导致组件不显示

为了让组件使用者的有更好的体验，UTS 插件 应该以 逻辑像素 px 作为标准的像素单位：

1 内置的UTS插件/组件，涉及对外交互时会自动进行单位转换，抹平相关差异。比如 swiper等组件监听滑动距离等场景

2 建议 插件开发者的插件在设计对外像素单位时也进行单位的转换，以逻辑像素px 作为输出结果

**Examples:**

Example 1 (unknown):
```unknown
uni-app兼容模式
```

Example 2 (unknown):
```unknown
┌─common                      // 可跨端公用的uts代码。推荐，不强制
├─static                      // 静态资源
├─utssdk
│	├─app-android               //Android平台目录
│	│	├─assets                  //Android原生assets资源目录，可选
│	│	├─libs                    //Android原生库目录，可选
│	│	├─res                     //Android原生res资源目录，可选
│	│	├─AndroidManifest.xml     //Android原生应用清单文件，可选
│	│	├─config.json             //Android原生配置文件
│	│	├─index.uts               //Android原生插件能力实现，可选
|	|	└─index.vue               //Android原生组件能力实现，必选
│	├─app-ios                   //iOS平台目录
│	│	├─Frameworks              //iOS原生依赖的第三方 framework 依赖库存放目录，可选
│	│	├─Resources               //iOS原生所依赖的资源文件存放目录，可选
│	│	├─info.plist              //iOS原生所需要添加到主 info.plist 文件中的配置文件，可选
│	│	├─UTS.entitlements        //iOS原生所需要添加到主工程 .entitlements 文件中的配置文件，可选
│	│	├─config.json             //iOS原生配置文件
│	│	├─index.uts               //iOS原生插件能力实现，可选
|	|	└─index.vue               //iOS原生组件能力实现，必选
│	├─web                       //web平台目录
│	│	└─index.uts
│	├─mp-alipay                 // 支付宝小程序平台，可选
│	├─mp-baidu                  // 百度小程序平台，可选
│	├─mp-jd                     // 京东小程序平台（仅限vue2），可选
│	├─mp-kuaishou               // 快手小程序平台，可选
│	├─mp-lark                   // 飞书小程序平台，可选
│	├─mp-qq                     // QQ小程序平台，可选
│	├─mp-toutiao                // 抖音小程序平台，可选
│	├─mp-weixin                 // 微信小程序平台，可选
│	├─mp-xhs                    // 小红书小程序平台（仅限vue2），可选
│	└─index.uts                 // 跨平台插件能力实现，可选
└─package.json                // 插件清单文件
```

Example 3 (unknown):
```unknown
┌─common                      // 可跨端公用的uts代码。推荐，不强制
├─static                      // 静态资源
├─utssdk
│	├─app-android               //Android平台目录
│	│	├─assets                  //Android原生assets资源目录，可选
│	│	├─libs                    //Android原生库目录，可选
│	│	├─res                     //Android原生res资源目录，可选
│	│	├─AndroidManifest.xml     //Android原生应用清单文件，可选
│	│	├─config.json             //Android原生配置文件
│	│	├─index.uts               //Android原生插件能力实现，可选
|	|	└─index.vue               //Android原生组件能力实现，必选
│	├─app-ios                   //iOS平台目录
│	│	├─Frameworks              //iOS原生依赖的第三方 framework 依赖库存放目录，可选
│	│	├─Resources               //iOS原生所依赖的资源文件存放目录，可选
│	│	├─info.plist              //iOS原生所需要添加到主 info.plist 文件中的配置文件，可选
│	│	├─UTS.entitlements        //iOS原生所需要添加到主工程 .entitlements 文件中的配置文件，可选
│	│	├─config.json             //iOS原生配置文件
│	│	├─index.uts               //iOS原生插件能力实现，可选
|	|	└─index.vue               //iOS原生组件能力实现，必选
│	├─web                       //web平台目录
│	│	└─index.uts
│	├─mp-alipay                 // 支付宝小程序平台，可选
│	├─mp-baidu                  // 百度小程序平台，可选
│	├─mp-jd                     // 京东小程序平台（仅限vue2），可选
│	├─mp-kuaishou               // 快手小程序平台，可选
│	├─mp-lark                   // 飞书小程序平台，可选
│	├─mp-qq                     // QQ小程序平台，可选
│	├─mp-toutiao                // 抖音小程序平台，可选
│	├─mp-weixin                 // 微信小程序平台，可选
│	├─mp-xhs                    // 小红书小程序平台（仅限vue2），可选
│	└─index.uts                 // 跨平台插件能力实现，可选
└─package.json                // 插件清单文件
```

Example 4 (vue):
```vue
export default {}
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-combox.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Combox Props
  - # Combox Events
- # 示例
      - 本页导读

组合框组件，一般用于可以选择也可以输入的表单项。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-combox label="所在城市" :candidates="candidates" placeholder="请选择所在城市" v-model="city"></uni-combox>
```

Example 2 (html):
```html
<uni-combox label="所在城市" :candidates="candidates" placeholder="请选择所在城市" v-model="city"></uni-combox>
```

Example 3 (html):
```html
<uni-combox label="所在城市" :candidates="candidates" placeholder="请选择所在城市" v-model="city"></uni-combox>
```

Example 4 (typescript):
```typescript
<uni-combox label="所在城市" :candidates="candidates" placeholder="请选择所在城市" v-model="city"></uni-combox>
```

---

## 设计资源 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/resource.html

**Contents:**
- # 设计资源
      - 本页导读

我们提供uni-ui组件的Sketch设计资源，您可以根据需要进行下载。

在Sketch中快速调用常用组件，在提升设计效率的同时，保证统一的视觉风格

如果你需要专业美工帮你做设计或UI美化，可以咨询DCloud官方的UI设计及美工服务 。

---

## button | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/button

**Contents:**
- # button
- # size 有效值
- # type 有效值
- # form-type 有效值
- # contact-type有效值
- # open-type 有效值
  - # feedback
  - # launchApp
- # button样式修改
- # button点击

button组件也支持style中通过css定义文字大小。见下

button组件也支持style中通过css定义颜色。见下

open-type 为 feedback时：

button组件属性中的size和type，属于预置样式，方便开发者使用。开发者也可以通过style和class来自定义样式。

button虽然可以内嵌text组件，但不建议通过text组件来修改button样式，因为会导致hover-class不生效。尤其是uvue中样式不继承。建议直接在button组件的style或class属性编写样式。

style和class的优先级，高于size和type属性。

示例源码如下，请查看 pre > code 标签中的内容

button 组件的点击遵循 vue 标准的 @click事件。

button 组件没有 url 属性，如果要跳转页面，可以在@click中编写，也可以在button组件外面套一层 navigator 组件。举例，如需跳转到about页面，可按如下几种代码写法执行：

示例源码如下，请查看 pre > code 标签中的内容

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

事件务必使用vue语法，比如下面的获取手机号示例

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
button-hover
```

Example 2 (json):
```json
{background-color: rgba(0, 0, 0, 0.1); opacity: 0.7;}
```

Example 3 (unknown):
```unknown
open-type="launchApp"
```

Example 4 (html):
```html
<template>
	<button size="default" type="default"
	style="color:#ffffff;backgroundColor:#1AAD19;borderColor:#1AAD19"
	hover-class="is-hover">按钮</button>
</template>
<style>
.is-hover {
	color: rgba(255, 255, 255, 0.6);
	background-color: #179b16;
	border-color: #179b16;
  }
</style>
```

---

## editor 组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/editor

**Contents:**
- # editor 组件
- # 平台差异说明
- # 属性说明
- # HTML 标签和 style 内联样式支持情况
  - # 支持的标签
  - # 支持的内联样式
- # H5 使用最佳实践
  - # 方案一：自行托管 CDN 资源
  - # 方案二：从 npm 中处理资源
- # 注意事项

富文本编辑器，可以对图片、文字格式进行编辑和混排。

在web开发时，可以使用contenteditable来实现内容编辑。但这是一个dom API，在非H5平台无法使用。于是微信小程序和uni-app的App-vue提供了editor组件来实现这个功能，并且在uni-app的H5平台也提供了兼容。从技术本质来讲，这个组件仍然运行在视图层webview中，利用的也是浏览器的contenteditable功能。

编辑器导出内容支持带标签的 html和纯文本的 text，编辑器内部采用 delta 格式进行存储。

通过setContents接口设置内容时，解析插入的 html 可能会由于一些非法标签导致解析错误，建议开发者在应用内使用时通过 delta 进行插入。

富文本组件内部引入了一些基本的样式使得内容可以正确的展示，开发时可以进行覆盖。需要注意的是，在其它组件或环境中使用富文本组件导出的html时，需要额外引入这段样式 ，并维护<ql-container><ql-editor></ql-editor></ql-container>的结构，参考：使用 editor 组件导出的 html 。

编辑器内支持部分 HTML 标签和内联样式，不支持class和id

不满足的标签会被忽略，<div>会被转行为<p>储存。

内联样式仅能设置在行内元素或块级元素上，不能同时设置。例如 font-size` 归类为行内元素属性，在 p 标签上设置是无效的。

近期部分用户反馈访问 unpkg 失败，导致 editor 组件初始化异常。这里提供代码块，方便用户修改。

分别下载quill.min.js 、image-resize.min.js ，放入 static 目录中。

在 index.html(Vue 3)，或者 public/index.html(Vue2) 中在 head 之间添加 js

示例源码如下，请查看 pre > code 标签中的内容

这样 editor 组件就可以正常使用了，代码逻辑中检测到有相关 window.Quill 变量，就不会从远程获取资源。

方案一的解决思路是在 window 上进行挂载，同样，我们可以在项目入口 main.js 或者 App.vue中引用相关依赖即可。

示例源码如下，请查看 pre > code 标签中的内容

在组件页面或者 main.ts 入口逻辑中，使用下面方案，注入依赖：

示例源码如下，请查看 pre > code 标签中的内容

相比方案一，方案二好处是依赖清晰，引用透明。如果你熟悉 npm 生态和构建流程，推荐方案二。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

一个完整的内容管理系统 Content Management System 比较复杂，DCloud已提供好了现成的 uni-cms，开源、免费、全端可用、功能完善，包括管理端和用户端。还内置了 AI 生成文章和广告变现功能。详见：https://doc.dcloud.net.cn/uniCloud/uni-cms.html

**Examples:**

Example 1 (unknown):
```unknown
contenteditable
```

Example 2 (unknown):
```unknown
contenteditable
```

Example 3 (unknown):
```unknown
setContents
```

Example 4 (unknown):
```unknown
<ql-container><ql-editor></ql-editor></ql-container>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/list-view.html

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

## audio | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/audio.html

**Contents:**
- # audio
      - 本页导读

注意： 微信小程序平台自基础库 1.6.0 版本开始，不再维护 audio 组件，推荐使用API方式而不是组件方式来播放音频。API见 uni.createInnerAudioContext 替代。

如果需要带ui的样式，可以自己做，也可以在插件市场搜索相关插件

本组件在vue3项目中废弃，只可以在vue2项目中使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

Example 2 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

Example 3 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

Example 4 (typescript):
```typescript
<template>
	<view>
		<view class="page-body">
			<view class="page-section page-section-gap" style="text-align: center;">
				<audio style="text-align: left" :src="current.src" :poster="current.poster" :name="current.name" :author="current.author" :action="audioAction" controls></audio>
			</view>
		</view>
	</view>
</template>
```

---

## 互动广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-interactive.html

**Contents:**
- # 互动广告
- # 简介
      - 本页导读

互动广告是DCloud联合三方服务商为开发者提供新的广告场景增值服务。开发者在App中放置入口，用户点击入口参与权益化、趣味性的活动。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-steps.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Steps Props
    - # Direction Options
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 基本用法 -->
<uni-steps :options="[{title: '事件一'}, {title: '事件二'}, {title: '事件三'}, {title: '事件四'}]" :active="1"></uni-steps>

<!-- 纵向排列 -->
<uni-steps :options="[{title:'买家下单',desc:'2018-11-11'},{title:'卖家发货',desc:'2018-11-12'},{title:'买家签收',desc:'2018-11-13'},{title:'交易完成',desc:'2018-11-14'}]" direction="column" :active="2"></uni-steps>
```

Example 2 (html):
```html
<!-- 基本用法 -->
<uni-steps :options="[{title: '事件一'}, {title: '事件二'}, {title: '事件三'}, {title: '事件四'}]" :active="1"></uni-steps>

<!-- 纵向排列 -->
<uni-steps :options="[{title:'买家下单',desc:'2018-11-11'},{title:'卖家发货',desc:'2018-11-12'},{title:'买家签收',desc:'2018-11-13'},{title:'交易完成',desc:'2018-11-14'}]" direction="column" :active="2"></uni-steps>
```

Example 3 (html):
```html
<!-- 基本用法 -->
<uni-steps :options="[{title: '事件一'}, {title: '事件二'}, {title: '事件三'}, {title: '事件四'}]" :active="1"></uni-steps>

<!-- 纵向排列 -->
<uni-steps :options="[{title:'买家下单',desc:'2018-11-11'},{title:'卖家发货',desc:'2018-11-12'},{title:'买家签收',desc:'2018-11-13'},{title:'交易完成',desc:'2018-11-14'}]" direction="column" :active="2"></uni-steps>
```

Example 4 (typescript):
```typescript
<!-- 基本用法 -->
<uni-steps :options="[{title: '事件一'}, {title: '事件二'}, {title: '事件三'}, {title: '事件四'}]" :active="1"></uni-steps>

<!-- 纵向排列 -->
<uni-steps :options="[{title:'买家下单',desc:'2018-11-11'},{title:'卖家发货',desc:'2018-11-12'},{title:'买家签收',desc:'2018-11-13'},{title:'交易完成',desc:'2018-11-14'}]" direction="column" :active="2"></uni-steps>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-table.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Table Props
  - # Table Events
  - # Table Methods
  - # Th Props
  - # Th Events
  - # Td Props
- # 示例

表格是由4个组件： uni-table表格组件、uni-tr表格行 、uni-th 表格头、uni-td 单元格组成

示例源码如下，请查看 pre > code 标签中的内容

Tips: 因微信小程序框架问题，暂不支持如下方法

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-table border stripe emptyText="暂无更多数据" >
	<!-- 表头行 -->
	<uni-tr>
		<uni-th align="center">日期</uni-th>
		<uni-th align="center">姓名</uni-th>
		<uni-th align="left">地址</uni-th>
	</uni-tr>
	<!-- 表格数据行 -->
	<uni-tr>
		<uni-td>2020-10-20</uni-td>
		<uni-td>Jeson</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-21</uni-td>
		<uni-td>HanMeiMei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-22</uni-td>
		<uni-td>LiLei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-23</uni-td>
		<uni-td>Danner</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>

</uni-table>
```

Example 2 (html):
```html
<uni-table border stripe emptyText="暂无更多数据" >
	<!-- 表头行 -->
	<uni-tr>
		<uni-th align="center">日期</uni-th>
		<uni-th align="center">姓名</uni-th>
		<uni-th align="left">地址</uni-th>
	</uni-tr>
	<!-- 表格数据行 -->
	<uni-tr>
		<uni-td>2020-10-20</uni-td>
		<uni-td>Jeson</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-21</uni-td>
		<uni-td>HanMeiMei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-22</uni-td>
		<uni-td>LiLei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-23</uni-td>
		<uni-td>Danner</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>

</uni-table>
```

Example 3 (html):
```html
<uni-table border stripe emptyText="暂无更多数据" >
	<!-- 表头行 -->
	<uni-tr>
		<uni-th align="center">日期</uni-th>
		<uni-th align="center">姓名</uni-th>
		<uni-th align="left">地址</uni-th>
	</uni-tr>
	<!-- 表格数据行 -->
	<uni-tr>
		<uni-td>2020-10-20</uni-td>
		<uni-td>Jeson</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-21</uni-td>
		<uni-td>HanMeiMei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-22</uni-td>
		<uni-td>LiLei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-23</uni-td>
		<uni-td>Danner</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>

</uni-table>
```

Example 4 (php):
```php
<uni-table border stripe emptyText="暂无更多数据" >
	<!-- 表头行 -->
	<uni-tr>
		<uni-th align="center">日期</uni-th>
		<uni-th align="center">姓名</uni-th>
		<uni-th align="left">地址</uni-th>
	</uni-tr>
	<!-- 表格数据行 -->
	<uni-tr>
		<uni-td>2020-10-20</uni-td>
		<uni-td>Jeson</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-21</uni-td>
		<uni-td>HanMeiMei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-22</uni-td>
		<uni-td>LiLei</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>
	<uni-tr>
		<uni-td>2020-10-23</uni-td>
		<uni-td>Danner</uni-td>
		<uni-td>北京市海淀区</uni-td>
	</uni-tr>

</uni-table>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-nav-bar.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 开启阴影
  - # 开启暗黑主题
  - # 自定义颜色
  - # 带左右文字
  - # 带左右图标
  - # 自定义高度
- # API
  - # NavBar Props

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用 color 属性修改导航栏前景色（文字图标颜色）

使用 background-color 属性修改导航栏背景色

示例源码如下，请查看 pre > code 标签中的内容

使用 left-text 属性设置导航栏左侧文字

使用 right-text 属性设置导航栏右侧文字

示例源码如下，请查看 pre > code 标签中的内容

使用 left-icon 属性设置导航栏左侧图标

使用 right-icon 属性设置导航栏右侧图标

示例源码如下，请查看 pre > code 标签中的内容

如使用 Number 类型传值默认单位为 px，使用 String 类型传值则必须带单位，如传值无效 ，则使用默认值

示例源码如下，请查看 pre > code 标签中的内容

在小程序中，如果 fixed 属性设置为 true 后，为了确保高度和右侧插槽与小程序的胶囊按钮，保持和谐的大小和位置，需要将 height 属性 设置为 0，让组件内部自动计算高度和位置。

示例源码如下，请查看 pre > code 标签中的内容

支持向 NavBar 里插入不同内容，以达到自定义的目的。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
'uni-icons'
```

Example 2 (html):
```html
<uni-nav-bar title="导航栏组件"></uni-nav-bar>
```

Example 3 (html):
```html
<uni-nav-bar title="导航栏组件"></uni-nav-bar>
```

Example 4 (html):
```html
<uni-nav-bar title="导航栏组件"></uni-nav-bar>
```

---

## refresh | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/refresh.html

**Contents:**
- # refresh
    - # 子组件
    - # 属性
    - # 事件
      - 本页导读

<refresh> 为容器提供下拉刷新功能。在nvue上，可通过此组件实现灵活的、自定义的、高性能的下拉刷新。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

display 控制 <refresh> 组件显示、隐藏。display 的设置必须成对出现，即设置 display="show", 必须有对应的 display="hide"。可选值为 show / hide，默认值为 show。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
<scroll-view>
```

Example 2 (typescript):
```typescript
<waterfall>
```

Example 3 (jsx):
```jsx
<scroll-view>
  <refresh>
    <text>Refreshing...</text>
  </refresh>
  <view v-for="num in lists">
    <text>{{num}}</text>
  </view>
</scroll-view>
```

Example 4 (jsx):
```jsx
<scroll-view>
  <refresh>
    <text>Refreshing...</text>
  </refresh>
  <view v-for="num in lists">
    <text>{{num}}</text>
  </view>
</scroll-view>
```

---

## Grid 广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-grid.html

**Contents:**
- # Grid 广告
  - # 简介
      - 本页导读

开发者可以使用 ad 组件创建 Grid 广告组件，Grid 广告组件在创建后会自动拉取广告数据并显示。

---

## uni.createSelectorQuery() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/nodes-info.html

**Contents:**
- # uni.createSelectorQuery()
  - # createSelectorQuery 兼容性
- # SelectorQuery
  - # selectorQuery.in(component)
  - # selectorQuery.select(selector)
  - # selectorQuery.selectAll(selector)
  - # selectorQuery.selectViewport()
  - # selectorQuery.exec(callback)
- # NodesRef
  - # nodesRef.fields(object,callback)

返回一个 SelectorQuery 对象实例。可以在这个实例上使用 select 等方法选择节点，并使用 boundingClientRect 等方法选择需要查询的信息。

将选择器的选取范围更改为自定义组件 component 内，返回一个 SelectorQuery 对象实例。（初始时，选择器仅选取页面范围的节点，不会选取任何自定义组件中的节点）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在当前页面下选择第一个匹配选择器 selector 的节点，返回一个 NodesRef 对象实例，可以用于获取节点信息。

selector 类似于 CSS 的选择器，但仅支持下列语法。

在当前页面下选择匹配选择器 selector 的所有节点，返回一个 NodesRef 对象实例，可以用于获取节点信息。

选择显示区域，可用于获取显示区域的尺寸、滚动位置等信息，返回一个 NodesRef 对象实例。

执行所有的请求。请求结果按请求次序构成数组，在 callback 的第一个参数中返回。

获取节点的相关信息。第一个参数是节点相关信息配置（必选）；第二参数是方法的回调函数，参数是指定的相关节点信息。

添加节点的布局位置的查询请求。相对于显示区域，以像素为单位。其功能类似于 DOM 的 getBoundingClientRect。返回 NodesRef 对应的 SelectorQuery。

添加节点的滚动位置查询请求。以像素为单位。节点必须是 scroll-view 或者 viewport。返回 NodesRef 对应的 SelectorQuery。

添加节点的 Context 对象查询请求。支持 VideoContext、CanvasContext、和 MapContext 等的获取。

获取 Node 节点实例。目前支持 Canvas 的获取。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

in 将选择器的选取范围更改为自定义组件component内

select 在当前页面下选择第一个匹配选择器selector的节点

boundingClientRect 添加节点的布局位置的查询请求，相对于显示区域，以像素为单位

scrollOffset 添加节点的滚动位置查询请求，以像素为单位

fields 获取节点的相关信息，需要获取的字段在fields中指定

context 添加节点的 Context 对象查询请求

node 获取 Node 节点实例。目前支持 Canvas 的获取。 获取节点的相关信息，需要获取的字段在fields中指定

selectAll 在当前页面下选择匹配选择器selector的所有节点

selectViewport 选择显示区域

**Examples:**

Example 1 (unknown):
```unknown
SelectorQuery
```

Example 2 (unknown):
```unknown
boundingClientRect
```

Example 3 (unknown):
```unknown
uni.createSelectorQuery()
```

Example 4 (unknown):
```unknown
selectorQuery.in
```

---

## camera | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/camera.html

**Contents:**
- # camera
      - 本页导读

页面内嵌的区域相机组件。注意这不是点击后全屏打开的相机。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

Example 2 (html):
```html
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

Example 3 (html):
```html
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

Example 4 (typescript):
```typescript
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-goods-nav.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # GoodsNav Props
  - # GoodsNav Events
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<uni-goods-nav :fill="true"  :options="options" :buttonGroup="buttonGroup"  @click="onClick" @buttonClick="buttonClick" />
</template>
<script>

export default {
	data () {
	  return {
	    options: [{
			icon: 'headphones',
			text: '客服'
		}, {
			icon: 'shop',
			text: '店铺',
			info: 2,
			infoBackgroundColor:'#007aff',
			infoColor:"red"
		}, {
			icon: 'cart',
			text: '购物车',
			info: 2
		}],
	    buttonGroup: [{
	      text: '加入购物车',
	      backgroundColor: '#ff0000',
	      color: '#fff'
	    },
	    {
	      text: '立即购买',
	      backgroundColor: '#ffa200',
	      color: '#fff'
	    }
	    ]
	  }
	},
	methods: {
	  onClick (e) {
	    uni.showToast({
	      title: `点击${e.content.text}`,
	      icon: 'none'
	    })
	  },
	  buttonClick (e) {
	    console.log(e)
	    this.options[2].info++
	  }
	}
}
</script>
```

Example 2 (html):
```html
<template>
	<uni-goods-nav :fill="true"  :options="options" :buttonGroup="buttonGroup"  @click="onClick" @buttonClick="buttonClick" />
</template>
<script>

export default {
	data () {
	  return {
	    options: [{
			icon: 'headphones',
			text: '客服'
		}, {
			icon: 'shop',
			text: '店铺',
			info: 2,
			infoBackgroundColor:'#007aff',
			infoColor:"red"
		}, {
			icon: 'cart',
			text: '购物车',
			info: 2
		}],
	    buttonGroup: [{
	      text: '加入购物车',
	      backgroundColor: '#ff0000',
	      color: '#fff'
	    },
	    {
	      text: '立即购买',
	      backgroundColor: '#ffa200',
	      color: '#fff'
	    }
	    ]
	  }
	},
	methods: {
	  onClick (e) {
	    uni.showToast({
	      title: `点击${e.content.text}`,
	      icon: 'none'
	    })
	  },
	  buttonClick (e) {
	    console.log(e)
	    this.options[2].info++
	  }
	}
}
</script>
```

Example 3 (html):
```html
<template>
	<uni-goods-nav :fill="true"  :options="options" :buttonGroup="buttonGroup"  @click="onClick" @buttonClick="buttonClick" />
</template>
<script>

export default {
	data () {
	  return {
	    options: [{
			icon: 'headphones',
			text: '客服'
		}, {
			icon: 'shop',
			text: '店铺',
			info: 2,
			infoBackgroundColor:'#007aff',
			infoColor:"red"
		}, {
			icon: 'cart',
			text: '购物车',
			info: 2
		}],
	    buttonGroup: [{
	      text: '加入购物车',
	      backgroundColor: '#ff0000',
	      color: '#fff'
	    },
	    {
	      text: '立即购买',
	      backgroundColor: '#ffa200',
	      color: '#fff'
	    }
	    ]
	  }
	},
	methods: {
	  onClick (e) {
	    uni.showToast({
	      title: `点击${e.content.text}`,
	      icon: 'none'
	    })
	  },
	  buttonClick (e) {
	    console.log(e)
	    this.options[2].info++
	  }
	}
}
</script>
```

Example 4 (vue):
```vue
<template>
	<uni-goods-nav :fill="true"  :options="options" :buttonGroup="buttonGroup"  @click="onClick" @buttonClick="buttonClick" />
</template>
<script>

export default {
	data () {
	  return {
	    options: [{
			icon: 'headphones',
			text: '客服'
		}, {
			icon: 'shop',
			text: '店铺',
			info: 2,
			infoBackgroundColor:'#007aff',
			infoColor:"red"
		}, {
			icon: 'cart',
			text: '购物车',
			info: 2
		}],
	    buttonGroup: [{
	      text: '加入购物车',
	      backgroundColor: '#ff0000',
	      color: '#fff'
	    },
	    {
	      text: '立即购买',
	      backgroundColor: '#ffa200',
	      color: '#fff'
	    }
	    ]
	  }
	},
	methods: {
	  onClick (e) {
	    uni.showToast({
	      title: `点击${e.content.text}`,
	      icon: 'none'
	    })
	  },
	  buttonClick (e) {
	    console.log(e)
	    this.options[2].info++
	  }
	}
}
</script>
```

---

## form | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/form

**Contents:**
- # form
      - 本页导读

表单，将组件内的用户输入的<switch> <input> <checkbox> <slider> <radio> <picker> 提交。

当点击 <form> 表单中 formType 为 submit 的 <button> 组件时，会将表单组件中的 value 值进行提交，需要在表单组件中加上 name 来作为 key。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

小程序端在form内的自定义组件内有input表单控件时，或者用普通标签实现表单控件，例如评分等，无法在form的submit事件内获取组件内表单控件值，此时可以使用behaviors。

对于 form 组件，目前可以自动识别下列内置 behaviors:

目前仅支持 微信小程序、QQ小程序、百度小程序、h5。

使自定义组件有类似于表单控件的行为。 form 组件可以识别这些自定义组件，并在 submit 事件中返回组件的字段名及其对应字段值。这将为它添加以下两个属性。

h5 vue3 暂不支持使用 behaviors 扩展表单组件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view>
			<form @submit="formSubmit" @reset="formReset">
				<view class="uni-form-item uni-column">
					<view class="title">switch</view>
					<view>
						<switch name="switch" />
					</view>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">radio</view>
					<radio-group name="radio">
						<label>
							<radio value="radio1" /><text>选项一</text>
						</label>
						<label>
							<radio value="radio2" /><text>选项二</text>
						</label>
					</radio-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">checkbox</view>
					<checkbox-group name="checkbox">
						<label>
							<checkbox value="checkbox1" /><text>选项一</text>
						</label>
						<label>
							<checkbox value="checkbox2" /><text>选项二</text>
						</label>
					</checkbox-group>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">slider</view>
					<slider value="50" name="slider" show-value></slider>
				</view>
				<view class="uni-form-item uni-column">
					<view class="title">input</view>
					<input class="uni-input" name="input" placeholder="这是一个输入框" />
				</view>
				<view class="uni-btn-v">
					<button form-type="submit">Submit</button>
					<button type="default" form-type="reset">Reset</button>
				</view>
			</form>
		</view>
	</view>
</template>
```

---

## animation-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/animation-view.html

**Contents:**
  - # animation-view
      - 本页导读

Lottie动画组件，动画资源参考Lottie官方链接 。

animation-view组件是uts组件 ，需下载插件：animation-view ，仅app平台 nvue/uvue 页面支持

uts组件 需 HBuilderX 3.7.0+

本地编译需要 gradle 7.5 及以上版本

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<animation-view class="animation" :path="path" :loop="loop" :autoplay="autoplay" :action="action"
			:hidden="hidden" @bindended="lottieEnd">
		</animation-view>
		<button @click="playLottie" type="primary">{{status}}lottie动画</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				path: '/uni_modules/uni-animation-view/static/lottie.json',
				loop: false,
				autoplay: true,
				action: 'stop',
				hidden: false,
				status: '播放'
			}
		},
		methods: {
			playLottie() {
				this.action = ('play' !== this.action) ? 'play' : 'pause';
				this.status = ('pause' === this.action) ? '播放' : '暂停';
			},
			lottieEnd() {
				this.status = '播放';
				this.action = 'stop';
				console.log('动画播放结束');
			}
		}
	}
</script>

<style>
	.animation {
		width: 750rpx;
		height: 300rpx;
		background-color: #FF0000;
		margin-bottom: 20px;
	}
</style>
```

Example 2 (html):
```html
<template>
	<view>
		<animation-view class="animation" :path="path" :loop="loop" :autoplay="autoplay" :action="action"
			:hidden="hidden" @bindended="lottieEnd">
		</animation-view>
		<button @click="playLottie" type="primary">{{status}}lottie动画</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				path: '/uni_modules/uni-animation-view/static/lottie.json',
				loop: false,
				autoplay: true,
				action: 'stop',
				hidden: false,
				status: '播放'
			}
		},
		methods: {
			playLottie() {
				this.action = ('play' !== this.action) ? 'play' : 'pause';
				this.status = ('pause' === this.action) ? '播放' : '暂停';
			},
			lottieEnd() {
				this.status = '播放';
				this.action = 'stop';
				console.log('动画播放结束');
			}
		}
	}
</script>

<style>
	.animation {
		width: 750rpx;
		height: 300rpx;
		background-color: #FF0000;
		margin-bottom: 20px;
	}
</style>
```

Example 3 (html):
```html
<template>
	<view>
		<animation-view class="animation" :path="path" :loop="loop" :autoplay="autoplay" :action="action"
			:hidden="hidden" @bindended="lottieEnd">
		</animation-view>
		<button @click="playLottie" type="primary">{{status}}lottie动画</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				path: '/uni_modules/uni-animation-view/static/lottie.json',
				loop: false,
				autoplay: true,
				action: 'stop',
				hidden: false,
				status: '播放'
			}
		},
		methods: {
			playLottie() {
				this.action = ('play' !== this.action) ? 'play' : 'pause';
				this.status = ('pause' === this.action) ? '播放' : '暂停';
			},
			lottieEnd() {
				this.status = '播放';
				this.action = 'stop';
				console.log('动画播放结束');
			}
		}
	}
</script>

<style>
	.animation {
		width: 750rpx;
		height: 300rpx;
		background-color: #FF0000;
		margin-bottom: 20px;
	}
</style>
```

Example 4 (vue):
```vue
<template>
	<view>
		<animation-view class="animation" :path="path" :loop="loop" :autoplay="autoplay" :action="action"
			:hidden="hidden" @bindended="lottieEnd">
		</animation-view>
		<button @click="playLottie" type="primary">{{status}}lottie动画</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				path: '/uni_modules/uni-animation-view/static/lottie.json',
				loop: false,
				autoplay: true,
				action: 'stop',
				hidden: false,
				status: '播放'
			}
		},
		methods: {
			playLottie() {
				this.action = ('play' !== this.action) ? 'play' : 'pause';
				this.status = ('pause' === this.action) ? '播放' : '暂停';
			},
			lottieEnd() {
				this.status = '播放';
				this.action = 'stop';
				console.log('动画播放结束');
			}
		}
	}
</script>

<style>
	.animation {
		width: 750rpx;
		height: 300rpx;
		background-color: #FF0000;
		margin-bottom: 20px;
	}
</style>
```

---

## checkbox-group | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/checkbox.html

**Contents:**
- # checkbox-group
- # checkbox
      - 本页导读

多选项。在1组check-group中可选择多个

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
<checkbox-group>
```

Example 2 (unknown):
```unknown
<checkbox-group>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title uni-common-mt">默认样式</view>
			<view>
				<checkbox-group>
					<label>
						<checkbox value="cb" :checked="true" />选中
					</label>
					<label>
						<checkbox value="cb" />未选中
					</label>
				</checkbox-group>
			</view>
			<view class="uni-title uni-common-mt">不同颜色和尺寸的checkbox</view>
			<view>
				<checkbox-group>
					<label>
						<checkbox value="cb" :checked="true" color="#FFCC33" style="transform:scale(0.7)" />选中
					</label>
					<label>
						<checkbox value="cb" color="#FFCC33" style="transform:scale(0.7)" />未选中
					</label>
				</checkbox-group>
			</view>
		</view>

		<view class="uni-padding-wrap">
			<view class="uni-title uni-common-mt">
				推荐展示样式
				<text>\n使用 uni-list 布局</text>
			</view>
		</view>
		<view class="uni-list">
			<checkbox-group @change="checkboxChange">
				<label class="uni-list-cell uni-list-cell-pd" v-for="item in items" :key="item.value">
					<view>
						<checkbox :value="item.value" :checked="item.checked" />
					</view>
					<view>{{item.name}}</view>
				</label>
			</checkbox-group>
		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title uni-common-mt">默认样式</view>
			<view>
				<checkbox-group>
					<label>
						<checkbox value="cb" :checked="true" />选中
					</label>
					<label>
						<checkbox value="cb" />未选中
					</label>
				</checkbox-group>
			</view>
			<view class="uni-title uni-common-mt">不同颜色和尺寸的checkbox</view>
			<view>
				<checkbox-group>
					<label>
						<checkbox value="cb" :checked="true" color="#FFCC33" style="transform:scale(0.7)" />选中
					</label>
					<label>
						<checkbox value="cb" color="#FFCC33" style="transform:scale(0.7)" />未选中
					</label>
				</checkbox-group>
			</view>
		</view>

		<view class="uni-padding-wrap">
			<view class="uni-title uni-common-mt">
				推荐展示样式
				<text>\n使用 uni-list 布局</text>
			</view>
		</view>
		<view class="uni-list">
			<checkbox-group @change="checkboxChange">
				<label class="uni-list-cell uni-list-cell-pd" v-for="item in items" :key="item.value">
					<view>
						<checkbox :value="item.value" :checked="item.checked" />
					</view>
					<view>{{item.name}}</view>
				</label>
			</checkbox-group>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-link.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Link Props
  - # Link Slots
- # 示例
      - 本页导读

uni-link是一个外部网页超链接组件，在小程序内复制url，在app内打开外部浏览器，在h5端打开新网页。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-link href="https://uniapp.dcloud.io/" text="https://uniapp.dcloud.io/"></uni-link>
```

Example 2 (html):
```html
<uni-link href="https://uniapp.dcloud.io/" text="https://uniapp.dcloud.io/"></uni-link>
```

Example 3 (html):
```html
<uni-link href="https://uniapp.dcloud.io/" text="https://uniapp.dcloud.io/"></uni-link>
```

Example 4 (unknown):
```unknown
<uni-link href="https://uniapp.dcloud.io/" text="https://uniapp.dcloud.io/"></uni-link>
```

---

## 激励视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-rewarded-video.html

**Contents:**
- # 激励视频广告
  - # 简介
      - 本页导读

激励视频广告，是cpm收益最高的广告形式。

手机用户观看几十秒视频广告，在广告播放完毕后可获得应用开发商提供的奖励，而应用开发商则可以从广告平台获取不菲的广告收入。

与开屏、信息流等广告变现方式不同，激励视频需设计激励场景，给用户发放激励。

注意激励不能直接发钱，那会被视为积分墙，而被广告平台禁封。

激励视频是造富神器。行业经常出现几个人的团队，月收入百万的奇迹。

---

## Barcode | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/barcode

**Contents:**
    - # Barcode
      - # start(object)
        - # Object object
      - # cancel()
      - # setFlash(boolean)
        - # Boolean boolean
      - # 事件
      - # marked
        - # 返回参数说明
      - # error

属性说明 设置Barcode扫码控件的属性，如扫码框、扫码条的颜色等。

条码识别成功事件 {event.detail}

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

Example 2 (html):
```html
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

Example 3 (html):
```html
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

Example 4 (vue):
```vue
<template>
	<view>
		<barcode id='1' class="barcode" autostart="true" ref="barcode" background="rgb(0,0,0)" frameColor="#1C86EE" scanbarColor="#1C86EE" :filters="fil" @marked="success1" @error="fail1"></barcode>
		<button class="btn" @click="toStart">开始扫码识别</button>
		<button class="btn" @click="tocancel">取消扫码识别</button>
		<button class="btn" @click="toFlash">开启闪光灯</button>
		<button class="btn" @click="toscan">预览</button>
	</view>
</template>

<script>
	export default {
		onLoad() {

		},
		data() {
			return {
				fil: [0, 2, 1]
			}
		},

		methods: {
			success1(e) {
				console.log("success1:" + JSON.stringify(e));
			},
			fail1(e) {
				console.log("fail1:" + JSON.stringify(e));
			},
			toStart: function() {
				this.$refs.barcode.start({
					conserve: true,
					filename: '_doc/barcode/'
				});
			},
			tocancel:function(){
				this.$refs.barcode.cancel();
			},
			toFlash: function() {
				this.$refs.barcode.setFlash(true);
			},

			toscan: function() {
				console.log("scan:");
				const barcodeModule = uni.requireNativePlugin('barcodeScan');
				barcodeModule.scan("/static/barcode1.png"
				,(e)=>{
					console.log("scan_error:"+JSON.stringify(e));
				});
			}
		}
	}
</script>

<style>
	.barcode {
		width: 750rpx;
		height: 700rpx;
		background-color: #808080;
	}

	.btn {
		top: 20rpx;
		width: 730rpx;
		margin-left: 10rpx;
		margin-top: 10rpx;
		background-color: #458B00;
		border-radius: 10rpx;
	}
</style>
```

---

## label | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/label.html

**Contents:**
- # label
      - 本页导读

用来改进表单组件的可用性，使用for属性找到对应的id，或者将控件放在该标签下，当点击时，就会触发对应的控件。

for优先级高于内部控件，内部有多个控件的时候默认触发第一个控件。

目前可以绑定的控件有：<button>, <checkbox>, <radio>, <switch>。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-common-mt">
			<view class="uni-form-item uni-column">
				<view class="title">表单组件在label内</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="item in checkboxItems" :key="item.name">
						<view>
							<checkbox :value="item.name" :checked="item.checked"></checkbox>
						</view>
						<view>{{item.value}}</view>
					</label>
				</checkbox-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label用for标识表单组件</view>
				<radio-group class="uni-list" @change="radioChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="(item,index) in radioItems" :key="index">
						<view>
							<radio :id="item.name" :value="item.name" :checked="item.checked"></radio>
						</view>
						<view>
							<label class="label-2-text" :for="item.name">
								<text>{{item.value}}</text>
							</label>
						</view>
					</label>
				</radio-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label内有多个时选中第一个</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="label-3">
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项一</checkbox>
						</view>
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项二</checkbox>
						</view>
						<view class="uni-link uni-center" style="margin-top:20rpx;">点击该label下的文字默认选中第一个checkbox</view>
					</label>
				</checkbox-group>
			</view>

		</view>
	</view>
</template>
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-common-mt">
			<view class="uni-form-item uni-column">
				<view class="title">表单组件在label内</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="item in checkboxItems" :key="item.name">
						<view>
							<checkbox :value="item.name" :checked="item.checked"></checkbox>
						</view>
						<view>{{item.value}}</view>
					</label>
				</checkbox-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label用for标识表单组件</view>
				<radio-group class="uni-list" @change="radioChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="(item,index) in radioItems" :key="index">
						<view>
							<radio :id="item.name" :value="item.name" :checked="item.checked"></radio>
						</view>
						<view>
							<label class="label-2-text" :for="item.name">
								<text>{{item.value}}</text>
							</label>
						</view>
					</label>
				</radio-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label内有多个时选中第一个</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="label-3">
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项一</checkbox>
						</view>
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项二</checkbox>
						</view>
						<view class="uni-link uni-center" style="margin-top:20rpx;">点击该label下的文字默认选中第一个checkbox</view>
					</label>
				</checkbox-group>
			</view>

		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-common-mt">
			<view class="uni-form-item uni-column">
				<view class="title">表单组件在label内</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="item in checkboxItems" :key="item.name">
						<view>
							<checkbox :value="item.name" :checked="item.checked"></checkbox>
						</view>
						<view>{{item.value}}</view>
					</label>
				</checkbox-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label用for标识表单组件</view>
				<radio-group class="uni-list" @change="radioChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="(item,index) in radioItems" :key="index">
						<view>
							<radio :id="item.name" :value="item.name" :checked="item.checked"></radio>
						</view>
						<view>
							<label class="label-2-text" :for="item.name">
								<text>{{item.value}}</text>
							</label>
						</view>
					</label>
				</radio-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label内有多个时选中第一个</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="label-3">
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项一</checkbox>
						</view>
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项二</checkbox>
						</view>
						<view class="uni-link uni-center" style="margin-top:20rpx;">点击该label下的文字默认选中第一个checkbox</view>
					</label>
				</checkbox-group>
			</view>

		</view>
	</view>
</template>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-common-mt">
			<view class="uni-form-item uni-column">
				<view class="title">表单组件在label内</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="item in checkboxItems" :key="item.name">
						<view>
							<checkbox :value="item.name" :checked="item.checked"></checkbox>
						</view>
						<view>{{item.value}}</view>
					</label>
				</checkbox-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label用for标识表单组件</view>
				<radio-group class="uni-list" @change="radioChange">
					<label class="uni-list-cell uni-list-cell-pd" v-for="(item,index) in radioItems" :key="index">
						<view>
							<radio :id="item.name" :value="item.name" :checked="item.checked"></radio>
						</view>
						<view>
							<label class="label-2-text" :for="item.name">
								<text>{{item.value}}</text>
							</label>
						</view>
					</label>
				</radio-group>
			</view>

			<view class="uni-form-item uni-column">
				<view class="title">label内有多个时选中第一个</view>
				<checkbox-group class="uni-list" @change="checkboxChange">
					<label class="label-3">
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项一</checkbox>
						</view>
						<view class="uni-list-cell uni-list-cell-pd">
							<checkbox class="checkbox-3">选项二</checkbox>
						</view>
						<view class="uni-link uni-center" style="margin-top:20rpx;">点击该label下的文字默认选中第一个checkbox</view>
					</label>
				</checkbox-group>
			</view>

		</view>
	</view>
</template>
```

---

## live-pusher | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/live-pusher.html

**Contents:**
- # live-pusher
    - # orientation 的合法值
    - # local-mirror 的合法值
    - # audio-reverb-type 的合法值
    - # audio-volume-type 的合法值
    - # 网络状态数据（info）安卓
    - # 网络状态数据（info）iOS
    - # 事件
    - # statechange
      - # 返回参数（detail）的详细说明

推荐uni直播，官方内置，使用简单，且价格便宜，更具高性价比！详情 。

app平台的 3.4.1+ vue页面已支持 live-pusher，3.4.1以前的版本 需编写条件编译代码，使用 plus.video.LivePusher，业务指南 、规范文档 。还是推荐直接使用nvue里的live-pusher组件。

app开发，推荐使用nvue做直播，比使用vue的优势有：

设置live-pusher组件的推流地址，推流视频模式等。

code 具体字段值参考文档: LivePusher

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关api：uni.createLivePusherContext

**Examples:**

Example 1 (unknown):
```unknown
plus.video.LivePusher
```

Example 2 (unknown):
```unknown
live-pusher
```

Example 3 (html):
```html
<template>
    <view>
        <live-pusher id='livePusher' ref="livePusher" class="livePusher" url=""
        mode="SD" :muted="true" :enable-camera="true" :auto-focus="true" :beauty="1" whiteness="2"
        aspect="9:16" @statechange="statechange" @netstatus="netstatus" @error = "error"
        ></live-pusher>
        <button class="btn" @click="start">开始推流</button>
        <button class="btn" @click="pause">暂停推流</button>
        <button class="btn" @click="resume">resume</button>
        <button class="btn" @click="stop">停止推流</button>
        <button class="btn" @click="snapshot">快照</button>
        <button class="btn" @click="startPreview">开启摄像头预览</button>
        <button class="btn" @click="stopPreview">关闭摄像头预览</button>
        <button class="btn" @click="switchCamera">切换摄像头</button>
    </view>
</template>
```

Example 4 (html):
```html
<template>
    <view>
        <live-pusher id='livePusher' ref="livePusher" class="livePusher" url=""
        mode="SD" :muted="true" :enable-camera="true" :auto-focus="true" :beauty="1" whiteness="2"
        aspect="9:16" @statechange="statechange" @netstatus="netstatus" @error = "error"
        ></live-pusher>
        <button class="btn" @click="start">开始推流</button>
        <button class="btn" @click="pause">暂停推流</button>
        <button class="btn" @click="resume">resume</button>
        <button class="btn" @click="stop">停止推流</button>
        <button class="btn" @click="snapshot">快照</button>
        <button class="btn" @click="startPreview">开启摄像头预览</button>
        <button class="btn" @click="stopPreview">关闭摄像头预览</button>
        <button class="btn" @click="switchCamera">切换摄像头</button>
    </view>
</template>
```

---

## list | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/list.html

**Contents:**
- # list
    - # 子组件
    - # 属性
    - # setSpecialEffects(object)
        - # Object object
    - # 方法
    - # 事件
    - # list.setSpecialEffects(args)
    - # 参数:
    - # 返回值：无

app端nvue专用组件。在app-nvue下，如果是长列表，使用list组件的性能高于使用view或scroll-view的滚动。原因在于list在不可见部分的渲染资源回收有特殊的优化处理。

原生渲染的资源回收机制，与webview渲染不同。webview不需要数据有规则格式，长页面处于不可视的部分，其渲染资源会自动回收，除非webview使用区域滚动而不是页面滚动。所以vue页面只要不用scroll-view，就不需要关注这个问题。而原生渲染则必须注意。

如果需要跨端，建议使用uni-ui的uni-list组件，它会自动处理webview渲染和原生渲染的情况，在app-nvue下使用list组件，而在其他平台则使用页面滚动。详见https://ext.dcloud.net.cn/plugin?id=24

<list> 组件是提供垂直列表功能的核心组件，拥有平滑的滚动和高效的内存管理，非常适合用于长列表的展示。最简单的使用方法是在 <list> 标签内使用一组由简单数组循环生成的 <cell> 标签填充。

示例源码如下，请查看 pre > code 标签中的内容

<list> 的子组件只能包括以下四种组件或是 fix 定位的组件，其他形式的组件将不能被正确渲染。

设置嵌套list父容器支持swiper-list吸顶滚动效果

scrollToElement(ref, options)

滚动到指定位置，详情 scrollToElement

loadmore 事件 如果列表滚动到底部将会立即触发这个事件，你可以在这个事件的处理函数中加载下一页的列表项。 如果未触发，请检查是否设置了loadmoreoffset的值，建议此值设置大于0

示例源码如下，请查看 pre > code 标签中的内容

scroll 事件 列表发生滚动时将会触发该事件，事件的默认抽样率为 10px，即列表每滚动 10px 触发一次，可通过属性 offset-accuracy 设置抽样率。

args 为要设置的参数为json类型可以包含下列元素

示例源码如下，请查看 pre > code 标签中的内容

setSpecialEffects 完整代码: https://github.com/dcloudio/hello-uniapp/tree/master/pages/template/swiper-list-nvue

**Examples:**

Example 1 (html):
```html
<template>
  <list>
    <!-- 注意事项: 不能使用 index 作为 key 的唯一标识 -->
    <cell v-for="(item, index) in dataList" :key="item.id">
      <text>{{item.name}}</text>
    </cell>
  </list>
</template>

<script>
  export default {
    data () {
      return {
        dataList: [{id: "1", name: 'A'}, {id: "2", name: 'B'}, {id: "3", name: 'C'}]
      }
    }
  }
</script>
```

Example 2 (html):
```html
<template>
  <list>
    <!-- 注意事项: 不能使用 index 作为 key 的唯一标识 -->
    <cell v-for="(item, index) in dataList" :key="item.id">
      <text>{{item.name}}</text>
    </cell>
  </list>
</template>

<script>
  export default {
    data () {
      return {
        dataList: [{id: "1", name: 'A'}, {id: "2", name: 'B'}, {id: "3", name: 'C'}]
      }
    }
  }
</script>
```

Example 3 (html):
```html
<template>
  <list>
    <!-- 注意事项: 不能使用 index 作为 key 的唯一标识 -->
    <cell v-for="(item, index) in dataList" :key="item.id">
      <text>{{item.name}}</text>
    </cell>
  </list>
</template>

<script>
  export default {
    data () {
      return {
        dataList: [{id: "1", name: 'A'}, {id: "2", name: 'B'}, {id: "3", name: 'C'}]
      }
    }
  }
</script>
```

Example 4 (vue):
```vue
<template>
  <list>
    <!-- 注意事项: 不能使用 index 作为 key 的唯一标识 -->
    <cell v-for="(item, index) in dataList" :key="item.id">
      <text>{{item.name}}</text>
    </cell>
  </list>
</template>

<script>
  export default {
    data () {
      return {
        dataList: [{id: "1", name: 'A'}, {id: "2", name: 'B'}, {id: "3", name: 'C'}]
      }
    }
  }
</script>
```

---

## waterfall | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/waterfall.html

**Contents:**
- # waterfall
    - # 子组件
    - # 属性
    - # 事件
      - 本页导读

<waterfall> 组件是提供瀑布流布局的核心组件。瀑布流，又称瀑布流式布局，是比较流行的一种页面布局，视觉表现为参差不齐的多栏布局。随着页面滚动条向下滚动，这种布局还可以不断加载数据块并附加至当前尾部。

在nvue中，使用普通view做瀑布流，无法实现复用和不可见渲染资源释放。使用<waterfall>组件且指定cell后，原生引擎会自动优化性能。

示例源码如下，请查看 pre > code 标签中的内容

和 <list> 组件一样, <waterfall> 组件的子组件只能包括以下四种组件或是 fix 定位的组件，其他形式的组件将不能被正确渲染。

其他支持的属性参见 <list> 组件属性部分

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (typescript):
```typescript
<waterfall>
```

Example 2 (typescript):
```typescript
<waterfall>
```

Example 3 (html):
```html
<template>
  <waterfall column-count="2" column-width="auto">
    <cell v-for="num in lists" >
      <text>{{num}}</text>
    </cell>
  </waterfall>
</template>
<script>
  export default {
    data () {
      return {
        lists: ['A', 'B', 'C', 'D', 'E']
      }
    }
  }
</script>

<style></style>
```

Example 4 (html):
```html
<template>
  <waterfall column-count="2" column-width="auto">
    <cell v-for="num in lists" >
      <text>{{num}}</text>
    </cell>
  </waterfall>
</template>
<script>
  export default {
    data () {
      return {
        lists: ['A', 'B', 'C', 'D', 'E']
      }
    }
  }
</script>

<style></style>
```

---

## uni.canvasPutImageData(OBJECT, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/canvasPutImageData.html

**Contents:**
- # uni.canvasPutImageData(OBJECT, componentInstance)
  - # canvasGetImageData 兼容性
      - 本页导读

将像素数据绘制到画布的方法，在自定义组件下，第二个参数传入自定义组件实例 this，以操作组件内 <canvas> 组件

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

Example 2 (javascript):
```javascript
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

Example 3 (javascript):
```javascript
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

Example 4 (css):
```css
const data = new Uint8ClampedArray([255, 0, 0, 255])
uni.canvasPutImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 1,
  data: data,
  success(res) {}
})
```

---

## 短视频内容联盟组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-content-page.html

**Contents:**
- # 短视频内容联盟组件
  - # 简介
      - 本页导读

⼀个视频内容频道，支持上下滑动切换视频内容

---

## radio-group | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/radio.html

**Contents:**
- # radio-group
    - # radio
      - 本页导读

单项选择器，内部由多个 <radio> 组成。通过把多个radio包裹在一个radio-group下，实现这些radio的单选。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
radio-group
```

Example 2 (unknown):
```unknown
<radio-group>
```

Example 3 (unknown):
```unknown
<radio-group>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap">
			<view class="uni-title">默认样式</view>
			<view>
				<label class="radio"><radio value="r1" :checked="true" />选中</label>
				<label class="radio"><radio value="r2" />未选中</label>
			</view>
		</view>
		<view class="uni-title uni-common-mt uni-common-pl">推荐展示样式</view>
		<view class="uni-list">
			<radio-group @change="radioChange">
				<label class="uni-list-cell uni-list-cell-pd" v-for="(item, index) in items" :key="item.value">
					<view>
						<radio :value="item.value" :checked="index === current" />
					</view>
					<view>{{item.name}}</view>
				</label>
			</radio-group>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-notice-bar.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 文字滚动
  - # 显示图标
  - # 显示关闭按钮
  - # 查看更多
- # NoticeBar API
  - # NoticeBar Props
  - # NoticeBar Events
- # 示例

使用 singlet 属性设置导是否单行显示

示例源码如下，请查看 pre > code 标签中的内容

使用 scrollable 属性设置通文字是否滚动

示例源码如下，请查看 pre > code 标签中的内容

使用 showIcon 属性设置是否显示图标

示例源码如下，请查看 pre > code 标签中的内容

使用 showClose 属性设置是否显示关闭图标

示例源码如下，请查看 pre > code 标签中的内容

使用 showGetMore 属性设置是否显示右侧查看更多图标

使用 moreText 属性设置查看更多文本

示例源码如下，请查看 pre > code 标签中的内容

如果需要异步获取内容后展示需要使用v-if进行控制，<uni-notice-bar v-if="text" :text="text"></uni-notice-bar>

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-notice-bar single text="[单行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
<uni-notice-bar text="[多行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
```

Example 2 (html):
```html
<uni-notice-bar single text="[单行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
<uni-notice-bar text="[多行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
```

Example 3 (html):
```html
<uni-notice-bar single text="[单行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
<uni-notice-bar text="[多行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
```

Example 4 (unknown):
```unknown
<uni-notice-bar single text="[单行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
<uni-notice-bar text="[多行] 这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏，这是 NoticeBar 通告栏"></uni-notice-bar>
```

---

## component | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/vue-component.html

**Contents:**
- # component
- # template
- # transition
- # transition-group
- # keep-alive
- # slot
      - 本页导读

渲染一个“元组件”为动态组件。依 is 的值，来决定哪个组件被渲染。详见

uni-app 支持在 template 模板中嵌套 <template/> 和 <block/>，用来进行 条件渲染 和 列表渲染。

<template/> 和 <block/> 并不是一个组件，它们仅仅是一个包装元素，不会在页面中做任何渲染，只接受控制属性。

<block/> 在不同的平台表现存在一定差异，推荐统一使用 <template/>。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

<transition> 元素作为单个元素/组件的过渡效果。<transition> 只会把过渡效果应用到其包裹的内容上，而不会额外渲染 DOM 元素，也不会出现在可被检查的组件层级中。详见

<transition-group> 元素作为多个元素/组件的过渡效果。<transition-group> 渲染一个真实的 DOM 元素。默认渲染 <span>，可以通过 tag attribute 配置哪个元素应该被渲染。详见

<keep-alive> 包裹动态组件时，会缓存不活动的组件实例，而不是销毁它们。和 <transition> 相似，<keep-alive> 是一个抽象组件：它自身不会渲染一个 DOM 元素，也不会出现在组件的父组件链中。详见

<slot> 元素作为组件模板之中的内容分发插槽。<slot> 元素自身将被替换。插槽 。

详细用法，请参考下面教程的链接。通过插槽分发内容

**Examples:**

Example 1 (jsx):
```jsx
<template/>
```

Example 2 (jsx):
```jsx
<template/>
```

Example 3 (jsx):
```jsx
<template/>
```

Example 4 (html):
```html
<template>
    <view>
        <template v-if="test">
            <view>test 为 true 时显示</view>
        </template>
        <template v-else>
            <view>test 为 false 时显示</view>
        </template>
    </view>
</template>
<script>
    export default {
        data() {
            return {
				test:true
            }
        }
    }
</script>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/video

**Contents:**
- # video
      - # direction 的合法值
      - # object-fit 的合法值
      - # play-btn-position 的合法值
      - 本页导读

视频需要上传？推荐uni-cdn，帮你节省至少30%的 CDN 费用！详情 。

<video> 默认宽度 300px、高度 225px，可通过 css 设置宽高。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关api：uni.createVideoContext

App平台video组件使用ijkplayer库实现：https://github.com/bilibili/ijkplayer ；

ijkplayer作为一个开源库，比腾讯视频等商业sdk仍有差距。如无法在开源库上满足需求，可在插件市场寻找商业sdk插件：腾讯视频 、阿里云视频

video全屏后，如何自行绘制界面？比如加个标题、加个分享按钮

如何实现抖音、映客等全屏视频垂直滑动切换效果？

<video/> 组件在非H5端是原生组件，层级高于普通前端组件，覆盖其需要使用cover-view 组件或plus.nativeObj.view、subNVue。微信基础库 2.4.0+和抖音小程序 已支持 video 组件的同层渲染，也就是video在非全屏时，可以被前端元素通过调节z-index来遮挡，但video全屏时，仍需要cover-view覆盖。

除微信基础库 2.4.0+ 和 抖音小程序 和 app-nvue 2.1.5+，其他情况下非H5的video不能放入scroll-view和swiper。注意参考 原生组件使用限制。

你也可以尝试换个设计思路，如：列表中的视频组件是通过图片与icon模拟的，点击后播放全屏播放视频的方案。详情【video组件会覆盖页面其他非原生组件的设计替代方案示例】

App平台：使用 <video/> 组件，打包 App 时必须勾选 manifest.json->App 模块权限配置->VideoPlayer 模块。此模块体积较大，非默认内置。

App平台：如果使用的视频路径为本地路径，需要配置资源为释放模式：在 manifest.json 文件内 app-plus 节点下新增 runmode 配置，设置值为liberate。

App平台：如果想使用非原生的video，即原来普通的html5自带video。有2种方案：

App平台：app-vue即使选择了使用x5内核，也不会使用x5的video播放，仍然使用uni-app的App引擎自带的原生视频播放。

App平台：3.6.14 以及 手机系统 iOS16 以上video全屏 需要配置应用支持横屏： 在 manifest.json 文件内 app-plus 节点下新增 screenOrientation 配置，设置值为["portrait-primary","portrait-secondary","landscape-primary","landscape-secondary"]。

H5平台： 在部分浏览器中会强制调用原生播放器播放（如：微信内置浏览器、UC浏览器等），在 x5 内核的浏览器中支持配置同层播放器 。

HBuilderX内置浏览器，使用video标签暂时存在问题，请先使用其他外部浏览器。

**Examples:**

Example 1 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

Example 2 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

Example 3 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

Example 4 (vue):
```vue
<template>
    <view>
        <view class="uni-padding-wrap uni-common-mt">
            <view>
                <video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/2minute-demo.mp4"
                    @error="videoErrorCallback" :danmu-list="danmuList" enable-danmu danmu-btn controls></video>
            </view>
            <!-- #ifndef MP-ALIPAY -->
            <view class="uni-list uni-common-mt">
                <view class="uni-list-cell">
                    <view>
                        <view class="uni-label">弹幕内容</view>
                    </view>
                    <view class="uni-list-cell-db">
                        <input v-model="danmuValue" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
                    </view>
                </view>
            </view>
            <view class="uni-btn-v">
                <button @click="sendDanmu" class="page-body-button">发送弹幕</button>
            </view>
            <!-- #endif -->
        </view>
    </view>
</template>
```

---

## 短视频内容联盟组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-content-page

**Contents:**
- # 短视频内容联盟组件
  - # 简介
      - 本页导读

⼀个视频内容频道，支持上下滑动切换视频内容

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-calendar.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 通过方法打开日历
- # API
  - # Calendar Props
  - # DataSelect Events
  - # Calendar Methods
- # 示例
      - 本页导读

日历组件可以查看日期，选择任意范围内的日期，打点操作。常用场景如：酒店日期预订、火车机票选择购买日期、上下班打卡等。

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<view>
	<uni-calendar 
	:insert="true"
	:lunar="true" 
	:start-date="'2019-3-2'"
	:end-date="'2019-5-20'"
	@change="change"
	 />
</view>
```

Example 2 (html):
```html
<view>
	<uni-calendar 
	:insert="true"
	:lunar="true" 
	:start-date="'2019-3-2'"
	:end-date="'2019-5-20'"
	@change="change"
	 />
</view>
```

Example 3 (html):
```html
<view>
	<uni-calendar 
	:insert="true"
	:lunar="true" 
	:start-date="'2019-3-2'"
	:end-date="'2019-5-20'"
	@change="change"
	 />
</view>
```

Example 4 (typescript):
```typescript
<view>
	<uni-calendar 
	:insert="true"
	:lunar="true" 
	:start-date="'2019-3-2'"
	:end-date="'2019-5-20'"
	@change="change"
	 />
</view>
```

---

## 沉浸视频流广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-draw.html

**Contents:**
- # 沉浸视频流广告
  - # 简介
  - # 适用场景
      - 本页导读

沉浸视频流广告为媒体提供了竖屏视频信息流广告样式，适合在全屏的竖屏视频中使用。支持app-nvue页面使用。

类抖音的竖版视频流，来电秀、直播间等全屏观看的视频。

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-forms.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 对齐方式
- # 表单校验
  - # 如何使用
  - # 校验规则说明
  - # rules 属性说明
  - # validateFunction 自定义校验规则使用说明
  - # validateFunction 异步校验
  - # 动态表单校验

代码块： uForms、uni-forms-item 关联组件：uni-forms-item、uni-easyinput、uni-data-checkbox、uni-group。

uni-app的内置组件已经有了 <form>组件，用于提交表单内容。

然而几乎每个表单都需要做表单验证，为了方便做表单验证，减少重复开发，uni-ui 又基于 <form>组件封装了 <uni-forms>组件，内置了表单验证功能。

<uni-forms> 提供了 rules属性来描述校验规则、<uni-forms-item>子组件来包裹具体的表单项，以及给原生或三方组件提供了 onFieldChange() 来校验表单值。

每个要校验的表单项，不管input还是checkbox，都必须放在<uni-forms-item>组件中，且一个<uni-forms-item>组件只能放置一个表单项。

<uni-forms-item>组件内部预留了显示error message的区域，默认是在表单项的底部。

另外，<uni-forms>组件下面的各个表单项，可以通过<uni-group>包裹为不同的分组。同一<uni-group>下的不同表单项目将聚拢在一起，同其他group保持垂直间距。<uni-group>仅影响视觉效果。

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

uni-forms 组件通常用来做表单校验和提交。每一个 uni-forms-item 是它的一个表单域组件，用来承载表单具体内容，uni-forms-item 中可以嵌套 uni-easyinput、uni-data-checkbox 和 uni-app 内置的表单组件

示例源码如下，请查看 pre > code 标签中的内容

使用 label-position 属性可以设置所有表单域的位置，默认在左侧

示例源码如下，请查看 pre > code 标签中的内容

表单校验还可以直接通过 uniCloud web 控制台 快速根据 schema 自动生成表单维护界面，比如新建页面和编辑页面，自动处理校验规则，更多参考DB Schema

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意 （1.4.0后不在用这个限制，name 使用 array 类型可支持）

modelValue 对象目前有比较严格的格式要求：

校验规则接受一个 Object 类型的值，通过传入不同的规则来表示每个表单域的值该如何校验

对象的 key 表示当前表单域的字段名，value 为具体的校验规则

示例源码如下，请查看 pre > code 标签中的内容

每一个验证规则中，可以配置多个属性，下面是一些常见规则属性。实际上这里的规范，与uniCloud的DB Schema 规范相同。

uni-forms 的 rules 基础规则有时候不能满足项目的所有使用场景，这时候可以使用 validateFunction 来自定义校验规则

validateFunction 方法返回四个参数 validateFunction:function(rule,value,data,callback){} ，当然返回参数名开发者可以自定义：

示例源码如下，请查看 pre > code 标签中的内容

上面的自定义校验方式为同步校验 ，如果需要异步校验，validateFunction 需要返回一个 Promise ，校验不通过 执行 reject(new Error('错误信息')) 返回对应的错误信息，如果校验通过则直接执行 resolve() 即可，在异步校验方法中，不需要使用 callback 。

示例源码如下，请查看 pre > code 标签中的内容

多用于同一个字段需要添加多次的场景，如需要动态创建多个域名参与检验。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-forms 1.4.0 后，只有 uni-forms上可以配置 validateTrigger，不再支持单独控制每个子表单的校验时机

如果需要子表单需要单独的校验时机，可以使用 uni-forms-item 的 rules 属性和 onFieldChange 配合

示例源码如下，请查看 pre > code 标签中的内容

【1.4.0后此规则已不生效】对于表单校验时机，同时只会有一个 validateTrigger 发生作用，它的作用权重为

规则 > uni-forms-item > uni-forms

validate 方法是对整个表单进行校验，方法接受两个参数

校验成功后，校验对象只保留指定了name的字段（只要 uni-forms-item 绑定了 name，哪怕不校验，也会返回），如果需要保留其他字段，则需要 keepItem 属性

示例源码如下，请查看 pre > code 标签中的内容

validate 方法还可以返回一个 Promise 对象，如果使用了 callback 则Promise 返回 null，validate 方法会优先使用 callback。

callback 方法会返回两个返回值 :

示例源码如下，请查看 pre > code 标签中的内容

setValue 方法通常用于内置组件或三方组件返回值的校验，因为uni-esayinput 等 uni 开头的组件内置了对 uni-forms的支持，所以这些组件返回的值可以直接使用，但是比如像input 这些内置组件值的变化，无法及时通知 uni-forms ，从而无法正常的校验，这时就需要我们手动将这些值加入到uni-forms的校验。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-forms-item
```

Example 2 (unknown):
```unknown
uni-forms-item
```

Example 3 (unknown):
```unknown
uni-easyinput
```

Example 4 (unknown):
```unknown
uni-data-checkbox
```

---

## uni.createCanvasContext(canvasId, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/createCanvasContext.html

**Contents:**
- # uni.createCanvasContext(canvasId, componentInstance)
  - # createCanvasContext 兼容性
  - # 定义
  - # 参数
  - # 返回值
      - 本页导读

创建 canvas 绘图上下文（指定 canvasId）。在自定义组件下，第二个参数传入组件实例this，以操作组件内 <canvas/> 组件

Tip: 需要指定 canvasId，该绘图上下文只作用于对应的 <canvas/>

---

## text组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/text.html

**Contents:**
- # text组件
- # 属性说明
- # 子组件
- # Tips
- # 示例
      - 本页导读

在app-uvue和app-nvue中，文本只能写在text中，而不能写在view的text区域。

虽然app-uvue中写在view的text区域的文字，也会被编译器自动包裹一层text组件，看起来也可以使用。但这样会造成无法修改该text文字的样式，详见uvue的样式不继承 章节

text组件在web浏览器渲染（含浏览器、小程序webview渲染模式、app-vue）和uvue中，可以并只能嵌套text组件。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="text-box" scroll-y="true">
				<text>{{text}}</text>
			</view>
			<view class="uni-btn-v">
				<button type="primary" :disabled="!canAdd" @click="add">add line</button>
				<button type="warn" :disabled="!canRemove" @click="remove">remove line</button>
			</view>
		</view>
	</view>
</template>
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="text-box" scroll-y="true">
				<text>{{text}}</text>
			</view>
			<view class="uni-btn-v">
				<button type="primary" :disabled="!canAdd" @click="add">add line</button>
				<button type="warn" :disabled="!canRemove" @click="remove">remove line</button>
			</view>
		</view>
	</view>
</template>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="text-box" scroll-y="true">
				<text>{{text}}</text>
			</view>
			<view class="uni-btn-v">
				<button type="primary" :disabled="!canAdd" @click="add">add line</button>
				<button type="warn" :disabled="!canRemove" @click="remove">remove line</button>
			</view>
		</view>
	</view>
</template>
```

Example 4 (typescript):
```typescript
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-padding-wrap uni-common-mt">
			<view class="text-box" scroll-y="true">
				<text>{{text}}</text>
			</view>
			<view class="uni-btn-v">
				<button type="primary" :disabled="!canAdd" @click="add">add line</button>
				<button type="warn" :disabled="!canRemove" @click="remove">remove line</button>
			</view>
		</view>
	</view>
</template>
```

---

## uni.createVideoContext(videoId, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/video-context.html

**Contents:**
- # uni.createVideoContext(videoId, componentInstance)
  - # createVideoContext 兼容性
      - 本页导读

创建并返回 video 上下文 videoContext 对象。在自定义组件下，第二个参数传入组件实例this，以操作组件内 <video> 组件。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (jsx):
```jsx
<video id="video1" ref="video1"></video>
```

Example 2 (bash):
```bash
this.$refs.video1
```

Example 3 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section">
				<video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/wap2appvsnative.mp4" @error="videoErrorCallback" :danmu-list="danmuList"
				    enable-danmu danmu-btn controls>
                                </video>

				<view class="uni-list">
					<view class="uni-list-cell">
						<view>
							<view class="uni-label">弹幕内容</view>
						</view>
						<view class="uni-list-cell-db">
							<input @blur="bindInputBlur" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
						</view>
					</view>
				</view>
				<view class="btn-area">
					<button @tap="bindSendDanmu" class="page-body-button" formType="submit">发送弹幕</button>
				</view>
			</view>
		</view>
	</view>
</template>
```

Example 4 (html):
```html
<template>
	<view>
		<view class="page-body">
			<view class="page-section">
				<video id="myVideo" src="https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/wap2appvsnative.mp4" @error="videoErrorCallback" :danmu-list="danmuList"
				    enable-danmu danmu-btn controls>
                                </video>

				<view class="uni-list">
					<view class="uni-list-cell">
						<view>
							<view class="uni-label">弹幕内容</view>
						</view>
						<view class="uni-list-cell-db">
							<input @blur="bindInputBlur" class="uni-input" type="text" placeholder="在此处输入弹幕内容" />
						</view>
					</view>
				</view>
				<view class="btn-area">
					<button @tap="bindSendDanmu" class="page-body-button" formType="submit">发送弹幕</button>
				</view>
			</view>
		</view>
	</view>
</template>
```

---

## uni.canIUse(String) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/caniuse.html

**Contents:**
- # uni.canIUse(String)
      - 本页导读

判断应用的 API，回调，参数，组件等是否在当前版本可用。

使用 ${API}.${method}.${param}.${options} 或者 ${component}.${attribute}.${option} 方式来调用，例如：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (bash):
```bash
${API}.${method}.${param}.${options}
```

Example 2 (bash):
```bash
${component}.${attribute}.${option}
```

Example 3 (bash):
```bash
${component}
```

Example 4 (bash):
```bash
${attribute}
```

---

## open-data | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/open-data.html

**Contents:**
- # open-data
      - 本页导读

该功能为各小程序平台提供的开放能力。App端和H5端不涉及此概念。

支付宝没有open-data组件，但提供了API方式获取相关信息。参考

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
2022年2月21日24时起
```

Example 2 (unknown):
```unknown
<open-data>
```

Example 3 (unknown):
```unknown
<open-data>
```

Example 4 (html):
```html
<open-data type="userNickName"></open-data>
<open-data type="userAvatarUrl"></open-data>
<open-data type="userGender"></open-data>
```

---

## 信息流广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad.html

**Contents:**
- # 信息流广告
  - # 简介
  - # 适用场景
      - 本页导读

应用内展示的广告组件，可用于banner或信息流。

Banner或信息流广告展现场景非常灵活，常见的展现场景为：文章顶部，详情页面顶部，第一屏中部等。建议信息流广告不要放置在底部

**Examples:**

Example 1 (unknown):
```unknown
#ifndef APP-HARMONY
```

---

## 短视频内容联盟组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-content-page.html

**Contents:**
- # 短视频内容联盟组件
  - # 简介
  - # 组件
  - # API
- # 短剧
  - # 穿山甲短剧
    - # 开发前准备
    - # 开发时注意事项
      - 本页导读

一个视频内容频道，支持上下滑动切换视频内容

HBuilder 基座的测试广告位 adpid 为 1111111112

仅nvue支持 (iOS-hx3.4.2支持、Android-hx3.1.17支持)

@start @pause @resume @complete回调参数说明

示例源码如下，请查看 pre > code 标签中的内容

通过API调用后将打开一个原生全屏组件，大小不可控制

plus.ad.showContentPage(options, success, fail)

options 为 object 类型，属性如下：

success 为 function 类型，加载成功后的回调

fail 为 function 类型，加载失败后的回调

示例源码如下，请查看 pre > code 标签中的内容

由于uni-ad暂未支持穿山甲短剧，接入短剧功能需要按照uts插件开发文档 ，开发对应的短剧插件。

示例源码如下，请查看 pre > code 标签中的内容

如果插件开发中遇到问题，可以去uni-ad广告群 咨询。

**Examples:**

Example 1 (html):
```html
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

Example 2 (html):
```html
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

Example 3 (html):
```html
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

Example 4 (vue):
```vue
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

---

## uni-popup 弹出层 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-popup.html

**Contents:**
- # uni-popup 弹出层
- # 介绍
  - # 基本用法
  - # 设置主窗口背景色
  - # 禁用打开动画
  - # 禁用点击遮罩关闭
- # API
  - # Popup Props
    - # Type Options
  - # Popup Methods

代码块： uPopup 关联组件：uni-popup-dialog,uni-popup-message,uni-popup-share,uni-transition

弹出层组件，在应用中弹出一个消息提示窗口、提示框等

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

在大多数场景下，并不需要设置 background-color 属性，因为uni-popup的主窗口默认是透明的，在向里面插入内容的时候 ，样式完全交由用户定制，如果设置了背景色 ，例如 uni-popup-dialog 中的圆角就很难去实现，不设置背景色，更适合用户去自由发挥。

而也有特例，需要我们主动去设置背景色，例如 type = 'bottom' 的时候 ，在异型屏中遇到了底部安全区问题（如 iphone 11），因为 uni-popup的主要内容避开了安全区（设置safe-area:true），导致底部的颜色我们无法自定义，这时候使用 background-color 就可以解决这个问题。

示例源码如下，请查看 pre > code 标签中的内容

在某些场景 ，可能不希望弹层有动画效果 ，只需要将 animation 属性设置为 false 即可以关闭动画。

示例源码如下，请查看 pre > code 标签中的内容

默认情况下，点击遮罩会自动关闭uni-popup，如不想点击关闭，只需将mask-click设置为false，这时候要关闭uni-popup，只能手动调用 close 方法。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

uni-popup 其实并没有任何样式，只提供基础的动画效果，给用户一个弹出层解决方案，仅仅是这样并不能满足开发需求，所以我们提供了三种基础扩展样式

将 uni-popup 的type属性改为 message，并引入对应组件即可使用消息提示 ，该组件不支持单独使用

示例源码如下，请查看 pre > code 标签中的内容

将 uni-popup 的type属性改为 dialog，并引入对应组件即可使用对话框 ，该组件不支持单独使用

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

分享示例，不作为最终可使用的组件，只做为样式组件，供用户自行修改，后续的开发计划是实现实际的分享逻辑，参数可配置。

将 uni-popup 的 type 属性改为 share，并引入对应组件即可使用 ，该组件不支持单独使用

示例源码如下，请查看 pre > code 标签中的内容

使用组件时，会发现内容部分滚动到底时，继续划动会导致底层页面的滚动，这就是滚动穿透。

但由于平台自身原因，除了h5平台外 ，其他平台都不能在在组件内禁止滚动穿透，所以在微信小程序、App 平台，页面内需要用户特殊处理一下

在 微信小程序/App 平台可使用 page-meta 组件动态修改页面样式 ，

需要在 data 中定义一个变量，用来表示 uni-popup 的开启关闭状态，并通过这个变量修改 page-meta 的 overflow 属性。

在 uni-popup 的 @change 事件中可以接受到 uni-popup 的开启关闭状态 ，并赋值给上面的变量

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-popup-dialog
```

Example 2 (unknown):
```unknown
uni-popup-message
```

Example 3 (unknown):
```unknown
uni-popup-share
```

Example 4 (unknown):
```unknown
uni-transition
```

---

## 全屏视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-fullscreen-video.html

**Contents:**
  - # 全屏视频广告
      - 本页导读

全屏视频广告是一个原生组件，层级比普通组件高。全屏视频广告每次创建都会返回一个全新的实例，默认是隐藏的，需要调用 FullScreenVideoAd.show() 将其显示。

如何开通参考激励视频广告 https://uniapp.dcloud.net.cn/api/a-d/rewarded-video

---

## canvas | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/canvas

**Contents:**
- # canvas
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关 api：uni.createCanvasContext

canvas的常用用途有图表和图片处理，在uni-app插件市场有大量基于canvas的插件，可搜索 图表 、 头像裁剪 、 海报 、 二维码 。

HBuilderX 2.2.5 开始 nvue 页面支持 Canvas，支持 W3C WebGL API WebGL 1.0

示例工程地址：NvueCanvasDemo

在App端，从性能来讲，由于通讯阻塞的问题，nvue的canvas性能不可能达到使用renderjs的vue页面的canvas。在App端，推荐使用vue的canvas。

**Examples:**

Example 1 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

Example 2 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

Example 3 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

Example 4 (vue):
```vue
<template>
	<view>
		<canvas style="width: 300px; height: 200px;" canvas-id="firstCanvas" id="firstCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas"></canvas>
		<canvas style="width: 400px; height: 500px;" canvas-id="secondCanvas" id="secondCanvas" @error="canvasIdErrorCallback"></canvas>
	</view>
</template>
```

---

## 信息流广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad

**Contents:**
- # 信息流广告
  - # 简介
  - # 适用场景
      - 本页导读

应用内展示的广告组件，可用于banner或信息流。

Banner或信息流广告展现场景非常灵活，常见的展现场景为：文章顶部，详情页面顶部，第一屏中部等。建议信息流广告不要放置在底部

**Examples:**

Example 1 (unknown):
```unknown
#ifndef APP-HARMONY
```

---

## uni-easyinput 增强输入框 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-easyinput.html

**Contents:**
- # uni-easyinput 增强输入框
- # 介绍
  - # 基本用法
  - # 输入框带左右图标
  - # 插槽
  - # 输入框禁用
  - # 密码框
  - # 输入框聚焦
  - # 多行文本
  - # 多行文本自动高度

easyinput 组件是对原生input组件的增强 ，是专门为配合表单组件uni-forms 而设计的，easyinput 内置了边框，图标等，同时包含 input 所有功能

输入内容后，输入框尾部会显示清除按钮，点击可清除内容，如不需要展示图标，clearable 属性设置为 false 即可

clearable 属性设置为 true ，输入框聚焦且内容不为空时，才会显示内容

示例源码如下，请查看 pre > code 标签中的内容

设置 prefixIcon 属性来显示输入框的头部图标

设置 suffixIcon 属性来显示输入框的尾部图标

注意图标当前只支持 uni-icons 内置的图标，当配置 suffixIcon 属性后，会覆盖 :clearable="true" 和 type="password" 时的原有图标

绑定 @iconClick 事件可以触发图标的点击 ，返回 prefix 表示点击左侧图标，返回 suffix 表示点击右侧图标

示例源码如下，请查看 pre > code 标签中的内容

设置 right 属性来设置右侧内容 插槽。

示例源码如下，请查看 pre > code 标签中的内容

设置 disable 属性可以禁用输入框，此时输入框不可编辑

示例源码如下，请查看 pre > code 标签中的内容

设置 type="password" 时，输入框内容将会不可见，由实心点代替，同时输入框尾部会显示眼睛图标，点击可切换内容显示状态

示例源码如下，请查看 pre > code 标签中的内容

如果页面存在多个设置 focus 属性的输入框，只有最后一个输入框的 focus 属性会生效

示例源码如下，请查看 pre > code 标签中的内容

设置 type="textarea" 时可输入多行文本

示例源码如下，请查看 pre > code 标签中的内容

设置 type="textarea" 时且设置 autoHeight 属性，可使用多行文本的自动高度，会跟随内容调整输入框的显示高度

示例源码如下，请查看 pre > code 标签中的内容

设置 :inputBorder="false" 时可取消输入框的边框显示，同时搭配 uni-forms 的 :border="true" 有较好的效果

示例源码如下，请查看 pre > code 标签中的内容

传入类型为 Boolean 时，自动去除前后空格,传入类型为 String 时，可以单独控制，下面是可选值

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-easyinput v-model="value" placeholder="请输入内容"></uni-easyinput>
```

Example 2 (html):
```html
<uni-easyinput v-model="value" placeholder="请输入内容"></uni-easyinput>
```

Example 3 (html):
```html
<uni-easyinput v-model="value" placeholder="请输入内容"></uni-easyinput>
```

Example 4 (vue):
```vue
<uni-easyinput v-model="value" placeholder="请输入内容"></uni-easyinput>
```

---

## uni.canIUse(String) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/caniuse

**Contents:**
- # uni.canIUse(String)
      - 本页导读

判断应用的 API，回调，参数，组件等是否在当前版本可用。

使用 ${API}.${method}.${param}.${options} 或者 ${component}.${attribute}.${option} 方式来调用，例如：

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (bash):
```bash
${API}.${method}.${param}.${options}
```

Example 2 (bash):
```bash
${component}.${attribute}.${option}
```

Example 3 (bash):
```bash
${component}
```

Example 4 (bash):
```bash
${attribute}
```

---

## cover-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/cover-view

**Contents:**
- # cover-view
      - 本页导读

app-vue和小程序框架，渲染引擎是webview的。但为了优化体验，部分组件如map、video、textarea、canvas通过原生控件实现，原生组件层级高于前端组件（类似flash层级高于div）。为了能正常覆盖原生组件，设计了cover-view。

微信小程序的cover-view使用注意：

**Examples:**

Example 1 (unknown):
```unknown
hover-class
```

Example 2 (yaml):
```yaml
overflow: scroll
```

Example 3 (yaml):
```yaml
position: fixed
```

Example 4 (unknown):
```unknown
transition-property
```

---

## camera | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/camera

**Contents:**
- # camera
      - 本页导读

页面内嵌的区域相机组件。注意这不是点击后全屏打开的相机。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

Example 2 (html):
```html
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

Example 3 (html):
```html
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

Example 4 (typescript):
```typescript
<template>
	<view>
        <camera device-position="back" flash="off" @error="error" style="width: 100%; height: 300px;"></camera>
        <button type="primary" @click="takePhoto">拍照</button>
        <view>预览</view>
        <image mode="widthFix" :src="src"></image>
    </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/quickstart.html

**Contents:**
  - # 在HBuilderX 新建uni-app项目的模板中，选择uni-ui模板
  - # 通过 uni_modules 单独安装组件
  - # 通过 uni_modules 导入全部组件
  - # npm安装
      - 本页导读

uni-ui支持 HBuilderX直接新建项目模板、npm安装和单独导入个别组件等多种使用方式

由于uni-app独特的easycom 技术，可以免引用、注册，直接使用各种符合规则的vue组件。

在代码区键入u，拉出各种内置或uni-ui的组件列表，选择其中一个，即可使用该组件。

光标放在组件名称上，按F1，可以查阅组件的文档。

如果你没有创建uni-ui项目模板，也可以在你的工程里，通过 uni_modules 单独安装需要的某个组件。下表为uni-ui的扩展组件清单，点击每个组件在详情页面可以导入组件到项目下，导入后直接使用即可，无需import和注册。

使用 uni_modules 方式安装组件库，可以直接通过插件市场导入，通过右键菜单快速更新组件，不需要引用、注册，直接在页面中使用 uni-ui 组件。点击安装 uni-ui 组件库

注意：下载最新的组件目前仅支持 uni_modules ,非 uni_modules 版本最高支持到组件的1.2.10版本

如不能升级到 uni_modules 版本，可以使用 uni_modules 安装好对应组件，将组件拷贝到对应目录。

例如需更新 uni-list和uni-badge ,将 uni_modules>uni-list>components和uni_modules>uni-badege>components下所有目录拷贝到如下目录即可：

示例源码如下，请查看 pre > code 标签中的内容

如果想一次把所有uni-ui组件导入到项目中，只需要导入一个 uni-ui 组件即可 点击去导入 。

如果没有自动导入其他组件，可以在 uni-ui 组件目录上右键选择 安装三方插件依赖 即可。

在 vue-cli 项目中可以使用 npm 安装 uni-ui 库 ，或者直接在 HBuilderX 项目中使用 npm 。

注意 cli 项目默认是不编译 node_modules 下的组件的，导致条件编译等功能失效 ，导致组件异常 需要在根目录创建 vue.config.js 文件 ，增加 @dcloudio/uni-ui 包的编译即可正常

示例源码如下，请查看 pre > code 标签中的内容

vue-cli 项目请先安装 sass 及 sass-loader，如在 HBuliderX 中使用，可跳过此步。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

如果 node 版本小于 16 ，sass-loader 请使用低于 @11.0.0 的版本，sass-loader@11.0.0 不支持 vue@2.6.12 如果 node 版本大于 16 ， sass-loader 建议使用 v8.x 版本

示例源码如下，请查看 pre > code 标签中的内容

使用 npm 安装好 uni-ui 之后，需要配置 easycom 规则，让 npm 安装的组件支持 easycom

打开项目根目录下的 pages.json 并添加 easycom 节点：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni_modules
```

Example 2 (unknown):
```unknown
uni_modules
```

Example 3 (unknown):
```unknown
uni_modules
```

Example 4 (unknown):
```unknown
uni_modules>uni-list>components
```

---

## match-media | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/match-media.html

**Contents:**
- # match-media
      - 本页导读

类似于网页开发中使用媒体查询来适配大屏小屏，match-media是一个可适配不同屏幕的基本视图组件。可以指定一组 media query 媒体查询规则，满足查询条件时，这个组件才会被展示。

例如在match-media组件中放置一个侧边栏，媒体查询规则设置为宽屏才显示，就可以实现在PC宽屏显示该侧边栏，而在手机窄屏中不显示侧边栏的效果。

注意：支付宝小程序、qq小程序、百度小程序、抖音小程序，暂不支持监听屏幕动态改变，即只执行一次媒体查询。

以下示例代码，推荐使用HBuilderX，新建uni-app项目，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

Example 2 (html):
```html
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

Example 3 (html):
```html
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

Example 4 (typescript):
```typescript
<template>
    <view>
        <match-media :min-width="375" :max-width="800" >
            <view>当页面最小宽度 375px， 页面宽度最大 800px 时显示</view>
        </match-media>

        <match-media :min-height="400" :orientation="landscape">
            <view>当页面高度不小于 400px 且屏幕方向为横向时展示这里</view>
        </match-media>
    </view>
</template>
```

---

## getMenuButtonBoundingClientRect() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/menuButton

**Contents:**
- # getMenuButtonBoundingClientRect()
      - 本页导读

在小程序平台，如果原生导航栏被隐藏，仍然在右上角会有一个悬浮按钮，微信下也被称为胶囊按钮。本API用于获取小程序下该菜单按钮的布局位置信息，方便开发者布局顶部内容时避开该按钮。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

Example 2 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

Example 3 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

Example 4 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-indexed-list.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # IndexedList Props
  - # IndexedList Events
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uIndexedList
```

Example 2 (html):
```html
<uni-indexed-list :options="list" :showSelect="false" @click="bindClick"></uni-indexed-list>
```

Example 3 (html):
```html
<uni-indexed-list :options="list" :showSelect="false" @click="bindClick"></uni-indexed-list>
```

Example 4 (html):
```html
<uni-indexed-list :options="list" :showSelect="false" @click="bindClick"></uni-indexed-list>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-collapse.html

**Contents:**
- # 介绍
  - # 基本用法
  - # 手风琴效果
  - # 动态设置折叠面板打开状态
  - # 使用动画
  - # 配置图片
  - # 自定义插槽
- # API
  - # Collapse Props
  - # Collapse Event

关联组件：uni-collapse-item、uni-icons。

折叠面板用来折叠/显示过长的内容或者是列表。通常是在多内容分类项使用，折叠不重要的内容，显示重要内容。点击可以展开折叠部分。

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

使用 accordion 属性，可以仅打开一个面板并关闭其他已经打开的面板，效果类似手风琴

设置 accordion 属性时，open 属性则生效在最后一个组件

示例源码如下，请查看 pre > code 标签中的内容

使用 v-model 属性，动态设置面板的显示状态

使用 name 属性设置每个面板的唯一标识，如不设置使用默认索引，从字符串 "0" 开始记数

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

使用 show-animation 属性开启或关闭面板折叠动画，默认动画开启

示例源码如下，请查看 pre > code 标签中的内容

使用 thumb 配置图片地址， 可在面板左侧显示一个图片

如需显示更多内容，如图标等，请见下方自定义插槽的说明

示例源码如下，请查看 pre > code 标签中的内容

如果需要自定义面板显示，可以使用 title 插槽达成完全自定义。下面是一个使用 uni-list 的列表示例，需要引入 uni-list 组件

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uni-collapse-item
```

Example 2 (unknown):
```unknown
title-border
```

Example 3 (unknown):
```unknown
manifest.json > app-plus
```

Example 4 (json):
```json
"nvueStyleCompiler" : "uni-app"
```

---

## web-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/web-view.html

**Contents:**
- # web-view
  - # uni.postMessage(OBJECT)
  - # uni.getEnv(CALLBACK)
- # App端web-view的扩展
  - # web-view组件的层级问题解决
  - # web-view组件的浏览器内核说明
  - # UniAppJSBridgeReady 的使用
  - # nvue webview通信示例
  - # HarmonyOS 使用问题
  - # FAQ

web-view 是一个 web 浏览器组件，可以用来承载网页的容器，会自动铺满整个页面（nvue 使用需要手动指定宽高）。

各小程序平台，web-view 加载的 url 需要在后台配置域名白名单，包括内部再次 iframe 内嵌的其他 url 。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

<web-view> 加载的网页中支持调用部分 uni 接口：

网页向应用发送消息，在 <web-view> 的 message 事件回调 event.detail.data 中接收消息。

在 <web-view> 加载的 HTML 中，添加以下代码：

示例源码如下，请查看 pre > code 标签中的内容

App端的webview是非常强大的，可以更灵活的控制和拥有更丰富的API。

每个vue页面，其实都是一个webview，而vue页面里的web-view组件，其实是webview里的一个子webview。这个子webview被append到父webview上。

通过以下方法，可以获得这个web-view组件对应的js对象，然后参考https://www.html5plus.org/doc/zh_cn/webview.html#plus.webview.WebviewObject ，可以进一步重设这个web-view组件的样式，比如调整大小

示例源码如下，请查看 pre > code 标签中的内容

甚至可以不用web-view组件，直接js创建一个子webview来加载html。比如不希望远程网页使用plus的API，不管是因为安全原因还是因为back监听冲突，可以使用如下代码：

示例源码如下，请查看 pre > code 标签中的内容

如果想设置web-view组件可双指缩放，可参考如下代码：

示例源码如下，请查看 pre > code 标签中的内容

web-view组件在App和小程序中层级较高，如需要在vue页面中写代码为web-view组件覆盖内容，小程序端无解，只能由web-view的组件自己弹出div。App端有如下若干方案：

uni.webView.navigateTo 示例，注意uni sdk放到body下面

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

HarmonyOS 不支持 plus，但可以直接使用行内样式或者 class 控制显示效果。如果需要使用 back、evalJS 等方法，请使用 uni.createWebviewContext

Q：web-view 的页面怎么和应用内的页面交互？ A：调用 uni 相关的 API，就可以实现页面切换及发送消息。参考：在 web-view 加载的 HTML 中调用 uni 的 API

Q：web-view 加载的 HTML 中，能够调用 5+ 的能力么？ A：加载的 HTML 中是有 5+ 环境的，在 plusready 后调用即可。参考：一个简单实用的 plusready 方法

Q: web-view 加载 uni-app H5，内部跳转冲突如何解决 A：使用 uni.webView.navigateTo...

**Examples:**

Example 1 (unknown):
```unknown
postMessage
```

Example 2 (unknown):
```unknown
postMessage
```

Example 3 (unknown):
```unknown
update-title
```

Example 4 (html):
```html
<template>
	<view>
		<web-view :webview-styles="webviewStyles" src="https://uniapp.dcloud.io/static/web-view.html"></web-view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				webviewStyles: {
					progress: {
						color: '#FF3333'
					}
				}
			}
		}
	}
</script>

<style>

</style>
```

---

## movable-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/movable-view.html

**Contents:**
- # movable-view
      - 本页导读

可移动的视图容器，在页面中可以拖拽滑动或双指缩放。

movable-view必须在movable-area组件中，并且必须是直接子节点，否则不能移动。

除了基本事件外，movable-view提供了两个特殊事件

movable-view 必须设置width和height属性，不设置默认为10px

movable-view 默认为绝对定位，top和left属性为0px

当movable-view小于movable-area时，movable-view的移动范围是在movable-area内；当movable-view大于movable-area时，movable-view的移动范围必须包含movable-area（x轴方向和y轴方向分开考虑）

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可快速体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
movable-view
```

Example 2 (unknown):
```unknown
movable-area
```

Example 3 (unknown):
```unknown
<movable-area/>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view class="page-body">
		<view class="uni-padding-wrap uni-common-mt">
			<view class="uni-title uni-common-mt">
				示例 1
				<text>\nmovable-view 区域小于 movable-area</text>
			</view>
			<movable-area>
				<movable-view :x="x" :y="y" direction="all" @change="onChange">text</movable-view>
			</movable-area>
			<view @tap="tap" class="uni-link uni-center uni-common-mt">
				点击这里移动至 (30px, 30px)
			</view>
			<view class="uni-title uni-common-mt">
				示例 2
				<text>\nmovable-view区域大于movable-area</text>
			</view>
			<movable-area>
				<movable-view class="max" direction="all">text</movable-view>
			</movable-area>
		</view>
	</view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/intersection-observer.html

**Contents:**
- # uni.createIntersectionObserver([this], [options])
  - # createIntersectionObserver 兼容性
- # IntersectionObserver 对象的方法列表
  - # 返回值
    - # IntersectionObserver 的方法
    - # relativeTo(selector: string, margins?: any): IntersectionObserver;
      - # relativeTo 兼容性
      - # 参数 HarmonyOS 兼容性
      - # 返回值
    - # relativeToViewport(margins?: any): IntersectionObserver;

节点布局交叉状态 API 可用于监听两个或多个组件节点在布局位置上的相交状态。这一组API常常可以用于推断某些节点是否可以被用户看见、有多大比例可以被用户看见。

创建并返回一个 IntersectionObserver 对象实例。

自定义组件实例。支付宝小程序不支持此参数，传入仅为抹平写法差异

margins 参数： 用来扩展（或收缩）参照节点布局区域的边界。

下面的示例代码中，如果目标节点 ".test" 进入 ".scroll" 区域以下 100px 时，就会触发回调函数。

示例源码如下，请查看 pre > code 标签中的内容

observe 回调函数 result 包含的字段

relativeTo 使用选择器指定一个节点，作为参照区域之一

relativeToViewport 指定页面显示区域作为参照区域之一

observe 指定目标节点并开始监听相交状态变化情况

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
IntersectionObserver
```

Example 2 (unknown):
```unknown
targetSelector
```

Example 3 (javascript):
```javascript
uni.createIntersectionObserver(this).relativeTo('.scroll',{bottom: 100}).observe('.test', (res) => {
  console.log(res);
})
```

Example 4 (javascript):
```javascript
uni.createIntersectionObserver(this).relativeTo('.scroll',{bottom: 100}).observe('.test', (res) => {
  console.log(res);
})
```

---

## icon | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/icon

**Contents:**
- # icon
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

Example 2 (html):
```html
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

Example 3 (html):
```html
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

Example 4 (typescript):
```typescript
<view class="item" v-for="(value,index) in iconType" :key="index">
    <icon :type="value" size="26"/>
    <text>{{value}}</text>
</view>
```

---

## uni.canvasGetImageData(OBJECT, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/canvasGetImageData.html

**Contents:**
- # uni.canvasGetImageData(OBJECT, componentInstance)
  - # canvasGetImageData 兼容性
      - 本页导读

返回一个数组，用来描述 canvas 区域隐含的像素数据，在自定义组件下，第二个参数传入自定义组件实例 this，以操作组件内 <canvas> 组件。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

Example 2 (javascript):
```javascript
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

Example 3 (javascript):
```javascript
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

Example 4 (css):
```css
uni.canvasGetImageData({
  canvasId: 'myCanvas',
  x: 0,
  y: 0,
  width: 100,
  height: 100,
  success(res) {
    console.log(res.width) // 100
    console.log(res.height) // 100
    console.log(res.data instanceof Uint8ClampedArray) // true
    console.log(res.data.length) // 100 * 100 * 4
  }
})
```

---

## 广告错误码 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-error-code.html

**Contents:**
- # 广告错误码
  - # app平台错误码
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

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-tag.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Tag Props
  - # Tag Events
- # 示例
      - 本页导读

用于展示1个或多个文字标签，可点击切换选中、不选中的状态 。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-tag text="标签"></uni-tag>
<uni-tag text="标签" type="error" :circle="true"></uni-tag>
<uni-tag text="标签" @click="bindClick"></uni-tag>
```

Example 2 (html):
```html
<uni-tag text="标签"></uni-tag>
<uni-tag text="标签" type="error" :circle="true"></uni-tag>
<uni-tag text="标签" @click="bindClick"></uni-tag>
```

Example 3 (html):
```html
<uni-tag text="标签"></uni-tag>
<uni-tag text="标签" type="error" :circle="true"></uni-tag>
<uni-tag text="标签" @click="bindClick"></uni-tag>
```

Example 4 (typescript):
```typescript
<uni-tag text="标签"></uni-tag>
<uni-tag text="标签" type="error" :circle="true"></uni-tag>
<uni-tag text="标签" @click="bindClick"></uni-tag>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-group.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Group Props
- # 示例
      - 本页导读

分组组件可用于将组件分组，添加间隔，以产生明显的区块。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-group title="分组1" top="20">
    <view>分组1 的内容</view>
    <view>分组1 的内容</view>
</uni-group>

<uni-group title="分组2">
    <view>分组2 的内容</view>
    <view>分组2 的内容</view>
</uni-group>
```

Example 2 (html):
```html
<uni-group title="分组1" top="20">
    <view>分组1 的内容</view>
    <view>分组1 的内容</view>
</uni-group>

<uni-group title="分组2">
    <view>分组2 的内容</view>
    <view>分组2 的内容</view>
</uni-group>
```

Example 3 (html):
```html
<uni-group title="分组1" top="20">
    <view>分组1 的内容</view>
    <view>分组1 的内容</view>
</uni-group>

<uni-group title="分组2">
    <view>分组2 的内容</view>
    <view>分组2 的内容</view>
</uni-group>
```

Example 4 (typescript):
```typescript
<uni-group title="分组1" top="20">
    <view>分组1 的内容</view>
    <view>分组1 的内容</view>
</uni-group>

<uni-group title="分组2">
    <view>分组2 的内容</view>
    <view>分组2 的内容</view>
</uni-group>
```

---

## picker-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/picker-view.html

**Contents:**
- # picker-view
- # picker-view-column
      - 本页导读

相对于picker组件，picker-view拥有更强的灵活性。当需要对自定义选择的弹出方式和UI表现时，往往需要使用picker-view。

**注意：**其中只可放置 <picker-view-column/> 组件，其他节点不会显示。

<picker-view /> 的子组件，仅可放置于 <picker-view /> 中，其子节点的高度会自动设置成与 picker-view 的选中框的高度一致。

**注意：**nvue页面子节点未继承 picker-view 的选中框的高度，需要自己设置高度并居中。

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
picker-view
```

Example 2 (unknown):
```unknown
picker-view
```

Example 3 (unknown):
```unknown
<picker-view-column/>
```

Example 4 (unknown):
```unknown
<picker-view />
```

---

## uni.createMapContext(mapId, componentInstance?) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/map

**Contents:**
- # uni.createMapContext(mapId, componentInstance?)
  - # createMapContext 兼容性
- # mapContext
- # mapSearch 模块(仅app-nvue支持，Google地图不支持)
  - # reverseGeocode(Object,callback);
    - # Object
    - # callback 返回 Object 参数说明
  - # poiSearchNearBy（Object,callback);
    - # Object
    - # callback 返回 Object 参数说明

创建并返回 map 上下文 mapContext 对象。在自定义组件下，第二个参数传入组件实例this，以操作组件内 <map> 组件。

注意：uni.createMapContext(mapId, this)

mapContext 通过 mapId 跟一个 <map> 组件绑定，通过它可以操作对应的 <map> 组件。

getCenterLocation 的 OBJECT 参数列表

moveToLocation 的 OBJECT 参数列表

translateMarker 的 OBJECT 参数列表

includePoints 的 OBJECT 参数列表

getRegion 的 OBJECT 参数列表

getRotate 的 OBJECT 参数列表

getScale 的 OBJECT 参数列表

getSkew 的 OBJECT 参数列表

addCustomLayer 的 OBJECT 参数列表

addGroundOverlay 的 OBJECT 参数列表

addMarkers 的 OBJECT 参数列表

removeMarkers 的 OBJECT 参数列表

moveAlong 的 OBJECT 参数列表

openMapApp 的 OBJECT 参数列表

setLocMarkerIcon 的 OBJECT 参数列表@setLocMarkerIcon

mapContext （App平台地图服务商差异）

MapContext.on() (app-nvue、微信小程序支持)

markerClusterCreate 缩放或拖动导致新的聚合簇产生时触发，仅返回新创建的聚合簇信息。

markerClusterClick 聚合簇的点击事件。

initMarkerCluster(OBJECT) 结构

示例源码如下，请查看 pre > code 标签中的内容

缩小地图可看到多个 marker 合并为 1 个并显示聚合数量，放大地图后恢复

示例源码如下，请查看 pre > code 标签中的内容

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

**Examples:**

Example 1 (jsx):
```jsx
<map id="map1" ref="map1"></map>
```

Example 2 (bash):
```bash
this.$refs.map1
```

Example 3 (bash):
```bash
$getAppMap()
```

Example 4 (bash):
```bash
$getAppMap()
```

---

## uni.createWebviewContext(webviewId, component?) @createwebviewcontext | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/create-webview-context.html

**Contents:**
- # uni.createWebviewContext(webviewId, component?)
  - # createWebviewContext 兼容性
  - # 返回值
    - # WebviewContext 的方法
    - # back() : void
      - # back 兼容性
    - # forward() : void
      - # forward 兼容性
    - # reload() : void
      - # reload 兼容性

创建 web-view 组件的上下文对象，用于操作 web-view 的行为。

back 后退到 web-view 组件网页加载历史的上一页，如果不存在上一页则没有任何效果。

forward 前进到 web-view 组件网页加载历史的下一页，如果不存在下一页则没有任何效果。

reload 重新加载 web-view 组件当前页面。

stop 停止加载 web-view 组件当前网页，该方法不能阻止已经加载的 html 文档，但是能够阻止未完成的图片及延迟加载的资源。

evalJS 在网页中执行指定的js脚本，在 uvue 页面中可通过此方法向 web-view 组件加载的页面发送数据

loadData 在web-view组件中加载页面内容

---

## live-pusher | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/live-pusher

**Contents:**
- # live-pusher
    - # orientation 的合法值
    - # local-mirror 的合法值
    - # audio-reverb-type 的合法值
    - # audio-volume-type 的合法值
    - # 网络状态数据（info）安卓
    - # 网络状态数据（info）iOS
    - # 事件
    - # statechange
      - # 返回参数（detail）的详细说明

推荐uni直播，官方内置，使用简单，且价格便宜，更具高性价比！详情 。

app平台的 3.4.1+ vue页面已支持 live-pusher，3.4.1以前的版本 需编写条件编译代码，使用 plus.video.LivePusher，业务指南 、规范文档 。还是推荐直接使用nvue里的live-pusher组件。

app开发，推荐使用nvue做直播，比使用vue的优势有：

设置live-pusher组件的推流地址，推流视频模式等。

code 具体字段值参考文档: LivePusher

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

相关api：uni.createLivePusherContext

**Examples:**

Example 1 (unknown):
```unknown
plus.video.LivePusher
```

Example 2 (unknown):
```unknown
live-pusher
```

Example 3 (html):
```html
<template>
    <view>
        <live-pusher id='livePusher' ref="livePusher" class="livePusher" url=""
        mode="SD" :muted="true" :enable-camera="true" :auto-focus="true" :beauty="1" whiteness="2"
        aspect="9:16" @statechange="statechange" @netstatus="netstatus" @error = "error"
        ></live-pusher>
        <button class="btn" @click="start">开始推流</button>
        <button class="btn" @click="pause">暂停推流</button>
        <button class="btn" @click="resume">resume</button>
        <button class="btn" @click="stop">停止推流</button>
        <button class="btn" @click="snapshot">快照</button>
        <button class="btn" @click="startPreview">开启摄像头预览</button>
        <button class="btn" @click="stopPreview">关闭摄像头预览</button>
        <button class="btn" @click="switchCamera">切换摄像头</button>
    </view>
</template>
```

Example 4 (html):
```html
<template>
    <view>
        <live-pusher id='livePusher' ref="livePusher" class="livePusher" url=""
        mode="SD" :muted="true" :enable-camera="true" :auto-focus="true" :beauty="1" whiteness="2"
        aspect="9:16" @statechange="statechange" @netstatus="netstatus" @error = "error"
        ></live-pusher>
        <button class="btn" @click="start">开始推流</button>
        <button class="btn" @click="pause">暂停推流</button>
        <button class="btn" @click="resume">resume</button>
        <button class="btn" @click="stop">停止推流</button>
        <button class="btn" @click="snapshot">快照</button>
        <button class="btn" @click="startPreview">开启摄像头预览</button>
        <button class="btn" @click="stopPreview">关闭摄像头预览</button>
        <button class="btn" @click="switchCamera">切换摄像头</button>
    </view>
</template>
```

---

## uni.createWebviewContext(webviewId, component?) @createwebviewcontext | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/create-webview-context

**Contents:**
- # uni.createWebviewContext(webviewId, component?)
  - # createWebviewContext 兼容性
  - # 返回值
    - # WebviewContext 的方法
    - # back() : void
      - # back 兼容性
    - # forward() : void
      - # forward 兼容性
    - # reload() : void
      - # reload 兼容性

创建 web-view 组件的上下文对象，用于操作 web-view 的行为。

back 后退到 web-view 组件网页加载历史的上一页，如果不存在上一页则没有任何效果。

forward 前进到 web-view 组件网页加载历史的下一页，如果不存在下一页则没有任何效果。

reload 重新加载 web-view 组件当前页面。

stop 停止加载 web-view 组件当前网页，该方法不能阻止已经加载的 html 文档，但是能够阻止未完成的图片及延迟加载的资源。

evalJS 在网页中执行指定的js脚本，在 uvue 页面中可通过此方法向 web-view 组件加载的页面发送数据

loadData 在web-view组件中加载页面内容

---

## uni-ad支持微信小程序广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/ad-weixin.html

**Contents:**
- # uni-ad支持微信小程序广告
      - 本页导读

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-breadcrumb.html

**Contents:**
- # 介绍
  - # 安装方式
  - # 基本用法
- # API
  - # Breadcrumb Props
  - # Breadcrumb Item Props
- # 示例
      - 本页导读

显示当前页面的路径，快速返回之前的任意页面。

本组件符合easycom 规范，HBuilderX 2.5.5起，只需将本组件导入项目，在页面template中即可直接使用，无需在页面中import和注册components。

如需通过npm方式使用uni-ui组件，另见文档：https://ext.dcloud.net.cn/plugin?id=55

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

直接拷贝示例代码，无法运行 ，示例依赖了 uni-card uni-section uni-scss 等多个组件。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uBreadcrumb
```

Example 2 (unknown):
```unknown
HBuilderX 2.5.5
```

Example 3 (html):
```html
<uni-breadcrumb separator="/">
  <uni-breadcrumb-item v-for="(route,index) in routes" :key="index" :to="route.to">
    {{route.name}}
  </uni-breadcrumb-item>
</uni-breadcrumb>
```

Example 4 (html):
```html
<uni-breadcrumb separator="/">
  <uni-breadcrumb-item v-for="(route,index) in routes" :key="index" :to="route.to">
    {{route.name}}
  </uni-breadcrumb-item>
</uni-breadcrumb>
```

---

## textarea | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/textarea.html

**Contents:**
- # textarea
    - # inputmode 有效值
      - 本页导读

以下示例代码，来自于hello uni-app项目 ，推荐使用HBuilderX，新建uni-app项目，选择hello uni-app模板，可直接体验完整示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

nvue下键盘右下角按钮点击仅触发换行；如想监听该按钮事件可以参考，示例代码如下：

示例源码如下，请查看 pre > code 标签中的内容

新增于 uni-app 3.7.0+ inputmode是html规范后期更新的内容。各家小程序还未支持此属性。

在符合条件的高版本webview里，uni-app的web和app-vue平台中可使用本属性。

富文本编辑的解决方案 在输入框里图文混排内容，在web上该功能依赖document，而小程序和app的正常页面又没有document。

**Examples:**

Example 1 (unknown):
```unknown
compositionstart、compositionend、compositionupdate
```

Example 2 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-title uni-common-pl">输入区域高度自适应，不会出现滚动条</view>
		<view class="uni-textarea">
			<textarea @blur="bindTextAreaBlur" auto-height />
			</view>
			<view class="uni-title uni-common-pl">占位符字体是红色的textarea</view>
			<view class="uni-textarea">
				<textarea placeholder-style="color:#F76260" placeholder="占位符字体是红色的"/>
			</view>
		</view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        bindTextAreaBlur: function (e) {
            console.log(e.detail.value)
        }
    }
}
</script>
```

Example 3 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-title uni-common-pl">输入区域高度自适应，不会出现滚动条</view>
		<view class="uni-textarea">
			<textarea @blur="bindTextAreaBlur" auto-height />
			</view>
			<view class="uni-title uni-common-pl">占位符字体是红色的textarea</view>
			<view class="uni-textarea">
				<textarea placeholder-style="color:#F76260" placeholder="占位符字体是红色的"/>
			</view>
		</view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        bindTextAreaBlur: function (e) {
            console.log(e.detail.value)
        }
    }
}
</script>
```

Example 4 (vue):
```vue
<!-- 本示例未包含完整css，获取外链css请参考上文，在hello uni-app项目中查看 -->
<template>
	<view>
		<view class="uni-title uni-common-pl">输入区域高度自适应，不会出现滚动条</view>
		<view class="uni-textarea">
			<textarea @blur="bindTextAreaBlur" auto-height />
			</view>
			<view class="uni-title uni-common-pl">占位符字体是红色的textarea</view>
			<view class="uni-textarea">
				<textarea placeholder-style="color:#F76260" placeholder="占位符字体是红色的"/>
			</view>
		</view>
</template>
<script>
export default {
    data() {
        return {}
    },
    methods: {
        bindTextAreaBlur: function (e) {
            console.log(e.detail.value)
        }
    }
}
</script>
```

---

## 信息流广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-component.html

**Contents:**
- # 信息流广告
  - # 简介
  - # 适用场景
- # 微信小程序
      - 本页导读

应用内展示的广告组件，可用于banner或信息流。

Banner或信息流广告展现场景非常灵活，常见的展现场景为：文章顶部，详情页面顶部，第一屏中部等。建议信息流广告不要放置在底部

广告类型：banner/feed，需和百青藤平台上的代码位类型相匹配。

广告的类型，默认 banner，具体类型有：banner、video（视频）、large（大图）、lImg（左图右文）、rImg（右图左文），默认值为 banner

App和微信小程序的ad组件没有type属性，可以用于banner，也可以用于信息流。

微信小程序平台支持信息流(Banner)广告组件 <ad unit-id=""></ad>，由微信提供

uni-ad 也支持信息流(Banner)广告组件 <ad adpid=""></ad>，由uni-ad提供

3.4.10 之前的版本ad组件运行到微信小程序使用微信提供的广告组件

uniad是uni-app框架的内置的组件，uniad组件同时支持uni-ad广告和微信原生广告，先请求uni-ad，如果已开通直接使用否则切换为微信的广告，这个过程会有3秒的延时

uniad组件依赖uni-ad提供的微信小程序插件

如果想在微信上仅使用微信的广告，App 或 Web 使用 uni-ad 可使用条件编译

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

api的方式(仅App平台支持)，不推荐使用这种调用方式，调用比较复杂，且不跨平台，开发者还需要手动处理缓存逻辑

示例源码如下，请查看 pre > code 标签中的内容

使用 ad/ad-draw 模拟插屏广告效果@Interstitial

示例源码如下，请查看 pre > code 标签中的内容

激励视频广告 文档地址：https://uniapp.dcloud.io/uni-ad/ad-rewarded-video

插屏广告 文档地址：https://uniapp.dcloud.io/uni-ad/ad-interstitial

**Examples:**

Example 1 (unknown):
```unknown
#ifndef APP-HARMONY
```

Example 2 (unknown):
```unknown
vue3 H5暂不支持
```

Example 3 (jsx):
```jsx
<ad unit-id=""></ad>
```

Example 4 (jsx):
```jsx
<ad adpid=""></ad>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-search-bar.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # SearchBar Props
  - # SearchBar Events
  - # 替换 icon 的 slot 插槽
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<!-- 基本用法 -->
<uni-search-bar @confirm="search" @input="input" ></uni-search-bar>

<!-- v-model 用法 -->
<uni-search-bar @confirm="search" :focus="true" v-model="searchValue" @blur="blur" @focus="focus" @input="input" @cancel="cancel" @change="change" @clear="clear"></uni-search-bar>

<!-- 自定义Placeholder -->
<uni-search-bar placeholder="自定placeholder" @confirm="search"></uni-search-bar>

<!-- 设置圆角 -->
<uni-search-bar :radius="100" @confirm="search"></uni-search-bar>
```

Example 2 (html):
```html
<!-- 基本用法 -->
<uni-search-bar @confirm="search" @input="input" ></uni-search-bar>

<!-- v-model 用法 -->
<uni-search-bar @confirm="search" :focus="true" v-model="searchValue" @blur="blur" @focus="focus" @input="input" @cancel="cancel" @change="change" @clear="clear"></uni-search-bar>

<!-- 自定义Placeholder -->
<uni-search-bar placeholder="自定placeholder" @confirm="search"></uni-search-bar>

<!-- 设置圆角 -->
<uni-search-bar :radius="100" @confirm="search"></uni-search-bar>
```

Example 3 (html):
```html
<!-- 基本用法 -->
<uni-search-bar @confirm="search" @input="input" ></uni-search-bar>

<!-- v-model 用法 -->
<uni-search-bar @confirm="search" :focus="true" v-model="searchValue" @blur="blur" @focus="focus" @input="input" @cancel="cancel" @change="change" @clear="clear"></uni-search-bar>

<!-- 自定义Placeholder -->
<uni-search-bar placeholder="自定placeholder" @confirm="search"></uni-search-bar>

<!-- 设置圆角 -->
<uni-search-bar :radius="100" @confirm="search"></uni-search-bar>
```

Example 4 (typescript):
```typescript
<!-- 基本用法 -->
<uni-search-bar @confirm="search" @input="input" ></uni-search-bar>

<!-- v-model 用法 -->
<uni-search-bar @confirm="search" :focus="true" v-model="searchValue" @blur="blur" @focus="focus" @input="input" @cancel="cancel" @change="change" @clear="clear"></uni-search-bar>

<!-- 自定义Placeholder -->
<uni-search-bar placeholder="自定placeholder" @confirm="search"></uni-search-bar>

<!-- 设置圆角 -->
<uni-search-bar :radius="100" @confirm="search"></uni-search-bar>
```

---

## uni.createLivePlayerContext(livePlayerId, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/live-player-context

**Contents:**
- # uni.createLivePlayerContext(livePlayerId, componentInstance)
- # uni.createLivePusherContext(livePusherId, componentInstance)
  - # livePusherContext
  - # start(OBJECT)
  - # pause(OBJECT)
  - # resume(OBJECT)
  - # stop(OBJECT)
  - # switchCamera(OBJECT)
  - # snapshot(OBJECT)
  - # startPreview(OBJECT)

推荐uni直播，官方内置，使用简单，且价格便宜，更具高性价比！详情 。

创建 live-player 上下文 livePlayerContext 对象。注意是直播的播放而不是推流。

App平台的直播播放，不使用此API，而直接使用video的API。

livePlayerContext 对象的方法列表：

requestFullScreen 的 Object 参数列表：

创建 live-pusher 上下文 livePusherContext 对象。

**Examples:**

Example 1 (unknown):
```unknown
<live-player>
```

Example 2 (unknown):
```unknown
<live-player>
```

Example 3 (unknown):
```unknown
<live-pusher id="livepusher1" ref="livepusher1"></live-pusher>
```

Example 4 (bash):
```bash
this.$refs.livepusher1
```

---

## nextTick(function callback) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/nextTick.html

**Contents:**
- # nextTick(function callback)
      - 本页导读

在小程序自定义组件，如wxcomponents中使用。延迟一部分操作到下一个时间片再执行。（类似于 setTimeout） 。其他平台无此概念。

---

## getMenuButtonBoundingClientRect() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/menuButton.html

**Contents:**
- # getMenuButtonBoundingClientRect()
      - 本页导读

在小程序平台，如果原生导航栏被隐藏，仍然在右上角会有一个悬浮按钮，微信下也被称为胶囊按钮。本API用于获取小程序下该菜单按钮的布局位置信息，方便开发者布局顶部内容时避开该按钮。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

Example 2 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

Example 3 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

Example 4 (javascript):
```javascript
let menuButtonInfo = uni.getMenuButtonBoundingClientRect()
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-datetime-picker.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # DatetimePicker Props
  - # DatetimePicker Events
  - # DatetimePicker Methods
  - # DatetimePicker Slots
- # 示例
      - 本页导读

组件升级更新 2.0.0 后，支持日期+时间范围选择，组件 ui 将使用日历选择日期，ui 变化较大，同时支持 PC 和 移动端。此版本不向后兼容，不再支持单独的时间选择（type=time）及相关的 hide-second 属性（时间选可使用内置组件 picker）。若仍需使用旧版本，可在插件市场下载非uni_modules版本，旧版本将不再维护

组件名：uni-datetime-picker

该组件的优势是，支持时间戳输入和输出（起始时间、终止时间也支持时间戳），可同时选择日期和时间。

若只是需要单独选择日期和时间，不需要时间戳输入和输出，可使用原生的 picker 组件。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uDatetimePicker
```

Example 2 (html):
```html
<template>
	<view class="page">
		<text class="example-info">可以同时选择日期和时间的选择器</text>
		<uni-section :title="'日期用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				type="date"
				:value="single"
				start="2021-3-20"
				end="2021-6-20"
				@change="change"
			/>
		</view>
		<uni-section :title="'时间戳用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				returnType="timestamp"
				@change="changeLog($event)"
				start="2021-3-20"
				end="2021-5-20"
			/>
		</view>
		<uni-section
			:title="'日期时间用法：' + datetimesingle"
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				type="datetime"
				v-model="datetimesingle"
				@change="changeLog"
			/>
		</view>
		<uni-section :title="'v-model用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" />
		</view>
		<uni-section :title="'插槽用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single"
				>我是一个插槽，点击我</uni-datetime-picker
			>
		</view>
		<uni-section :title="'无边框用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" :border="false" />
		</view>
		<uni-section :title="'disabled用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" disabled />
		</view>
		<uni-section
			:title="'日期范围用法：' + '[' + range + ']'"
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				v-model="range"
				type="daterange"
				start="2021-3-20"
				end="2021-5-20"
				rangeSeparator="至"
			/>
		</view>
		<uni-section
			:title="'日期时间范围用法：' + '[' + datetimerange + ']' "
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				v-model="datetimerange"
				type="datetimerange"
				start="2021-3-20 12:00:00"
				end="2021-6-20 20:00:00"
				rangeSeparator="至"
			/>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				single: "2021-04-3",
				datetimesingle: "2021-04-3",
				range: ["2021-03-8", "2021-4-20"],
				datetimerange: ["2021-03-20 20:10:10", "2021-05-10 10:10:10"],
			};
		},

		watch: {
			datetimesingle(newval) {
				console.log("单选:", this.datetimesingle);
			},
			range(newval) {
				console.log("范围选:", this.range);
			},
			datetimerange(newval) {
				console.log("范围选:", this.datetimerange);
			},
		},
		mounted() {
			setTimeout(() => {
				this.datetimesingle = "2021-5-1";
				this.single = "2021-5-1";
			}, 1000);
		},

		methods: {
			change(e) {
				this.single = e;
				console.log("-change事件:", e);
			},
		},
	};
</script>
```

Example 3 (html):
```html
<template>
	<view class="page">
		<text class="example-info">可以同时选择日期和时间的选择器</text>
		<uni-section :title="'日期用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				type="date"
				:value="single"
				start="2021-3-20"
				end="2021-6-20"
				@change="change"
			/>
		</view>
		<uni-section :title="'时间戳用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				returnType="timestamp"
				@change="changeLog($event)"
				start="2021-3-20"
				end="2021-5-20"
			/>
		</view>
		<uni-section
			:title="'日期时间用法：' + datetimesingle"
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				type="datetime"
				v-model="datetimesingle"
				@change="changeLog"
			/>
		</view>
		<uni-section :title="'v-model用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" />
		</view>
		<uni-section :title="'插槽用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single"
				>我是一个插槽，点击我</uni-datetime-picker
			>
		</view>
		<uni-section :title="'无边框用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" :border="false" />
		</view>
		<uni-section :title="'disabled用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" disabled />
		</view>
		<uni-section
			:title="'日期范围用法：' + '[' + range + ']'"
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				v-model="range"
				type="daterange"
				start="2021-3-20"
				end="2021-5-20"
				rangeSeparator="至"
			/>
		</view>
		<uni-section
			:title="'日期时间范围用法：' + '[' + datetimerange + ']' "
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				v-model="datetimerange"
				type="datetimerange"
				start="2021-3-20 12:00:00"
				end="2021-6-20 20:00:00"
				rangeSeparator="至"
			/>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				single: "2021-04-3",
				datetimesingle: "2021-04-3",
				range: ["2021-03-8", "2021-4-20"],
				datetimerange: ["2021-03-20 20:10:10", "2021-05-10 10:10:10"],
			};
		},

		watch: {
			datetimesingle(newval) {
				console.log("单选:", this.datetimesingle);
			},
			range(newval) {
				console.log("范围选:", this.range);
			},
			datetimerange(newval) {
				console.log("范围选:", this.datetimerange);
			},
		},
		mounted() {
			setTimeout(() => {
				this.datetimesingle = "2021-5-1";
				this.single = "2021-5-1";
			}, 1000);
		},

		methods: {
			change(e) {
				this.single = e;
				console.log("-change事件:", e);
			},
		},
	};
</script>
```

Example 4 (html):
```html
<template>
	<view class="page">
		<text class="example-info">可以同时选择日期和时间的选择器</text>
		<uni-section :title="'日期用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				type="date"
				:value="single"
				start="2021-3-20"
				end="2021-6-20"
				@change="change"
			/>
		</view>
		<uni-section :title="'时间戳用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				returnType="timestamp"
				@change="changeLog($event)"
				start="2021-3-20"
				end="2021-5-20"
			/>
		</view>
		<uni-section
			:title="'日期时间用法：' + datetimesingle"
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				type="datetime"
				v-model="datetimesingle"
				@change="changeLog"
			/>
		</view>
		<uni-section :title="'v-model用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" />
		</view>
		<uni-section :title="'插槽用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single"
				>我是一个插槽，点击我</uni-datetime-picker
			>
		</view>
		<uni-section :title="'无边框用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" :border="false" />
		</view>
		<uni-section :title="'disabled用法：' + single" type="line"></uni-section>
		<view class="example-body">
			<uni-datetime-picker v-model="single" disabled />
		</view>
		<uni-section
			:title="'日期范围用法：' + '[' + range + ']'"
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				v-model="range"
				type="daterange"
				start="2021-3-20"
				end="2021-5-20"
				rangeSeparator="至"
			/>
		</view>
		<uni-section
			:title="'日期时间范围用法：' + '[' + datetimerange + ']' "
			type="line"
		></uni-section>
		<view class="example-body">
			<uni-datetime-picker
				v-model="datetimerange"
				type="datetimerange"
				start="2021-3-20 12:00:00"
				end="2021-6-20 20:00:00"
				rangeSeparator="至"
			/>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				single: "2021-04-3",
				datetimesingle: "2021-04-3",
				range: ["2021-03-8", "2021-4-20"],
				datetimerange: ["2021-03-20 20:10:10", "2021-05-10 10:10:10"],
			};
		},

		watch: {
			datetimesingle(newval) {
				console.log("单选:", this.datetimesingle);
			},
			range(newval) {
				console.log("范围选:", this.range);
			},
			datetimerange(newval) {
				console.log("范围选:", this.datetimerange);
			},
		},
		mounted() {
			setTimeout(() => {
				this.datetimesingle = "2021-5-1";
				this.single = "2021-5-1";
			}, 1000);
		},

		methods: {
			change(e) {
				this.single = e;
				console.log("-change事件:", e);
			},
		},
	};
</script>
```

---

## 激励视频广告 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-rewarded-video.html

**Contents:**
- # 激励视频广告
  - # 简介
  - # 流程概述
  - # 组件语法
    - # 简单示例
    - # 完整示例
    - # 组件API调用示例
    - # 获取广告商名称
    - # 显示/隐藏
    - # 广告拉取成功与失败

激励视频广告，是cpm收益最高的广告形式。

手机用户观看几十秒视频广告，在广告播放完毕后可获得应用开发商提供的奖励，而应用开发商则可以从广告平台获取不菲的广告收入。

与开屏、信息流等广告变现方式不同，激励视频需设计激励场景，给用户发放激励。

注意激励不能直接发钱，那会被视为积分墙，而被广告平台禁封。

激励视频是造富神器。行业经常出现几个人的团队，月收入百万的奇迹。

为提升激励视频cpm收益，开发者需要在uni-ad 后台 同时开通多个广告平台，比如穿山甲、优量汇、快手等。然后 uni-ad 会自动竞价、分层，在不同的广告平台选择出价最高的广告来播放。

一个用户每日反复观看激励视频，来领取奖励，会造成广告cpm下降、填充不足等问题。因为广告商不愿意给这个用户再投放广告了。所以一般需要限制用户每日观看激励视频的次数，如15次左右。

在页面中合适位置，引入下面的激励视频启动组件。

该组件是一个容器组件，可以在里面继续包裹<button>、<image>等组件，但无需为button编写点击事件，点击后会自动启动全屏的激励视频。

<ad-rewarded-video></ad-rewarded-video>

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

除了使用组件的点击外，也可以使用API来启动激励视频。

比如自定义一个点击位置，然后调用<ad-rewarded-video>组件的方法来播放激励视频。如下：

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

激励视频广告默认是隐藏的，在用户主动触发广告后进行显示。

只有在用户点击激励视频广告组件上的 关闭广告 按钮时，广告才会关闭。开发者不可控制激励视频广告的隐藏。

loadnext=true 时激励视频广告组件是自动拉取广告并进行更新的。在组件创建后会拉取一次广告，用户点击 关闭广告 后会去拉取下一条广告。

如果拉取失败，通过 @error 注册的回调函数会执行，回调函数的参数是一个包含错误信息的对象。

如果组件的某次自动拉取失败，此时可以调用 load() 手动重新拉取广告。

只有在用户点击激励视频广告组件上的 关闭广告 按钮时，广告才会关闭。这个事件可以通过 @close 监听。

@close 的回调函数会传入一个参数 e.detail，e.detail.isEnded 描述广告被关闭时的状态。

isEnded 作为一个客户端参数，仅作为参考，需通过服务器回调来判断最终结果。

海外广告的 isEnded 参数并不准确，需要通过服务器收到结果来验证。

示例源码如下，请查看 pre > code 标签中的内容

uni.createRewardedVideoAd(options)

options 为 object 类型，属性如下：

uni-ad 不支持在微信小程序上使用API接入，仅支持组件方式<ad-rewarded-video>，组件支持跨平台

返回值为 RewarededVideoAd 类型，属性如下：

开发者可以调用 uni.createRewardedVideoAd 创建激励视频广告组件。

激励视频广告组件默认是隐藏的，因此可以提前创建，以提前初始化组件。开发者可以在页面的 onReady 事件回调中创建广告实例，并在该页面的生命周期内重复调用该广告实例。

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

App平台 3.1.15+ 支持服务器回调

激励视频的要求是，视频广告看完后可以领取激励。

但是，如何安全的判断视频广告看完了？是否存在黑产没有看完广告，但却向开发者骗取激励的情况呢？

是的，这就是激励视频的服务器回调的作用。一个安全的、由广告主/广告sdk认证的、通过安全的服务器发出的激励视频广告真的已经看完的消息。

不配置服务器回调的激励视频是不安全的。因为黑产/攻击者， 可以直接分析开发者的业务服务器请求，发送模拟的激励视频广告已经看完的虚假请求。 也就是攻击者可以做到根本没有真实的看激励视频，但却向开发者的业务服务器发送看完广告的请求，让开发者业务服务器误判，并给黑产发放激励。而此时，开发者根本无法向广告平台拿到广告佣金。广告费没收到，激励却送出去了。

uni-ad的服务器回调，是无法被黑产模拟的。该安全机制被整合到uniCloud云服务中。各家广告厂商的服务器回调被统一集中在uniCloud中。 开发者的业务服务器如果在uniCloud上，则完全无需关心三方攻击者发送模拟请求的问题，uniCloud内部保障了安全。 如果开发者的业务服务器不在uniCloud上，需要由uniCloud发送广告确认看完的消息给开发者的业务服务器，此时需要在开发者的业务服务器和uniCloud之间通过s2s安全机制做认证，让业务服务器只认uniCloud发来的视频播放完毕的消息，拒绝其他地址模拟发送请求。

客户端播放激励视频广告完毕后，广告平台服务器会通知uni-ad，进入uniCloud中。开发者只有在拿到uniCloud确认的视频真的播放完毕后，才应该给用户发送激励。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

通过以下2种方式验证外部服务器与uniCloud安全通讯

示例源码如下，请查看 pre > code 标签中的内容

依赖微信提供的安全网络，安全网络依赖微信提供的 access_token session_key encrypt_key

由于上面三个值之间存在时效和依赖关系，比较复杂，所以需要使用 uni-open-bridge 来接管

注意： config.json不支持注释。在HBuilderX中可用多选//来批量移除注释

开通并配置 安全网络 然后在HBuilderX中项目根目录manifest.json文件内为微信小程序平台开启云端一体安全网络模块

在微信小程序客户端初始化安全网络并传递 openid，通过 uni.checkSession() 检查登录是否过期，过期后需要重新登录并由开发者服务器将 session_key 同步到 uni-open-bridge

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

由于激励视频对应着用户奖励，可能会遇到恶意刷激励奖励但实际上并不看广告的情况。此时广告平台不给结算，但开发者却可能把激励送出去。

为了提升安全性，建议所有使用激励视频的开发者都要做如下工作来加强保护：

激励视频服务器回调业务涉及费用的部分主要是云函数的使用量、调用次数、出网流量(可选)。 接下来，我们对不同资源，分别进行费用评估。

我们按照uniCloud官网列出的按量计费 规则，可以简单得出如下公式：

示例源码如下，请查看 pre > code 标签中的内容

业务不在 uniCloud 时通过 HTTP 方式将回调数据发送到传统服务器，将产生出网流量费用

示例源码如下，请查看 pre > code 标签中的内容

这个费用非常非常低，相比于广告收益，可以忽略。请开发者放心使用。

如果免费额度不能满足业务需求，建议用户开启按量付费套餐，因为只用到了云函数或出网流量或数据库

**Examples:**

Example 1 (unknown):
```unknown
<ad-rewarded-video></ad-rewarded-video>
```

Example 2 (unknown):
```unknown
<ad-rewarded-video></ad-rewarded-video>
```

Example 3 (vue):
```vue
<template>
  <view>
    <ad-rewarded-video adpid="1507000689" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-rewarded-video>
  </view>
</template>
```

Example 4 (vue):
```vue
<template>
  <view>
    <ad-rewarded-video adpid="1507000689" :loadnext="true" v-slot:default="{loading, error}">
      <button :disabled="loading" :loading="loading">显示广告</button>
      <view v-if="error">{{error}}</view>
    </ad-rewarded-video>
  </view>
</template>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-data-picker.html

**Contents:**
- # 介绍
  - # 云端数据
  - # 本地数据
  - # 自定义 Slot
- # API
  - # DataPicker Props
  - # DataPicker Events
  - # DataPicker Methods
  - # DataPicker Slots
- # 示例

代码块： uDataPicker 关联组件：uni-data-pickerview、uni-load-more。

<uni-data-picker> 是一个选择类datacom组件 。

支持单列、和多列级联选择。列数没有限制，如果屏幕显示不全，顶部tab区域会左右滚动。

候选数据支持一次性加载完毕，也支持懒加载，比如示例图中，选择了“北京”后，动态加载北京的区县数据。

<uni-data-picker> 组件尤其适用于地址选择、分类选择等选择类。

<uni-data-picker> 支持本地数据、云端静态数据(json)，uniCloud云数据库数据。

<uni-data-picker> 可以通过JQL直连uniCloud云数据库，配套DB Schema ，可在schema2code中自动生成前端页面，还支持服务器端校验。

在uniCloud数据表中新建表“uni-id-address”和“opendb-city-china”，这2个表的schema自带foreignKey关联。在“uni-id-address”表的表结构页面使用schema2code生成前端页面，会自动生成地址管理的维护页面，自动从“opendb-city-china”表包含的中国所有省市区信息里选择地址。

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

注意事项 localdata 和 collection 同时配置时，localdata 优先

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (unknown):
```unknown
uDataPicker
```

Example 2 (unknown):
```unknown
uni-data-pickerview
```

Example 3 (unknown):
```unknown
uni-load-more
```

Example 4 (unknown):
```unknown
<uni-data-picker>
```

---

## 短视频内容联盟组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/uni-ad/ad-content-page

**Contents:**
- # 短视频内容联盟组件
  - # 简介
  - # 组件
  - # API
- # 短剧
  - # 穿山甲短剧
    - # 开发前准备
    - # 开发时注意事项
      - 本页导读

一个视频内容频道，支持上下滑动切换视频内容

HBuilder 基座的测试广告位 adpid 为 1111111112

仅nvue支持 (iOS-hx3.4.2支持、Android-hx3.1.17支持)

@start @pause @resume @complete回调参数说明

示例源码如下，请查看 pre > code 标签中的内容

通过API调用后将打开一个原生全屏组件，大小不可控制

plus.ad.showContentPage(options, success, fail)

options 为 object 类型，属性如下：

success 为 function 类型，加载成功后的回调

fail 为 function 类型，加载失败后的回调

示例源码如下，请查看 pre > code 标签中的内容

由于uni-ad暂未支持穿山甲短剧，接入短剧功能需要按照uts插件开发文档 ，开发对应的短剧插件。

示例源码如下，请查看 pre > code 标签中的内容

如果插件开发中遇到问题，可以去uni-ad广告群 咨询。

**Examples:**

Example 1 (html):
```html
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

Example 2 (html):
```html
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

Example 3 (html):
```html
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

Example 4 (vue):
```vue
<template>
  <view class="content">
    <ad-content-page class="ad-content-page" ref="adContentPage" adpid="1111111112" @load="onadload" @error="onaderror"></ad-content-page>
  </view>
</template>

<script>
export default {
  data() {
    return {
      title: 'ad-content-page'
    }
  },
  onShow() {
    this.$nextTick(() => {
      // 需要在页面显示时调用广告组件的 show 方法
      this.$refs.adContentPage.show();
    })
  },
  onHide() {
    // 需要在页面隐藏时调用广告组件的 hide 方法停止广告内容的声音
    this.$refs.adContentPage.hide();
  },
  methods: {
    onadload(e) {
      console.log("onadload",e);
    },
    onaderror(e) {
      console.log("onaderror",e);
    }
  }
}
</script>

<style>
.content {
  flex: 1
}

.ad-content-page {
  flex: 1
}
</style>
```

---

## official-account | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/official-account.html

**Contents:**
  - # official-account
      - 本页导读

微信公众号关注组件。当用户扫小程序码打开小程序时，开发者可在小程序内配置公众号关注组件，方便用户快捷关注公众号，可嵌套在原生组件内。

支付宝平台另提供了lifestyle组件，可关注支付宝生活号，规范详情

---

## uni.canvasToTempFilePath(object, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/canvasToTempFilePath.html

**Contents:**
- # uni.canvasToTempFilePath(object, componentInstance)
  - # canvasToTempFilePath 兼容性
      - 本页导读

把当前画布指定区域的内容导出生成指定大小的图片，并返回文件路径。在自定义组件下，第二个参数传入自定义组件实例，以操作组件内 <canvas> 组件。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

Example 2 (javascript):
```javascript
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

Example 3 (javascript):
```javascript
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

Example 4 (css):
```css
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

---

## uni.createMapContext(mapId, componentInstance?) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/location/map.html

**Contents:**
- # uni.createMapContext(mapId, componentInstance?)
  - # createMapContext 兼容性
- # mapContext
- # mapSearch 模块(仅app-nvue支持，Google地图不支持)
  - # reverseGeocode(Object,callback);
    - # Object
    - # callback 返回 Object 参数说明
  - # poiSearchNearBy（Object,callback);
    - # Object
    - # callback 返回 Object 参数说明

创建并返回 map 上下文 mapContext 对象。在自定义组件下，第二个参数传入组件实例this，以操作组件内 <map> 组件。

注意：uni.createMapContext(mapId, this)

mapContext 通过 mapId 跟一个 <map> 组件绑定，通过它可以操作对应的 <map> 组件。

getCenterLocation 的 OBJECT 参数列表

moveToLocation 的 OBJECT 参数列表

translateMarker 的 OBJECT 参数列表

includePoints 的 OBJECT 参数列表

getRegion 的 OBJECT 参数列表

getRotate 的 OBJECT 参数列表

getScale 的 OBJECT 参数列表

getSkew 的 OBJECT 参数列表

addCustomLayer 的 OBJECT 参数列表

addGroundOverlay 的 OBJECT 参数列表

addMarkers 的 OBJECT 参数列表

removeMarkers 的 OBJECT 参数列表

moveAlong 的 OBJECT 参数列表

openMapApp 的 OBJECT 参数列表

setLocMarkerIcon 的 OBJECT 参数列表@setLocMarkerIcon

mapContext （App平台地图服务商差异）

MapContext.on() (app-nvue、微信小程序支持)

markerClusterCreate 缩放或拖动导致新的聚合簇产生时触发，仅返回新创建的聚合簇信息。

markerClusterClick 聚合簇的点击事件。

initMarkerCluster(OBJECT) 结构

示例源码如下，请查看 pre > code 标签中的内容

缩小地图可看到多个 marker 合并为 1 个并显示聚合数量，放大地图后恢复

示例源码如下，请查看 pre > code 标签中的内容

使用三方定位或者地图服务，需向服务提供商（如：高德地图、百度地图、腾讯地图、谷歌地图）申请商业授权和缴纳费用（5万/年）。

详见：https://uniapp.dcloud.net.cn/tutorial/app-geolocation.html#lic

**Examples:**

Example 1 (jsx):
```jsx
<map id="map1" ref="map1"></map>
```

Example 2 (bash):
```bash
this.$refs.map1
```

Example 3 (bash):
```bash
$getAppMap()
```

Example 4 (bash):
```bash
$getAppMap()
```

---

## 组件 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/plugin/components-config.html

**Contents:**
- # 组件
- # 简介
- # 配置文件结构
- # 数据结构
- # 配置项详解
  - # 组件项
  - # 属性项
  - # 属性值项
- # API
      - 本页导读

为了支持组件加密功能，自定义组件提供了一个JSON配置文件，用于配置组件的各项属性。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

加密插件在编译时，会自动在插件根目录下生成一个index.d.ts，用于在Hbuilder X使用加密插件时api的代码提示。

**Examples:**

Example 1 (unknown):
```unknown
.easycom.json
```

Example 2 (unknown):
```unknown
button.easycom.json
```

Example 3 (json):
```json
{
  "name": "Test",
  "description": {
    "value": "测试",
    "kind": "markdown"
  },
  "attributes": [
    {
      "name": "color",
      "description": {
        "value": "颜色",
        "kind": "markdown"
      },
      "type": "string",
      "values": [
        {
          "name": "red",
          "description": "红色"
        }
      ]
    },
    {
      "name": "[event]event",
      "description": {
        "value": "测试用事件",
        "kind": "markdown"
      },
      "type": "(event: UniEvent) => void"
    }
  ],
  "example": "例子",
  "tutorial": "教程",
}
```

Example 4 (json):
```json
{
  "name": "Test",
  "description": {
    "value": "测试",
    "kind": "markdown"
  },
  "attributes": [
    {
      "name": "color",
      "description": {
        "value": "颜色",
        "kind": "markdown"
      },
      "type": "string",
      "values": [
        {
          "name": "red",
          "description": "红色"
        }
      ]
    },
    {
      "name": "[event]event",
      "description": {
        "value": "测试用事件",
        "kind": "markdown"
      },
      "type": "(event: UniEvent) => void"
    }
  ],
  "example": "例子",
  "tutorial": "教程",
}
```

---

## uni.createLivePlayerContext(livePlayerId, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/media/live-player-context.html

**Contents:**
- # uni.createLivePlayerContext(livePlayerId, componentInstance)
- # uni.createLivePusherContext(livePusherId, componentInstance)
  - # livePusherContext
  - # start(OBJECT)
  - # pause(OBJECT)
  - # resume(OBJECT)
  - # stop(OBJECT)
  - # switchCamera(OBJECT)
  - # snapshot(OBJECT)
  - # startPreview(OBJECT)

推荐uni直播，官方内置，使用简单，且价格便宜，更具高性价比！详情 。

创建 live-player 上下文 livePlayerContext 对象。注意是直播的播放而不是推流。

App平台的直播播放，不使用此API，而直接使用video的API。

livePlayerContext 对象的方法列表：

requestFullScreen 的 Object 参数列表：

创建 live-pusher 上下文 livePusherContext 对象。

**Examples:**

Example 1 (unknown):
```unknown
<live-player>
```

Example 2 (unknown):
```unknown
<live-player>
```

Example 3 (unknown):
```unknown
<live-pusher id="livepusher1" ref="livepusher1"></live-pusher>
```

Example 4 (bash):
```bash
this.$refs.livepusher1
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-fav.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Fav Props
  - # Fav Events
- # 示例
      - 本页导读

用于收藏功能，可点击切换选中、不选中的状态。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-fav :checked="checked" @click="onClick"/>
<uni-fav :checked="checked" class="favBtn" circle="true" bgColor="#dd524d" bgColorChecked="#007aff" @click="onClick"/>
```

Example 2 (html):
```html
<uni-fav :checked="checked" @click="onClick"/>
<uni-fav :checked="checked" class="favBtn" circle="true" bgColor="#dd524d" bgColorChecked="#007aff" @click="onClick"/>
```

Example 3 (html):
```html
<uni-fav :checked="checked" @click="onClick"/>
<uni-fav :checked="checked" class="favBtn" circle="true" bgColor="#dd524d" bgColorChecked="#007aff" @click="onClick"/>
```

Example 4 (typescript):
```typescript
<uni-fav :checked="checked" @click="onClick"/>
<uni-fav :checked="checked" class="favBtn" circle="true" bgColor="#dd524d" bgColorChecked="#007aff" @click="onClick"/>
```

---

## uni.createSelectorQuery() | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/ui/nodes-info

**Contents:**
- # uni.createSelectorQuery()
  - # createSelectorQuery 兼容性
- # SelectorQuery
  - # selectorQuery.in(component)
  - # selectorQuery.select(selector)
  - # selectorQuery.selectAll(selector)
  - # selectorQuery.selectViewport()
  - # selectorQuery.exec(callback)
- # NodesRef
  - # nodesRef.fields(object,callback)

返回一个 SelectorQuery 对象实例。可以在这个实例上使用 select 等方法选择节点，并使用 boundingClientRect 等方法选择需要查询的信息。

将选择器的选取范围更改为自定义组件 component 内，返回一个 SelectorQuery 对象实例。（初始时，选择器仅选取页面范围的节点，不会选取任何自定义组件中的节点）。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

在当前页面下选择第一个匹配选择器 selector 的节点，返回一个 NodesRef 对象实例，可以用于获取节点信息。

selector 类似于 CSS 的选择器，但仅支持下列语法。

在当前页面下选择匹配选择器 selector 的所有节点，返回一个 NodesRef 对象实例，可以用于获取节点信息。

选择显示区域，可用于获取显示区域的尺寸、滚动位置等信息，返回一个 NodesRef 对象实例。

执行所有的请求。请求结果按请求次序构成数组，在 callback 的第一个参数中返回。

获取节点的相关信息。第一个参数是节点相关信息配置（必选）；第二参数是方法的回调函数，参数是指定的相关节点信息。

添加节点的布局位置的查询请求。相对于显示区域，以像素为单位。其功能类似于 DOM 的 getBoundingClientRect。返回 NodesRef 对应的 SelectorQuery。

添加节点的滚动位置查询请求。以像素为单位。节点必须是 scroll-view 或者 viewport。返回 NodesRef 对应的 SelectorQuery。

添加节点的 Context 对象查询请求。支持 VideoContext、CanvasContext、和 MapContext 等的获取。

获取 Node 节点实例。目前支持 Canvas 的获取。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

in 将选择器的选取范围更改为自定义组件component内

select 在当前页面下选择第一个匹配选择器selector的节点

boundingClientRect 添加节点的布局位置的查询请求，相对于显示区域，以像素为单位

scrollOffset 添加节点的滚动位置查询请求，以像素为单位

fields 获取节点的相关信息，需要获取的字段在fields中指定

context 添加节点的 Context 对象查询请求

node 获取 Node 节点实例。目前支持 Canvas 的获取。 获取节点的相关信息，需要获取的字段在fields中指定

selectAll 在当前页面下选择匹配选择器selector的所有节点

selectViewport 选择显示区域

**Examples:**

Example 1 (unknown):
```unknown
SelectorQuery
```

Example 2 (unknown):
```unknown
boundingClientRect
```

Example 3 (unknown):
```unknown
uni.createSelectorQuery()
```

Example 4 (unknown):
```unknown
selectorQuery.in
```

---

## cover-view | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/cover-view.html

**Contents:**
- # cover-view
      - 本页导读

app-vue和小程序框架，渲染引擎是webview的。但为了优化体验，部分组件如map、video、textarea、canvas通过原生控件实现，原生组件层级高于前端组件（类似flash层级高于div）。为了能正常覆盖原生组件，设计了cover-view。

微信小程序的cover-view使用注意：

**Examples:**

Example 1 (unknown):
```unknown
hover-class
```

Example 2 (yaml):
```yaml
overflow: scroll
```

Example 3 (yaml):
```yaml
position: fixed
```

Example 4 (unknown):
```unknown
transition-property
```

---

## 组件的概念 | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/component-selection.html

**Contents:**
- # 组件的概念
- # 扩展组件的选择
  - # uni ui
  - # 插件市场更多组件
- # 其他
      - 本页导读

组件是现代开发的重要里程碑。组件重构了分工模型，让大量的轮子出现，让开发者可以拿来轮子直接用，大幅提升了整个产业的效率。

uni-app是有内置组件 的。这和web开发不一样。 web开发基本上不用基础组件，都是找一个三方ui库，全套组件都包含。那是因为html的基础组件默认样式不适配手机风格。 但uni-app体系不是这样，内置组件就是为手机优化的。

但内置组件只能满足基础需求，更多场景，需要扩展组件。 扩展组件是基于内置组件的二次封装，从性能上来讲，扩展组件的性能略低于内置组件，所以开发者切勿抛弃内置组件，直接全套用三方UI组件库。

uni-app的插件市场 ，有很多扩展组件，有的是单独的，有的是成套的。 有些开发者喜欢成套的组件，但注意成套扩展组件也不可能覆盖所有需求，很多场景还是需要单独下载专业组件。

众多扩展组件如何选择？我们首先要搞清楚组件的分类。 组件分2大类：1、vue组件（文件后缀为vue）；2、小程序自定义组件（文件后缀为wxml或其他小程序平台特有后缀名称）

从表格中可以很明显看出，更推荐使用的是全端兼容的uni规范组件。

除了兼容性，在性能和生态完善度层面，不同类型组件有什么差别？

DCloud官方出了一套扩展组件，即uni-ui 这些扩展组件支持单个组件从插件市场下载，也支持npm引入 uni ui，当然更方便的是在HBuilderX新建项目时直接选择uni ui项目模板 uni ui有如下优势：

推荐在HBuilderX新建项目时，直接选择uni ui项目模板，然后在代码里直接敲u，所有组件都拉出来，不用引用、不用注册，直接就用。

插件市场，https://ext.dcloud.net.cn ，有各种玲琅满目的组件、模板。 其中成套的全端兼容ui库包括：

---

## live-player | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/live-player.html

**Contents:**
- # live-player
      - 本页导读

推荐uni直播，官方内置，使用简单，且价格便宜，更具高性价比！详情 。

使用live-player 组件需注意：如果发布到小程序，需要先通过各家小程序的审核。指定类目的小程序才能使用（微信小程序类目 、百度小程序类目 ），审核通过后在各家小程序管理后台自助开通该组件权限。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

Example 2 (html):
```html
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

Example 3 (html):
```html
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

Example 4 (python):
```python
<live-player
  src="https://domain/pull_stream"
  autoplay
  @statechange="statechange"
  @error="error"
  style="width: 300px; height: 225px;"
/>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-number-box.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # NumberBox Props
  - # NumberBox Events
- # 示例
      - 本页导读

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<uni-number-box></uni-number-box>
<uni-number-box v-model="vModelValue" ></uni-number-box>
<uni-number-box :min="0" :max="9"></uni-number-box>
<uni-number-box @change="bindChange"></uni-number-box>
```

Example 2 (html):
```html
<uni-number-box></uni-number-box>
<uni-number-box v-model="vModelValue" ></uni-number-box>
<uni-number-box :min="0" :max="9"></uni-number-box>
<uni-number-box @change="bindChange"></uni-number-box>
```

Example 3 (html):
```html
<uni-number-box></uni-number-box>
<uni-number-box v-model="vModelValue" ></uni-number-box>
<uni-number-box :min="0" :max="9"></uni-number-box>
<uni-number-box @change="bindChange"></uni-number-box>
```

Example 4 (typescript):
```typescript
<uni-number-box></uni-number-box>
<uni-number-box v-model="vModelValue" ></uni-number-box>
<uni-number-box :min="0" :max="9"></uni-number-box>
<uni-number-box @change="bindChange"></uni-number-box>
```

---

## uni-app官网

**URL:** https://uniapp.dcloud.net.cn/component/uniui/uni-fab.html

**Contents:**
- # 介绍
  - # 基本用法
- # API
  - # Fab Props
  - # Fab Events
- # 示例
      - 本页导读

为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。

示例源码如下，请查看 pre > code 标签中的内容

示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。

请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (html):
```html
<template>
	<view>
		<uni-fab
			:pattern="pattern"
			:content="content"
			:horizontal="horizontal"
			:vertical="vertical"
			:direction="direction"
			@trigger="trigger"
		></uni-fab>
	</view>
</template>
```

Example 2 (html):
```html
<template>
	<view>
		<uni-fab
			:pattern="pattern"
			:content="content"
			:horizontal="horizontal"
			:vertical="vertical"
			:direction="direction"
			@trigger="trigger"
		></uni-fab>
	</view>
</template>
```

Example 3 (html):
```html
<template>
	<view>
		<uni-fab
			:pattern="pattern"
			:content="content"
			:horizontal="horizontal"
			:vertical="vertical"
			:direction="direction"
			@trigger="trigger"
		></uni-fab>
	</view>
</template>
```

Example 4 (typescript):
```typescript
<template>
	<view>
		<uni-fab
			:pattern="pattern"
			:content="content"
			:horizontal="horizontal"
			:vertical="vertical"
			:direction="direction"
			@trigger="trigger"
		></uni-fab>
	</view>
</template>
```

---

## uni.canvasToTempFilePath(object, componentInstance) | uni-app官网

**URL:** https://uniapp.dcloud.net.cn/api/canvas/canvasToTempFilePath

**Contents:**
- # uni.canvasToTempFilePath(object, componentInstance)
  - # canvasToTempFilePath 兼容性
      - 本页导读

把当前画布指定区域的内容导出生成指定大小的图片，并返回文件路径。在自定义组件下，第二个参数传入自定义组件实例，以操作组件内 <canvas> 组件。

示例源码如下，请查看 pre > code 标签中的内容

**Examples:**

Example 1 (javascript):
```javascript
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

Example 2 (javascript):
```javascript
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

Example 3 (javascript):
```javascript
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

Example 4 (css):
```css
uni.canvasToTempFilePath({
  x: 100,
  y: 200,
  width: 50,
  height: 50,
  destWidth: 100,
  destHeight: 100,
  canvasId: 'myCanvas',
  success: function(res) {
    // 在H5平台下，tempFilePath 为 base64
    console.log(res.tempFilePath)
  }
})
```

---

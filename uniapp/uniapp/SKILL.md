---
name: uniapp
description: uni-app 是一个使用 Vue.js 开发所有前端应用的框架，开发者编写一套代码，可发布到iOS、Android、鸿蒙Next、Web（响应式）、以及各种小程序（微信/支付宝/百度/抖音/飞书/QQ/快手/钉钉/淘宝/京东/小红书）、快应用、鸿蒙元服务等多个平台。
---

# Uniapp Skill

Uni-app 是一个使用 vue.js 开发所有前端应用的框架，开发者编写一套代码，可发布到ios、android、鸿蒙next、web（响应式）、以及各种小程序（微信/支付宝/百度/抖音/飞书/qq/快手/钉钉/淘宝/京东/小红书）、快应用、鸿蒙元服务等多个平台。, generated from official documentation.

## When to Use This Skill

This skill should be triggered when:
- Working with uniapp
- Asking about uniapp features or APIs
- Implementing uniapp solutions
- Debugging uniapp code
- Learning uniapp best practices

## Quick Reference

### Common Patterns

**Pattern 1:** 介绍 教程 全局文件 组件 API 插件 AI专题 工程化 UTS 其他规范 其他规范 App扩展规范 HTML5 Plus 微信小程序 支付宝小程序 百度小程序 抖音小程序 飞书小程序 钉钉小程序 QQ小程序 快手小程序 京东小程序 华为快应用 360小程序 Weex 鸿蒙元服务 小红书小程序 GitHub 组件概述内置组件 扩展组件（uni-ui） 介绍开始使用色彩说明uni-sass 辅助样式uni-badge 数字角标uni-breadcrumb 面包屑uni-calendar 日历uni-card 卡片uni-collapse 折叠面板uni-combox 组合框uni-countdown 倒计时uni-data-checkbox 数据选择器uni-data-picker 级联选择器uni-data-select 下拉框uni-dateformat 日期格式化uni-datetime-picker 日期选择器uni-drawer 抽屉uni-easyinput 增强输入框uni-fab 悬浮按钮uni-fav 收藏按钮uni-file-picker 文件选择上传uni-forms 表单uni-goods-nav 商品导航uni-grid 宫格uni-group 分组uni-icons 图标uni-indexed-list 索引列表uni-link 超链接uni-list 列表uni-load-more 加载更多uni-nav-bar 自定义导航栏uni-notice-bar 通告栏uni-number-box 数字输入框uni-pagination 分页器uni-popup 弹出层uni-rate 评分uni-row 布局-行uni-search-bar 搜索栏uni-section 标题栏uni-segmented-control 分段器uni-steps 步骤条uni-swipe-action 滑动操作uni-swiper-dot 轮播图指示点uni-table 表格uni-tag 标签uni-title 章节标题uni-tooltip 文字提示uni-transition 过渡动画更新日志 更多插件市场的组件 ui 设计资源datacom 组件规范小程序自定义组件组件库选型指南 uniCloud Web控制台 插件市场 ask问答社区 uni-ad uni统计 代码仓库： Gitee 、 GitHub uni-app的uni-im交流群： 点击加入 官方QQ交流群 群35：713420817（2000人已满） 群34：530305531（2000人已满） 群33：498071674（2000人已满） 群32：166188631（2000人已满） 群31：567471669（2000人已满） 群30：371046920（2000人已满） 群29：202965481（2000人已满） 群28：166188776（2000人已满） 群27：811363410（2000人已满） 群26：147867597（2000人已满） 群25：165297000（2000人已满） 群24：672494800（2000人已满） 群23：599958679（2000人已满） 群22：687186952（2000人已满） 群21：717019120（2000人已满） 群20：165796402（2000人已满） 群19：165657124（2000人已满） 群18：698592271（2000人已满） 群17：951348804（2000人已满） 群16：719211033（2000人已满） 群15：516984120（2000人已满） 群14：465953250（2000人已满） 群13：699478442（2000人已满） 群12：884860657（2000人已满） 群11：296811328（2000人已满） 群10：959059626（2000人已满） 群9：775128777（2000人已满） 群8：695442854（2000人已满） 群7：942061423（2000人已满） 群6：697264024（2000人已满） 群5：731951419（2000人已满） 群4：942702595（2000人已满） 群3：773794803（2000人已满） 群2：901474938（2000人已满） 群1：531031261（2000人已满） 关注微信公众号 介绍基本用法APIFab PropsFab Events示例 组件名：uni-fab 代码块： uFab 点击下载&安装 点击可展开一个图形按钮菜单 # 介绍 注意事项 为了避免错误使用，给大家带来不好的开发体验，请在使用组件前仔细阅读下面的注意事项，可以帮你避免一些错误。 不建议动态修改属性，可能会耗损部分性能。 展开菜单暂不支持字体图标，使用图片路径时建议使用绝对路径，相对路径可能会有问题。 选中状态要通过自己控制，如果不希望有选中状态，不处理 active 即可。 展开菜单建议最多显示四个，如果过多对于小屏手机可能会超出屏幕。 # 基本用法 在 template 中使用组件 <template> <view> <uni-fab :pattern="pattern" :content="content" :horizontal="horizontal" :vertical="vertical" :direction="direction" @trigger="trigger" ></uni-fab> </view> </template> 示例源码如下，请查看 pre > code 标签中的内容 <template> <view> <uni-fab :pattern="pattern" :content="content" :horizontal="horizontal" :vertical="vertical" :direction="direction" @trigger="trigger" ></uni-fab> </view> </template># API # Fab Props 属性名 类型 默认值 说明 pattern Object - 可选样式配置项 horizontal String 'left' 水平对齐方式。left:左对齐，right：右对齐 vertical String 'bottom' 垂直对齐方式。bottom:下对齐，top：上对齐 direction String 'horizontal' 展开菜单显示方式。horizontal:水平显示，vertical：垂直显示 popMenu Boolean true 是否使用弹出菜单 content Array - 展开菜单内容配置项 pattern配置项： 参数 类型 默认值 说明 color String #3c3e49 文字默认颜色 selectedColor String #007AFF 文字选中时的颜色 backgroundColor String #ffffff 背景色 buttonColor String #3c3e49 按钮背景色 icon String plusempty 自定义图标，图标来自 uni-icons content配置项： 参数 类型 说明 iconPath String 图片路径 selectedIconPath String 选中后图片路径 text String 文字 active Boolean 是否选中当前 # Fab Events 参数 类型 说明 @trigger Function 展开菜单点击事件，返回点击信息 @fabClick Function 悬浮按钮点击事件 # 示例 注意 示例依赖了 uni-card uni-section uni-scss 等多个组件，直接拷贝示例代码将无法正常运行 。 请到 组件下载页面 ，在页面右侧选择 使用 HBuilderX导入示例项目 ，体验完整组件示例。 TemplateScriptStyle<template> <view class="container"> <uni-card :is-shadow="false" is-full> <text class="uni-h6">uni-ui 规范颜色色板，通过内置样式快速指定元素前景和背景色。</text> </uni-card> <uni-section title="基本功能" subTitle="点击按钮,切换 fab 不同状态" type="line"> <view class="warp"> <button class="button" type="primary" @click="switchBtn(0)">切换菜单方向({{ directionStr }})</button> <button class="button" type="primary" @click="switchBtn('left', 'bottom')">左下角显示</button> <button class="button" type="primary" @click="switchBtn('right', 'bottom')">右下角显示</button> <button class="button" type="primary" @click="switchBtn('left', 'top')">左上角显示</button> <button class="button" type="primary" @click="switchBtn('left', 'top')">左上角显示</button> <button class="button" type="primary" @click="switchBtn('right', 'top')">右上角显示</button> <button class="button" type="primary" @click="switchColor">修改颜色</button> </view> </uni-section> <uni-fab ref="fab" :pattern="pattern" :content="content" :horizontal="horizontal" :vertical="vertical" :direction="direction" @trigger="trigger" @fabClick="fabClick" /> </view> </template> 示例源码如下，请查看 pre > code 标签中的内容 <template> <view class="container"> <uni-card :is-shadow="false" is-full> <text class="uni-h6">uni-ui 规范颜色色板，通过内置样式快速指定元素前景和背景色。</text> </uni-card> <uni-section title="基本功能" subTitle="点击按钮,切换 fab 不同状态" type="line"> <view class="warp"> <button class="button" type="primary" @click="switchBtn(0)">切换菜单方向({{ directionStr }})</button> <button class="button" type="primary" @click="switchBtn('left', 'bottom')">左下角显示</button> <button class="button" type="primary" @click="switchBtn('right', 'bottom')">右下角显示</button> <button class="button" type="primary" @click="switchBtn('left', 'top')">左上角显示</button> <button class="button" type="primary" @click="switchBtn('left', 'top')">左上角显示</button> <button class="button" type="primary" @click="switchBtn('right', 'top')">右上角显示</button> <button class="button" type="primary" @click="switchColor">修改颜色</button> </view> </uni-section> <uni-fab ref="fab" :pattern="pattern" :content="content" :horizontal="horizontal" :vertical="vertical" :direction="direction" @trigger="trigger" @fabClick="fabClick" /> </view> </template>示例源码如下，请查看 pre > code 标签中的内容 <script> export default { components: {}, data() { return { title: 'uni-fab', directionStr: '垂直', horizontal: 'left', vertical: 'bottom', direction: 'horizontal', pattern: { color: '#7A7E83', backgroundColor: '#fff', selectedColor: '#007AFF', buttonColor: '#007AFF', iconColor: '#fff' }, is_color_type: false, content: [{ iconPath: '/static/image.png', selectedIconPath: '/static/image-active.png', text: '相册', active: false }, { iconPath: '/static/home.png', selectedIconPath: '/static/home-active.png', text: '首页', active: false }, { iconPath: '/static/star.png', selectedIconPath: '/static/star-active.png', text: '收藏', active: false } ] } }, onBackPress() { if (this.$refs.fab.isShow) { this.$refs.fab.close() return true } return false }, methods: { trigger(e) { console.log(e) this.content[e.index].active = !e.item.active uni.showModal({ title: '提示', content: `您${this.content[e.index].active ? '选中了' : '取消了'}${e.item.text}`, success: function(res) { if (res.confirm) { console.log('用户点击确定') } else if (res.cancel) { console.log('用户点击取消') } } }) }, fabClick() { uni.showToast({ title: '点击了悬浮按钮', icon: 'none' }) }, switchBtn(hor, ver) { if (hor === 0) { this.direction = this.direction === 'horizontal' ? 'vertical' : 'horizontal' this.directionStr = this.direction === 'horizontal' ? '垂直' : '水平' } else { this.horizontal = hor this.vertical = ver } this.$forceUpdate() }, switchColor() { this.is_color_type = !this.is_color_type if (this.is_color_type) { this.pattern.iconColor = '#aaa' this.pattern.buttonColor = '#fff' } else { this.pattern.iconColor = '#fff' this.pattern.buttonColor = '#007AFF' } } } } </script>示例源码如下，请查看 pre > code 标签中的内容 <style lang="scss"> .warp { padding: 10px; } .button { margin-bottom: 10px; } </style>完整示例演示 帮助我们改善此页面！ 上次更新: 2025/8/4 15:27:57 开发产品HBuilderXuni-appuni-app xuniClouduniMPsdk5+Runtimewap2appMUIuni-iduni-cdnuni-payuni-pushuni一键登录uni实人认证smsuni-starteruni-adminuni-upgrade-centeruni-imuni-aiuni-cmsuniCloud-mapuni-search 运营产品uni-aduni统计uni发行uni安全专题开发者服务问答社区开发者后台技术文档uni-app文档uniCloud文档原生开发者支持文档HBuilder文档生态服务插件市场OAuth用户开放平台 关于我们： DCloud官网 案例 需求墙 许可协议 加入我们 赞助我们 联系我们： 商务合作：bd@dcloud.io 广告合作：uniad@dcloud.io DCloud.io 数字天堂（北京）网络技术有限公司是 HTML5中国产业联盟 发起单位 京公网安备：11010802035340号 国家信息安全等级保护三级，证书编号：11010813802-20001 本页导读 介绍基本用法APIFab PropsFab Events示例

```
uFab
```

### Example Code Patterns

**Example 1** (swift):
```swift
// swift
// 此协议定义在其他三方 SDK 中
protocol TestProtocol {
   func addTwoInts(_ a: Int, _ b: Int) -> Int
}
```

**Example 2** (php):
```php
运行 --> 运行到手机或模拟器 --> 选择设备
```

**Example 3** (javascript):
```javascript
const callback = function (res) {
	console.log(res.direction);
}
uni.onCompassChange(callback);
```

**Example 4** (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

**Example 5** (javascript):
```javascript
uni.setScreenBrightness({
	value: 0.5,
	success: function () {
		console.log('success');
	}
});
```

## Reference Files

This skill includes comprehensive documentation in `references/`:

- **ai.md** - Ai documentation
- **api.md** - Api documentation
- **collocation.md** - Collocation documentation
- **component.md** - Component documentation
- **introduction.md** - Introduction documentation
- **other.md** - Other documentation
- **plugin.md** - Plugin documentation
- **tutorial.md** - Tutorial documentation
- **uts.md** - Uts documentation
- **worktile.md** - Worktile documentation

Use `view` to read specific reference files when detailed information is needed.

## Working with This Skill

### For Beginners
Start with the getting_started or tutorials reference files for foundational concepts.

### For Specific Features
Use the appropriate category reference file (api, guides, etc.) for detailed information.

### For Code Examples
The quick reference section above contains common patterns extracted from the official docs.

## Resources

### references/
Organized documentation extracted from official sources. These files contain:
- Detailed explanations
- Code examples with language annotations
- Links to original documentation
- Table of contents for quick navigation

### scripts/
Add helper scripts here for common automation tasks.

### assets/
Add templates, boilerplate, or example projects here.

## Notes

- This skill was automatically generated from official documentation
- Reference files preserve the structure and examples from source docs
- Code examples include language detection for better syntax highlighting
- Quick reference patterns are extracted from common usage examples in the docs

## Updating

To refresh this skill with updated documentation:
1. Re-run the scraper with the same configuration
2. The skill will be rebuilt with the latest information

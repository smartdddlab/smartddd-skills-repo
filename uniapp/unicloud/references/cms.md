# Unicloud - Cms

**Pages:** 2

---

## uni-cms | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cms

**Contents:**
- # uni-cms
- # 介绍
- # 产品亮点
    - # 管理端截图：
    - # 用户端截图：
- # 功能介绍
  - # 文章管理
  - # 观看广告解锁全文
  - # 文章预览
- # 如何使用

uni-cms是全端的、云端一体的开源CMS内容管理系统。

它提供了完善的内容管理，文章编辑、全端渲染。甚至还内置了付费内容看广告解锁和AI生成文章等功能。

即帮助开发者提高开发效率，更提高了内容生产效率和变现效率。

客户端插件之所以起名为 uni-cms-article 。是因为未来可能还会拓展 uni-cms-image、uni-cms-video 等插件，实现对富媒体内容的管理。

需求建议、bug反馈请点击加入uni-cms交流群 反馈与交流。

支持文章保存草稿、发布、编辑、下架、删除、阅读量统计等功能。

创建文章时支持保存为草稿或者直接发布，当保存为草稿时，文章可以再次编辑，直到文章发布成功。 已发布的文章可以编辑，但是编辑后需要更新文章，才能生效。 当已发布的文章出现侵权或者一些原因需要隐藏时，可在文章列表中对该篇文章进行下架操作，下架后的文章将不会在前端展示，同时文章状态会变为“草稿”状态。

阅读量统计（PV）：每次打开文章详情页，都会向后端发送请求，在schema扩展中（uni-cms-articles.schema.ext.js）会对文章的阅读量进行加一统计。

使用观看广告解锁全文功能需要在uni-ad后台开通激励视频广告 。

目前H5端不支持广告，所以在H5端无法使用观看广告解锁全文功能

观看广告解锁全文功能，是uni-cms的核心功能之一。它可以帮助开发者快速变现，提高内容生产效率。

在文章未发布时可以通过文章预览功能，预览文章的渲染效果。

当使用文章预览功能时，需要部署uni-cms-article插件来实现文章预览功能。

预览密钥： 用于文章预览时的身份验证，防止文章被恶意预览。每个密钥有效期为2小时，过期后需要重新生成。

预览页面地址： 文章预览是访问的页面地址，固定为uni_modules/uni-cms-article/pages/detail/preview

小程序/APP预览： 打开uni-cms-article列表页面，点击顶部搜索文章，在输入框右侧点击扫一扫按钮，扫描预览二维码，即可在小程序/APP中预览文章。

网页预览： 输入部署uni-cms-article插件的网页地址，如果部署的路由是hash模式，需要在地址后面加上#，如：http://localhost:8080/# 如果部署的路由是history模式，直接写地址，如：http://localhost:8080/ 。

使用方式简单，只需导入对应的插件至项目中即可。

在插件市场中找到uni-cms ，将插件导入至uni-admin项目中。

如果还未使用过uni-admin，请先在HBuilderX新建项目时选择uni-admin项目。并需要了解uni-admin的相关知识。

导入uni-cms插件后，在 uni-admin 项目中找到 uniCloud/database 目录，右键点击“配置Schema扩展js的公共模块或扩展库”，在弹出的界面中选择 quill-delta-converter 公共模块并确定。

完成以上配置，运行启动uni-admin，在web管理后台，点击左侧菜单栏的菜单管理，添加“内容管理”菜单。

添加后刷新页面，在uni-admin左侧菜单，可看到内容管理的菜单项，点击即可进入相关页面。

管理端编辑的内容，在用户端呈现。在插件市场中找到uni-cms-article ，将插件导入至uni-app用户端项目中。

uni-cms-article 插件所在项目需要和 uni-cms 插件所在项目关联同一服务空间。

如果开发者同时开发管理管和客户端，可以在uniCloud目录上右键“关联服务空间”，在弹窗中选择“绑定其他项目的服务空间”，在列表中选择管理端项目并关联。

如果项目单独使用uni-cms-article插件，需要在unCloud/database目录上右键点击“创建Schema”来创建uni-cms-articles与uni-cms-categories表。

关联服务空间后，需要在uni-cms配置文件中，配置clientAppIds字段，值类型为数组，数组中每一项是客户端appId，详细配置文件参考

如需将文章列表页作为首页访问，需要修改pages.json文件，将文章列表页路径提升至pages数组的第一项，并且替换tabBar.list数组第一项为文章列表页路径，具体pages.json文件配置项参考pages.json文档 。

如果您的cms内容管理涉及多名作者登录。有2种处理方式。

首先作者们需要在uni-admin中注册账户。

然后系统管理员在uni-admin中新建一个文章作者角色。在 系统管理 - 角色管理 中操作，如下图所示：

然后系统管理员在 系统管理 - 用户管理 中，为已注册用户赋予作者角色。

如果作者属于外部人员，比如合作的自媒体。则不适合让外部人员登录你的admin系统。

此时合适的做法是新建一个项目做为作者端。也就是整个cms大系统，分为管理端、读者端、作者端。

目前uni-cms没有提供独立的作者端。有需求的开发者需自行改造uni-cms插件。

AI功能基于 uni-ai-chat 实现，uni-ai-chat 文档请参考uni-ai-chat 。

uni-ai-chat 支持 stream 流式响应，stream 流式响应基于 uni-push2.0 实现，uni-push2.0 文档请参考uni-push 。

如果开通了 uni-push 后将默认使用 stream 流式响应返回 AI 结果，如果未开通 uni-push 将使用普通响应返回 AI 结果。

uni-cms版本大于等于1.0.4时，无需在App.vue内初始化uni-im，uni-cms已经内置了初始化操作。

示例源码如下，请查看 pre > code 标签中的内容

如果目前的 uni-CMS 不能满足你的需求，你可以基于 uni-CMS 进行二次开发。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

负责处理与创建、更新和读取文章相关的各种逻辑

在创建（beforeCreate）和更新（beforeUpdate）文章之前，检测文章的标题、摘要、内容和封面图片是否包含敏感信息。若包含敏感信息，则抛出错误，提示用户修改。

在读取文章（afterRead）时，根据用户的阅读情况更新文章的阅读次数（view_count）。同时处理文章内容的解锁逻辑。如果文章包含解锁内容，根据用户的登录状态和解锁记录返回相应的内容。

checkContentSec：检测文本内容是否包含敏感信息。

checkImageSec：检测图片是否违规。

checkContentSecurityEnable：检查内容安全开关是否启用。

safeRequire：安全地引入模块，如果模块不存在，则抛出错误。

uni-cms的云端的配置文件统一使用uni-config-center。

云函数uni-cms、uni-cms-unlock-callback 都使用同一个配置文件

新建配置文件（如不存在），路径为 uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-cms/config.json，用于配置uni-cms，完整配置如下:

示例源码如下，请查看 pre > code 标签中的内容

目前富文本编辑器支持Web、微信小程序、App。不支持其他平台。底层基于Quill.js，详见https://quilljs.com/

如果编辑器在微信小程序或App使用，将不支持插件扩展，仅支持基本的富文本编辑功能

如果需要开发插件，将不能发布至微信小程序或者App，否则会出现编辑器无法使用的情况

Web端：支持插件开发，支持所有Quill.js的功能

小程序端/App端：不支持插件开发，仅支持基本的富文本编辑功能，超链接插入将被转换为MarkDown格式，如插入广告解锁ToolBar，将会转会为图片，但不影响前端正常渲染，仅需编辑时注意

由于自定义了 toolbar 的配置，所以需要在 uni_modules/uni-cms/components/editor/web/formats 目录下添加对应的格式文件，例如 image.js 文件，用于处理图片标签格式，代码如下:

示例源码如下，请查看 pre > code 标签中的内容

每一个格式或者模块都必须导出一个方法, 参数接收 Quill 对象，该方法必须返回一个对象，对象的 key 为格式或者模块的名称，value 为对应的格式或者模块，例如:

示例源码如下，请查看 pre > code 标签中的内容

在 uni_modules/uni-cms/components/editor/web/index.js 文件中引入image.js文件，例如:

示例源码如下，请查看 pre > code 标签中的内容

在 uni_modules/uni-cms/components/editor/editor.vue 中找到 toolbar H5的条件编译区块，添加插入图片按钮，例如:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当用户端浏览文章时，查询文章详情会触发在uni-cms-articles.schema.ext.js（schema扩展库）中定义的数据库读取触发器，在这段js中验证用户/设备是否已解锁，已解锁的用户将会直接展示全文，未解锁的用户将会展示解锁全文按钮。

用户点击解锁全文按钮后，将会弹出激励视频广告，

文章内容对外发布时，需避免发布内容包含违法内容。否则轻则导致应用下架，重则承担刑事责任。

所以需在发布前调用三方的内容验证接口，如果内容涉及敏感词或者不合规的图片，则接口会提示异常。

内容安全功能由uni-sec-check 提供，默认未开启。

注意：uni-sec-check模块使用了微信的内容安全接口，所以依赖uni-open-bridge管理微信凭据，使用前需要在uni-config-center内添加uni-id配置， 具体配置参考uni-sec-check文档

如开启了uni-cms的内容安全校验，会在发布前使用 uni-sec-check 检测用户输入的文字与上传的图片，如果检测到违规内容，内容将无法发布。

您可以根据自己需求开启或关闭内容安全检测，在 uni-cms 云端配置文件中配置 contentSecurity 字段，例如:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

遇到无法解决的问题，点击加入uni-cms交流群 反馈

检查项目根目录下的 pages.json 文件中是否存在 uni-cms-article 插件内页面，在 pages.json 文件内搜索“uni-cms-article”关键字。

如果搜索结果为空，可能是未导入uni-cms-article插件或者导入插件时在“合并Pages窗口”弹窗中跳过了合并pages.json文件，重新导入插件即可。

如果存在uni-cms-article插件页面，说明导入正常。直接访问文章列表页面路径即可，文章列表页面路径是uni_modules/uni-cms-article/pages/list/list。

如果想要文章列表页作为应用的首页，需要在pages.json文件内，将文章列表页路径提升至pages数组的第一项，并且在tabBar.list数组的第一项也替换为文章列表页路径，具体pages.json文件配置项参考pages.json文档 。

检查uni-cms配置文件是否将客户端appId配置在clientAppIds数组内，如未添加客户端appId客户端不会正常解析文章正文内容，详细配置文件参考

这是因为开启了内容安全检测，但是没有正确配置微信小程序的appid和appsecret导致的，查看内容安全检测文档 关闭或配置内容安全检测

增加更多列表页模板，包括顶部分类、列表大图、小图、多图样式

**Examples:**

Example 1 (html):
```html
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 2 (html):
```html
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 3 (javascript):
```javascript
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 4 (html):
```html
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

---

## uni-cms | uniCloud

**URL:** https://doc.dcloud.net.cn/uniCloud/uni-cms.html

**Contents:**
- # uni-cms
- # 介绍
- # 产品亮点
    - # 管理端截图：
    - # 用户端截图：
- # 功能介绍
  - # 文章管理
  - # 观看广告解锁全文
  - # 文章预览
- # 如何使用

uni-cms是全端的、云端一体的开源CMS内容管理系统。

它提供了完善的内容管理，文章编辑、全端渲染。甚至还内置了付费内容看广告解锁和AI生成文章等功能。

即帮助开发者提高开发效率，更提高了内容生产效率和变现效率。

客户端插件之所以起名为 uni-cms-article 。是因为未来可能还会拓展 uni-cms-image、uni-cms-video 等插件，实现对富媒体内容的管理。

需求建议、bug反馈请点击加入uni-cms交流群 反馈与交流。

支持文章保存草稿、发布、编辑、下架、删除、阅读量统计等功能。

创建文章时支持保存为草稿或者直接发布，当保存为草稿时，文章可以再次编辑，直到文章发布成功。 已发布的文章可以编辑，但是编辑后需要更新文章，才能生效。 当已发布的文章出现侵权或者一些原因需要隐藏时，可在文章列表中对该篇文章进行下架操作，下架后的文章将不会在前端展示，同时文章状态会变为“草稿”状态。

阅读量统计（PV）：每次打开文章详情页，都会向后端发送请求，在schema扩展中（uni-cms-articles.schema.ext.js）会对文章的阅读量进行加一统计。

使用观看广告解锁全文功能需要在uni-ad后台开通激励视频广告 。

目前H5端不支持广告，所以在H5端无法使用观看广告解锁全文功能

观看广告解锁全文功能，是uni-cms的核心功能之一。它可以帮助开发者快速变现，提高内容生产效率。

在文章未发布时可以通过文章预览功能，预览文章的渲染效果。

当使用文章预览功能时，需要部署uni-cms-article插件来实现文章预览功能。

预览密钥： 用于文章预览时的身份验证，防止文章被恶意预览。每个密钥有效期为2小时，过期后需要重新生成。

预览页面地址： 文章预览是访问的页面地址，固定为uni_modules/uni-cms-article/pages/detail/preview

小程序/APP预览： 打开uni-cms-article列表页面，点击顶部搜索文章，在输入框右侧点击扫一扫按钮，扫描预览二维码，即可在小程序/APP中预览文章。

网页预览： 输入部署uni-cms-article插件的网页地址，如果部署的路由是hash模式，需要在地址后面加上#，如：http://localhost:8080/# 如果部署的路由是history模式，直接写地址，如：http://localhost:8080/ 。

使用方式简单，只需导入对应的插件至项目中即可。

在插件市场中找到uni-cms ，将插件导入至uni-admin项目中。

如果还未使用过uni-admin，请先在HBuilderX新建项目时选择uni-admin项目。并需要了解uni-admin的相关知识。

导入uni-cms插件后，在 uni-admin 项目中找到 uniCloud/database 目录，右键点击“配置Schema扩展js的公共模块或扩展库”，在弹出的界面中选择 quill-delta-converter 公共模块并确定。

完成以上配置，运行启动uni-admin，在web管理后台，点击左侧菜单栏的菜单管理，添加“内容管理”菜单。

添加后刷新页面，在uni-admin左侧菜单，可看到内容管理的菜单项，点击即可进入相关页面。

管理端编辑的内容，在用户端呈现。在插件市场中找到uni-cms-article ，将插件导入至uni-app用户端项目中。

uni-cms-article 插件所在项目需要和 uni-cms 插件所在项目关联同一服务空间。

如果开发者同时开发管理管和客户端，可以在uniCloud目录上右键“关联服务空间”，在弹窗中选择“绑定其他项目的服务空间”，在列表中选择管理端项目并关联。

如果项目单独使用uni-cms-article插件，需要在unCloud/database目录上右键点击“创建Schema”来创建uni-cms-articles与uni-cms-categories表。

关联服务空间后，需要在uni-cms配置文件中，配置clientAppIds字段，值类型为数组，数组中每一项是客户端appId，详细配置文件参考

如需将文章列表页作为首页访问，需要修改pages.json文件，将文章列表页路径提升至pages数组的第一项，并且替换tabBar.list数组第一项为文章列表页路径，具体pages.json文件配置项参考pages.json文档 。

如果您的cms内容管理涉及多名作者登录。有2种处理方式。

首先作者们需要在uni-admin中注册账户。

然后系统管理员在uni-admin中新建一个文章作者角色。在 系统管理 - 角色管理 中操作，如下图所示：

然后系统管理员在 系统管理 - 用户管理 中，为已注册用户赋予作者角色。

如果作者属于外部人员，比如合作的自媒体。则不适合让外部人员登录你的admin系统。

此时合适的做法是新建一个项目做为作者端。也就是整个cms大系统，分为管理端、读者端、作者端。

目前uni-cms没有提供独立的作者端。有需求的开发者需自行改造uni-cms插件。

AI功能基于 uni-ai-chat 实现，uni-ai-chat 文档请参考uni-ai-chat 。

uni-ai-chat 支持 stream 流式响应，stream 流式响应基于 uni-push2.0 实现，uni-push2.0 文档请参考uni-push 。

如果开通了 uni-push 后将默认使用 stream 流式响应返回 AI 结果，如果未开通 uni-push 将使用普通响应返回 AI 结果。

uni-cms版本大于等于1.0.4时，无需在App.vue内初始化uni-im，uni-cms已经内置了初始化操作。

示例源码如下，请查看 pre > code 标签中的内容

如果目前的 uni-CMS 不能满足你的需求，你可以基于 uni-CMS 进行二次开发。

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

负责处理与创建、更新和读取文章相关的各种逻辑

在创建（beforeCreate）和更新（beforeUpdate）文章之前，检测文章的标题、摘要、内容和封面图片是否包含敏感信息。若包含敏感信息，则抛出错误，提示用户修改。

在读取文章（afterRead）时，根据用户的阅读情况更新文章的阅读次数（view_count）。同时处理文章内容的解锁逻辑。如果文章包含解锁内容，根据用户的登录状态和解锁记录返回相应的内容。

checkContentSec：检测文本内容是否包含敏感信息。

checkImageSec：检测图片是否违规。

checkContentSecurityEnable：检查内容安全开关是否启用。

safeRequire：安全地引入模块，如果模块不存在，则抛出错误。

uni-cms的云端的配置文件统一使用uni-config-center。

云函数uni-cms、uni-cms-unlock-callback 都使用同一个配置文件

新建配置文件（如不存在），路径为 uni_modules/uni-config-center/uniCloud/cloudfunctions/common/uni-config-center/uni-cms/config.json，用于配置uni-cms，完整配置如下:

示例源码如下，请查看 pre > code 标签中的内容

目前富文本编辑器支持Web、微信小程序、App。不支持其他平台。底层基于Quill.js，详见https://quilljs.com/

如果编辑器在微信小程序或App使用，将不支持插件扩展，仅支持基本的富文本编辑功能

如果需要开发插件，将不能发布至微信小程序或者App，否则会出现编辑器无法使用的情况

Web端：支持插件开发，支持所有Quill.js的功能

小程序端/App端：不支持插件开发，仅支持基本的富文本编辑功能，超链接插入将被转换为MarkDown格式，如插入广告解锁ToolBar，将会转会为图片，但不影响前端正常渲染，仅需编辑时注意

由于自定义了 toolbar 的配置，所以需要在 uni_modules/uni-cms/components/editor/web/formats 目录下添加对应的格式文件，例如 image.js 文件，用于处理图片标签格式，代码如下:

示例源码如下，请查看 pre > code 标签中的内容

每一个格式或者模块都必须导出一个方法, 参数接收 Quill 对象，该方法必须返回一个对象，对象的 key 为格式或者模块的名称，value 为对应的格式或者模块，例如:

示例源码如下，请查看 pre > code 标签中的内容

在 uni_modules/uni-cms/components/editor/web/index.js 文件中引入image.js文件，例如:

示例源码如下，请查看 pre > code 标签中的内容

在 uni_modules/uni-cms/components/editor/editor.vue 中找到 toolbar H5的条件编译区块，添加插入图片按钮，例如:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

当用户端浏览文章时，查询文章详情会触发在uni-cms-articles.schema.ext.js（schema扩展库）中定义的数据库读取触发器，在这段js中验证用户/设备是否已解锁，已解锁的用户将会直接展示全文，未解锁的用户将会展示解锁全文按钮。

用户点击解锁全文按钮后，将会弹出激励视频广告，

文章内容对外发布时，需避免发布内容包含违法内容。否则轻则导致应用下架，重则承担刑事责任。

所以需在发布前调用三方的内容验证接口，如果内容涉及敏感词或者不合规的图片，则接口会提示异常。

内容安全功能由uni-sec-check 提供，默认未开启。

注意：uni-sec-check模块使用了微信的内容安全接口，所以依赖uni-open-bridge管理微信凭据，使用前需要在uni-config-center内添加uni-id配置， 具体配置参考uni-sec-check文档

如开启了uni-cms的内容安全校验，会在发布前使用 uni-sec-check 检测用户输入的文字与上传的图片，如果检测到违规内容，内容将无法发布。

您可以根据自己需求开启或关闭内容安全检测，在 uni-cms 云端配置文件中配置 contentSecurity 字段，例如:

示例源码如下，请查看 pre > code 标签中的内容

示例源码如下，请查看 pre > code 标签中的内容

遇到无法解决的问题，点击加入uni-cms交流群 反馈

检查项目根目录下的 pages.json 文件中是否存在 uni-cms-article 插件内页面，在 pages.json 文件内搜索“uni-cms-article”关键字。

如果搜索结果为空，可能是未导入uni-cms-article插件或者导入插件时在“合并Pages窗口”弹窗中跳过了合并pages.json文件，重新导入插件即可。

如果存在uni-cms-article插件页面，说明导入正常。直接访问文章列表页面路径即可，文章列表页面路径是uni_modules/uni-cms-article/pages/list/list。

如果想要文章列表页作为应用的首页，需要在pages.json文件内，将文章列表页路径提升至pages数组的第一项，并且在tabBar.list数组的第一项也替换为文章列表页路径，具体pages.json文件配置项参考pages.json文档 。

检查uni-cms配置文件是否将客户端appId配置在clientAppIds数组内，如未添加客户端appId客户端不会正常解析文章正文内容，详细配置文件参考

这是因为开启了内容安全检测，但是没有正确配置微信小程序的appid和appsecret导致的，查看内容安全检测文档 关闭或配置内容安全检测

增加更多列表页模板，包括顶部分类、列表大图、小图、多图样式

**Examples:**

Example 1 (html):
```html
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 2 (html):
```html
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 3 (javascript):
```javascript
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

Example 4 (html):
```html
<script>
	//1. 导入统一身份信息管理模块
	import uniIdPagesInit from '@/uni_modules/uni-id-pages/init.js';
	//2. 导入uniIm的Utils工具类
	import uniImUtils from '@/uni_modules/uni-cms/components/ai/common/utils.js';
	export default {
		onLaunch: async function() {
			console.log('App Launch');
			//3. 初始化uni身份信息管理模块
			uniIdPagesInit();
			//4. 初始化uniIm
			uniImUtils.init();
		},
		onShow: function() {
			console.log('App Show');
		},
		onHide: function() {
			console.log('App Hide');
		}
	};
</script>
```

---

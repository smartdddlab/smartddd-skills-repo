# DCloud 插件市场完整插件清单

> 生成时间: 2026-03-21
> 数据来源: DCloud 插件市场 (https://ext.dcloud.net.cn/) + uni-id 官方文档

## 一、uniCloud 核心插件

### 1.1 uni-id 系列（身份认证）

| 插件 ID | 插件名称 | 分类 | 功能说明 | 文档链接 |
|---------|---------|------|---------|----------|
| uni-id-common | uni-id 公共模块 | uniCloud/云函数模板 | token 和权限管理核心模块，每个服务空间自动内置 | https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html |
| uni-id-co | uni-id 云对象 | uniCloud/云函数模板 | 与 uni-id-pages 搭配的云对象，处理登录注册等业务 | https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html |
| uni-id-pages | uni-id 页面模板 | uniCloud/云端一体页面模板 | 登录、注册、修改密码、个人中心等完整前端页面 | https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html |
| uni-config-center | 配置中心 | uniCloud/云函数模板 | 云端配置管理，uni-id 依赖此插件 | https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html |
| uni-captcha | 验证码模块 | uniCloud/云函数模板 | 图形验证码、短信验证码生成和校验 | https://doc.dcloud.net.cn/uniCloud/uni-id/summary.html |

### 1.2 uniCloud 数据库相关

| 插件 ID | 插件名称 | 分类 | 功能说明 |
|---------|---------|------|---------|
| clientDB | clientDB | uniCloud/云函数模板 | 前端直接操作数据库的 SDK |
| uni-clientDB-actions | clientDB action | uniCloud/云函数模板 | 数据库操作拦截器 |
| db-schema | DB Schema | uniCloud/DB Schema及验证函数 | 数据库表结构定义和验证 |

### 1.3 uniCloud Admin 相关

| 插件 ID | 插件名称 | 分类 | 功能说明 |
|---------|---------|------|---------|
| uni-admin | uni-admin | uniCloud/Admin插件 | 后台管理框架，基于 uni-id 的角色权限管理 |
| uni-admin-users | 用户管理 | uniCloud/Admin插件 | 用户增删改查、角色分配 |
| uni-admin-roles | 角色管理 | uniCloud/Admin插件 | 角色和权限管理 |
| uni-admin-permissions | 权限管理 | uniCloud/Admin插件 | 细粒度权限控制 |

### 1.4 uniCloud 其他核心插件

| 插件 ID | 插件名称 | 分类 | 功能说明 |
|---------|---------|------|---------|
| uni-cloud-router | 云函数路由 | uniCloud/云函数模板 | URL 化路由管理 |
| uni-open-bridge | 开放平台桥接 | uniCloud/云函数模板 | 微信、QQ 等开放平台集成 |
| uni-open-bridge-common | 开放平台公共模块 | uniCloud/云函数模板 | 开放平台通用功能 |
| uni-pay | 统一支付 | uniCloud/云函数模板 | 微信、支付宝、Apple Pay 等支付统一封装 |
| uni-sms | 短信服务 | uniCloud/云函数模板 | 短信发送和验证 |
| uni-email | 邮件服务 | uniCloud/云函数模板 | 邮件发送 |
| uni-push | 统一推送 | uniCloud/云函数模板 | 多平台消息推送 |

## 二、前端组件

### 2.1 UI 组件库

| 插件 ID | 插件名称 | 作者 | 下载量 | 功能说明 |
|---------|---------|------|--------|---------|
| uview-ui | uView UI | uViewUI | 1,375,751+ | 最流行的 uni-app UI 组件库 |
| uview-plus | uView Plus | uv_UI | 275,487+ | uView 2.0 版本，支持 Vue3 |
| thorui | ThorUI | ThorUI_echo | 113,981+ | 高质量 UI 组件库 |
| firstui | FirstUI | FirstUI | 576,562+ | 轻量级、高性能组件库 |
| tuniao-ui | 图鸟 UI | 图鸟科技 | 106,653+ | 丰富的组件和模板 |
| ultra-ui | ultraUI | ultraUI | 148,411+ | 现代化设计组件库 |

### 2.2 通用组件

| 插件 ID | 插件名称 | 功能说明 |
|---------|---------|---------|
| hjy-sign | 电子签名板 | 签字板、画板、写字板 |
| ziqirj-scroll-view | 自定义滚动视图 | 下拉刷新、滚动加载 |
| ziqirj-banner | 轮播图组件 | 自定义轮播图 |
| vz-water-mark | 水印相机 | 拍照时自动添加水印 |

### 2.3 数据可视化组件

| 插件 ID | 插件名称 | 功能说明 |
|---------|---------|---------|
| qiun-data-charts | 秋云图表 | 高性能图表组件 |
| lime-echart | echarts 图表 | ECharts 封装组件 |
| mp-html | 富文本渲染 | 支持丰富 HTML 标签 |

## 三、UTS 插件

### 3.1 API 插件

| 插件 ID | 插件名称 | 平台支持 | 功能说明 |
|---------|---------|---------|---------|
| Lux-Sqlite | SQLite 数据库 | Android, iOS, 鸿蒙 | 跨平台 SQLite 操作 |
| dh-choose-file | 文件选择器 | Android, iOS, 鸿蒙 | 按类型选择文件（音频/视频/图片/文档） |
| wly-android-auth | 安卓权限管理 | Android | 权限判断和申请 |
| harmony-gaode-baidu-map | 鸿蒙地图封装 | 鸿蒙 Next | 高德/百度地图原生封装 |

### 3.2 原生功能插件

| 插件 ID | 插件名称 | 平台支持 | 功能说明 |
|---------|---------|---------|---------|
| camera | 相机插件 | Android, iOS | 原生相机调用 |
| geolocation | 地理定位 | Android, iOS | 原生定位功能 |
| bluetooth | 蓝牙插件 | Android, iOS | 蓝牙设备连接 |
| nfc | NFC 插件 | Android | NFC 读写 |

## 四、uni-app 前端模板

### 4.1 完整项目模板

| 插件 ID | 插件名称 | 功能说明 |
|---------|---------|---------|
| uni-starter | uni-starter | 完整项目模板，集成 uni-id、uni-admin |
| uni-cms | 内容管理系统 | 文章、栏目管理 |
| uni-cms-article | CMS 用户端 | 文章展示、搜索、看广告解锁 |

### 4.2 页面模板

| 插件 ID | 插件名称 | 功能说明 |
|---------|---------|---------|
| login-template | 登录模板 | 多种登录方式页面 |
| chat-template | 聊天模板 | IM 聊天界面 |
| ecommerce-template | 电商模板 | 商品列表、详情、购物车 |

## 五、行业解决方案

### 5.1 AI 相关

| 插件 ID | 插件名称 | 功能说明 |
|---------|---------|---------|
| ant-treasure-box | 蚂蚁百宝箱 | 大模型聊天、语音交互、思维链展示 |
| dream-interpretation | 周公解梦 | AI 解梦，GPT 问答 |

### 5.2 其他行业插件

| 插件 ID | 插件名称 | 行业 | 功能说明 |
|---------|---------|------|---------|
| o2o-template | O2O 模板 | 本地生活 | 外卖、预约、配送 |
| social-template | 社交模板 | 社交 | 动态发布、评论、点赞 |
| education-template | 教育模板 | 教育 | 课程、直播、考试 |

## 六、插件分类统计

根据 DCloud 插件市场首页显示：

- **总插件数量**: 18,935+
- **主要分类**:
  - 前端组件: ~40%
  - uniCloud: ~20%
  - UTS 插件: ~15%
  - 前端模板: ~15%
  - App 原生插件: ~10%

## 七、优先抓取列表

基于使用频率和重要性，建议优先抓取以下插件：

### 7.1 第一批（核心必选）

1. **uni-id 系列**（5个）
   - uni-id-common
   - uni-id-co
   - uni-id-pages
   - uni-config-center
   - uni-captcha

2. **主流 UI 组件库**（6个）
   - uview-ui
   - uview-plus
   - thorui
   - firstui
   - tuniao-ui
   - ultra-ui

3. **uniCloud 核心插件**（7个）
   - uni-admin
   - clientDB
   - uni-pay
   - uni-sms
   - uni-email
   - uni-push
   - uni-open-bridge

### 7.2 第二批（常用功能）

1. **数据可视化**（3个）
   - qiun-data-charts
   - lime-echart
   - mp-html

2. **UTS 常用插件**（4个）
   - Lux-Sqlite
   - dh-choose-file
   - wly-android-auth
   - harmony-gaode-baidu-map

3. **通用组件**（4个）
   - hjy-sign
   - ziqirj-scroll-view
   - ziqirj-banner
   - vz-water-mark

### 7.3 第三批（扩展插件）

1. **完整项目模板**（3个）
   - uni-starter
   - uni-cms
   - uni-cms-article

2. **AI 相关插件**（2个）
   - ant-treasure-box
   - dream-interpretation

**总计第一批+第二批+第三批**: 约 34 个核心插件

## 八、抓取策略

### 8.1 数据字段

每个插件需要抓取以下信息：

```json
{
  "id": "插件 ID",
  "name": "插件名称",
  "displayName": "显示名称",
  "category": "分类",
  "subCategory": "子分类",
  "author": "作者",
  "version": "最新版本",
  "description": "简短描述",
  "features": ["功能列表"],
  "platforms": ["支持平台"],
  "downloads": 下载量,
  "stars": 评分,
  "tags": ["标签"],
  "documentation": "文档链接",
  "marketplace": "插件市场链接",
  "installCommand": "安装命令",
  "quickStart": "快速开始代码",
  "dependencies": ["依赖插件"],
  "compatibility": {
    "hbuilderx": "HBuilderX 版本要求",
    "vue": "Vue 版本",
    "uniCloud": "uniCloud 版本"
  },
  "lastUpdated": "最后更新时间"
}
```

### 8.2 抓取优先级

1. **P0（最高优先级）**: uni-id 系列 + 主流 UI 组件库（11个）
2. **P1（高优先级）**: uniCloud 核心插件 + 数据可视化（10个）
3. **P2（中优先级）**: UTS 插件 + 通用组件（8个）
4. **P3（低优先级）**: 项目模板 + AI 插件（5个）

### 8.3 抓取来源

- **插件市场**: https://ext.dcloud.net.cn/plugin?id={pluginId}
- **官方文档**: https://doc.dcloud.net.cn/
- **GitHub 仓库**: 部分开源插件的源码

## 九、下一步行动

1. ✅ 创建插件清单列表（当前文档）
2. ⏭️ 使用 agent-browser 抓取第一批插件详细信息
3. ⏭️ 将抓取的数据保存为 JSON 格式
4. ⏭️ 创建 SKILL.md 和相关文档

---

**备注**:
- 由于 agent-browser 当前无法使用（Chrome 未安装），后续可使用 webReader 工具替代
- 插件市场共有 18,935+ 插件，本清单聚焦于最核心和常用的 ~50 个插件
- 后续可根据实际需求扩展插件范围

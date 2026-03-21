# 安装插件示例

本示例展示如何安装和配置不同类型的插件。

## 示例 1: 安装 uni-id 系列插件

### 1.1 安装 uni-id-common

**说明:** uni-id-common 自动内置在每个 uniCloud 服务空间中,无需手动安装。

### 1.2 安装 uni-id-co

**步骤 1: 从插件市场导入**

1. 打开 HBuilderX
2. 访问 https://ext.dcloud.net.cn/plugin?id=uni-id-co
3. 点击"使用 HBuilderX 导入插件"
4. 选择目标项目
5. 等待导入完成

**步骤 2: 配置 uni-config-center**

创建配置文件 `uniCloud/cloudfunctions/common/uni-config-center/uni-id/config.json`:

```json
{
  "passwordSecret": "your-password-secret-key-here",
  "tokenSecret": "your-token-secret-key-here",
  "tokenExpiresIn": 7200000,
  "passwordErrorLimit": 6,
  "passwordErrorRetryTime": 3600000,
  "service": {
    "sms": {
      "name": "your-app-name",
      "codeExpiresIn": 300,
      "smsKey": "your-sms-key",
      "smsSecret": "your-sms-secret"
    }
  }
}
```

**步骤 3: 初始化数据库**

在 uniCloud 控制台创建以下数据表:
- uni-id-users
- uni-id-roles
- uni-id-permissions
- uni-id-log
- opendb-verify-codes

**步骤 4: 上传云函数**

1. 在 HBuilderX 中右键点击 `uniCloud/cloudfunctions/uni-id-co`
2. 选择"上传并部署:云端安装依赖"
3. 等待部署完成

### 1.3 安装 uni-id-pages

**步骤 1: 从插件市场导入**

1. 访问 https://ext.dcloud.net.cn/plugin?id=uni-id-pages
2. 使用 HBuilderX 导入到项目

**步骤 2: 配置 pages.json**

在 `pages.json` 中添加页面配置:

```json
{
  "pages": [
    {
      "path": "uni-id-pages/pages/login/login",
      "style": {
        "navigationBarTitleText": "登录"
      }
    },
    {
      "path": "uni-id-pages/pages/register/register",
      "style": {
        "navigationBarTitleText": "注册"
      }
    },
    {
      "path": "uni-id-pages/pages/userinfo/userinfo",
      "style": {
        "navigationBarTitleText": "个人中心"
      }
    }
  ]
}
```

**步骤 3: 使用页面**

```js
// 跳转到登录页
uni.navigateTo({
  url: '/uni-id-pages/pages/login/login'
})

// 跳转到个人中心
uni.navigateTo({
  url: '/uni-id-pages/pages/userinfo/userinfo'
})
```

## 示例 2: 安装 uView UI 组件库

### 2.1 方法一: npm 安装(推荐)

**步骤 1: 安装依赖**

```bash
# 在项目根目录执行
npm install uview-ui@2.0.36
```

**步骤 2: 配置 main.js**

```js
// main.js
import Vue from 'vue'
import App from './App'

// 引入 uView UI
import uView from 'uview-ui'
Vue.use(uView)

const app = new Vue({
  ...App
})
app.$mount()
```

**步骤 3: 配置 easycom(可选)**

在 `pages.json` 中配置:

```json
{
  "easycom": {
    "autoscan": true,
    "custom": {
      "^u-(.*)": "uview-ui/components/u-$1/u-$1.vue"
    }
  }
}
```

**步骤 4: 引入样式**

在 `App.vue` 中引入:

```vue
<style lang="scss">
/* 引入 uView UI 样式 */
@import "uview-ui/index.scss";
</style>
```

### 2.2 方法二: 从插件市场导入

**步骤 1: 导入插件**

1. 访问 https://ext.dcloud.net.cn/plugin?id=1593
2. 使用 HBuilderX 导入

**步骤 2: 配置 main.js**

```js
// main.js
import Vue from 'vue'
import App from './App'

// 引入 uView UI(插件市场导入的路径可能不同)
import uView from '@/uni_modules/uview-ui'
Vue.use(uView)

const app = new Vue({
  ...App
})
app.$mount()
```

### 2.3 使用组件

```vue
<template>
  <view class="container">
    <!-- 使用 uView 组件 -->
    <u-button type="primary" @click="handleClick">主要按钮</u-button>

    <u-input v-model="value" placeholder="请输入内容" />

    <u-card title="卡片标题" :foot-border-top="false">
      <view>卡片内容</view>
    </u-card>
  </view>
</template>

<script>
export default {
  data() {
    return {
      value: ''
    }
  },
  methods: {
    handleClick() {
      uni.showToast({
        title: '点击了按钮',
        icon: 'success'
      })
    }
  }
}
</script>
```

## 示例 3: 安装 uni-admin

### 3.1 安装步骤

**步骤 1: 从插件市场导入**

1. 访问 https://ext.dcloud.net.cn/plugin?id=3268
2. 使用 HBuilderX 导入

**步骤 2: 配置 uniCloud**

确保项目已关联 uniCloud 服务空间:
1. 在 HBuilderX 中右键点击项目
2. 选择"关联云服务空间"
3. 选择或创建服务空间

**步骤 3: 初始化数据库**

在 uniCloud 控制台创建以下数据表:
- uni-id-users
- uni-id-roles
- uni-id-permissions
- opendb-admin-menus
- opendb-admin-users

**步骤 4: 创建管理员账号**

在云函数中创建第一个管理员:

```js
// 在云函数中执行
const db = uniCloud.database()
const dbCmd = db.command

await db.collection('uni-id-users').add({
  username: 'admin',
  password: 'your-encrypted-password',
  role: ['admin'],
  status: 1,
  created_at: Date.now()
})
```

**步骤 5: 访问后台**

1. 运行项目到浏览器
2. 访问 `/pages/admin/login/login`
3. 使用管理员账号登录

## 示例 4: 安装 uni-pay

### 4.1 安装步骤

**步骤 1: 从插件市场导入**

1. 访问 https://ext.dcloud.net.cn/plugin?id=1835
2. 使用 HBuilderX 导入

**步骤 2: 配置支付参数**

创建配置文件 `uniCloud/cloudfunctions/common/uni-config-center/uni-pay/config.json`:

```json
{
  "appPlus": {
    "weixin": {
      "appid": "wx1234567890abcdef",
      "appsecret": "your-weixin-appsecret",
      "mchid": "1234567890",
      "apikey": "your-weixin-apikey"
    },
    "alipay": {
      "appid": "2021001234567890",
      "privateKey": "your-alipay-private-key"
    }
  },
  "mp-weixin": {
    "appid": "wx1234567890abcdef",
    "appsecret": "your-weixin-appsecret",
    "mchid": "1234567890",
    "apikey": "your-weixin-apikey"
  }
}
```

**步骤 3: 使用支付功能**

```js
// 在前端调用
const uniPay = uniCloud.importObject('uni-pay')

// 发起支付
const result = await uniPay.pay({
  provider: 'wxpay',
  outTradeNo: 'ORDER_' + Date.now(),
  totalFee: 100, // 单位:分
  body: '商品描述',
  attach: '附加数据'
})

console.log('支付结果:', result)
```

## 示例 5: 安装 uni-sms

### 5.1 开通服务

**步骤 1: 在控制台开通**

1. 登录 [uniCloud 控制台](https://unicloud.dcloud.net.cn/)
2. 选择服务空间
3. 进入"短信服务"
4. 完成实名认证
5. 配置短信签名和模板

**步骤 2: 配置签名**

签名要求:
- 只能包含中文、英文、数字
- 长度限制 2-8 位
- 示例:【DCloud】【你的公司名】

**步骤 3: 创建模板**

示例模板:
```
您的验证码是: ${code},5分钟内有效。
```

### 5.2 使用短信服务

```js
// 在云函数中发送短信
const res = await uniCloud.sendSms({
  phone: '13800138000',
  templateId: 'SMS_12345678',
  data: {
    code: '123456',
    product: '你的应用'
  }
})

console.log('发送结果:', res)
```

## 示例 6: 安装 uni-push

### 6.1 开通服务

**步骤 1: 申请开通**

1. 访问 [DCloud 开发者中心](https://dev.dcloud.net.cn/)
2. 进入"uni-push"配置
3. 填写应用信息
4. 获取 AppID、AppKey、AppSecret、MasterSecret

**步骤 2: 配置 manifest.json**

在 `manifest.json` 中添加:

```json
{
  "app-plus": {
    "distribute": {
      "sdkConfigs": {
        "push": {
          "unipush": {
            "appid": "your-appid",
            "appkey": "your-appkey",
            "appsecret": "your-appsecret"
          }
        }
      }
    }
  }
}
```

### 6.2 使用推送功能

**客户端注册:**

```js
// 在 App.vue 的 onLaunch 中
onLaunch() {
  // 获取推送 clientId
  uni.getPushClientId({
    success: (res) => {
      console.log('clientId:', res.cid)
      // 将 cid 上传到服务器
      this.uploadPushClientId(res.cid)
    },
    fail: (err) => {
      console.error('获取 clientId 失败:', err)
    }
  })

  // 监听推送消息
  uni.onPushMessage((res) => {
    console.log('收到推送消息:', res)
    // 处理推送消息
  })
}
```

**服务端推送:**

```js
// 在云函数中推送消息
await uniCloud.sendPushMessage({
  push_clientid: 'client_id_from_client',
  title: '推送标题',
  content: '推送内容',
  payload: {
    type: 'notification',
    data: { key: 'value' }
  }
})
```

## 常见问题

### 1. 插件导入后找不到

**原因:**
- 插件导入路径不正确
- easycom 配置有误

**解决方案:**
- 检查 `uni_modules` 目录
- 检查 `pages.json` 中的 easycom 配置
- 重新导入插件

### 2. 云函数调用失败

**原因:**
- 云函数未上传
- uni-config-center 配置错误
- 数据库表未创建

**解决方案:**
- 上传并部署云函数
- 检查配置文件格式
- 在控制台创建数据库表

### 3. UI 组件样式异常

**原因:**
- 样式文件未引入
- easycom 配置错误
- nvue 兼容性问题

**解决方案:**
- 在 App.vue 中引入样式文件
- 检查 easycom 配置
- 查看组件的 nvue 支持说明

### 4. 支付功能无法使用

**原因:**
- 支付配置错误
- 未开通支付服务
- 证书配置错误

**解决方案:**
- 检查 uni-pay 配置文件
- 在各平台开通支付功能
- 配置正确的证书和密钥

---

**相关文档:**
- [使用指南](../references/usage-guide.md)
- [插件分类说明](../references/plugin-categories.md)

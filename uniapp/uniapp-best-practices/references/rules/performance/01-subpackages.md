# 分包加载规范

## 规则 ID

`performance-01-subpackages`

## 规则说明

小程序有包体积限制，使用分包加载可以优化首屏加载速度和突破主包大小限制。

## 包大小限制

| 平台 | 主包限制 | 单个分包限制 | 总包限制 |
|------|----------|--------------|----------|
| 微信小程序 | 2MB | 2MB | 20MB |
| 支付宝小程序 | 2MB | 2MB | 20MB |
| 抖音小程序 | 2MB | 2MB | 16MB |
| App | 无限制 | 无限制 | 无限制 |

## 分包配置

### pages.json 配置

```json
{
  "pages": [
    {
      "path": "pages/index/index",
      "style": {
        "navigationBarTitleText": "首页"
      }
    },
    {
      "path": "pages/login/login",
      "style": {
        "navigationBarTitleText": "登录"
      }
    }
  ],
  "subPackages": [
    {
      "root": "pages-user",
      "pages": [
        {
          "path": "profile/profile",
          "style": { "navigationBarTitleText": "个人中心" }
        },
        {
          "path": "settings/settings",
          "style": { "navigationBarTitleText": "设置" }
        }
      ]
    },
    {
      "root": "pages-order",
      "pages": [
        {
          "path": "list/list",
          "style": { "navigationBarTitleText": "订单列表" }
        },
        {
          "path": "detail/detail",
          "style": { "navigationBarTitleText": "订单详情" }
        }
      ]
    }
  ],
  "preloadRule": {
    "pages/index/index": {
      "network": "all",
      "packages": ["pages-user"]
    }
  }
}
```

### 目录结构

```
├── pages/                    # 主包页面
│   ├── index/
│   └── login/
├── pages-user/               # 用户模块分包
│   ├── profile/
│   └── settings/
├── pages-order/              # 订单模块分包
│   ├── list/
│   └── detail/
├── static/                   # 主包静态资源
├── App.vue
├── main.js
└── pages.json
```

## 分包跳转

```typescript
// 主包跳转到分包
uni.navigateTo({
  url: '/pages-user/profile/profile'
})

// 分包内跳转
uni.navigateTo({
  url: '/pages-order/detail/detail?id=123'
})
```

## 分包预下载

```json
{
  "preloadRule": {
    "pages/index/index": {
      "network": "all",
      "packages": ["pages-user"]
    },
    "pages-user/profile/profile": {
      "network": "wifi",
      "packages": ["pages-order"]
    }
  }
}
```

### 预下载配置说明

| 字段 | 说明 |
|------|------|
| network | 网络条件：all / wifi |
| packages | 要预下载的分包名数组 |

## 分包异步化

### 异步组件

```typescript
// pages.json
{
  "subPackages": [
    {
      "root": "pages-sub",
      "pages": [
        {
          "path": "async-page/async-page"
        }
      ]
    }
  ]
}

// 主包页面使用分包组件
<template>
  <AsyncComponent v-if="showAsync" />
</template>

<script setup>
import { ref, defineAsyncComponent } from 'vue'

const showAsync = ref(false)

const AsyncComponent = defineAsyncComponent(() => {
  return import('@/pages-sub/components/AsyncComponent.vue')
})
</script>
```

## 分包优化策略

### 1. 合理划分模块

```json
{
  "subPackages": [
    // ✅ 按业务模块划分
    { "root": "pages-user", "pages": [...] },
    { "root": "pages-order", "pages": [...] },
    { "root": "pages-product", "pages": [...] }
  ]
}

// ❌ 避免过细划分
{ "root": "pages-a", "pages": [{ "path": "page1" }] },
{ "root": "pages-b", "pages": [{ "path": "page2" }] }
```

### 2. 公共资源提取

```
├── static/                   # 主包静态资源
│   └── common/              # 公共资源
│       ├── icons/
│       └── images/
├── components/              # 公共组件（主包）
│   ├── Button/
│   └── Input/
└── pages-sub/
    └── components/          # 分包独有组件
        └── SubButton/
```

### 3. 分包静态资源

```
pages-order/
├── list/
├── detail/
└── static/                  # 分包静态资源
    └── images/
        └── order-bg.png
```

### 4. 分包独立组件

```vue
<!-- 分包内组件直接引用分包内资源 -->
<template>
  <image src="../static/images/order-bg.png" />
</template>
```

## 分包统计

```typescript
// 获取分包信息
function getSubpackageInfo() {
  const info = uni.getSystemInfoSync()
  console.log('App 版本', info.appVersion)

  // 查看分包加载情况
  uni.report({
    eventName: 'subpackage_loaded',
    data: {
      packageName: 'pages-user'
    }
  })
}
```

## 注意事项

1. **tabBar 页面必须在主包**
2. **主包引用的资源会被打包到主包**
3. **分包之间不能相互引用**
4. **预下载数量限制为 3 个**

```json
// ❌ tabBar 在分包中（错误）
{
  "tabBar": {
    "list": [
      { "pagePath": "pages-user/profile/profile" }  // 不允许
    ]
  }
}

// ✅ tabBar 在主包（正确）
{
  "tabBar": {
    "list": [
      { "pagePath": "pages/index/index" },
      { "pagePath": "pages/user/user" }
    ]
  }
}
```

## 相关规则

- [performance-02-long-list](./02-long-list.md)
- [performance-03-image-optimization](./03-image-optimization.md)

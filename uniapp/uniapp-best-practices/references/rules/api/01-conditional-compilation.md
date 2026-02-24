# 条件编译规范

## 规则 ID

`api-01-conditional-compilation`

## 适用平台

- 全平台
- H5 (H5)
- 微信小程序 (MP-WEIXIN)
- 支付宝小程序 (MP-ALIPAY)
- 抖音小程序 (MP-TOUTIAO)
- App (APP-PLUS)
- App nvue (APP-NVUE)

## 规则说明

条件编译是 UniApp 跨平台开发的核心特性，允许在编译时根据平台选择性地包含代码。

### 语法格式

```
#ifdef 平台名称
  // 平台特定代码
#endif

#ifndef 平台名称
  // 非该平台的代码
#endif
```

### 平台标识

| 标识 | 说明 |
|------|------|
| H5 | H5 网页 |
| MP-WEIXIN | 微信小程序 |
| MP-ALIPAY | 支付宝小程序 |
| MP-BAIDU | 百度小程序 |
| MP-TOUTIAO | 抖音小程序 |
| MP-QQ | QQ 小程序 |
| MP | 所有小程序 |
| APP-PLUS | App（含 nvue） |
| APP-NVUE | App nvue 页面 |
| APP-ANDROID | Android 平台 |
| APP-IOS | iOS 平台 |

## 正确示例

### JavaScript 条件编译

```javascript
// 单平台判断
// #ifdef MP-WEIXIN
wx.login({
  success: (res) => {
    console.log('微信登录成功', res.code)
  }
})
// #endif

// 多平台判断
// #ifdef MP-WEIXIN || MP-ALIPAY
console.log('小程序环境')
// #endif

// 非某平台
// #ifndef H5
console.log('非 H5 环境')
// #endif
```

### 模板条件编译

```vue
<template>
  <view>
    <!-- #ifdef H5 -->
    <div class="h5-banner">H5 专属 Banner</div>
    <!-- #endif -->

    <!-- #ifdef MP-WEIXIN -->
    <view class="mp-banner">小程序 Banner</view>
    <!-- #endif -->

    <!-- #ifdef APP-PLUS -->
    <view class="app-banner">App 专属 Banner</view>
    <!-- #endif -->
  </view>
</template>
```

### 样式条件编译

```css
.header {
  height: 88rpx;
}

/* #ifdef MP-WEIXIN */
.header {
  padding-top: env(safe-area-inset-top);
}
/* #endif */

/* #ifdef H5 */
.header {
  position: fixed;
  top: 0;
}
/* #endif */
```

### pages.json 条件编译

```json
{
  "pages": [
    {
      "path": "pages/index/index"
    }
  ],
  // #ifdef MP-WEIXIN
  "enablePullDownRefresh": true
  // #endif
}
```

## 错误示例

```javascript
// ❌ 错误：运行时判断平台（无法编译时优化）
if (process.env.UNI_PLATFORM === 'mp-weixin') {
  wx.login()
}

// ❌ 错误：条件编译嵌套不正确
// #ifdef MP-WEIXIN
// #ifdef H5
console.log('永远不会执行')
// #endif
// #endif

// ❌ 错误：忘记闭合条件编译
// #ifdef MP-WEIXIN
console.log('缺少 #endif')
```

## 最佳实践

1. **优先使用条件编译**：相比运行时判断，条件编译能减少最终包体积
2. **集中管理平台差异**：将平台特定代码集中在单独文件或函数中
3. **添加注释**：说明为何需要条件编译
4. **测试所有平台**：确保每个平台的条件分支都经过测试
5. **使用 MP 标识**：当所有小程序逻辑相同时，使用 `MP` 而非逐个平台

## 相关规则

- [api-02-platform-api](./02-platform-api.md)
- [api-03-async-handling](./03-async-handling.md)

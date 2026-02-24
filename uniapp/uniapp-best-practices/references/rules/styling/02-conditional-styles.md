# 条件样式规范

## 规则 ID

`styling-02-conditional-styles`

## 规则说明

使用条件编译处理不同平台的样式差异，确保应用在各平台都有良好的视觉表现。

## 条件编译语法

```css
/* #ifdef 平台名称 */
/* 平台特定样式 */
/* #endif */

/* #ifndef 平台名称 */
/* 非该平台样式 */
/* #endif */
```

## 平台标识

| 标识 | 说明 |
|------|------|
| H5 | H5 网页 |
| MP-WEIXIN | 微信小程序 |
| MP-ALIPAY | 支付宝小程序 |
| MP-BAIDU | 百度小程序 |
| MP-TOUTIAO | 抖音小程序 |
| MP | 所有小程序 |
| APP-PLUS | App |
| APP-NVUE | App nvue |

## 导航栏样式

```css
/* 顶部导航栏适配 */
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 88rpx;
  background: #fff;
}

/* #ifdef MP-WEIXIN */
.header {
  /* 小程序导航栏高度 + 状态栏 */
  padding-top: calc(44rpx + env(safe-area-inset-top));
}
/* #endif */

/* #ifdef H5 */
.header {
  /* H5 无需额外适配 */
  padding-top: 0;
}
/* #endif */

/* #ifdef APP-PLUS */
.header {
  /* App 状态栏高度 */
  padding-top: var(--status-bar-height);
}
/* #endif */
```

## 底部安全区

```css
/* 底部按钮适配 */
.footer {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 20rpx 30rpx;
  background: #fff;
}

/* #ifdef MP-WEIXIN || MP-ALIPAY */
.footer {
  padding-bottom: calc(20rpx + env(safe-area-inset-bottom));
}
/* #endif */

/* #ifdef APP-PLUS */
.footer {
  padding-bottom: calc(20rpx + constant(safe-area-inset-bottom));
  padding-bottom: calc(20rpx + env(safe-area-inset-bottom));
}
/* #endif */
```

## 组件样式差异

```css
/* 按钮样式 */
.btn {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 88rpx;
  border-radius: 44rpx;
}

/* #ifdef MP-WEIXIN */
/* 微信小程序 button 默认样式重置 */
.btn {
  padding: 0;
  margin: 0;
  background: transparent;
  border: none;
}

.btn::after {
  border: none;
}
/* #endif */

/* #ifdef MP-ALIPAY */
/* 支付宝小程序适配 */
.btn {
  border: none;
}
/* #endif */
```

## 滚动容器

```css
/* 滚动容器 */
.scroll-container {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}

/* #ifdef H5 */
.scroll-container {
  overflow-y: auto;
  -webkit-overflow-scrolling: touch;
}
/* #endif */

/* #ifndef H5 */
.scroll-container {
  /* 小程序和 App 使用 scroll-view 组件 */
}
/* #endif */
```

## 全局样式

### App.vue

```vue
<style>
/* 全局样式 */
page {
  background-color: #f5f5f5;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

/* #ifdef H5 */
/* H5 特定全局样式 */
page {
  min-height: 100vh;
}
/* #endif */

/* #ifdef MP */
/* 小程序全局样式 */
page {
  height: 100%;
}
/* #endif */
</style>
```

## 字体图标

```css
/* 字体图标 */
.iconfont {
  font-family: 'iconfont';
  font-style: normal;
}

/* #ifdef MP */
/* 小程序字体需要转 base64 */
.iconfont {
  src: url('data:font/woff2;base64,...');
}
/* #endif */

/* #ifdef H5 */
@font-face {
  font-family: 'iconfont';
  src: url('/static/fonts/iconfont.woff2') format('woff2');
}
/* #endif */
```

## 动画差异

```css
/* 动画 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}

/* #ifdef H5 */
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
/* #endif */

/* #ifdef MP */
/* 小程序动画限制，使用 uni.createAnimation */
/* #endif */
```

## 样式隔离

```vue
<script>
export default {
  options: {
    // 样式隔离选项
    styleIsolation: 'isolated' // apply-shared / shared
  }
}
</script>
```

### 隔离选项

| 选项 | 说明 |
|------|------|
| isolated | 完全隔离（默认） |
| apply-shared | 接受外部样式 |
| shared | 双向共享样式 |

## 暗黑模式

```css
/* 暗黑模式适配 */
/* #ifdef H5 */
@media (prefers-color-scheme: dark) {
  page {
    background-color: #1a1a1a;
    color: #ffffff;
  }
}
/* #endif */

/* App 暗黑模式 */
/* #ifdef APP-PLUS */
@media (prefers-color-scheme: dark) {
  page {
    --bg-color: #1a1a1a;
    --text-color: #ffffff;
  }
}
/* #endif */
```

## 最佳实践

1. **集中管理平台差异**：将平台特定样式放在一起
2. **添加注释**：说明为何需要条件编译
3. **测试所有平台**：确保每个平台样式正确
4. **使用 CSS 变量**：便于统一管理

```css
/* 推荐：集中管理 */
.header {
  height: 88rpx;
  /* 平台差异 */
  /* #ifdef MP-WEIXIN */
  padding-top: env(safe-area-inset-top);
  /* #endif */
  /* #ifdef APP-PLUS */
  padding-top: var(--status-bar-height);
  /* #endif */
}
```

## 相关规则

- [styling-01-rpx-units](./01-rpx-units.md)

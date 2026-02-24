# rpx 单位规范

## 规则 ID

`styling-01-rpx-units`

## 规则说明

rpx（responsive pixel）是 UniApp 的响应式长度单位，根据屏幕宽度自适应。

## rpx 原理

- 规定屏幕宽度为 750rpx
- 在不同设备上自动换算
- iPhone 6 屏幕宽度 375px = 750rpx
- 即 1px = 2rpx

## 单位换算

| 设备 | 屏幕宽度 | 1rpx 换算 |
|------|----------|-----------|
| iPhone 6 | 375px | 0.5px |
| iPhone 6 Plus | 414px | 0.552px |
| Android 360 | 360px | 0.48px |
| iPad | 768px | 1.024px |

## 使用规范

### 1. 设计稿适配

```css
/* 设计稿 750px 宽度 */
/* 设计稿标注 100px -> 100rpx */

.container {
  width: 750rpx;     /* 全屏宽度 */
  padding: 30rpx;    /* 30px 设计稿 */
  margin: 20rpx;     /* 20px 设计稿 */
}

.title {
  font-size: 32rpx;  /* 32px 设计稿 */
  line-height: 48rpx;
}
```

### 2. 常用尺寸

```css
/* 间距 */
.gap-xs { padding: 10rpx; }
.gap-sm { padding: 20rpx; }
.gap-md { padding: 30rpx; }
.gap-lg { padding: 40rpx; }
.gap-xl { padding: 50rpx; }

/* 字体 */
.font-xs { font-size: 20rpx; }
.font-sm { font-size: 24rpx; }
.font-md { font-size: 28rpx; }
.font-lg { font-size: 32rpx; }
.font-xl { font-size: 36rpx; }

/* 圆角 */
.radius-sm { border-radius: 8rpx; }
.radius-md { border-radius: 16rpx; }
.radius-lg { border-radius: 24rpx; }
.radius-round { border-radius: 999rpx; }
```

### 3. 混合使用

```css
/* ✅ 正确：rpx 用于自适应尺寸 */
.box {
  width: 300rpx;
  height: 200rpx;
  padding: 20rpx;
  /* px 用于固定值（如边框） */
  border: 1px solid #ddd;
}

/* ❌ 错误：边框使用 rpx 可能过粗 */
.box {
  border: 2rpx solid #ddd;  /* 在高清屏上会变粗 */
}
```

### 4. 百分比与 rpx

```css
/* 百分比：相对父元素 */
.half {
  width: 50%;
}

/* rpx：相对屏幕宽度 */
.fixed-width {
  width: 375rpx;  /* 半屏宽度 */
}

/* 组合使用 */
.responsive {
  width: calc(100% - 40rpx);
  margin: 0 20rpx;
}
```

## 全局样式变量

### uni.scss

```scss
// uni.scss - UniApp 全局样式变量

// 主题色
$uni-color-primary: #007AFF;
$uni-color-success: #4CD964;
$uni-color-warning: #F0AD4E;
$uni-color-error: #DD524D;

// 文字色
$uni-text-color: #333333;
$uni-text-color-secondary: #666666;
$uni-text-color-placeholder: #808080;

// 背景色
$uni-bg-color: #FFFFFF;
$uni-bg-color-grey: #F8F8F8;

// 边框色
$uni-border-color: #E5E5E5;

// 间距
$uni-spacing-sm: 20rpx;
$uni-spacing-md: 30rpx;
$uni-spacing-lg: 40rpx;

// 字体大小
$uni-font-size-sm: 24rpx;
$uni-font-size-base: 28rpx;
$uni-font-size-lg: 32rpx;

// 圆角
$uni-border-radius-sm: 8rpx;
$uni-border-radius-base: 16rpx;
$uni-border-radius-lg: 24rpx;
```

### 使用全局变量

```vue
<style lang="scss">
// 自动导入 uni.scss
.button {
  background-color: $uni-color-primary;
  padding: $uni-spacing-md;
  font-size: $uni-font-size-base;
  border-radius: $uni-border-radius-base;
}
</style>
```

## 条件编译样式

```css
/* 平台特定样式 */
.header {
  height: 88rpx;
}

/* #ifdef MP-WEIXIN */
.header {
  /* 小程序胶囊按钮适配 */
  padding-top: calc(env(safe-area-inset-top) + 44rpx);
}
/* #endif */

/* #ifdef H5 */
.header {
  position: fixed;
  top: 0;
  z-index: 100;
}
/* #endif */

/* #ifdef APP-PLUS */
.header {
  padding-top: var(--status-bar-height);
}
/* #endif */
```

## 安全区域适配

```css
/* 底部安全区域 */
.footer {
  padding-bottom: constant(safe-area-inset-bottom); /* iOS 11.0-11.2 */
  padding-bottom: env(safe-area-inset-bottom);      /* iOS 11.2+ */
}

/* 顶部安全区域 */
.header {
  padding-top: constant(safe-area-inset-top);
  padding-top: env(safe-area-inset-top);
}
```

## nvue 样式注意事项

```vue
<style>
/* nvue 样式限制 */

/* ✅ 支持：类选择器 */
.box { }

/* ❌ 不支持：后代选择器 */
.container .box { }

/* ❌ 不支持：伪类 */
.box:first-child { }
.box:hover { }

/* ❌ 不支持：CSS 变量 */
.box {
  color: var(--primary-color); /* 不支持 */
}

/* ❌ 不支持：简写属性（部分） */
.box {
  border: 1px solid #ddd; /* 可能不生效 */
}

/* ✅ 正确：分开写 */
.box {
  border-width: 1px;
  border-style: solid;
  border-color: #ddd;
}
</style>
```

## 相关规则

- [styling-02-conditional-styles](./02-conditional-styles.md)

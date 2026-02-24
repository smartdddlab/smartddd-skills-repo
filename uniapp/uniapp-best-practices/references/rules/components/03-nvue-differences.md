# nvue 平台差异规范

## 规则 ID

`component-03-nvue-differences`

## 规则说明

nvue 是 UniApp 的原生渲染模式，基于 Weex，与 vue 页面有显著差异。了解这些差异对于编写跨平台代码至关重要。

## nvue 与 vue 对比

| 特性 | vue 页面 | nvue 页面 |
|------|----------|-----------|
| 渲染方式 | WebView | 原生渲染 |
| 布局 | 多种布局 | 仅 flex |
| v-show | 支持 | 不支持 |
| 文本渲染 | 任意位置 | 必须用 text |
| CSS 选择器 | 全支持 | 有限支持 |
| 性能 | 较好 | 更好 |
| 兼容性 | 高 | 有差异 |

## 布局规范

### flex 布局

nvue 只支持 flex 布局，默认 `flex-direction: column`。

```vue
<template>
  <view class="container">
    <view class="header">
      <text>标题</text>
    </view>
    <view class="content">
      <text>内容</text>
    </view>
    <view class="footer">
      <text>底部</text>
    </view>
  </view>
</template>

<style>
.container {
  /* 默认 column，可省略 */
  flex-direction: column;
  flex: 1;
}

.header {
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100rpx;
}

.content {
  flex: 1;
  /* 注意：nvue 不支持 margin: auto */
}

.footer {
  height: 100rpx;
}
</style>
```

### 水平布局

```vue
<style>
/* 水平排列 */
.row {
  flex-direction: row;
}

/* 水平居中 */
.center-row {
  flex-direction: row;
  justify-content: center;
}

/* 两端对齐 */
.space-between {
  flex-direction: row;
  justify-content: space-between;
}

/* 垂直居中 */
.center-col {
  align-items: center;
}
</style>
```

## 文本处理

### 文本必须用 text 组件

```vue
<template>
  <!-- ✅ 正确 -->
  <view>
    <text>这是文本</text>
  </view>

  <!-- ❌ 错误：nvue 不支持 -->
  <view>直接写文本</view>

  <!-- ✅ 正确：多行文本 -->
  <view>
    <text>第一行</text>
    <text>第二行</text>
  </view>

  <!-- ✅ 正确：富文本 -->
  <rich-text :nodes="htmlContent"></rich-text>
</template>
```

### 文本样式

```vue
<style>
/* text 样式必须在 text 上设置 */
.title {
  font-size: 32rpx;
  font-weight: bold;
  color: #333;
}

/* ❌ 错误：父元素样式不会继承到 text */
.container {
  font-size: 32rpx; /* text 不会继承 */
}
</style>
```

## 显示隐藏

### 使用 v-if 替代 v-show

```vue
<template>
  <!-- ✅ 正确 -->
  <view v-if="isVisible">
    <text>条件显示</text>
  </view>

  <!-- ❌ 错误：nvue 不支持 v-show -->
  <view v-show="isVisible">
    <text>不会生效</text>
  </view>
</template>
```

## CSS 限制

### 支持的选择器

```css
/* ✅ 支持：类选择器 */
.class-name { }

/* ✅ 支持：ID 选择器（不推荐） */
#id-name { }

/* ✅ 支持：类型选择器 */
view { }
text { }

/* ❌ 不支持：后代选择器 */
.parent .child { }

/* ❌ 不支持：伪类 */
.item:first-child { }
.item:hover { }

/* ❌ 不支持：伪元素 */
.item::before { }
```

### 样式写法

```vue
<style>
/* ✅ 正确：简写属性 */
.box {
  margin: 20rpx;
  padding: 20rpx;
  border-width: 1px;
  border-color: #ddd;
  border-style: solid;
}

/* ❌ 错误：部分简写不支持 */
.box {
  border: 1px solid #ddd; /* 可能不生效 */
}

/* ✅ 正确：分别设置 */
.box {
  border-top-width: 1px;
  border-top-color: #ddd;
  border-top-style: solid;
}
</style>
```

## 列表渲染

### list 组件

nvue 推荐使用 `<list>` 和 `<cell>` 组件：

```vue
<template>
  <list class="list" @loadmore="loadMore">
    <cell v-for="item in items" :key="item.id">
      <view class="item">
        <text>{{ item.name }}</text>
      </view>
    </cell>

    <!-- 加载更多 -->
    <cell>
      <view class="loading">
        <text>加载中...</text>
      </view>
    </cell>
  </list>
</template>

<script setup>
import { ref } from 'vue'

const items = ref([])

function loadMore() {
  // 加载更多数据
}
</script>
```

### 复用 cell

```vue
<template>
  <!-- recycle-list 支持单元格复用 -->
  <recycle-list :data="items">
    <template v-slot:default="{ item }">
      <text>{{ item.name }}</text>
    </template>
  </recycle-list>
</template>
```

## 条件编译

```vue
<template>
  <view>
    <!-- #ifdef APP-NVUE -->
    <list>
      <cell v-for="item in items" :key="item.id">
        <text>{{ item.name }}</text>
      </cell>
    </list>
    <!-- #endif -->

    <!-- #ifndef APP-NVUE -->
    <scroll-view scroll-y>
      <view v-for="item in items" :key="item.id">
        <text>{{ item.name }}</text>
      </view>
    </scroll-view>
    <!-- #endif -->
  </view>
</template>
```

## nvue 特有组件

```vue
<template>
  <!-- 水印组件 -->
  <watermark :text="'机密文件'" />

  <!-- 视频（原生） -->
  <video
    src="/static/video.mp4"
    :controls="true"
    :autoplay="false"
  />

  <!-- 地图（原生） -->
  <map
    :longitude="116.397428"
    :latitude="39.90923"
    :markers="markers"
  />
</template>
```

## 相关规则

- [component-01-built-in-components](./01-built-in-components.md)
- [component-02-custom-components](./02-custom-components.md)

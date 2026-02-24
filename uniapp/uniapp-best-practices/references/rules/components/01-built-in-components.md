# 内置组件规范

## 规则 ID

`component-01-built-in-components`

## 规则说明

UniApp 提供了一套跨平台的内置组件，必须使用这些组件而非 HTML 标签，以确保跨平台兼容性。

## 常用组件对照表

| HTML 标签 | UniApp 组件 | 说明 |
|-----------|-------------|------|
| div | view | 视图容器 |
| span, p | text | 文本（必须用于文本内容） |
| img | image | 图片 |
| a | navigator | 导航链接 |
| input | input | 输入框 |
| button | button | 按钮 |
| video | video | 视频 |
| audio | audio | 音频 |
| form | form | 表单 |
| checkbox | checkbox | 复选框 |
| radio | radio | 单选框 |
| select | picker | 选择器 |
| textarea | textarea | 多行输入 |
| scroll | scroll-view | 滚动容器 |
| iframe | web-view | 网页容器 |

## 正确示例

### 基础组件使用

```vue
<template>
  <view class="container">
    <!-- 使用 view 替代 div -->
    <view class="header">
      <!-- 文本必须用 text 包裹 -->
      <text class="title">标题</text>
    </view>

    <!-- 图片使用 image -->
    <image
      class="avatar"
      src="/static/avatar.png"
      mode="aspectFill"
    />

    <!-- 导航使用 navigator -->
    <navigator url="/pages/detail/detail">
      <text>查看详情</text>
    </navigator>

    <!-- 列表渲染 -->
    <view v-for="item in list" :key="item.id" class="item">
      <text>{{ item.name }}</text>
    </view>
  </view>
</template>
```

### 列表组件

```vue
<template>
  <!-- 滚动列表 -->
  <scroll-view
    scroll-y
    class="scroll-list"
    @scrolltolower="loadMore"
  >
    <view v-for="item in list" :key="item.id" class="item">
      <image :src="item.image" mode="aspectFill" />
      <view class="info">
        <text class="name">{{ item.name }}</text>
        <text class="desc">{{ item.description }}</text>
      </view>
    </view>
  </scroll-view>
</template>

<script setup>
import { ref } from 'vue'

const list = ref([])
const page = ref(1)

async function loadMore() {
  const newData = await fetchData(page.value + 1)
  list.value.push(...newData)
  page.value++
}
</script>
```

### 表单组件

```vue
<template>
  <form @submit="handleSubmit">
    <!-- 输入框 -->
    <view class="form-item">
      <text>用户名</text>
      <input
        v-model="formData.username"
        placeholder="请输入用户名"
        type="text"
      />
    </view>

    <!-- 密码输入 -->
    <view class="form-item">
      <text>密码</text>
      <input
        v-model="formData.password"
        placeholder="请输入密码"
        type="password"
      />
    </view>

    <!-- 多行输入 -->
    <view class="form-item">
      <text>备注</text>
      <textarea
        v-model="formData.remark"
        placeholder="请输入备注"
      />
    </view>

    <!-- 选择器 -->
    <view class="form-item">
      <picker :value="genderIndex" :range="genders" @change="onGenderChange">
        <view class="picker">
          <text>{{ genders[genderIndex] }}</text>
        </view>
      </picker>
    </view>

    <button form-type="submit">提交</button>
  </form>
</template>

<script setup>
import { ref } from 'vue'

const formData = ref({
  username: '',
  password: '',
  remark: ''
})

const genders = ['男', '女', '保密']
const genderIndex = ref(0)

function onGenderChange(e) {
  genderIndex.value = e.detail.value
}

function handleSubmit() {
  console.log('提交数据', formData.value)
}
</script>
```

## 错误示例

```vue
<template>
  <!-- ❌ 错误：使用 HTML 标签 -->
  <div class="container">
    <span>文本</span>
    <img src="/static/logo.png" />
    <a href="/pages/detail">链接</a>
  </div>

  <!-- ❌ 错误：文本未用 text 包裹 -->
  <view class="content">
    这是一段文字
  </view>

  <!-- ❌ 错误：在 view 中直接放置文本（小程序不支持） -->
  <view>
    价格：¥{{ price }}
  </view>
</template>
```

## nvue 注意事项

nvue 页面有更严格的组件要求：

```vue
<template>
  <!-- nvue 必须使用 text 包裹文本 -->
  <view>
    <text>文本内容</text>
  </view>

  <!-- nvue 不支持 v-show，使用 v-if -->
  <view v-if="isVisible">
    <text>条件显示</text>
  </view>

  <!-- nvue 只能使用 flex 布局 -->
  <view class="flex-container">
    <text>Flex 子项</text>
  </view>
</template>

<style>
/* nvue 样式必须使用 flex */
.flex-container {
  flex-direction: row;
  justify-content: center;
  align-items: center;
}
</style>
```

## 相关规则

- [component-02-custom-components](./02-custom-components.md)
- [component-03-nvue-differences](./03-nvue-differences.md)

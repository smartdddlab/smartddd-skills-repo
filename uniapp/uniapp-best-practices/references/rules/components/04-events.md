# 事件处理规范

## 规则 ID

`component-04-events`

## 规则说明

UniApp 事件系统基于 Vue，但有一些平台差异。正确处理事件对于构建交互式应用至关重要。

## 事件绑定

### 基本语法

```vue
<template>
  <!-- 使用 @ 符号绑定事件 -->
  <view @click="handleClick">点击</view>

  <!-- 传递参数 -->
  <view @click="handleClick(item.id)">点击</view>

  <!-- 传递事件对象 -->
  <view @click="handleClick($event)">点击</view>

  <!-- 同时传递参数和事件对象 -->
  <view @click="handleClick(item.id, $event)">点击</view>
</template>

<script setup>
function handleClick(id, event) {
  console.log('ID:', id)
  console.log('Event:', event)
}
</script>
```

## 事件修饰符

### 常用修饰符

```vue
<template>
  <!-- 阻止事件冒泡 -->
  <view @click="parentClick">
    <button @click.stop="childClick">子按钮</button>
  </view>

  <!-- 阻止默认行为 -->
  <form @submit.prevent="handleSubmit">
    <button type="submit">提交</button>
  </form>

  <!-- 一次性事件 -->
  <button @click.once="handleOnce">只触发一次</button>

  <!-- 按键修饰符 -->
  <input @keyup.enter="handleEnter" />
  <input @keyup.esc="handleEsc" />

  <!-- 组合修饰符 -->
  <view @click.stop.prevent="handleBoth">组合</view>
</template>
```

### 修饰符列表

| 修饰符 | 说明 | 平台支持 |
|--------|------|----------|
| .stop | 阻止冒泡 | 全平台 |
| .prevent | 阻止默认行为 | 全平台 |
| .capture | 捕获模式 | H5 |
| .self | 仅自身触发 | H5 |
| .once | 只触发一次 | 全平台 |
| .passive | 提升滚动性能 | H5 |

## 点击事件

### click vs tap

```vue
<template>
  <!-- ✅ 推荐：使用 @click（Vue 3 风格） -->
  <view @click="handleClick">点击</view>

  <!-- ⚠️ 也可以：@tap（小程序风格） -->
  <view @tap="handleTap">点击</view>
</template>

<script setup>
// 两个事件行为相同
function handleClick() {
  console.log('click 事件')
}

function handleTap() {
  console.log('tap 事件')
}
</script>
```

### 长按事件

```vue
<template>
  <!-- 长按触发 -->
  <view @longpress="handleLongPress">长按</view>

  <!-- 触摸开始 -->
  <view @touchstart="handleTouchStart">触摸开始</view>

  <!-- 触摸结束 -->
  <view @touchend="handleTouchEnd">触摸结束</view>
</template>
```

## 表单事件

```vue
<template>
  <form @submit="handleSubmit" @reset="handleReset">
    <!-- 输入事件 -->
    <input
      @input="handleInput"
      @focus="handleFocus"
      @blur="handleBlur"
      @confirm="handleConfirm"
    />

    <!-- 复选框 -->
    <checkbox-group @change="handleCheckboxChange">
      <checkbox value="a" />A
      <checkbox value="b" />B
    </checkbox-group>

    <!-- 单选框 -->
    <radio-group @change="handleRadioChange">
      <radio value="1" />选项1
      <radio value="2" />选项2
    </radio-group>

    <!-- 开关 -->
    <switch @change="handleSwitchChange" />

    <!-- 滑动选择器 -->
    <slider @change="handleSliderChange" />

    <button form-type="submit">提交</button>
    <button form-type="reset">重置</button>
  </form>
</template>

<script setup>
import { ref } from 'vue'

const formData = ref({
  inputValue: '',
  checkedValues: [],
  radioValue: '',
  switchValue: false,
  sliderValue: 0
})

function handleInput(e) {
  formData.value.inputValue = e.detail.value
}

function handleCheckboxChange(e) {
  formData.value.checkedValues = e.detail.value
}

function handleRadioChange(e) {
  formData.value.radioValue = e.detail.value
}

function handleSwitchChange(e) {
  formData.value.switchValue = e.detail.value
}

function handleSliderChange(e) {
  formData.value.sliderValue = e.detail.value
}

function handleSubmit() {
  console.log('提交表单', formData.value)
}

function handleReset() {
  console.log('重置表单')
}
</script>
```

## 滚动事件

```vue
<template>
  <scroll-view
    scroll-y
    @scroll="handleScroll"
    @scrolltoupper="handleScrollTop"
    @scrolltolower="handleScrollBottom"
  >
    <view v-for="item in list" :key="item.id">
      <text>{{ item.name }}</text>
    </view>
  </scroll-view>
</template>

<script setup>
function handleScroll(e) {
  console.log('滚动位置', e.detail.scrollTop)
}

function handleScrollTop() {
  console.log('滚动到顶部')
}

function handleScrollBottom() {
  console.log('滚动到底部，加载更多')
  loadMore()
}
</script>
```

## 自定义事件

### 子组件触发事件

```vue
<!-- ChildComponent.vue -->
<template>
  <view @click="handleClick">
    <text>点击我</text>
  </view>
</template>

<script setup>
const emit = defineEmits(['customClick'])

function handleClick() {
  emit('customClick', {
    id: 1,
    name: '自定义数据'
  })
}
</script>

<!-- 父组件使用 -->
<template>
  <ChildComponent @custom-click="handleCustomClick" />
</template>

<script setup>
function handleCustomClick(data) {
  console.log('收到子组件事件', data)
}
</script>
```

## 事件对象

```vue
<template>
  <view @click="handleClick">
    <text>点击</text>
  </view>
</template>

<script setup>
function handleClick(event) {
  // 事件对象属性
  console.log('事件类型', event.type)
  console.log('时间戳', event.timeStamp)
  console.log('触摸点', event.touches)
  console.log('changedTouches', event.changedTouches)

  // target 和 currentTarget
  console.log('触发元素', event.target)
  console.log('绑定元素', event.currentTarget)

  // detail 对象（小程序特有）
  console.log('详情数据', event.detail)
}
</script>
```

## 相关规则

- [component-01-built-in-components](./01-built-in-components.md)
- [component-02-custom-components](./02-custom-components.md)

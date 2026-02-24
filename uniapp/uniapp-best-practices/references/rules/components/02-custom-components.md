# 自定义组件规范

## 规则 ID

`component-02-custom-components`

## 规则说明

使用 Vue 3 Composition API 和 `<script setup>` 语法创建自定义组件，遵循单向数据流原则。

## 组件结构规范

### 基础组件模板

```vue
<template>
  <view class="my-component">
    <text>{{ title }}</text>
    <button @click="handleClick">{{ buttonText }}</button>
  </view>
</template>

<script setup lang="ts">
// 1. 定义 Props
interface Props {
  title: string
  buttonText?: string
}

const props = withDefaults(defineProps<Props>(), {
  buttonText: '点击'
})

// 2. 定义 Emits
const emit = defineEmits<{
  click: [value: string]
}>()

// 3. 响应式状态
const count = ref(0)

// 4. 方法
function handleClick() {
  count.value++
  emit('click', `clicked ${count.value} times`)
}
</script>

<style scoped>
.my-component {
  padding: 20rpx;
}
</style>
```

## Props 规范

### 定义 Props

```vue
<script setup lang="ts">
// 类型定义方式
interface Props {
  // 必填属性
  title: string
  // 可选属性
  subtitle?: string
  // 带默认值
  count?: number
  // 数组类型
  items?: string[]
  // 对象类型
  config?: {
    theme: string
    size: number
  }
}

const props = withDefaults(defineProps<Props>(), {
  subtitle: '',
  count: 0,
  items: () => [],
  config: () => ({ theme: 'light', size: 14 })
})
</script>
```

### Props 验证

```vue
<script setup>
const props = defineProps({
  // 基础类型检查
  title: String,
  // 多类型
  value: [String, Number],
  // 必填
  required: {
    type: String,
    required: true
  },
  // 默认值
  status: {
    type: String,
    default: 'pending'
  },
  // 自定义验证
  age: {
    type: Number,
    validator: (value) => value >= 0 && value <= 150
  }
})
</script>
```

## Emits 规范

```vue
<script setup lang="ts">
// 类型化事件
const emit = defineEmits<{
  // 无参数事件
  close: []
  // 单参数事件
  change: [value: string]
  // 多参数事件
  update: [id: number, data: object]
}>()

function handleClose() {
  emit('close')
}

function handleChange(newValue: string) {
  emit('change', newValue)
}
</script>
```

## 双向绑定

### v-model 实现

```vue
<!-- 子组件 CustomInput.vue -->
<template>
  <input
    :value="modelValue"
    @input="onInput"
    placeholder="请输入"
  />
</template>

<script setup lang="ts">
const props = defineProps<{
  modelValue: string
}>()

const emit = defineEmits<{
  'update:modelValue': [value: string]
}>()

function onInput(event) {
  emit('update:modelValue', event.detail.value)
}
</script>

<!-- 父组件使用 -->
<template>
  <CustomInput v-model="inputValue" />
</template>
```

### 多个 v-model

```vue
<!-- 子组件 -->
<script setup lang="ts">
const firstName = defineModel<string>('firstName')
const lastName = defineModel<string>('lastName')
</script>

<!-- 父组件使用 -->
<template>
  <UserNameInput
    v-model:first-name="user.firstName"
    v-model:last-name="user.lastName"
  />
</template>
```

## 插槽使用

### 默认插槽

```vue
<!-- Card.vue -->
<template>
  <view class="card">
    <slot></slot>
  </view>
</template>

<!-- 使用 -->
<Card>
  <text>卡片内容</text>
</Card>
```

### 具名插槽

```vue
<!-- Layout.vue -->
<template>
  <view class="layout">
    <view class="header">
      <slot name="header"></slot>
    </view>
    <view class="content">
      <slot></slot>
    </view>
    <view class="footer">
      <slot name="footer"></slot>
    </view>
  </view>
</template>

<!-- 使用 -->
<Layout>
  <template #header>
    <text>标题</text>
  </template>

  <text>内容</text>

  <template #footer>
    <button>确定</button>
  </template>
</Layout>
```

### 作用域插槽

```vue
<!-- List.vue -->
<template>
  <view v-for="item in items" :key="item.id">
    <slot :item="item" :index="index"></slot>
  </view>
</template>

<script setup>
defineProps({
  items: Array
})
</script>

<!-- 使用 -->
<List :items="products">
  <template #default="{ item, index }">
    <text>{{ index + 1 }}. {{ item.name }}</text>
  </template>
</List>
```

## 组件注册

### 局部注册（推荐）

```vue
<script setup>
import CustomButton from './CustomButton.vue'
import CustomInput from './CustomInput.vue'
</script>
```

### 全局注册

```typescript
// main.ts
import { createSSRApp } from 'vue'
import App from './App.vue'
import CustomButton from './components/CustomButton.vue'

const app = createSSRApp(App)
app.component('CustomButton', CustomButton)
```

## 组件命名规范

```vue
<!-- ✅ 正确：PascalCase 命名 -->
<UserProfile />
<SearchBar />
<NavigationBar />

<!-- ❌ 错误：kebab-case 命名（不推荐） -->
<user-profile />
```

## 相关规则

- [component-01-built-in-components](./01-built-in-components.md)
- [component-03-nvue-differences](./03-nvue-differences.md)

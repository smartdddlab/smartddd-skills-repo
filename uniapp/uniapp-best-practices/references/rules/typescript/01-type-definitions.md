# TypeScript 类型定义规范

## 规则 ID

`typescript-01-type-definitions`

## 规则说明

在 UniApp 中使用 TypeScript 可以提高代码质量和开发效率，正确使用类型定义是关键。

## 项目配置

### tsconfig.json

```json
{
  "compilerOptions": {
    "target": "ESNext",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "jsx": "preserve",
    "jsxImportSource": "vue",
    "importHelpers": true,
    "experimentalDecorators": true,
    "strictNullChecks": true,
    "noUncheckedIndexedAccess": true,
    "allowSyntheticDefaultImports": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    },
    "types": [
      "@dcloudio/types",
      "@types/node"
    ]
  },
  "include": [
    "src/**/*.ts",
    "src/**/*.d.ts",
    "src/**/*.tsx",
    "src/**/*.vue"
  ],
  "exclude": ["node_modules", "dist"]
}
```

### 类型声明文件

```typescript
// src/types/global.d.ts
/// <reference types="@dcloudio/types" />

// 扩展 UniApp 类型
declare module '@dcloudio/uni-app' {
  interface Uni {
    // 自定义 API
    customApi(params: CustomParams): Promise<CustomResponse>
  }
}

// 环境变量类型
interface ImportMetaEnv {
  readonly VITE_APP_TITLE: string
  readonly VITE_API_BASE_URL: string
}

interface ImportMeta {
  readonly env: ImportMetaEnv
}
```

## Props 类型定义

### 基础用法

```vue
<script setup lang="ts">
// 定义 Props 接口
interface Props {
  title: string
  subtitle?: string
  count?: number
  items?: string[]
}

// 使用 withDefaults 设置默认值
const props = withDefaults(defineProps<Props>(), {
  subtitle: '',
  count: 0,
  items: () => []
})
</script>
```

### 复杂类型

```vue
<script setup lang="ts">
interface User {
  id: number
  name: string
  avatar?: string
}

interface Props {
  user: User
  status: 'active' | 'inactive' | 'pending'
  config: {
    theme: 'light' | 'dark'
    size: number
  }
  onUpdate?: (user: User) => void
}

const props = defineProps<Props>()
</script>
```

### 运行时声明

```vue
<script setup lang="ts">
// 使用 PropType 获取更精确的类型
import type { PropType } from 'vue'

interface Item {
  id: number
  name: string
}

const props = defineProps({
  items: {
    type: Array as PropType<Item[]>,
    required: true
  },
  callback: {
    type: Function as PropType<(item: Item) => void>,
    required: false
  }
})
</script>
```

## Emits 类型定义

### 基础用法

```vue
<script setup lang="ts">
// 定义事件类型
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

### 复杂事件类型

```vue
<script setup lang="ts">
interface User {
  id: number
  name: string
}

interface UpdatePayload {
  field: string
  value: any
}

const emit = defineEmits<{
  'user-select': [user: User]
  'user-update': [id: number, payload: UpdatePayload]
  'user-delete': [id: number]
}>()

function handleUserSelect(user: User) {
  emit('user-select', user)
}
</script>
```

## v-model 类型

```vue
<script setup lang="ts">
// 单个 v-model
const modelValue = defineModel<string>()

// 带默认值
const title = defineModel<string>('title', { default: '' })

// 多个 v-model
const firstName = defineModel<string>('firstName')
const lastName = defineModel<string>('lastName')
</script>
```

## API 响应类型

### 定义响应类型

```typescript
// types/api.ts

// 通用响应结构
interface ApiResponse<T = any> {
  code: number
  message: string
  data: T
}

// 分页响应
interface PaginatedResponse<T> {
  list: T[]
  total: number
  page: number
  pageSize: number
}

// 用户相关
interface UserInfo {
  id: number
  name: string
  email: string
  avatar?: string
  createdAt: string
}

interface LoginResponse {
  token: string
  user: UserInfo
}

// 订单相关
interface Order {
  id: string
  status: OrderStatus
  items: OrderItem[]
  totalAmount: number
  createdAt: string
}

type OrderStatus = 'pending' | 'paid' | 'shipped' | 'completed' | 'cancelled'

interface OrderItem {
  productId: number
  productName: string
  quantity: number
  price: number
}
```

### 使用类型

```typescript
// api/user.ts
import type { ApiResponse, LoginResponse, UserInfo } from '@/types/api'

export async function login(
  username: string,
  password: string
): Promise<LoginResponse> {
  const [err, res] = await uni.request({
    url: '/api/login',
    method: 'POST',
    data: { username, password }
  })

  if (err) throw err

  const response = res.data as ApiResponse<LoginResponse>
  if (response.code !== 0) {
    throw new Error(response.message)
  }

  return response.data
}

export async function getUserInfo(): Promise<UserInfo> {
  const [err, res] = await uni.request({
    url: '/api/user/info'
  })

  if (err) throw err

  const response = res.data as ApiResponse<UserInfo>
  return response.data
}
```

## 工具类型

```typescript
// types/utils.ts

// 可为空类型
type Nullable<T> = T | null

// 可选类型
type Optional<T> = T | undefined

// 只读深度
type DeepReadonly<T> = {
  readonly [P in keyof T]: T[P] extends object ? DeepReadonly<T[P]> : T[P]
}

// 部分（部分字段可选）
type PartialBy<T, K extends keyof T> = Omit<T, K> & Partial<Pick<T, K>>

// 必选（部分字段必选）
type RequiredBy<T, K extends keyof T> = Omit<T, K> & Required<Pick<T, K>>

// 示例
interface User {
  id: number
  name: string
  email: string
  avatar?: string
}

// 创建用户时 id 可选
type CreateUser = PartialBy<User, 'id'>

// 更新用户时所有字段可选
type UpdateUser = Partial<User>
```

## 泛型组件

```vue
<script setup lang="ts" generic="T extends { id: number }">
interface Props {
  items: T[]
  selectedId?: number
}

const props = defineProps<Props>()

const emit = defineEmits<{
  select: [item: T]
}>()

function handleSelect(item: T) {
  emit('select', item)
}
</script>

<template>
  <view v-for="item in items" :key="item.id" @click="handleSelect(item)">
    <text>{{ item.id }}</text>
  </view>
</template>
```

## 相关规则

- [typescript-02-api-types](./02-api-types.md)

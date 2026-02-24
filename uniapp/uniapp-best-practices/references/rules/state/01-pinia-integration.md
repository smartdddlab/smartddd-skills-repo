# Pinia 状态管理规范

## 规则 ID

`state-01-pinia-integration`

## 规则说明

推荐使用 Pinia 作为 UniApp 的状态管理解决方案，它对 TypeScript 支持更好，API 更简洁。

## 安装配置

### 安装 Pinia

```bash
npm install pinia
# 或
yarn add pinia
```

### 配置 Pinia

```typescript
// main.ts
import { createSSRApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'

export function createApp() {
  const app = createSSRApp(App)
  const pinia = createPinia()

  app.use(pinia)

  return { app }
}
```

## Store 定义

### Options Store

```typescript
// stores/user.ts
import { defineStore } from 'pinia'

interface UserInfo {
  id: number
  name: string
  avatar: string
}

export const useUserStore = defineStore('user', {
  // 状态
  state: () => ({
    token: '' as string,
    userInfo: null as UserInfo | null,
    isLoggedIn: false
  }),

  // 计算属性
  getters: {
    userName: (state) => state.userInfo?.name ?? '游客',
    hasToken: (state) => !!state.token
  },

  // 方法
  actions: {
    setToken(token: string) {
      this.token = token
      this.isLoggedIn = !!token
    },

    setUserInfo(info: UserInfo) {
      this.userInfo = info
    },

    async login(credentials: LoginCredentials) {
      const res = await uni.request({
        url: '/api/login',
        method: 'POST',
        data: credentials
      })

      this.setToken(res.data.token)
      this.setUserInfo(res.data.userInfo)
    },

    logout() {
      this.token = ''
      this.userInfo = null
      this.isLoggedIn = false
    }
  }
})
```

### Setup Store

```typescript
// stores/counter.ts
import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useCounterStore = defineStore('counter', () => {
  // 状态
  const count = ref(0)

  // 计算属性
  const doubleCount = computed(() => count.value * 2)

  // 方法
  function increment() {
    count.value++
  }

  function decrement() {
    count.value--
  }

  async function fetchCount() {
    const res = await uni.request({ url: '/api/count' })
    count.value = res.data.count
  }

  return {
    count,
    doubleCount,
    increment,
    decrement,
    fetchCount
  }
})
```

## Store 使用

### 在组件中使用

```vue
<template>
  <view class="user-info">
    <text>用户名：{{ userStore.userName }}</text>
    <text>状态：{{ userStore.isLoggedIn ? '已登录' : '未登录' }}</text>

    <button @click="handleLogin">登录</button>
    <button @click="handleLogout">退出</button>
  </view>
</template>

<script setup lang="ts">
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()

async function handleLogin() {
  await userStore.login({
    username: 'test',
    password: '123456'
  })
}

function handleLogout() {
  userStore.logout()
}
</script>
```

### 解构使用

```vue
<script setup>
import { storeToRefs } from 'pinia'
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()

// ✅ 正确：使用 storeToRefs 解构响应式属性
const { userName, isLoggedIn } = storeToRefs(userStore)

// ✅ 正确：直接解构方法
const { login, logout } = userStore

// ❌ 错误：直接解构会失去响应性
const { token, userInfo } = userStore
</script>
```

### 修改状态

```vue
<script setup>
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()

// 方式1：直接修改
userStore.token = 'new-token'

// 方式2：$patch 批量修改
userStore.$patch({
  token: 'new-token',
  isLoggedIn: true
})

// 方式3：$patch 函数形式
userStore.$patch((state) => {
  state.token = 'new-token'
  state.isLoggedIn = true
})

// 方式4：调用 action
userStore.setToken('new-token')
</script>
```

## 持久化

### 安装持久化插件

```bash
npm install pinia-plugin-persistedstate
```

### 配置持久化

```typescript
// main.ts
import { createPinia } from 'pinia'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'

const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)
```

### Store 持久化配置

```typescript
// stores/user.ts
export const useUserStore = defineStore('user', {
  state: () => ({
    token: '',
    userInfo: null
  }),

  // 开启持久化
  persist: {
    enabled: true,
    strategies: [
      {
        key: 'user',
        storage: {
          getItem: (key) => uni.getStorageSync(key),
          setItem: (key, value) => uni.setStorageSync(key, value)
        },
        // 只持久化部分字段
        paths: ['token']
      }
    ]
  }
})
```

## 多 Store 协作

```typescript
// stores/cart.ts
import { defineStore } from 'pinia'
import { useUserStore } from './user'

export const useCartStore = defineStore('cart', {
  state: () => ({
    items: [] as CartItem[]
  }),

  getters: {
    // 使用其他 store
    canCheckout(): boolean {
      const userStore = useUserStore()
      return userStore.isLoggedIn && this.items.length > 0
    }
  },

  actions: {
    async checkout() {
      const userStore = useUserStore()

      if (!userStore.isLoggedIn) {
        uni.navigateTo({ url: '/pages/login/login' })
        return
      }

      // 结算逻辑
    }
  }
})
```

## 相关规则

- [state-02-data-persistence](./02-data-persistence.md)

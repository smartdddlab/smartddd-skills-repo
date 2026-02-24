---
title: Use Pinia for Global State Management
impact: MEDIUM
impactDescription: Better TypeScript support and simpler API than Vuex
tags: state, pinia, store, management
---

## Use Pinia for Global State Management

Pinia is the recommended state management solution for Vue 3. It has better TypeScript support and a simpler API than Vuex.

**Incorrect (scattered state, hard to maintain):**

```vue
<script setup>
// ❌ State scattered across components, hard to sync
const userInfo = ref(uni.getStorageSync('userInfo'))
const token = ref(uni.getStorageSync('token'))

async function login(credentials) {
  const res = await uni.request({ url: '/api/login', data: credentials })
  userInfo.value = res.data.user
  token.value = res.data.token
  uni.setStorageSync('userInfo', res.data.user)
  uni.setStorageSync('token', res.data.token)
}
</script>
```

**Correct (centralized with Pinia):**

```typescript
// stores/user.ts
import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    token: '',
    userInfo: null as UserInfo | null
  }),

  getters: {
    isLoggedIn: (state) => !!state.token
  },

  actions: {
    async login(credentials: LoginCredentials) {
      const res = await uni.request({
        url: '/api/login',
        method: 'POST',
        data: credentials
      })
      this.token = res.data.token
      this.userInfo = res.data.userInfo
    },

    logout() {
      this.token = ''
      this.userInfo = null
    }
  }
})
```

```vue
<!-- Component usage -->
<script setup>
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()

// Access state
console.log(userStore.userInfo)
console.log(userStore.isLoggedIn)

// Call actions
await userStore.login({ username: 'test', password: '123' })
</script>
```

Reference: [Pinia Documentation](https://pinia.vuejs.org/)

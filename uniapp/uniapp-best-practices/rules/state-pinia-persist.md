---
title: Persist Pinia State with pinia-plugin-persistedstate
impact: MEDIUM
impactDescription: Automatic persistence across app restarts
tags: state, pinia, persist, storage
---

## Persist Pinia State with pinia-plugin-persistedstate

Use `pinia-plugin-persistedstate` to automatically persist store state to local storage.

**Incorrect (manual persistence, error-prone):**

```typescript
// ❌ Manual sync, easy to forget
export const useUserStore = defineStore('user', {
  state: () => ({
    token: uni.getStorageSync('token') || '',
    userInfo: JSON.parse(uni.getStorageSync('userInfo') || 'null')
  }),

  actions: {
    setToken(token: string) {
      this.token = token
      uni.setStorageSync('token', token) // Easy to forget
    }
  }
})
```

**Correct (automatic persistence):**

```typescript
// main.ts
import { createPinia } from 'pinia'
import piniaPluginPersistedstate from 'pinia-plugin-persistedstate'

const pinia = createPinia()
pinia.use(piniaPluginPersistedstate)

// stores/user.ts
export const useUserStore = defineStore('user', {
  state: () => ({
    token: '',
    userInfo: null as UserInfo | null
  }),

  persist: {
    storage: {
      getItem: (key) => uni.getStorageSync(key),
      setItem: (key, value) => uni.setStorageSync(key, value)
    },
    paths: ['token', 'userInfo'] // Only persist these fields
  }
})
```

Reference: [pinia-plugin-persistedstate](https://prazdevs.github.io/pinia-plugin-persistedstate/)

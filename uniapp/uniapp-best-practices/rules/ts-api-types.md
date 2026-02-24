---
title: Type API Responses with Generics
impact: LOW-MEDIUM
impactDescription: Type-safe API calls
tags: typescript, api, generic, request
---

## Type API Responses with Generics

Create a typed request wrapper for consistent API handling with full type safety.

**Incorrect (any type, no safety):**

```typescript
// ❌ No type information
async function getUser() {
  const res = await uni.request({ url: '/api/user' })
  return res.data // Type is any
}
```

**Correct (typed response):**

```typescript
// types/api.ts
interface ApiResponse<T> {
  code: number
  message: string
  data: T
}

interface UserInfo {
  id: number
  name: string
  email: string
}

// utils/request.ts
async function request<T>(options: UniApp.RequestOptions): Promise<T> {
  return new Promise((resolve, reject) => {
    uni.request({
      ...options,
      success: (res) => {
        if (res.statusCode === 200) {
          const response = res.data as ApiResponse<T>
          if (response.code === 0) {
            resolve(response.data)
          } else {
            reject(new Error(response.message))
          }
        } else {
          reject(new Error(`HTTP ${res.statusCode}`))
        }
      },
      fail: reject
    })
  })
}

// Usage with full type inference
async function getUser(): Promise<UserInfo> {
  return request<UserInfo>({
    url: '/api/user',
    method: 'GET'
  })
}

// ✅ user is typed as UserInfo
const user = await getUser()
console.log(user.name) // IDE autocomplete works!
```

Reference: [UniApp TypeScript](https://uniapp.dcloud.net.cn/tutorial/typescript.html)

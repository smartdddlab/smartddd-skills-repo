---
title: Use Promise API Instead of Callbacks
impact: MEDIUM
impactDescription: Cleaner async code, better error handling
tags: async, promise, async-await, callback
---

## Use Promise API Instead of Callbacks

UniApp APIs support both callback and Promise forms. Use Promise with async/await for cleaner code.

**Incorrect (callback hell):**

```javascript
// ❌ Callback hell, hard to read and maintain
uni.request({
  url: '/api/user',
  success: (res1) => {
    uni.request({
      url: '/api/orders',
      data: { userId: res1.data.id },
      success: (res2) => {
        uni.request({
          url: '/api/products',
          success: (res3) => {
            // Deep nesting
          },
          fail: (err) => console.error(err)
        })
      },
      fail: (err) => console.error(err)
    })
  },
  fail: (err) => console.error(err)
})
```

**Correct (async/await):**

```javascript
// ✅ Clean async/await
async function loadData() {
  try {
    const [err1, res1] = await uni.request({ url: '/api/user' })
    if (err1) throw err1

    const [err2, res2] = await uni.request({
      url: '/api/orders',
      data: { userId: res1.data.id }
    })
    if (err2) throw err2

    const [err3, res3] = await uni.request({ url: '/api/products' })
    if (err3) throw err3

    return { user: res1.data, orders: res2.data, products: res3.data }
  } catch (error) {
    console.error('Load failed:', error)
    throw error
  }
}

// ✅ Parallel requests
async function loadAllData() {
  const [users, orders, products] = await Promise.all([
    uni.request({ url: '/api/users' }),
    uni.request({ url: '/api/orders' }),
    uni.request({ url: '/api/products' })
  ])
  return { users, orders, products }
}
```

Reference: [UniApp API Promise](https://uniapp.dcloud.net.cn/api/#promise-化)

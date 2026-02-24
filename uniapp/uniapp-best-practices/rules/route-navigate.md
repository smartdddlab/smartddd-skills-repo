---
title: Use Correct Navigation Method Based on Scenario
impact: MEDIUM
impactDescription: Proper page stack management
tags: route, navigation, navigateTo, redirectTo
---

## Use Correct Navigation Method Based on Scenario

UniApp provides multiple navigation methods. Choose the right one based on your use case.

**Incorrect (wrong navigation method):**

```javascript
// ❌ Using navigateTo for login page (user can go back to login)
uni.navigateTo({ url: '/pages/login/login' })

// ❌ Using navigateTo for tabBar page (will fail)
uni.navigateTo({ url: '/pages/index/index' }) // index is tabBar

// ❌ Stack overflow: too many navigateTo calls
for (let i = 0; i < 15; i++) {
  uni.navigateTo({ url: `/pages/detail/detail?id=${i}` })
}
```

**Correct (appropriate method):**

```javascript
// ✅ Login success: use redirectTo (can't go back to login)
uni.redirectTo({ url: '/pages/index/index' })

// ✅ TabBar page: use switchTab
uni.switchTab({ url: '/pages/index/index' })

// ✅ Normal navigation: use navigateTo
uni.navigateTo({ url: '/pages/detail/detail?id=123' })

// ✅ Go back: use navigateBack
uni.navigateBack({ delta: 1 })

// ✅ Reset app: use reLaunch
uni.reLaunch({ url: '/pages/index/index' })
```

**Navigation Methods:**

| Method | Stack Effect | Use Case |
|--------|--------------|----------|
| `navigateTo` | Push (+1) | Normal navigation |
| `redirectTo` | Replace | Login, payment success |
| `switchTab` | Reset | TabBar pages |
| `navigateBack` | Pop (-1) | Go back |
| `reLaunch` | Reset to 1 | Restart app |

**Note:** Mini Program page stack limit is 10 pages.

Reference: [UniApp Routing](https://uniapp.dcloud.net.cn/api/router.html)

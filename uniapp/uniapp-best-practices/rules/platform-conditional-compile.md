---
title: Use Conditional Compilation for Platform Differences
impact: CRITICAL
impactDescription: Enables code reuse across platforms while handling platform-specific logic
tags: platform, conditional, cross-platform, #ifdef
---

## Use Conditional Compilation for Platform Differences

UniApp's conditional compilation allows platform-specific code at compile time, reducing bundle size compared to runtime checks.

**Incorrect (runtime check, all code included in bundle):**

```javascript
// ❌ Runtime check - both branches are bundled
if (process.env.UNI_PLATFORM === 'mp-weixin') {
  wx.login()
} else if (process.env.UNI_PLATFORM === 'mp-alipay') {
  my.getAuthCode()
}
```

**Correct (compile-time, only needed code included):**

```javascript
// ✅ Conditional compilation - only matching platform's code is bundled
// #ifdef MP-WEIXIN
wx.login()
// #endif

// #ifdef MP-ALIPAY
my.getAuthCode()
// #endif
```

**Platform Identifiers:**

| Identifier | Platform |
|------------|----------|
| `H5` | Web browser |
| `MP-WEIXIN` | WeChat Mini Program |
| `MP-ALIPAY` | Alipay Mini Program |
| `MP-TOUTIAO` | Douyin/TikTok Mini Program |
| `MP` | Any Mini Program |
| `APP-PLUS` | Native App |
| `APP-NVUE` | nvue page in App |

Reference: [UniApp Conditional Compilation](https://uniapp.dcloud.net.cn/tutorial/platform-difference.html#%E6%9D%A1%E4%BB%B6%E7%BC%96%E8%AF%91)

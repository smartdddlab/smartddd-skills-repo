---
title: Wrap Platform APIs with uni.* for Cross-Platform Compatibility
impact: CRITICAL
impactDescription: Single API works across all platforms
tags: platform, api, uni, cross-platform
---

## Wrap Platform APIs with uni.* for Cross-Platform Compatibility

Always use `uni.*` APIs instead of platform-specific APIs (`wx.*`, `my.*`, etc.) for cross-platform compatibility.

**Incorrect (platform-specific, only works on one platform):**

```javascript
// ❌ WeChat-specific, breaks on other platforms
wx.request({
  url: '/api/data',
  success: (res) => console.log(res)
})

// ❌ Alipay-specific
my.request({ url: '/api/data' })
```

**Correct (cross-platform):**

```javascript
// ✅ Works on all platforms
uni.request({
  url: '/api/data',
  success: (res) => console.log(res)
})

// ✅ Using async/await with Promise
const [err, res] = await uni.request({ url: '/api/data' })
if (!err) {
  console.log(res.data)
}
```

**API Mapping Table:**

| uni.* | WeChat | Alipay | Description |
|-------|--------|--------|-------------|
| `uni.request` | `wx.request` | `my.request` | Network request |
| `uni.navigateTo` | `wx.navigateTo` | `my.navigateTo` | Page navigation |
| `uni.setStorage` | `wx.setStorage` | `my.setStorage` | Local storage |
| `uni.getLocation` | `wx.getLocation` | `my.getLocation` | Get location |
| `uni.chooseImage` | `wx.chooseImage` | `my.chooseImage` | Choose image |

Reference: [UniApp API](https://uniapp.dcloud.net.cn/api/)

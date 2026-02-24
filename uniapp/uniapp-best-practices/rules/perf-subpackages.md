---
title: Use Subpackages to Reduce Main Bundle Size
impact: HIGH
impactDescription: Main package limited to 2MB, subpackages up to 20MB total
tags: performance, subpackage, bundle, miniprogram
---

## Use Subpackages to Reduce Main Bundle Size

Mini Programs have strict size limits. Use subpackages to split code and enable on-demand loading.

**Incorrect (all pages in main package, hits 2MB limit):**

```json
// pages.json - ❌ Everything in main package
{
  "pages": [
    { "path": "pages/index/index" },
    { "path": "pages/user/profile" },
    { "path": "pages/order/list" },
    { "path": "pages/order/detail" },
    { "path": "pages/settings/settings" }
  ]
}
```

**Correct (subpackages for non-essential pages):**

```json
// pages.json - ✅ Core in main, others in subpackages
{
  "pages": [
    { "path": "pages/index/index" },
    { "path": "pages/login/login" }
  ],
  "subPackages": [
    {
      "root": "pages-user",
      "pages": [
        { "path": "profile/profile" },
        { "path": "settings/settings" }
      ]
    },
    {
      "root": "pages-order",
      "pages": [
        { "path": "list/list" },
        { "path": "detail/detail" }
      ]
    }
  ],
  "preloadRule": {
    "pages/index/index": {
      "network": "all",
      "packages": ["pages-user"]
    }
  }
}
```

**Size Limits:**

| Platform | Main Package | Single Subpackage | Total |
|----------|--------------|-------------------|-------|
| WeChat | 2MB | 2MB | 20MB |
| Alipay | 2MB | 2MB | 20MB |
| Douyin | 2MB | 2MB | 16MB |
| App | No limit | No limit | No limit |

Reference: [UniApp Subpackages](https://uniapp.dcloud.net.cn/collocation/pages.html#subpackages)

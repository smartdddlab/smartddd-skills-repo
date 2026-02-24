---
title: Handle Safe Areas for Notch and Home Indicator
impact: HIGH
impactDescription: Prevents UI from being hidden by device notches
tags: platform, safe-area, notch, iphone
---

## Handle Safe Areas for Notch and Home Indicator

iOS devices have notches and home indicators that can hide UI content. Use safe area insets to avoid overlap.

**Incorrect (content hidden by notch):**

```css
/* ❌ Content may be hidden behind notch */
.header {
  position: fixed;
  top: 0;
  height: 44px;
}

.footer {
  position: fixed;
  bottom: 0;
  height: 50px;
}
```

**Correct (respect safe areas):**

```css
/* ✅ Safe area aware layout */
.header {
  position: fixed;
  top: 0;
  padding-top: constant(safe-area-inset-top); /* iOS 11.0-11.2 */
  padding-top: env(safe-area-inset-top);      /* iOS 11.2+ */
}

.footer {
  position: fixed;
  bottom: 0;
  padding-bottom: constant(safe-area-inset-bottom);
  padding-bottom: env(safe-area-inset-bottom);
}

/* Or use CSS variables in App */
/* #ifdef APP-PLUS */
.page {
  padding-top: var(--status-bar-height);
  padding-bottom: var(--window-bottom);
}
/* #endif */
```

Reference: [UniApp Safe Area](https://uniapp.dcloud.net.cn/tutorial/syntax-css.html#安全区域)

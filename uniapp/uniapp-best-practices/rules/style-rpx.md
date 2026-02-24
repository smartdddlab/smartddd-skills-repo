---
title: Use rpx for Responsive Layout
impact: MEDIUM
impactDescription: Automatic adaptation across screen sizes
tags: style, rpx, responsive, layout
---

## Use rpx for Responsive Layout

UniApp uses rpx (responsive pixel) as the responsive unit. Screen width is defined as 750rpx, automatically adapting to different devices.

**Incorrect (fixed px, inconsistent across devices):**

```css
/* ❌ Fixed pixels, inconsistent on different screens */
.container {
  width: 375px;
  padding: 20px;
}

.title {
  font-size: 16px;
}
```

**Correct (rpx for responsive design):**

```css
/* ✅ rpx adapts to screen width */
.container {
  width: 750rpx;  /* Full screen width */
  padding: 40rpx; /* ~20px on 375px screen */
}

.title {
  font-size: 32rpx; /* ~16px on 375px screen */
}
```

**rpx Conversion (750rpx = screen width):**

| Device | Screen Width | 1rpx = |
|--------|--------------|--------|
| iPhone 6 | 375px | 0.5px |
| iPhone 6 Plus | 414px | 0.552px |
| Android (360) | 360px | 0.48px |

**Best Practices:**

```css
/* Design file (750px width) → Direct conversion: 1px = 1rpx */
.box {
  width: 300rpx;   /* 300px in design → 300rpx */
  height: 200rpx;  /* 200px in design → 200rpx */
  margin: 20rpx;   /* 20px in design → 20rpx */
}

/* Use px for fixed values like borders */
.border {
  border: 1px solid #ddd;  /* Border stays 1px on all devices */
}

/* Mix with percentage for flexibility */
.responsive {
  width: calc(100% - 40rpx);
  margin: 0 20rpx;
}
```

Reference: [UniApp CSS Units](https://uniapp.dcloud.net.cn/tutorial/syntax-css.html#尺寸单位)

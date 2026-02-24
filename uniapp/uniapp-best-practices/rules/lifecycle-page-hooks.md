---
title: Use Page Lifecycle Hooks from @dcloudio/uni-app
impact: MEDIUM
impactDescription: Proper page lifecycle management
tags: lifecycle, onLoad, onShow, hooks
---

## Use Page Lifecycle Hooks from @dcloudio/uni-app

Page lifecycle hooks like `onLoad`, `onShow` are UniApp-specific and must be imported from `@dcloudio/uni-app`, not Vue's lifecycle.

**Incorrect (wrong lifecycle hooks):**

```vue
<script setup>
// ❌ Using Vue lifecycle for page events
import { onMounted, onUnmounted } from 'vue'

onMounted(() => {
  // This doesn't get page parameters!
  const id = ??? // Can't access URL params
})

onUnmounted(() => {
  // This is component lifecycle, not page
})
</script>
```

**Correct (UniApp page lifecycle):**

```vue
<script setup>
import { ref } from 'vue'
import { onLoad, onShow, onReady, onHide, onUnload } from '@dcloudio/uni-app'

const id = ref('')
const detail = ref(null)

// ✅ onLoad: receives URL parameters
onLoad((options) => {
  id.value = options.id || ''
  loadDetail()
})

// ✅ onShow: page becomes visible
onShow(() => {
  refreshData()
})

// ✅ onReady: page render complete
onReady(() => {
  // Safe to get element info
  const query = uni.createSelectorQuery()
  query.select('.box').boundingClientRect()
})

// ✅ onHide: page hidden
onHide(() => {
  pauseVideo()
})

// ✅ onUnload: page unloaded
onUnload(() => {
  cleanup()
  uni.$off('eventName')
})
</script>
```

**Page Lifecycle Flow:**

```
onLoad → onShow → onReady → (onHide ⇄ onShow) → onUnload
```

| Hook | When | Use Case |
|------|------|----------|
| `onLoad` | Page loaded | Get URL params, initial fetch |
| `onShow` | Page visible | Refresh data, resume |
| `onReady` | Render complete | Get element size |
| `onHide` | Page hidden | Pause, save draft |
| `onUnload` | Page closed | Cleanup resources |

Reference: [UniApp Page Lifecycle](https://uniapp.dcloud.net.cn/tutorial/page.html#lifecycle)

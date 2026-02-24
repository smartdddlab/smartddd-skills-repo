---
title: Type Props with TypeScript Interfaces
impact: LOW-MEDIUM
impactDescription: Better type safety and IDE support
tags: typescript, props, type, interface
---

## Type Props with TypeScript Interfaces

Use TypeScript interfaces to define prop types for better type safety and autocomplete.

**Incorrect (no type safety):**

```vue
<script setup>
// ❌ No type checking
const props = defineProps({
  title: String,
  count: Number,
  user: Object
})
</script>
```

**Correct (typed props):**

```vue
<script setup lang="ts">
interface User {
  id: number
  name: string
  avatar?: string
}

interface Props {
  title: string
  count?: number
  user: User
  status: 'active' | 'inactive'
}

// With defaults
const props = withDefaults(defineProps<Props>(), {
  count: 0
})

// Typed emits
const emit = defineEmits<{
  update: [value: string]
  delete: [id: number]
}>()
</script>
```

Reference: [Vue 3 TypeScript](https://vuejs.org/guide/typescript/composition-api.html#typing-component-props)

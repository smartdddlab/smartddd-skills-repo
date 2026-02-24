---
title: Use defineEmits for Component Events
impact: MEDIUM
impactDescription: Type-safe component communication
tags: component, emit, event, communication
---

## Use defineEmits for Component Events

Use `defineEmits` with TypeScript for type-safe component event emission.

**Incorrect (untyped events):**

```vue
<script setup>
// ❌ No type checking
const emit = defineEmits(['update', 'delete'])

function handleUpdate() {
  emit('update', someData) // No type check on someData
}
</script>
```

**Correct (typed events):**

```vue
<script setup lang="ts">
interface User {
  id: number
  name: string
}

// ✅ Typed events
const emit = defineEmits<{
  update: [user: User]
  delete: [id: number]
  change: [field: string, value: any]
}>()

function handleUpdate(user: User) {
  emit('update', user) // Type checked!
}

function handleDelete(id: number) {
  emit('delete', id)
}
</script>
```

**Parent component:**

```vue
<template>
  <UserCard
    @update="handleUpdate"
    @delete="handleDelete"
  />
</template>

<script setup lang="ts">
function handleUpdate(user: User) {
  console.log('Update:', user)
}

function handleDelete(id: number) {
  console.log('Delete:', id)
}
</script>
```

Reference: [Vue 3 defineEmits](https://vuejs.org/api/sfc-script-setup.html#defineprops-defineemits)

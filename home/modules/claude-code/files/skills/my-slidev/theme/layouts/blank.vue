<script setup>
defineProps({
  fontSize: { type: String, default: '' },
})
</script>

<template>
  <div class="slidev-layout blank" :style="fontSize ? { fontSize } : {}">
    <slot />
  </div>
</template>

<style scoped>
.blank {
  height: 100%;
  padding: 48px;
  background: var(--c-bg);
  position: relative;
}

.blank.v-center {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.blank :deep(li) {
  margin-bottom: 6px;
}

.blank::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: var(--c-primary);
}
</style>

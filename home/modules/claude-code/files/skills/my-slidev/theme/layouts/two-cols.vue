<script setup>
import { computed } from 'vue'

const props = defineProps({
  columns: {
    type: String,
    default: '1:1',
  },
  fontSize: {
    type: String,
    default: '',
  },
})

const gridTemplate = computed(() => {
  const parts = props.columns.split(':').map(Number)
  return parts.map(p => `${p}fr`).join(' ')
})
</script>

<template>
  <div class="slidev-layout two-cols">
    <div class="two-cols-header">
      <slot name="header" />
    </div>
    <div class="two-cols-content" :style="{ gridTemplateColumns: gridTemplate, ...(fontSize ? { fontSize } : {}) }">
      <div class="two-cols-left">
        <slot name="left" />
      </div>
      <div class="two-cols-right">
        <slot name="right" />
      </div>
    </div>
    <div class="page-number">
      {{ String($slidev.nav.currentPage).padStart(String($slidev.nav.total).length, '0') }}/{{ String($slidev.nav.total).padStart(String($slidev.nav.total).length, '0') }}
    </div>
  </div>
</template>

<style scoped>
.two-cols {
  display: flex;
  flex-direction: column;
  height: 100%;
  background: var(--c-bg);
  position: relative;
}

.two-cols-header {
  background: transparent;
  border-left: 4px solid var(--c-primary);
  padding: 24px 48px 24px 44px;
  flex: 0 0 auto;
  min-height: 20%;
  display: flex;
  align-items: center;
}

.two-cols-header :deep(h1) {
  font-weight: 800;
  font-size: 32px;
  color: var(--c-text);
  margin: 0;
}

.two-cols-content {
  display: grid;
  gap: 32px;
  padding: 32px 48px;
  flex: 1;
}

.page-number {
  position: absolute;
  bottom: 16px;
  right: 32px;
  font-size: 13px;
  color: var(--c-text-secondary);
  font-weight: 500;
}

.two-cols::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: var(--c-primary);
}
</style>

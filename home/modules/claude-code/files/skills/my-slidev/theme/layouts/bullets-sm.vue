<script setup>
defineProps({
  fontSize: { type: String, default: '14px' },
})
</script>

<template>
  <div class="slidev-layout bullets-sm">
    <div class="bullets-sm-header">
      <slot name="header" />
    </div>
    <div class="bullets-sm-content" :style="{ fontSize }">
      <slot />
    </div>
    <div class="page-number">
      {{ String($slidev.nav.currentPage).padStart(String($slidev.nav.total).length, '0') }}/{{ String($slidev.nav.total).padStart(String($slidev.nav.total).length, '0') }}
    </div>
  </div>
</template>

<style scoped>
.bullets-sm {
  display: flex;
  flex-direction: column;
  height: 100%;
  background: var(--c-bg);
  position: relative;
}

.bullets-sm-header {
  background: transparent;
  border-left: 4px solid var(--c-primary);
  padding: 16px 48px 16px 44px;
  flex: 0 0 auto;
  min-height: 14%;
  display: flex;
  align-items: center;
}

.bullets-sm-header :deep(h1) {
  font-weight: 800;
  font-size: 24px;
  color: var(--c-text);
  margin: 0;
}

.bullets-sm-content {
  padding: 14px 48px;
  flex: 1;
}

.bullets-sm-content :deep(ul) {
  list-style: none;
  padding-left: 0;
}

.bullets-sm-content :deep(li) {
  font-weight: 500;
  color: var(--c-text);
  margin-bottom: 6px;
  padding-left: 0;
}

.bullets-sm-content :deep(li::before) {
  display: none;
}

.page-number {
  position: absolute;
  bottom: 16px;
  right: 32px;
  font-size: 13px;
  color: var(--c-text-secondary);
  font-weight: 500;
}

.bullets-sm::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: var(--c-primary);
}
</style>

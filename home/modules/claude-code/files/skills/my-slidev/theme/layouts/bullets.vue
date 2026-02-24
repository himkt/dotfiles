<script setup>
defineProps({
  fontSize: { type: String, default: '22px' },
})
</script>

<template>
  <div class="slidev-layout bullets">
    <div class="bullets-header">
      <slot name="header" />
    </div>
    <div class="bullets-content" :style="{ fontSize }">
      <slot />
    </div>
    <div class="page-number">
      {{ String($slidev.nav.currentPage).padStart(String($slidev.nav.total).length, '0') }}/{{ String($slidev.nav.total).padStart(String($slidev.nav.total).length, '0') }}
    </div>
  </div>
</template>

<style scoped>
.bullets {
  display: flex;
  flex-direction: column;
  height: 100%;
  background: var(--c-bg);
  position: relative;
}

.bullets-header {
  background: transparent;
  border-left: 4px solid var(--c-primary);
  padding: 24px 48px 24px 44px;
  flex: 0 0 auto;
  min-height: 20%;
  display: flex;
  align-items: center;
}

.bullets-header :deep(h1) {
  font-weight: 800;
  font-size: 32px;
  color: var(--c-text);
  margin: 0;
}

.bullets-content {
  padding: 32px 48px;
  flex: 1;
}

.bullets-content :deep(li) {
  font-weight: 700;
  color: var(--c-text);
  margin-bottom: 12px;
}

.page-number {
  position: absolute;
  bottom: 16px;
  right: 32px;
  font-size: 13px;
  color: var(--c-text-secondary);
  font-weight: 500;
}

.bullets::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: var(--c-primary);
}
</style>

<template>
  <div class="container">
    <div class="row">
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
      <katalog-item-com></katalog-item-com>
    </div>
  </div>
</template>

<script>
import katalogItem from './KatalogItem.vue';

export default {
  components: {
    'katalog-item-com': katalogItem
  }
}
</script>
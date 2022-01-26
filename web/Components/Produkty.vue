<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
  <katalog-com></katalog-com>
</template>

<script>
import banner from './Banner.vue';
import katalog from './Web/Produkty/Katalog.vue';

export default {
  data() {
    return {
      dia: {}
    }
  },
  components: {
    'banner-com': banner,
    'katalog-com': katalog
  },
  beforeCreate() {
    this.dia = new Dia();
  }
}
</script>

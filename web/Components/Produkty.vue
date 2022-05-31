<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
  <katalog-com></katalog-com>
  <register-com></register-com>
  <footer-com></footer-com>
</template>

<script>
import banner from './Banner.vue';
import katalog from './Web/Produkty/Katalog.vue';
import footer from './Footer.vue';
import register from './Register.vue';

export default {
  data() {
    return {
      dia: {}
    }
  },
  components: {
    'banner-com': banner,
    'katalog-com': katalog,
    'register-com': register,
    'footer-com': footer
  },
  beforeCreate() {
    this.dia = new Dia();
  }
}
</script>

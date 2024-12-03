<template>
  <!-- ***** Preloader Start ***** -->
<!--<div id="js-preloader" class="js-preloader">
  <div class="preloader-inner">
    <span class="dot"></span>
    <div class="dots">
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div>
</div>-->
<!-- ***** Preloader End ***** -->

<banner-com></banner-com>
<services-com></services-com>
<about-com></about-com>
<clients-com></clients-com>
<prices-com></prices-com>

<register-com></register-com>
<footer-com></footer-com>

</template>

<script>

import footer from './Footer.vue';
import banner from './Banner.vue';
import services from './Services.vue';
import about from './About.vue';
import clients from './Clients.vue';
import prices from './Prices.vue';
import register from './Register.vue';

export default {
  data() {
    return {
      dia: {}
    }
  },
  components: {
    'footer-com': footer,
    'banner-com': banner,
    'services-com': services,
    'about-com': about,
    'clients-com': clients,
    'prices-com': prices,
    'register-com': register
  },
  beforeCreate() {
    this.dia = new Dia();
  }
}

</script>

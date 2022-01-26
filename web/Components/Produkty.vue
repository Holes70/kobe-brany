<template>
<banner-com></banner-com>
  <div class="card">
    xxx
  </div>
</template>

<script>
import banner from './Banner.vue';

export default {
  data() {
    return {
      dia: {}
    }
  },
  components: {
    'banner-com': banner,
  },
  beforeCreate() {
    this.dia = new Dia();
  }
}
</script>

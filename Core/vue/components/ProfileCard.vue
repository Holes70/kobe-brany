<template>
  <div class='row'>
    <div class='col-4'>
      <div class='header-icon'>
        <img :src='img' alt='profile'>
      </div>
    </div>
    <div class='col-8'>
      <p>
        <template v-if="nameOnClick['type'] == 'href'">
          <a 
            :href="nameOnClick['url']"
          >
            {{ name }}
          </a>
        </template>
        <template v-else>
          {{ name }}
        </template>
      </p>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['params'],
    data() {
      return {
        name: '',
        img: '',
        nameOnClick: []
      }
    },
    mounted() {
      this.name = this.params['name'];
      this.img = this.params['img'];
      this.nameOnClick = this.params['nameOnClick'];
    }
  }
</script>
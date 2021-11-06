<template>
  <div class='row'>
    <div class='col-4'>
      <div class='header-icon'>
        <img :src='img' alt='profile'>
      </div>
    </div>
    <div class='col-8'>
      <p>{{ name }}</p>
    </div>
  </div>
</template>

<script>
  export default {
    props: ['params'],
    data() {
      return {
        name: '',
        img: ''
      }
    },
    mounted() {
      this.name = this.params['name'];
      this.img = this.params['img'];
    }
  }
</script>
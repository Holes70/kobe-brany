<template>
  <div class='card'>
    <div class='card-body'>
      <div class='d-flex flex-column align-items-center text-center'>
        <img src='https://bootdey.com/img/Content/avatar/avatar7.png' alt='Admin' class='rounded-circle' width='150'>
        <div class='mt-3'>
          <h4>{{ name }}</h4>
          <p v-html="desc" class='text-secondary mb-1'></p>
          <p v-html="desc2" class='text-muted font-size-sm'></p>
          <button class='btn btn-primary'>Follow</button>
          <button class='btn btn-outline-primary'>Message</button>
        </div>
      </div>
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
        desc: '',
        desc2: ''
      }
    },
    mounted() {
      this.name = this.params['name'];
      this.img = this.params['img'];
      this.desc = this.params['desc'];
      this.desc2 = this.params['desc2'];
    }
  }
</script>
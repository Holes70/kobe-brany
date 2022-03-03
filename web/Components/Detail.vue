<template>
<div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    DETAIL
      <h1>{{ this.$route.params.itemId }}</h1>
      {{ data.name }}
</template>

<script>
export default {
  data() {
    return {
      data: {}
    }
  },
  beforeMount() {
    axios.get('Admin/index.php?action=web_get_detail', {
      params: {
        id: 1
      }
    }).then((res) => {
      this.data = res.data['data'];
    })
  }
}
</script>

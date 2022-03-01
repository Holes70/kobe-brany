<template>
<div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    DETAIL
      {{ this.$route.params.itemId }}
</template>

<script>
export default {
  beforeMount() {
    axios.get('index.php?action=get_detail')
    .then((res) => {
      console.log(res);
    })
  }
}
</script>

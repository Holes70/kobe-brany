<template>
<div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    DETAIL
      {{ this.$route.params.itemId }}
</template>

<script>
export default {
  mounted() {
    console.log(this.$route.params.item );
  }
}
</script>

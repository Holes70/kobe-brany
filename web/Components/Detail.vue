<template>
<div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    DETAIL
      <h1>{{ this.$route.params.itemId }}</h1>
      {{ data.name }}

    <div class="container">
      <div :id="'katalog-item-' + data.id">
        <div class="service-item first-service">
          <div class="katalog-item-img">
            <img :src="'http://localhost/holes/kobe-brany/files/products/' + data.image"/>
          </div>
          <h4>{{ data.name }}</h4>
          <h5>{{ data.price }} €</h5>
          <p>{{ data.description }}</p>

          <div class="gold-button">
            <button>Pridať do košíka</button>
          </div>
        </div>
      </div>
    </div>
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

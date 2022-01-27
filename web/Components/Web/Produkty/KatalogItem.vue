<template>
  <div :id="'katalog-item-' + item.id" class="col-lg-3 mb-4">
    <div class="service-item first-service">
      <div class="katalog-item-img">
        <img src="assets/images/brana-1.jpg"/>
      </div>
      <h4>{{ item.name }}</h4>
      <h3>{{ item.price }}€</h3>
      <p>{{ item.description }}</p>
      <div class="text-button">
        <a href="#">Do košíka<i class="fa fa-arrow-right"></i></a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['item']
}
</script>

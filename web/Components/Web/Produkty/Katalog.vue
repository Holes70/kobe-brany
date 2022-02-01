<template>
  <div class="container">
    <div class="row">
      <template v-for="katalogItem in katalogItems" :key="katalogItem">
        <katalog-item-com :item="katalogItem"></katalog-item-com>
      </template>
    </div>
  </div>
</template>

<script>
import katalogItem from './KatalogItem.vue';

export default {
  data() {
    return {
      katalogItems: []
    }
  },
  components: {
    'katalog-item-com': katalogItem
  },
  beforeMount() {
    axios.post('Admin/index.php?action=dia_select', {
      params: {
        tableName: "products",
        conditions: {
          "where": {
            "type": 1
          }
        }
      }
    }).then((res) => {
      this.katalogItems = res.data;
      console.log(res.data);
    })
  }
}
</script>
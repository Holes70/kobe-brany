<template>
  <div class="container">
    <div class="row">
      <template v-for="katalogItem in katalogItems" :key="katalogItem">
        <katalog-item-com :item="katalogItem"></katalog-item-com>
      </template>
    </div>
    <dia-pagination :params="{
      tableName: 'products',
      pages: this.pages,
      conditions:  {'where':{
            'type': 1
          }}
    }"></dia-pagination>
  </div>
</template>

<script>
import katalogItem from './KatalogItem.vue';
import pagination from './../../../../Core/Components/Vue/Pagination4.vue'

export default {
  data() {
    return {
      katalogItems: [],
      pages: 0
    }
  },
  components: {
    'katalog-item-com': katalogItem,
    'dia-pagination': pagination
  },
  beforeMount() {
    axios.post('Admin/index.php?action=dia_select_with_pagination', {
      params: {
        tableName: "products",
        conditions: {
          "where": {
            "type": 1
          }
        }
      }
    }).then((res) => {
      this.katalogItems = res.data['data'];
      this.pages = res.data['pages'];
    })
  }
}
</script>
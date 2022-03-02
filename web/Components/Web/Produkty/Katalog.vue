<template>
  <div class="container">
    <div class="row">
      <template v-for="katalogItem in katalogItems" :key="katalogItem">
        <katalog-item-com :item="katalogItem"></katalog-item-com>
      </template>
    </div>
    <pagination :params="{
      tableName: 'products',
      pages: this.pages,
      conditions:  {'where':{
            'type': 1
          }}
    }"></pagination>
  </div>
</template>

<script>
import katalogItem from './KatalogItem.vue';
import pagination from './Pagination.vue'

export default {
  data() {
    return {
      katalogItems: [],
      pages: 0,
      conditions: {"where":{"type":1}}
    }
  },
  components: {
    'katalog-item-com': katalogItem,
    'pagination': pagination
  },
  methods: {
    loadData() {
      axios.post('Admin/index.php?action=dia_select_with_pagination', {
        params: {
          tableName: "products",
          conditions: this.conditions
        }
      }).then((res) => {
        this.katalogItems = res.data['data'];
        this.pages = res.data['pages'];
      })
    }
  },
  beforeMount() {
    this.loadData();
  }
}
</script>
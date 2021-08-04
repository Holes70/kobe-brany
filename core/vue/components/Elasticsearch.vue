<template>
  <div>
    <div class="form-inline">
      <input 
        class="form-control col-lg-12 mt-5" 
        type="search" 
        placeholder="Search" 
        aria-label="Search"
        v-model="search"
      >
    </div>
    <ul v-for="hit in filteredSearch" :key="hit._id" class="list-group">
      <li class="list-group-item d-flex justify-content-between align-items-center">
        <var v-html="hit.hit">{{ hit.hit }}</var>
        <span class="badge badge-primary badge-pill">{{ hit.id }}</span>
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  data() {
    return {
      search: "",
      count: 0,
      hits: []
    }
  },
  props: ['index'],
  watch: {
    search(val) {
      axios.post('index.php?json_action=dia_elasticsearch_get', {
        search: val,
        index: this.index
      }).then((res) => {
        this.count = res.data['count'];
        this.hits = res.data['hits']
      })
    }
  },
  computed: {
    filteredSearch() {
      return this.hits.map(
        function(hit) { 
          return { 
            hit: "" + hit._source.title + "",
            id: hit._id 
          } 
        }
      );
    }
  },
}
</script>
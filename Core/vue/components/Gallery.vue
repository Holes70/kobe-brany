<template>
  <div class="row">
    <div v-for="item in data" :key="item" class="col-lg-3 col-md-4 col-xs-6 thumb">
      <a href="https://images.pexels.com/photos/38238/maldives-ile-beach-sun-38238.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"  class="fancybox" rel="ligthbox">
        <img src="https://images.pexels.com/photos/38238/maldives-ile-beach-sun-38238.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" class="zoom img-fluid"  alt="">
      </a>
    </div>
  </div>
</template>

<script>
export default {
  props: ['params'],
  data() {
    return {
      data: [],
      tableName: "",
      conditions: [],
    }
  },
  methods: {
    loadData() {
      axios.post('index.php?action=dia_select', {
        params: {
          tableName: this.tableName,
          conditions: this.conditions
        }
      }).then((res) => {
        if (res.data.status != 'fail') {
          this.data = res.data;
        } else {
          this.error = true;
        }
      })
    },
  },
  mounted() {
    this.tableName = this.params['tableName'];
    this.conditions = this.params['conditions'];

    if (this.params['data'].length > 0) {
      this.data = this.params['data'];
    } else {
      this.loadData();
    }
  }
}
</script>

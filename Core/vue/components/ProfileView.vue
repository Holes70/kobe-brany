<template>
  <div v-for='item in data' :key='item.id'>
    <div class='card'>
      <div class='card-body'>
        <div class='d-flex flex-column align-items-center text-center'>
          <img src='profile.jpg' :alt='item.id' class='rounded-circle' width='150'>
          <div class='mt-3'>
            <h4>{{ item.name }}</h4>
            <p v-html="item.description" class='text-secondary mb-1'></p>
            <p v-html="item.description2" class='text-muted font-size-sm'></p>
            <!--<button class='btn btn-primary'>Follow</button>
            <button class='btn btn-outline-primary'>Message</button>-->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      params: {
        type: Object
      }
    },
    data() {
      return {
        data: [],
        tableName: "",
        conditions: []
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
          }
        })
      }
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
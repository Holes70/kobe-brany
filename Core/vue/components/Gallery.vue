<template>
  <div>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <img :src="'http://localhost/holes/dia/files/products/product_1.png'" alt="">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

    <div class="row">
      <div 
        v-for="item in data" :key="item" 
        class="col-lg-3 col-md-4 col-xs-6 thumb"
        >
        <a href="https://images.pexels.com/photos/38238/maldives-ile-beach-sun-38238.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"  class="fancybox" rel="ligthbox">
          <img :src="'http://localhost/holes/dia/files/products/' + item['image']" class="zoom img-fluid"  :alt="item['image']">
        </a>
      </div>
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

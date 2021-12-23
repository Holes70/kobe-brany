<template>
  <div>

    <!-- Modal -->    
    <div class="modal fade bd-example-modal-lg" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body text-center">
            <img :src="'http://localhost/holes/dia/files/products/' + itemEdit['image']" :alt="itemEdit['image']">
          </div>
        </div>
      </div>
    </div>

    <div class="row">
      <div 
        v-for="item in data" :key="item" 
        class="col-lg-3 col-md-4 col-xs-6 thumb"
        >
        <div @click="edit(item)" data-toggle="modal" data-target="#exampleModalCenter" class="fancybox" rel="ligthbox">
          <div class="dia-image">
            <img :src="'http://localhost/holes/dia/files/products/' + item['image']" class="zoom img-fluid"  :alt="item['image']">
            <button 
              @click="deleteItem(item.id)"
              class="btn btn-danger btn-image-delete text-center"
            >
              <i class="fas fa-trash-alt color-red-dark"/>
            </button>
          </div>
        </div>
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
      itemEdit: []
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
    edit(item) {
      this.itemEdit = item;
    },
    deleteItem(itemId) {
      dia.itemDelete(
        this.tableName, 
        itemId,
        function () {
          window.location.reload();
        }
      );
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

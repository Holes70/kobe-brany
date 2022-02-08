<template>
  
  <!-- Modal -->
    <div class="modal fade bd-example-modal-lg" id="test" tabindex="-1" role="dialog" aria-labelledby="testTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Nový záznam (<var class="color-primary">{{ componentUid }}</var>)</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="model-img modal-body text-center">
            <dia-form2 :params='{
              tableName: this.tableName,
              conditions: this.conditions,
              data: this.data
            }'></dia-form2>
          </div>
        </div>
      </div>
    </div>
    <!-- End modal -->

    <button 
      type="button" 
      data-toggle="modal" 
      data-target="#test" 
      :class="'btn mb-2 mb-md-0 btn-block mr-5 btn-' + button" 
      style="width:200px"
    >
      <span>{{ title }}</span> 
      <div class="icon d-flex align-items-center justify-content-center">
        <i class="far fa-bell"></i>
      </div>
    </button>

</template>

<script>

var diaButton = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaButton, {
    })
  },
  beforeCreate() {
    diaButton = new Dia();
  },
  beforeMount() {
    this.title = this.params['title'];
    this.button = this.params['button'];

    diaButton.setComponentParams(this);

    this.componentUid += '-' + this._.uid;
    console.log(this._.uid);
  }
}

</script>
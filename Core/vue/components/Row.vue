<template>
  <div :id="componentName">
    <!-- Modal -->
    <div class="modal fade bd-example-modal-lg" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Nový záznam (<var class="color-primary">{{ tableName }}</var>)</h5>
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

    <div class="row float-right m-1">
      <button data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary">Pridať záznam</button>
    </div>
    <div class="clearfix"></div>
  </div>
</template>

<script>
var diaRow = Object();

import diaForm from './Form2.vue';

export default {
  components: {
    'dia-form2': diaForm
  },
  props: ['params'],
  data() {
    return Object.assign(diaRow, {
      componentName: "row"
    });
  },
  beforeCreate() {
    diaRow = new Dia();
  },
  beforeMount() {
    diaRow.setComponentParams(this);
  }
}
</script>
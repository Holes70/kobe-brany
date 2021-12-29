<template>
  <div :id="componentName">
    <div class="row float-right m-1">
      <button class="btn btn-primary">Pridať záznam</button>
    </div>
    <div class="clearfix"></div>
  </div>
</template>

<script>
var diaRow = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaRow, {
      componentName: "row"
    });
  },
  beforeCreate() {
    diaRow = new Dia();
  },
  mounted() {
    diaRow.setComponentParams(this);
  }
}
</script>
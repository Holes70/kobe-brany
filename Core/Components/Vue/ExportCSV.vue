<template>
  <button 
    type="button" 
    :class="'btn mb-2 mb-md-0 btn-block mr-5 btn-' + button"
  >
    <span>{{ title }}</span> 
    <div class="icon d-flex align-items-center justify-content-center">
      <i :class="icon"></i>
    </div>
  </button>
</template>

<script>

var diaExportCsv = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaExportCsv, {
    })
  },
  beforeCreate() {
    diaExportCsv = new Dia();
  },
  beforeMount() {
    f.setComponentParams(this);

    diaExportCsv.setComponentParams(this);
  }
}

</script>
<template>
  <div v-for="itemData in data" :key="itemData" class="card">
    xxx
  </div>
</template>

<script>

var diaCardlist = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaCardlist, {
    })
  },
  beforeCreate() {
    diaCardlist = new Dia();
  },
  beforeMount() {
    diaCardlist.setComponentParams(this);
    diaCardlist.setComponentData(this);
    diaCardlist.loadTableStructure(this);
  }
}

</script>
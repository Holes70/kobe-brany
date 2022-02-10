<template>
  <div v-for="itemData in data" :key="itemData" class="card p-1 m-1">
    <div class="row">
      <div v-for="item in itemData" :key="item.id" class="col">
        {{ item }}
      </div>
      <div class="col">
        <i class="far fa-trash-alt icon-danger"></i>
      </div>
    </div>
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
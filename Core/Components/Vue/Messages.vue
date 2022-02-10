<template>
  <div class="card messages-header p-1 m-1">
    <div class="row">
      <div v-for="col in tableColumns" :key="col" class="col">
        {{ col }}
      </div>
      <div class="col">
        Vymazať
      </div>
    </div>
  </div>
  <div v-for="itemData in data" :key="itemData" class="card message-card p-1 m-1">
    <div class="row">
      <template v-for='(item, colName) in itemData' :key='colName'>
        <div v-if="getStructureValue(colName, 'show_in_table')" class="col">
          {{ item }}
        </div>
      </template>
      <div class="col">
        <i class="far fa-trash-alt icon-danger"></i>
      </div>
    </div>
  </div>
</template>

<script>

var diaMessages = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaMessages, {
    })
  },
  methods: {
    getStructureValue(colName, structureParam, defaultReturnParam, addItallic = false) {
      return diaTables.getStructureValue(
        colName, 
        structureParam, 
        defaultReturnParam, 
        this.tableStructure, 
        addItallic
      );
    },
  },
  beforeCreate() {
    diaMessages = new Dia();
  },
  beforeMount() {
    diaMessages.setComponentParams(this);
    diaMessages.setComponentData(this);
    diaMessages.loadTableStructure(this);
  }
}

</script>
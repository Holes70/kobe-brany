<template>
  <div v-if="editData.length == 0" :id="componentUid + '_cards'">
    <div class="card messages-header p-1 m-1">
      <div class="row">
        <div v-for="col in tableColumns" :key="col" class="col text-left">
          {{ col }}
        </div>
        <div class="col">
        </div>
      </div>
    </div>
    <div v-for="itemData in data" :key="itemData" class="card message-card p-1 m-1">
      <div @click="openMessage(itemData)" class="row">
        <template v-for='(item, colName) in itemData' :key='colName'>
          <div v-if="getStructureValue(colName, 'show_in_table')" class="col text-left">
            {{ item }}
          </div>
        </template>
        <div class="col">
          <i class="far fa-trash-alt icon-danger"></i>
        </div>
      </div>
    </div>
  </div>
  <div v-else :id="componentUid + '_opened'">
    <div class="card">
      <div class="card-header row p-1" style="margin:0px">
        <div class="col-1">
          <button @click="editData = [];sendAnswer = false" class='btn btn-primary'>
            <i class="fas fa-arrow-left color-secondary" aria-hidden="true"></i>
          </button>
        </div>
        <div class="col">
          <h4>{{ editData.subject }}</h4>
        </div>
      </div>
      <div class="card-body">
        <p class="card-text">{{ editData.body }}</p>
        <template v-if="sendAnswer">
          <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
          <button class="btn btn-primary mt-3">Poslať odpovedať</button>
        </template>
        <button v-else @click="sendAnswer = true" class="btn btn-primary">Odpovedať</button>
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
      editData: [],
      sendAnswer: false
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
    openMessage(itemData) {
      this.editData = itemData;
    }
  },
  beforeCreate() {
    diaMessages = new Dia();
  },
  beforeMount() {
    diaMessages.setComponentParams(this);
    diaMessages.setComponentData(this, "dia_get_messages");
    diaMessages.loadTableStructure(this);
  }
}

</script>
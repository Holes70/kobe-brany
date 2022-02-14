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
            <template v-if="getStructureValue(colName, 'type') == 'checkbox'">
              <template v-if="item == '1'" >
                <i class="far fa-eye color-grey"></i>
              </template>
              <template v-else>
                <i class="far fa-eye-slash color-grey"></i>
              </template>
            </template>
            <template v-else>
              {{ item }}
            </template>
          </div>
        </template>
        <div class="col">
          <i @click="deleteItem(itemData.id)" class="far fa-trash-alt icon-danger"></i>
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
        <template v-if="editData.id_answer != 0">
          <div class="row">
            <div class="col-4 text-left">
              <b>Vy</b> ste odpovedal:
            </div>
            <div class="col-8 text-right color-grey">
              {{ editData.timestamp }}
            </div>
          </div>
          <p class="card-text text-left">{{ editData.body }}</p>
          <hr/>
        </template>
        <div class="row">
          <div class="col-4 text-left">
            <b>{{ editData.sender }}</b> napísal:
          </div>
          <div class="col-8 text-right color-grey">
            {{ editData.timestamp }}
          </div>
        </div>
        <p class="card-text text-left">{{ editData.body }}</p>
        <template v-if="sendAnswer">
          <textarea v-model="answer" class="form-control" rows="3"></textarea>
          <button @click="sendAnswerFunc(editData)" class="btn btn-primary mt-3">Poslať odpovedať</button>
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
      sendAnswer: false,
      answer: ""
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
    },
    deleteItem(rowId) {
      window.event.cancelBubble = true;

      diaMessages.itemDelete(
        this.tableName,
        rowId,
        () => {
          diaMessages.loadData(this, "dia_get_messages");
        }
      );
    },
    sendAnswerFunc(editData) {
      var data = editData;
      data['answer'] = this.answer;

      axios.post('index.php?action=dia_post_message_answer', {
        tableName: this.tableName,
        rowId: data.id,
        data: data
      }).then((res) => {
        console.log(res);
      })
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
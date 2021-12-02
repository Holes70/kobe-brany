<template>
  <div>
    <table v-show='!showEdit' class="table table-hover">
      <thead>
        <tr>
          <th v-for="col in tableColumns" :key="col" scope="col">{{ col }}</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for='itemData in data' :key='itemData.id' @click="edit(itemData['id'])" style='cursor:pointer'>
          <template v-for='(item, colName) in itemData'>
            <td :key='colName' v-show='checkBeforeRender(item, colName)'>{{ checkBeforeRender(item, colName) }}</td>
          </template>
        </tr>
      </tbody>
    </table>
    <div v-show='showEdit' class='card' style='height:750px;width:100%;'>
        <p class="card-header">
          <button @click='showEdit = !showEdit' class='btn'>
            <i class="fas fa-arrow-left" aria-hidden="true"></i>
          </button>
        </p>
        <div class="card-body">
          <template v-for='itemData in data'>
            <div v-if="itemData['id'] == showEditId" :key='itemData.id'>
              <div v-for='(item, colName) in itemData' :key='colName' class="form-group row">
                <label :for="colName" class="col-sm-2 col-form-label">{{ colName }}</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" :id="colName" :value="item">
                </div>
              </div>
            </div>
          </template>
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
        tableColumns: {},
        tableColumnsKeys: [],
        formColumns: [],
        tableStructure: [],
        showEdit: false,
        showEditId: 0,
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
          }
        })
      },
      checkBeforeRender(item, colName) {
        if (this.checkIfShowInTable(colName)) {
          // ak je v tabulke HODNOTA null tak vrat ' ' inak chybuje tabulka
          if (item) return item;
          else return ' ';
        }
      },
      /**
       * Nacitavanie struktury tabulky
       * TODO: Spravit to nejako dynamicky pre kazdu tabulku
       */
      checkIfShowInTable(colName) {
        if (this.tableStructure[colName]) {
          if (this.tableStructure[colName]['show_in_table']) {
            return true;
          }
        }
      },
      edit(showEditId) {
        this.showEdit = true;
        this.showEditId = showEditId;
      },
      loadTableStructure() {
        axios.post('index.php?action=dia_select&reset=true&unset=structure&json=true', {
          params: {
            tableName: "dia_tables",
            conditions: this.conditions
          }
        }).then((res) => {
          if (res.data.status != 'fail') {
            this.tableStructure = res.data;
            
            // Vytvara mena stlpcov podla dia_table
            // show_in_table == true tak vypise
            // name_in_table - nazov pre zobrazenie
            // TODO: Data to neajko pekne von
            var cols = {};
            this.tableColumnsKeys = Object.keys(this.tableStructure);
            this.tableColumnsKeys.forEach((item) => {
              if (this.tableStructure[item]['show_in_table']) {
                cols[item] = this.tableStructure[item]['name_in_table'];
              }
            });
            this.tableColumns = cols;
          }
        })
      }
    },
    mounted() {
      this.tableName = this.params['tableName'];
      this.conditions = this.params['conditions'];

      this.tableColumns = this.params['tableColumns'];
      this.formColumns = this.params['formColumns'];

      if (this.params['data'].length > 0) {
        this.data = this.params['data'];
      } else {
        this.loadData();
      }

       this.loadTableStructure();
    }
  }
</script>
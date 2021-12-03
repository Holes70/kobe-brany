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
            <td :key='colName' v-show="checkBeforeRender(item, colName, 'show_in_table')">{{ item }}</td>
          </template>
        </tr>
      </tbody>
    </table>
    
    <div v-show='showEdit' class='card' style='height:750px;width:100%;'>
      <template v-for='itemData in data'>
        <div v-if="itemData['id'] == showEditId" :key='itemData.id' class="row ml-1 mr-1" style="background:#0a6c91;padding:10px">
          <div class="col-8">
            <button @click='showEdit = !showEdit' class='btn btn-danger'>
              <i class="fas fa-arrow-left" aria-hidden="true"></i>
            </button>
          </div>
          <div class="col-2">
            <button @click="save(itemData)" class='btn btn-success'>
              Ulozit
            </button>
          </div>
          <div class="col-2">
            <button @click="deleteItem(itemData['id'])" class='btn btn-danger'>
              Vymazat
            </button>
          </div>
        </div>
      </template>
      <div class="card-body">
        <template v-for='itemData in data'>
          <div v-if="itemData['id'] == showEditId" :key='itemData.id'>
            <template v-for='(item, colName) in itemData'>
              <div :key='colName' v-show="checkBeforeRender(item, colName, 'show_in_form')" class="form-group row">
                <label :for="colName" v-html="checkBeforeRenderReturnValue(tableColumns[colName], colName, 'show_in_form')" class="col-sm-2 col-form-label"/>
                <div class="col-sm-9">
                  <div class="input-group mb-2">
                    <div v-if="checkBeforeRender(item, colName, 'required')" class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="fas fa-exclamation"></i>
                      </div>
                    </div>
                    <input :type="getStructureValue(colName, 'type', 'text')" class="form-control" :id="colName" v-model="itemData[colName]">
                  </div>
                </div>
              </div>
            </template>
          </div>
        </template>
      </div>
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
      checkBeforeRender(item, colName, structureParam) {
        if (this.checkIfShowInTable(colName, structureParam)) {
          // ak je v tabulke HODNOTA null tak vrat ' ' inak chybuje tabulka
          if (item) return item;
          else return ' ';
        }
      },
      checkBeforeRenderReturnValue(item, colName, structureParam) {
        if (this.checkIfShowInTable(colName, structureParam)) {
          // ak je v tabulke HODNOTA null tak vrat ' ' inak chybuje tabulka
          if (item) return item;
          else return "<i color='green'>" + colName + "</i>";
        }
      },
      getStructureValue(colName, structureParam, defaultReturnParam) {
        if (this.tableStructure[colName]) {
          if (this.tableStructure[colName][structureParam]) {
            if (this.tableStructure[colName][structureParam]) return this.tableStructure[colName][structureParam];
            else return defaultReturnParam;
          }
        }
      },
      /**
       * Nacitavanie struktury tabulky
       * TODO: Spravit to nejako dynamicky pre kazdu tabulku
       */
      checkIfShowInTable(colName, structureParam) {
        if (this.tableStructure[colName]) {
          if (this.tableStructure[colName][structureParam]) {
            return true;
          }
        }
      },
      edit(showEditId) {
        this.showEdit = true;
        this.showEditId = showEditId;
      },
      save(itemData) {
        axios.put('index.php?action=dia_vue_update', {
          params: {
            tableName: this.tableName,
            rowId: itemData['id'],
            data: itemData
          }
        }).then(() => {
          this.showEdit = false;
          swal({
            title: "Uložené",
            type: "success",
            timer: 600,
            showConfirmButton: false
          })
        })
      },
      deleteItem(rowId) {
        var table = this;
        swal({
          title: "Ste si istý?",
          text: "Naozaj chcete vymazať tento záznam?",
          type: "warning",
          showCancelButton: true,
          cancelButtonClass: "btn btn-secondary",
          confirmButtonClass: "btn btn-danger",
          confirmButtonText: "Áno",
          cancelButtonText: "Nie",
          closeOnConfirm: false,
          closeOnCancel: false,
        },
        function(isConfirm) {
          if (isConfirm) {
            axios.post('index.php?action=dia_delete', {
              tableName: table.tableName,
              id: rowId
            })
            swal({
              title: "Vymazané",
              text: "Záznam bol vymazaný!",
              type: "success"
            })
            table.loadData();
            table.showEdit = false;
          } else {
            swal("Zrušené", "Záznam nebol vymazaný!", "warning") 
          }
        });
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
            var formCols = {};
            this.tableColumnsKeys = Object.keys(this.tableStructure);
            this.tableColumnsKeys.forEach((item) => {
              if (this.tableStructure[item]['show_in_table']) {
                cols[item] = this.tableStructure[item]['name_in_table'];
              }
              if (this.tableStructure[item]['show_in_form']) {
                formCols[item] = this.tableStructure[item]['name_in_table'];
              }
            });
            this.tableColumns = cols;
            this.formColumns = formCols;
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
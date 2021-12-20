<template>
  <div>
    <template v-if="!error">
      <table v-show='!showEdit' class="table table-hover">
        <thead>
          <tr>
            <th v-for="col in tableColumns" :key="col" scope="col">{{ col }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for='itemData in data' :key='itemData.id' @click="edit(itemData['id'])" style='cursor:pointer'>
            <template v-for='(item, colName) in itemData'>
              <td :key='colName' v-show="checkBeforeRender(item, colName, 'show_in_table')">
                <template v-if="getStructureValue(colName, 'type', '') == 'checkbox'">
                  <template v-if="item == '1'" >
                    <i class="fas fa-check"></i>
                  </template>
                  <template v-else>
                    <i style='color:red' class="fas fa-times"></i>
                  </template>
                </template>
                <template v-else-if="getStructureValue(colName, 'type', '') == 'lookup'">
                  <a :href="getStructureValue(colName, 'lookup_url', '') + '?id=' + itemData.id">
                    <i style='font-size:20px' class="fas fa-clipboard-list"></i>
                  </a>
                </template>
                <template v-else-if="getStructureValue(colName, 'type', 'text') != 'image'">
                  {{ item }} {{ getStructureValue(colName, 'unit', '') }}
                </template>
                <template v-else>
                  <img :src="'http://localhost/holes/dia/files/'  + this.tableName + '/' + itemData['image']" width="35" height="35"/>
                </template>
              </td>
            </template>
          </tr>
        </tbody>
      </table>
      
      <div v-show='showEdit' class='card' style='height:750px;width:100%;'>
        <template v-for='itemData in data'>
          <div v-if="itemData['id'] == showEditId" :key='itemData.id' class="card-header row p-1" style="margin:0px">
            <div class="col-8">
              <button @click='hideEdit()' class='btn btn-primary'>
                <i class="fas fa-arrow-left color-secondary" aria-hidden="true"></i>
              </button>
            </div>
            <div v-for="button in buttons" :key="button" class="col">
              <a :href="button['link'] + '?id=' + itemData['id'] + '&previous_page=' + diaData.currentWebPage + '&previous_page_id_form=' + itemData['id']" class='btn btn-warning'>
                {{ button['name'] }}
              </a>
            </div>
            <div class="col-md-3 col-sm-4 col-lg-2">
              <button @click="save(itemData)" class='btn btn-success'>
                <i class="far fa-save color-success"></i>
              </button>
              <button @click="deleteItem(itemData['id'])" class='btn btn-danger ml-3'>
                <i class="fas fa-trash-alt color-red-dark"></i>
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
                          <i class="fas fa-exclamation" :class="classObjectRequired(colName)"></i>
                        </div>
                      </div>
                      <template v-if="getStructureValue(colName, 'type', '') == 'checkbox'">
                        <template v-if="item == 1">
                          <input :type="getStructureValue(colName, 'type', 'text')" class="form-control" :id="colName" v-model="itemData[colName]" checked/>
                        </template>
                        <template v-else>
                          <input :type="getStructureValue(colName, 'type', 'text')" class="form-control" :id="colName" v-model="itemData[colName]"/>
                        </template>
                      </template>
                      <template v-else-if="getStructureValue(colName, 'type', '') != 'image'">
                        <input :type="getStructureValue(colName, 'type', 'text')" :class="classObject(colName)" :id="colName" v-model="itemData[colName]"/>
                      </template>
                      <template v-else>
                        <div>
                          <img :src="'http://localhost/holes/dia/files/' + this.tableName + '/' + itemData['image']" width="100" height="100"/>
                        </div>
                      </template>
                    </div>
                  </div>
                </div>
              </template>
            </div>
          </template>
        </div>
      </div>
    </template>
    <template v-else>
      <div class="text-center" style="margin-top:20%">
        <h1 style='color:grey'>{{ emptyDataMessage }}</h1>
      </div>
    </template>
  </div>
</template>

<script>
  export default {
    props: ['params'],
    data() {
      return {
        data: [],
        recoveryData: [],
        tableName: "",
        conditions: [],
        tableColumns: {},
        tableColumnsKeys: [],
        formColumns: [],
        tableStructure: [],
        showEdit: false,
        showEditId: 0,
        error: false,
        emptyDataMessage: 'No records',
        diaData: dia,
        emptyRequiredInputs: []
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
          } else {
            this.error = true;
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
        dia.addToUrl('id_form', showEditId);
        this.recoveryData = this.data;
      },
      hideEdit() {
        this.showEdit = false;
        dia.deleteFromUrl('id_form');
      },
      save(itemData) {
        // Prever prazdne povinne polia
        this.emptyRequiredInputs = dia.checkRequiredInputs(itemData, this.tableStructure);

        if (this.emptyRequiredInputs.length < 1) {
          axios.put('index.php?action=dia_vue_update', {
            params: {
              tableName: this.tableName,
              rowId: itemData['id'],
              data: itemData
            }
          }).then(() => {
            this.showEdit = false;
            dia.deleteFromUrl('id_form');
            swal({
              title: "Uložené",
              type: "success",
              timer: 600,
              showConfirmButton: false
            })
          })
        }
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
            conditions: {
              "where": {
                "table_name": this.tableName
              }
            }
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
      },
      classObject(item) {
        return {
          'form-control' : true,
          'required': this.emptyRequiredInputs.includes(item)
        }
      },
      classObjectRequired(item) {
        return {
          'requiredColor': this.emptyRequiredInputs.includes(item)
        }
      },
    },
    mounted() {
      this.tableName = this.params['tableName'];
      this.conditions = this.params['conditions'];

      this.tableColumns = this.params['tableColumns'];
      this.formColumns = this.params['formColumns'];

      this.buttons = this.params['buttons'];
      this.emptyDataMessage = 
        this.params['emptyDataMessage'] 
        ? this.params['emptyDataMessage'] 
        : 'No records'
      ;

      if (this.params['data'].length > 0) {
        this.data = this.params['data'];
      } else {
        this.loadData();
      }

      if (dia.getUrlParam('id_form') > 0) {
        this.showEdit = true;
        this.showEditId = dia.getUrlParam('id_form');
      }

      this.loadTableStructure();
    }
  }
</script>
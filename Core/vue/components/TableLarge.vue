<template>
  <div :id="componentName">
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
                  <a 
                    onclick="window.event.cancelBubble = true" 
                    :href="getStructureValue(colName, 'lookup_url', '') + '?id_form=' + itemData.id"
                    class="lookup-icon"
                  >
                    <i style='font-size:20px' :class="'fas fa-' + getStructureValue(colName, 'lookup_icon', 'clipboard-list')"></i>
                  </a>
                </template>
                <template v-else-if="getStructureValue(colName, 'type', 'text') != 'image'">
                  {{ item }} {{ getStructureValue(colName, 'unit') }}
                </template>
                <template v-else>
                  <img :src="'http://localhost/holes/dia/files/'  + this.fileDir + '/' + itemData['image']" width="35" height="35"/>
                </template>
              </td>
            </template>
          </tr>
        </tbody>
      </table>
      
      <div v-show='showEdit' class='card' style='height:750px;width:100%;'>
        <template v-for='itemData in data'>
          <div v-if="itemData['id'] == showEditId" :key='itemData.id' class="card-header row p-1" style="margin:0px">
            <div class="col">
              <button @click='hideEdit()' class='btn btn-primary'>
                <i class="fas fa-arrow-left color-secondary" aria-hidden="true"></i>
              </button>
            </div>
            <div class="col">
              <a 
                v-for="button in buttons" 
                :key="button" 
                :href="getButtonHref(button, itemData)" 
                :class="buttonClass(button)"
                class="ml-3"
              >
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
                  <label 
                    :for="colName" 
                    v-html="getStructureValue(colName, 'name_in_table', '', true)" 
                    class="col-sm-2 col-form-label"
                  />
                  <div class="col-sm-9">
                    <div class="input-group mb-2">
                      <div v-if="checkBeforeRender(item, colName, 'required')" class="input-group-prepend">
                        <div class="input-group-text">
                          <i class="fas fa-exclamation" :class="classObjectRequired(colName)"></i>
                        </div>
                      </div>
                      <template v-if="getStructureValue(colName, 'type', '') == 'checkbox'">
                        <input 
                          type="checkbox" 
                          class="form-checkbox" 
                          :id="colName" 
                          v-model="itemData[colName]" 
                          :checked="item == 1"
                        />
                      </template>
                      <template v-else-if="getStructureValue(colName, 'type', '') == 'radio'">
                        <div class="mr-3 mt-2" v-for="(radioItem, index) in getStructureValue(colName, 'radio')" :key="radioItem">
                          <input 
                            type="radio" 
                            :id="index" 
                            :name="colName" 
                            :value="index" 
                            v-model="itemData[colName]" 
                            :checked="item == index"
                          />
                          <label :for="index" class="ml-1">{{ radioItem }}</label>
                        </div>
                      </template>
                      <template v-else-if="getStructureValue(colName, 'type') == 'lookup'">
                        {{ getLookupColumns(itemData, colName) }}
                        <a 
                          onclick="window.event.cancelBubble = true" 
                          :href="getStructureValue(colName, 'lookup_url', '') + '?id_form=' + itemData.id"
                          class="lookup-icon"
                        >
                          <i style='font-size:20px' :class="'fas fa-' + getStructureValue(colName, 'lookup_icon', 'clipboard-list')"></i>
                        </a>
                      </template>
                      <template v-else-if="getStructureValue(colName, 'type', '') != 'image'">
                        <input 
                          :type="getStructureValue(colName, 'type', 'text')" 
                          class="form-control" 
                          :class="classObject(colName)" 
                          :id="colName" 
                          v-model="itemData[colName]"
                        />
                        <div v-if="getStructureValue(colName, 'unit')" class="input-group-append">
                          <span class="input-group-text">{{ getStructureValue(colName, 'unit') }}</span>
                        </div>
                      </template>
                      <template v-else>
                        <div>
                          <img :src="'http://localhost/holes/dia/files/' + this.fileDir + '/' + itemData['image']" width="100" height="100"/>
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
  var diaTableLarge = Object();

  export default {
    props: ['params'],
    data() {
      return Object.assign(diaTableLarge, {
        componentName: "tablelarge",
        showEdit: false,
        showEditId: 0,
        error: false,
        emptyDataMessage: 'No records',
        emptyRequiredInputs: [],
        lookups: []
      })
    },
    methods: {    
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
      getStructureValue(colName, structureParam, defaultReturnParam, addItallic = false) {
        return diaTables.getStructureValue(
          colName, 
          structureParam, 
          defaultReturnParam, 
          this.tableStructure, 
          addItallic
        );
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
        diaTableLarge.addToUrl('id_form', showEditId);
        diaTableLarge.refactorCustomLinks(this);
        this.recoveryData = this.data;
      },
      hideEdit() {
        this.showEdit = false;
        diaTableLarge.deleteFromUrl('id_form');
        diaTableLarge.loadDataAgain(this);
      },
      save(itemData) {
        // Prever prazdne povinne polia
        this.emptyRequiredInputs = diaTableLarge.checkRequiredInputs(itemData, this.tableStructure);

        if (this.emptyRequiredInputs.length < 1) {
          axios.put('index.php?action=dia_vue_update', {
            params: {
              tableName: this.tableName,
              rowId: itemData['id'],
              data: itemData
            }
          }).then(() => {
            this.showEdit = false;
            diaTableLarge.deleteFromUrl('id_form');
            diaTableLarge.loadDataAgain(this);
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
        diaTableLarge.itemDelete(
          this.tableName,
          rowId,
          () => {
            diaTableLarge.loadData(this);
            this.showEdit = false;
          }
        );
      },
      classObject(item) {
        return diaTables.validateInput(this, item);
      },
      classObjectRequired(item) {
        return {
          'requiredColor': this.emptyRequiredInputs.includes(item)
        }
      },
      buttonClass(button) {
        if (typeof button['class'] != "undefined") {
          return button['class'];
        } else {
          return "btn btn-primary";
        }
      },
      getButtonHref(button, itemData) {
        if (typeof button['customLink'] != "undefined") {
          return button['customLink'];
        } else {
          return button['link'] + '?id=' + itemData['id'] + '&previous_page=' + this.currentWebPage + '&previous_page_id_form=' + itemData['id'];
        }
      },
      getLookupColumns(itemData, colName) {
        var lookupTable = this.getStructureValue(colName, 'lookup_table');
        var lookupTableCol = this.getStructureValue(colName, 'lookup_table_col');
        var lookupColumns = this.getStructureValue(colName, 'lookup_columns');
        var responsex = [];

        var obj = {};
        obj[lookupTableCol] = itemData[colName];
        var xxx;

        axios.post('index.php?action=dia_select', {
          params: {
            tableName: lookupTable,
            conditions: {
              "where": obj
            }
          }
        }).then((res) => {
         // return res.data[0];
          //xxx = res.data[0]['id'];
           //console.log(res.data[0]['id']);
          if (res.data.status != "fail") {
            this.lookups = res.data[0];
          } else {
            this.lookups = [];
          }
        })
       // console.log(this.lookups );
        /*Object.keys(response).forEach((key) => {
          console.log('x');
        })
        var returnValues = "";
        if (typeof lookupColumns != "undefined") {
          Object.values(lookupColumns).forEach((item) => {
            returnValues += itemData[item] + " ";
          })
        }*/

        //return itemData[colName] + lookupTable;
        //return this.lookups;

        return 1;
      }
    },
    beforeCreate() {
      diaTableLarge = new Dia();
    },
    mounted() {
      diaTableLarge.setComponentParams(this);
      diaTableLarge.setComponentData(this);
      diaTableLarge.loadTableStructure(this);


      // Custom Component functions
      if (diaTableLarge.getUrlParam('id_form') > 0) {
        this.showEdit = true;
        this.showEditId = diaTableLarge.getUrlParam('id_form');
      }

      this.buttons = this.params['buttons'];
      this.emptyDataMessage = 
        this.params['emptyDataMessage'] 
        ? this.params['emptyDataMessage'] 
        : 'No records'
      ;
    }
  }
</script>
<template>
  <div :id="componentName">
    <form 
      @submit="checkRequiredsInputs"
      action="index.php?action=dia_insert_post" 
      method="POST"
      enctype="multipart/form-data"
    > 
      <div class="card">
        <div class="card-body">
          <div v-for="(colVal, colName) in allTableColumns" :key="colName" class="form-group row">
            <label 
              v-html="getStructureValue(colName, 'name_in_table', colName, true)"
              :for="'form_' + this.tableName + colName"
              class="col-sm-2 col-form-label" 
            />
            <div class="col-sm-9">
              <div class="input-group mb-2">
                <div v-if="getStructureValue(colName, 'required')" class="input-group-prepend">
                  <div class="input-group-text">
                    <i class="fas fa-exclamation"></i>
                  </div>
                </div>
                <template v-if="getStructureValue(colName, 'type') == 'checkbox'">
                  <input 
                    type="checkbox"
                    class="form-checkbox"
                    :class="validateInput(colName)"
                    :name="colName" 
                    :id="'form_' + this.tableName + colName"
                    :value="formValues[colName]" 
                    :checked="getStructureValue(colName, 'default_value') == 1"
                  />
                </template>
                <template v-else-if="getStructureValue(colName, 'type') == 'radio'">
                  <div class="mr-3" v-for="(radioItem, index) in getStructureValue(colName, 'radio', '')" :key="radioItem">
                    <input 
                      type="radio" 
                      :id="'form_' + this.tableName + colName" 
                      :name="colName" 
                      :value="index"
                      :class="validateInput(colName)"
                      v-model="formValues[colName]" 
                      :checked="getStructureValue(colName, 'default_value') == index"
                    />
                    <label :for="index" class="ml-1">{{ radioItem }}</label>
                  </div>
                </template>
                <template v-else-if="getStructureValue(colName, 'type') == 'image'">
                  <input 
                    type="file" 
                    :id="'form_' + this.tableName + colName"
                    :name="colName"
                  />
                </template>
                <template v-else>
                  <input 
                    :placeholder="getStructureValue(colName, 'name_in_table', colName)"
                    :type="getStructureValue(colName, 'type', colName)"
                    :name="colName"  
                    class="form-control"
                    :class="validateInput(colName)" 
                    :id="'form_' + this.tableName + colName"
                    v-model="formValues[colName]"
                  />
                </template>
              </div>
            </div>
          </div>
        </div>
        <div class="card-footer text-center">
          <input type="hidden" name="tableName" :value="tableName"/>
          <input 
            type="submit" 
            class="btn btn-primary"
            value="Vytvoriť"
          />
        </div>
      </div>
    </form>
  </div>
</template>

<script>
var diaForm = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaForm, {
      uploadAction: "",
      componentName: "form2"
    });
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
    checkRequiredsInputs(e) {
      diaTables.checkRequiredsInputs(e, this);
    },
    validateInput(item) {
      return diaTables.validateInput(this, item);
    }
  },
  beforeCreate() {
    diaForm = new Dia();
  },
  mounted() {
    diaForm.setComponentParams(this);
    diaForm.loadTableStructure(this, true);
  }
}
</script>


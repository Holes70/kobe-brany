<template>
  <div>
    <div class="card">
      <div class="card-body">
        <div v-for="(colVal, colName) in tableColumns" :key="colName" class="form-group row">
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
              <input 
                :placeholder="getStructureValue(colName, 'name_in_table', colName)"
                :type="getStructureValue(colName, 'type', colName)" 
                class="form-control" 
                :id="'form_' + this.tableName + colName"
              />
            </div>
          </div>
        </div>
        <!--<div class="form-group row">
          <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
          </div>
        </div>
        <fieldset class="form-group">
          <div class="row">
            <legend class="col-form-label col-sm-2 pt-0">Radios</legend>
            <div class="col-sm-10">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
                <label class="form-check-label" for="gridRadios1">
                  First radio
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
                <label class="form-check-label" for="gridRadios2">
                  Second radio
                </label>
              </div>
              <div class="form-check disabled">
                <input class="form-check-input" type="radio" name="gridRadios" id="gridRadios3" value="option3" disabled>
                <label class="form-check-label" for="gridRadios3">
                  Third disabled radio
                </label>
              </div>
            </div>
          </div>
        </fieldset>
        <div class="form-group row">
          <div class="col-sm-2">Checkbox</div>
          <div class="col-sm-10">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" id="gridCheck1">
              <label class="form-check-label" for="gridCheck1">
                Example checkbox
              </label>
            </div>
          </div>
        </div>
        <div class="form-group row">
          <div class="col-sm-10">
            <button type="submit" class="btn btn-primary">Sign in</button>
          </div>
        </div>-->
      </div>
      <div class="card-footer text-center">
        <button class="btn btn-primary">Vytvoriť</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['params'],
  data() {
    return Object.assign(dia, {

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
    }
  },
  mounted() {
    dia.setComponentParams(this);
    dia.loadTableStructure(this);
  }
}
</script>


 <template> 
  <div>
    <div v-if="errors.length">
      <div v-for="error in errors" :key='error'>
        <p>{{ error }}</p>
      </div>
    </div>
    <form>
      <div v-for="(input, index) in inputs" :key="index" class='form-group row'>
        <template v-if="showInputs.length != 0">
          <template v-if="showInputs[index]">
            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">{{ showInputs[index] }}</label>
            <span v-if="requiredInputs.includes(index)">*</span>
            <div class="col-sm-10">
              <input v-model='inputs[index]' :id='index' type='text' class='form-control'>
            </div>
          </template>
        </template>
        <template v-else>
          <template v-if="index != 'id'">
            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">{{ index }}</label>
            <span v-if="requiredInputs.includes(index)">*</span>
            <div class="col-sm-10">
              <input v-model='inputs[index]' :id='index' type='text' class='form-control'>
            </div>
          <template>
        </template>
      </div>
    </form>
    <button class="btn btn-primary" @click='addForm()'>Pridať záznam</button>
  </div>
</template>

<script>

  module.exports = {
    props: ['form_params'],
    data() {
      return {
        inputs: [],
        showInputs: [],
        table_name: '',
        requiredInputs: [],
        errors: []
      };
    },
    methods: {
      validateRequiredInputs() {
        this.requiredInputs.forEach(input => {
          if (this.inputs[input] == '') {
            this.errors.push(input + " is required");
          } 
        });
      },
      addForm() {
        this.validateRequiredInputs(); 
        /*axios.post('index.php?json_action=dia_insert', {
          table_name: this.form_params['table_name'],
          data: this.inputs
        }).then((res) => {
          if (res.data ==  'success') {
            location.reload();
          }
        })*/
      }
    },
    mounted() {
      this.inputs = this.form_params['inputs'];
      this.showInputs = this.form_params['showInputs'];
      this.table_name = this.form_params['table_name'];
      this.requiredInputs = this.form_params['requiredInputs'];
      console.log(this.form_params['requiredInputs']);
    },
  };
</script>
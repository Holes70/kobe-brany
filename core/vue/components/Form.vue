 <template> 
  <div>
    <form>
      <div v-for="(input, index) in inputs" :key="index" class='form-group row'>
        <template v-if="showInputs[0] != 'TRUE'">
          <template v-if="index != 'id' && index == showInputs[index]">
            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">{{ index }}</label>
            <div class="col-sm-10">
              <input v-model='inputs[index]' :id='input' type='text' class='form-control' placeholder=''>
            </div>
          </template>
        </template>
        <template v-else>
          <template v-if="index != 'id'">
            <label for="colFormLabelSm" class="col-sm-2 col-form-label col-form-label-sm">{{ index }}</label>
            <div class="col-sm-10">
              <input v-model='inputs[index]' :id='input' type='text' class='form-control' placeholder=''>
            </div>
          </template>
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
      };
    },
    methods: {
      addForm() {
        axios.post('index.php?json_action=dia_insert', {
          table_name: this.form_params['table_name'],
          data: this.inputs
        }).then((res) => {
          if (res.data ==  'success') {
            location.reload();
          }
        })
      }
    },
    mounted() {
      this.inputs = this.form_params['inputs'];
      this.showInputs = this.form_params['showInputs'];
      this.table_name = this.form_params['table_name'];
    },
  };
</script>
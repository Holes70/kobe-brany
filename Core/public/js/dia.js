const app = Vue.createApp({})

//KOMPONENTA EDIT FORM
app.component('vue-editform', {
  props: ['showEdit', 'dataEdit', 'table_name'],
  methods: {
    save() {
      axios.put('index.php?json_action=dia_vue_update', {
        params: {
          table_name: this.table_name,
          data: this.dataEdit
        }
      }).then(function() {
        location.reload();
      })
    }
  },
  template: `
    <div :id="table_name" class="modal">
      <div class="modal-content">
        <div class="form-group" v-for='(item, index) in dataEdit'>
          <input v-if="index != 'id'" type="text" class="form-control" v-model='dataEdit[index]' required>
          <input v-else type="text" class="form-control" v-model='item' disabled>
        </div>
      </div>
      <div class="modal-footer">
        <button @click.prevent="save()" type="submit" class="btn btn-success">Uložiť</button>
        <button class="btn modal-close red lighten-1" data-dismiss="modal">Zavrieť</button>
      </div>
    </div>
  `
})

// KOMPONENTA VUE-TABLE
app.component('vue-table', {
  data() {
    return {
      data: [],
      table_name: '',
      showEdit: 'hidden',
      dataEdit: [],
      formatter: [],
      css: '',
      style: '',
      //formInputs: [],
      columnStyle: [],
      rowStyle: [],
    }
  },
  props: ['table_params'],
  methods: {
    // NACITANIE DAT ZO ZADANEJ TABULKY
    loadData() {
      axios.post('index.php?json_action=dia_vue_select', {
        params: {
          table_name: this.table_params['table_name']
        }
      }).then((res) => {
        this.data = res.data;
      })
    },
    showEditFormFunc(params) {
      if (params.success) {
        this.showEdit = 'block';
        this.dataEdit = params.id;
        axios.post('index.php?json_action=dia_vue_select', {
          params: {
            table_name: this.table_params['table_name'],
            table_id: params.id,
            form_inputs: this.table_params['formInputs'],
          }
        }).then((res) => {
          this.dataEdit = res.data[0];
          //console.log(this.dataEdit);
        })
      }
      else {
        this.showEdit = 'hidden';
      }
    }
  },
  mounted() {
    // AK SU PRAZDNE DATA ODKAZUJE NA ACTION
    if (this.table_params['table_data'] == undefined) {
      this.loadData();
    } else {
      // NACITAJU SA DATA KTORE BOLI DOSADENE CEZ VUE.PHP
      this.data = this.table_params['table_data'];
      this.table_name = this.table_params['table_name'];
      this.formatter = this.table_params['formatter'];
      this.css = this.table_params['class'];
      this.style = this.table_params['style'];
      this.columnStyle = this.table_params['columnStyle'];
      this.rowStyle = this.table_params['rowStyle'];
    }
  },
  template: `
    <div>
      <table :class="[css]" :style="[style]">
        <thead>
          <tr>
            <th v-for='(item, index) in data[0]'>
              {{ formatter[index] }}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for='(item, index) in data'>
            <vue-table-td
              :items='item'
              :columnStyle='columnStyle'
              @showEditForm='showEditFormFunc'
            ></vue-table-td>
          </tr>
        </tbody>
      </table>
      <vue-editform
        :showEdit='showEdit'
        @showEditForm='showEditFormFunc'
        :dataEdit='dataEdit'
        :table_name='table_name'
      />
    </div>
  `
})

// KOMPONENTA VUE-TABLE-TD
app.component('vue-table-td', {
  data () {
    return {
      table_name: this.$parent.table_name,
    }
  },
  props: ['items', 'columnStyle'],
  // Tu musia byt zadefinovane emits inak console warning
  emits: ['showEditForm'],
  template: `
    <td v-for="(item, index) in items" :style="[columnStyle[index] ? columnStyle[index] : '']">
      <template v-if='typeof item != \"object\"'>
        {{ item }}
      </template>
      <template v-else>
        <template v-for='button in items[index]'>
          <vue-table-button
            :button='button'
            :table_id='items[\"id\"]'
          />
        </template> 
      </template>
    </td>
  `
})

// KOMPONENTA TABLE VUE-TABLE-BUTTON
app.component('vue-table-button', {
  data () {
    return {
      table_name: this.$parent.table_name,
      href_table_name: '#' + this.$parent.table_name, // 7.3.2021 najdena chyba
      //ak bolo viac tabuliek tak edit form ukazoval iba udaje z prvej pretoze duplicitny nazov id pre MODAL
    }
  },
  props: ['button', 'table_id'],
  methods: {
    itemDelete() {
      var table = this;
      swal({
        title: "Ste si istý?",
        text: "Naozaj mám chcete vymazať tento záznam?",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "button",
        cancelButtonClass: "red lighten-1",
        confirmButtonText: "Áno",
        cancelButtonText: "Nie",
        closeOnConfirm: false,
        closeOnCancel: false,
      },
      function(isConfirm) {
        if (isConfirm) {
          axios.post('index.php?json_action=dia_delete', {
            params: {
              table_name: table.table_name,
              id: table.table_id
            }
          })
          swal({
            title: "Vymazané",
            text: "Záznam bol vymazaný!",
            type: "success"
          },
          function () {
            location.reload();
          })
        } else {
          swal("Zrušené", "Záznam nebol vymazaný!", "warning") 
        }
      });
    },
    itemEdit() {
      this.$parent.$emit('showEditForm', { success: true, id: this.table_id })
    }
  },
  template: `
    <template v-if='button == \"delete\"'>
      <button @click='itemDelete()' class='btn red lighten-1'>🗑</button>
    </template>
    <template v-else>
      <a @click='itemEdit()' class='btn modal-trigger' :href="href_table_name">✎</a>
    </template>
  `
})

//KOMPONENTA ALERT
app.component('vue-alert', {
  props: ['alert_params'],
  data() {
    return {
      showAlert: true,
    }
  },
  mounted() {
    if (this.alert_params['timer'] != 0) {
      setTimeout(() => {
        this.showAlert = false;
      }, this.alert_params['timer'])
    }
  },
  template: `
    <div v-if="showAlert" class="row" :style="[alert_params.style]" :class="[alert_params.type]">
      <div class="col s12 m5">
        <div class="card-panel teal">
          <span class="white-text">
            {{ alert_params['text'] }}
          </span>
        </div>
      </div>
    </div>
  `
})

//KOMPONENTA BUTTON 
app.component('dia-form', {
  props: ['form_params'],
  data() {
    return {
      inputs: [],
      showInputs: [],
      table_name: '',
    }
  },
  methods: {
    addForm() {
      axios.post('index.php?json_action=dia_insert', {
        table_name: this.form_params['table_name'],
        data: this.inputs
      }).then((res) => {
        console.log(res);
      })
    }
  },
  mounted() {
    this.inputs = this.form_params['inputs'];
    this.showInputs = this.form_params['showInputs'];
    this.table_name = this.form_params['table_name'];
  },
  template: `
    <div>
      <div class='row'>
        <form class='col s12'>
          <div v-for="(input, index) in inputs" class='row'>
            <template v-if="showInputs[0] != 'TRUE'">
              <template v-if="index != 'id' && index == showInputs[index]">
                <div class='input-field col s12'>
                  <input v-model='inputs[index]' :id='input' type='text' class='validate' placeholder=''>
                  <label for='disabled'>{{ index }}</label>
                </div>
              </template>
            </template>
            <template v-else>
              <template v-if="index != 'id'">
                <div class='input-field col s12'>
                  <input v-model='inputs[index]' :id='input' type='text' class='validate' placeholder=''>
                  <label for='disabled'>{{ index }}</label>
                </div>
              </template>
            </template>
          </div>
        </form>
      </div>
      <button @click='addForm()'>Pridat</button>
    </div>
  `
})

app.mount('#dia-app')
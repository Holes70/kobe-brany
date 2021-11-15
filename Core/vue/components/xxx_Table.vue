<template>
  <div>
    <table class="table table-hover" :class="[css]" :style="[style]">
      <thead>
        <tr>
          <th v-for='(item, index) in data[0]' :key="index">
            {{ formatter[index] }}
          </th>
        </tr>
      </thead>
      <tbody>
        <tr v-for='(items, indexs) in data' :key="indexs">
          <td v-for="(item, index) in items" :style="[columnStyle[index] ? columnStyle[index] : '']" :key="index"> 
            <template v-if="typeof item != 'object'">
              {{ item }}
            </template>
            <template v-else v-for="(button) in items[index]" :key="button">
              <button v-if="button == 'delete'" @click="itemDelete(items['id'])" class='btn btn-danger mr-2'>🗑</button>
              <button type="button" v-else @click="itemEdit(items['id'])" class='btn btn-warning mr-2' data-toggle="modal" :data-target="table_name_id">✎</button>
            </template>
          </td>
        </tr>
      </tbody>
    </table>
    <div v-show="showEdit" :id="table_name_id" class="modal" style="display:block">
      <div class="modal-content">
        <div class="modal-body">
          <div class="form-group" v-for='(item, index) in dataEdit' :key="index">
            <input v-if="index != 'id'" type="text" class="form-control" v-model='dataEdit[index]' required>
            <input v-else type="text" class="form-control" :value="item" disabled>
          </div>
        </div>
        <div class="modal-footer">
          <button @click.prevent="editFormSave()" type="submit" class="btn btn-success">Uložiť</button>
          <button class="btn btn-danger" @click="showEdit = false">Zavrieť</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  module.exports = {
    data() {
      return {
        data: [],
        table_name: '',
        href_table_name: '',
        showEdit: false,
        dataEdit: [],
        formatter: [],
        css: '',
        style: '',
        //formInputs: [],
        columnStyle: [],
        rowStyle: [],
        table_name_id: '',
      }
    },
    props: ['table_params'],
    methods: {
      // NACITANIE DAT ZO ZADANEJ TABULKY
      loadData() {
        axios.post('index.php?page=admin=dia_vue_select', {
          params: {
            table_name: this.table_params['table_name'],
            action: 'getJSON'
          }
        }).then((res) => {
          this.data = res.data[0];
        })
      },
      showEditFormFunc(params) {
        if (params.success) {
          this.showEdit = 'block';
          this.dataEdit = params.id;
          axios.post('index.php?action=dia_vue_select', {
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
      },
      itemDelete(table_id) {
        var table = this;
        swal({
          title: "Ste si istý?",
          text: "Naozaj chcete vymazať tento záznam?",
          type: "warning",
          showCancelButton: true,
          cancelButtonClass: "button",
          confirmButtonClass: "red lighten-1",
          confirmButtonText: "Áno",
          cancelButtonText: "Nie",
          closeOnConfirm: false,
          closeOnCancel: false,
        },
        function(isConfirm) {
          if (isConfirm) {
            axios.post('index.php?action=dia_delete', {
              table_name: table.table_name,
              id: table_id
            })
            swal({
              title: "Vymazané",
              text: "Záznam bol vymazaný!",
              type: "success"
            },
            function () {
              table.loadData();
              console.log(table.data);
            })
          } else {
            swal("Zrušené", "Záznam nebol vymazaný!", "warning") 
          }
        });
      },
      itemEdit(table_id) {
        this.showEditFormFunc({ success: true, id: table_id });
      },
      editFormSave() {
        axios.put('index.php?action=dia_vue_update', {
          params: {
            table_name: this.table_name,
            data: this.dataEdit
          }
        }).then(function() {
          location.reload();
        })
      }
    },
    mounted() {
      // AK SU PRAZDNE DATA ODKAZUJE NA ACTION
      if (this.table_params['table_data'] == undefined) {
        console.log('xxxx');
        this.loadData();
      } else {
        var random = Math.floor(Math.random() * 11);
        // NACITAJU SA DATA KTORE BOLI DOSADENE CEZ VUE.PHP
        this.data = this.table_params['table_data'];
        this.table_name = this.table_params['table_name'];
        this.formatter = this.table_params['formatter'];
        this.css = this.table_params['class'];
        this.style = this.table_params['style'];
        this.columnStyle = this.table_params['columnStyle'];
        this.rowStyle = this.table_params['rowStyle'];
        this.href_table_name = '#' + this.table_params['table_name'] + '_' + random;
        this.table_name_id = this.table_params['table_name'] + '_' + random;
      }
    },
  };
</script>
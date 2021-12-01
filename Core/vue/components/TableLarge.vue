<template>
  <table class="table">
    <thead>
      <tr>
        <th v-for="col in tableColumns" :key="col" scope="col">{{ col }}</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for='itemData in data' :key='itemData.id'>
        <template v-for='(item, colName) in itemData' :key='item.id'>
          <td v-if='checkBeforeRender(item, colName)'>{{ checkBeforeRender(item, colName) }}</td>
        </template>
      </tr>
    </tbody>
  </table>
</template>

<script>
  export default {
    props: ['params'],
    data() {
      return {
        data: [],
        tableName: "",
        conditions: [],
        tableColumns: [],
        tableColumnsKeys: [],
        formColumns: [],
        tableStructure: []
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
      /*checkBeforeRender(item, colName) {
        if (typeof this.tableColumns != "undefined") {
          var tableColumnsKeys = Object.keys(this.tableColumns);
          if (tableColumnsKeys.includes(colName)) {
            return item;
          }
        } else {
          return item;
        }
      },*/
      checkBeforeRender(item, colName) {
        if (this.checkIfShowInTable(colName)) {
          return item;
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
      loadTableStructure() {
        axios.post('index.php?action=dia_select&reset=true&unset=structure&json=true', {
          params: {
            tableName: "dia_tables",
            conditions: this.conditions
          }
        }).then((res) => {
          if (res.data.status != 'fail') {
            this.tableStructure = res.data;
            this.tableColumnsKeys = Object.keys(this.tableStructure);
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
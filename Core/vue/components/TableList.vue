<template>
  <div>
    {{ getTableName }}
    <div v-for='item in list' :key='item.id' class="card mb-2">
      <div class="card-body">
        <ul class="list-inline">
          <li v-for='element in item' :key='element' v-html='element' class="list-inline-item">
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      tableName: {
        type: String,
      },
      list: {
        type: Array
      },
      columns: {
        type: Array
      }
    },
    data() {
      return {
        tableNameVar: ''
      }
    },
    computed: {
      getTableName() {
        if (this.tableNameVar == '') {
          return this.tableName;
        } else {
          return this.tableNameVar;
        }
      }
    },
    methods: {
      funckia(e) {
        this.tableNameVar = e;
      }
    }
  }
</script>
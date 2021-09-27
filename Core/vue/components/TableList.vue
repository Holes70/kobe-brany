<template>
  <div>
    {{ getTableName }}
    <button @click='emitComponent' class='btn btn-primary'>Emituj</button>
    <div v-for='item in getList' :key='item.id' class="card mb-2">
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
        tableNameVar: '',
        listVar: [],
        userFuncs: {}
      }
    },
    computed: {
      getTableName() {
        if (this.tableNameVar == '') {
          return this.tableName;
        } else {
          return this.tableNameVar;
        }
      },
      getList() {
        if (this.listVar.length > 0) {
          return this.listVar
        } else {
          return this.list;
        }
      },
      emitComponent() {
        emitter.emit('foo', 'funkcia');
      }
    },
    mounted() {
      emitter.on("foo", param => {
        this.tableNameVar = param;
        if (this.tableName == 'user_tests') {
          this.listVar = [1,2,3];
        }
      });
    },
    created () {
    }
  }
</script>
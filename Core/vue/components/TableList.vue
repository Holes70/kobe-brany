<template>
  <div>
    {{ getTableName }}
    <div v-for='item in getList' :key='item.id' class="card mb-2">
      <div class="card-body">
        <ul class="list-inline">
          <li v-for='element in item' :key='element' v-html='element' class="list-inline-item">
          </li>
          <li if="actionButton">
            <button
              @click="emitComponent(item.id, actionButton.params)"
              :class='actionButton.class'
              :style='actionButton.style'
            >{{ actionButton.name }}</button>
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
      },
      actionButton: {
        type: Object
      }
    },
    data() {
      return {
        tableNameVar: '',
        listVar: []
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
        if (
          typeof(this.listVar) !== 'undefined' 
          && this.listVar !== null 
          && this.listVar.length > 0
        ) {
          return this.listVar;
        } else {
          return this.list;
        }
      }
    },
    methods: {
      emitComponent(id, params) {
        Object.assign(params, { id: id });
        emitter.emit('emitAction', params);
      },
      action(params) {
        if (this.tableName == params.tableName) {
          axios.post('index.php?json_action=dia_select', {
            params: {
              table_name: params.tableName,
              conditions: {
                'where': {
                  'user_id': params.id
                }
              }
            }
          }).then((res) => {
            this.listVar = res.data;
          })
        }
      }
    },
    mounted() {
      emitter.on("emitAction", params => {
        this.action(params);
      });
    }
  }
</script>
<template>
  <div v-if="showList">
    {{ getTableName }}
    <div v-for='item in getList' :key='item.id' class="card mb-2">
      <div class="card-body">
        <ul class="list-inline">
          <li v-for='element in item' :key='element' v-html='element' class="list-inline-item">
          </li>
          <li v-if="actionButton" class="list-inline-item">
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
  <div v-else v-html='hideValue'></div>
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
      },
      hideValue: {
        type: String
      }
    },
    data() {
      return {
        tableNameVar: '',
        listVar: [],
        showList: true
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
        
        // Zmen $id na id z listu
        params['conditions']['where'][Object.keys(params['conditions']['where'])] = id;

        emitter.emit('emitAction', params);
      },
      action(params) {
        if (this.tableName == params.tableName) {
          axios.post('index.php?json_action=dia_select', {
            params: {
              table_name: params.tableName,
              conditions: params.conditions
            }
          }).then((res) => {
            this.listVar = res.data;
            this.showList = true;
          })
        }
      },
      getHideValue() {
        if (this.hideValue) {
          this.showList = false;
        } else {
          this.showList = true;
        }
      }
    },
    mounted() {
      emitter.on("emitAction", params => {
        this.action(params);
      });

      this.getHideValue();
    }
  }
</script>
<template>
  <div>
    <p>vue-json-editor</p>
    <json-editor
      v-model="json"
      :show-btns="true"
      :expandedOnStart="true"
      @json-change="onJsonChange"
    />
  </div>
</template>

<script>
/*
import { defineComponent, reactive, toRefs } from 'vue'
import { Vue3JsonEditor } from 'vue3-json-editor'

export default defineComponent({
  components: {
    "xxx": Vue3JsonEditor
  },
  setup () {
    function onJsonChange (value) {
      console.log('value:', value)
    }

    const state = reactive({
      json: {}
    })

    return {
      ...toRefs(state),
      onJsonChange
    }
  }
})*/

//import { defineComponent } from 'vue'
import { Vue3JsonEditor } from '../../../node_modules/vue3-json-editor/dist/vue3-json-editor.esm.mjs'

export default {
  components: {
    "json-editor": Vue3JsonEditor
  },
  data() {
    return {
      json: {}
    }
  },
  methods: {
    onJsonChange (value) {
      console.log('value:', value)
    }
  }
}
</script>
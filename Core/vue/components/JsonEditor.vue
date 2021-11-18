<template>
  <div>
    <json-editor-com
      v-model="json"
      :show-btns="true"
      :expandedOnStart="true"
      @json-change="onJsonChange"
    />
  </div>
</template>

<script>
import { Vue3JsonEditor } from '../../../node_modules/vue3-json-editor/dist/vue3-json-editor.esm.prod.mjs'

export default {
  components: {
    "json-editor-com": Vue3JsonEditor
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
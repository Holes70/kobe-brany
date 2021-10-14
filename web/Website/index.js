//import test from './vue/test.js'

// Create a Vue application
const app = Vue.createApp({
  mounted() {
    alert();
  }
})

app.component('test', {
  data() {
    return {
      count: 0
    }
  },
  template: `
    <button v-on:click="count++">
      You clicked me {{ count }} times.
    </button>`
})

app.mount('#app')
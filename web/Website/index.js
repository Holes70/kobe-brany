import test from './vue/test.js'
import test2 from './vue/test2.js'

// Create a Vue application
const app = Vue.createApp({
  components: {
    'test': test,
    'test2': test2,
  }
})

app.mount('#app')
<template>
  <div class="alert alert-success mt-5 mb-5" role="alert">
    <button 
      type="button" 
      class="close" 
      data-dismiss="alert" 
      aria-label="Close"
      @click="deleteAlert()"
    >
      <span aria-hidden="true">&times;</span>
    </button>
    <h4 class="alert-heading">{{ title }}</h4>
    <p>{{ text }}</p>
    <hr>
    <p class="mb-0">{{ footerText }}</p>
  </div>
</template>
<script>
export default {
  props: [
    'text', 
    'title', 
    'footerText',
    'alertId'
  ],
  methods: {
    deleteAlert() {
      axios.delete(
        'index.php?json_action=dia_vue_delete',
        {
          alertId: this.alertId
        }
      );
    }
  }
}
</script>
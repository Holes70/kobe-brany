<template>
  <h4 class='card-header text-center'>
    Objednané produkty
    <button 
      type="button" 
      class="btn btn-lg btn-danger" 
      data-toggle="popover" 
      :title="xxx" 
      :data-content="xxx"
    >Click to toggle popover</button>
  </h4>
</template>

<script>
export default { 
  data() {
    return {
      xxx: "xxxxx"
    }
  },
  mounted() {
    $(function () {
      $('[data-toggle=\"popover\"]').popover()
    })
    $('.popover-dismiss').popover({
      trigger: 'focus'
    })
  }
}
</script>
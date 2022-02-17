<template>
  <canvas 
    :id="params['id']" 
    width="auto" 
    height="auto">
  </canvas>
</template>

<script>
export default {
  props: ['params'],
  data() {
    return {
      //params
      type: '',
      label: '',
      labels: [],
      data: [],
      borderWidth: 1
    }
  },
  methods: {
    initParams() {
      this.type = this.params['type'];
      this.labels = this.params['labels'];
      this.data = this.params['data'];
      this.label = this.params['label'];

      this.borderWidth = this.params['borderWidth'];
      this.backgroundColor = this.params['backgroundColor'];
      this.borderColor = this.params['borderColor'];
    }
  },
  mounted() {
    this.initParams();

    //var ctx = document.getElementById(this.id).getContext('2d');
    var ctx = $('#' + this.params['id']);

    new Chart(ctx, {
      type: this.type,
      data: {
        labels: this.labels,
        datasets: [{
          label: this.label,
          data: this.data,
          backgroundColor: this.backgroundColor,
          borderColor: this.borderColor,
          borderWidth: this.borderWidth
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  },
}
</script>
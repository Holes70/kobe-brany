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
      backgroundColor: [],
      type: '',
      label: '',
      labels: [],
      data: [],
      borderWidth: 1
    }
  },
  methods: {
    dynamicColor() {
      var r = Math.floor(Math.random() * 255);
      var g = Math.floor(Math.random() * 255);
      var b = Math.floor(Math.random() * 255);
      return "rgba(" + r + "," + g + "," + b + ", 0.5)";
    }
  },
  beforeMount() {
    this.params['data'].forEach(() => {
      this.backgroundColor.push(this.dynamicColor());
    })
  },
  mounted() {
    f.setComponentParams(this);

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
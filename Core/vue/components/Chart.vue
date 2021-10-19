<template>
  <canvas 
    :id="id" 
    width="400" 
    height="400">
  </canvas>
</template>

<script>
export default {
  props: ['params'],
  data() {
    return {
      id: 'cart',
      //params
      type: '',
      label: '',
      labels: [],
      data: []
    }
  },
  methods: {
    initParams() {
      this.type = this.params['type'];
      this.labels = this.params['labels'];
      this.data = this.params['data'];
      this.label = this.params['label'];
      //this.id = this.params['uid'];
      //this.borderWidth = this.params['borderWidth'];
    }
  },
  mounted() {
    this.initParams();

    var ctx = document.getElementById(this.id).getContext('2d');
    new Chart(ctx, {
      type: this.type,
      data: {
        labels: this.labels,
        datasets: [{
          label: this.label,
          data: this.data,
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
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
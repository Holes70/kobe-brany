<!-- Struktura musi byt presne definovana takto -->
<template>
  <div>
    <h1>Ahoj tu je testParams2 komponenta</h1>
    <h2>Cislo: {{ params.cislo }}</h2>
    <h3>String: {{ params.textA }}</h3>
    <h3>Pole: </h3>
    <!-- params.cisla je array cize for -->
    <b v-for="cislo in params.cisla" :key="cislo" style="font-size: 25px;">
      {{ cislo }}, 
    </b>
  </div>
</template>

<!-- Praca s vue JS castou -->
<script>
  module.exports = {
    props: ['params'],
    mounted() {
      console.log(this.params);
    }
  }
</script>
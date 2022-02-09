<template>
  <div class='card'>
    <div class='card-body'>
      <div class='d-flex flex-column align-items-center text-center'>
        <img 
          :src="'http://localhost/'+ this.dir +'/files/'  + this.fileDir + '/' + data['avatar']" 
          class='rounded-circle' width='150'
        />
        <div class='mt-3'>
          <h4>{{ data.first_name }} {{ data.last_name }}</h4>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

var diaProfileView = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaProfileView, {
    })
  },
  beforeCreate() {
    diaProfileView = new Dia();
  },
  beforeMount() {
    diaProfileView.setComponentParams(this);
    diaProfileView.setComponentData(this, 'dia_logged_user');
  }
}
</script>
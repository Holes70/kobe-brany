<template>
  
    <dia-modal :params='{
      componentUid: this.componentUid,
      render: "<div><dia-timer></dia-timer></div>"
    }'></dia-modal>

    <button 
      type="button" 
      data-toggle="modal" 
      :data-target="'#' + componentUid" 
      :class="'btn mb-2 mb-md-0 btn-block mr-5 btn-' + button" 
      style="width:200px"
    >
      <span>{{ title }}</span> 
      <div class="icon d-flex align-items-center justify-content-center">
        <i :class="icon"></i>
      </div>
    </button>

</template>

<script>

var diaButton = Object();

import Modal from './Modal.vue';

export default {
  components: {
    'dia-modal': Modal
  },
  props: ['params'],
  data() {
    return Object.assign(diaButton, {
    })
  },
  beforeCreate() {
    diaButton = new Dia();
  },
  beforeMount() {
    this.title = this.params['title'];
    this.button = this.params['button'];
    this.icon = this.params['icon'];

    diaButton.setComponentParams(this);
  }
}

</script>
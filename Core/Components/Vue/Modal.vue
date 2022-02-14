<template>
	<div class="modal fade bd-example-modal-lg" :id="componentUid" tabindex="-1" role="dialog" aria-labelledby="testTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title dia-secret">{{ componentUid }}</h6>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="row pl-4 pr-4">
					<div class="col">
					</div>
					<div class="col">
					</div>
					<div class="col">
					</div>
					<div class="col">
						<button class="btn mb-2 mt-2 mb-md-0 btn-primary btn-block">Poslať novú správu</button>
					</div>
				</div>
				<div class="model-img modal-body text-center">
					<component :is="modalComponentToRender" :params="modalComponentToRenderParams"></component>
				</div>
			</div>
		</div>
	</div>
</template>

<script>

var diaModal = Object();

import Timer from './Timer.vue';
import Form from './Form2.vue';
import Messages from './Messages.vue';

export default {
  props: ['params'],
	components: {
		'dia-timer': Timer,
		'dia-form': Form,
		'dia-messages': Messages
	},
  data() {
    return Object.assign(diaModal, {
    })
  },
  beforeCreate() {
    diaModal = new Dia();
  },
  beforeMount() {
    diaModal.setComponentParams(this);

		this.modalComponentToRender = this.params['modalComponentToRender'];
		this.modalComponentToRenderParams = this.params['modalComponentToRenderParams'];
		this.componentUid = this.params['componentUid'];
  }
}

</script>
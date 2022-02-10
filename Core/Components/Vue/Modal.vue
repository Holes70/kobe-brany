<template>
	<div class="modal fade bd-example-modal-lg" :id="componentUid" tabindex="-1" role="dialog" aria-labelledby="testTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Nový záznam (<var class="color-primary">{{ componentUid }}</var>)</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="model-img modal-body text-center">
					<component :is="modalComponentToRender"></component>
				</div>
			</div>
		</div>
	</div>
</template>

<script>

var diaModal = Object();

import Timer from './Timer.vue';
import Form from './Form2.vue';

export default {
  props: ['params'],
	components: {
		'dia-timer': Timer,
		'dia-form': Form
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
		this.componentUid = this.params['componentUid'];
  }
}

</script>
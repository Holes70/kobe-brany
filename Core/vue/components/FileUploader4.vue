<template>
  <div :id="componentName" style="text-align:center">
    <form method="post" :action="'index.php?action=' + uploadAction" enctype="multipart/form-data">
      <div class="row text-center">
        <div class="col-12 text-center">
          <div id="yourBtn" onclick="getFile()">Click to upload!</div>
        </div>
        <div id="submitFile" class="col-12 text-center" style="display:none">
          <input type="submit" value="Nahrať" class="mt-2 btn btn-primary"/>
        </div>
        <div style="display:none">
          <input class="form-control" name="file" type="file" id="file" onchange="sub(this)">
          <input type="hidden" name="redirect" v-model="redirect">
          <input type="hidden" name="id" v-model="idItem">
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  props: ['params'],
  data() {
    return {
      componentName: "fileuploader",
      uploadAction: "",
      idItem: 0,
      redirect: ''
    }
  },
  mounted() {
    this.uploadAction = this.params['uploadAction'];
    this.idItem = dia.getUrlParam('id');
    this.redirect = dia.getUrl();
  }
}
</script>
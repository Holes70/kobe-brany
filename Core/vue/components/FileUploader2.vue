<template>
  <div class="row m-5">
    <form method="post" :action="'index.php?action=' + uploadAction" enctype="multipart/form-data">
      <input class="form-control" name="file" type="file">
      <input type="hidden" name="redirect" value="produkty">
      <input type="submit" value="Nahrať" class="mt-2 btn btn-primary"/>
    </form>
  </div>
</template>

<script>
export default {
  props: ['params'],
  data() {
    return {
      uploadAction: "",
    }
  },
  mounted() {
    this.uploadAction = this.params['uploadAction'];
  }
}
</script>
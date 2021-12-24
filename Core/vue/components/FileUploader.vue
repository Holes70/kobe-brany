<template>
  <div class="row m-5">
    <form method="post" action="index.php?action=dia_upload_image">
      <input class="form-control" name="file" type="file">
      <input type="text" name="redirect" value="produkty">
      <input type="submit" value="Nahrať" class="mt-2 btn btn-primary"/>
    </form>
  </div>
</template>
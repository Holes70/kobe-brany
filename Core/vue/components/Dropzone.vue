<template>
  <div>
    {{ table_name }}
    <form 
      id='dia-dropzone' 
      action="index" 
      class="dropzone">
    </form>
    <button @click='removeAllFiles()'>Remove all</button>
  </div>
</template>

<script>
  Dropzone.autoDiscover = false;

  export default {
    props: ['table_name'],
    data() {
      return {
        uploadedFiles: []
      }
    },
    mounted() {
      this.dropzone = new Dropzone("#dia-dropzone");

      this.dropzone.on("addedfile", file => {
        axios.post('index.php?json_action=dia_insert', {
          'table_name': this.table_name,
          'data': {
            'user_id': 1,
            'test_id': 1,
            'filename': file.name
          }
        }).then((res) => {
          // Res return item ID and then push into array
          this.uploadedFiles.push(res.data['id']);
        })
      });
    },
    methods: {
      removeAllFiles: function() {
        let removeFiles = [];

        $('#dia-dropzone .dz-filename').each(function(index, fileName){
          let fileNameText = $(fileName).text();
          removeFiles.push(fileNameText);
        });

        axios.post(
          'index.php?json_action=dia_delete',
          {
            table_name: this.table_name,
            id: this.uploadedFiles
          }
        ).then((res) => {
          this.dropzone.removeAllFiles();
        })
      },
    }
  }
</script>

<template>
  <div>
    {{ table_name }}
    <form 
      id='dia-dropzone' 
      action="index" 
      class="dropzone">
    </form>

    <button 
      @click="removeAllFiles()" 
      class="btn btn-danger"
    >Remove all</button>
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
      var _this = this;

      this.dropzone = new Dropzone("#dia-dropzone", {
       init: function() {
          var thisDropzone = this;
          axios.post('index.php?json_action=dia_select', {
            params: {
              table_name: _this.table_name,
              conditions: {
                'where': {
                  'user_id': 1,
                  'test_id': 1
                }
              }
            }
          }).then((res) => {
            $.each(res.data, function(key, value){
              _this.uploadedFiles.push(value.id);

              var file = { name: value.filename, size: value.size };
              var name = value.filename;

              thisDropzone.options.addedfile.call(thisDropzone, file);
              if (name.includes('.jpg') || name.includes('.png') || name.includes('.jpeg') || name.includes('.gif')) {
                thisDropzone.options.thumbnail.call(thisDropzone, file, 'Files/dropzone/' + value.filename);
              }
              thisDropzone.options.complete.call(thisDropzone, file);
              thisDropzone.options.processing.call(thisDropzone, file);
            });
          })
        }
      });

     this.dropzone.on("addedfile", file => {
        var i = 0;
        var uploadFile = true;

        $('#dia-dropzone .dz-filename').each(function(index, obj){
          if ($(obj).text() == file.name) {
            i++;
            if (i == 2) {
              uploadFile = false;
              alert('Tento dokument sa tu už nachádza');
              _this.dropzone.removeFile(file);
              $('.dropzone').addClass('dz-started');
              i = 0;
            }
          }
        });

        if (uploadFile == true) {
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
        }
      });
    },
    methods: {
      removeAllFiles: function() {
        axios.post(
          'index.php?json_action=dia_delete',
          {
            table_name: this.table_name,
            id: this.uploadedFiles
          }
        ).then(() => {
          this.dropzone.removeAllFiles();

          // Delete loaded files html
          $('#dia-dropzone .dz-preview').remove();
          $('.dropzone').removeClass('dz-started');
        })
      },
    }
  }
</script>

<template>
  <div class="modal fade bd-example-modal-lg" id="modal-registracia" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
     <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="model-img modal-body text-center">
            <form @submit="vytvoritUcet">
              <div class="form-group">
                <label for="email">E-mailová adresa</label>
                <input 
                  v-model="email"
                  type="email" 
                  class="form-control" 
                  id="email" 
                  placeholder="Zadajte e-mail"
                >
              </div>
              <div class="form-group">
                <label for="password">Heslo</label>
                <input
                  v-model="password"
                  type="password" 
                  class="form-control" 
                  id="password" 
                  placeholder="Heslo"
                >
              </div>
              <div class="form-group">
                <label for="password">Zopakujte heslo</label>
                <input 
                  v-model="password2"
                  type="password" 
                  class="form-control" 
                  id="password2" 
                  placeholder="Zopakujte heslo"
                >
              </div>
              <input
                type="submit" 
                class="btn btn-primary"
                value="Vytvoriť zákaznícky účet"
              />
            </form>
          </div>
        </div>
      </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      password2: ''
    }
  },
  methods: {
    vytvoritUcet(e) {
      e.preventDefault();
      
      axios.post('Admin/index.php?action=dia_insert_post', {
        email: this.email,
        password: this.password,
        tableName: 'customers'
      }).then((res) => {
        console.log(res);
      })
    }
  }
}
</script>

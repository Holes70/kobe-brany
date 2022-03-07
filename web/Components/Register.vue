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
            <form>
              <div class="form-group">
                <label for="email">E-mailová adresa</label>
                <input 
                  type="email" 
                  class="form-control" 
                  id="email" 
                  aria-describedby="emailHelp"
                  placeholder="Zadajte e-mail"
                >
              </div>
              <div class="form-group">
                <label for="password">Heslo</label>
                <input 
                  type="password" 
                  class="form-control" 
                  id="password" 
                  placeholder="Heslo"
                >
              </div>
              <div class="form-group">
                <label for="password">Zopakujte heslo</label>
                <input 
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
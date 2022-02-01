<template>
  <div>
    <div class='cotainer mt-5'>
      <div class='row justify-content-center'>
        <div class='col-md-8'>
          <div class='card'>
            <div class='card-header'>Prihlásenie</div>
            <div class='card-body'>
              <div :id="componentName">
                 <form 
                    @submit="validateBeforePost"
                    action="index.php?action=dia_insert_post" 
                    method="POST"
                  > 
                    <div class='form-group row'>
                      <label for='email_address' class='col-md-4 col-form-label text-md-right'>E-mailová adresa</label>
                      <div class='col-md-6'>
                        <input 
                          type='email' 
                          v-model="data['loginVal']" 
                          class='form-control' 
                          name='email' 
                          :class="errorClass('email')"
                        >
                      </div>
                    </div>

                    <div class='form-group row'>
                      <label for='password' class='col-md-4 col-form-label text-md-right'>Heslo</label>
                      <div class='col-md-6'>
                        <input 
                          type='password' 
                          v-model="data['passwordVal']" 
                          class='form-control' 
                          name='password' 
                          :class="errorClass('password')"
                        >
                      </div>
                    </div>

                    <div class='form-group row'>
                      <div class='col-md-6 offset-md-4'>
                        <div class='checkbox'>
                          <label>
                            <input 
                              type='checkbox' 
                              name='remember'
                            /> Zapamätať prihlásenie
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class='col-md-6 offset-md-4'>
                      <input 
                        type='submit' 
                        class='btn btn-primary'
                        value="Prihlásiť"
                      />
                    </div>
                  </form>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-if='error' class='error' style='color:red'>
      <p>{{ error }}</p>
    <div>
  </div>
</template>

<script>
  var diaRow = Object();

  export default {
    props: ['params'],
    data() {
      return Object.assign(diaRow, {
        componentName: "row",
        loginError: false,
        passwordError: false
      })
    },
    methods: {
      validateBeforePost(e) {
        this.loginError = false;
        this.passwordError = false;

        if (this.data['loginVal'] == "") {
          this.loginError = true;
          e.preventDefault();
        }

        if (this.data['passwordVal'] == "") {
          this.passwordError = true;
          e.preventDefault();
        }

      },
      errorClass(input) {
        if (input == "email") {
          return { 'required': this.loginError };
        } else {
          return { 'required': this.passwordError };
        }
      }
    },
    beforeCreate() {
      diaRow = new Dia();
    },
    beforeMount() {
      diaRow.setComponentParams(this);

      this.data = this.params['data'];
    }
  }
</script>
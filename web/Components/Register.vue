<template>
  <div class="modal fade bd-example-modal-lg" id="modal-registracia" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
     <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button class="btn btn-secondary" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="model-img modal-body text-center">
            <div class="row">
              <div class="col-6">
                <button 
                  @click="changeType('login')"
                  :class="typeClass('login')"
                >
                  Už mám účet
                </button>
              </div>
              <div class="col-6">
                <button 
                  @click="changeType('registration')"
                  :class="typeClass('registration')"
                >
                  Vytvoriť nový účet
                </button>
              </div>
            </div>
            <div v-if="type == 'login'">
              <div v-if="loginError == 'notExists'">
                <p>Tento účet neexistuje</p>
              </div>
              <div v-else-if="loginError == 'passwordNotValid'">
                <p>Heslo je nesprávne</p>
              </div>
              <form @submit="prihlasit">
                <div class="form-group mt-4">
                  <label for="login-email">E-mailová adresa</label>
                  <input 
                    v-model="email"
                    type="email" 
                    :class="errorLoginClass('email')" 
                    id="login-email" 
                    placeholder="Zadajte e-mail"
                  >
                </div>
                <div class="form-group mt-4">
                  <label for="login-password">Heslo</label>
                  <input
                    v-model="password"
                    type="password" 
                    :class="errorLoginClass('password')"
                    id="login-password" 
                    placeholder="Heslo"
                  >
                </div>
                <input
                  type="submit" 
                  class="btn btn-primary mt-2"
                  value="Prihlásiť"
                />
              </form>
            </div>
            <div v-else>
              <div v-if="!registrationSuccess">
                <form @submit="vytvoritUcet">
                  <div class="form-group mt-4">
                    <label for="register-email">E-mailová adresa</label>
                    <input 
                      v-model="email"
                      type="email" 
                      :class="errorClass()" 
                      id="register-email" 
                      placeholder="Zadajte e-mail"
                    >
                  </div>
                  <div class="form-group mt-4">
                    <label for="register-password">Heslo</label>
                    <input
                      v-model="password"
                      type="password" 
                      class="form-control" 
                      id="register-password" 
                      placeholder="Heslo"
                    >
                  </div>
                  <div class="form-group mt-4">
                    <label for="register-password2">Zopakujte heslo</label>
                    <input 
                      v-model="password2"
                      type="password" 
                      class="form-control" 
                      id="register-password2" 
                      placeholder="Zopakujte heslo"
                    >
                  </div>
                  <input
                    type="submit" 
                    class="btn btn-primary mt-2"
                    value="Vytvoriť zákaznícky účet"
                  />
                </form>
              </div>
              <div v-else>
                <div class="p-4">
                  <h5>Ďakujeme za registráciu. Bol Vám zaslaný verifikačný e-mail.</h2>
                  <h5 class="mt-2">Pre dokončenie registrácie otvorte e-mail ktorý sme Vám zaslali.</h3>
                </div>
              </div>
            </div>
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
      password2: '',
      emailExists: false,
      registrationSuccess: false,
      type: 'login',
      loginError: ''
    }
  },
  methods: {
    vytvoritUcet(e) {
      e.preventDefault();
      this.registrationSuccess = false;
      this.emailExists = false;

      var error = false;

      if ($("#register-password2").val() == "") {
        error = true;
        $("#register-password2").focus();
      }

      if ($("#register-password").val() == "") {
        error = true;
        $("#register-password").focus();
      }

      if ($("#register-email").val() == "") {
        error = true;
        $("#register-email").focus();
      }

      if (error == false) {
        axios.post('Admin/index.php?action=dia_insert_post', {
          email: this.email,
          password: this.password,
          state: 1,
          tableName: 'customers'
        }).then((res) => {
          if (res.data.status != 'fail') {
            this.registrationSuccess = true;
          } else {
            this.emailExists = true;
          }
        })
      }
    },
    prihlasit(e) {
      e.preventDefault();

      var error = false;

      if ($("#login-password").val() == "") {
        error = true;
        $("#login-password").focus();
      }

      if ($("#login-email").val() == "") {
        error = true;
        $("#login-email").focus();
      }

      this.loginError = '';

      if (error == false) {
        axios.post('Admin/index.php?action=prihlasit', {
          email: this.email,
          password: this.password
        }).then((res) => {
          console.log(res);
          if (res.data.status != 'fail') {
            location.reload();
          } else {
            this.loginError = res.data.message;
          }
        })
      }
    },
    errorClass() {
      if (this.emailExists) {
        return {
          'form-control': true,
          'error': true
        }
      } else {
        return {
          'form-control': true
        }
      }
    },
    errorLoginClass(input) {
      if (this.loginError == 'notExists') {
        return {
          'form-control': true,
          'error': true
        }
      } else if (
          this.loginError == 'passwordNotValid'
          && input == 'password'
        ) {
        return {
          'form-control': true,
          'error': true
        }
      } else {
        return {
          'form-control': true
        }
      }
    },
    typeClass(type) {
      if (this.type == type) {
        return {'btn btn-primary': true}
      } else {
        return {'btn btn-secondary': true}
      }
    },
    changeType(type) {
      this.type = type;
    }
  }
}
</script>

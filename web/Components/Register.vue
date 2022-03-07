<template>
  <div class="modal fade bd-example-modal-lg" id="modal-registracia" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
     <div class="modal-dialog modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div v-if="emailExists">
            Tento účet už existuje
          </div>
          <div class="model-img modal-body text-center">
            <div class="row">
              <div class="col-6">
                <button 
                  @click="changeType('login')"
                  :class="typeClass('login')"
                >
                  Prihlásenie
                </button>
              </div>
              <div class="col-6">
                <button 
                  @click="changeType('registration')"
                  :class="typeClass('registration')"
                >
                  Registrácia
                </button>
              </div>
            </div>
            <div v-if="type == 'login'">
              <div v-if="loginError == 'notExists'">
                <p>Tento účet neexistuje</p>
              </div>
              <div v-else>
                <p>Heslo je nesprávne</p>
              </div>
              <form @submit="prihlasit">
                <div class="form-group">
                  <label for="email">E-mailová adresa</label>
                  <input 
                    v-model="email"
                    type="email" 
                    :class="errorLoginClass('email')" 
                    id="email" 
                    placeholder="Zadajte e-mail"
                  >
                </div>
                <div class="form-group">
                  <label for="password">Heslo</label>
                  <input
                    v-model="password"
                    type="password" 
                    :class="errorLoginClass('password')"
                    id="password" 
                    placeholder="Heslo"
                  >
                </div>
                <input
                  type="submit" 
                  class="btn btn-primary"
                  value="Prihlásiť"
                />
              </form>
            </div>
            <div v-else>
              <div v-if="!registrationSuccess">
                <form @submit="vytvoritUcet">
                  <div class="form-group">
                    <label for="email">E-mailová adresa</label>
                    <input 
                      v-model="email"
                      type="email" 
                      :class="errorClass()" 
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
              <div v-else>
                Poslali sme Vám verifikačný e-mail
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

      axios.post('Admin/index.php?action=dia_insert_post', {
        email: this.email,
        password: this.password,
        tableName: 'customers'
      }).then((res) => {
        if (res.data.status != 'fail') {
          this.registrationSuccess = true;
        } else {
          this.emailExists = true;
        }
      })
    },
    prihlasit(e) {
      e.preventDefault();

      this.loginError = '';

      axios.post('Admin/index.php?action=prihlasit', {
        email: this.email,
        password: this.password
      }).then((res) => {
        console.log(res);
        if (res.data.status != 'fail') {
          
        } else {
          this.loginError = res.data.message;
        }
      })
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

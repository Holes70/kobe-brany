<template>
  <div>
    <div class='cotainer'>
      <div class='row justify-content-center'>
        <div class='col-md-8'>
          <div class='card'>
            <div class='card-header'>Login</div>
            <div class='card-body'>
              <div id="loginForm">
                <div class='form-group row'>
                  <label for='email_address' class='col-md-4 col-form-label text-md-right'>E-Mail Address</label>
                  <div class='col-md-6'>
                    <input type='text' v-model="data['loginVal']" class='form-control' name='email-address' required autofocus>
                  </div>
                </div>

                <div class='form-group row'>
                  <label for='password' class='col-md-4 col-form-label text-md-right'>Password</label>
                  <div class='col-md-6'>
                    <input type='password' v-model="data['passwordVal']" class='form-control' name='password' required>
                  </div>
                </div>

                <div class='form-group row'>
                  <div class='col-md-6 offset-md-4'>
                    <div class='checkbox'>
                      <label>
                        <input type='checkbox' name='remember'> Remember Me
                      </label>
                    </div>
                  </div>
                </div>

                <div class='col-md-6 offset-md-4'>
                  <button @click="submitForm()" type='submit' class='btn btn-primary'>
                    Login
                  </button>
                  <a href='#' class='btn btn-link'>
                    Forgot Your Password?
                  </a>
                </div>
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
  export default {
    props: {
      params: {
        type: Object
      }
    },
    data() {
      return {
        data: [],
        tableName: "",
        error: ""
      }
    },
    methods: {
      submitForm() {
        axios.post('index.php?action=dia_login', {
          tableName: this.tableName,
          data: this.data
        }).then((res) => {
          if (res.data.status == "fail") {
            this.error = "Učet neexistuje";
          } else {
            window.location.href = 'profile';
          }
        })
      }
    },
    mounted() {
      this.tableName = this.params['tableName'];
      this.data = this.params['data'];
    }
  }
</script>
<template>
  <div class='d-flex justify-content-end' style="width:100%">
    <template v-if='Object.keys(data).length > 0'>
      <div class="">
        <button type="button" class="btn mb-2 mb-md-0 btn-primary btn-block mr-5" style="width:200px"><span>Oznámenia</span> 
          <div class="icon d-flex align-items-center justify-content-center">
            <i class="far fa-bell"></i>
          </div>
        </button>
      </div>
      <div class="">
        <button type="button" class="btn mb-2 mb-md-0 btn-secondary btn-block mr-5" style="width:200px"><span>Správy</span> 
          <div class="icon d-flex align-items-center justify-content-center">
            <i class="far fa-envelope"></i>
          </div>
        </button>
      </div>
      <div class="row ml-5 pl-5" style="width:200px">
        <div class='header-icon'>
          <img src='profile.jpg' alt='profile' style='width:100%'>
        </div>
        <p class="profile-name">{{ data.first_name }}</p>
        <div class='profile-logout'>
          <i @click="logout()" class="fas fa-sign-out-alt"></i>
        </div>
      </div>
    </template>
    <template v-else>
      <a href='login' class="btn mb-2 mb-md-0 btn-grey btn-block"><span>Prihlásiť</span> 
        <div class="icon d-flex align-items-center justify-content-center">
          <i class="fas fa-sign-in-alt"></i>
        </div>
      </a>
    </template>
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
        conditions: []
      }
    },
    methods: {
      loadData() {
        axios.post('index.php?action=dia_user_logged', {
          tableName: this.tableName,
          conditions: this.conditions
        }).then((res) => {
          if (res.data.status != 'fail') {
            this.data = res.data;
          }
        })
      },
      logout() {
        axios.post('index.php?action=dia_user_logout', {
          params: {
            logout: true
          }
        }).then((res) => {
          window.location.href = res.data;
        })
      }
    },
    mounted() {
      this.tableName = this.params['tableName'];
      this.conditions = this.params['conditions'];

      if (this.params['data'].length > 0) {
        this.data = this.params['data'];
      } else {
        this.loadData();
      }
    }
  }
</script>
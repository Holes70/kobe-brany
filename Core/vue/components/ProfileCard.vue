<template>
  <div class='row'>
    <template v-if='Object.keys(data).length > 0'>
      <div class='col-4'>
        <div class='header-icon'>
          <img src='profile.jpg' alt='profile' style='width:100%'>
        </div>
      </div>
      <div class='col-6'>
        <p>{{ data.first_name }}</p>
      </div>
      <div class='col-2 logout'>
        <i @click="logout()" class="fas fa-sign-out-alt"></i>
      </div>
    </template>
    <template v-else>
      <a href='login'>LOGIN</a>
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
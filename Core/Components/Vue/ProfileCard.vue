<template>
  <div class='d-flex justify-content-end' style="width:100%">
    <template v-if='Object.keys(data).length > 0'>
      <div class="">
        <dia-button :params="{
          button: 'primary',
          title: 'Oznámenia',
          icon: 'far fa-bell'
        }"></dia-button>
      </div>
      <div class="">
        <dia-button :params="{
          button: 'secondary',
          title: 'Správy',
          icon: 'fa-solid fa-message'
        }"></dia-button>
      </div>
      <div class="row ml-5 pl-5" style="width:200px">
        <a :href="url">
          <div class='header-icon'>
            <img src='profile.jpg' alt='profile' style='width:100%'>
          </div>
        </a>
        <a :href="url" class="profile-name">
          <p class="profile-name">{{ data.first_name }}</p>
        </a>
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
import diaButton from './Button.vue';

export default {
  components: {
    'dia-button': diaButton
  },
  props: ['params'],
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
    this.url = this.params['url'];

    if (this.params['data'].length > 0) {
      this.data = this.params['data'];
    } else {
      this.loadData();
    }
  }
}
</script>
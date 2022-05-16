<template>
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <div style="width:100px;">
              <router-link :to="{name: 'Domov'}" class="logo">
                <img src="assets/images/logo.png" alt="Chain App Dev">
              </router-link>
            </div>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li 
                v-for="menuItem in menuItems"
                :key="menuItem.id"
                class="scroll-to-section"
              >
                <a :href="'/holes/kobe-brany/web/#' + menuItem.link">{{ menuItem.title }}</a>
                <!--<router-link :to="'/holes/dia/web/#' + menuItem.link">
                  {{ menuItem.title }}
                </router-link>-->
              </li>
              <li>
                <div class="gradient-button-gold">
                  <router-link to="/holes/kobe-brany/web/produkty">Katalóg produktov</router-link>
                </div>
              </li> 
              <li>
                <div v-if="Object.keys(customer).length == 0" class="gradient-button">
                  <button 
                    type="button" 
                    data-toggle="modal" 
                    data-target="#modal-registracia" 
                    class="btn"
                  >
                    Zákaznícky účet
                  </button>
                </div>
                <div v-else>
                  <li class="text-center">
                    {{ customer.email }}
                    <br>
                    <a
                      href="http://localhost/holes/kobe-brany/web/Admin/index.php?action=odhlasit"
                      class="text-primary"
                    >
                      Odhlásiť sa 
                    </a>
                  </li>
                </div>
              </li> 
              <li>
                <router-link :to="{name: 'Kosik'}">
                  <i class="fas fa-shopping-cart"></i>
                </router-link>
              </li>
            </ul>        
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  
  <!-- ***** Header Area End ***** -->
  <router-view />
</template>

<script>
export default {
  data() {
    return {
      menuItems: [],
      customer: {}
    }
  },
  beforeMount() {
    axios.post('Admin/index.php?action=dia_select', {
      params: {
        tableName: "menu",
        conditions: {
          order_by: "order_index"
        }
      }
    }).then((res) => {
      this.menuItems = res.data['data'];
    })

    axios.get('Admin/index.php?action=prihlaseny_zakaznik')
    .then((res) => {
      if (res.data.status == 'fail') {
        this.customer = {};
        console.log(Object.keys(this.customer));
      } else {
        this.customer = res.data;
      }
    }) 
  }
}
</script>

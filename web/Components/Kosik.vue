<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    <div id="kosik" class="services">
      <div class="section container">
        <div v-if="Object.keys(data).legth > 0">
          <table class="table">
            <tbody>
              <tr v-for="item in data" :key="item.id">
                <td>{{ item.name }}</td>
                <td>{{ item.price_without_vat }}€</td>
                <td>{{ item.vat }}%</td>
                <td>{{ item.price }}€</td>
                <td>
                  <button 
                    @click="deleteItem(item.idCartProduct)"
                    class="btn btn-danger"
                  >
                    <i class="fas fa-times"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>

          <div class="row">
            <div class="col-6">
              <div class="box-item">
                <h4>
                  <a href="#">400</a>
                </h4>
                <p>Spolu</p>
              </div>
            </div>
            <div class="col-6">
              <router-link :to="{name: 'Objednavka'}">
                <div class="gradient-button"><a href="#">Prejsť k objednávke</a></div>
              </router-link>
            </div>
          </div>
        </div>
        <div v-else class="mt-5 text-center">
          <h1>Váš nákupný košík je prázdny</h1>
          <img 
            src="http://localhost/holes/kobe-brany/files/empty-cart.jpg" 
            alt="prazdny_kosik"
            style="height:250px;width:365px"
          >
        </div>
      </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      data: {}
    }
  },
  methods: {
    deleteItem(idCartProduct) {
      axios.post('Admin/index.php?action=dia_delete', {
        tableName: "carts_products",
        id: idCartProduct
      }).then(() => {
        this.loadData();
      })
    },  
    loadData() {
      axios.get('Admin/index.php?action=web_kosik')
      .then((res) => {
        if (res.data.status != 'fail') {
          this.data = res.data['data'];
        }
      })
    },
  },
  beforeMount() {
    this.loadData();
  }
}
</script>

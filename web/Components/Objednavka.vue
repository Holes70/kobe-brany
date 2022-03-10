<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    <div id="objednavka" class="services section">
      <div class="container">
        <form @submit="placeOrder"> 
          <div class="card">
            <div class="card-body">
              <div class="row">
                <div class="col-8">
                  <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="inputEmail4">Meno</label>
                      <input 
                        type="text" 
                        class="form-control" 
                        v-model="customer['first_name']"
                      >
                    </div>
                    <div class="form-group col-md-6">
                      <label for="inputPassword4">Priezvisko</label>
                      <input 
                        type="text" 
                        class="form-control" 
                        v-model="customer['last_name']"
                      >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputAddress">E-mail</label>
                    <input 
                      type="email" 
                      class="form-control" 
                      v-model="customer['email']"
                    >
                  </div>
                  <div class="form-group">
                    <label for="inputAddress">Telefónne číslo</label>
                    <input 
                      type="text" 
                      class="form-control" 
                      id="inputAddress" 
                      v-model="customer['phone_number']"
                    >
                  </div>
                </div>
                <div class="col-4">
                  <div class="row" v-for="item in data" :key="item.id">
                    <div class="col-6">
                      {{ item.name }}
                    </div>
                    <div class="col-3">
                      {{ item.price_without_vat }}€
                    </div>
                    <div class="col-3">
                      {{ item.price }}€
                    </div>
                  </div>
                  <h4>Spolu bez DPH: {{ spoluBezDph }}€</h4>
                  <h4>Spolu: {{ spolu }}€</h4>
                  <div class="gradient-button">
                    <input type="submit" class="btn" value="Záväzne objednať"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
</template>

<script>
export default {
  data() {
    return {
      data: {},
      spolu: 0,
      spoluBezDph: 0,
      customer: {}
    }
  },
  methods: {
    placeOrder(e) {
      e.preventDefault();

      //this.registrationSuccess = false;
      //this.emailExists = false;

      axios.post('Admin/index.php?action=web_vytvor_objednavku', {
        customer: this.customer 
      }).then((res) => {
        if (res.data.status != 'fail') {
          alert("Objednane");
        }
      })
    },
    loadData() {
      axios.get('Admin/index.php?action=web_kosik')
      .then((res) => {
        if (res.data.status != 'fail') {
          this.data = res.data['data'];
          this.spolu = res.data['spolu'];
          this.spoluBezDph = res.data['spoluBezDph'];
        }
      })

      axios.get('Admin/index.php?action=prihlaseny_zakaznik')
      .then((res) => {
        if (res.data.status == 'fail') {
          this.customer = {};
        } else {
          this.customer = res.data;
        }
      }) 
    },
  },
  beforeMount() {
    this.loadData();
  }
}
</script>

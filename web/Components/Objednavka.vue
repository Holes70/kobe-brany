<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    <div id="objednavka" class="services section">
      <div class="container">
        <template v-if="data.length > 0">
          <form @submit="placeOrder"> 
            <div class="card">
              <div class="card-body">
                <div class="row">
                  <div class="col-8">
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="meno">Meno</label>
                        <input 
                          type="text" 
                          class="form-control"
                          id="objednavka_meno" 
                          v-model="customer['first_name']"
                        >
                      </div>
                      <div class="form-group col-md-6">
                        <label for="priezvisko">Priezvisko</label>
                        <input 
                          type="text" 
                          class="form-control"
                          id="objednavka_priezvisko" 
                          v-model="customer['last_name']"
                        >
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputAddress">E-mail</label>
                      <input 
                        type="email" 
                        class="form-control"
                        id="objednavka_email" 
                        v-model="customer['email']"
                      >
                    </div>
                    <div class="form-group">
                      <label for="inputAddress">Telefónne číslo</label>
                      <input 
                        type="text" 
                        class="form-control" 
                        id="objednavka_tel_cislo" 
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
                    <h4 class="mt-2">Spolu bez DPH: {{ spoluBezDph }}€</h4>
                    <h4 class="mt-2">Spolu: {{ spolu }}€</h4>
                    <div class="gradient-button">
                      <input type="submit" class="btn btn-primary mt-2" value="Záväzne objednať"/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </template>
        <template v-else>
          <div class="text-center">
            <div class="h2">
              <p>Nie je tu nič na objednanie :(</p>
            </div>
            <router-link to="/holes/kobe-brany/web/produkty">Katalóg produktov</router-link>
          </div>
        </template>
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
      customer: {},
      error: false
    }
  },
  methods: {
    placeOrder(e) {
      e.preventDefault();

      this.error = false;

      if ($("#objednavka_tel_cislo").val() == "") {
        $("#objednavka_tel_cislo").focus();
        this.error = true;
      }

      if ($("#objednavka_email").val() == "") {
        $("#objednavka_email").focus();
        this.error = true;
      }

      if ($("#objednavka_priezvisko").val() == "") {
        $("#objednavka_priezvisko").focus();
        this.error = true;
      }

      if ($("#objednavka_meno").val() == "") {
        $("#objednavka_meno").focus();
        this.error = true;
      }

      if (this.error == false) {
        axios.post('Admin/index.php?action=web_vytvor_objednavku', {
          customer: this.customer 
        }).then((res) => {
          if (res.data.status != 'fail') {
            swal({
              title: "Vaša objednávka bola úspešne zaslaná, ďakujeme.",
              type: "success",
              showCancelButton: true,
              cancelButtonClass: "btn btn-outline-primary mt-4",
              confirmButtonClass: "btn btn-outline-secondary mt-4",
              confirmButtonText: "Prezerať daľšie produkty",
              cancelButtonText: "Zavrieť",
              closeOnConfirm: false,
              closeOnCancel: false,
            },
            function(isConfirm) {
              if (isConfirm) {
                window.location.href = 'produkty';
              } else {
                swal.close()
              }
            })
          }
        })
      } else {
        swal({
          title: "Údaje nie sú správne vyplnené",
          type: "error",
          showCancelButton: false,
          confirmButtonClass: "btn btn-secondary mt-2",
          confirmButtonText: "Skúsiť znova",
          closeOnConfirm: true,
          closeOnCancel: false,
        },
        function(isConfirm) {
          if (isConfirm) {
            swal.close()
          }
        });
      }
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

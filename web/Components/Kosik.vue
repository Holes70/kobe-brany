<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    <div id="kosik" class="services section">
      <div class="container">
        <table class="table table-striped">
          <tbody>
            <tr v-for="item in data" :key="item.id">
              <td>{{ item.name }}</td>
              <td>{{ item.price_without_vat }}€</td>
              <td>{{ item.vat }}%</td>
              <td>{{ item.price }}€</td>
              <td>
                <button class="btn btn-danger">Odstrániť</button>
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

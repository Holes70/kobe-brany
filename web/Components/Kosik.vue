<template>
  <div class="main-banner wow fadeIn" data-wow-duration="1s" data-wow-delay="0.5s"></div>
    <div id="kosik" class="services section">
      <div class="container">
        <table class="table table-striped">
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Otto</td>
              <td>@mdo</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Jacob</td>
              <td>Thornton</td>
              <td>@fat</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Larry</td>
              <td>the Bird</td>
              <td>@twitter</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
</template>

<script>
export default {
  methods: {
    loadData() {
      axios.post('Admin/index.php?action=dia_select', {
        params: {
          tableName: "carts",
          conditions: {
            where: {
              "carts.id": 1
            },
            join: {
              carts_products: {
                1: "id",
                2: "id_cart"
              }
            }
          }
        }
      }).then((res) => {
        console.log(res);
      })
    },
    beforeMount() {
      this.loadData();
    }
  }
}
</script>

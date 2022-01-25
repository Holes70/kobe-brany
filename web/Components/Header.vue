<template>
  <!-- ***** Header Area Start ***** -->
  <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="index.html" class="logo">
              <img src="assets/images/logo.png" alt="Chain App Dev">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li 
                v-for="menuItem in menuItems"
                :key="menuItem.id"
                class="scroll-to-section"
              >
                <a :href="menuItem.link">{{ menuItem.title }}</a>
              </li>
              <li><div class="gradient-button"><a id="modal_trigger" href="#modal"><i class="fa fa-sign-in-alt"></i> Sign In Now</a></div></li> 
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
</template>

<script>
export default {
  data() {
    return {
      menuItems: []
    }
  },
  beforeMount() {
    axios.post('Admin/index.php?action=dia_select', {
      params: {
        tableName: "menu",
        conditions: {}
      }
    }).then((res) => {
      this.menuItems = res.data;
    })
  }
}
</script>

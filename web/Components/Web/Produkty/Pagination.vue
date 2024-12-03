<template>
  <nav :id="componentName">
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <button 
          class="page-link"
          @click="loadPreviousPage()"
        >Prechádzajúca</button>
      </li>
      <li 
        v-for="page in pages" 
        :key="page" 
        class="page-item"
      >
        <button 
          @click="loadPage(page)"
          :class="pagination(page)"
        >{{ page }}</button>
      </li>
      <li class="page-item">
        <button 
          class="page-link"
          @click="loadNextPage()"
        >Ďalšia</button>
      </li>
    </ul>
  </nav>
</template>

<script>
var diaPagination = Object();
var f = Object();

export default {
  props: ['params'],
  data() {
    return Object.assign(diaPagination, {
      componentName: "pagination",
      pages: 0
    })
  },
  methods: {
    loadPage(page) {
      this.$parent.conditions['currentPage'] = page;
      f.addToUrl('page', page);

      // hideEdit obsahuje funckiu na novo nacitane data
      this.$parent.loadData();

      $('html, body').animate({
        scrollTop: $("#produkty").offset().top
      }, 500);
    },
    loadPreviousPage() {
      var currentPage = f.getUrlParam('page');

      if (currentPage != 1) {
        this.loadPage(currentPage - 1)
      }
      
    },
    loadNextPage() {
      var currentPage = f.getUrlParam('page');

      if (currentPage != this.pages) {
        this.loadPage(parseInt(currentPage) + 1)
      }
    },
    pagination(page) {
      return {
        'page-link': true,
        'btn btn-secondary': f.getUrlParam('page') == page
      }
    },
  },
  beforeCreate() {
    diaPagination = new Dia();
    f = new Functions();
  },
  beforeMount(){
    f.setComponentParams(this);

    setTimeout(() => { 
      this.pages = this.params['pages'];
    }, 300);

    // Init page 1
    if (typeof f.getUrlParam('page') == "undefined") {
      f.addToUrl('page', 1);
      this.$parent.conditions['currentPage'] = 1;
    }
   
  }
}
</script>
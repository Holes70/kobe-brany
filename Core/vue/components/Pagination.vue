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

export default {
  props: ['params'],
  data() {
    return Object.assign(diaPagination, {
      componentName: "pagination"
    })
  },
  methods: {
    loadPage(page) {
      this.conditions['currentPage'] = page;
      diaPagination.addToUrl('page', page);
      diaPagination.loadData(this, "dia_select_with_pagination", this.dataToSet);
    },
    loadPreviousPage() {
      var currentPage = diaPagination.getUrlParam('page');

      if (currentPage != 1) {
        this.loadPage(currentPage - 1)
      }
      
    },
    loadNextPage() {
      var currentPage = diaPagination.getUrlParam('page');

      if (currentPage != this.pages) {
        this.loadPage(parseInt(currentPage) + 1)
      }
    },
    pagination(page) {
      return {
        'page-link': true,
        'btn btn-secondary': diaTableLarge.getUrlParam('page') == page
      }
    },
  },
  beforeCreate() {
    diaPagination = new Dia();
  },
  beforeMount(){
    diaPagination.setComponentParams(this);
console.log(this.params['pages']);
    this.pages = this.params['pages'];
  }
}
</script>
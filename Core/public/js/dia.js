class Dia {

  addToUrl(param, data) {
    var url = new URL(window.location.href);
    url.searchParams.set(param, data);
    window.history.pushState({}, '', url);
  };

  deleteFromUrl(paramToDelete) {
    var url = new URL(window.location.href);
    url.searchParams.delete(paramToDelete);
    window.history.pushState({}, '', url);
  };

  getSearchParameters() {
    var prmstr = window.location.search.substr(1);
    return prmstr != null && prmstr != "" ? this.transformToAssocArray(prmstr) : {};
  }

  transformToAssocArray(prmstr) {
    var params = {};
    var prmarr = prmstr.split("&");
    for ( var i = 0; i < prmarr.length; i++) {
        var tmparr = prmarr[i].split("=");
        params[tmparr[0]] = tmparr[1];
    }
    return params;
  }

  getUrlParam(param) {
    var params = this.getSearchParameters();
    return params[param];
  };
 
}
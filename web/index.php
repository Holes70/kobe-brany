<?php

  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);

  session_start();
  ob_start();
  require_once(__DIR__ . '/../Core/boot.php');

  // Elasticsearch
  if ($dia->config['web']['elasticsearch']) {
    require "{$dia->config['dir']['root']}/vendor/autoload.php";

    $client = Elasticsearch\ClientBuilder::create()
      ->setHosts(['localhost:9200'])
      ->build()
    ;
  }
  
  $dia->autoload();

  $db = new \Core\DB();
  $vue = new \Core\Vue();
  $webController = new \Core\Controllers\WebController;

  echo "
    <!DOCTYPE html>
    <html lang='en'>
    <head>
      <meta charset='UTF-8'>
      <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>
      <meta name='description' content=''>
      <meta name='author' content=''>
      <link rel='preconnect' href='https://fonts.googleapis.com'>
      <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
      <link href='https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap' rel='stylesheet'>
  
      <title>Chain App Dev - App Landing Page HTML5 Template</title>
  
      <!-- Bootstrap core CSS -->
      <link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'>
  
      <script src='../Core/public/js/popper.js'></script>
      <script src='../node_modules/vue/dist/vue.global.prod.js'></script>
      <script src='../node_modules/axios/dist/axios.min.js'></script>
      <script src='../node_modules/chart.js/dist/chart.min.js'></script>
      <script src='../node_modules/jquery/dist/jquery.min.js'></script>
      <script src='../Core/public/js/bootstrap.js'></script>
      <script src='../node_modules/vue3-sfc-loader/dist/vue3-sfc-loader.js'></script>
      <script src='../node_modules/mitt/dist/mitt.umd.js'></script>
      <script src='../Core/public/js/CustomFunctions.js'></script>
      <script src='../Core/public/js/dia.js'></script>
      <script src='../Core/public/js/diaTables.js'></script>
      <script src='../Core/public/js/fontawesome.js'></script>
      <script src='../Core/public/js/fancybox.js'></script>
      <script src='https://unpkg.com/vue-router@4'></script>
      <script src='./assets/js/diaWeb.js'></script>
  
      <!-- Additional CSS Files -->
      <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.8.1/css/all.css' integrity='sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf' crossorigin='anonymous'>
      <link rel='stylesheet' href='assets/css/templatemo-chain-app-dev.css'>
      <link rel='stylesheet' href='assets/css/animated.css'>
      <link rel='stylesheet' href='assets/css/owl.css'>
      <link rel='stylesheet' href='assets/css/web.css'>
    </head>
  ";

  if (!isset($_GET['action']) && !isset($_POST['action'])) {
    echo " <body>
    <div id='app'>";
    @include 'Includes/header.php';

    //echo "<div id='app'>";
    // HLAVICKA 
    //if ($dia->installed) $dia->getPageHeader();
    // OBSAH
    $page = (isset($_GET['webPage']) && $_GET['webPage'] != '') ? $_GET['webPage'] : "domov";

    // Ked je prihlaseny redirect na profile nie login
    \Core\Controllers\UserController::checkIfUserLogged($page);

    // Nastav memory
    \Core\Controllers\WebController::setUrlForMemory($page);

    // Get page
    include "Pages/{$page}.php";

    // VUE LOADER START
  ?>
    <script type="module">
     const diaWeb = new DiaWeb();

      const options = {
        moduleCache: {
          vue: Vue
        },
        async getFile(url) {

          const res = await fetch(url);
          if ( !res.ok )
            throw Object.assign(new Error(res.statusText + ' ' + url), { res });
          return await res.text();
        },
        addStyle(textContent) {

          const style = Object.assign(document.createElement('style'), { textContent });
          const ref = document.head.getElementsByTagName('style')[0] || null;
          document.head.insertBefore(style, ref);
        },
      }

      const { loadModule } = window['vue3-sfc-loader'];

      const app_loader = Vue.createApp({
        components: {
          'website-component': Vue.defineAsyncComponent( () => loadModule('./Components/Header.vue', options)),
        },
        template: `<website-component></website-component>`
      });

      const { createRouter, createWebHistory, createWebHashHistory } = VueRouter
      const { createApp } = Vue;

      const router = createRouter({
        history: createWebHistory(),
        routes: [
          { path: diaWeb.rootUrl, component: Vue.defineAsyncComponent( () => loadModule('./Components/Website.vue', options)) },
          { path: diaWeb.rootUrl + '/produkty', component: Vue.defineAsyncComponent( () => loadModule('./Components/Produkty.vue', options)) },
        ],
      })

      app_loader.use(router);
      window.vm = app_loader.mount('#app');
    </script>

  <?php

    // ZAPATICKA
    //$dia->daj_zapaticku();

   // echo "</div></template></div>";
    
    @include 'Includes/footer.php';

    echo "</div></body>";

    echo "
      <script src='vendor/jquery/jquery.min.js'></script>
      <script src='vendor/bootstrap/js/bootstrap.bundle.min.js'></script>
      <script src='assets/js/owl-carousel.js'></script>
      <script src='assets/js/animation.js'></script>
      <script src='assets/js/imagesloaded.js'></script>
      <script src='assets/js/popup.js'></script>
      <script src='assets/js/custom.js'></script>
      </body>
      </html>
    ";

    // HLADA AKCIE
    $dia->action_find();

  } else {
    // Ajax volania

    $dia->AjaxAction();
  }
  ob_end_flush();
?>
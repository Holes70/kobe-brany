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

  $db = new \Core\Classes\DB();
  $vue = new \Core\Vue();
  $userController = new \Core\Controllers\UserController;
  $webController = new \Core\Controllers\WebController;

  if (!isset($_GET['action']) && !isset($_POST['action'])) {

    // HEAD
    //$dia->daj_zahlavie();
    @include 'Includes/header.php';

    echo "<div id='app'>";
    // HLAVICKA 
    //if ($dia->installed) $dia->getPageHeader();
    // OBSAH
    $page = (isset($_GET['webPage']) && $_GET['webPage'] != '') ? $_GET['webPage'] : "domov";

    // Ked je prihlaseny redirect na profile nie login
    $userController->checkIfUserLogged($page);

    // Nastav memory
    $webController->setUrlForMemory($page);

    // Get page
    include "Pages/{$page}.php";

    // VUE LOADER START
  ?>
    <script>
      const emitter = mitt();
      const dia = new Dia();
      const diaTables = new DiaTables();

      //console.log(emitter);
      // GET vue data z aktualnej stranky
      // ak je prazdne tak do var object kvoli chybe
      var diaData = JSON.parse('<?php $vue->getData() ?>');
      if (diaData == false) {
        diaData = {}; 
      }

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
          <?php
            foreach (\Core\Dia::$loadedWebComponents as $com) {
              echo "'$com': Vue.defineAsyncComponent( () => loadModule('./../Components/Admin/$com.vue', options)),";
            }
          ?> }
        ,
        template: `
          <body>
            <div class='wrapper'>
              <?php 
                foreach (\Core\Dia::$loadedComponents as $com) {
                  if ($com->render === TRUE) {
                    $com->preRender();
                  }
                }
              ?>
              </div><!-- end id content in header -->
            </div>
          </body>
        `,
        data() {
          return diaData
        },
        methods: { <?php $vue->getMethods(); ?> }
      });

      app_loader.mount('#app');

      <?php
        $dia->getScript();
      ?>

      $( document ).ready(function() {
        $('#loader').show();
        setTimeout(function() {
          $('.page-content').show();
          $('#loader').hide();
        }, 700)
      });

      function getFile() {
        $('#file').click();
      }

      function sub(obj) {
        var file = obj.value;
        var fileName = file.split("\\");
        document.getElementById("yourBtn").innerHTML = fileName[fileName.length - 1];
        $('#submitFile').show();
  
        event.preventDefault();
      }
    </script>

  <?php

    // ZAPATICKA
    $dia->daj_zapaticku();

    echo "</div></template></div>";
    
    // PATICKA
    $dia->getPageFooter();

    // HLADA AKCIE
    $dia->action_find();

  } else {
    // Ajax volania

    $dia->AjaxAction();
  }
  ob_end_flush();
?>
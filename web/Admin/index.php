<?php

  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);

  session_start();
  ob_start();
  require_once(__DIR__ . '/../../Core/boot.php');

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
  $webController = new \Core\Controllers\WebController;
  
  if (!isset($_GET['action']) && !isset($_POST['action'])) {
    
    // HEAD
    $dia->daj_zahlavie();

    echo "<div id='app'>";

    if (!empty(\Core\Controllers\UserController::getLogged())) {
      
      // HLAVICKA 
      $dia->getPageHeader();
      // OBSAH
      $page = (isset($_GET['webPage']) && $_GET['webPage'] != '') ? $_GET['webPage'] : $dia->web_home();

      // Ked je prihlaseny redirect na profile nie login
      \Core\Controllers\UserController::checkIfUserLogged($page);

      // Nastav memory
      \Core\Controllers\WebController::setUrlForMemory($page);

      // Get page
      include(\Core\Controllers\WebController::getPage());
    } else {
      include "Pages/login.php";
    }

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
          'dia-alert': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Alert.vue', options)),
          'dia-form': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Form.vue', options)),
          'dia-table': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Table.vue', options)),
          'dia-jumbotron': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Jumbotron.vue', options)),
          'dia-elasticsearch': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Elasticsearch.vue', options)),
          'dia-custom': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Custom.vue', options)),
          'dia-timer': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Timer.vue', options)),
          'dia-dropzone': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Dropzone.vue', options)),
          'dia-table-list': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/TableList.vue', options)),
          'chart': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Chart.vue', options)),
          'dia-listgroup': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/ListGroup.vue', options)),
          'dia-collapse': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Collapse.vue', options)),
          'dia-tiket': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Tiket.vue', options)),
          'dia-table-card': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/TableCard.vue', options)),
          'dia-profile-card': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/ProfileCard.vue', options)),
          'dia-profile-view': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/ProfileView.vue', options)),
          'dia-social': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Social.vue', options)),
          'dia-login': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Login.vue', options)),
          'dia-memory': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Memory.vue', options)),
          'dia-table-large': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/TableLarge.vue', options)),
          'json-editor': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/JsonEditor.vue', options)),
          'dia-calendar': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Calendar.vue', options)),
          'dia-gallery': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Gallery.vue', options)),
          'dia-file-uploader': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/FileUploader4.vue', options)),
          'dia-form-new': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Form2.vue', options)),
          'dia-row': Vue.defineAsyncComponent( () => loadModule('./../../Core/vue/components/Row.vue', options)),
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
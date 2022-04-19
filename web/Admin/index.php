<?php

  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);

  session_start();
  ob_start();

  header('Access-Control-Allow-Origin: *');
  header("Access-Control-Allow-Headers: *");

  require_once __DIR__ . '/../../Core/boot.php';
  require_once $dia->config['dir']['root'] ."/vendor/autoload.php";
  
  $dia->autoload();

  $db = new \Core\DB();
  $vue = new \Core\Vue();

  if (!isset($_GET['action']) && !isset($_POST['action'])) {
    
    // HEAD
    $dia->daj_zahlavie();

    echo "<div id='app'>";

    if (!empty(\Core\Controllers\UserController::getLogged())) {
      
      // HLAVICKA 
      $dia->getPageHeader();
      // OBSAH
      $page = (isset($_GET['webPage']) && $_GET['webPage'] != '') ? $_GET['webPage'] : $dia->web_home();
      
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
      const f = new Functions();

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
          'dia-alert': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Alert.vue', options)),
          'dia-form': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Form.vue', options)),
          'dia-table': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Table.vue', options)),
          'dia-jumbotron': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Jumbotron.vue', options)),
          'dia-elasticsearch': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Elasticsearch.vue', options)),
          'dia-custom': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Custom.vue', options)),
          'dia-timer': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Timer.vue', options)),
          'dia-dropzone': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Dropzone.vue', options)),
          'dia-table-list': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/TableList.vue', options)),
          'chart': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Chart.vue', options)),
          'dia-listgroup': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/ListGroup.vue', options)),
          'dia-collapse': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Collapse.vue', options)),
          'dia-tiket': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Tiket.vue', options)),
          'dia-table-card': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/TableCard.vue', options)),
          'dia-profile-card': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/ProfileCard.vue', options)),
          'dia-profile-view': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/ProfileView.vue', options)),
          'dia-social': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Social.vue', options)),
          'dia-login': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Login.vue', options)),
          'dia-memory': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Memory.vue', options)),
          'dia-table-large': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/TableLarge.vue', options)),
          'json-editor': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/JsonEditor.vue', options)),
          'dia-calendar': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Calendar.vue', options)),
          'dia-gallery': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Gallery.vue', options)),
          'dia-file-uploader': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/FileUploader4.vue', options)),
          'dia-form-new': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Form2.vue', options)),
          'dia-row': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Row.vue', options)),
          'dia-messages': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Messages.vue', options)),
          'dia-button': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/Button.vue', options)),
          'dia-export-csv': Vue.defineAsyncComponent( () => loadModule('./../../Core/Components/Vue/ExportCSV.vue', options)),
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

        if (sessionStorage.getItem("navbarCollapsed") == "true") {
          $('#sidebar span').toggle();
          $('#sidebarCollapse i').removeClass("fa-arrow-left").addClass("fa-arrow-right");
          $('#sidebar').addClass("active");
        }
      });

      $('#sidebarCollapse').click(() => {
        $('#sidebar span').toggle();

        if (sessionStorage.getItem("navbarCollapsed") == "true") {
          sessionStorage.removeItem("navbarCollapsed");
          sessionStorage.setItem("navbarCollapsed", false);
          console.log(sessionStorage.getItem("navbarCollapsed"));
          $('#sidebarCollapse i').removeClass("fa-arrow-right").addClass("fa-arrow-left");
        } else {
          sessionStorage.removeItem("navbarCollapsed");
          sessionStorage.setItem("navbarCollapsed", true);
          console.log(sessionStorage.getItem("navbarCollapsed"));
          $('#sidebarCollapse i').removeClass("fa-arrow-left").addClass("fa-arrow-right");
        }
      })

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
    echo $dia->getPageFooter();

    echo "</div>";

    // HLADA AKCIE
    $dia->action_find();

  } else {
    // Ajax volania

    $dia->AjaxAction();
  }
  ob_end_flush();
?>
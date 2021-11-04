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

  if (!isset($_GET['json_action'])) {

    // HEAD
    $dia->daj_zahlavie();

    if ($dia->installed) {
      echo "<div id='app'>";
      // HLAVICKA 
      if ($dia->installed) $dia->getPageHeader();
      // OBSAH
      $page = (isset($_GET['webPage']) && $_GET['webPage'] != '') ? $_GET['webPage'] : $dia->web_home();

      foreach ($dia->pages as $podstranka) {
        if ($podstranka != '' && $podstranka == $page) {
          include "{$dia->config['dir']['root']}/web/Admin/{$dia->config['web']['pages']}/{$page}.php";
        }
      }
    } else {
      include "Core/public/web/pages/install.php";
    }

    // VUE LOADER START
  ?>
    <script>
      const emitter = mitt();
     // const dia = new Dia();

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
            <draggable 
              v-model="myArray" 
              group="people" 
              @start="drag=true" 
              @end="drag=false" 
              item-key="id">
              <template #item="{element}">
                <div>{{element.name}}</div>
              </template>
            </draggable>
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
        $('.loader').show();
        setTimeout(function() {
          $('#content').show();
          $('.loader').hide();
        }, 500)
      });

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
    // HLADA AKCIE JSON
    $dia->json_action_find();
  }
  ob_end_flush();
?>
<?php

namespace Core {
  class Dia {

    public static $loadedComponents = [];
    public static $loadedWebComponents = [];

    public $config, $con, $installed;
    public $pages = array();
    public $components = array();
    //public $showedComponents = array();

    public $script = "";

    public function __construct() {
      global $config, $con;

      $this->config = $config;
      $this->con = $con;

      $this->najdi_podstranky();
      $this->check_install();
      $this->najdi_vue_componenty();
    }

    // ZAKLADNE FUNKCIE
    private function najdi_podstranky() {
      $pages = scandir("web/" . $this->config['web']['pages']);

      foreach ($pages as $page) {
      $this->pages[] = substr($page, 0, -4);
      }

    }

    private function najdi_vue_componenty() {
      $pages = scandir("web/" . $this->config['web']['vue_components']);

      foreach ($pages as $page) {
      $this->components[] = substr($page, 0, -4);
      }

    }

    /**
     * Call custom Component from
     * web/components directory
     * @return void
     */
    public function vue($name) {
      $component = new \Core\Component($name);

      array_push(self::$loadedWebComponents, $name);

      return $component;
    }

    /**
     * Create custom Vue Component
     * from HTML in .php file
     */
    public function html(string $html) {
      $htmlComponent = new \Components\Custom("html");
      $htmlComponent->setHtml($html);

      return $htmlComponent;
    }

    /**
     * TEMPLATE METHOD
     * Create template with will 
     * render Vue components
     * @return void
     */
    public function template(string $html) {
      return $this->html($html);
    }

    public function setScript(string $script) {
      $this->script .= $script;
    }

    public function getScript() {
      echo $this->script;
    }

    public function daj_zahlavie() {
      $css_files = ""; $script_files = "";  $bootstrap = ""; $vue = "";

      foreach ($this->config['head']['css'] as $value) {
        $css_files .= "<link rel='stylesheet' href='web/public/css/$value'>"; 
      }

      foreach ($this->config['head']['script'] as $value) {
        $script_files .= "<script src='web/public/js/$value'></script>"; 
      }

      if ($this->config['web']['bootstrap']) {
        $bootstrap = "<link rel='stylesheet' href='Core/public/css/bootstrap.min.css'>";
        $script_files .= "<script src='Core/public/js/bootstrap.js'></script>";
      }

      if ($this->config['web']['dropzone']) {
        $dropzone = "
          <link rel='stylesheet' type='text/css' href='Core/public/css/basic.css'>
          <link rel='stylesheet' type='text/css' href='Core/public/css/dropzone.min.css'>
          <script src='Core/public/js/dropzone.js'></script>
        ";
      }

      if ($this->config['web']['vega']) {
        $vega = "<link rel='stylesheet' href='Core/public/css/vega.css'>";
      }

      if ($this->config['web']['vue']) {
        $vue = "
          <script src='Core/public/js/vue.js'></script>
          <script src='Core/public/js/axios.js'></script>
          <script src='Core/public/js/sfc-loader.js'></script>
          <script src='https://unpkg.com/mitt/dist/mitt.umd.js'></script>
        ";
      }

      echo "
        <!DOCTYPE html>
        <html lang='{$this->config['head']['lang']}'>
        <meta charset='{$this->config['head']['charset']}'>
        <head>
          {$bootstrap}
          {$dropzone}
          {$vega}
          {$css_files}
          {$script_files}
          {$vue}
        </head>
        <body> 
      ";
    }

    public function daj_hlavicku() {
      @include "web/{$this->config['web']['includes']}/header.php";
    }

    public function daj_paticku() {
      @include "web/{$this->config['web']['includes']}/footer.php";
    }

    public function daj_zapaticku() {
      echo "<script src='Core/public/js/dia.js'></script>";
    }

    public function action($action) {
      return "<input type='hidden' name='token' value=$action>";
    }

    public function redirect($redirect, $alert = array()) {
      $string_alert = "&alert=on";

      if (isset($alert)) {

        foreach ($alert as $key => $value) {
          $string_alert .= "&" . $key . "=" . $value;
        }

      }
      header("Location: index.php?page={$redirect}{$string_alert}");
    }

    public function find_alert() {
      if (isset($_GET['alert'])) {
        return $_GET;
      }
    }

    protected function check_install() {
      global $con;

      if (!$con->query("SELECT * FROM admin WHERE id = 1")) {
        $this->installed = FALSE;
      } else {
        $this->installed = TRUE;
      }
    }

    public function autoload() {
      spl_autoload_register(function ($className) {

        $parts = explode('\\', $className);
        $className = str_replace("\\", "/", $className);

        if (file_exists($this->config['dir']['root'] . '/' . $className . '.php')) {
          require_once $className . '.php';
        } else if (file_exists($this->config['dir']['root']. '/Core//' . $className . '.php')) {
          require_once 'Core/' . $className . '.php';
        }

      });
    }

    public function action_find() {
      $url_params = $_SERVER['QUERY_STRING'];

      $form_data= explode("&", $url_params);
      $token = array_shift($form_data);
      $action_name = explode("=", $token);

      $token_check = strrpos($url_params, "token");

      if ($token_check === 0) {
      $explode_1 = explode("=", $url_params);
      $explode_2 = explode("&", $explode_1[1]);

      // AK SA NACHDADZA SLOVO DIA SMERUJE TO NA CORE AKCIU
      if ((strstr($action_name[1], '_', true)) == "dia") {
        return include ("Core/public/web/actions/" . $action_name[1] . ".php");
      } else {
        return include ("web/{$this->config['web']['actions']}/" . $action_name[1] . ".php");
      }

      }
    }

    public function json_action_find() {
      
      $json_action = isset($_GET['json_action']) ? $_GET['json_action'] : '';

      if ((strstr($json_action, '_', true)) == "dia") {
        return include ("Core/public/web/actions/" . $json_action . ".php");
      } else {
        return include ("web/{$this->config['web']['actions']}/" . $json_action . ".php");
      }
    }

    protected function error_function($error) {
      echo "<h1>Nezadany parameter:</h1>";
      echo "<h2>{$error}</h2>";
    }

    // SUBOROVE FUNKCIE

    public function read_folder($folder) {
      $files= scandir("web/" . $this->config['web']['files'] . "/{$folder}");
      unset($files[0]);
      unset($files[1]);

      foreach ($files as $file) {
        ${substr($file, 0, -4)} = readfile("web/" . $this->config['web']['files'] . "/{$folder}/{$file}");

        echo ${substr($file, 0, -4)};
        echo "<br><br>";
      }
    }

    // CONFIG FUNKCIE
    public function web_home() {
      return $this->config['web']['home'];
    }

    public function web_actions() {
      return $this->config['web']['actions'];
    }

    public function web_includes() {
      return $this->config['web']['includes'];
    }

    public function web_pages() {
      return $this->config['web']['pages'];
    }

    public function web_files() {
      return $this->config['web']['files'];
    }

    public function dir_root() {
      return $this->config['dir']['root'];
    }

    // TESTOVACIE FUNKCIE
    public function get_config() {
      print_r($this->config);
    }

    public function get_con() {
      print_r($this->con);
    }

  }
}

?>
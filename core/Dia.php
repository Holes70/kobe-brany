<?php

namespace Core {
  class Dia {

    public $config, $con, $installed;
    public $pages = array();
    public $components = array();
    //public $showedComponents = array();

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

    public function vue($name) {
      if (isset($GLOBALS['vue_components'])) {
        array_push($GLOBALS['vue_components'], $name);
      } else {
        $GLOBALS['vue_components']  = array();
        array_push($GLOBALS['vue_components'], $name);
      }
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
        $bootstrap = "<link rel='stylesheet' href='core/public/css/bootstrap.min.css'>";
        $script_files .= "<script src='core/public/js/bootstrap.js'></script>";
      }

      if ($this->config['web']['vue']) {
        $vue = "
          <script src='core/public/js/vue.js'></script>
          <script src='core/public/js/axios.js'></script>
          <script src='core/public/js/sfc-loader.js'></script>
        ";
      }

      echo "
        <!DOCTYPE html>
        <html lang='{$this->config['head']['lang']}'>
        <meta charset='{$this->config['head']['charset']}'>
        <head>
          {$bootstrap}
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
      echo "<script src='core/public/js/dia.js'></script>";
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
        return include ("core/public/web/actions/" . $action_name[1] . ".php");
      } else {
        return include ("web/{$this->config['web']['actions']}/" . $action_name[1] . ".php");
      }

      }
    }

    public function json_action_find() {
      
      $json_action = isset($_GET['json_action']) ? $_GET['json_action'] : '';

      if ((strstr($json_action, '_', true)) == "dia") {
        return include ("core/public/web/actions/" . $json_action . ".php");
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

    public function vue_component_loader($_this) {
      // TOTO HODIT DO DIE!
      if (isset($GLOBALS['dia_vue_components'])) {
        array_push($GLOBALS['dia_vue_components'], $_this);
        //array_push($this->showedComponents, $_this);
      } else {
        $GLOBALS['dia_vue_components'] = array();
        array_push($GLOBALS['dia_vue_components'], $_this);
        //array_push($this->showedComponents, $_this); 
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
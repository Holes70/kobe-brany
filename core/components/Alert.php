<?php

namespace Alert {

  class Component extends \DB {
    public $con;

    public $text;
    public $footerText;
    public $title;
    public $type;
    public $alertId;

    public function __construct($text) {
      global $con;
      $this->con = $con;
      $this->text = $text;

      $this->vue_component_loader($this);
    }

    public function title($title) {
      $this->title = $title;
      return $this;
    }

    public function footer($text) {
      $this->footerText = $text;
      return $this;
    }

    public function id($alertId) {
      $this->alertId = $alertId;
      return $this;
    }

    public function show() {
      return "
        <dia-alert 
          alertId={$this->alertId}
          title=\"{$this->title}\"
          footerText=\"{$this->footerText}\"
          text=\"{$this->text}\"
        ></dia-alert>
      ";
    }

    public function render() {
      echo $this->show();
    }

  }

  class Creater extends \DB {
    public $con;

    public $text;
    public $footerText;
    public $title;
    public $type;

    public function __construct() {
      global $con;

      $this->con = $con;
    }

    public function insert($params = []) {
      $this->title = $params['title'];
      $this->footerText = $params['footerText'];
      $this->text = $params['text'];
      $this->type = $params['type'];

      return $this;
    }

    public function getAlerts() {
      return $this->select("dia_alerts", NULL, NULL, FALSE);
    }

  }

}

?>
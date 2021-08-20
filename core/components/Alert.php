<?php

namespace Components {

  class Alert extends \Core\Component {
    public $con;

    public $text;
    public $footerText;
    public $title;
    public $type = 1;
    public $alerType = "alert-success";
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

    public function type($type) {
      switch ($type) {
        case 1:
          $this->alerType = "alert-success";
        break;
        case 2:
          $this->alerType = "alert-warning";
        break;
        case 3:
          $this->alerType = "alert-danger";
        break;
      }
      
      $this->type = $type;

      return $this;
    }

    public function show() {
      return "
        <dia-alert 
          alertId={$this->alertId}
          title=\"{$this->title}\"
          footerText=\"{$this->footerText}\"
          text=\"{$this->text}\"
          type={$this->type}
          alertType=\"{$this->alerType}\"
        ></dia-alert>
      ";
    }

    public function render() {
      echo $this->show();
    }

  }

  class Creater extends \Core\Classes\DB {
    public $con;

    public function __construct() {
      global $con;

      $this->con = $con;
    }

    public function insert($params = []) {
      $this->insert_array([
        'table' => 'dia_alerts',
        'table_data' => [
          "title" => $params['title'],
          "footer_text" => $params['footer_text'],
          "type" => $params['type'],
          "expiration" => $params['expiration']
        ]
      ]);

      return $this;
    }

    public function getAlerts() {
      return $this->select(
        "dia_alerts", 
        NULL, 
        NULL, 
        FALSE
      );
    }

  }

}

?>
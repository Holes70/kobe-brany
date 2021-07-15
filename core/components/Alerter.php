<?php

namespace Alerter {

  class Component extends \DB {
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
      return $this->db->select("dia_alerts");
    }

  }

}

?>
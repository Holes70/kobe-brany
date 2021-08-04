<?php

namespace Elasticsearch {

  class Component extends \DB {
    public $con;

    private $index;

    public function __construct($index) {
      global $con;
      $this->con = $con;

      $this->index = $index;

      $this->vue_component_loader($this);
    }

    public function inputs($params = array()) {
      $this->showInputs = $params;
      return $this;
    }

    public function show() {
      return "
        <dia-elasticsearch 
          index=\"{$this->index}\"
        ></dia-elasticsearch>";
    }

    public function render() {
      echo $this->show();
    }

  }

}

?>
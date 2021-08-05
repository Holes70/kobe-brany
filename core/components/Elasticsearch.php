<?php

namespace Elasticsearch {

  class Component extends \DB {
    public $con;

    private $index;
    private $columns;

    public function __construct($index) {
      global $con;
      $this->con = $con;

      $this->index = $index;

      $this->vue_component_loader($this);
    }

    public function searchFields($params = array()) {
      $this->columns = $params;
      return $this;
    }

    public function show() {
      $columnsJSON = $this->columns ? json_encode($this->columns) : [];

      return "
        <dia-elasticsearch 
          index=\"{$this->index}\"
          searchFields='$columnsJSON'
        ></dia-elasticsearch>";
    }

    public function render() {
      echo $this->show();
    }

  }

}

?>
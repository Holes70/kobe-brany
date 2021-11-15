<?php

namespace Components {

  class Social extends \Core\Component {

    private array $data = [];
    //private string $tableName = "";

    public function __construct(string $tableName) {
      parent::__construct($this);

      $this->tableName = $tableName;
    }

    public function data(array $data) {
      $this->data = $data;
      return $this;
    }

    public function show() {
      return "
        <dia-social :params='{
          tableName: \"{$this->tableName}\",
          conditions: ".json_encode($this->conditions).",
          data: ".json_encode($this->data)."
        }'></dia-social>
      ";
    }

  }

}

?>
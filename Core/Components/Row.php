<?php

namespace Components {

  class Row extends \Core\Component {

    public function __construct(public string $tableName) {
      parent::__construct($this);
    }

    public function show() {
      return "
        <dia-row :params='{
          tableName: \"{$this->tableName}\",
          conditions: ".json_encode($this->conditions).",
          data: ".json_encode($this->data)."
        }'></dia-row>
      ";
    }

  }

}

?>
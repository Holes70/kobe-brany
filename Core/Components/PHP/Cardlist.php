<?php

namespace Component {

  class Cardlist extends \Core\Component {
    
    public function __construct(public string $tableName) {
      parent::__construct($this);
    }

    public function show() {
      return "
        <dia-card-list :params='{
          tableName: \"{$this->tableName}\",
          conditions: ".json_encode($this->conditions).",
          data: ".json_encode($this->data)."
        }'></dia-card-list>
      ";
    }
  
  }

}
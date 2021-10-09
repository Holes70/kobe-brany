<?php

namespace Components {

  class Dropzone extends \Core\Component {

    public string $tableName;
    private string $conditions = '{}';
    
    public function __construct($tableName) {
      parent::__construct($this);

      $this->tableName = $tableName;
    }

    public function conditions(array $conditions) : object {
      $this->conditions = json_encode($conditions);
      return $this;
    }

    public function show() {
      return "
        <dia-dropzone
          tableName={$this->tableName}
          :conditions='{$this->conditions}'
        ></dia-dropzone>";
    }
  
  }

}
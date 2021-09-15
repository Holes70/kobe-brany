<?php

namespace Components {

  class Dropzone extends \Core\Component {

    public $tableName;
    
    public function __construct($tableName) {
      parent::__construct($this);

      $this->tableName = $tableName;
    }

    public function show() {
      return "
        <dia-dropzone
          table_name={$this->tableName}
        ></dia-dropzone>";
    }
  
  }

}
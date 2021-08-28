<?php

namespace Core {

  class Component extends \Core\Classes\DB {

    public $tableStructure = NULL;
    public $customComponentName = NULL;

    /**
     * Specific component[e.g.: Alert] 
     * object push into Component constructor
     * @return 
     */
    public function __construct($_this) {
      parent::__construct();

      $this->VueComponentLoader($_this);
      $this->getTableStructure();
    }

    /**
     * Write created Component into GLOBALS
     * Use for Vue render()
     * @return 
     */
    public function VueComponentLoader($_this) {

      if (is_object($_this)) {
        if (isset($GLOBALS['dia_vue_components'])) {
          array_push($GLOBALS['dia_vue_components'], $_this);
        } else {
          $GLOBALS['dia_vue_components'] = array();
          array_push($GLOBALS['dia_vue_components'], $_this);
        }
      } else {
        $this->customComponentName = $_this;
        $this->VueComponentLoader($this);
      }
    }

    // overwrite in compoennt
    public function show() {
      return "<{$this->customComponentName}/>";
    }

    public function render() {
      echo $this->show();
    }

    /**
     * GET JSON table structure for
     * required fields and else settings
     * @return
     */
    public function getTableStructure() {
      $diaTables = 
        $this->select(
          $this->config['dia_tables'],
          [],
          [],
          FALSE
        )
      ;

      $this->tableStructure = 
        json_decode(
          $diaTables[0]['structure']
        )
      ;

      $this->tableName = $diaTables[0]['table_name'];
    }

    public function getTableRequiredFields(string $tableName) {
      $requiredFields = [];

      foreach ($this->tableStructure as $tableColumn => $val) {
        if ($this->tableName == $tableName) {
          if ($val->required === TRUE) {
            array_push($requiredFields, $tableColumn);
          }
        }
      }

      return $requiredFields;
    }

    public function getTableLookupFields(string $tableName) {
      foreach ($this->tableStructure as $column => $val) {
        if ($val->lookup) {
          var_dump($val->lookup->table);
        }
      }
    }

  }

}
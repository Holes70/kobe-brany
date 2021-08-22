<?php

namespace Core {

  class Component extends \Core\Classes\DB {

    public $tableStructure = NULL;

    /**
     * Specific component[e.g.: Alert] 
     * object push into Component constructor
     * @return 
     */
    public function __construct(object $_this) {
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
      if (isset($GLOBALS['dia_vue_components'])) {
        array_push($GLOBALS['dia_vue_components'], $_this);
      } else {
        $GLOBALS['dia_vue_components'] = array();
        array_push($GLOBALS['dia_vue_components'], $_this);
      }
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
    }

    public function getTableRequiredFields() {
      $requiredFields = [];

      foreach ($this->tableStructure as $column => $val) {
        if ($val->required == "true") {
          array_push($requiredFields, $column);
        }
      }

      return $requiredFields;
    }

  }

}
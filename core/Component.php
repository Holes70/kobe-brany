<?php

namespace Core {

  class Component extends \Core\Classes\DB {

    /**
     * Specific component[e.g.: Alert] 
     * object push into Component constructor
     * @return 
     */
    public function __construct(object $_this) {
      parent::__construct();

      $this->VueComponentLoader($_this);
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

  }

}
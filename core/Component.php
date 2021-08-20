<?php

namespace Core {

  class Component extends \Core\Classes\DB {

    public function __construct(object $_this) {
      parent::__construct();

      $this->vue_component_loader($_this);
    }

  }

}
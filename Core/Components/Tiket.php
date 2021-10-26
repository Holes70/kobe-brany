<?php

namespace Components {

  class Tiket extends \Core\Component {
    public function __construct() {
      parent::__construct($this);
    }

    public function show() {
      return "
        <dia-tiket
        ></dia-tiket>
      ";
    }

  }

}
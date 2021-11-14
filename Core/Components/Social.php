<?php

namespace Components {

  class Social extends \Core\Component {

    private array $data = [];

    public function __construct() {
      parent::__construct($this);
    }

    public function data(array $data) {
      $this->data = $data;
      return $this;
    }

    public function show() {
      return "
        <dia-social :params='{
          data: \"".json_encode($this->data)."\"
        }'></dia-social>
      ";
    }

  }

}

?>
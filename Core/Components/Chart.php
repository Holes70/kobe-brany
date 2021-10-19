<?php

namespace Components {

  class Chart extends \Core\Component {

    private string $type;

    public function __construct(string $type) {
      parent::__construct($this);

      $this->type = $type;
    }

    public function show() {
      return "
        <chart
          type=\"{$this->type}\"
        ></chart>
      ";
    }

  }

}

?>
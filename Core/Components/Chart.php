<?php

namespace Components {

  class Chart extends \Core\Component {

    private string $type = "";
    private string $label = "";
    private array $labels = [];
    private array $data = [];

    public function __construct(string $type) {
      parent::__construct($this);

      $this->type = $type;
    }

    public function labels(array $labels): object {
      $this->labels = $labels;
      return $this;
    }

    public function data(array $data): object {
      $this->data = $data;
      return $this;
    }

    public function label(string $label): object {
      $this->label = $label;
      return $this;
    }

    public function show() {
      return "
        <chart :params='{
          type: \"{$this->type}\",
          labels: ".json_encode($this->labels).",
          data: ".json_encode($this->data).",
          label: \"{$this->label}\",
          uid: \"{$this->uid}\"
        }'></chart>
      ";
    }

  }

}

?>
<?php

namespace Components {

  class TableLarge extends \Core\Component {

    private array $buttons = [];

    public function __construct(public string $tableName) {
      parent::__construct($this);
    }

    public function buttons(array $buttons) {
      $this->buttons = $buttons;
      return $this;
    }

    public function show() {
      return "
        <dia-table-large :params='{
          tableName: \"{$this->tableName}\",
          conditions: ".json_encode($this->conditions).",
          data: ".json_encode($this->data).",
          buttons: ".json_encode($this->buttons)."
        }'></dia-table-large>
      ";
    }

  }

}

?>
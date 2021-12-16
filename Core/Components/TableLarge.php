<?php

namespace Components {

  class TableLarge extends \Core\Component {

    private array $buttons = [];
    private string $emptyDataMessage = "";

    public function __construct(public string $tableName) {
      parent::__construct($this);
    }

    public function buttons(array $buttons) {
      $this->buttons = $buttons;
      return $this;
    }

    public function emptyDataMessage(string $message) {
      $this->emptyDataMessage = $message;
      return $this;
    }

    public function show() {
      return "
        <dia-table-large :params='{
          tableName: \"{$this->tableName}\",
          conditions: ".json_encode($this->conditions).",
          data: ".json_encode($this->data).",
          buttons: ".json_encode($this->buttons).",
          emptyDataMessage: \"{$this->emptyDataMessage}\"
        }'></dia-table-large>
      ";
    }

  }

}

?>
<?php

namespace Components {

  class Login extends \Core\Component {

    public function __construct(public String $tableName) {
      parent::__construct($this);
    }

    public function loginInput(string $loginInput) {
      $this->data['loginInput'] = $loginInput;
      return $this;
    }

    public function show() {
      return "
        <dia-login :params='{
          tableName: \"{$this->tableName}\",
          data: ".json_encode($this->data)."
        }'></dia-login>
      ";
    }

  }

}

?>
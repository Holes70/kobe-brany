<?php

namespace Components {

  class ProfileView extends \Core\Component {

    public function __construct(string $tableName) {
      parent::__construct($this);

      $this->tableName = $tableName;
    }

    public function show() {
      return "
        <dia-profile-view :params='{
          tableName: \"{$this->tableName}\",
          conditions: ".json_encode($this->conditions).",
          data: ".json_encode($this->data)."
        }'></dia-profile-view>
      ";
    }

  }

}

?>
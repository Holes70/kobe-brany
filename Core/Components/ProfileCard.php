<?php

namespace Components {

  class ProfileCard extends \Core\Component {

    public int $idUser = 0;

    public function __construct(public String $tableName) {
      parent::__construct($this);
    }

    public function idUser(int $idUser) {
      $this->idUser = $idUser;
      return $this;
    }

    public function show() {
      return "
        <dia-profile-card :params='{
          tableName: \"{$this->tableName}\",
          data: ".json_encode($this->data).",
          idUser: {$this->idUser}
        }'></dia-profile-card>
      ";
    }

  }

}

?>
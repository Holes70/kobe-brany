<?php

namespace Components {

  class ProfileCard extends \Core\Component {

    private string $img = "profile.jpg";
    private string $name = "Firstname Lastname";

    public function __construct() {
      parent::__construct($this);
    }

    public function img(string $img) {
      $this->img = $img;
      return $this;
    }

    public function name(string $name) {
      $this->name = $name;
      return $this;
    }

    public function show() {
      return "
        <dia-profile-card :params='{
          name: \"{$this->name}\",
          img: \"{$this->img}\"
        }'></dia-profile-card>
      ";
    }

  }

}

?>
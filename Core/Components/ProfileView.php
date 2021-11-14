<?php

namespace Components {

  class ProfileView extends \Core\Component {

    private string $img = "profile.jpg";
    private string $name = "Firstname Lastname";
    private array $nameOnClick = [];

    private string $desc = "";
    private string $desc2 = "";

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

    public function desc(string $desc) {
      $this->desc = $desc;
      return $this;
    }

    public function desc2(string $desc) {
      $this->desc2 = $desc;
      return $this;
    }

    public function show() {
      return "
        <dia-profile-view :params='{
          name: \"{$this->name}\",
          img: \"{$this->img}\",
          desc: \"{$this->desc}\",
          desc2: \"{$this->desc2}\"
        }'></dia-profile-view>
      ";
    }

  }

}

?>
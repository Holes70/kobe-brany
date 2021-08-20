<?php

namespace Components {

  class Jumbotron extends \Core\Component {
    public $con;

    public $title;
    public $topText;
    public $body;
    public $link;

    public function __construct() {
      global $con;

      $this->con = $con;
      $this->vue_component_loader($this);
    }

    public function title($param) {
      $this->title = $param;
      return $this;
    }

    public function topText($param) {
      $this->topText = $param;
      return $this;
    }

    public function body($param) {
      $this->body = $param;
      return $this;
    }

    public function link($param) {
      $this->link = $param;
      return $this;
    }

    public function show() {
      return "
        <dia-jumbotron 
          :params='{
            title: \"{$this->title}\",
            topText: \"{$this->topText}\",
            body: \"{$this->body}\",
            link: \"{$this->link}\"
          }'
        ></dia-jumbotron>
      ";
    }

    public function render() {
      echo $this->show();
    }

  }

}
<?php

namespace Core\Controllers {

  class UserController extends \Core\Classes\DB {

    public function setLogged() {
      $_SESSION['logged'] = true;
    }

    public function destroyLogged() {
      unset($_SESSION['logged']);
    }

    public function getLogged() {
      return $_SESSION['logged'];
    }

    public function getLoggedUser() {
      return ["name" => "Jozef"];
    }

  }

}
<?php

namespace Core\Controllers {

  class UserController extends \Core\Classes\DB {

    public function setLogged() {
      $_SESSION['logged'] = true;
    }

    public function setUser(array $data) {
      $_SESSION['user'] = $data;
    }

    public function destroyLogged() {
      unset($_SESSION['logged']);
    }

    public function getLogged() {
      return isset($_SESSION['logged']) ? $this->getLoggedUser() : [];
    }

    public function getLoggedUser() {
      return isset($_SESSION['user']) ? reset($_SESSION['user']) : [];
    }

    public function checkIfUserLogged(&$page) {
      if ($page == "login") {
        if (!empty($this->getLogged())) {
          $page = "profile";
        }
      }
    }

  }

}
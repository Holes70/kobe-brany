<?php

namespace Core\Controllers {

  class UserController extends \Core\Classes\DB {

    public function setUser(array $data) {
      $_SESSION['user'] = $data;
    }

    public function destroyLogged() {
      unset($_SESSION['logged']);
    }

    public function getLogged() {
      return isset($_SESSION['user']) ? $this->getLoggedUser() : [];
    }

    public function getLoggedUser() {
      return isset($_SESSION['user']) ? $_SESSION['user'] : [];
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
<?php

namespace Core\Controllers {

  class UserController extends \Core\Classes\DB {

    public static function setUser(array $data) {
      $_SESSION['user'] = $data;
    }

    public static function destroyLogged() {
      unset($_SESSION['user']);
    }

    public static function getLogged() {
      return isset($_SESSION['user']) ? self::getLoggedUser() : [];
    }

    public static function getLoggedUser() {
      return isset($_SESSION['user']) ? $_SESSION['user'] : [];
    }

    public static function checkIfUserLogged(&$page) {
      if ($page == "login") {
        if (!empty(self::getLogged())) {
          $page = "profile";
        }
      }
    }

  }

}
<?php

namespace Core\Controllers {

  class WebController extends \Core\Dia {

    public static function setMemory(string $url) {
      $_SESSION['memory'][$url] = $url;
    }

    public static function getAllMemory() {
      return isset($_SESSION['memory']) ? $_SESSION['memory'] : [];
    }

    public static function setUrlForMemory(string $url) {
      if (!isset($_SESSION['memory'][$url])) {
        self::setMemory($url);
      }

      self::setCurrentPage();
    }

    public static function setCurrentPage() {
      $_SESSION['currentPage'] = isset($_GET['webPage']) ? $_GET['webPage'] : "home";
    }

    public static function getCurrentPageSession() {
      return isset($_SESSION['currentPage']) ? $_SESSION['currentPage'] : "";
    }

    public static function getCurrentPage() {
      return isset($_GET['webPage']) ? $_GET['webPage'] : self::getCurrentPageSession();
    }

    public static function destroyMemory() {
      unset($_SESSION['memory']);
      
      self::setUrlForMemory(self::getCurrentPage());

      return self::getAllMemory();
    }

    public static function getPage() {
      global $config;

      $pageToInclude = $config['dir']['web'] . '/' . $config['web']['pages'] . '/' . self::getCurrentPage() . '.php';

      if (!is_file($pageToInclude)) {
        $pageToInclude = $config['dir']['web'] . '/' . $config['web']['includes'] . '/' . $config['web']['notfound'] . '.php';
      }

      return $pageToInclude;
    }

    public static function getJson(array $data) {
      $dataToArray = $data;

      if (self::checkParamIfExists('reset')) {
        $dataToArray = reset($data);
      }

      if (self::checkParamIfExists('unset')) {
        $dataToArray = $dataToArray[self::getParam('unset')];
      }

      if (self::checkParamIfExists('json')) {
        $dataToArray = json_decode($dataToArray);
      }

      echo json_encode($dataToArray);
    }

    public static function checkParamIfExists(string $param) {
      return isset($_GET[$param]) ? true : false;
    }

    public static function getParam(string $param) {
      return isset($_GET[$param]) ? $_GET[$param] : "";
    }

    /**
     * get all POST params
     * @return array
     */
    public static function getPostParams() {
      return isset($_POST) ? $_POST : [];
    }

    /**
     * get specific POST param
     * @return string
     */
    public static function getPostParam(string $param) {
      return isset($_POST[$param]) ? $_POST[$param] : "";
    }

    /**
     * Redirect to URL
     * @return void
     */
    public static function redirect(string $redirectUrl) {
      if ($redirectUrl == "") throw new \Exception("Empty redirectUrl");

      header("Location: {$redirectUrl}");
    }

  }

}
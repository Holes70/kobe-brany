<?php

namespace Core\Controllers {

  class WebController extends \Core\Dia {

    public function setMemory(string $url) {
      $_SESSION['memory'][$url] = $url;
    }

    public function getAllMemory() {
      return isset($_SESSION['memory']) ? $_SESSION['memory'] : [];
    }

    public function setUrlForMemory(string $url) {
      if (!isset($_SESSION['memory'][$url])) {
        $this->setMemory($url);
      }

      $this->setCurrentPage();
    }

    public function setCurrentPage() {
      $_SESSION['currentPage'] = isset($_GET['webPage']) ? $_GET['webPage'] : "home";
    }

    public function getCurrentPageSession() {
      return isset($_SESSION['currentPage']) ? $_SESSION['currentPage'] : "";
    }

    public function getCurrentPage() {
      return isset($_GET['webPage']) ? $_GET['webPage'] : $this->getCurrentPageSession();
    }

    public function destroyMemory() {
      unset($_SESSION['memory']);
      
      $this->setUrlForMemory($this->getCurrentPage());

      return $this->getAllMemory();
    }

    public function getPage() {
      $pageToInclude = $this->getWebDir() . '/' . $this->getWebPages() . '/' . $this->getCurrentPage() . '.php';

      if (!is_file($pageToInclude)) {
        $pageToInclude = $this->getWebDir() . '/' . $this->getWebIncludes() . '/' . $this->getNotFound() . '.php';
      }

      return $pageToInclude;
    }

    public function getJson(array $data) {
      $dataToArray = $data;

      if ($this->checkParamIfExists('reset')) {
        $dataToArray = reset($data);
      }

      if ($this->checkParamIfExists('unset')) {
        $dataToArray = $dataToArray[$this->getParam('unset')];
      }

      if ($this->checkParamIfExists('json')) {
        $dataToArray = json_decode($dataToArray);
      }

      echo json_encode($dataToArray);
    }

    public function checkParamIfExists(string $param) {
      return isset($_GET[$param]) ? true : false;
    }

    public function getParam(string $param) {
      return isset($_GET[$param]) ? $_GET[$param] : "";
    }

    public function getPostParams() {
      return $_POST;
    }

    public function getPostParam(string $param) {
      return isset($_POST[$param]) ? $_POST[$param] : "";
    }

    public function redirect(string $redirectUrl) {
      header("Location: {$redirectUrl}");
    }

  }

}
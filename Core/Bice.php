<?php

namespace Core {

  class Bice {

    /**
     * GET custom generated UID
     * @return string
     */
    static public function getUID() {
      return (string)rand();
    }

    static public function print_r($data) {
      $out = \print_r($data, true);
      $out = \preg_replace("#(?<!\r)\n#", PHP_EOL, $out);
      echo $out;
    }

    public static function pagination(
      int|string $currentPage = 0, 
      int|string $count = 5, 
      int|string $countTotal = 0
    ) {
      if ($currentPage == 0) {
        $currentPage = isset($_GET['page']) ? $_GET['page'] : 0;
      }

      if ($currentPage != 0 && $countTotal != 0) {
        return [
          "pages" => round($countTotal/$count),
          "offset" => (round($countTotal / $count) * $currentPage) - 1
        ];
      }
    }
    
  }

}
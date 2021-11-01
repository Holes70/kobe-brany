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
      int|string $currentPage = 1, 
      int|string $count = 10, 
      int|string $countTotal = 0
    ) {

      if ($countTotal != 0) {
        $offset = $currentPage > 1 ? $count * ($currentPage - 1) : 0;

        return [
          "pages" => ceil($countTotal / $count),
          "offset" => $offset
        ];
      }

    }
    
  }

}
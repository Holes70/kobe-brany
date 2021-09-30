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
    
  }

}
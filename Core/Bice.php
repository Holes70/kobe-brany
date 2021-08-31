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
    
  }

}
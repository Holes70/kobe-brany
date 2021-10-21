<?php
$test = $dia->vue("testParams");

foreach (\Core\Dia::$loadedWebComponents as $com) {
  var_dump($com);
}

var_dump(\Core\Dia::$loadedWebComponents);

exit();
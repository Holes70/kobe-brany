<?php

$objednavkySchvalene = new Components\TableLarge("orders");
$objednavkySchvalene->conditions([
  "where" => [
    "type" => 2
  ]
]);

$dia->template("
  {$objednavkySchvalene->show()}
")->render();

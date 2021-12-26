<?php

$objednavkyNove = new Components\TableLarge("orders");
$objednavkyNove->conditions([
  "where" => [
    "type" => 1
  ]
]);

$dia->template("
  {$objednavkyNove->show()}
")->render();

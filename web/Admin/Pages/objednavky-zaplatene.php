<?php

use Components\TableLarge;
use Components\Row;

$objednavkySchvalene = new TableLarge("orders");
$objednavkySchvalene->conditions([
  "where" => [
    "type" => 3
  ]
]);

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  {$objednavkySchvalene->show()}
")->render();

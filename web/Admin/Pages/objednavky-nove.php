<?php

use Components\TableLarge;
use Components\Row;

$objednavkyNove = new TableLarge("orders");
$objednavkyNove->conditions([
  "where" => [
    "type" => 1
  ]
]);

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  {$objednavkyNove->show()}
")->render();

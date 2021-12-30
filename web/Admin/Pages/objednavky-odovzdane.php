<?php

use Components\TableLarge;
use Components\Row;

$objednavkyOdovzdane = new TableLarge("orders");
$objednavkyOdovzdane->conditions([
  "where" => [
    "type" => 4
  ]
]);
$objednavkyOdovzdane->emptyDataMessage("Žiadne odovzdané objednávky");

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  {$objednavkyOdovzdane->show()}
")->render();

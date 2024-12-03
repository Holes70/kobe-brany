<?php

use Component\TableLarge;
use Component\Row;

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
  ".$dia->card($objednavkyOdovzdane->show())."
")->render();

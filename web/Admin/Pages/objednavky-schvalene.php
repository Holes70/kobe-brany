<?php

use Components\TableLarge;
use Components\Row;

$objednavkySchvalene = new TableLarge("orders");
$objednavkySchvalene->conditions([
  "where" => [
    "type" => 2
  ]
]);
$objednavkySchvalene->emptyDataMessage("Žiadne schválené objednávky");

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  ".$dia->card($objednavkySchvalene->show())."
")->render();

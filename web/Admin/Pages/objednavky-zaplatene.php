<?php

use Component\TableLarge;
use Component\Row;

$objednavkyZaplatene = new TableLarge("orders");
$objednavkyZaplatene->conditions([
  "where" => [
    "type" => 3
  ]
]);

$objednavkyZaplatene->emptyDataMessage("Žiadne zapaltené objednávky");

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  ".$dia->card($objednavkyZaplatene->show())."
")->render();

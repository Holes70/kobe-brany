<?php

use Components\TableLarge;
use Components\Row;

$idForm = $webController->getParam('id_form');

$objednavky = new TableLarge("orders");

if ($idForm > 0) {
  $objednavky->conditions([
    "where" => [
      "id" => $idForm
    ]
  ]);
}
$objednavky->emptyDataMessage("Žiadne objednávky");

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  ".$dia->card($objednavky->show())."
")->render();

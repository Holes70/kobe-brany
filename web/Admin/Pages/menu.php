<?php

use Components\TableLarge;
use Components\Row;

$idForm = $webController->getParam('id_form');

$menu = new TableLarge("menu");

if ($idForm > 0) {
  $objednavky->conditions([
    "where" => [
      "id" => $idForm
    ]
  ]);
}
$objednavky->emptyDataMessage("Žiadne objednávky");

$menu = new Row("orders");

$dia->template("
  {$pridat->show()}
  {$objednavky->show()}
")->render();

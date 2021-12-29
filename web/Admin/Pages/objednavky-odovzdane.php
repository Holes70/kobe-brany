<?php

use Components\TableLarge;
use Components\Row;

$objednavkySchvalene = new TableLarge("orders");
/*$objednavkySchvalene->conditions([
  "where" => [
    "id_invoice" => ""
  ]
]);*/

//TODO: Pridat ak ma id_invocie tak vypise

$pridat = new Row("orders");

$dia->template("
  {$pridat->show()}
  {$objednavkySchvalene->show()}
")->render();

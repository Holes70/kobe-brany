<?php

use Component\TableLarge;
use Component\Row;

$fakturyVystavene = new TableLarge("invoices");
$fakturyVystavene->conditions([
  "select" => "invoices.*, orders.id as id_order, orders.serial_number as serial_number",
  "where" => [
    "state" => 2
  ],
  "join" => [
    "orders" => [
      "id",
      "id_invoice"
    ]
  ]
]);
$fakturyVystavene->emptyDataMessage("Žiadne zaplatené faktúry");

$pridat = new Row("invoices");

$dia->template("
  {$pridat->show()}
  {$fakturyVystavene->show()}
")->render();

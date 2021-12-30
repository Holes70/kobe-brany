<?php

use Components\TableLarge;
use Components\Row;

$fakturyVystavene = new TableLarge("invoices");
$fakturyVystavene->conditions([
  "where" => [
    "state" => 2
  ]
]);
$fakturyVystavene->emptyDataMessage("Žiadne zaplatené faktúry");

$pridat = new Row("invoices");

$dia->template("
  {$pridat->show()}
  {$fakturyVystavene->show()}
")->render();

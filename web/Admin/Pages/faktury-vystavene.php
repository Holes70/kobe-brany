<?php

use Components\TableLarge;
use Components\Row;

$fakturyVystavene = new TableLarge("invoices");
$fakturyVystavene->conditions([
  "where" => [
    "state" => 1
  ]
]);
$fakturyVystavene->emptyDataMessage("Žiadne vystavené faktúry");

$pridat = new Row("invoices");

$dia->template("
  {$pridat->show()}
  {$fakturyVystavene->show()}
")->render();

<?php

use Component\TableLarge;
use Component\Row;

$produkty = new TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 2
  ]
]);

$pridat = new Row("products");

$dia->template("
  {$pridat->show()}
  ".$dia->card($produkty->show())."
")->render();

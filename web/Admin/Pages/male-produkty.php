<?php

use Components\TableLarge;
use Components\Row;

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
  {$produkty->show()}
")->render();

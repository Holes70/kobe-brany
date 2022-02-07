<?php

use Component\TableLarge;
use Component\Row;

$produkty = new TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 1
  ]
]);

$produkty->buttons([
  ["name" => "Príslušenstvo", "link" => "prislusenstvo", "class" => "btn btn-primary"],
  ["name" => "Galéria", "link" => "galeria", "class" => "btn btn-secondary"]
]);

$pridat = new Row("products");
$pridat->title("Produkty");

$dia->template("
  {$pridat->show()}
  ".$dia->card(
    $produkty->show()
  )."
")->render();

<?php

$produkty = new Components\TableLarge("products");

// Vyber iba produktu s typom 1 cize custom produkt
$produkty->conditions([
  'where' => [
    'type' => 1
  ]
]);

$dia->template("
  {$produkty->show()}
")->render();

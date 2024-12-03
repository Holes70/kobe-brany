<?php

$kosiky = new \Component\TableLarge("carts");
$kosiky->buttons([
  [
    "name" => "Produkty v košíku", 
    "link" => "kosiky-produkty", 
    "class" => "btn btn-secondary"
  ],
]);

$pridaj = new \Component\Row("carts");

$dia->template("
  {$pridaj->show()}
  ".$dia->card($kosiky->show())."
")->render();
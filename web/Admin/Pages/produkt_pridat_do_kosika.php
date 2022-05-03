<?php

$except = [];

$produkty = $db->dbSelect(
  "carts_products",
  [
    "where" => [
      "id_cart" => \Core\Controllers\WebController::getParam('id')
    ]
  ]
);

foreach($produkty as $produkt) {
  array_push($except, (int)$produkt['id_product']);
}

$prislusenstvo = new Component\TableLarge("products");

$prislusenstvo->emptyDataMessage("Žiadny produkt v košíku");
$prislusenstvo->fileDir("products");
$prislusenstvo->customColumns([
  [
    "id" => 1,
    "title" => "Pridať do košíka", 
    "action" => "kosik_pridaj_produkt",
    "tableName" => "carts_products",
    "params" => [
      "id_product" => "id",
      "get" => "id", 
    ],
    "except" => $except // Produkty ktore sa uz nachadazaju v prislusentsve produktu
  ]
]);


$dia->template(
  $dia->cardBook(
    $prislusenstvo->show(),
    redirectType: "id"
  )
)->render();

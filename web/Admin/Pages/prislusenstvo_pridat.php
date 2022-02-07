<?php


// Vyber produkty ktore sa uz nachdazju prislesenstve tohto produktu
$except = [];

$prislusenstvoProduktu = $db->dbSelect(
  "products_accessories",
  [
    "where" => [
      "id_product" => \Core\Controllers\WebController::getParam('id')
    ]
  ]
);

foreach($prislusenstvoProduktu as $produkt) {
  array_push($except, (int)$produkt['id_product_accessory']);
}

$prislusenstvo = new Components\TableLarge("products");

$prislusenstvo->emptyDataMessage("Žiadne príšlušenstvo pre produkt");
$prislusenstvo->conditions([
  "whereArray" => [
    ["type", "=", 2]
  ]
]);
$prislusenstvo->fileDir("products");
$prislusenstvo->customColumns([
  [
    "id" => 1,
    "title" => "Pridať do príslušenstva", 
    "action" => "prislusenstvo_pridat_action",
    "tableName" => "products_accessories",
    "params" => [
      "id_product_accessory" => "id",
      "get" => "id", 
    ],
    "except" => $except // Produkty ktore sa uz nachadazaju v prislusentsve produktu
  ]
]);


$dia->template(
  $dia->cardBook(
    html: $prislusenstvo->show(),
    redirectType: "id"
  )
)->render();

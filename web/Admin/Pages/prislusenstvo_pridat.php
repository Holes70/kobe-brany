<?php
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
    "title" => "Pridať do príslušenstva", 
    "action" => "prislusenstvo_pridat_action",
    "tableName" => "products_accessories",
    "params" => [
      "id_product_accessory" => "id",
      "get" => "id", 
    ],
    "except" => [6] // Produkty ktore sa uz nachadazaju v prislusentsve produktu
  ]
]);


$dia->template(
  $dia->cardBook(
    $prislusenstvo->show()
  )
)->render();

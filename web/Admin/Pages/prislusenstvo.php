<?php

$idProduct = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$prislusenstvo = new Components\TableLarge("products_accessories");
$prislusenstvo->emptyDataMessage("Žiadne príšlušenstvo pre produkt");
$prislusenstvo->conditions([
  "select" => "products.*",
  "where" => [
    "id_product" => $idProduct
  ],
  "join" => [
    "products" => [
      "id_product_accessory",
      "id"
    ]
  ]
]);

$prislusenstvo->buttons([
  ["name" => "Odstrániť z príslušenstva", "ajaxAction" => "todo"]
]);

$dia->template(
  $dia->cardBook(
    $prislusenstvo->show()
  )
)->render();

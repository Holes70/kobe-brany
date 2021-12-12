<?php

$prislusenstvo = new Components\Table("products_accessories");

$idProduct = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$prislusenstvo->conditions([
  "where" => [
    "id_product" => $idProduct
  ],
  "join" => [
    "products" => [
      "id_product",
      "id"
    ]
  ]
]);

$dia->template("
  {$prislusenstvo->show()}
")->render();

<?php

use Component\TableLarge;

$idCart = $_GET['idcart'];

$carts = new TableLarge("carts_products");
$carts->conditions([
  "select" => "products.*",
  "join" => [
    "products" => [
      "id_product",
      "id"
    ]
  ],
  "where" => [
    "carts_products.id_cart" => $idCart 
  ],
  "order_by" => "products.id desc"
]);
$carts->fileDir("products");

$dia->template("
  ".$dia->card(
    $carts->show()
  )."
")->render();

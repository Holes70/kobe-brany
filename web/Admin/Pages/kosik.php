<?php

$kosikId = isset($_GET['id']) ? $_GET['id'] : '';

$kosikData = $db->dbSelect(
  tableName: "carts_products",
  conditions: [
    "where" => [
      "id_cart" => $kosikId
    ]
  ]
);

$tableKosik = new \Components\Table("carts_products");
$tableKosik->data($kosikData);
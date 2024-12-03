<?php

global $db;

$data = $db->request_data();

$idOrder = (int)$data->params->data->id_order;

$cart = $db->dbSelect(
  "orders",
  [
    "select" => "carts.*",
    "join" => [
      "carts" => [
        "id_cart",
        "id"
      ]
    ],
    "where" => [
      "orders.id" => $idOrder
    ],
    "order_by" => "carts.id"
  ]
);

$cart = reset($cart);

$totalPrice = $db->dbSelect(
  "carts_products",
  [
    "select" => "SUM(products.price) as totalPrice",
    "join" => [
      "products" => [
        "id_product",
        "id"
      ]
    ],
    "where" => [
      "carts_products.id_cart" => $cart['id']
    ],
    "order_by" => "carts_products.id"
  ]
);

$totalPrice = reset($totalPrice);


$insertedId = $db->insert_array([
    "table" => "invoices",
    "table_data" => [
      "number" => (int)$data->params->data->number,
      "price" => (float)$totalPrice['totalPrice'],
      "state" => 1
    ]
  ]
);

$db->update(
  "orders",
  $idOrder,
  [
    "id_invoice" => $insertedId
  ]
);

echo 1;

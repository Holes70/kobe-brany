<?php
$orders_types = $db->dbSelect(
  tableName: "orders",
  conditions: [
    "select" => "
      order_type.name,
      CASE
        WHEN orders.id_type = 1 THEN 'xx'
        ELSE 'j'
      END as lol,
      COUNT(orders.id_product) as pocet
    ",
    "join" => [
      "order_type" => [
        "id_type",
        "id"
      ]
    ],
    "group_by" => "order_type.name, lol"
  ]
);
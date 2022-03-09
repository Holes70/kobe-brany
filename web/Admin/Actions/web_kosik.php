<?php

  global $db;

  try {
    $return['data'] = $db->dbSelect(
      "carts_products",
      [
        "select" => "products.*",
        "join" => [
          "products" => [
            "id_product",
            "id"
          ]
        ],
        "where" => [
          "carts_products.id_cart" => 1
        ]
      ]
    );

    $return['spoluBezDph'] = 0;
    $return['spolu'] = 0;

    foreach ($return['data'] as $item) {
      $return['spoluBezDph'] += $item['price_without_vat'];
      $return['spolu'] += $item['price'];
    }

    \Core\Controllers\WebController::getJson($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
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

    \Core\Controllers\WebController::getJson($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
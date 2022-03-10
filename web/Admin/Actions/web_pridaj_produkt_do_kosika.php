<?php

  global $db;

  $data = $db->request_data();
  
  $idProduct = (int)$data->idProduct;

  try {
    $return['data'] = $db->insert_array([
      'table' => "carts_products",
      'table_data' => [
        "id_cart" => 1,
        "id_product" => $idProduct
      ]
    ]);

    \Core\Controllers\WebController::getJson($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
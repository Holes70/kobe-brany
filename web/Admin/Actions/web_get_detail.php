<?php

  global $db;

  $idProdukt = (int)\Core\Controllers\WebController::getParam('id');

  try {
    $data = $db->dbSelect(
      "products",
      [
        "where" => [
          "id" => $idProdukt
        ]
      ]
    );
    $return['data'] = reset($data);

    \Core\Controllers\WebController::getJson($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
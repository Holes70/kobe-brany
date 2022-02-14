<?php

  global $db;

  $data = $db->request_data();

  try {
    $return['data'] = $db->dbSelect(
      $data->tableName,
      [
        "where" => [
          "id" => $data->data->id_answer
        ]
      ]
    );

    $return['data'] = $return['data'][0];
    \Core\Controllers\WebController::getJson($return);
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
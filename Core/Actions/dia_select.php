<?php

  global $db, $webController;

  $data = $db->request_data();

  try {
    $webController->getJson($db->dbSelect(
      $data->params->tableName,
      (array)$data->params->conditions
    ));
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
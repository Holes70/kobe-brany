<?php

  global $db;

  $data = $db->request_data();

  try {
    echo json_encode($db->dbSelect(
      $data->params->table_name,
      (array)$data->params->conditions
    ));
  } catch(\Exception $e) {
    echo json_encode([
      "status" => "fail",
      "message" => $e->getMessage()
    ]);
  }

?>
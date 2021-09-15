<?php

  global $db;

  $data = $db->request_data();

  echo json_encode(
    $db->dbSelect(
      $data->params->table_name,
      (array)$data->params->conditions
    ) 
  );

?>
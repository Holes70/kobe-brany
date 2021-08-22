<?php

  global $db;

  $data = $db->request_data();

  $db->insert_array([
    'table' => $data->table_name,
    'table_data' => (array) $data->data
  ]);

?>
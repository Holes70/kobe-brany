<?php

  global $db;

  $data = json_decode(file_get_contents("php://input"));

  $res = $db->select('stock', [
    'where' => "id_product = {$data->id}",
    "limit" => 1,
  ]);

  if ($res == NULL) {
    $db->insert([
      'table' => 'stock',
      'redirect' => 'admin',
      'vue' => TRUE,
      'vue_columns' => ['id_product', 'count', 'available', 'sale', 'sale_prize'],
      'vue_values' => [$data->id, $data->item, 1, 1, 100,]
    ]);
  } else {
    $db->update([
      'table' => 'stock',
      'redirect' => 'admin',
      'update' => "count = {$data->item}",
      'where' => "id_product = {$data->id}",
    ]);
  }
  
?>
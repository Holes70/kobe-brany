<?php

  global $db;

  $data = json_decode(file_get_contents("php://input"));

  $db->update([
    'table' => 'stock',
    'redirect' => 'admin',
    'update' => "sale = {$data->sale}",
    'where' => "id_product = {$data->id}",
  ]);

?>
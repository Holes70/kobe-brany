<?php

global $db;

require ("{$this->rootDir}/Core/Actions/dia_upload_image.php");

$db->insert_array([
  'table' => 'gallery',
  'table_data' => [
    'image' => $_FILES['name']
  ]
]);

$db->insert_array([
  'table' => 'products_gallery',
  'table_data' => [
    'id_product' => 1,
    'id_product_gallery' => 1
  ]
]);

/*$data = $db->request_data();

$db->insert_array([
  'table' => $data->tableName,
  'table_data' => (array) $data->data
]);*/
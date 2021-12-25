<?php

global $db;

require ("{$this->rootDir}/Core/Actions/dia_upload_image.php");

$idGallery = $db->insert_array([
  'table' => 'gallery',
  'table_data' => [
    'image' => $_FILES['file']['name']
  ]
]);

$db->insert_array([
  'table' => 'products_gallery',
  'table_data' => [
    'id_product' => 1,
    'id_gallery' => $idGallery
  ]
]);

$redirect = $webController->getPostParam("redirect");

header ("Location: {$redirect}");
exit();
<?php

global $db, $webController;

$uploadToDir = "products";
$colNameFile = array_key_first($_FILES);

require ("{$this->rootDir}/Core/Actions/dia_upload_image.php");

$idGallery = $db->insert_array([
  'table' => 'gallery',
  'table_data' => [
    'image' => $_FILES[$colNameFile]['name']
  ]
]);

$db->insert_array([
  'table' => 'products_gallery',
  'table_data' => [
    'id_product' => $webController->getPostParam('id'),
    'id_gallery' => $idGallery
  ]
]);

$redirect = $webController->getPostParam("redirect");

header ("Location: {$redirect}");
exit();
<?php

global $db, $webController;

$uploadToDir = "products";
$colNameFile = array_key_first($_FILES);

require ("{$this->config['core']}/Actions/dia_upload_image.php");

$idGallery = $db->insert_array([
  'table' => 'gallery',
  'table_data' => [
    'image' => $_FILES[$colNameFile]['name']
  ]
]);

$db->insert_array([
  'table' => 'products_gallery',
  'table_data' => [
    'id_product' => \Core\Controllers\WebController::getPostParam('id'),
    'id_gallery' => $idGallery
  ]
]);

$redirect = \Core\Controllers\WebController::getPostParam("redirect");

header ("Location: {$redirect}");
exit();
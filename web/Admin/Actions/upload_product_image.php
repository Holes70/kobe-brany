<?php

global $db, $webController;

$uploadToDir = "products";
$colNameFile = array_key_first($_FILES);

require ("{$this->config['core']}/Actions/dia_upload_image.php");

$db->update(
  "products",
  rowId: (int)\Core\Controllers\WebController::getPostParam("id"),
  data: ['image' => $_FILES[$colNameFile]['name']]
);

$redirect = \Core\Controllers\WebController::getPostParam("redirect");

header ("Location: {$redirect}");
exit();

<?php

global $db, $webController;

$uploadToDir = "products";
$colNameFile = array_key_first($_FILES);

require ("{$this->rootDir}/Core/Actions/dia_upload_image.php");

$db->update(
  tableName: "products",
  rowId: (int)$webController->getPostParam("id"),
  data: ['image' => $_FILES[$colNameFile]['name']]
);

$redirect = $webController->getPostParam("redirect");

header ("Location: {$redirect}");
exit();

<?php

  global $db, $webController, $dia;

  $data = $webController->getPostParams();
  $tableName = array_pop($data);

  if (!empty($_FILES)) {
    $colNameFile = array_key_first($_FILES);
    $uploadToDir = $tableName;
    $data[$colNameFile] = $_FILES[$colNameFile]['name'];
    require ("{$this->rootDir}/Core/Actions/dia_upload_image.php");
  }

  /** 
   * INSERT request 
   * tableName
   * table_data
   * @return void
  */
  $db->insert_array([
    'table' => $tableName,
    'table_data' => $data
  ]);

  $webController->redirect(
    $dia->convertTableNameToUrl($tableName) 
    . "?id_form=". 
    $db->getLastItemId($tableName)['id']
  );

?>
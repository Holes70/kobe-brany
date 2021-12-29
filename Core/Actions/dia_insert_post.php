<?php

  global $db, $webController, $dia;

  $data = $webController->getPostParams();
  $tableName = array_pop($data);

  if (!empty($_FILES)) {
    $uploadToDir = $tableName;
    $data['image'] = $_FILES['file']['name'];
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
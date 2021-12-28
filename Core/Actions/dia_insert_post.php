<?php

  global $db, $webController;

  $data = $webController->getPostParams();
  $tableName = array_pop($data);

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

?>
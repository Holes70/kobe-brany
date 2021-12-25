<?php

  global $db, $webController;

  $tableName = $webController->getParam("table_name");

  // If is $id defined in custom action
  $id = isset($id) ? $id : $webController->getParam("id");

  /** 
   * DELETE request 
   * tableName
   * itemID
   * @return TRUE
  */
  $db->delete(
    $tableName, 
    ['id' => $id]
  );

?>
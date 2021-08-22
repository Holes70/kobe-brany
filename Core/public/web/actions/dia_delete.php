<?php

  global $db, $dia;

  $data = json_decode(file_get_contents("php://input"));

  /** 
   * DELETE request 
   * tableName
   * itemID
   * @return TRUE
  */
  $db->delete(
    $data->params->table_name, 
    ['id' => $data->params->id]
  );

?>
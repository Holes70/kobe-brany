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
    $data->table_name, 
    ['id' => $data->id]
  );

?>
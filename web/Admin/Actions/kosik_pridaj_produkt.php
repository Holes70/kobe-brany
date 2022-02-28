<?php

  global $db;

  $data = $db->request_data();

  /** 
   * INSERT request 
   * tableName
   * table_data
   * @return void
  */
  $db->insert_array([
    'table' => $data->tableName,
    'table_data' => [
      "id_cart" => $data->data->id,
      "id_product" => $data->data->id_product
    ]
  ]);

   /** 
   * GET inserted item ID 
   * tableName
   * @return int
  */
  echo json_encode($db->getLastItemId($data->tableName));

?>
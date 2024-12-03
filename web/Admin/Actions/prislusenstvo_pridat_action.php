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
      "id_product" => $data->data->id,
      "id_product_accessory" => $data->data->id_product_accessory
    ]
  ]);

   /** 
   * GET inserted item ID 
   * tableName
   * @return int
  */
  echo json_encode($db->getLastItemId($data->tableName));

?>
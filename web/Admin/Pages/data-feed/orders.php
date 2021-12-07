<?php

$i = 0;

for ($i=1;$i<=15;$i++) {
  $db->insert_array([
    'table' => 'orders',
    'table_data' => [
      'id' => null, 
      'serial_number' => 1000 + $i, 
      'count' => rand(1, 5),
      'id_type' => rand(1, 5),
      'id_customer_uid' => rand(1, 5), 
      'id_cart' =>  rand(1, 5), 
      'id_invoice' => 0
    ]
  ]);
}
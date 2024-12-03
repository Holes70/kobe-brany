<?php

$i = 0;

for ($i=1;$i<100;$i++) {
  $db->insert_array([
    'table' => 'orders',
    'table_data' => [
      'id' => null, 
      'serial_number' => 1000 + $i, 
      'type' => rand(1, 3),
      'id_customer_uid' => rand(1, 5), 
      'id_cart' =>  rand(1, 5), 
      'id_invoice' => null
    ]
  ]);
}
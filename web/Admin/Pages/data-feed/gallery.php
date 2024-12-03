<?php

$i = 0;

for ($i=1;$i<100;$i++) {
  $db->insert_array([
    'table' => 'gallery',
    'table_data' => [
      'id' => null, 
      'image' => 'product_' . rand(1,3) . '.png'
    ]
  ]);
}
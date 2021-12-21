<?php

$i = 0;

for ($i=1;$i<100;$i++) {
  $db->insert_array([
    'table' => 'products_gallery',
    'table_data' => [
      'id' => null, 
      'id_gallery' => rand(1,99),
      'id_product' => rand(1,50)
    ]
  ]);
}
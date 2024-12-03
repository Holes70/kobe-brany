<?php

for ($i=1;$i<=100;$i++) {
  $db->insert_array([
    'table' => 'products_accessories',
    'table_data' => [
      'id' => $i,
      'id_product' => rand(1, 30),
      'id_product_accessory' => rand(1, 99)
    ]
  ]);
}